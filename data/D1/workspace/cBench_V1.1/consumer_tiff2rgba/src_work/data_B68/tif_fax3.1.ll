; ModuleID = 'tif_fax3.ll'
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

@TIFFFaxWhiteCodes = constant [109 x %struct.tableentry] [%struct.tableentry { i16 8, i16 53, i16 0 }, %struct.tableentry { i16 6, i16 7, i16 1 }, %struct.tableentry { i16 4, i16 7, i16 2 }, %struct.tableentry { i16 4, i16 8, i16 3 }, %struct.tableentry { i16 4, i16 11, i16 4 }, %struct.tableentry { i16 4, i16 12, i16 5 }, %struct.tableentry { i16 4, i16 14, i16 6 }, %struct.tableentry { i16 4, i16 15, i16 7 }, %struct.tableentry { i16 5, i16 19, i16 8 }, %struct.tableentry { i16 5, i16 20, i16 9 }, %struct.tableentry { i16 5, i16 7, i16 10 }, %struct.tableentry { i16 5, i16 8, i16 11 }, %struct.tableentry { i16 6, i16 8, i16 12 }, %struct.tableentry { i16 6, i16 3, i16 13 }, %struct.tableentry { i16 6, i16 52, i16 14 }, %struct.tableentry { i16 6, i16 53, i16 15 }, %struct.tableentry { i16 6, i16 42, i16 16 }, %struct.tableentry { i16 6, i16 43, i16 17 }, %struct.tableentry { i16 7, i16 39, i16 18 }, %struct.tableentry { i16 7, i16 12, i16 19 }, %struct.tableentry { i16 7, i16 8, i16 20 }, %struct.tableentry { i16 7, i16 23, i16 21 }, %struct.tableentry { i16 7, i16 3, i16 22 }, %struct.tableentry { i16 7, i16 4, i16 23 }, %struct.tableentry { i16 7, i16 40, i16 24 }, %struct.tableentry { i16 7, i16 43, i16 25 }, %struct.tableentry { i16 7, i16 19, i16 26 }, %struct.tableentry { i16 7, i16 36, i16 27 }, %struct.tableentry { i16 7, i16 24, i16 28 }, %struct.tableentry { i16 8, i16 2, i16 29 }, %struct.tableentry { i16 8, i16 3, i16 30 }, %struct.tableentry { i16 8, i16 26, i16 31 }, %struct.tableentry { i16 8, i16 27, i16 32 }, %struct.tableentry { i16 8, i16 18, i16 33 }, %struct.tableentry { i16 8, i16 19, i16 34 }, %struct.tableentry { i16 8, i16 20, i16 35 }, %struct.tableentry { i16 8, i16 21, i16 36 }, %struct.tableentry { i16 8, i16 22, i16 37 }, %struct.tableentry { i16 8, i16 23, i16 38 }, %struct.tableentry { i16 8, i16 40, i16 39 }, %struct.tableentry { i16 8, i16 41, i16 40 }, %struct.tableentry { i16 8, i16 42, i16 41 }, %struct.tableentry { i16 8, i16 43, i16 42 }, %struct.tableentry { i16 8, i16 44, i16 43 }, %struct.tableentry { i16 8, i16 45, i16 44 }, %struct.tableentry { i16 8, i16 4, i16 45 }, %struct.tableentry { i16 8, i16 5, i16 46 }, %struct.tableentry { i16 8, i16 10, i16 47 }, %struct.tableentry { i16 8, i16 11, i16 48 }, %struct.tableentry { i16 8, i16 82, i16 49 }, %struct.tableentry { i16 8, i16 83, i16 50 }, %struct.tableentry { i16 8, i16 84, i16 51 }, %struct.tableentry { i16 8, i16 85, i16 52 }, %struct.tableentry { i16 8, i16 36, i16 53 }, %struct.tableentry { i16 8, i16 37, i16 54 }, %struct.tableentry { i16 8, i16 88, i16 55 }, %struct.tableentry { i16 8, i16 89, i16 56 }, %struct.tableentry { i16 8, i16 90, i16 57 }, %struct.tableentry { i16 8, i16 91, i16 58 }, %struct.tableentry { i16 8, i16 74, i16 59 }, %struct.tableentry { i16 8, i16 75, i16 60 }, %struct.tableentry { i16 8, i16 50, i16 61 }, %struct.tableentry { i16 8, i16 51, i16 62 }, %struct.tableentry { i16 8, i16 52, i16 63 }, %struct.tableentry { i16 5, i16 27, i16 64 }, %struct.tableentry { i16 5, i16 18, i16 128 }, %struct.tableentry { i16 6, i16 23, i16 192 }, %struct.tableentry { i16 7, i16 55, i16 256 }, %struct.tableentry { i16 8, i16 54, i16 320 }, %struct.tableentry { i16 8, i16 55, i16 384 }, %struct.tableentry { i16 8, i16 100, i16 448 }, %struct.tableentry { i16 8, i16 101, i16 512 }, %struct.tableentry { i16 8, i16 104, i16 576 }, %struct.tableentry { i16 8, i16 103, i16 640 }, %struct.tableentry { i16 9, i16 204, i16 704 }, %struct.tableentry { i16 9, i16 205, i16 768 }, %struct.tableentry { i16 9, i16 210, i16 832 }, %struct.tableentry { i16 9, i16 211, i16 896 }, %struct.tableentry { i16 9, i16 212, i16 960 }, %struct.tableentry { i16 9, i16 213, i16 1024 }, %struct.tableentry { i16 9, i16 214, i16 1088 }, %struct.tableentry { i16 9, i16 215, i16 1152 }, %struct.tableentry { i16 9, i16 216, i16 1216 }, %struct.tableentry { i16 9, i16 217, i16 1280 }, %struct.tableentry { i16 9, i16 218, i16 1344 }, %struct.tableentry { i16 9, i16 219, i16 1408 }, %struct.tableentry { i16 9, i16 152, i16 1472 }, %struct.tableentry { i16 9, i16 153, i16 1536 }, %struct.tableentry { i16 9, i16 154, i16 1600 }, %struct.tableentry { i16 6, i16 24, i16 1664 }, %struct.tableentry { i16 9, i16 155, i16 1728 }, %struct.tableentry { i16 11, i16 8, i16 1792 }, %struct.tableentry { i16 11, i16 12, i16 1856 }, %struct.tableentry { i16 11, i16 13, i16 1920 }, %struct.tableentry { i16 12, i16 18, i16 1984 }, %struct.tableentry { i16 12, i16 19, i16 2048 }, %struct.tableentry { i16 12, i16 20, i16 2112 }, %struct.tableentry { i16 12, i16 21, i16 2176 }, %struct.tableentry { i16 12, i16 22, i16 2240 }, %struct.tableentry { i16 12, i16 23, i16 2304 }, %struct.tableentry { i16 12, i16 28, i16 2368 }, %struct.tableentry { i16 12, i16 29, i16 2432 }, %struct.tableentry { i16 12, i16 30, i16 2496 }, %struct.tableentry { i16 12, i16 31, i16 2560 }, %struct.tableentry { i16 12, i16 1, i16 -1 }, %struct.tableentry { i16 9, i16 1, i16 -2 }, %struct.tableentry { i16 10, i16 1, i16 -2 }, %struct.tableentry { i16 11, i16 1, i16 -2 }, %struct.tableentry { i16 12, i16 0, i16 -2 }], align 16
@TIFFFaxBlackCodes = constant [109 x %struct.tableentry] [%struct.tableentry { i16 10, i16 55, i16 0 }, %struct.tableentry { i16 3, i16 2, i16 1 }, %struct.tableentry { i16 2, i16 3, i16 2 }, %struct.tableentry { i16 2, i16 2, i16 3 }, %struct.tableentry { i16 3, i16 3, i16 4 }, %struct.tableentry { i16 4, i16 3, i16 5 }, %struct.tableentry { i16 4, i16 2, i16 6 }, %struct.tableentry { i16 5, i16 3, i16 7 }, %struct.tableentry { i16 6, i16 5, i16 8 }, %struct.tableentry { i16 6, i16 4, i16 9 }, %struct.tableentry { i16 7, i16 4, i16 10 }, %struct.tableentry { i16 7, i16 5, i16 11 }, %struct.tableentry { i16 7, i16 7, i16 12 }, %struct.tableentry { i16 8, i16 4, i16 13 }, %struct.tableentry { i16 8, i16 7, i16 14 }, %struct.tableentry { i16 9, i16 24, i16 15 }, %struct.tableentry { i16 10, i16 23, i16 16 }, %struct.tableentry { i16 10, i16 24, i16 17 }, %struct.tableentry { i16 10, i16 8, i16 18 }, %struct.tableentry { i16 11, i16 103, i16 19 }, %struct.tableentry { i16 11, i16 104, i16 20 }, %struct.tableentry { i16 11, i16 108, i16 21 }, %struct.tableentry { i16 11, i16 55, i16 22 }, %struct.tableentry { i16 11, i16 40, i16 23 }, %struct.tableentry { i16 11, i16 23, i16 24 }, %struct.tableentry { i16 11, i16 24, i16 25 }, %struct.tableentry { i16 12, i16 202, i16 26 }, %struct.tableentry { i16 12, i16 203, i16 27 }, %struct.tableentry { i16 12, i16 204, i16 28 }, %struct.tableentry { i16 12, i16 205, i16 29 }, %struct.tableentry { i16 12, i16 104, i16 30 }, %struct.tableentry { i16 12, i16 105, i16 31 }, %struct.tableentry { i16 12, i16 106, i16 32 }, %struct.tableentry { i16 12, i16 107, i16 33 }, %struct.tableentry { i16 12, i16 210, i16 34 }, %struct.tableentry { i16 12, i16 211, i16 35 }, %struct.tableentry { i16 12, i16 212, i16 36 }, %struct.tableentry { i16 12, i16 213, i16 37 }, %struct.tableentry { i16 12, i16 214, i16 38 }, %struct.tableentry { i16 12, i16 215, i16 39 }, %struct.tableentry { i16 12, i16 108, i16 40 }, %struct.tableentry { i16 12, i16 109, i16 41 }, %struct.tableentry { i16 12, i16 218, i16 42 }, %struct.tableentry { i16 12, i16 219, i16 43 }, %struct.tableentry { i16 12, i16 84, i16 44 }, %struct.tableentry { i16 12, i16 85, i16 45 }, %struct.tableentry { i16 12, i16 86, i16 46 }, %struct.tableentry { i16 12, i16 87, i16 47 }, %struct.tableentry { i16 12, i16 100, i16 48 }, %struct.tableentry { i16 12, i16 101, i16 49 }, %struct.tableentry { i16 12, i16 82, i16 50 }, %struct.tableentry { i16 12, i16 83, i16 51 }, %struct.tableentry { i16 12, i16 36, i16 52 }, %struct.tableentry { i16 12, i16 55, i16 53 }, %struct.tableentry { i16 12, i16 56, i16 54 }, %struct.tableentry { i16 12, i16 39, i16 55 }, %struct.tableentry { i16 12, i16 40, i16 56 }, %struct.tableentry { i16 12, i16 88, i16 57 }, %struct.tableentry { i16 12, i16 89, i16 58 }, %struct.tableentry { i16 12, i16 43, i16 59 }, %struct.tableentry { i16 12, i16 44, i16 60 }, %struct.tableentry { i16 12, i16 90, i16 61 }, %struct.tableentry { i16 12, i16 102, i16 62 }, %struct.tableentry { i16 12, i16 103, i16 63 }, %struct.tableentry { i16 10, i16 15, i16 64 }, %struct.tableentry { i16 12, i16 200, i16 128 }, %struct.tableentry { i16 12, i16 201, i16 192 }, %struct.tableentry { i16 12, i16 91, i16 256 }, %struct.tableentry { i16 12, i16 51, i16 320 }, %struct.tableentry { i16 12, i16 52, i16 384 }, %struct.tableentry { i16 12, i16 53, i16 448 }, %struct.tableentry { i16 13, i16 108, i16 512 }, %struct.tableentry { i16 13, i16 109, i16 576 }, %struct.tableentry { i16 13, i16 74, i16 640 }, %struct.tableentry { i16 13, i16 75, i16 704 }, %struct.tableentry { i16 13, i16 76, i16 768 }, %struct.tableentry { i16 13, i16 77, i16 832 }, %struct.tableentry { i16 13, i16 114, i16 896 }, %struct.tableentry { i16 13, i16 115, i16 960 }, %struct.tableentry { i16 13, i16 116, i16 1024 }, %struct.tableentry { i16 13, i16 117, i16 1088 }, %struct.tableentry { i16 13, i16 118, i16 1152 }, %struct.tableentry { i16 13, i16 119, i16 1216 }, %struct.tableentry { i16 13, i16 82, i16 1280 }, %struct.tableentry { i16 13, i16 83, i16 1344 }, %struct.tableentry { i16 13, i16 84, i16 1408 }, %struct.tableentry { i16 13, i16 85, i16 1472 }, %struct.tableentry { i16 13, i16 90, i16 1536 }, %struct.tableentry { i16 13, i16 91, i16 1600 }, %struct.tableentry { i16 13, i16 100, i16 1664 }, %struct.tableentry { i16 13, i16 101, i16 1728 }, %struct.tableentry { i16 11, i16 8, i16 1792 }, %struct.tableentry { i16 11, i16 12, i16 1856 }, %struct.tableentry { i16 11, i16 13, i16 1920 }, %struct.tableentry { i16 12, i16 18, i16 1984 }, %struct.tableentry { i16 12, i16 19, i16 2048 }, %struct.tableentry { i16 12, i16 20, i16 2112 }, %struct.tableentry { i16 12, i16 21, i16 2176 }, %struct.tableentry { i16 12, i16 22, i16 2240 }, %struct.tableentry { i16 12, i16 23, i16 2304 }, %struct.tableentry { i16 12, i16 28, i16 2368 }, %struct.tableentry { i16 12, i16 29, i16 2432 }, %struct.tableentry { i16 12, i16 30, i16 2496 }, %struct.tableentry { i16 12, i16 31, i16 2560 }, %struct.tableentry { i16 12, i16 1, i16 -1 }, %struct.tableentry { i16 9, i16 1, i16 -2 }, %struct.tableentry { i16 10, i16 1, i16 -2 }, %struct.tableentry { i16 11, i16 1, i16 -2 }, %struct.tableentry { i16 12, i16 0, i16 -2 }], align 16
@_TIFFFax3fillruns._fillmasks = internal unnamed_addr constant [9 x i8] c"\00\80\C0\E0\F0\F8\FC\FE\FF", align 1
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
@_msbmask = internal unnamed_addr constant [9 x i32] [i32 0, i32 1, i32 3, i32 7, i32 15, i32 31, i32 63, i32 127, i32 255], align 16
@zeroruns = internal unnamed_addr constant [256 x i8] c"\08\07\06\06\05\05\05\05\04\04\04\04\04\04\04\04\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.41 = private unnamed_addr constant [27 x i8] c"te->runlen == 64*(span>>6)\00", align 1
@__PRETTY_FUNCTION__.putspan = private unnamed_addr constant [48 x i8] c"void putspan(TIFF *, int32, const tableentry *)\00", align 1
@oneruns = internal unnamed_addr constant [256 x i8] c"\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\04\04\04\04\04\04\04\04\05\05\05\05\06\06\07\08", align 16
@vcodes = internal unnamed_addr constant [7 x %struct.tableentry] [%struct.tableentry { i16 7, i16 3, i16 0 }, %struct.tableentry { i16 6, i16 3, i16 0 }, %struct.tableentry { i16 3, i16 3, i16 0 }, %struct.tableentry { i16 1, i16 1, i16 0 }, %struct.tableentry { i16 3, i16 2, i16 0 }, %struct.tableentry { i16 6, i16 2, i16 0 }, %struct.tableentry { i16 7, i16 2, i16 0 }], align 16
@.str.42 = private unnamed_addr constant [14 x i8] c"Group3Options\00", align 1
@.str.43 = private unnamed_addr constant [14 x i8] c"Group4Options\00", align 1
@Fax4Decode.module = internal constant [11 x i8] c"Fax4Decode\00", align 1
@Fax3DecodeRLE.module = internal constant [14 x i8] c"Fax3DecodeRLE\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFFax3fillruns(i8*, i32*, i32*, i32) #0 {
  %5 = ptrtoint i32* %2 to i64
  %6 = ptrtoint i32* %1 to i64
  %7 = sub i64 %5, %6
  %8 = and i64 %7, 4
  %9 = icmp eq i64 %8, 0
  br i1 %9, label %12, label %10

; <label>:10:                                     ; preds = %4
  %11 = getelementptr inbounds i32, i32* %2, i64 1
  store i32 0, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %4, %10
  %.02 = phi i32* [ %11, %10 ], [ %2, %4 ]
  %13 = icmp ugt i32* %.02, %1
  br i1 %13, label %.lr.ph49.preheader, label %._crit_edge50

.lr.ph49.preheader:                               ; preds = %12
  br label %.lr.ph49

.lr.ph49:                                         ; preds = %.lr.ph49.preheader, %176
  %.0146 = phi i32* [ %177, %176 ], [ %1, %.lr.ph49.preheader ]
  %.0745 = phi i32 [ %.29, %176 ], [ 0, %.lr.ph49.preheader ]
  %14 = load i32, i32* %.0146, align 4
  %15 = add i32 %14, %.0745
  %16 = icmp ugt i32 %15, %3
  %17 = sub i32 %3, %.0745
  %18 = and i32 %17, 65535
  br i1 %16, label %19, label %20

; <label>:19:                                     ; preds = %.lr.ph49
  store i32 %18, i32* %.0146, align 4
  br label %20

; <label>:20:                                     ; preds = %19, %.lr.ph49
  %.010 = phi i32 [ %18, %19 ], [ %14, %.lr.ph49 ]
  %21 = icmp eq i32 %.010, 0
  br i1 %21, label %95, label %22

; <label>:22:                                     ; preds = %20
  %23 = lshr i32 %.0745, 3
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds i8, i8* %0, i64 %24
  %26 = and i32 %.0745, 7
  %27 = sub nsw i32 8, %26
  %28 = icmp ugt i32 %.010, %27
  br i1 %28, label %29, label %81

; <label>:29:                                     ; preds = %22
  %30 = icmp eq i32 %26, 0
  br i1 %30, label %40, label %31

; <label>:31:                                     ; preds = %29
  %32 = shl i32 255, %27
  %33 = getelementptr inbounds i8, i8* %25, i64 1
  %34 = load i8, i8* %25, align 1
  %35 = zext i8 %34 to i32
  %36 = and i32 %35, %32
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %25, align 1
  %38 = or i32 %.0745, -8
  %39 = add i32 %.010, %38
  br label %40

; <label>:40:                                     ; preds = %29, %31
  %.111 = phi i32 [ %39, %31 ], [ %.010, %29 ]
  %.05 = phi i8* [ %33, %31 ], [ %25, %29 ]
  %41 = lshr i32 %.111, 3
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %79, label %43

; <label>:43:                                     ; preds = %40
  %44 = icmp ugt i32 %.111, 127
  br i1 %44, label %.preheader32, label %61

.preheader32:                                     ; preds = %43
  %45 = ptrtoint i8* %.05 to i64
  %46 = and i64 %45, 7
  %47 = icmp eq i64 %46, 0
  br i1 %47, label %.loopexit62, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader32
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.1636 = phi i8* [ %48, %.lr.ph ], [ %.05, %.lr.ph.preheader ]
  %.01635 = phi i32 [ %49, %.lr.ph ], [ %41, %.lr.ph.preheader ]
  store i8 0, i8* %.1636, align 1
  %48 = getelementptr inbounds i8, i8* %.1636, i64 1
  %49 = add nsw i32 %.01635, -1
  %50 = ptrtoint i8* %48 to i64
  %51 = and i64 %50, 7
  %52 = icmp ne i64 %51, 0
  %not.31 = icmp ne i32 %49, 0
  %53 = and i1 %not.31, %52
  br i1 %53, label %.lr.ph, label %.loopexit62.loopexit

.loopexit62.loopexit:                             ; preds = %.lr.ph
  br label %.loopexit62

.loopexit62:                                      ; preds = %.loopexit62.loopexit, %.preheader32
  %.016.lcssa = phi i32 [ %41, %.preheader32 ], [ %49, %.loopexit62.loopexit ]
  %.16.lcssa = phi i8* [ %.05, %.preheader32 ], [ %48, %.loopexit62.loopexit ]
  %54 = ashr i32 %.016.lcssa, 3
  %55 = add nsw i32 %54, -1
  %56 = zext i32 %55 to i64
  %57 = shl nuw nsw i64 %56, 3
  %58 = add nuw nsw i64 %57, 8
  call void @llvm.memset.p0i8.i64(i8* %.16.lcssa, i8 0, i64 %58, i32 8, i1 false)
  %scevgep = getelementptr i8, i8* %.16.lcssa, i64 8
  %scevgep57 = getelementptr i8, i8* %scevgep, i64 %57
  %59 = shl nsw i32 %54, 3
  %60 = sub i32 %.016.lcssa, %59
  br label %61

; <label>:61:                                     ; preds = %.loopexit62, %43
  %.117 = phi i32 [ %60, %.loopexit62 ], [ %41, %43 ]
  %.2 = phi i8* [ %scevgep57, %.loopexit62 ], [ %.05, %43 ]
  switch i32 %.117, label %77 [
    i32 7, label %62
    i32 6, label %64
    i32 5, label %66
    i32 4, label %68
    i32 3, label %70
    i32 2, label %72
    i32 1, label %74
  ]

; <label>:62:                                     ; preds = %61
  %63 = getelementptr inbounds i8, i8* %.2, i64 6
  store i8 0, i8* %63, align 1
  br label %64

; <label>:64:                                     ; preds = %62, %61
  %65 = getelementptr inbounds i8, i8* %.2, i64 5
  store i8 0, i8* %65, align 1
  br label %66

; <label>:66:                                     ; preds = %64, %61
  %67 = getelementptr inbounds i8, i8* %.2, i64 4
  store i8 0, i8* %67, align 1
  br label %68

; <label>:68:                                     ; preds = %66, %61
  %69 = getelementptr inbounds i8, i8* %.2, i64 3
  store i8 0, i8* %69, align 1
  br label %70

; <label>:70:                                     ; preds = %68, %61
  %71 = getelementptr inbounds i8, i8* %.2, i64 2
  store i8 0, i8* %71, align 1
  br label %72

; <label>:72:                                     ; preds = %70, %61
  %73 = getelementptr inbounds i8, i8* %.2, i64 1
  store i8 0, i8* %73, align 1
  br label %74

; <label>:74:                                     ; preds = %72, %61
  store i8 0, i8* %.2, align 1
  %75 = sext i32 %.117 to i64
  %76 = getelementptr inbounds i8, i8* %.2, i64 %75
  br label %77

; <label>:77:                                     ; preds = %74, %61
  %.4 = phi i8* [ %.2, %61 ], [ %76, %74 ]
  %78 = and i32 %.111, 7
  br label %79

; <label>:79:                                     ; preds = %40, %77
  %.212 = phi i32 [ %78, %77 ], [ %.111, %40 ]
  %.5 = phi i8* [ %.4, %77 ], [ %.05, %40 ]
  %80 = lshr i32 255, %.212
  br label %88

; <label>:81:                                     ; preds = %22
  %82 = zext i32 %.010 to i64
  %83 = getelementptr inbounds [9 x i8], [9 x i8]* @_TIFFFax3fillruns._fillmasks, i64 0, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = zext i8 %84 to i32
  %86 = lshr i32 %85, %26
  %87 = xor i32 %86, 255
  br label %88

; <label>:88:                                     ; preds = %81, %79
  %.sink = phi i8* [ %25, %81 ], [ %.5, %79 ]
  %.sink22 = phi i32 [ %87, %81 ], [ %80, %79 ]
  %89 = load i8, i8* %.sink, align 1
  %90 = zext i8 %89 to i32
  %91 = and i32 %90, %.sink22
  %92 = trunc i32 %91 to i8
  store i8 %92, i8* %.sink, align 1
  %93 = load i32, i32* %.0146, align 4
  %94 = add i32 %93, %.0745
  br label %95

; <label>:95:                                     ; preds = %20, %88
  %.18 = phi i32 [ %94, %88 ], [ %.0745, %20 ]
  %96 = getelementptr inbounds i32, i32* %.0146, i64 1
  %97 = load i32, i32* %96, align 4
  %98 = add i32 %97, %.18
  %99 = icmp ugt i32 %98, %3
  %100 = sub i32 %3, %.18
  br i1 %99, label %101, label %102

; <label>:101:                                    ; preds = %95
  store i32 %100, i32* %96, align 4
  br label %102

; <label>:102:                                    ; preds = %101, %95
  %.313 = phi i32 [ %100, %101 ], [ %97, %95 ]
  %103 = icmp eq i32 %.313, 0
  br i1 %103, label %176, label %104

; <label>:104:                                    ; preds = %102
  %105 = lshr i32 %.18, 3
  %106 = zext i32 %105 to i64
  %107 = getelementptr inbounds i8, i8* %0, i64 %106
  %108 = and i32 %.18, 7
  %109 = sub nsw i32 8, %108
  %110 = icmp ugt i32 %.313, %109
  br i1 %110, label %111, label %163

; <label>:111:                                    ; preds = %104
  %112 = icmp eq i32 %108, 0
  br i1 %112, label %122, label %113

; <label>:113:                                    ; preds = %111
  %114 = lshr i32 255, %108
  %115 = getelementptr inbounds i8, i8* %107, i64 1
  %116 = load i8, i8* %107, align 1
  %117 = zext i8 %116 to i32
  %118 = or i32 %117, %114
  %119 = trunc i32 %118 to i8
  store i8 %119, i8* %107, align 1
  %120 = or i32 %.18, -8
  %121 = add i32 %.313, %120
  br label %122

; <label>:122:                                    ; preds = %111, %113
  %.414 = phi i32 [ %121, %113 ], [ %.313, %111 ]
  %.6 = phi i8* [ %115, %113 ], [ %107, %111 ]
  %123 = lshr i32 %.414, 3
  %124 = icmp eq i32 %123, 0
  br i1 %124, label %161, label %125

; <label>:125:                                    ; preds = %122
  %126 = icmp ugt i32 %.414, 127
  br i1 %126, label %.preheader, label %143

.preheader:                                       ; preds = %125
  %127 = ptrtoint i8* %.6 to i64
  %128 = and i64 %127, 7
  %129 = icmp eq i64 %128, 0
  br i1 %129, label %.loopexit, label %.lr.ph41.preheader

.lr.ph41.preheader:                               ; preds = %.preheader
  br label %.lr.ph41

.lr.ph41:                                         ; preds = %.lr.ph41.preheader, %.lr.ph41
  %.740 = phi i8* [ %130, %.lr.ph41 ], [ %.6, %.lr.ph41.preheader ]
  %.21839 = phi i32 [ %131, %.lr.ph41 ], [ %123, %.lr.ph41.preheader ]
  store i8 -1, i8* %.740, align 1
  %130 = getelementptr inbounds i8, i8* %.740, i64 1
  %131 = add nsw i32 %.21839, -1
  %132 = ptrtoint i8* %130 to i64
  %133 = and i64 %132, 7
  %134 = icmp ne i64 %133, 0
  %not. = icmp ne i32 %131, 0
  %135 = and i1 %not., %134
  br i1 %135, label %.lr.ph41, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph41
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.218.lcssa = phi i32 [ %123, %.preheader ], [ %131, %.loopexit.loopexit ]
  %.7.lcssa = phi i8* [ %.6, %.preheader ], [ %130, %.loopexit.loopexit ]
  %136 = ashr i32 %.218.lcssa, 3
  %137 = add nsw i32 %136, -1
  %138 = zext i32 %137 to i64
  %139 = shl nuw nsw i64 %138, 3
  %140 = add nuw nsw i64 %139, 8
  call void @llvm.memset.p0i8.i64(i8* %.7.lcssa, i8 -1, i64 %140, i32 8, i1 false)
  %scevgep59 = getelementptr i8, i8* %.7.lcssa, i64 8
  %scevgep60 = getelementptr i8, i8* %scevgep59, i64 %139
  %141 = shl nsw i32 %136, 3
  %142 = sub i32 %.218.lcssa, %141
  br label %143

; <label>:143:                                    ; preds = %.loopexit, %125
  %.319 = phi i32 [ %142, %.loopexit ], [ %123, %125 ]
  %.8 = phi i8* [ %scevgep60, %.loopexit ], [ %.6, %125 ]
  switch i32 %.319, label %159 [
    i32 7, label %144
    i32 6, label %146
    i32 5, label %148
    i32 4, label %150
    i32 3, label %152
    i32 2, label %154
    i32 1, label %156
  ]

; <label>:144:                                    ; preds = %143
  %145 = getelementptr inbounds i8, i8* %.8, i64 6
  store i8 -1, i8* %145, align 1
  br label %146

; <label>:146:                                    ; preds = %144, %143
  %147 = getelementptr inbounds i8, i8* %.8, i64 5
  store i8 -1, i8* %147, align 1
  br label %148

; <label>:148:                                    ; preds = %146, %143
  %149 = getelementptr inbounds i8, i8* %.8, i64 4
  store i8 -1, i8* %149, align 1
  br label %150

; <label>:150:                                    ; preds = %148, %143
  %151 = getelementptr inbounds i8, i8* %.8, i64 3
  store i8 -1, i8* %151, align 1
  br label %152

; <label>:152:                                    ; preds = %150, %143
  %153 = getelementptr inbounds i8, i8* %.8, i64 2
  store i8 -1, i8* %153, align 1
  br label %154

; <label>:154:                                    ; preds = %152, %143
  %155 = getelementptr inbounds i8, i8* %.8, i64 1
  store i8 -1, i8* %155, align 1
  br label %156

; <label>:156:                                    ; preds = %154, %143
  store i8 -1, i8* %.8, align 1
  %157 = sext i32 %.319 to i64
  %158 = getelementptr inbounds i8, i8* %.8, i64 %157
  br label %159

; <label>:159:                                    ; preds = %156, %143
  %.10 = phi i8* [ %.8, %143 ], [ %158, %156 ]
  %160 = and i32 %.414, 7
  br label %161

; <label>:161:                                    ; preds = %122, %159
  %.515 = phi i32 [ %160, %159 ], [ %.414, %122 ]
  %.11 = phi i8* [ %.10, %159 ], [ %.6, %122 ]
  %162 = lshr i32 65280, %.515
  br label %169

; <label>:163:                                    ; preds = %104
  %164 = zext i32 %.313 to i64
  %165 = getelementptr inbounds [9 x i8], [9 x i8]* @_TIFFFax3fillruns._fillmasks, i64 0, i64 %164
  %166 = load i8, i8* %165, align 1
  %167 = zext i8 %166 to i32
  %168 = lshr i32 %167, %108
  br label %169

; <label>:169:                                    ; preds = %163, %161
  %.sink30 = phi i8* [ %107, %163 ], [ %.11, %161 ]
  %.sink28 = phi i32 [ %168, %163 ], [ %162, %161 ]
  %170 = load i8, i8* %.sink30, align 1
  %171 = zext i8 %170 to i32
  %172 = or i32 %171, %.sink28
  %173 = trunc i32 %172 to i8
  store i8 %173, i8* %.sink30, align 1
  %174 = load i32, i32* %96, align 4
  %175 = add i32 %174, %.18
  br label %176

; <label>:176:                                    ; preds = %169, %102
  %.29 = phi i32 [ %175, %169 ], [ %.18, %102 ]
  %177 = getelementptr inbounds i32, i32* %.0146, i64 2
  %178 = icmp ult i32* %177, %.02
  br i1 %178, label %.lr.ph49, label %._crit_edge50.loopexit

._crit_edge50.loopexit:                           ; preds = %176
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %12
  %.07.lcssa = phi i32 [ 0, %12 ], [ %.29, %._crit_edge50.loopexit ]
  %179 = icmp eq i32 %.07.lcssa, %3
  br i1 %179, label %181, label %180

; <label>:180:                                    ; preds = %._crit_edge50
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 454, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__PRETTY_FUNCTION__._TIFFFax3fillruns, i64 0, i64 0)) #7
  unreachable

; <label>:181:                                    ; preds = %._crit_edge50
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTFax3(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = tail call fastcc i32 @InitCCITTFax3(%struct.tiff* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %2
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* %0, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @fax3FieldInfo, i64 0, i64 0), i32 1) #5
  %6 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 65536, i32 1) #5
  br label %7

; <label>:7:                                      ; preds = %2, %5
  %.0 = phi i32 [ %6, %5 ], [ 0, %2 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc i32 @InitCCITTFax3(%struct.tiff*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  %.sink2 = select i1 %4, i32 120, i32 96
  %5 = tail call i8* @_TIFFmalloc(i32 %.sink2) #5
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  store i8* %5, i8** %6, align 8
  %7 = icmp eq i8* %5, null
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %10 = load i8*, i8** %9, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.3, i64 0, i64 0), i8* %10) #5
  br label %55

; <label>:11:                                     ; preds = %1
  %12 = bitcast i8** %6 to %struct.Fax3BaseState**
  %13 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %12, align 8
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* nonnull %0, %struct.TIFFFieldInfo* getelementptr inbounds ([10 x %struct.TIFFFieldInfo], [10 x %struct.TIFFFieldInfo]* @faxFieldInfo, i64 0, i64 0), i32 10) #5
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 58
  %15 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %14 to i64*
  %16 = load i64, i64* %15, align 8
  %17 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %13, i64 0, i32 10
  %18 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %17 to i64*
  store i64 %16, i64* %18, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VGetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %14, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 57
  %20 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %13, i64 0, i32 11
  %23 = bitcast i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %22 to i64*
  store i64 %21, i64* %23, align 8
  store i32 (%struct.tiff*, i32, %struct.__va_list_tag*)* @Fax3VSetField, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %19, align 8
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 59
  store void (%struct.tiff*, %struct._IO_FILE*, i64)* @Fax3PrintDir, void (%struct.tiff*, %struct._IO_FILE*, i64)** %24, align 8
  %25 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %13, i64 0, i32 6
  %26 = bitcast i32* %25 to i8*
  call void @llvm.memset.p0i8.i64(i8* %26, i8 0, i64 16, i32 8, i1 false)
  %27 = load i32, i32* %2, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %37

; <label>:29:                                     ; preds = %11
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %31 = load i32, i32* %30, align 8
  %32 = or i32 %31, 256
  store i32 %32, i32* %30, align 8
  %33 = bitcast i8** %6 to %struct.Fax3DecodeState**
  %34 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %33, align 8
  %35 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %34, i64 0, i32 6
  store i32* null, i32** %35, align 8
  %36 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* nonnull %0, i32 65540, void (i8*, i32*, i32*, i32)* nonnull @_TIFFFax3fillruns) #5
  br label %41

; <label>:37:                                     ; preds = %11
  %38 = bitcast i8** %6 to %struct.Fax3EncodeState**
  %39 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %38, align 8
  %40 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %39, i64 0, i32 4
  store i8* null, i8** %40, align 8
  br label %41

; <label>:41:                                     ; preds = %37, %29
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 21
  store i32 (%struct.tiff*)* @Fax3SetupState, i32 (%struct.tiff*)** %42, align 8
  %43 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 22
  store i32 (%struct.tiff*, i16)* @Fax3PreDecode, i32 (%struct.tiff*, i16)** %43, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %44, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %45, align 8
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode1D, i32 (%struct.tiff*, i8*, i32, i16)** %46, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 23
  store i32 (%struct.tiff*)* @Fax3SetupState, i32 (%struct.tiff*)** %47, align 8
  %48 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 24
  store i32 (%struct.tiff*, i16)* @Fax3PreEncode, i32 (%struct.tiff*, i16)** %48, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  store i32 (%struct.tiff*)* @Fax3PostEncode, i32 (%struct.tiff*)** %49, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %50, align 8
  %51 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %51, align 8
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Encode, i32 (%struct.tiff*, i8*, i32, i16)** %52, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 32
  store void (%struct.tiff*)* @Fax3Close, void (%struct.tiff*)** %53, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  store void (%struct.tiff*)* @Fax3Cleanup, void (%struct.tiff*)** %54, align 8
  br label %55

; <label>:55:                                     ; preds = %41, %8
  %.0 = phi i32 [ 0, %8 ], [ 1, %41 ]
  ret i32 %.0
}

declare void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) local_unnamed_addr #2

declare i32 @TIFFSetField(%struct.tiff*, i32, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTFax4(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = tail call fastcc i32 @InitCCITTFax3(%struct.tiff* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %14, label %5

; <label>:5:                                      ; preds = %2
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* %0, %struct.TIFFFieldInfo* getelementptr inbounds ([1 x %struct.TIFFFieldInfo], [1 x %struct.TIFFFieldInfo]* @fax4FieldInfo, i64 0, i64 0), i32 1) #5
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %6, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Decode, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %9, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %10, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax4Encode, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  store i32 (%struct.tiff*)* @Fax4PostEncode, i32 (%struct.tiff*)** %12, align 8
  %13 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 65536, i32 1) #5
  br label %14

; <label>:14:                                     ; preds = %2, %5
  %.0 = phi i32 [ %13, %5 ], [ 0, %2 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4Decode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3DecodeState**
  %7 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %6, align 8
  %8 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %13, i64 %16
  %18 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 4
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.lr.ph569, label %.loopexit222

.lr.ph569:                                        ; preds = %4
  %25 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 8
  %26 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 7
  %27 = icmp sgt i32 %9, 0
  %28 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %29 = bitcast i32** %25 to i64*
  %30 = bitcast i32** %26 to i64*
  %31 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 1
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  br label %33

; <label>:33:                                     ; preds = %.lr.ph569, %.backedge
  %.02556 = phi i8* [ %1, %.lr.ph569 ], [ %500, %.backedge ]
  %.03555 = phi i32 [ %2, %.lr.ph569 ], [ %497, %.backedge ]
  %.029545 = phi i32 [ %19, %.lr.ph569 ], [ %.130191, %.backedge ]
  %.031544 = phi i32 [ %23, %.lr.ph569 ], [ %.36190, %.backedge ]
  %.055543 = phi i32 [ %21, %.lr.ph569 ], [ %.3691189, %.backedge ]
  %.0111542 = phi i8* [ %13, %.lr.ph569 ], [ %.36147188, %.backedge ]
  %34 = load i32*, i32** %25, align 8
  %35 = load i32*, i32** %26, align 8
  br i1 %27, label %.lr.ph467.lr.ph, label %.thread187

.lr.ph467.lr.ph:                                  ; preds = %33
  %36 = getelementptr inbounds i32, i32* %35, i64 1
  %37 = load i32, i32* %35, align 4
  %38 = ptrtoint i32* %34 to i64
  br label %.lr.ph467

.lr.ph467:                                        ; preds = %.lr.ph467.lr.ph, %.outer.backedge
  %.016.neg458526 = phi i32 [ 0, %.lr.ph467.lr.ph ], [ %.016.neg458, %.outer.backedge ]
  %.01.ph525 = phi i32* [ %36, %.lr.ph467.lr.ph ], [ %.01.ph.be, %.outer.backedge ]
  %.04.ph524 = phi i32 [ %37, %.lr.ph467.lr.ph ], [ %.04.ph.be, %.outer.backedge ]
  %.016.ph523 = phi i32 [ 0, %.lr.ph467.lr.ph ], [ %.016.ph.be, %.outer.backedge ]
  %.132.ph522 = phi i32 [ %.031544, %.lr.ph467.lr.ph ], [ %.132.ph.be, %.outer.backedge ]
  %.156.ph521 = phi i32 [ %.055543, %.lr.ph467.lr.ph ], [ %.156.ph.be, %.outer.backedge ]
  %.1112.ph520 = phi i8* [ %.0111542, %.lr.ph467.lr.ph ], [ %.1112.ph.be, %.outer.backedge ]
  %.0148.ph514 = phi i32* [ %34, %.lr.ph467.lr.ph ], [ %.0148.ph.be, %.outer.backedge ]
  %39 = icmp eq i32* %.0148.ph514, %34
  br i1 %39, label %.lr.ph467.split.us.preheader, label %.lr.ph467.split.preheader

.lr.ph467.split.preheader:                        ; preds = %.lr.ph467
  br label %.lr.ph467.split

.lr.ph467.split.us.preheader:                     ; preds = %.lr.ph467
  br label %.lr.ph467.split.us

.lr.ph467.split.us:                               ; preds = %.lr.ph467.split.us.preheader, %65
  %.016.neg466.us = phi i32 [ %.016.neg.us, %65 ], [ %.016.neg458526, %.lr.ph467.split.us.preheader ]
  %.01465.us = phi i32* [ %71, %65 ], [ %.01.ph525, %.lr.ph467.split.us.preheader ]
  %.04464.us = phi i32 [ %73, %65 ], [ %.04.ph524, %.lr.ph467.split.us.preheader ]
  %.016463.us = phi i32 [ %68, %65 ], [ %.016.ph523, %.lr.ph467.split.us.preheader ]
  %.132462.us = phi i32 [ %62, %65 ], [ %.132.ph522, %.lr.ph467.split.us.preheader ]
  %.156461.us = phi i32 [ %61, %65 ], [ %.156.ph521, %.lr.ph467.split.us.preheader ]
  %.092460.us = phi i32 [ %70, %65 ], [ 0, %.lr.ph467.split.us.preheader ]
  %.1112459.us = phi i8* [ %.3114.us, %65 ], [ %.1112.ph520, %.lr.ph467.split.us.preheader ]
  %40 = icmp slt i32 %.156461.us, 7
  br i1 %40, label %41, label %55

; <label>:41:                                     ; preds = %.lr.ph467.split.us
  %42 = icmp ult i8* %.1112459.us, %17
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %41
  %44 = icmp eq i32 %.156461.us, 0
  br i1 %44, label %.loopexit204.loopexit1564, label %55

; <label>:45:                                     ; preds = %41
  %46 = getelementptr inbounds i8, i8* %.1112459.us, i64 1
  %47 = load i8, i8* %.1112459.us, align 1
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds i8, i8* %11, i64 %48
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i32
  %52 = shl i32 %51, %.156461.us
  %53 = or i32 %52, %.132462.us
  %54 = add nsw i32 %.156461.us, 8
  br label %55

; <label>:55:                                     ; preds = %45, %43, %.lr.ph467.split.us
  %.3114.us = phi i8* [ %.1112459.us, %.lr.ph467.split.us ], [ %46, %45 ], [ %.1112459.us, %43 ]
  %.358.us = phi i32 [ %.156461.us, %.lr.ph467.split.us ], [ %54, %45 ], [ 7, %43 ]
  %.334.us = phi i32 [ %.132462.us, %.lr.ph467.split.us ], [ %53, %45 ], [ %.132462.us, %43 ]
  %56 = and i32 %.334.us, 127
  %57 = zext i32 %56 to i64
  %58 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %57, i32 1
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = sub nsw i32 %.358.us, %60
  %62 = lshr i32 %.334.us, %60
  %63 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %57, i32 0
  %64 = load i8, i8* %63, align 4
  switch i8 %64, label %.loopexit221.loopexit [
    i8 1, label %65
    i8 2, label %.us-lcssa.us.loopexit
    i8 3, label %.us-lcssa481.us.loopexit
    i8 4, label %.us-lcssa482.us.loopexit
    i8 5, label %.us-lcssa483.us.loopexit
    i8 6, label %.us-lcssa484.us.loopexit
    i8 12, label %.us-lcssa485.us.loopexit
  ]

; <label>:65:                                     ; preds = %55
  %66 = getelementptr inbounds i32, i32* %.01465.us, i64 1
  %67 = load i32, i32* %.01465.us, align 4
  %68 = add i32 %67, %.04464.us
  %69 = add i32 %.016.neg466.us, %.092460.us
  %70 = add i32 %69, %68
  %71 = getelementptr inbounds i32, i32* %.01465.us, i64 2
  %72 = load i32, i32* %66, align 4
  %73 = add i32 %68, %72
  %.016.neg.us = sub i32 0, %68
  %74 = icmp sgt i32 %9, %68
  br i1 %74, label %.lr.ph467.split.us, label %.outer._crit_edge.loopexit

.lr.ph467.split:                                  ; preds = %.lr.ph467.split.preheader, %.loopexit
  %.016.neg466 = phi i32 [ %.016.neg, %.loopexit ], [ %.016.neg458526, %.lr.ph467.split.preheader ]
  %.01465 = phi i32* [ %113, %.loopexit ], [ %.01.ph525, %.lr.ph467.split.preheader ]
  %.04464 = phi i32 [ %115, %.loopexit ], [ %.04.ph524, %.lr.ph467.split.preheader ]
  %.016463 = phi i32 [ %110, %.loopexit ], [ %.016.ph523, %.lr.ph467.split.preheader ]
  %.132462 = phi i32 [ %97, %.loopexit ], [ %.132.ph522, %.lr.ph467.split.preheader ]
  %.156461 = phi i32 [ %96, %.loopexit ], [ %.156.ph521, %.lr.ph467.split.preheader ]
  %.092460 = phi i32 [ %112, %.loopexit ], [ 0, %.lr.ph467.split.preheader ]
  %.1112459 = phi i8* [ %.3114, %.loopexit ], [ %.1112.ph520, %.lr.ph467.split.preheader ]
  %75 = icmp slt i32 %.156461, 7
  br i1 %75, label %76, label %90

; <label>:76:                                     ; preds = %.lr.ph467.split
  %77 = icmp ult i8* %.1112459, %17
  br i1 %77, label %80, label %78

; <label>:78:                                     ; preds = %76
  %79 = icmp eq i32 %.156461, 0
  br i1 %79, label %.loopexit204.loopexit1565, label %90

; <label>:80:                                     ; preds = %76
  %81 = getelementptr inbounds i8, i8* %.1112459, i64 1
  %82 = load i8, i8* %.1112459, align 1
  %83 = zext i8 %82 to i64
  %84 = getelementptr inbounds i8, i8* %11, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = shl i32 %86, %.156461
  %88 = or i32 %87, %.132462
  %89 = add nsw i32 %.156461, 8
  br label %90

; <label>:90:                                     ; preds = %.lr.ph467.split, %78, %80
  %.3114 = phi i8* [ %.1112459, %.lr.ph467.split ], [ %81, %80 ], [ %.1112459, %78 ]
  %.358 = phi i32 [ %.156461, %.lr.ph467.split ], [ %89, %80 ], [ 7, %78 ]
  %.334 = phi i32 [ %.132462, %.lr.ph467.split ], [ %88, %80 ], [ %.132462, %78 ]
  %91 = and i32 %.334, 127
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %92, i32 1
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  %96 = sub nsw i32 %.358, %95
  %97 = lshr i32 %.334, %95
  %98 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %92, i32 0
  %99 = load i8, i8* %98, align 4
  switch i8 %99, label %.loopexit221.loopexit1566 [
    i8 1, label %.preheader
    i8 2, label %.us-lcssa.us.loopexit1567
    i8 3, label %.us-lcssa481.us.loopexit1568
    i8 4, label %.us-lcssa482.us.loopexit1569
    i8 5, label %.us-lcssa483.us.loopexit1570
    i8 6, label %.us-lcssa484.us.loopexit1571
    i8 12, label %.us-lcssa485.us.loopexit1572
  ]

.preheader:                                       ; preds = %90
  %100 = icmp slt i32 %.04464, %9
  %not.200451 = icmp sle i32 %.04464, %.016463
  %.452 = and i1 %100, %not.200451
  br i1 %.452, label %.lr.ph455.preheader, label %.loopexit

.lr.ph455.preheader:                              ; preds = %.preheader
  br label %.lr.ph455

.lr.ph455:                                        ; preds = %.lr.ph455.preheader, %.lr.ph455
  %.1454 = phi i32* [ %106, %.lr.ph455 ], [ %.01465, %.lr.ph455.preheader ]
  %.15453 = phi i32 [ %105, %.lr.ph455 ], [ %.04464, %.lr.ph455.preheader ]
  %101 = load i32, i32* %.1454, align 4
  %102 = getelementptr inbounds i32, i32* %.1454, i64 1
  %103 = load i32, i32* %102, align 4
  %104 = add i32 %101, %.15453
  %105 = add i32 %104, %103
  %106 = getelementptr inbounds i32, i32* %.1454, i64 2
  %107 = icmp slt i32 %105, %9
  %not.200 = icmp sle i32 %105, %.016463
  %. = and i1 %107, %not.200
  br i1 %., label %.lr.ph455, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph455
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.15.lcssa = phi i32 [ %.04464, %.preheader ], [ %105, %.loopexit.loopexit ]
  %.1.lcssa = phi i32* [ %.01465, %.preheader ], [ %106, %.loopexit.loopexit ]
  %108 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  %109 = load i32, i32* %.1.lcssa, align 4
  %110 = add i32 %109, %.15.lcssa
  %111 = add i32 %.016.neg466, %.092460
  %112 = add i32 %111, %110
  %113 = getelementptr inbounds i32, i32* %.1.lcssa, i64 2
  %114 = load i32, i32* %108, align 4
  %115 = add i32 %110, %114
  %.016.neg = sub i32 0, %110
  %116 = icmp sgt i32 %9, %110
  br i1 %116, label %.lr.ph467.split, label %.outer._crit_edge.loopexit1573

.us-lcssa.us.loopexit:                            ; preds = %55
  br label %.us-lcssa.us

.us-lcssa.us.loopexit1567:                        ; preds = %90
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit1567, %.us-lcssa.us.loopexit
  %.092.lcssa302 = phi i32 [ %.092460.us, %.us-lcssa.us.loopexit ], [ %.092460, %.us-lcssa.us.loopexit1567 ]
  %.016.lcssa277 = phi i32 [ %.016463.us, %.us-lcssa.us.loopexit ], [ %.016463, %.us-lcssa.us.loopexit1567 ]
  %.04.lcssa269 = phi i32 [ %.04464.us, %.us-lcssa.us.loopexit ], [ %.04464, %.us-lcssa.us.loopexit1567 ]
  %.01.lcssa261 = phi i32* [ %.01465.us, %.us-lcssa.us.loopexit ], [ %.01465, %.us-lcssa.us.loopexit1567 ]
  %.3114.lcssa245 = phi i8* [ %.3114.us, %.us-lcssa.us.loopexit ], [ %.3114, %.us-lcssa.us.loopexit1567 ]
  %.lcssa232 = phi i32 [ %61, %.us-lcssa.us.loopexit ], [ %96, %.us-lcssa.us.loopexit1567 ]
  %.lcssa225 = phi i32 [ %62, %.us-lcssa.us.loopexit ], [ %97, %.us-lcssa.us.loopexit1567 ]
  %117 = ptrtoint i32* %.0148.ph514 to i64
  %118 = sub i64 %117, %38
  %119 = and i64 %118, 4
  %120 = icmp eq i64 %119, 0
  br i1 %120, label %.preheader206.preheader, label %.preheader211.preheader

.preheader211.preheader:                          ; preds = %.us-lcssa.us
  br label %.preheader211

.preheader206.preheader:                          ; preds = %.us-lcssa.us
  br label %.preheader206

.preheader211:                                    ; preds = %.preheader211.preheader, %165
  %.4115 = phi i8* [ %.8119, %165 ], [ %.3114.lcssa245, %.preheader211.preheader ]
  %.193 = phi i32 [ %168, %165 ], [ %.092.lcssa302, %.preheader211.preheader ]
  %.459 = phi i32 [ %155, %165 ], [ %.lcssa232, %.preheader211.preheader ]
  %.435 = phi i32 [ %156, %165 ], [ %.lcssa225, %.preheader211.preheader ]
  %.117 = phi i32 [ %169, %165 ], [ %.016.lcssa277, %.preheader211.preheader ]
  %121 = icmp slt i32 %.459, 13
  br i1 %121, label %122, label %149

; <label>:122:                                    ; preds = %.preheader211
  %123 = icmp ult i8* %.4115, %17
  br i1 %123, label %126, label %124

; <label>:124:                                    ; preds = %122
  %125 = icmp eq i32 %.459, 0
  br i1 %125, label %.loopexit204.loopexit1562, label %149

; <label>:126:                                    ; preds = %122
  %127 = getelementptr inbounds i8, i8* %.4115, i64 1
  %128 = load i8, i8* %.4115, align 1
  %129 = zext i8 %128 to i64
  %130 = getelementptr inbounds i8, i8* %11, i64 %129
  %131 = load i8, i8* %130, align 1
  %132 = zext i8 %131 to i32
  %133 = shl i32 %132, %.459
  %134 = or i32 %133, %.435
  %135 = add nsw i32 %.459, 8
  %136 = icmp slt i32 %135, 13
  br i1 %136, label %137, label %149

; <label>:137:                                    ; preds = %126
  %138 = icmp ult i8* %127, %17
  br i1 %138, label %139, label %149

; <label>:139:                                    ; preds = %137
  %140 = getelementptr inbounds i8, i8* %.4115, i64 2
  %141 = load i8, i8* %127, align 1
  %142 = zext i8 %141 to i64
  %143 = getelementptr inbounds i8, i8* %11, i64 %142
  %144 = load i8, i8* %143, align 1
  %145 = zext i8 %144 to i32
  %146 = shl i32 %145, %135
  %147 = or i32 %146, %134
  %148 = add nsw i32 %.459, 16
  br label %149

; <label>:149:                                    ; preds = %.preheader211, %126, %137, %139, %124
  %.8119 = phi i8* [ %.4115, %.preheader211 ], [ %.4115, %124 ], [ %127, %126 ], [ %140, %139 ], [ %127, %137 ]
  %.863 = phi i32 [ %.459, %.preheader211 ], [ 13, %124 ], [ %135, %126 ], [ %148, %139 ], [ 13, %137 ]
  %.839 = phi i32 [ %.435, %.preheader211 ], [ %.435, %124 ], [ %134, %126 ], [ %147, %139 ], [ %134, %137 ]
  %150 = and i32 %.839, 8191
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %151, i32 1
  %153 = load i8, i8* %152, align 1
  %154 = zext i8 %153 to i32
  %155 = sub nsw i32 %.863, %154
  %156 = lshr i32 %.839, %154
  %157 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %151, i32 0
  %158 = load i8, i8* %157, align 4
  switch i8 %158, label %.loopexit205.loopexit1563 [
    i8 8, label %159
    i8 10, label %165
    i8 11, label %165
  ]

; <label>:159:                                    ; preds = %149
  %160 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %151, i32 2
  %161 = load i32, i32* %160, align 4
  %162 = add i32 %161, %.193
  %163 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  store i32 %162, i32* %.0148.ph514, align 4
  %164 = add i32 %161, %.117
  br label %170

; <label>:165:                                    ; preds = %149, %149
  %166 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %151, i32 2
  %167 = load i32, i32* %166, align 4
  %168 = add i32 %167, %.193
  %169 = add i32 %167, %.117
  br label %.preheader211

; <label>:170:                                    ; preds = %214, %159
  %.9120 = phi i8* [ %.8119, %159 ], [ %.13124, %214 ]
  %.294 = phi i32 [ 0, %159 ], [ %217, %214 ]
  %.964 = phi i32 [ %155, %159 ], [ %205, %214 ]
  %.940 = phi i32 [ %156, %159 ], [ %206, %214 ]
  %.218 = phi i32 [ %164, %159 ], [ %218, %214 ]
  %171 = icmp slt i32 %.964, 12
  br i1 %171, label %172, label %199

; <label>:172:                                    ; preds = %170
  %173 = icmp ult i8* %.9120, %17
  br i1 %173, label %176, label %174

; <label>:174:                                    ; preds = %172
  %175 = icmp eq i32 %.964, 0
  br i1 %175, label %.loopexit204.loopexit1560, label %199

; <label>:176:                                    ; preds = %172
  %177 = getelementptr inbounds i8, i8* %.9120, i64 1
  %178 = load i8, i8* %.9120, align 1
  %179 = zext i8 %178 to i64
  %180 = getelementptr inbounds i8, i8* %11, i64 %179
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = shl i32 %182, %.964
  %184 = or i32 %183, %.940
  %185 = add nsw i32 %.964, 8
  %186 = icmp slt i32 %185, 12
  br i1 %186, label %187, label %199

; <label>:187:                                    ; preds = %176
  %188 = icmp ult i8* %177, %17
  br i1 %188, label %189, label %199

; <label>:189:                                    ; preds = %187
  %190 = getelementptr inbounds i8, i8* %.9120, i64 2
  %191 = load i8, i8* %177, align 1
  %192 = zext i8 %191 to i64
  %193 = getelementptr inbounds i8, i8* %11, i64 %192
  %194 = load i8, i8* %193, align 1
  %195 = zext i8 %194 to i32
  %196 = shl i32 %195, %185
  %197 = or i32 %196, %184
  %198 = add nsw i32 %.964, 16
  br label %199

; <label>:199:                                    ; preds = %170, %176, %187, %189, %174
  %.13124 = phi i8* [ %.9120, %170 ], [ %.9120, %174 ], [ %177, %176 ], [ %190, %189 ], [ %177, %187 ]
  %.1368 = phi i32 [ %.964, %170 ], [ 12, %174 ], [ %185, %176 ], [ %198, %189 ], [ 12, %187 ]
  %.1344 = phi i32 [ %.940, %170 ], [ %.940, %174 ], [ %184, %176 ], [ %197, %189 ], [ %184, %187 ]
  %200 = and i32 %.1344, 4095
  %201 = zext i32 %200 to i64
  %202 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %201, i32 1
  %203 = load i8, i8* %202, align 1
  %204 = zext i8 %203 to i32
  %205 = sub nsw i32 %.1368, %204
  %206 = lshr i32 %.1344, %204
  %207 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %201, i32 0
  %208 = load i8, i8* %207, align 4
  switch i8 %208, label %.loopexit208.loopexit1561 [
    i8 7, label %209
    i8 9, label %214
    i8 11, label %214
  ]

; <label>:209:                                    ; preds = %199
  %210 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %201, i32 2
  %211 = load i32, i32* %210, align 4
  %212 = add i32 %211, %.294
  store i32 %212, i32* %163, align 4
  %213 = add i32 %211, %.218
  br label %317

; <label>:214:                                    ; preds = %199, %199
  %215 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %201, i32 2
  %216 = load i32, i32* %215, align 4
  %217 = add i32 %216, %.294
  %218 = add i32 %216, %.218
  br label %170

.preheader206:                                    ; preds = %.preheader206.preheader, %263
  %.14125 = phi i8* [ %.18129, %263 ], [ %.3114.lcssa245, %.preheader206.preheader ]
  %.395 = phi i32 [ %266, %263 ], [ %.092.lcssa302, %.preheader206.preheader ]
  %.1469 = phi i32 [ %253, %263 ], [ %.lcssa232, %.preheader206.preheader ]
  %.1445 = phi i32 [ %254, %263 ], [ %.lcssa225, %.preheader206.preheader ]
  %.319 = phi i32 [ %267, %263 ], [ %.016.lcssa277, %.preheader206.preheader ]
  %219 = icmp slt i32 %.1469, 12
  br i1 %219, label %220, label %247

; <label>:220:                                    ; preds = %.preheader206
  %221 = icmp ult i8* %.14125, %17
  br i1 %221, label %224, label %222

; <label>:222:                                    ; preds = %220
  %223 = icmp eq i32 %.1469, 0
  br i1 %223, label %.loopexit204.loopexit1559, label %247

; <label>:224:                                    ; preds = %220
  %225 = getelementptr inbounds i8, i8* %.14125, i64 1
  %226 = load i8, i8* %.14125, align 1
  %227 = zext i8 %226 to i64
  %228 = getelementptr inbounds i8, i8* %11, i64 %227
  %229 = load i8, i8* %228, align 1
  %230 = zext i8 %229 to i32
  %231 = shl i32 %230, %.1469
  %232 = or i32 %231, %.1445
  %233 = add nsw i32 %.1469, 8
  %234 = icmp slt i32 %233, 12
  br i1 %234, label %235, label %247

; <label>:235:                                    ; preds = %224
  %236 = icmp ult i8* %225, %17
  br i1 %236, label %237, label %247

; <label>:237:                                    ; preds = %235
  %238 = getelementptr inbounds i8, i8* %.14125, i64 2
  %239 = load i8, i8* %225, align 1
  %240 = zext i8 %239 to i64
  %241 = getelementptr inbounds i8, i8* %11, i64 %240
  %242 = load i8, i8* %241, align 1
  %243 = zext i8 %242 to i32
  %244 = shl i32 %243, %233
  %245 = or i32 %244, %232
  %246 = add nsw i32 %.1469, 16
  br label %247

; <label>:247:                                    ; preds = %.preheader206, %224, %235, %237, %222
  %.18129 = phi i8* [ %.14125, %.preheader206 ], [ %.14125, %222 ], [ %225, %224 ], [ %238, %237 ], [ %225, %235 ]
  %.1873 = phi i32 [ %.1469, %.preheader206 ], [ 12, %222 ], [ %233, %224 ], [ %246, %237 ], [ 12, %235 ]
  %.1849 = phi i32 [ %.1445, %.preheader206 ], [ %.1445, %222 ], [ %232, %224 ], [ %245, %237 ], [ %232, %235 ]
  %248 = and i32 %.1849, 4095
  %249 = zext i32 %248 to i64
  %250 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %249, i32 1
  %251 = load i8, i8* %250, align 1
  %252 = zext i8 %251 to i32
  %253 = sub nsw i32 %.1873, %252
  %254 = lshr i32 %.1849, %252
  %255 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %249, i32 0
  %256 = load i8, i8* %255, align 4
  switch i8 %256, label %.loopexit208.loopexit [
    i8 7, label %257
    i8 9, label %263
    i8 11, label %263
  ]

; <label>:257:                                    ; preds = %247
  %258 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %249, i32 2
  %259 = load i32, i32* %258, align 4
  %260 = add i32 %259, %.395
  %261 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  store i32 %260, i32* %.0148.ph514, align 4
  %262 = add i32 %259, %.319
  br label %268

; <label>:263:                                    ; preds = %247, %247
  %264 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %249, i32 2
  %265 = load i32, i32* %264, align 4
  %266 = add i32 %265, %.395
  %267 = add i32 %265, %.319
  br label %.preheader206

; <label>:268:                                    ; preds = %312, %257
  %.19130 = phi i8* [ %.18129, %257 ], [ %.23134, %312 ]
  %.496 = phi i32 [ 0, %257 ], [ %315, %312 ]
  %.1974 = phi i32 [ %253, %257 ], [ %303, %312 ]
  %.1950 = phi i32 [ %254, %257 ], [ %304, %312 ]
  %.420 = phi i32 [ %262, %257 ], [ %316, %312 ]
  %269 = icmp slt i32 %.1974, 13
  br i1 %269, label %270, label %297

; <label>:270:                                    ; preds = %268
  %271 = icmp ult i8* %.19130, %17
  br i1 %271, label %274, label %272

; <label>:272:                                    ; preds = %270
  %273 = icmp eq i32 %.1974, 0
  br i1 %273, label %.loopexit204.loopexit, label %297

; <label>:274:                                    ; preds = %270
  %275 = getelementptr inbounds i8, i8* %.19130, i64 1
  %276 = load i8, i8* %.19130, align 1
  %277 = zext i8 %276 to i64
  %278 = getelementptr inbounds i8, i8* %11, i64 %277
  %279 = load i8, i8* %278, align 1
  %280 = zext i8 %279 to i32
  %281 = shl i32 %280, %.1974
  %282 = or i32 %281, %.1950
  %283 = add nsw i32 %.1974, 8
  %284 = icmp slt i32 %283, 13
  br i1 %284, label %285, label %297

; <label>:285:                                    ; preds = %274
  %286 = icmp ult i8* %275, %17
  br i1 %286, label %287, label %297

; <label>:287:                                    ; preds = %285
  %288 = getelementptr inbounds i8, i8* %.19130, i64 2
  %289 = load i8, i8* %275, align 1
  %290 = zext i8 %289 to i64
  %291 = getelementptr inbounds i8, i8* %11, i64 %290
  %292 = load i8, i8* %291, align 1
  %293 = zext i8 %292 to i32
  %294 = shl i32 %293, %283
  %295 = or i32 %294, %282
  %296 = add nsw i32 %.1974, 16
  br label %297

; <label>:297:                                    ; preds = %268, %274, %285, %287, %272
  %.23134 = phi i8* [ %.19130, %268 ], [ %.19130, %272 ], [ %275, %274 ], [ %288, %287 ], [ %275, %285 ]
  %.2378 = phi i32 [ %.1974, %268 ], [ 13, %272 ], [ %283, %274 ], [ %296, %287 ], [ 13, %285 ]
  %.23 = phi i32 [ %.1950, %268 ], [ %.1950, %272 ], [ %282, %274 ], [ %295, %287 ], [ %282, %285 ]
  %298 = and i32 %.23, 8191
  %299 = zext i32 %298 to i64
  %300 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %299, i32 1
  %301 = load i8, i8* %300, align 1
  %302 = zext i8 %301 to i32
  %303 = sub nsw i32 %.2378, %302
  %304 = lshr i32 %.23, %302
  %305 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %299, i32 0
  %306 = load i8, i8* %305, align 4
  switch i8 %306, label %.loopexit205.loopexit [
    i8 8, label %307
    i8 10, label %312
    i8 11, label %312
  ]

; <label>:307:                                    ; preds = %297
  %308 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %299, i32 2
  %309 = load i32, i32* %308, align 4
  %310 = add i32 %309, %.496
  store i32 %310, i32* %261, align 4
  %311 = add i32 %309, %.420
  br label %317

; <label>:312:                                    ; preds = %297, %297
  %313 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %299, i32 2
  %314 = load i32, i32* %313, align 4
  %315 = add i32 %314, %.496
  %316 = add i32 %314, %.420
  br label %268

; <label>:317:                                    ; preds = %307, %209
  %.24135 = phi i8* [ %.13124, %209 ], [ %.23134, %307 ]
  %.2479 = phi i32 [ %205, %209 ], [ %303, %307 ]
  %.24 = phi i32 [ %206, %209 ], [ %304, %307 ]
  %.521 = phi i32 [ %213, %209 ], [ %311, %307 ]
  %.1149 = getelementptr inbounds i32, i32* %.0148.ph514, i64 2
  %318 = icmp eq i32* %.1149, %34
  br i1 %318, label %.outer.backedge, label %.preheader202

.preheader202:                                    ; preds = %317
  %319 = icmp slt i32 %.04.lcssa269, %9
  %not.199507 = icmp sle i32 %.04.lcssa269, %.521
  %.168508 = and i1 %319, %not.199507
  br i1 %.168508, label %.lr.ph511.preheader, label %.outer.backedge

.lr.ph511.preheader:                              ; preds = %.preheader202
  br label %.lr.ph511

.lr.ph511:                                        ; preds = %.lr.ph511.preheader, %.lr.ph511
  %.3510 = phi i32* [ %325, %.lr.ph511 ], [ %.01.lcssa261, %.lr.ph511.preheader ]
  %.37509 = phi i32 [ %324, %.lr.ph511 ], [ %.04.lcssa269, %.lr.ph511.preheader ]
  %320 = load i32, i32* %.3510, align 4
  %321 = getelementptr inbounds i32, i32* %.3510, i64 1
  %322 = load i32, i32* %321, align 4
  %323 = add i32 %320, %.37509
  %324 = add i32 %323, %322
  %325 = getelementptr inbounds i32, i32* %.3510, i64 2
  %326 = icmp slt i32 %324, %9
  %not.199 = icmp sle i32 %324, %.521
  %.168 = and i1 %326, %not.199
  br i1 %.168, label %.lr.ph511, label %.outer.backedge.loopexit

.us-lcssa481.us.loopexit:                         ; preds = %55
  br label %.us-lcssa481.us

.us-lcssa481.us.loopexit1568:                     ; preds = %90
  br label %.us-lcssa481.us

.us-lcssa481.us:                                  ; preds = %.us-lcssa481.us.loopexit1568, %.us-lcssa481.us.loopexit
  %.092.lcssa303 = phi i32 [ %.092460.us, %.us-lcssa481.us.loopexit ], [ %.092460, %.us-lcssa481.us.loopexit1568 ]
  %.016.lcssa278 = phi i32 [ %.016463.us, %.us-lcssa481.us.loopexit ], [ %.016463, %.us-lcssa481.us.loopexit1568 ]
  %.04.lcssa270 = phi i32 [ %.04464.us, %.us-lcssa481.us.loopexit ], [ %.04464, %.us-lcssa481.us.loopexit1568 ]
  %.01.lcssa262 = phi i32* [ %.01465.us, %.us-lcssa481.us.loopexit ], [ %.01465, %.us-lcssa481.us.loopexit1568 ]
  %.016.neg.lcssa254 = phi i32 [ %.016.neg466.us, %.us-lcssa481.us.loopexit ], [ %.016.neg466, %.us-lcssa481.us.loopexit1568 ]
  %.3114.lcssa246 = phi i8* [ %.3114.us, %.us-lcssa481.us.loopexit ], [ %.3114, %.us-lcssa481.us.loopexit1568 ]
  %.lcssa233 = phi i32 [ %61, %.us-lcssa481.us.loopexit ], [ %96, %.us-lcssa481.us.loopexit1568 ]
  %.lcssa226 = phi i32 [ %62, %.us-lcssa481.us.loopexit ], [ %97, %.us-lcssa481.us.loopexit1568 ]
  %327 = icmp eq i32* %.0148.ph514, %34
  br i1 %327, label %.loopexit215, label %.preheader214

.preheader214:                                    ; preds = %.us-lcssa481.us
  %328 = icmp slt i32 %.04.lcssa270, %9
  %not.198500 = icmp sle i32 %.04.lcssa270, %.016.lcssa278
  %.169501 = and i1 %328, %not.198500
  br i1 %.169501, label %.lr.ph504.preheader, label %.loopexit215

.lr.ph504.preheader:                              ; preds = %.preheader214
  br label %.lr.ph504

.lr.ph504:                                        ; preds = %.lr.ph504.preheader, %.lr.ph504
  %.5503 = phi i32* [ %334, %.lr.ph504 ], [ %.01.lcssa262, %.lr.ph504.preheader ]
  %.59502 = phi i32 [ %333, %.lr.ph504 ], [ %.04.lcssa270, %.lr.ph504.preheader ]
  %329 = load i32, i32* %.5503, align 4
  %330 = getelementptr inbounds i32, i32* %.5503, i64 1
  %331 = load i32, i32* %330, align 4
  %332 = add i32 %329, %.59502
  %333 = add i32 %332, %331
  %334 = getelementptr inbounds i32, i32* %.5503, i64 2
  %335 = icmp slt i32 %333, %9
  %not.198 = icmp sle i32 %333, %.016.lcssa278
  %.169 = and i1 %335, %not.198
  br i1 %.169, label %.lr.ph504, label %.loopexit215.loopexit

.loopexit215.loopexit:                            ; preds = %.lr.ph504
  br label %.loopexit215

.loopexit215:                                     ; preds = %.loopexit215.loopexit, %.preheader214, %.us-lcssa481.us
  %.610 = phi i32 [ %.04.lcssa270, %.us-lcssa481.us ], [ %.04.lcssa270, %.preheader214 ], [ %333, %.loopexit215.loopexit ]
  %.6 = phi i32* [ %.01.lcssa262, %.us-lcssa481.us ], [ %.01.lcssa262, %.preheader214 ], [ %334, %.loopexit215.loopexit ]
  %336 = add i32 %.016.neg.lcssa254, %.092.lcssa303
  %337 = add i32 %336, %.610
  store i32 %337, i32* %.0148.ph514, align 4
  %338 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  %339 = getelementptr inbounds i32, i32* %.6, i64 1
  %340 = load i32, i32* %.6, align 4
  %341 = add i32 %340, %.610
  br label %.outer.backedge

.us-lcssa482.us.loopexit:                         ; preds = %55
  br label %.us-lcssa482.us

.us-lcssa482.us.loopexit1569:                     ; preds = %90
  br label %.us-lcssa482.us

.us-lcssa482.us:                                  ; preds = %.us-lcssa482.us.loopexit1569, %.us-lcssa482.us.loopexit
  %.092.lcssa304 = phi i32 [ %.092460.us, %.us-lcssa482.us.loopexit ], [ %.092460, %.us-lcssa482.us.loopexit1569 ]
  %.016.lcssa279 = phi i32 [ %.016463.us, %.us-lcssa482.us.loopexit ], [ %.016463, %.us-lcssa482.us.loopexit1569 ]
  %.04.lcssa271 = phi i32 [ %.04464.us, %.us-lcssa482.us.loopexit ], [ %.04464, %.us-lcssa482.us.loopexit1569 ]
  %.01.lcssa263 = phi i32* [ %.01465.us, %.us-lcssa482.us.loopexit ], [ %.01465, %.us-lcssa482.us.loopexit1569 ]
  %.016.neg.lcssa255 = phi i32 [ %.016.neg466.us, %.us-lcssa482.us.loopexit ], [ %.016.neg466, %.us-lcssa482.us.loopexit1569 ]
  %.3114.lcssa247 = phi i8* [ %.3114.us, %.us-lcssa482.us.loopexit ], [ %.3114, %.us-lcssa482.us.loopexit1569 ]
  %.lcssa241 = phi i64 [ %57, %.us-lcssa482.us.loopexit ], [ %92, %.us-lcssa482.us.loopexit1569 ]
  %.lcssa234 = phi i32 [ %61, %.us-lcssa482.us.loopexit ], [ %96, %.us-lcssa482.us.loopexit1569 ]
  %.lcssa227 = phi i32 [ %62, %.us-lcssa482.us.loopexit ], [ %97, %.us-lcssa482.us.loopexit1569 ]
  %342 = icmp eq i32* %.0148.ph514, %34
  br i1 %342, label %.loopexit217, label %.preheader216

.preheader216:                                    ; preds = %.us-lcssa482.us
  %343 = icmp slt i32 %.04.lcssa271, %9
  %not.197493 = icmp sle i32 %.04.lcssa271, %.016.lcssa279
  %.170494 = and i1 %343, %not.197493
  br i1 %.170494, label %.lr.ph497.preheader, label %.loopexit217

.lr.ph497.preheader:                              ; preds = %.preheader216
  br label %.lr.ph497

.lr.ph497:                                        ; preds = %.lr.ph497.preheader, %.lr.ph497
  %.7496 = phi i32* [ %349, %.lr.ph497 ], [ %.01.lcssa263, %.lr.ph497.preheader ]
  %.711495 = phi i32 [ %348, %.lr.ph497 ], [ %.04.lcssa271, %.lr.ph497.preheader ]
  %344 = load i32, i32* %.7496, align 4
  %345 = getelementptr inbounds i32, i32* %.7496, i64 1
  %346 = load i32, i32* %345, align 4
  %347 = add i32 %344, %.711495
  %348 = add i32 %347, %346
  %349 = getelementptr inbounds i32, i32* %.7496, i64 2
  %350 = icmp slt i32 %348, %9
  %not.197 = icmp sle i32 %348, %.016.lcssa279
  %.170 = and i1 %350, %not.197
  br i1 %.170, label %.lr.ph497, label %.loopexit217.loopexit

.loopexit217.loopexit:                            ; preds = %.lr.ph497
  br label %.loopexit217

.loopexit217:                                     ; preds = %.loopexit217.loopexit, %.preheader216, %.us-lcssa482.us
  %.812 = phi i32 [ %.04.lcssa271, %.us-lcssa482.us ], [ %.04.lcssa271, %.preheader216 ], [ %348, %.loopexit217.loopexit ]
  %.8 = phi i32* [ %.01.lcssa263, %.us-lcssa482.us ], [ %.01.lcssa263, %.preheader216 ], [ %349, %.loopexit217.loopexit ]
  %351 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %.lcssa241, i32 2
  %352 = load i32, i32* %351, align 4
  %353 = add i32 %.016.neg.lcssa255, %.092.lcssa304
  %354 = add i32 %353, %.812
  %355 = add i32 %354, %352
  store i32 %355, i32* %.0148.ph514, align 4
  %356 = add i32 %352, %.812
  %357 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  %358 = getelementptr inbounds i32, i32* %.8, i64 1
  %359 = load i32, i32* %.8, align 4
  %360 = add i32 %359, %.812
  br label %.outer.backedge

.us-lcssa483.us.loopexit:                         ; preds = %55
  br label %.us-lcssa483.us

.us-lcssa483.us.loopexit1570:                     ; preds = %90
  br label %.us-lcssa483.us

.us-lcssa483.us:                                  ; preds = %.us-lcssa483.us.loopexit1570, %.us-lcssa483.us.loopexit
  %.092.lcssa305 = phi i32 [ %.092460.us, %.us-lcssa483.us.loopexit ], [ %.092460, %.us-lcssa483.us.loopexit1570 ]
  %.016.lcssa280 = phi i32 [ %.016463.us, %.us-lcssa483.us.loopexit ], [ %.016463, %.us-lcssa483.us.loopexit1570 ]
  %.04.lcssa272 = phi i32 [ %.04464.us, %.us-lcssa483.us.loopexit ], [ %.04464, %.us-lcssa483.us.loopexit1570 ]
  %.01.lcssa264 = phi i32* [ %.01465.us, %.us-lcssa483.us.loopexit ], [ %.01465, %.us-lcssa483.us.loopexit1570 ]
  %.3114.lcssa248 = phi i8* [ %.3114.us, %.us-lcssa483.us.loopexit ], [ %.3114, %.us-lcssa483.us.loopexit1570 ]
  %.lcssa242 = phi i64 [ %57, %.us-lcssa483.us.loopexit ], [ %92, %.us-lcssa483.us.loopexit1570 ]
  %.lcssa235 = phi i32 [ %61, %.us-lcssa483.us.loopexit ], [ %96, %.us-lcssa483.us.loopexit1570 ]
  %.lcssa228 = phi i32 [ %62, %.us-lcssa483.us.loopexit ], [ %97, %.us-lcssa483.us.loopexit1570 ]
  %361 = icmp eq i32* %.0148.ph514, %34
  br i1 %361, label %.loopexit219, label %.preheader218

.preheader218:                                    ; preds = %.us-lcssa483.us
  %362 = icmp slt i32 %.04.lcssa272, %9
  %not.486 = icmp sle i32 %.04.lcssa272, %.016.lcssa280
  %.171487 = and i1 %362, %not.486
  br i1 %.171487, label %.lr.ph490.preheader, label %.loopexit219

.lr.ph490.preheader:                              ; preds = %.preheader218
  br label %.lr.ph490

.lr.ph490:                                        ; preds = %.lr.ph490.preheader, %.lr.ph490
  %.9489 = phi i32* [ %368, %.lr.ph490 ], [ %.01.lcssa264, %.lr.ph490.preheader ]
  %.913488 = phi i32 [ %367, %.lr.ph490 ], [ %.04.lcssa272, %.lr.ph490.preheader ]
  %363 = load i32, i32* %.9489, align 4
  %364 = getelementptr inbounds i32, i32* %.9489, i64 1
  %365 = load i32, i32* %364, align 4
  %366 = add i32 %363, %.913488
  %367 = add i32 %366, %365
  %368 = getelementptr inbounds i32, i32* %.9489, i64 2
  %369 = icmp slt i32 %367, %9
  %not. = icmp sle i32 %367, %.016.lcssa280
  %.171 = and i1 %369, %not.
  br i1 %.171, label %.lr.ph490, label %.loopexit219.loopexit

.loopexit219.loopexit:                            ; preds = %.lr.ph490
  br label %.loopexit219

.loopexit219:                                     ; preds = %.loopexit219.loopexit, %.preheader218, %.us-lcssa483.us
  %.1014 = phi i32 [ %.04.lcssa272, %.us-lcssa483.us ], [ %.04.lcssa272, %.preheader218 ], [ %367, %.loopexit219.loopexit ]
  %.10 = phi i32* [ %.01.lcssa264, %.us-lcssa483.us ], [ %.01.lcssa264, %.preheader218 ], [ %368, %.loopexit219.loopexit ]
  %370 = sub nsw i32 %.1014, %.016.lcssa280
  %371 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %.lcssa242, i32 2
  %372 = load i32, i32* %371, align 4
  %373 = sub i32 %370, %372
  %374 = add i32 %373, %.092.lcssa305
  store i32 %374, i32* %.0148.ph514, align 4
  %375 = add i32 %373, %.016.lcssa280
  %376 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  %377 = getelementptr inbounds i32, i32* %.10, i64 -1
  %378 = load i32, i32* %377, align 4
  %379 = sub i32 %.1014, %378
  br label %.outer.backedge

.outer.backedge.loopexit:                         ; preds = %.lr.ph511
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %.outer.backedge.loopexit, %.preheader202, %.loopexit219, %.loopexit217, %.loopexit215, %317
  %.0148.ph.be = phi i32* [ %.1149, %317 ], [ %338, %.loopexit215 ], [ %357, %.loopexit217 ], [ %376, %.loopexit219 ], [ %.1149, %.preheader202 ], [ %.1149, %.outer.backedge.loopexit ]
  %.1112.ph.be = phi i8* [ %.24135, %317 ], [ %.3114.lcssa246, %.loopexit215 ], [ %.3114.lcssa247, %.loopexit217 ], [ %.3114.lcssa248, %.loopexit219 ], [ %.24135, %.preheader202 ], [ %.24135, %.outer.backedge.loopexit ]
  %.156.ph.be = phi i32 [ %.2479, %317 ], [ %.lcssa233, %.loopexit215 ], [ %.lcssa234, %.loopexit217 ], [ %.lcssa235, %.loopexit219 ], [ %.2479, %.preheader202 ], [ %.2479, %.outer.backedge.loopexit ]
  %.132.ph.be = phi i32 [ %.24, %317 ], [ %.lcssa226, %.loopexit215 ], [ %.lcssa227, %.loopexit217 ], [ %.lcssa228, %.loopexit219 ], [ %.24, %.preheader202 ], [ %.24, %.outer.backedge.loopexit ]
  %.016.ph.be = phi i32 [ %.521, %317 ], [ %.610, %.loopexit215 ], [ %356, %.loopexit217 ], [ %375, %.loopexit219 ], [ %.521, %.preheader202 ], [ %.521, %.outer.backedge.loopexit ]
  %.04.ph.be = phi i32 [ %.04.lcssa269, %317 ], [ %341, %.loopexit215 ], [ %360, %.loopexit217 ], [ %379, %.loopexit219 ], [ %.04.lcssa269, %.preheader202 ], [ %324, %.outer.backedge.loopexit ]
  %.01.ph.be = phi i32* [ %.01.lcssa261, %317 ], [ %339, %.loopexit215 ], [ %358, %.loopexit217 ], [ %377, %.loopexit219 ], [ %.01.lcssa261, %.preheader202 ], [ %325, %.outer.backedge.loopexit ]
  %.016.neg458 = sub i32 0, %.016.ph.be
  %380 = icmp sgt i32 %9, %.016.ph.be
  br i1 %380, label %.lr.ph467, label %.thread187.loopexit

.us-lcssa484.us.loopexit:                         ; preds = %55
  br label %.us-lcssa484.us

.us-lcssa484.us.loopexit1571:                     ; preds = %90
  br label %.us-lcssa484.us

.us-lcssa484.us:                                  ; preds = %.us-lcssa484.us.loopexit1571, %.us-lcssa484.us.loopexit
  %.092.lcssa306 = phi i32 [ %.092460.us, %.us-lcssa484.us.loopexit ], [ %.092460, %.us-lcssa484.us.loopexit1571 ]
  %.016.lcssa281 = phi i32 [ %.016463.us, %.us-lcssa484.us.loopexit ], [ %.016463, %.us-lcssa484.us.loopexit1571 ]
  %.3114.lcssa249 = phi i8* [ %.3114.us, %.us-lcssa484.us.loopexit ], [ %.3114, %.us-lcssa484.us.loopexit1571 ]
  %.lcssa236 = phi i32 [ %61, %.us-lcssa484.us.loopexit ], [ %96, %.us-lcssa484.us.loopexit1571 ]
  %.lcssa229 = phi i32 [ %62, %.us-lcssa484.us.loopexit ], [ %97, %.us-lcssa484.us.loopexit1571 ]
  %381 = sub nsw i32 %9, %.016.lcssa281
  %382 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  store i32 %381, i32* %.0148.ph514, align 4
  tail call fastcc void @Fax3Extension(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.016.lcssa281)
  br label %462

.us-lcssa485.us.loopexit:                         ; preds = %55
  br label %.us-lcssa485.us

.us-lcssa485.us.loopexit1572:                     ; preds = %90
  br label %.us-lcssa485.us

.us-lcssa485.us:                                  ; preds = %.us-lcssa485.us.loopexit1572, %.us-lcssa485.us.loopexit
  %.092.lcssa307 = phi i32 [ %.092460.us, %.us-lcssa485.us.loopexit ], [ %.092460, %.us-lcssa485.us.loopexit1572 ]
  %.016.lcssa282 = phi i32 [ %.016463.us, %.us-lcssa485.us.loopexit ], [ %.016463, %.us-lcssa485.us.loopexit1572 ]
  %.3114.lcssa250 = phi i8* [ %.3114.us, %.us-lcssa485.us.loopexit ], [ %.3114, %.us-lcssa485.us.loopexit1572 ]
  %.lcssa237 = phi i32 [ %61, %.us-lcssa485.us.loopexit ], [ %96, %.us-lcssa485.us.loopexit1572 ]
  %.lcssa230 = phi i32 [ %62, %.us-lcssa485.us.loopexit ], [ %97, %.us-lcssa485.us.loopexit1572 ]
  %383 = sub nsw i32 %9, %.016.lcssa282
  %384 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  store i32 %383, i32* %.0148.ph514, align 4
  %385 = icmp slt i32 %.lcssa237, 5
  br i1 %385, label %386, label %400

; <label>:386:                                    ; preds = %.us-lcssa485.us
  %387 = icmp ult i8* %.3114.lcssa250, %17
  br i1 %387, label %390, label %388

; <label>:388:                                    ; preds = %386
  %389 = icmp eq i32 %.lcssa237, 0
  br i1 %389, label %.loopexit204.loopexit1574, label %400

; <label>:390:                                    ; preds = %386
  %391 = getelementptr inbounds i8, i8* %.3114.lcssa250, i64 1
  %392 = load i8, i8* %.3114.lcssa250, align 1
  %393 = zext i8 %392 to i64
  %394 = getelementptr inbounds i8, i8* %11, i64 %393
  %395 = load i8, i8* %394, align 1
  %396 = zext i8 %395 to i32
  %397 = shl i32 %396, %.lcssa237
  %398 = or i32 %397, %.lcssa230
  %399 = add nsw i32 %.lcssa237, 8
  br label %400

; <label>:400:                                    ; preds = %.us-lcssa485.us, %388, %390
  %.26137 = phi i8* [ %.3114.lcssa250, %.us-lcssa485.us ], [ %391, %390 ], [ %.3114.lcssa250, %388 ]
  %.2681 = phi i32 [ %.lcssa237, %.us-lcssa485.us ], [ %399, %390 ], [ 5, %388 ]
  %.2654 = phi i32 [ %.lcssa230, %.us-lcssa485.us ], [ %398, %390 ], [ %.lcssa230, %388 ]
  %401 = and i32 %.2654, 31
  %402 = icmp eq i32 %401, 0
  br i1 %402, label %462, label %403

; <label>:403:                                    ; preds = %400
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.016.lcssa282)
  br label %462

.loopexit221.loopexit:                            ; preds = %55
  br label %.loopexit221

.loopexit221.loopexit1566:                        ; preds = %90
  br label %.loopexit221

.loopexit221:                                     ; preds = %.loopexit221.loopexit1566, %.loopexit221.loopexit, %454
  %.092308 = phi i32 [ %.092.lcssa, %454 ], [ %.092460.us, %.loopexit221.loopexit ], [ %.092460, %.loopexit221.loopexit1566 ]
  %.016283 = phi i32 [ %.016.lcssa, %454 ], [ %.016463.us, %.loopexit221.loopexit ], [ %.016463, %.loopexit221.loopexit1566 ]
  %.27138 = phi i8* [ %.33144, %454 ], [ %.3114.us, %.loopexit221.loopexit ], [ %.3114, %.loopexit221.loopexit1566 ]
  %.2782 = phi i32 [ %.3388, %454 ], [ %61, %.loopexit221.loopexit ], [ %96, %.loopexit221.loopexit1566 ]
  %.27 = phi i32 [ %.33, %454 ], [ %62, %.loopexit221.loopexit ], [ %97, %.loopexit221.loopexit1566 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.016283)
  br label %462

.loopexit205.loopexit:                            ; preds = %297
  br label %.loopexit205

.loopexit205.loopexit1563:                        ; preds = %149
  br label %.loopexit205

.loopexit205:                                     ; preds = %.loopexit205.loopexit1563, %.loopexit205.loopexit
  %.2150 = phi i32* [ %261, %.loopexit205.loopexit ], [ %.0148.ph514, %.loopexit205.loopexit1563 ]
  %.28139 = phi i8* [ %.23134, %.loopexit205.loopexit ], [ %.8119, %.loopexit205.loopexit1563 ]
  %.698 = phi i32 [ %.496, %.loopexit205.loopexit ], [ %.193, %.loopexit205.loopexit1563 ]
  %.2883 = phi i32 [ %303, %.loopexit205.loopexit ], [ %155, %.loopexit205.loopexit1563 ]
  %.28 = phi i32 [ %304, %.loopexit205.loopexit ], [ %156, %.loopexit205.loopexit1563 ]
  %.622 = phi i32 [ %.420, %.loopexit205.loopexit ], [ %.117, %.loopexit205.loopexit1563 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.622)
  br label %462

.loopexit208.loopexit:                            ; preds = %247
  br label %.loopexit208

.loopexit208.loopexit1561:                        ; preds = %199
  br label %.loopexit208

.loopexit208:                                     ; preds = %.loopexit208.loopexit1561, %.loopexit208.loopexit
  %.3151 = phi i32* [ %.0148.ph514, %.loopexit208.loopexit ], [ %163, %.loopexit208.loopexit1561 ]
  %.29140 = phi i8* [ %.18129, %.loopexit208.loopexit ], [ %.13124, %.loopexit208.loopexit1561 ]
  %.799 = phi i32 [ %.395, %.loopexit208.loopexit ], [ %.294, %.loopexit208.loopexit1561 ]
  %.2984 = phi i32 [ %253, %.loopexit208.loopexit ], [ %205, %.loopexit208.loopexit1561 ]
  %.29 = phi i32 [ %254, %.loopexit208.loopexit ], [ %206, %.loopexit208.loopexit1561 ]
  %.723 = phi i32 [ %.319, %.loopexit208.loopexit ], [ %.218, %.loopexit208.loopexit1561 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.723)
  br label %462

.loopexit204.loopexit:                            ; preds = %272
  br label %.loopexit204

.loopexit204.loopexit1559:                        ; preds = %222
  br label %.loopexit204

.loopexit204.loopexit1560:                        ; preds = %174
  br label %.loopexit204

.loopexit204.loopexit1562:                        ; preds = %124
  br label %.loopexit204

.loopexit204.loopexit1564:                        ; preds = %43
  br label %.loopexit204

.loopexit204.loopexit1565:                        ; preds = %78
  br label %.loopexit204

.loopexit204.loopexit1574:                        ; preds = %388
  br label %.loopexit204

.loopexit204:                                     ; preds = %.loopexit204.loopexit1574, %.loopexit204.loopexit1565, %.loopexit204.loopexit1564, %.loopexit204.loopexit1562, %.loopexit204.loopexit1560, %.loopexit204.loopexit1559, %.loopexit204.loopexit
  %.4152 = phi i32* [ %261, %.loopexit204.loopexit ], [ %.0148.ph514, %.loopexit204.loopexit1559 ], [ %163, %.loopexit204.loopexit1560 ], [ %.0148.ph514, %.loopexit204.loopexit1562 ], [ %.0148.ph514, %.loopexit204.loopexit1564 ], [ %.0148.ph514, %.loopexit204.loopexit1565 ], [ %384, %.loopexit204.loopexit1574 ]
  %.30141 = phi i8* [ %.19130, %.loopexit204.loopexit ], [ %.14125, %.loopexit204.loopexit1559 ], [ %.9120, %.loopexit204.loopexit1560 ], [ %.4115, %.loopexit204.loopexit1562 ], [ %.1112459.us, %.loopexit204.loopexit1564 ], [ %.1112459, %.loopexit204.loopexit1565 ], [ %.3114.lcssa250, %.loopexit204.loopexit1574 ]
  %.8100 = phi i32 [ %.496, %.loopexit204.loopexit ], [ %.395, %.loopexit204.loopexit1559 ], [ %.294, %.loopexit204.loopexit1560 ], [ %.193, %.loopexit204.loopexit1562 ], [ %.092460.us, %.loopexit204.loopexit1564 ], [ %.092460, %.loopexit204.loopexit1565 ], [ %.092.lcssa307, %.loopexit204.loopexit1574 ]
  %.30 = phi i32 [ %.1950, %.loopexit204.loopexit ], [ %.1445, %.loopexit204.loopexit1559 ], [ %.940, %.loopexit204.loopexit1560 ], [ %.435, %.loopexit204.loopexit1562 ], [ %.132462.us, %.loopexit204.loopexit1564 ], [ %.132462, %.loopexit204.loopexit1565 ], [ %.lcssa230, %.loopexit204.loopexit1574 ]
  %.824 = phi i32 [ %.420, %.loopexit204.loopexit ], [ %.319, %.loopexit204.loopexit1559 ], [ %.218, %.loopexit204.loopexit1560 ], [ %.117, %.loopexit204.loopexit1562 ], [ %.016463.us, %.loopexit204.loopexit1564 ], [ %.016463, %.loopexit204.loopexit1565 ], [ %.016.lcssa282, %.loopexit204.loopexit1574 ]
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.824)
  %404 = icmp eq i32 %.8100, 0
  br i1 %404, label %407, label %405

; <label>:405:                                    ; preds = %.thread, %.loopexit204
  %.824185 = phi i32 [ %.016.lcssa, %.thread ], [ %.824, %.loopexit204 ]
  %.30183 = phi i32 [ %.132.lcssa, %.thread ], [ %.30, %.loopexit204 ]
  %.8100180 = phi i32 [ %.092.lcssa, %.thread ], [ %.8100, %.loopexit204 ]
  %.30141178 = phi i8* [ %.1112.lcssa, %.thread ], [ %.30141, %.loopexit204 ]
  %.4152177 = phi i32* [ %.0148.ph514, %.thread ], [ %.4152, %.loopexit204 ]
  store i32 %.8100180, i32* %.4152177, align 4
  %406 = getelementptr inbounds i32, i32* %.4152177, i64 1
  br label %407

; <label>:407:                                    ; preds = %.loopexit204, %405
  %.824186 = phi i32 [ %.824185, %405 ], [ %.824, %.loopexit204 ]
  %.30184 = phi i32 [ %.30183, %405 ], [ %.30, %.loopexit204 ]
  %.30141179 = phi i8* [ %.30141178, %405 ], [ %.30141, %.loopexit204 ]
  %.5153 = phi i32* [ %406, %405 ], [ %.4152, %.loopexit204 ]
  %408 = icmp eq i32 %.824186, %9
  br i1 %408, label %504, label %409

; <label>:409:                                    ; preds = %407
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.824186, i32 %9)
  %410 = icmp sgt i32 %.824186, %9
  %411 = icmp ugt i32* %.5153, %34
  %.172446 = and i1 %411, %410
  br i1 %.172446, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %409
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.1026448 = phi i32 [ %414, %.lr.ph ], [ %.824186, %.lr.ph.preheader ]
  %.6154447 = phi i32* [ %412, %.lr.ph ], [ %.5153, %.lr.ph.preheader ]
  %412 = getelementptr inbounds i32, i32* %.6154447, i64 -1
  %413 = load i32, i32* %412, align 4
  %414 = sub i32 %.1026448, %413
  %415 = icmp sgt i32 %414, %9
  %416 = icmp ugt i32* %412, %34
  %.172 = and i1 %416, %415
  br i1 %.172, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %409
  %.6154.lcssa = phi i32* [ %.5153, %409 ], [ %412, %._crit_edge.loopexit ]
  %.1026.lcssa = phi i32 [ %.824186, %409 ], [ %414, %._crit_edge.loopexit ]
  %.lcssa = phi i1 [ %410, %409 ], [ %415, %._crit_edge.loopexit ]
  %417 = icmp slt i32 %.1026.lcssa, %9
  br i1 %417, label %418, label %430

; <label>:418:                                    ; preds = %._crit_edge
  %419 = icmp sgt i32 %.1026.lcssa, 0
  %..1026 = select i1 %419, i32 %.1026.lcssa, i32 0
  %420 = ptrtoint i32* %.6154.lcssa to i64
  %421 = ptrtoint i32* %34 to i64
  %422 = sub i64 %420, %421
  %423 = and i64 %422, 4
  %424 = icmp eq i64 %423, 0
  br i1 %424, label %427, label %425

; <label>:425:                                    ; preds = %418
  store i32 0, i32* %.6154.lcssa, align 4
  %426 = getelementptr inbounds i32, i32* %.6154.lcssa, i64 1
  br label %427

; <label>:427:                                    ; preds = %425, %418
  %.7155 = phi i32* [ %426, %425 ], [ %.6154.lcssa, %418 ]
  %428 = sub nsw i32 %9, %..1026
  store i32 %428, i32* %.7155, align 4
  %429 = getelementptr inbounds i32, i32* %.7155, i64 1
  br label %504

; <label>:430:                                    ; preds = %._crit_edge
  br i1 %.lcssa, label %431, label %504

; <label>:431:                                    ; preds = %430
  %432 = getelementptr inbounds i32, i32* %.6154.lcssa, i64 2
  %433 = getelementptr inbounds i32, i32* %.6154.lcssa, i64 1
  store i32 %9, i32* %.6154.lcssa, align 4
  store i32 0, i32* %433, align 4
  br label %504

.outer._crit_edge.loopexit:                       ; preds = %65
  br label %.outer._crit_edge

.outer._crit_edge.loopexit1573:                   ; preds = %.loopexit
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit1573, %.outer._crit_edge.loopexit
  %.1112.lcssa = phi i8* [ %.3114.us, %.outer._crit_edge.loopexit ], [ %.3114, %.outer._crit_edge.loopexit1573 ]
  %.092.lcssa = phi i32 [ %70, %.outer._crit_edge.loopexit ], [ %112, %.outer._crit_edge.loopexit1573 ]
  %.156.lcssa = phi i32 [ %61, %.outer._crit_edge.loopexit ], [ %96, %.outer._crit_edge.loopexit1573 ]
  %.132.lcssa = phi i32 [ %62, %.outer._crit_edge.loopexit ], [ %97, %.outer._crit_edge.loopexit1573 ]
  %.016.lcssa = phi i32 [ %68, %.outer._crit_edge.loopexit ], [ %110, %.outer._crit_edge.loopexit1573 ]
  %434 = icmp eq i32 %.092.lcssa, 0
  br i1 %434, label %.thread187, label %435

; <label>:435:                                    ; preds = %.outer._crit_edge
  %436 = add nsw i32 %.016.lcssa, %.092.lcssa
  %437 = icmp slt i32 %436, %9
  br i1 %437, label %438, label %460

; <label>:438:                                    ; preds = %435
  %439 = icmp slt i32 %.156.lcssa, 1
  br i1 %439, label %440, label %454

; <label>:440:                                    ; preds = %438
  %441 = icmp ult i8* %.1112.lcssa, %17
  br i1 %441, label %444, label %442

; <label>:442:                                    ; preds = %440
  %443 = icmp eq i32 %.156.lcssa, 0
  br i1 %443, label %.thread, label %454

.thread:                                          ; preds = %442
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.016.lcssa)
  br label %405

; <label>:444:                                    ; preds = %440
  %445 = getelementptr inbounds i8, i8* %.1112.lcssa, i64 1
  %446 = load i8, i8* %.1112.lcssa, align 1
  %447 = zext i8 %446 to i64
  %448 = getelementptr inbounds i8, i8* %11, i64 %447
  %449 = load i8, i8* %448, align 1
  %450 = zext i8 %449 to i32
  %451 = shl i32 %450, %.156.lcssa
  %452 = or i32 %451, %.132.lcssa
  %453 = add nsw i32 %.156.lcssa, 8
  br label %454

; <label>:454:                                    ; preds = %438, %442, %444
  %.33144 = phi i8* [ %.1112.lcssa, %438 ], [ %445, %444 ], [ %.1112.lcssa, %442 ]
  %.3388 = phi i32 [ %.156.lcssa, %438 ], [ %453, %444 ], [ 1, %442 ]
  %.33 = phi i32 [ %.132.lcssa, %438 ], [ %452, %444 ], [ %.132.lcssa, %442 ]
  %455 = and i32 %.33, 1
  %456 = icmp eq i32 %455, 0
  br i1 %456, label %.loopexit221, label %457

; <label>:457:                                    ; preds = %454
  %458 = lshr i32 %.33, 1
  %459 = add nsw i32 %.3388, -1
  br label %460

; <label>:460:                                    ; preds = %435, %457
  %.34145 = phi i8* [ %.33144, %457 ], [ %.1112.lcssa, %435 ]
  %.3489 = phi i32 [ %459, %457 ], [ %.156.lcssa, %435 ]
  %.34 = phi i32 [ %458, %457 ], [ %.132.lcssa, %435 ]
  store i32 %.092.lcssa, i32* %.0148.ph514, align 4
  %461 = getelementptr inbounds i32, i32* %.0148.ph514, i64 1
  br label %.thread187

; <label>:462:                                    ; preds = %.us-lcssa484.us, %.loopexit221, %.loopexit205, %.loopexit208, %400, %403
  %.13161 = phi i32* [ %.0148.ph514, %.loopexit221 ], [ %382, %.us-lcssa484.us ], [ %.2150, %.loopexit205 ], [ %.3151, %.loopexit208 ], [ %384, %400 ], [ %384, %403 ]
  %.36147 = phi i8* [ %.27138, %.loopexit221 ], [ %.3114.lcssa249, %.us-lcssa484.us ], [ %.28139, %.loopexit205 ], [ %.29140, %.loopexit208 ], [ %.26137, %400 ], [ %.26137, %403 ]
  %.13105 = phi i32 [ %.092308, %.loopexit221 ], [ %.092.lcssa306, %.us-lcssa484.us ], [ %.698, %.loopexit205 ], [ %.799, %.loopexit208 ], [ %.092.lcssa307, %400 ], [ %.092.lcssa307, %403 ]
  %.3691 = phi i32 [ %.2782, %.loopexit221 ], [ %.lcssa236, %.us-lcssa484.us ], [ %.2883, %.loopexit205 ], [ %.2984, %.loopexit208 ], [ %.2681, %400 ], [ %.2681, %403 ]
  %.36 = phi i32 [ %.27, %.loopexit221 ], [ %.lcssa229, %.us-lcssa484.us ], [ %.28, %.loopexit205 ], [ %.29, %.loopexit208 ], [ %.2654, %400 ], [ %.2654, %403 ]
  %.130 = phi i32 [ %.029545, %.loopexit221 ], [ %.029545, %.us-lcssa484.us ], [ %.029545, %.loopexit205 ], [ %.029545, %.loopexit208 ], [ 1, %400 ], [ 1, %403 ]
  %.1528 = phi i32 [ %.016283, %.loopexit221 ], [ %.016.lcssa281, %.us-lcssa484.us ], [ %.622, %.loopexit205 ], [ %.723, %.loopexit208 ], [ %.016.lcssa282, %400 ], [ %.016.lcssa282, %403 ]
  %463 = icmp eq i32 %.13105, 0
  br i1 %463, label %.thread187, label %464

; <label>:464:                                    ; preds = %462
  store i32 %.13105, i32* %.13161, align 4
  %465 = getelementptr inbounds i32, i32* %.13161, i64 1
  br label %.thread187

.thread187.loopexit:                              ; preds = %.outer.backedge
  br label %.thread187

.thread187:                                       ; preds = %.thread187.loopexit, %33, %.outer._crit_edge, %460, %462, %464
  %.1528192 = phi i32 [ %.1528, %464 ], [ %.1528, %462 ], [ %.016.lcssa, %460 ], [ %.016.lcssa, %.outer._crit_edge ], [ 0, %33 ], [ %.016.ph.be, %.thread187.loopexit ]
  %.130191 = phi i32 [ %.130, %464 ], [ %.130, %462 ], [ %.029545, %460 ], [ %.029545, %.outer._crit_edge ], [ %.029545, %33 ], [ %.029545, %.thread187.loopexit ]
  %.36190 = phi i32 [ %.36, %464 ], [ %.36, %462 ], [ %.34, %460 ], [ %.132.lcssa, %.outer._crit_edge ], [ %.031544, %33 ], [ %.132.ph.be, %.thread187.loopexit ]
  %.3691189 = phi i32 [ %.3691, %464 ], [ %.3691, %462 ], [ %.3489, %460 ], [ %.156.lcssa, %.outer._crit_edge ], [ %.055543, %33 ], [ %.156.ph.be, %.thread187.loopexit ]
  %.36147188 = phi i8* [ %.36147, %464 ], [ %.36147, %462 ], [ %.34145, %460 ], [ %.1112.lcssa, %.outer._crit_edge ], [ %.0111542, %33 ], [ %.1112.ph.be, %.thread187.loopexit ]
  %.14162 = phi i32* [ %465, %464 ], [ %.13161, %462 ], [ %461, %460 ], [ %.0148.ph514, %.outer._crit_edge ], [ %34, %33 ], [ %.0148.ph.be, %.thread187.loopexit ]
  %466 = icmp eq i32 %.1528192, %9
  br i1 %466, label %492, label %467

; <label>:467:                                    ; preds = %.thread187
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @Fax4Decode.module, i64 0, i64 0), %struct.tiff* %0, i32 %.1528192, i32 %9)
  %468 = icmp sgt i32 %.1528192, %9
  %469 = icmp ugt i32* %.14162, %34
  %.173533 = and i1 %469, %468
  br i1 %.173533, label %.lr.ph537.preheader, label %._crit_edge538

.lr.ph537.preheader:                              ; preds = %467
  br label %.lr.ph537

.lr.ph537:                                        ; preds = %.lr.ph537.preheader, %.lr.ph537
  %.17535 = phi i32 [ %472, %.lr.ph537 ], [ %.1528192, %.lr.ph537.preheader ]
  %.15163534 = phi i32* [ %470, %.lr.ph537 ], [ %.14162, %.lr.ph537.preheader ]
  %470 = getelementptr inbounds i32, i32* %.15163534, i64 -1
  %471 = load i32, i32* %470, align 4
  %472 = sub i32 %.17535, %471
  %473 = icmp sgt i32 %472, %9
  %474 = icmp ugt i32* %470, %34
  %.173 = and i1 %474, %473
  br i1 %.173, label %.lr.ph537, label %._crit_edge538.loopexit

._crit_edge538.loopexit:                          ; preds = %.lr.ph537
  br label %._crit_edge538

._crit_edge538:                                   ; preds = %._crit_edge538.loopexit, %467
  %.15163.lcssa = phi i32* [ %.14162, %467 ], [ %470, %._crit_edge538.loopexit ]
  %.17.lcssa = phi i32 [ %.1528192, %467 ], [ %472, %._crit_edge538.loopexit ]
  %.lcssa395 = phi i1 [ %468, %467 ], [ %473, %._crit_edge538.loopexit ]
  %475 = icmp slt i32 %.17.lcssa, %9
  br i1 %475, label %476, label %488

; <label>:476:                                    ; preds = %._crit_edge538
  %477 = icmp sgt i32 %.17.lcssa, 0
  %..17 = select i1 %477, i32 %.17.lcssa, i32 0
  %478 = ptrtoint i32* %.15163.lcssa to i64
  %479 = ptrtoint i32* %34 to i64
  %480 = sub i64 %478, %479
  %481 = and i64 %480, 4
  %482 = icmp eq i64 %481, 0
  br i1 %482, label %485, label %483

; <label>:483:                                    ; preds = %476
  store i32 0, i32* %.15163.lcssa, align 4
  %484 = getelementptr inbounds i32, i32* %.15163.lcssa, i64 1
  br label %485

; <label>:485:                                    ; preds = %483, %476
  %.16164 = phi i32* [ %484, %483 ], [ %.15163.lcssa, %476 ]
  %486 = sub nsw i32 %9, %..17
  store i32 %486, i32* %.16164, align 4
  %487 = getelementptr inbounds i32, i32* %.16164, i64 1
  br label %492

; <label>:488:                                    ; preds = %._crit_edge538
  br i1 %.lcssa395, label %489, label %492

; <label>:489:                                    ; preds = %488
  %490 = getelementptr inbounds i32, i32* %.15163.lcssa, i64 2
  %491 = getelementptr inbounds i32, i32* %.15163.lcssa, i64 1
  store i32 %9, i32* %.15163.lcssa, align 4
  store i32 0, i32* %491, align 4
  br label %492

; <label>:492:                                    ; preds = %485, %489, %488, %.thread187
  %.19167 = phi i32* [ %.14162, %.thread187 ], [ %487, %485 ], [ %490, %489 ], [ %.15163.lcssa, %488 ]
  %493 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %28, align 8
  tail call void %493(i8* %.02556, i32* %34, i32* %.19167, i32 %9) #5
  store i32 0, i32* %.19167, align 4
  %494 = load i64, i64* %29, align 8
  %495 = load i64, i64* %30, align 8
  store i64 %495, i64* %29, align 8
  store i64 %494, i64* %30, align 8
  %496 = load i32, i32* %31, align 4
  %497 = sub i32 %.03555, %496
  %498 = icmp eq i32 %497, 0
  br i1 %498, label %.loopexit222.loopexit, label %.backedge

.backedge:                                        ; preds = %492
  %499 = zext i32 %496 to i64
  %500 = getelementptr inbounds i8, i8* %.02556, i64 %499
  %501 = load i32, i32* %32, align 8
  %502 = add i32 %501, 1
  store i32 %502, i32* %32, align 8
  %503 = icmp sgt i32 %497, 0
  br i1 %503, label %33, label %.loopexit222.loopexit

; <label>:504:                                    ; preds = %427, %431, %430, %407
  %.10158 = phi i32* [ %.5153, %407 ], [ %429, %427 ], [ %432, %431 ], [ %.6154.lcssa, %430 ]
  %505 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %506 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %505, align 8
  tail call void %506(i8* %.02556, i32* %34, i32* %.10158, i32 %9) #5
  br label %.loopexit222

.loopexit222.loopexit:                            ; preds = %.backedge, %492
  br label %.loopexit222

.loopexit222:                                     ; preds = %.loopexit222.loopexit, %4, %504
  %.029421 = phi i32 [ %.029545, %504 ], [ %19, %4 ], [ %.130191, %.loopexit222.loopexit ]
  %.055.sink = phi i32 [ 0, %504 ], [ %21, %4 ], [ %.3691189, %.loopexit222.loopexit ]
  %.031.sink = phi i32 [ %.30184, %504 ], [ %23, %4 ], [ %.36190, %.loopexit222.loopexit ]
  %.0111.sink196 = phi i8* [ %.30141179, %504 ], [ %13, %4 ], [ %.36147188, %.loopexit222.loopexit ]
  %.0 = phi i32 [ -1, %504 ], [ 1, %4 ], [ 1, %.loopexit222.loopexit ]
  store i32 %.055.sink, i32* %20, align 4
  store i32 %.031.sink, i32* %22, align 8
  store i32 %.029421, i32* %18, align 8
  %507 = bitcast i8** %12 to i64*
  %508 = load i64, i64* %507, align 8
  %509 = ptrtoint i8* %.0111.sink196 to i64
  %510 = load i32, i32* %14, align 8
  %511 = zext i32 %510 to i64
  %512 = sub i64 %508, %509
  %513 = add i64 %512, %511
  %514 = trunc i64 %513 to i32
  store i32 %514, i32* %14, align 8
  store i8* %.0111.sink196, i8** %12, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3EncodeState**
  %7 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %6, align 8
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 4
  %10 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 2
  %11 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 1
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  br label %13

; <label>:13:                                     ; preds = %.lr.ph, %.backedge
  %.03 = phi i32 [ %2, %.lr.ph ], [ %19, %.backedge ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %22, %.backedge ]
  %14 = load i8*, i8** %9, align 8
  %15 = load i32, i32* %10, align 8
  tail call fastcc void @Fax3Encode2DRow(%struct.tiff* nonnull %0, i8* %.012, i8* %14, i32 %15)
  %16 = load i8*, i8** %9, align 8
  %17 = load i32, i32* %11, align 4
  tail call void @_TIFFmemcpy(i8* %16, i8* %.012, i32 %17) #5
  %18 = load i32, i32* %11, align 4
  %19 = sub i32 %.03, %18
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge.loopexit, label %.backedge

.backedge:                                        ; preds = %13
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds i8, i8* %.012, i64 %21
  %23 = load i32, i32* %12, align 8
  %24 = add i32 %23, 1
  store i32 %24, i32* %12, align 8
  %25 = icmp sgt i32 %19, 0
  br i1 %25, label %13, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge, %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax4PostEncode(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %4 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  tail call fastcc void @Fax3PutBits(%struct.tiff* %0, i32 1, i32 12)
  tail call fastcc void @Fax3PutBits(%struct.tiff* %0, i32 1, i32 12)
  %5 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 8
  br i1 %7, label %25, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %12 = load i32, i32* %11, align 8
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %8
  %15 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %16

; <label>:16:                                     ; preds = %8, %14
  %17 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = trunc i32 %18 to i8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  store i8* %22, i8** %20, align 8
  store i8 %19, i8* %21, align 1
  %23 = load i32, i32* %9, align 8
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %9, align 8
  store i32 0, i32* %17, align 8
  store i32 8, i32* %5, align 4
  br label %25

; <label>:25:                                     ; preds = %1, %16
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTRLE(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = tail call fastcc i32 @InitCCITTFax3(%struct.tiff* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %6, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 65536, i32 7) #5
  br label %10

; <label>:10:                                     ; preds = %2, %5
  %.0 = phi i32 [ %9, %5 ], [ 0, %2 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3DecodeRLE(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3DecodeState**
  %7 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %6, align 8
  %8 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 0
  %13 = load i32, i32* %12, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %17 = load i32, i32* %16, align 8
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %15, i64 %18
  %20 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 4
  %21 = load i32, i32* %20, align 8
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 3
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 2
  %25 = load i32, i32* %24, align 8
  %26 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 8
  %27 = load i32*, i32** %26, align 8
  %28 = icmp sgt i32 %2, 0
  br i1 %28, label %.preheader93.lr.ph, label %.loopexit94

.preheader93.lr.ph:                               ; preds = %4
  %29 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %30 = and i32 %13, 4
  %31 = icmp eq i32 %30, 0
  %32 = and i32 %13, 8
  %33 = icmp eq i32 %32, 0
  %34 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 1
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %36 = ptrtoint i32* %27 to i64
  br label %.preheader93

.preheader93:                                     ; preds = %.preheader93.lr.ph, %.backedge
  %.01185 = phi i8* [ %1, %.preheader93.lr.ph ], [ %220, %.backedge ]
  %.02184 = phi i32 [ %2, %.preheader93.lr.ph ], [ %217, %.backedge ]
  %.03182 = phi i32 [ %21, %.preheader93.lr.ph ], [ %.184, %.backedge ]
  %.019181 = phi i8* [ %15, %.preheader93.lr.ph ], [ %.16, %.backedge ]
  %.035180 = phi i32 [ %25, %.preheader93.lr.ph ], [ %.1550, %.backedge ]
  %.051179 = phi i32 [ %23, %.preheader93.lr.ph ], [ %.1566, %.backedge ]
  br label %37

; <label>:37:                                     ; preds = %.preheader93, %128
  %.152 = phi i32 [ %124, %128 ], [ %.051179, %.preheader93 ]
  %.136 = phi i32 [ %125, %128 ], [ %.035180, %.preheader93 ]
  %.120 = phi i8* [ %.1130, %128 ], [ %.019181, %.preheader93 ]
  %.06 = phi i32 [ %133, %128 ], [ 0, %.preheader93 ]
  %.04 = phi i32* [ %132, %128 ], [ %27, %.preheader93 ]
  br label %38

; <label>:38:                                     ; preds = %85, %37
  %.168 = phi i32 [ 0, %37 ], [ %88, %85 ]
  %.253 = phi i32 [ %.152, %37 ], [ %73, %85 ]
  %.237 = phi i32 [ %.136, %37 ], [ %74, %85 ]
  %.221 = phi i8* [ %.120, %37 ], [ %.625, %85 ]
  %.17 = phi i32 [ %.06, %37 ], [ %89, %85 ]
  %39 = icmp slt i32 %.253, 12
  br i1 %39, label %40, label %67

; <label>:40:                                     ; preds = %38
  %41 = icmp ult i8* %.221, %19
  br i1 %41, label %44, label %42

; <label>:42:                                     ; preds = %40
  %43 = icmp eq i32 %.253, 0
  br i1 %43, label %.loopexit.loopexit403, label %67

; <label>:44:                                     ; preds = %40
  %45 = getelementptr inbounds i8, i8* %.221, i64 1
  %46 = load i8, i8* %.221, align 1
  %47 = zext i8 %46 to i64
  %48 = getelementptr inbounds i8, i8* %11, i64 %47
  %49 = load i8, i8* %48, align 1
  %50 = zext i8 %49 to i32
  %51 = shl i32 %50, %.253
  %52 = or i32 %51, %.237
  %53 = add nsw i32 %.253, 8
  %54 = icmp slt i32 %53, 12
  br i1 %54, label %55, label %67

; <label>:55:                                     ; preds = %44
  %56 = icmp ult i8* %45, %19
  br i1 %56, label %57, label %67

; <label>:57:                                     ; preds = %55
  %58 = getelementptr inbounds i8, i8* %.221, i64 2
  %59 = load i8, i8* %45, align 1
  %60 = zext i8 %59 to i64
  %61 = getelementptr inbounds i8, i8* %11, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = zext i8 %62 to i32
  %64 = shl i32 %63, %53
  %65 = or i32 %64, %52
  %66 = add nsw i32 %.253, 16
  br label %67

; <label>:67:                                     ; preds = %38, %44, %55, %57, %42
  %.657 = phi i32 [ %.253, %38 ], [ 12, %42 ], [ %53, %44 ], [ %66, %57 ], [ 12, %55 ]
  %.641 = phi i32 [ %.237, %38 ], [ %.237, %42 ], [ %52, %44 ], [ %65, %57 ], [ %52, %55 ]
  %.625 = phi i8* [ %.221, %38 ], [ %.221, %42 ], [ %45, %44 ], [ %58, %57 ], [ %45, %55 ]
  %68 = and i32 %.641, 4095
  %69 = zext i32 %68 to i64
  %70 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %69, i32 1
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = sub nsw i32 %.657, %72
  %74 = lshr i32 %.641, %72
  %75 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %69, i32 0
  %76 = load i8, i8* %75, align 4
  switch i8 %76, label %84 [
    i8 12, label %.loopexit90.loopexit404
    i8 7, label %77
    i8 9, label %85
    i8 11, label %85
  ]

; <label>:77:                                     ; preds = %67
  %78 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %69, i32 2
  %79 = load i32, i32* %78, align 4
  %80 = add i32 %79, %.168
  %81 = getelementptr inbounds i32, i32* %.04, i64 1
  store i32 %80, i32* %.04, align 4
  %82 = add i32 %79, %.17
  %83 = icmp slt i32 %82, %9
  br i1 %83, label %.preheader.preheader, label %.thread.loopexit

.preheader.preheader:                             ; preds = %77
  br label %.preheader

; <label>:84:                                     ; preds = %67
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i64 0, i64 0), %struct.tiff* %0, i32 %.17)
  br label %.loopexit90

; <label>:85:                                     ; preds = %67, %67
  %86 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %69, i32 2
  %87 = load i32, i32* %86, align 4
  %88 = add i32 %87, %.168
  %89 = add i32 %87, %.17
  br label %38

.preheader:                                       ; preds = %.preheader.preheader, %136
  %.269 = phi i32 [ %139, %136 ], [ 0, %.preheader.preheader ]
  %.758 = phi i32 [ %124, %136 ], [ %73, %.preheader.preheader ]
  %.742 = phi i32 [ %125, %136 ], [ %74, %.preheader.preheader ]
  %.726 = phi i8* [ %.1130, %136 ], [ %.625, %.preheader.preheader ]
  %.28 = phi i32 [ %140, %136 ], [ %82, %.preheader.preheader ]
  %90 = icmp slt i32 %.758, 13
  br i1 %90, label %91, label %118

; <label>:91:                                     ; preds = %.preheader
  %92 = icmp ult i8* %.726, %19
  br i1 %92, label %95, label %93

; <label>:93:                                     ; preds = %91
  %94 = icmp eq i32 %.758, 0
  br i1 %94, label %.loopexit.loopexit, label %118

; <label>:95:                                     ; preds = %91
  %96 = getelementptr inbounds i8, i8* %.726, i64 1
  %97 = load i8, i8* %.726, align 1
  %98 = zext i8 %97 to i64
  %99 = getelementptr inbounds i8, i8* %11, i64 %98
  %100 = load i8, i8* %99, align 1
  %101 = zext i8 %100 to i32
  %102 = shl i32 %101, %.758
  %103 = or i32 %102, %.742
  %104 = add nsw i32 %.758, 8
  %105 = icmp slt i32 %104, 13
  br i1 %105, label %106, label %118

; <label>:106:                                    ; preds = %95
  %107 = icmp ult i8* %96, %19
  br i1 %107, label %108, label %118

; <label>:108:                                    ; preds = %106
  %109 = getelementptr inbounds i8, i8* %.726, i64 2
  %110 = load i8, i8* %96, align 1
  %111 = zext i8 %110 to i64
  %112 = getelementptr inbounds i8, i8* %11, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = zext i8 %113 to i32
  %115 = shl i32 %114, %104
  %116 = or i32 %115, %103
  %117 = add nsw i32 %.758, 16
  br label %118

; <label>:118:                                    ; preds = %.preheader, %95, %106, %108, %93
  %.1162 = phi i32 [ %.758, %.preheader ], [ 13, %93 ], [ %104, %95 ], [ %117, %108 ], [ 13, %106 ]
  %.1146 = phi i32 [ %.742, %.preheader ], [ %.742, %93 ], [ %103, %95 ], [ %116, %108 ], [ %103, %106 ]
  %.1130 = phi i8* [ %.726, %.preheader ], [ %.726, %93 ], [ %96, %95 ], [ %109, %108 ], [ %96, %106 ]
  %119 = and i32 %.1146, 8191
  %120 = zext i32 %119 to i64
  %121 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %120, i32 1
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i32
  %124 = sub nsw i32 %.1162, %123
  %125 = lshr i32 %.1146, %123
  %126 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %120, i32 0
  %127 = load i8, i8* %126, align 4
  switch i8 %127, label %135 [
    i8 12, label %.loopexit90.loopexit
    i8 8, label %128
    i8 10, label %136
    i8 11, label %136
  ]

; <label>:128:                                    ; preds = %118
  %129 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %120, i32 2
  %130 = load i32, i32* %129, align 4
  %131 = add i32 %130, %.269
  %132 = getelementptr inbounds i32, i32* %.04, i64 2
  store i32 %131, i32* %81, align 4
  %133 = add i32 %130, %.28
  %134 = icmp slt i32 %133, %9
  br i1 %134, label %37, label %.thread.loopexit

; <label>:135:                                    ; preds = %118
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i64 0, i64 0), %struct.tiff* %0, i32 %.28)
  br label %.loopexit90

; <label>:136:                                    ; preds = %118, %118
  %137 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %120, i32 2
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, %.269
  %140 = add i32 %138, %.28
  br label %.preheader

.loopexit.loopexit:                               ; preds = %93
  br label %.loopexit

.loopexit.loopexit403:                            ; preds = %42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit403, %.loopexit.loopexit
  %.370 = phi i32 [ %.269, %.loopexit.loopexit ], [ %.168, %.loopexit.loopexit403 ]
  %.1247 = phi i32 [ %.742, %.loopexit.loopexit ], [ %.237, %.loopexit.loopexit403 ]
  %.1231 = phi i8* [ %.726, %.loopexit.loopexit ], [ %.221, %.loopexit.loopexit403 ]
  %.39 = phi i32 [ %.28, %.loopexit.loopexit ], [ %.17, %.loopexit.loopexit403 ]
  %.15 = phi i32* [ %81, %.loopexit.loopexit ], [ %.04, %.loopexit.loopexit403 ]
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i64 0, i64 0), %struct.tiff* %0, i32 %.39)
  %141 = icmp eq i32 %.370, 0
  br i1 %141, label %144, label %142

; <label>:142:                                    ; preds = %.loopexit
  store i32 %.370, i32* %.15, align 4
  %143 = getelementptr inbounds i32, i32* %.15, i64 1
  br label %144

; <label>:144:                                    ; preds = %.loopexit, %142
  %.2 = phi i32* [ %143, %142 ], [ %.15, %.loopexit ]
  %145 = icmp eq i32 %.39, %9
  br i1 %145, label %224, label %146

; <label>:146:                                    ; preds = %144
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i64 0, i64 0), %struct.tiff* %0, i32 %.39, i32 %9)
  %147 = icmp sgt i32 %.39, %9
  %148 = icmp ugt i32* %.2, %27
  %.165 = and i1 %147, %148
  br i1 %.165, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %146
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.3167 = phi i32* [ %149, %.lr.ph ], [ %.2, %.lr.ph.preheader ]
  %.511166 = phi i32 [ %151, %.lr.ph ], [ %.39, %.lr.ph.preheader ]
  %149 = getelementptr inbounds i32, i32* %.3167, i64 -1
  %150 = load i32, i32* %149, align 4
  %151 = sub i32 %.511166, %150
  %152 = icmp sgt i32 %151, %9
  %153 = icmp ugt i32* %149, %27
  %. = and i1 %152, %153
  br i1 %., label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %146
  %.511.lcssa = phi i32 [ %.39, %146 ], [ %151, %._crit_edge.loopexit ]
  %.3.lcssa = phi i32* [ %.2, %146 ], [ %149, %._crit_edge.loopexit ]
  %.lcssa = phi i1 [ %147, %146 ], [ %152, %._crit_edge.loopexit ]
  %154 = icmp slt i32 %.511.lcssa, %9
  br i1 %154, label %155, label %167

; <label>:155:                                    ; preds = %._crit_edge
  %156 = icmp sgt i32 %.511.lcssa, 0
  %..511 = select i1 %156, i32 %.511.lcssa, i32 0
  %157 = ptrtoint i32* %.3.lcssa to i64
  %158 = ptrtoint i32* %27 to i64
  %159 = sub i64 %157, %158
  %160 = and i64 %159, 4
  %161 = icmp eq i64 %160, 0
  br i1 %161, label %164, label %162

; <label>:162:                                    ; preds = %155
  store i32 0, i32* %.3.lcssa, align 4
  %163 = getelementptr inbounds i32, i32* %.3.lcssa, i64 1
  br label %164

; <label>:164:                                    ; preds = %162, %155
  %.4 = phi i32* [ %163, %162 ], [ %.3.lcssa, %155 ]
  %165 = sub nsw i32 %9, %..511
  store i32 %165, i32* %.4, align 4
  %166 = getelementptr inbounds i32, i32* %.4, i64 1
  br label %224

; <label>:167:                                    ; preds = %._crit_edge
  br i1 %.lcssa, label %168, label %224

; <label>:168:                                    ; preds = %167
  %169 = getelementptr inbounds i32, i32* %.3.lcssa, i64 2
  %170 = getelementptr inbounds i32, i32* %.3.lcssa, i64 1
  store i32 %9, i32* %.3.lcssa, align 4
  store i32 0, i32* %170, align 4
  br label %224

.loopexit90.loopexit:                             ; preds = %118
  br label %.loopexit90

.loopexit90.loopexit404:                          ; preds = %67
  br label %.loopexit90

.loopexit90:                                      ; preds = %.loopexit90.loopexit404, %.loopexit90.loopexit, %84, %135
  %.673 = phi i32 [ %.168, %84 ], [ %.269, %135 ], [ %.269, %.loopexit90.loopexit ], [ %.168, %.loopexit90.loopexit404 ]
  %.1364 = phi i32 [ %73, %84 ], [ %124, %135 ], [ %124, %.loopexit90.loopexit ], [ %73, %.loopexit90.loopexit404 ]
  %.1348 = phi i32 [ %74, %84 ], [ %125, %135 ], [ %125, %.loopexit90.loopexit ], [ %74, %.loopexit90.loopexit404 ]
  %.1332 = phi i8* [ %.625, %84 ], [ %.1130, %135 ], [ %.1130, %.loopexit90.loopexit ], [ %.625, %.loopexit90.loopexit404 ]
  %.814 = phi i32 [ %.17, %84 ], [ %.28, %135 ], [ %.28, %.loopexit90.loopexit ], [ %.17, %.loopexit90.loopexit404 ]
  %.8 = phi i32* [ %.04, %84 ], [ %81, %135 ], [ %81, %.loopexit90.loopexit ], [ %.04, %.loopexit90.loopexit404 ]
  %.1 = phi i32 [ %.03182, %84 ], [ %.03182, %135 ], [ 1, %.loopexit90.loopexit ], [ 1, %.loopexit90.loopexit404 ]
  %171 = icmp eq i32 %.673, 0
  br i1 %171, label %.thread, label %172

; <label>:172:                                    ; preds = %.loopexit90
  store i32 %.673, i32* %.8, align 4
  %173 = getelementptr inbounds i32, i32* %.8, i64 1
  br label %.thread

.thread.loopexit:                                 ; preds = %77, %128
  %.81483.ph = phi i32 [ %133, %128 ], [ %82, %77 ]
  %.133282.ph = phi i8* [ %.1130, %128 ], [ %.625, %77 ]
  %.134881.ph = phi i32 [ %125, %128 ], [ %74, %77 ]
  %.136480.ph = phi i32 [ %124, %128 ], [ %73, %77 ]
  %.9.ph = phi i32* [ %132, %128 ], [ %81, %77 ]
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.loopexit90, %172
  %.184 = phi i32 [ %.1, %172 ], [ %.1, %.loopexit90 ], [ %.03182, %.thread.loopexit ]
  %.81483 = phi i32 [ %.814, %172 ], [ %.814, %.loopexit90 ], [ %.81483.ph, %.thread.loopexit ]
  %.133282 = phi i8* [ %.1332, %172 ], [ %.1332, %.loopexit90 ], [ %.133282.ph, %.thread.loopexit ]
  %.134881 = phi i32 [ %.1348, %172 ], [ %.1348, %.loopexit90 ], [ %.134881.ph, %.thread.loopexit ]
  %.136480 = phi i32 [ %.1364, %172 ], [ %.1364, %.loopexit90 ], [ %.136480.ph, %.thread.loopexit ]
  %.9 = phi i32* [ %173, %172 ], [ %.8, %.loopexit90 ], [ %.9.ph, %.thread.loopexit ]
  %174 = icmp eq i32 %.81483, %9
  br i1 %174, label %199, label %175

; <label>:175:                                    ; preds = %.thread
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @Fax3DecodeRLE.module, i64 0, i64 0), %struct.tiff* %0, i32 %.81483, i32 %9)
  %176 = icmp sgt i32 %.81483, %9
  %177 = icmp ugt i32* %.9, %27
  %.76170 = and i1 %176, %177
  br i1 %.76170, label %.lr.ph174.preheader, label %._crit_edge175

.lr.ph174.preheader:                              ; preds = %175
  br label %.lr.ph174

.lr.ph174:                                        ; preds = %.lr.ph174.preheader, %.lr.ph174
  %.10172 = phi i32* [ %178, %.lr.ph174 ], [ %.9, %.lr.ph174.preheader ]
  %.1016171 = phi i32 [ %180, %.lr.ph174 ], [ %.81483, %.lr.ph174.preheader ]
  %178 = getelementptr inbounds i32, i32* %.10172, i64 -1
  %179 = load i32, i32* %178, align 4
  %180 = sub i32 %.1016171, %179
  %181 = icmp sgt i32 %180, %9
  %182 = icmp ugt i32* %178, %27
  %.76 = and i1 %181, %182
  br i1 %.76, label %.lr.ph174, label %._crit_edge175.loopexit

._crit_edge175.loopexit:                          ; preds = %.lr.ph174
  br label %._crit_edge175

._crit_edge175:                                   ; preds = %._crit_edge175.loopexit, %175
  %.1016.lcssa = phi i32 [ %.81483, %175 ], [ %180, %._crit_edge175.loopexit ]
  %.10.lcssa = phi i32* [ %.9, %175 ], [ %178, %._crit_edge175.loopexit ]
  %.lcssa151 = phi i1 [ %176, %175 ], [ %181, %._crit_edge175.loopexit ]
  %183 = icmp slt i32 %.1016.lcssa, %9
  br i1 %183, label %184, label %195

; <label>:184:                                    ; preds = %._crit_edge175
  %185 = icmp sgt i32 %.1016.lcssa, 0
  %..1016 = select i1 %185, i32 %.1016.lcssa, i32 0
  %186 = ptrtoint i32* %.10.lcssa to i64
  %187 = sub i64 %186, %36
  %188 = and i64 %187, 4
  %189 = icmp eq i64 %188, 0
  br i1 %189, label %192, label %190

; <label>:190:                                    ; preds = %184
  store i32 0, i32* %.10.lcssa, align 4
  %191 = getelementptr inbounds i32, i32* %.10.lcssa, i64 1
  br label %192

; <label>:192:                                    ; preds = %190, %184
  %.11 = phi i32* [ %191, %190 ], [ %.10.lcssa, %184 ]
  %193 = sub nsw i32 %9, %..1016
  store i32 %193, i32* %.11, align 4
  %194 = getelementptr inbounds i32, i32* %.11, i64 1
  br label %199

; <label>:195:                                    ; preds = %._crit_edge175
  br i1 %.lcssa151, label %196, label %199

; <label>:196:                                    ; preds = %195
  %197 = getelementptr inbounds i32, i32* %.10.lcssa, i64 2
  %198 = getelementptr inbounds i32, i32* %.10.lcssa, i64 1
  store i32 %9, i32* %.10.lcssa, align 4
  store i32 0, i32* %198, align 4
  br label %199

; <label>:199:                                    ; preds = %192, %196, %195, %.thread
  %.14 = phi i32* [ %.9, %.thread ], [ %194, %192 ], [ %197, %196 ], [ %.10.lcssa, %195 ]
  %200 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %29, align 8
  tail call void %200(i8* %.01185, i32* %27, i32* %.14, i32 %9) #5
  br i1 %31, label %205, label %201

; <label>:201:                                    ; preds = %199
  %202 = and i32 %.136480, 7
  %203 = lshr i32 %.134881, %202
  %204 = sub nsw i32 %.136480, %202
  br label %215

; <label>:205:                                    ; preds = %199
  br i1 %33, label %215, label %206

; <label>:206:                                    ; preds = %205
  %207 = and i32 %.136480, 15
  %208 = sub nsw i32 %.136480, %207
  %209 = lshr i32 %.134881, %207
  %210 = icmp eq i32 %208, 0
  %211 = ptrtoint i8* %.133282 to i64
  %212 = and i64 %211, 1
  %213 = icmp eq i64 %212, 0
  %214 = getelementptr inbounds i8, i8* %.133282, i64 1
  %.1332. = select i1 %213, i8* %.133282, i8* %214
  %.1332...133282 = select i1 %210, i8* %.1332., i8* %.133282
  br label %215

; <label>:215:                                    ; preds = %206, %205, %201
  %.1566 = phi i32 [ %204, %201 ], [ %.136480, %205 ], [ %208, %206 ]
  %.1550 = phi i32 [ %203, %201 ], [ %.134881, %205 ], [ %209, %206 ]
  %.16 = phi i8* [ %.133282, %201 ], [ %.133282, %205 ], [ %.1332...133282, %206 ]
  %216 = load i32, i32* %34, align 4
  %217 = sub i32 %.02184, %216
  %218 = icmp eq i32 %217, 0
  br i1 %218, label %.loopexit94.loopexit, label %.backedge

.backedge:                                        ; preds = %215
  %219 = zext i32 %216 to i64
  %220 = getelementptr inbounds i8, i8* %.01185, i64 %219
  %221 = load i32, i32* %35, align 8
  %222 = add i32 %221, 1
  store i32 %222, i32* %35, align 8
  %223 = icmp sgt i32 %217, 0
  br i1 %223, label %.preheader93, label %.loopexit94.loopexit

; <label>:224:                                    ; preds = %164, %168, %167, %144
  %.7 = phi i32* [ %.2, %144 ], [ %166, %164 ], [ %169, %168 ], [ %.3.lcssa, %167 ]
  %225 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %226 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %225, align 8
  tail call void %226(i8* %.01185, i32* %27, i32* %.7, i32 %9) #5
  br label %.loopexit94

.loopexit94.loopexit:                             ; preds = %.backedge, %215
  br label %.loopexit94

.loopexit94:                                      ; preds = %.loopexit94.loopexit, %4, %224
  %.03157 = phi i32 [ %.03182, %224 ], [ %21, %4 ], [ %.184, %.loopexit94.loopexit ]
  %.051.sink = phi i32 [ 0, %224 ], [ %23, %4 ], [ %.1566, %.loopexit94.loopexit ]
  %.035.sink = phi i32 [ %.1247, %224 ], [ %25, %4 ], [ %.1550, %.loopexit94.loopexit ]
  %.019.sink89 = phi i8* [ %.1231, %224 ], [ %15, %4 ], [ %.16, %.loopexit94.loopexit ]
  %.0 = phi i32 [ -1, %224 ], [ 1, %4 ], [ 1, %.loopexit94.loopexit ]
  store i32 %.051.sink, i32* %22, align 4
  store i32 %.035.sink, i32* %24, align 8
  store i32 %.03157, i32* %20, align 8
  %227 = bitcast i8** %14 to i64*
  %228 = load i64, i64* %227, align 8
  %229 = ptrtoint i8* %.019.sink89 to i64
  %230 = load i32, i32* %16, align 8
  %231 = zext i32 %230 to i64
  %232 = sub i64 %228, %229
  %233 = add i64 %232, %231
  %234 = trunc i64 %233 to i32
  store i32 %234, i32* %16, align 8
  store i8* %.019.sink89, i8** %14, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitCCITTRLEW(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = tail call fastcc i32 @InitCCITTFax3(%struct.tiff* %0)
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %10, label %5

; <label>:5:                                      ; preds = %2
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %6, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3DecodeRLE, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = tail call i32 (%struct.tiff*, i32, ...) @TIFFSetField(%struct.tiff* %0, i32 65536, i32 11) #5
  br label %10

; <label>:10:                                     ; preds = %2, %5
  %.0 = phi i32 [ %9, %5 ], [ 0, %2 ]
  ret i32 %.0
}

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #2

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3VGetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3BaseState**
  %6 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  switch i32 %1, label %186 [
    i32 65536, label %7
    i32 65540, label %26
    i32 292, label %52
    i32 293, label %52
    i32 326, label %71
    i32 327, label %90
    i32 328, label %109
    i32 34908, label %128
    i32 34909, label %147
    i32 34910, label %167
  ]

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %11 = load i32, i32* %10, align 8
  %12 = icmp ult i32 %11, 41
  br i1 %12, label %13, label %19

; <label>:13:                                     ; preds = %7
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %15 = load i8*, i8** %14, align 8
  %16 = sext i32 %11 to i64
  %17 = getelementptr i8, i8* %15, i64 %16
  %18 = add i32 %11, 8
  store i32 %18, i32* %10, align 8
  br label %23

; <label>:19:                                     ; preds = %7
  %20 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr i8, i8* %21, i64 8
  store i8* %22, i8** %20, align 8
  br label %23

; <label>:23:                                     ; preds = %19, %13
  %.in8 = phi i8* [ %17, %13 ], [ %21, %19 ]
  %24 = bitcast i8* %.in8 to i32**
  %25 = load i32*, i32** %24, align 8
  store i32 %9, i32* %25, align 4
  br label %190

; <label>:26:                                     ; preds = %3
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %28 = load i32, i32* %27, align 4
  %29 = icmp eq i32 %28, 0
  br i1 %29, label %30, label %190

; <label>:30:                                     ; preds = %26
  %31 = bitcast i8** %4 to %struct.Fax3DecodeState**
  %32 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %31, align 8
  %33 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %32, i64 0, i32 5
  %34 = bitcast void (i8*, i32*, i32*, i32)** %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %37 = load i32, i32* %36, align 8
  %38 = icmp ult i32 %37, 41
  br i1 %38, label %39, label %45

; <label>:39:                                     ; preds = %30
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %41 = load i8*, i8** %40, align 8
  %42 = sext i32 %37 to i64
  %43 = getelementptr i8, i8* %41, i64 %42
  %44 = add i32 %37, 8
  store i32 %44, i32* %36, align 8
  br label %49

; <label>:45:                                     ; preds = %30
  %46 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %47 = load i8*, i8** %46, align 8
  %48 = getelementptr i8, i8* %47, i64 8
  store i8* %48, i8** %46, align 8
  br label %49

; <label>:49:                                     ; preds = %45, %39
  %.in7 = phi i8* [ %43, %39 ], [ %47, %45 ]
  %50 = bitcast i8* %.in7 to i64**
  %51 = load i64*, i64** %50, align 8
  store i64 %35, i64* %51, align 8
  br label %190

; <label>:52:                                     ; preds = %3, %3
  %53 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 6
  %54 = load i32, i32* %53, align 8
  %55 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %56 = load i32, i32* %55, align 8
  %57 = icmp ult i32 %56, 41
  br i1 %57, label %58, label %64

; <label>:58:                                     ; preds = %52
  %59 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %60 = load i8*, i8** %59, align 8
  %61 = sext i32 %56 to i64
  %62 = getelementptr i8, i8* %60, i64 %61
  %63 = add i32 %56, 8
  store i32 %63, i32* %55, align 8
  br label %68

; <label>:64:                                     ; preds = %52
  %65 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %66 = load i8*, i8** %65, align 8
  %67 = getelementptr i8, i8* %66, i64 8
  store i8* %67, i8** %65, align 8
  br label %68

; <label>:68:                                     ; preds = %64, %58
  %.in6 = phi i8* [ %62, %58 ], [ %66, %64 ]
  %69 = bitcast i8* %.in6 to i32**
  %70 = load i32*, i32** %69, align 8
  store i32 %54, i32* %70, align 4
  br label %190

; <label>:71:                                     ; preds = %3
  %72 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 5
  %73 = load i32, i32* %72, align 4
  %74 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %75 = load i32, i32* %74, align 8
  %76 = icmp ult i32 %75, 41
  br i1 %76, label %77, label %83

; <label>:77:                                     ; preds = %71
  %78 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %79 = load i8*, i8** %78, align 8
  %80 = sext i32 %75 to i64
  %81 = getelementptr i8, i8* %79, i64 %80
  %82 = add i32 %75, 8
  store i32 %82, i32* %74, align 8
  br label %87

; <label>:83:                                     ; preds = %71
  %84 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %85 = load i8*, i8** %84, align 8
  %86 = getelementptr i8, i8* %85, i64 8
  store i8* %86, i8** %84, align 8
  br label %87

; <label>:87:                                     ; preds = %83, %77
  %.in5 = phi i8* [ %81, %77 ], [ %85, %83 ]
  %88 = bitcast i8* %.in5 to i32**
  %89 = load i32*, i32** %88, align 8
  store i32 %73, i32* %89, align 4
  br label %190

; <label>:90:                                     ; preds = %3
  %91 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 3
  %92 = load i16, i16* %91, align 4
  %93 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %94 = load i32, i32* %93, align 8
  %95 = icmp ult i32 %94, 41
  br i1 %95, label %96, label %102

; <label>:96:                                     ; preds = %90
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %98 = load i8*, i8** %97, align 8
  %99 = sext i32 %94 to i64
  %100 = getelementptr i8, i8* %98, i64 %99
  %101 = add i32 %94, 8
  store i32 %101, i32* %93, align 8
  br label %106

; <label>:102:                                    ; preds = %90
  %103 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %104 = load i8*, i8** %103, align 8
  %105 = getelementptr i8, i8* %104, i64 8
  store i8* %105, i8** %103, align 8
  br label %106

; <label>:106:                                    ; preds = %102, %96
  %.in4 = phi i8* [ %100, %96 ], [ %104, %102 ]
  %107 = bitcast i8* %.in4 to i16**
  %108 = load i16*, i16** %107, align 8
  store i16 %92, i16* %108, align 2
  br label %190

; <label>:109:                                    ; preds = %3
  %110 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 4
  %111 = load i32, i32* %110, align 8
  %112 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %113 = load i32, i32* %112, align 8
  %114 = icmp ult i32 %113, 41
  br i1 %114, label %115, label %121

; <label>:115:                                    ; preds = %109
  %116 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %117 = load i8*, i8** %116, align 8
  %118 = sext i32 %113 to i64
  %119 = getelementptr i8, i8* %117, i64 %118
  %120 = add i32 %113, 8
  store i32 %120, i32* %112, align 8
  br label %125

; <label>:121:                                    ; preds = %109
  %122 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %123 = load i8*, i8** %122, align 8
  %124 = getelementptr i8, i8* %123, i64 8
  store i8* %124, i8** %122, align 8
  br label %125

; <label>:125:                                    ; preds = %121, %115
  %.in3 = phi i8* [ %119, %115 ], [ %123, %121 ]
  %126 = bitcast i8* %.in3 to i32**
  %127 = load i32*, i32** %126, align 8
  store i32 %111, i32* %127, align 4
  br label %190

; <label>:128:                                    ; preds = %3
  %129 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 7
  %130 = load i32, i32* %129, align 4
  %131 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %132 = load i32, i32* %131, align 8
  %133 = icmp ult i32 %132, 41
  br i1 %133, label %134, label %140

; <label>:134:                                    ; preds = %128
  %135 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %136 = load i8*, i8** %135, align 8
  %137 = sext i32 %132 to i64
  %138 = getelementptr i8, i8* %136, i64 %137
  %139 = add i32 %132, 8
  store i32 %139, i32* %131, align 8
  br label %144

; <label>:140:                                    ; preds = %128
  %141 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %142 = load i8*, i8** %141, align 8
  %143 = getelementptr i8, i8* %142, i64 8
  store i8* %143, i8** %141, align 8
  br label %144

; <label>:144:                                    ; preds = %140, %134
  %.in2 = phi i8* [ %138, %134 ], [ %142, %140 ]
  %145 = bitcast i8* %.in2 to i32**
  %146 = load i32*, i32** %145, align 8
  store i32 %130, i32* %146, align 4
  br label %190

; <label>:147:                                    ; preds = %3
  %148 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 8
  %149 = bitcast i8** %148 to i64*
  %150 = load i64, i64* %149, align 8
  %151 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %152 = load i32, i32* %151, align 8
  %153 = icmp ult i32 %152, 41
  br i1 %153, label %154, label %160

; <label>:154:                                    ; preds = %147
  %155 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %156 = load i8*, i8** %155, align 8
  %157 = sext i32 %152 to i64
  %158 = getelementptr i8, i8* %156, i64 %157
  %159 = add i32 %152, 8
  store i32 %159, i32* %151, align 8
  br label %164

; <label>:160:                                    ; preds = %147
  %161 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %162 = load i8*, i8** %161, align 8
  %163 = getelementptr i8, i8* %162, i64 8
  store i8* %163, i8** %161, align 8
  br label %164

; <label>:164:                                    ; preds = %160, %154
  %.in1 = phi i8* [ %158, %154 ], [ %162, %160 ]
  %165 = bitcast i8* %.in1 to i64**
  %166 = load i64*, i64** %165, align 8
  store i64 %150, i64* %166, align 8
  br label %190

; <label>:167:                                    ; preds = %3
  %168 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 9
  %169 = load i32, i32* %168, align 8
  %170 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %171 = load i32, i32* %170, align 8
  %172 = icmp ult i32 %171, 41
  br i1 %172, label %173, label %179

; <label>:173:                                    ; preds = %167
  %174 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %175 = load i8*, i8** %174, align 8
  %176 = sext i32 %171 to i64
  %177 = getelementptr i8, i8* %175, i64 %176
  %178 = add i32 %171, 8
  store i32 %178, i32* %170, align 8
  br label %183

; <label>:179:                                    ; preds = %167
  %180 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %181 = load i8*, i8** %180, align 8
  %182 = getelementptr i8, i8* %181, i64 8
  store i8* %182, i8** %180, align 8
  br label %183

; <label>:183:                                    ; preds = %179, %173
  %.in = phi i8* [ %177, %173 ], [ %181, %179 ]
  %184 = bitcast i8* %.in to i32**
  %185 = load i32*, i32** %184, align 8
  store i32 %169, i32* %185, align 4
  br label %190

; <label>:186:                                    ; preds = %3
  %187 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 10
  %188 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %187, align 8
  %189 = tail call i32 %188(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #5
  br label %190

; <label>:190:                                    ; preds = %23, %68, %87, %106, %125, %144, %164, %183, %49, %26, %186
  %.0 = phi i32 [ %189, %186 ], [ 1, %26 ], [ 1, %49 ], [ 1, %183 ], [ 1, %164 ], [ 1, %144 ], [ 1, %125 ], [ 1, %106 ], [ 1, %87 ], [ 1, %68 ], [ 1, %23 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3VSetField(%struct.tiff*, i32, %struct.__va_list_tag*) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3BaseState**
  %6 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  switch i32 %1, label %177 [
    i32 65536, label %7
    i32 65540, label %25
    i32 292, label %50
    i32 293, label %50
    i32 326, label %68
    i32 327, label %86
    i32 328, label %105
    i32 34908, label %123
    i32 34909, label %141
    i32 34910, label %159
  ]

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = icmp ult i32 %9, 41
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %13 = load i8*, i8** %12, align 8
  %14 = sext i32 %9 to i64
  %15 = getelementptr i8, i8* %13, i64 %14
  %16 = add i32 %9, 8
  store i32 %16, i32* %8, align 8
  br label %21

; <label>:17:                                     ; preds = %7
  %18 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr i8, i8* %19, i64 8
  store i8* %20, i8** %18, align 8
  br label %21

; <label>:21:                                     ; preds = %17, %11
  %.in8 = phi i8* [ %15, %11 ], [ %19, %17 ]
  %22 = bitcast i8* %.in8 to i32*
  %23 = load i32, i32* %22, align 4
  %24 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 0
  store i32 %23, i32* %24, align 8
  br label %198

; <label>:25:                                     ; preds = %3
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %27 = load i32, i32* %26, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %198

; <label>:29:                                     ; preds = %25
  %30 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %31 = load i32, i32* %30, align 8
  %32 = icmp ult i32 %31, 41
  br i1 %32, label %33, label %39

; <label>:33:                                     ; preds = %29
  %34 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %35 = load i8*, i8** %34, align 8
  %36 = sext i32 %31 to i64
  %37 = getelementptr i8, i8* %35, i64 %36
  %38 = add i32 %31, 8
  store i32 %38, i32* %30, align 8
  br label %43

; <label>:39:                                     ; preds = %29
  %40 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %41 = load i8*, i8** %40, align 8
  %42 = getelementptr i8, i8* %41, i64 8
  store i8* %42, i8** %40, align 8
  br label %43

; <label>:43:                                     ; preds = %39, %33
  %.in7 = phi i8* [ %37, %33 ], [ %41, %39 ]
  %44 = bitcast i8* %.in7 to i64*
  %45 = load i64, i64* %44, align 8
  %46 = bitcast i8** %4 to %struct.Fax3DecodeState**
  %47 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %46, align 8
  %48 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %47, i64 0, i32 5
  %49 = bitcast void (i8*, i32*, i32*, i32)** %48 to i64*
  store i64 %45, i64* %49, align 8
  br label %198

; <label>:50:                                     ; preds = %3, %3
  %51 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %52 = load i32, i32* %51, align 8
  %53 = icmp ult i32 %52, 41
  br i1 %53, label %54, label %60

; <label>:54:                                     ; preds = %50
  %55 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %56 = load i8*, i8** %55, align 8
  %57 = sext i32 %52 to i64
  %58 = getelementptr i8, i8* %56, i64 %57
  %59 = add i32 %52, 8
  store i32 %59, i32* %51, align 8
  br label %64

; <label>:60:                                     ; preds = %50
  %61 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %62 = load i8*, i8** %61, align 8
  %63 = getelementptr i8, i8* %62, i64 8
  store i8* %63, i8** %61, align 8
  br label %64

; <label>:64:                                     ; preds = %60, %54
  %.in6 = phi i8* [ %58, %54 ], [ %62, %60 ]
  %65 = bitcast i8* %.in6 to i32*
  %66 = load i32, i32* %65, align 4
  %67 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 6
  store i32 %66, i32* %67, align 8
  br label %181

; <label>:68:                                     ; preds = %3
  %69 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %70 = load i32, i32* %69, align 8
  %71 = icmp ult i32 %70, 41
  br i1 %71, label %72, label %78

; <label>:72:                                     ; preds = %68
  %73 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %74 = load i8*, i8** %73, align 8
  %75 = sext i32 %70 to i64
  %76 = getelementptr i8, i8* %74, i64 %75
  %77 = add i32 %70, 8
  store i32 %77, i32* %69, align 8
  br label %82

; <label>:78:                                     ; preds = %68
  %79 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %80 = load i8*, i8** %79, align 8
  %81 = getelementptr i8, i8* %80, i64 8
  store i8* %81, i8** %79, align 8
  br label %82

; <label>:82:                                     ; preds = %78, %72
  %.in5 = phi i8* [ %76, %72 ], [ %80, %78 ]
  %83 = bitcast i8* %.in5 to i32*
  %84 = load i32, i32* %83, align 4
  %85 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 5
  store i32 %84, i32* %85, align 4
  br label %181

; <label>:86:                                     ; preds = %3
  %87 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %88 = load i32, i32* %87, align 8
  %89 = icmp ult i32 %88, 41
  br i1 %89, label %90, label %96

; <label>:90:                                     ; preds = %86
  %91 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %92 = load i8*, i8** %91, align 8
  %93 = sext i32 %88 to i64
  %94 = getelementptr i8, i8* %92, i64 %93
  %95 = add i32 %88, 8
  store i32 %95, i32* %87, align 8
  br label %100

; <label>:96:                                     ; preds = %86
  %97 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %98 = load i8*, i8** %97, align 8
  %99 = getelementptr i8, i8* %98, i64 8
  store i8* %99, i8** %97, align 8
  br label %100

; <label>:100:                                    ; preds = %96, %90
  %.in4 = phi i8* [ %94, %90 ], [ %98, %96 ]
  %101 = bitcast i8* %.in4 to i32*
  %102 = load i32, i32* %101, align 4
  %103 = trunc i32 %102 to i16
  %104 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 3
  store i16 %103, i16* %104, align 4
  br label %181

; <label>:105:                                    ; preds = %3
  %106 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %107 = load i32, i32* %106, align 8
  %108 = icmp ult i32 %107, 41
  br i1 %108, label %109, label %115

; <label>:109:                                    ; preds = %105
  %110 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %111 = load i8*, i8** %110, align 8
  %112 = sext i32 %107 to i64
  %113 = getelementptr i8, i8* %111, i64 %112
  %114 = add i32 %107, 8
  store i32 %114, i32* %106, align 8
  br label %119

; <label>:115:                                    ; preds = %105
  %116 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %117 = load i8*, i8** %116, align 8
  %118 = getelementptr i8, i8* %117, i64 8
  store i8* %118, i8** %116, align 8
  br label %119

; <label>:119:                                    ; preds = %115, %109
  %.in3 = phi i8* [ %113, %109 ], [ %117, %115 ]
  %120 = bitcast i8* %.in3 to i32*
  %121 = load i32, i32* %120, align 4
  %122 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 4
  store i32 %121, i32* %122, align 8
  br label %181

; <label>:123:                                    ; preds = %3
  %124 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %125 = load i32, i32* %124, align 8
  %126 = icmp ult i32 %125, 41
  br i1 %126, label %127, label %133

; <label>:127:                                    ; preds = %123
  %128 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %129 = load i8*, i8** %128, align 8
  %130 = sext i32 %125 to i64
  %131 = getelementptr i8, i8* %129, i64 %130
  %132 = add i32 %125, 8
  store i32 %132, i32* %124, align 8
  br label %137

; <label>:133:                                    ; preds = %123
  %134 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %135 = load i8*, i8** %134, align 8
  %136 = getelementptr i8, i8* %135, i64 8
  store i8* %136, i8** %134, align 8
  br label %137

; <label>:137:                                    ; preds = %133, %127
  %.in2 = phi i8* [ %131, %127 ], [ %135, %133 ]
  %138 = bitcast i8* %.in2 to i32*
  %139 = load i32, i32* %138, align 4
  %140 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 7
  store i32 %139, i32* %140, align 4
  br label %181

; <label>:141:                                    ; preds = %3
  %142 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 8
  %143 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %144 = load i32, i32* %143, align 8
  %145 = icmp ult i32 %144, 41
  br i1 %145, label %146, label %152

; <label>:146:                                    ; preds = %141
  %147 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %148 = load i8*, i8** %147, align 8
  %149 = sext i32 %144 to i64
  %150 = getelementptr i8, i8* %148, i64 %149
  %151 = add i32 %144, 8
  store i32 %151, i32* %143, align 8
  br label %156

; <label>:152:                                    ; preds = %141
  %153 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %154 = load i8*, i8** %153, align 8
  %155 = getelementptr i8, i8* %154, i64 8
  store i8* %155, i8** %153, align 8
  br label %156

; <label>:156:                                    ; preds = %152, %146
  %.in1 = phi i8* [ %150, %146 ], [ %154, %152 ]
  %157 = bitcast i8* %.in1 to i8**
  %158 = load i8*, i8** %157, align 8
  tail call void @_TIFFsetString(i8** %142, i8* %158) #5
  br label %181

; <label>:159:                                    ; preds = %3
  %160 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 0
  %161 = load i32, i32* %160, align 8
  %162 = icmp ult i32 %161, 41
  br i1 %162, label %163, label %169

; <label>:163:                                    ; preds = %159
  %164 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 3
  %165 = load i8*, i8** %164, align 8
  %166 = sext i32 %161 to i64
  %167 = getelementptr i8, i8* %165, i64 %166
  %168 = add i32 %161, 8
  store i32 %168, i32* %160, align 8
  br label %173

; <label>:169:                                    ; preds = %159
  %170 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %2, i64 0, i32 2
  %171 = load i8*, i8** %170, align 8
  %172 = getelementptr i8, i8* %171, i64 8
  store i8* %172, i8** %170, align 8
  br label %173

; <label>:173:                                    ; preds = %169, %163
  %.in = phi i8* [ %167, %163 ], [ %171, %169 ]
  %174 = bitcast i8* %.in to i32*
  %175 = load i32, i32* %174, align 4
  %176 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 9
  store i32 %175, i32* %176, align 8
  br label %181

; <label>:177:                                    ; preds = %3
  %178 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 11
  %179 = load i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)** %178, align 8
  %180 = tail call i32 %179(%struct.tiff* nonnull %0, i32 %1, %struct.__va_list_tag* %2) #5
  br label %198

; <label>:181:                                    ; preds = %173, %156, %137, %119, %100, %82, %64
  %182 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 %1) #5
  %183 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %182, i64 0, i32 4
  %184 = load i16, i16* %183, align 4
  %185 = and i16 %184, 31
  %186 = zext i16 %185 to i64
  %187 = shl i64 1, %186
  %188 = tail call %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nonnull %0, i32 %1) #5
  %189 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %188, i64 0, i32 4
  %190 = load i16, i16* %189, align 4
  %div = lshr i16 %190, 5
  %191 = zext i16 %div to i64
  %192 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 %191
  %193 = load i64, i64* %192, align 8
  %194 = or i64 %193, %187
  store i64 %194, i64* %192, align 8
  %195 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %196 = load i32, i32* %195, align 8
  %197 = or i32 %196, 8
  store i32 %197, i32* %195, align 8
  br label %198

; <label>:198:                                    ; preds = %25, %43, %181, %177, %21
  %.0 = phi i32 [ %180, %177 ], [ 1, %181 ], [ 1, %21 ], [ 1, %43 ], [ 1, %25 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3PrintDir(%struct.tiff* nocapture readonly, %struct._IO_FILE* nocapture, i64) #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3BaseState**
  %6 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %5, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 2
  %8 = load i64, i64* %7, align 8
  %9 = and i64 %8, 16
  %10 = icmp eq i64 %9, 0
  br i1 %10, label %48, label %11

; <label>:11:                                     ; preds = %3
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %13 = load i16, i16* %12, align 8
  %14 = icmp eq i16 %13, 4
  br i1 %14, label %15, label %23

; <label>:15:                                     ; preds = %11
  %16 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.13, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %1)
  %17 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 6
  %18 = load i32, i32* %17, align 8
  %19 = and i32 %18, 2
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %43, label %21

; <label>:21:                                     ; preds = %15
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  br label %43

; <label>:23:                                     ; preds = %11
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.15, i64 0, i64 0), i64 18, i64 1, %struct._IO_FILE* %1)
  %25 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 6
  %26 = load i32, i32* %25, align 8
  %27 = and i32 %26, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %23
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.16, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0))
  br label %31

; <label>:31:                                     ; preds = %23, %29
  %.0 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0), %29 ], [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i64 0, i64 0), %23 ]
  %32 = load i32, i32* %25, align 8
  %33 = and i32 %32, 4
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %37, label %35

; <label>:35:                                     ; preds = %31
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.18, i64 0, i64 0), i8* %.0)
  br label %37

; <label>:37:                                     ; preds = %31, %35
  %.1 = phi i8* [ getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i64 0, i64 0), %35 ], [ %.0, %31 ]
  %38 = load i32, i32* %25, align 8
  %39 = and i32 %38, 2
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %43, label %41

; <label>:41:                                     ; preds = %37
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.14, i64 0, i64 0), i8* %.1)
  br label %43

; <label>:43:                                     ; preds = %41, %37, %21, %15
  %44 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 6
  %45 = load i32, i32* %44, align 8
  %46 = zext i32 %45 to i64
  %47 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.19, i64 0, i64 0), i64 %46, i64 %46)
  br label %48

; <label>:48:                                     ; preds = %3, %43
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 0, i64 1
  %50 = load i64, i64* %49, align 8
  %51 = trunc i64 %50 to i32
  %52 = icmp slt i32 %51, 0
  br i1 %52, label %53, label %67

; <label>:53:                                     ; preds = %48
  %54 = tail call i64 @fwrite(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.20, i64 0, i64 0), i64 11, i64 1, %struct._IO_FILE* %1)
  %55 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 3
  %56 = load i16, i16* %55, align 4
  switch i16 %56, label %63 [
    i16 0, label %57
    i16 1, label %59
    i16 2, label %61
  ]

; <label>:57:                                     ; preds = %53
  %58 = tail call i64 @fwrite(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.21, i64 0, i64 0), i64 6, i64 1, %struct._IO_FILE* %1)
  br label %63

; <label>:59:                                     ; preds = %53
  %60 = tail call i64 @fwrite(i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.22, i64 0, i64 0), i64 21, i64 1, %struct._IO_FILE* %1)
  br label %63

; <label>:61:                                     ; preds = %53
  %62 = tail call i64 @fwrite(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.23, i64 0, i64 0), i64 19, i64 1, %struct._IO_FILE* %1)
  br label %63

; <label>:63:                                     ; preds = %61, %59, %57, %53
  %64 = load i16, i16* %55, align 4
  %65 = zext i16 %64 to i32
  %66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.24, i64 0, i64 0), i32 %65, i32 %65)
  br label %67

; <label>:67:                                     ; preds = %63, %48
  %68 = load i64, i64* %49, align 8
  %69 = and i64 %68, 1073741824
  %70 = icmp eq i64 %69, 0
  br i1 %70, label %76, label %71

; <label>:71:                                     ; preds = %67
  %72 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 5
  %73 = load i32, i32* %72, align 4
  %74 = zext i32 %73 to i64
  %75 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.25, i64 0, i64 0), i64 %74)
  br label %76

; <label>:76:                                     ; preds = %67, %71
  %77 = load i64, i64* %7, align 8
  %78 = and i64 %77, 1
  %79 = icmp eq i64 %78, 0
  br i1 %79, label %85, label %80

; <label>:80:                                     ; preds = %76
  %81 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 4
  %82 = load i32, i32* %81, align 8
  %83 = zext i32 %82 to i64
  %84 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.26, i64 0, i64 0), i64 %83)
  br label %85

; <label>:85:                                     ; preds = %76, %80
  %86 = load i64, i64* %7, align 8
  %87 = and i64 %86, 2
  %88 = icmp eq i64 %87, 0
  br i1 %88, label %94, label %89

; <label>:89:                                     ; preds = %85
  %90 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 7
  %91 = load i32, i32* %90, align 4
  %92 = zext i32 %91 to i64
  %93 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.27, i64 0, i64 0), i64 %92)
  br label %94

; <label>:94:                                     ; preds = %85, %89
  %95 = load i64, i64* %7, align 8
  %96 = and i64 %95, 4
  %97 = icmp eq i64 %96, 0
  br i1 %97, label %102, label %98

; <label>:98:                                     ; preds = %94
  %99 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 8
  %100 = load i8*, i8** %99, align 8
  %101 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.28, i64 0, i64 0), i8* %100)
  br label %102

; <label>:102:                                    ; preds = %94, %98
  %103 = load i64, i64* %7, align 8
  %104 = and i64 %103, 8
  %105 = icmp eq i64 %104, 0
  br i1 %105, label %111, label %106

; <label>:106:                                    ; preds = %102
  %107 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %6, i64 0, i32 9
  %108 = load i32, i32* %107, align 8
  %109 = zext i32 %108 to i64
  %110 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.29, i64 0, i64 0), i64 %109)
  br label %111

; <label>:111:                                    ; preds = %102, %106
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3SetupState(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.Fax3BaseState**
  %4 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %6 = load i16, i16* %5, align 4
  %7 = icmp eq i16 %6, 1
  br i1 %7, label %11, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %10 = load i8*, i8** %9, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %10, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @.str.30, i64 0, i64 0)) #5
  br label %84

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 1024
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %19, label %16

; <label>:16:                                     ; preds = %11
  %17 = tail call i32 @TIFFTileRowSize(%struct.tiff* nonnull %0) #5
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 4
  br label %22

; <label>:19:                                     ; preds = %11
  %20 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0) #5
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  br label %22

; <label>:22:                                     ; preds = %19, %16
  %.02.in = phi i32 [ %17, %16 ], [ %20, %19 ]
  %.01.in.in = phi i32* [ %18, %16 ], [ %21, %19 ]
  %.01.in = load i32, i32* %.01.in.in, align 4
  %23 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %4, i64 0, i32 1
  store i32 %.02.in, i32* %23, align 4
  %24 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %4, i64 0, i32 2
  store i32 %.01.in, i32* %24, align 8
  %25 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %4, i64 0, i32 6
  %26 = load i32, i32* %25, align 8
  %27 = and i32 %26, 1
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %33

; <label>:29:                                     ; preds = %22
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 10
  %31 = load i16, i16* %30, align 8
  %32 = icmp eq i16 %31, 4
  br label %33

; <label>:33:                                     ; preds = %22, %29
  %34 = phi i1 [ true, %22 ], [ %32, %29 ]
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %36 = load i32, i32* %35, align 4
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %72

; <label>:38:                                     ; preds = %33
  %39 = bitcast i8** %2 to %struct.Fax3DecodeState**
  %40 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %39, align 8
  %41 = shl i32 %.01.in, 1
  %42 = add i32 %41, 62
  %43 = and i32 %42, -64
  %..01.in = select i1 %34, i32 %43, i32 %.01.in
  %44 = shl i32 %..01.in, 2
  %45 = tail call i8* @_TIFFmalloc(i32 %44) #5
  %46 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i64 0, i32 6
  %47 = bitcast i32** %46 to i8**
  store i8* %45, i8** %47, align 8
  %48 = icmp eq i8* %45, null
  br i1 %48, label %49, label %52

; <label>:49:                                     ; preds = %38
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %51 = load i8*, i8** %50, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i64 0, i64 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.32, i64 0, i64 0), i8* %51) #5
  br label %84

; <label>:52:                                     ; preds = %38
  %53 = bitcast i32** %46 to i64*
  %54 = load i64, i64* %53, align 8
  %55 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i64 0, i32 8
  %56 = bitcast i32** %55 to i64*
  store i64 %54, i64* %56, align 8
  br i1 %34, label %57, label %62

; <label>:57:                                     ; preds = %52
  %58 = lshr i32 %..01.in, 1
  %59 = zext i32 %58 to i64
  %60 = load i32*, i32** %46, align 8
  %61 = getelementptr inbounds i32, i32* %60, i64 %59
  br label %62

; <label>:62:                                     ; preds = %52, %57
  %.sink = phi i32* [ %61, %57 ], [ null, %52 ]
  %63 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i64 0, i32 7
  store i32* %.sink, i32** %63, align 8
  %64 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %40, i64 0, i32 0, i32 6
  %65 = load i32, i32* %64, align 8
  %66 = and i32 %65, 1
  %67 = icmp eq i32 %66, 0
  br i1 %67, label %84, label %68

; <label>:68:                                     ; preds = %62
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %69, align 8
  %70 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %70, align 8
  %71 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @Fax3Decode2D, i32 (%struct.tiff*, i8*, i32, i16)** %71, align 8
  br label %84

; <label>:72:                                     ; preds = %33
  %73 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %74 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %73, align 8
  br i1 %34, label %75, label %82

; <label>:75:                                     ; preds = %72
  %76 = tail call i8* @_TIFFmalloc(i32 %.02.in) #5
  %77 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %74, i64 0, i32 4
  store i8* %76, i8** %77, align 8
  %78 = icmp eq i8* %76, null
  br i1 %78, label %79, label %84

; <label>:79:                                     ; preds = %75
  %80 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %81 = load i8*, i8** %80, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.31, i64 0, i64 0), i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.33, i64 0, i64 0), i8* %81) #5
  br label %84

; <label>:82:                                     ; preds = %72
  %83 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %74, i64 0, i32 4
  store i8* null, i8** %83, align 8
  br label %84

; <label>:84:                                     ; preds = %62, %68, %75, %82, %79, %49, %8
  %.0 = phi i32 [ 0, %8 ], [ 0, %49 ], [ 0, %79 ], [ 1, %82 ], [ 1, %75 ], [ 1, %68 ], [ 1, %62 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PreDecode(%struct.tiff* nocapture readonly, i16 zeroext) #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %4 = bitcast i8** %3 to %struct.Fax3DecodeState**
  %5 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %4, align 8
  %6 = icmp eq %struct.Fax3DecodeState* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 160, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.Fax3PreDecode, i64 0, i64 0)) #7
  unreachable

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 3
  store i32 0, i32* %9, align 4
  %10 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 2
  store i32 0, i32* %10, align 8
  %11 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 4
  store i32 0, i32* %11, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 13
  %13 = load i16, i16* %12, align 2
  %14 = icmp ne i16 %13, 2
  %15 = zext i1 %14 to i32
  %16 = tail call i8* @TIFFGetBitRevTable(i32 %15) #5
  %17 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 1
  store i8* %16, i8** %17, align 8
  %18 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 7
  %19 = load i32*, i32** %18, align 8
  %20 = icmp eq i32* %19, null
  br i1 %20, label %27, label %21

; <label>:21:                                     ; preds = %8
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %5, i64 0, i32 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = and i32 %23, 65535
  store i32 %24, i32* %19, align 4
  %25 = load i32*, i32** %18, align 8
  %26 = getelementptr inbounds i32, i32* %25, i64 1
  store i32 0, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %8, %21
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Decode1D(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3DecodeState**
  %7 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %6, align 8
  %8 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %13, i64 %16
  %18 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 4
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 8
  %25 = load i32*, i32** %24, align 8
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %.lr.ph258, label %.loopexit133

.lr.ph258:                                        ; preds = %4
  %27 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %28 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 1
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %30 = ptrtoint i32* %25 to i64
  br label %31

; <label>:31:                                     ; preds = %.lr.ph258, %.backedge
  %.01253 = phi i8* [ %1, %.lr.ph258 ], [ %264, %.backedge ]
  %.02252 = phi i32 [ %2, %.lr.ph258 ], [ %261, %.backedge ]
  %.03251 = phi i32 [ %19, %.lr.ph258 ], [ %.1120, %.backedge ]
  %.026250 = phi i8* [ %13, %.lr.ph258 ], [ %.22118, %.backedge ]
  %.048249 = phi i32 [ %23, %.lr.ph258 ], [ %.2371117, %.backedge ]
  %.073248 = phi i32 [ %21, %.lr.ph258 ], [ %.2396116, %.backedge ]
  %32 = icmp eq i32 %.03251, 0
  br i1 %32, label %.preheader131.preheader, label %.preheader129.preheader

.preheader131.preheader:                          ; preds = %31
  br label %.preheader131

.preheader129.preheader.loopexit:                 ; preds = %61
  br label %.preheader129.preheader

.preheader129.preheader:                          ; preds = %.preheader129.preheader.loopexit, %31
  %.780.ph = phi i32 [ %.073248, %31 ], [ %.578, %.preheader129.preheader.loopexit ]
  %.755.ph = phi i32 [ %.048249, %31 ], [ %.553, %.preheader129.preheader.loopexit ]
  %.733.ph = phi i8* [ %.026250, %31 ], [ %.531, %.preheader129.preheader.loopexit ]
  br label %.preheader129

.preheader131:                                    ; preds = %.preheader131.preheader, %64
  %.174 = phi i32 [ %66, %64 ], [ %.073248, %.preheader131.preheader ]
  %.149 = phi i32 [ %65, %64 ], [ %.048249, %.preheader131.preheader ]
  %.127 = phi i8* [ %.531, %64 ], [ %.026250, %.preheader131.preheader ]
  %33 = icmp slt i32 %.174, 11
  br i1 %33, label %34, label %61

; <label>:34:                                     ; preds = %.preheader131
  %35 = icmp ult i8* %.127, %17
  br i1 %35, label %38, label %36

; <label>:36:                                     ; preds = %34
  %37 = icmp eq i32 %.174, 0
  br i1 %37, label %.loopexit130.loopexit514, label %61

; <label>:38:                                     ; preds = %34
  %39 = getelementptr inbounds i8, i8* %.127, i64 1
  %40 = load i8, i8* %.127, align 1
  %41 = zext i8 %40 to i64
  %42 = getelementptr inbounds i8, i8* %11, i64 %41
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i32
  %45 = shl i32 %44, %.174
  %46 = or i32 %45, %.149
  %47 = add nsw i32 %.174, 8
  %48 = icmp slt i32 %47, 11
  br i1 %48, label %49, label %61

; <label>:49:                                     ; preds = %38
  %50 = icmp ult i8* %39, %17
  br i1 %50, label %51, label %61

; <label>:51:                                     ; preds = %49
  %52 = getelementptr inbounds i8, i8* %.127, i64 2
  %53 = load i8, i8* %39, align 1
  %54 = zext i8 %53 to i64
  %55 = getelementptr inbounds i8, i8* %11, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = shl i32 %57, %47
  %59 = or i32 %58, %46
  %60 = add nsw i32 %.174, 16
  br label %61

; <label>:61:                                     ; preds = %.preheader131, %38, %49, %51, %36
  %.578 = phi i32 [ %.174, %.preheader131 ], [ 11, %36 ], [ %47, %38 ], [ %60, %51 ], [ 11, %49 ]
  %.553 = phi i32 [ %.149, %.preheader131 ], [ %.149, %36 ], [ %46, %38 ], [ %59, %51 ], [ %46, %49 ]
  %.531 = phi i8* [ %.127, %.preheader131 ], [ %.127, %36 ], [ %39, %38 ], [ %52, %51 ], [ %39, %49 ]
  %62 = and i32 %.553, 2047
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %.preheader129.preheader.loopexit, label %64

; <label>:64:                                     ; preds = %61
  %65 = lshr i32 %.553, 1
  %66 = add nsw i32 %.578, -1
  br label %.preheader131

.preheader129:                                    ; preds = %.preheader129.preheader, %87
  %.780 = phi i32 [ %89, %87 ], [ %.780.ph, %.preheader129.preheader ]
  %.755 = phi i32 [ %88, %87 ], [ %.755.ph, %.preheader129.preheader ]
  %.733 = phi i8* [ %.935, %87 ], [ %.733.ph, %.preheader129.preheader ]
  %67 = icmp slt i32 %.780, 8
  br i1 %67, label %68, label %82

; <label>:68:                                     ; preds = %.preheader129
  %69 = icmp ult i8* %.733, %17
  br i1 %69, label %72, label %70

; <label>:70:                                     ; preds = %68
  %71 = icmp eq i32 %.780, 0
  br i1 %71, label %.loopexit130.loopexit, label %82

; <label>:72:                                     ; preds = %68
  %73 = getelementptr inbounds i8, i8* %.733, i64 1
  %74 = load i8, i8* %.733, align 1
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds i8, i8* %11, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = shl i32 %78, %.780
  %80 = or i32 %79, %.755
  %81 = add nsw i32 %.780, 8
  br label %82

; <label>:82:                                     ; preds = %.preheader129, %70, %72
  %.982 = phi i32 [ %.780, %.preheader129 ], [ %81, %72 ], [ 8, %70 ]
  %.957 = phi i32 [ %.755, %.preheader129 ], [ %80, %72 ], [ %.755, %70 ]
  %.935 = phi i8* [ %.733, %.preheader129 ], [ %73, %72 ], [ %.733, %70 ]
  %83 = and i32 %.957, 255
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %87, label %.preheader128

.preheader128:                                    ; preds = %82
  %85 = and i32 %.957, 1
  %86 = icmp eq i32 %85, 0
  br i1 %86, label %.lr.ph235.preheader, label %._crit_edge236

.lr.ph235.preheader:                              ; preds = %.preheader128
  br label %.lr.ph235

; <label>:87:                                     ; preds = %82
  %88 = lshr i32 %.957, 8
  %89 = add nsw i32 %.982, -8
  br label %.preheader129

.lr.ph235:                                        ; preds = %.lr.ph235.preheader, %.lr.ph235
  %.1058234 = phi i32 [ %90, %.lr.ph235 ], [ %.957, %.lr.ph235.preheader ]
  %.1083233 = phi i32 [ %91, %.lr.ph235 ], [ %.982, %.lr.ph235.preheader ]
  %90 = lshr i32 %.1058234, 1
  %91 = add nsw i32 %.1083233, -1
  %92 = and i32 %90, 1
  %93 = icmp eq i32 %92, 0
  br i1 %93, label %.lr.ph235, label %._crit_edge236.loopexit

._crit_edge236.loopexit:                          ; preds = %.lr.ph235
  br label %._crit_edge236

._crit_edge236:                                   ; preds = %._crit_edge236.loopexit, %.preheader128
  %.1083.lcssa = phi i32 [ %.982, %.preheader128 ], [ %91, %._crit_edge236.loopexit ]
  %.1058.lcssa = phi i32 [ %.957, %.preheader128 ], [ %90, %._crit_edge236.loopexit ]
  %94 = add nsw i32 %.1083.lcssa, -1
  %95 = lshr i32 %.1058.lcssa, 1
  br label %96

; <label>:96:                                     ; preds = %187, %._crit_edge236
  %.1184 = phi i32 [ %94, %._crit_edge236 ], [ %183, %187 ]
  %.1159 = phi i32 [ %95, %._crit_edge236 ], [ %184, %187 ]
  %.1036 = phi i8* [ %.935, %._crit_edge236 ], [ %.2046, %187 ]
  %.08 = phi i32 [ 0, %._crit_edge236 ], [ %192, %187 ]
  %.04 = phi i32* [ %25, %._crit_edge236 ], [ %191, %187 ]
  br label %97

; <label>:97:                                     ; preds = %144, %96
  %.1100 = phi i32 [ 0, %96 ], [ %147, %144 ]
  %.1285 = phi i32 [ %.1184, %96 ], [ %132, %144 ]
  %.1260 = phi i32 [ %.1159, %96 ], [ %133, %144 ]
  %.1137 = phi i8* [ %.1036, %96 ], [ %.1541, %144 ]
  %.110 = phi i32 [ %.08, %96 ], [ %148, %144 ]
  %98 = icmp slt i32 %.1285, 12
  br i1 %98, label %99, label %126

; <label>:99:                                     ; preds = %97
  %100 = icmp ult i8* %.1137, %17
  br i1 %100, label %103, label %101

; <label>:101:                                    ; preds = %99
  %102 = icmp eq i32 %.1285, 0
  br i1 %102, label %.loopexit.loopexit512, label %126

; <label>:103:                                    ; preds = %99
  %104 = getelementptr inbounds i8, i8* %.1137, i64 1
  %105 = load i8, i8* %.1137, align 1
  %106 = zext i8 %105 to i64
  %107 = getelementptr inbounds i8, i8* %11, i64 %106
  %108 = load i8, i8* %107, align 1
  %109 = zext i8 %108 to i32
  %110 = shl i32 %109, %.1285
  %111 = or i32 %110, %.1260
  %112 = add nsw i32 %.1285, 8
  %113 = icmp slt i32 %112, 12
  br i1 %113, label %114, label %126

; <label>:114:                                    ; preds = %103
  %115 = icmp ult i8* %104, %17
  br i1 %115, label %116, label %126

; <label>:116:                                    ; preds = %114
  %117 = getelementptr inbounds i8, i8* %.1137, i64 2
  %118 = load i8, i8* %104, align 1
  %119 = zext i8 %118 to i64
  %120 = getelementptr inbounds i8, i8* %11, i64 %119
  %121 = load i8, i8* %120, align 1
  %122 = zext i8 %121 to i32
  %123 = shl i32 %122, %112
  %124 = or i32 %123, %111
  %125 = add nsw i32 %.1285, 16
  br label %126

; <label>:126:                                    ; preds = %97, %103, %114, %116, %101
  %.1689 = phi i32 [ %.1285, %97 ], [ 12, %101 ], [ %112, %103 ], [ %125, %116 ], [ 12, %114 ]
  %.1664 = phi i32 [ %.1260, %97 ], [ %.1260, %101 ], [ %111, %103 ], [ %124, %116 ], [ %111, %114 ]
  %.1541 = phi i8* [ %.1137, %97 ], [ %.1137, %101 ], [ %104, %103 ], [ %117, %116 ], [ %104, %114 ]
  %127 = and i32 %.1664, 4095
  %128 = zext i32 %127 to i64
  %129 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %128, i32 1
  %130 = load i8, i8* %129, align 1
  %131 = zext i8 %130 to i32
  %132 = sub nsw i32 %.1689, %131
  %133 = lshr i32 %.1664, %131
  %134 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %128, i32 0
  %135 = load i8, i8* %134, align 4
  switch i8 %135, label %143 [
    i8 12, label %.loopexit125.loopexit513
    i8 7, label %136
    i8 9, label %144
    i8 11, label %144
  ]

; <label>:136:                                    ; preds = %126
  %137 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %128, i32 2
  %138 = load i32, i32* %137, align 4
  %139 = add i32 %138, %.1100
  %140 = getelementptr inbounds i32, i32* %.04, i64 1
  store i32 %139, i32* %.04, align 4
  %141 = add i32 %138, %.110
  %142 = icmp slt i32 %141, %9
  br i1 %142, label %.preheader.preheader, label %.thread.loopexit

.preheader.preheader:                             ; preds = %136
  br label %.preheader

; <label>:143:                                    ; preds = %126
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.110)
  br label %.loopexit125

; <label>:144:                                    ; preds = %126, %126
  %145 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %128, i32 2
  %146 = load i32, i32* %145, align 4
  %147 = add i32 %146, %.1100
  %148 = add i32 %146, %.110
  br label %97

.preheader:                                       ; preds = %.preheader.preheader, %195
  %.2101 = phi i32 [ %198, %195 ], [ 0, %.preheader.preheader ]
  %.1790 = phi i32 [ %183, %195 ], [ %132, %.preheader.preheader ]
  %.1765 = phi i32 [ %184, %195 ], [ %133, %.preheader.preheader ]
  %.1642 = phi i8* [ %.2046, %195 ], [ %.1541, %.preheader.preheader ]
  %.211 = phi i32 [ %199, %195 ], [ %141, %.preheader.preheader ]
  %149 = icmp slt i32 %.1790, 13
  br i1 %149, label %150, label %177

; <label>:150:                                    ; preds = %.preheader
  %151 = icmp ult i8* %.1642, %17
  br i1 %151, label %154, label %152

; <label>:152:                                    ; preds = %150
  %153 = icmp eq i32 %.1790, 0
  br i1 %153, label %.loopexit.loopexit, label %177

; <label>:154:                                    ; preds = %150
  %155 = getelementptr inbounds i8, i8* %.1642, i64 1
  %156 = load i8, i8* %.1642, align 1
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds i8, i8* %11, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = zext i8 %159 to i32
  %161 = shl i32 %160, %.1790
  %162 = or i32 %161, %.1765
  %163 = add nsw i32 %.1790, 8
  %164 = icmp slt i32 %163, 13
  br i1 %164, label %165, label %177

; <label>:165:                                    ; preds = %154
  %166 = icmp ult i8* %155, %17
  br i1 %166, label %167, label %177

; <label>:167:                                    ; preds = %165
  %168 = getelementptr inbounds i8, i8* %.1642, i64 2
  %169 = load i8, i8* %155, align 1
  %170 = zext i8 %169 to i64
  %171 = getelementptr inbounds i8, i8* %11, i64 %170
  %172 = load i8, i8* %171, align 1
  %173 = zext i8 %172 to i32
  %174 = shl i32 %173, %163
  %175 = or i32 %174, %162
  %176 = add nsw i32 %.1790, 16
  br label %177

; <label>:177:                                    ; preds = %.preheader, %154, %165, %167, %152
  %.2194 = phi i32 [ %.1790, %.preheader ], [ 13, %152 ], [ %163, %154 ], [ %176, %167 ], [ 13, %165 ]
  %.2169 = phi i32 [ %.1765, %.preheader ], [ %.1765, %152 ], [ %162, %154 ], [ %175, %167 ], [ %162, %165 ]
  %.2046 = phi i8* [ %.1642, %.preheader ], [ %.1642, %152 ], [ %155, %154 ], [ %168, %167 ], [ %155, %165 ]
  %178 = and i32 %.2169, 8191
  %179 = zext i32 %178 to i64
  %180 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %179, i32 1
  %181 = load i8, i8* %180, align 1
  %182 = zext i8 %181 to i32
  %183 = sub nsw i32 %.2194, %182
  %184 = lshr i32 %.2169, %182
  %185 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %179, i32 0
  %186 = load i8, i8* %185, align 4
  switch i8 %186, label %194 [
    i8 12, label %.loopexit125.loopexit
    i8 8, label %187
    i8 10, label %195
    i8 11, label %195
  ]

; <label>:187:                                    ; preds = %177
  %188 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %179, i32 2
  %189 = load i32, i32* %188, align 4
  %190 = add i32 %189, %.2101
  %191 = getelementptr inbounds i32, i32* %.04, i64 2
  store i32 %190, i32* %140, align 4
  %192 = add i32 %189, %.211
  %193 = icmp slt i32 %192, %9
  br i1 %193, label %96, label %.thread.loopexit

; <label>:194:                                    ; preds = %177
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.211)
  br label %.loopexit125

; <label>:195:                                    ; preds = %177, %177
  %196 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %179, i32 2
  %197 = load i32, i32* %196, align 4
  %198 = add i32 %197, %.2101
  %199 = add i32 %197, %.211
  br label %.preheader

.loopexit.loopexit:                               ; preds = %152
  br label %.loopexit

.loopexit.loopexit512:                            ; preds = %101
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit512, %.loopexit.loopexit
  %.3102 = phi i32 [ %.2101, %.loopexit.loopexit ], [ %.1100, %.loopexit.loopexit512 ]
  %.2270 = phi i32 [ %.1765, %.loopexit.loopexit ], [ %.1260, %.loopexit.loopexit512 ]
  %.2147 = phi i8* [ %.1642, %.loopexit.loopexit ], [ %.1137, %.loopexit.loopexit512 ]
  %.312 = phi i32 [ %.211, %.loopexit.loopexit ], [ %.110, %.loopexit.loopexit512 ]
  %.15 = phi i32* [ %140, %.loopexit.loopexit ], [ %.04, %.loopexit.loopexit512 ]
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.312)
  %200 = icmp eq i32 %.3102, 0
  br i1 %200, label %203, label %201

; <label>:201:                                    ; preds = %.loopexit
  store i32 %.3102, i32* %.15, align 4
  %202 = getelementptr inbounds i32, i32* %.15, i64 1
  br label %203

; <label>:203:                                    ; preds = %.loopexit, %201
  %.26 = phi i32* [ %202, %201 ], [ %.15, %.loopexit ]
  %204 = icmp eq i32 %.312, %9
  br i1 %204, label %276, label %205

; <label>:205:                                    ; preds = %203
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.312, i32 %9)
  %206 = icmp sgt i32 %.312, %9
  %207 = icmp ugt i32* %.26, %25
  %.220 = and i1 %206, %207
  br i1 %.220, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %205
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.3222 = phi i32* [ %208, %.lr.ph ], [ %.26, %.lr.ph.preheader ]
  %.514221 = phi i32 [ %210, %.lr.ph ], [ %.312, %.lr.ph.preheader ]
  %208 = getelementptr inbounds i32, i32* %.3222, i64 -1
  %209 = load i32, i32* %208, align 4
  %210 = sub i32 %.514221, %209
  %211 = icmp sgt i32 %210, %9
  %212 = icmp ugt i32* %208, %25
  %. = and i1 %211, %212
  br i1 %., label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %205
  %.514.lcssa = phi i32 [ %.312, %205 ], [ %210, %._crit_edge.loopexit ]
  %.3.lcssa = phi i32* [ %.26, %205 ], [ %208, %._crit_edge.loopexit ]
  %.lcssa = phi i1 [ %206, %205 ], [ %211, %._crit_edge.loopexit ]
  %213 = icmp slt i32 %.514.lcssa, %9
  br i1 %213, label %214, label %226

; <label>:214:                                    ; preds = %._crit_edge
  %215 = icmp sgt i32 %.514.lcssa, 0
  %..514 = select i1 %215, i32 %.514.lcssa, i32 0
  %216 = ptrtoint i32* %.3.lcssa to i64
  %217 = ptrtoint i32* %25 to i64
  %218 = sub i64 %216, %217
  %219 = and i64 %218, 4
  %220 = icmp eq i64 %219, 0
  br i1 %220, label %223, label %221

; <label>:221:                                    ; preds = %214
  store i32 0, i32* %.3.lcssa, align 4
  %222 = getelementptr inbounds i32, i32* %.3.lcssa, i64 1
  br label %223

; <label>:223:                                    ; preds = %221, %214
  %.4 = phi i32* [ %222, %221 ], [ %.3.lcssa, %214 ]
  %224 = sub nsw i32 %9, %..514
  store i32 %224, i32* %.4, align 4
  %225 = getelementptr inbounds i32, i32* %.4, i64 1
  br label %276

; <label>:226:                                    ; preds = %._crit_edge
  br i1 %.lcssa, label %227, label %276

; <label>:227:                                    ; preds = %226
  %228 = getelementptr inbounds i32, i32* %.3.lcssa, i64 2
  %229 = getelementptr inbounds i32, i32* %.3.lcssa, i64 1
  store i32 %9, i32* %.3.lcssa, align 4
  store i32 0, i32* %229, align 4
  br label %276

.loopexit125.loopexit:                            ; preds = %177
  br label %.loopexit125

.loopexit125.loopexit513:                         ; preds = %126
  br label %.loopexit125

.loopexit125:                                     ; preds = %.loopexit125.loopexit513, %.loopexit125.loopexit, %143, %194
  %.6105 = phi i32 [ %.1100, %143 ], [ %.2101, %194 ], [ %.2101, %.loopexit125.loopexit ], [ %.1100, %.loopexit125.loopexit513 ]
  %.2396 = phi i32 [ %132, %143 ], [ %183, %194 ], [ %183, %.loopexit125.loopexit ], [ %132, %.loopexit125.loopexit513 ]
  %.2371 = phi i32 [ %133, %143 ], [ %184, %194 ], [ %184, %.loopexit125.loopexit ], [ %133, %.loopexit125.loopexit513 ]
  %.22 = phi i8* [ %.1541, %143 ], [ %.2046, %194 ], [ %.2046, %.loopexit125.loopexit ], [ %.1541, %.loopexit125.loopexit513 ]
  %.817 = phi i32 [ %.110, %143 ], [ %.211, %194 ], [ %.211, %.loopexit125.loopexit ], [ %.110, %.loopexit125.loopexit513 ]
  %.8 = phi i32* [ %.04, %143 ], [ %140, %194 ], [ %140, %.loopexit125.loopexit ], [ %.04, %.loopexit125.loopexit513 ]
  %.1 = phi i32 [ 0, %143 ], [ 0, %194 ], [ 1, %.loopexit125.loopexit ], [ 1, %.loopexit125.loopexit513 ]
  %230 = icmp eq i32 %.6105, 0
  br i1 %230, label %.thread, label %231

; <label>:231:                                    ; preds = %.loopexit125
  store i32 %.6105, i32* %.8, align 4
  %232 = getelementptr inbounds i32, i32* %.8, i64 1
  br label %.thread

.thread.loopexit:                                 ; preds = %136, %187
  %.817119.ph = phi i32 [ %192, %187 ], [ %141, %136 ]
  %.22118.ph = phi i8* [ %.2046, %187 ], [ %.1541, %136 ]
  %.2371117.ph = phi i32 [ %184, %187 ], [ %133, %136 ]
  %.2396116.ph = phi i32 [ %183, %187 ], [ %132, %136 ]
  %.9.ph = phi i32* [ %191, %187 ], [ %140, %136 ]
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.loopexit125, %231
  %.1120 = phi i32 [ %.1, %231 ], [ %.1, %.loopexit125 ], [ 0, %.thread.loopexit ]
  %.817119 = phi i32 [ %.817, %231 ], [ %.817, %.loopexit125 ], [ %.817119.ph, %.thread.loopexit ]
  %.22118 = phi i8* [ %.22, %231 ], [ %.22, %.loopexit125 ], [ %.22118.ph, %.thread.loopexit ]
  %.2371117 = phi i32 [ %.2371, %231 ], [ %.2371, %.loopexit125 ], [ %.2371117.ph, %.thread.loopexit ]
  %.2396116 = phi i32 [ %.2396, %231 ], [ %.2396, %.loopexit125 ], [ %.2396116.ph, %.thread.loopexit ]
  %.9 = phi i32* [ %232, %231 ], [ %.8, %.loopexit125 ], [ %.9.ph, %.thread.loopexit ]
  %233 = icmp eq i32 %.817119, %9
  br i1 %233, label %258, label %234

; <label>:234:                                    ; preds = %.thread
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.817119, i32 %9)
  %235 = icmp sgt i32 %.817119, %9
  %236 = icmp ugt i32* %.9, %25
  %.111239 = and i1 %235, %236
  br i1 %.111239, label %.lr.ph243.preheader, label %._crit_edge244

.lr.ph243.preheader:                              ; preds = %234
  br label %.lr.ph243

.lr.ph243:                                        ; preds = %.lr.ph243.preheader, %.lr.ph243
  %.10241 = phi i32* [ %237, %.lr.ph243 ], [ %.9, %.lr.ph243.preheader ]
  %.1019240 = phi i32 [ %239, %.lr.ph243 ], [ %.817119, %.lr.ph243.preheader ]
  %237 = getelementptr inbounds i32, i32* %.10241, i64 -1
  %238 = load i32, i32* %237, align 4
  %239 = sub i32 %.1019240, %238
  %240 = icmp sgt i32 %239, %9
  %241 = icmp ugt i32* %237, %25
  %.111 = and i1 %240, %241
  br i1 %.111, label %.lr.ph243, label %._crit_edge244.loopexit

._crit_edge244.loopexit:                          ; preds = %.lr.ph243
  br label %._crit_edge244

._crit_edge244:                                   ; preds = %._crit_edge244.loopexit, %234
  %.1019.lcssa = phi i32 [ %.817119, %234 ], [ %239, %._crit_edge244.loopexit ]
  %.10.lcssa = phi i32* [ %.9, %234 ], [ %237, %._crit_edge244.loopexit ]
  %.lcssa195 = phi i1 [ %235, %234 ], [ %240, %._crit_edge244.loopexit ]
  %242 = icmp slt i32 %.1019.lcssa, %9
  br i1 %242, label %243, label %254

; <label>:243:                                    ; preds = %._crit_edge244
  %244 = icmp sgt i32 %.1019.lcssa, 0
  %..1019 = select i1 %244, i32 %.1019.lcssa, i32 0
  %245 = ptrtoint i32* %.10.lcssa to i64
  %246 = sub i64 %245, %30
  %247 = and i64 %246, 4
  %248 = icmp eq i64 %247, 0
  br i1 %248, label %251, label %249

; <label>:249:                                    ; preds = %243
  store i32 0, i32* %.10.lcssa, align 4
  %250 = getelementptr inbounds i32, i32* %.10.lcssa, i64 1
  br label %251

; <label>:251:                                    ; preds = %249, %243
  %.11 = phi i32* [ %250, %249 ], [ %.10.lcssa, %243 ]
  %252 = sub nsw i32 %9, %..1019
  store i32 %252, i32* %.11, align 4
  %253 = getelementptr inbounds i32, i32* %.11, i64 1
  br label %258

; <label>:254:                                    ; preds = %._crit_edge244
  br i1 %.lcssa195, label %255, label %258

; <label>:255:                                    ; preds = %254
  %256 = getelementptr inbounds i32, i32* %.10.lcssa, i64 2
  %257 = getelementptr inbounds i32, i32* %.10.lcssa, i64 1
  store i32 %9, i32* %.10.lcssa, align 4
  store i32 0, i32* %257, align 4
  br label %258

; <label>:258:                                    ; preds = %251, %255, %254, %.thread
  %.14 = phi i32* [ %.9, %.thread ], [ %253, %251 ], [ %256, %255 ], [ %.10.lcssa, %254 ]
  %259 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %27, align 8
  tail call void %259(i8* %.01253, i32* %25, i32* %.14, i32 %9) #5
  %260 = load i32, i32* %28, align 4
  %261 = sub i32 %.02252, %260
  %262 = icmp eq i32 %261, 0
  br i1 %262, label %.loopexit133.loopexit, label %.backedge

.backedge:                                        ; preds = %258
  %263 = zext i32 %260 to i64
  %264 = getelementptr inbounds i8, i8* %.01253, i64 %263
  %265 = load i32, i32* %29, align 8
  %266 = add i32 %265, 1
  store i32 %266, i32* %29, align 8
  %267 = icmp sgt i32 %261, 0
  br i1 %267, label %31, label %.loopexit133.loopexit

.loopexit130.loopexit:                            ; preds = %70
  br label %.loopexit130

.loopexit130.loopexit514:                         ; preds = %36
  br label %.loopexit130

.loopexit130:                                     ; preds = %.loopexit130.loopexit514, %.loopexit130.loopexit
  %.2472 = phi i32 [ %.755, %.loopexit130.loopexit ], [ %.149, %.loopexit130.loopexit514 ]
  %.23 = phi i8* [ %.733, %.loopexit130.loopexit ], [ %.127, %.loopexit130.loopexit514 ]
  %268 = icmp eq i32 %9, 0
  br i1 %268, label %276, label %269

; <label>:269:                                    ; preds = %.loopexit130
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode1D.module, i64 0, i64 0), %struct.tiff* %0, i32 0, i32 %9)
  %270 = icmp sgt i32 %9, 0
  br i1 %270, label %271, label %273

; <label>:271:                                    ; preds = %269
  store i32 %9, i32* %25, align 4
  %272 = getelementptr inbounds i32, i32* %25, i64 1
  br label %276

; <label>:273:                                    ; preds = %269
  %274 = getelementptr inbounds i32, i32* %25, i64 1
  store i32 %9, i32* %25, align 4
  store i32 0, i32* %274, align 4
  %275 = getelementptr inbounds i32, i32* %25, i64 2
  br label %276

; <label>:276:                                    ; preds = %271, %273, %.loopexit130, %223, %227, %226, %203
  %.25 = phi i32 [ %.2270, %203 ], [ %.2270, %226 ], [ %.2270, %227 ], [ %.2270, %223 ], [ %.2472, %.loopexit130 ], [ %.2472, %273 ], [ %.2472, %271 ]
  %.24 = phi i8* [ %.2147, %203 ], [ %.2147, %226 ], [ %.2147, %227 ], [ %.2147, %223 ], [ %.23, %.loopexit130 ], [ %.23, %273 ], [ %.23, %271 ]
  %.21 = phi i32* [ %.26, %203 ], [ %.3.lcssa, %226 ], [ %228, %227 ], [ %225, %223 ], [ %25, %.loopexit130 ], [ %275, %273 ], [ %272, %271 ]
  %.2 = phi i32 [ 0, %203 ], [ 0, %226 ], [ 0, %227 ], [ 0, %223 ], [ %.03251, %.loopexit130 ], [ %.03251, %273 ], [ %.03251, %271 ]
  %277 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %278 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %277, align 8
  tail call void %278(i8* %.01253, i32* %25, i32* %.21, i32 %9) #5
  br label %.loopexit133

.loopexit133.loopexit:                            ; preds = %.backedge, %258
  br label %.loopexit133

.loopexit133:                                     ; preds = %.loopexit133.loopexit, %4, %276
  %.073.sink = phi i32 [ 0, %276 ], [ %21, %4 ], [ %.2396116, %.loopexit133.loopexit ]
  %.048.sink = phi i32 [ %.25, %276 ], [ %23, %4 ], [ %.2371117, %.loopexit133.loopexit ]
  %.03.sink = phi i32 [ %.2, %276 ], [ %19, %4 ], [ %.1120, %.loopexit133.loopexit ]
  %.026.sink124 = phi i8* [ %.24, %276 ], [ %13, %4 ], [ %.22118, %.loopexit133.loopexit ]
  %.0 = phi i32 [ -1, %276 ], [ 1, %4 ], [ 1, %.loopexit133.loopexit ]
  store i32 %.073.sink, i32* %20, align 4
  store i32 %.048.sink, i32* %22, align 8
  store i32 %.03.sink, i32* %18, align 8
  %279 = bitcast i8** %12 to i64*
  %280 = load i64, i64* %279, align 8
  %281 = ptrtoint i8* %.026.sink124 to i64
  %282 = load i32, i32* %14, align 8
  %283 = zext i32 %282 to i64
  %284 = sub i64 %280, %281
  %285 = add i64 %284, %283
  %286 = trunc i64 %285 to i32
  store i32 %286, i32* %14, align 8
  store i8* %.026.sink124, i8** %12, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PreEncode(%struct.tiff* nocapture readonly, i16 zeroext) #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %4 = bitcast i8** %3 to %struct.Fax3EncodeState**
  %5 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %4, align 8
  %6 = icmp eq %struct.Fax3EncodeState* %5, null
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.40, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 699, i8* getelementptr inbounds ([37 x i8], [37 x i8]* @__PRETTY_FUNCTION__.Fax3PreEncode, i64 0, i64 0)) #7
  unreachable

; <label>:8:                                      ; preds = %2
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 2
  store i32 8, i32* %9, align 4
  %10 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 1
  store i32 0, i32* %10, align 8
  %11 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 3
  store i32 0, i32* %11, align 8
  %12 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 4
  %13 = load i8*, i8** %12, align 8
  %14 = icmp eq i8* %13, null
  br i1 %14, label %18, label %15

; <label>:15:                                     ; preds = %8
  %16 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 0, i32 1
  %17 = load i32, i32* %16, align 4
  tail call void @_TIFFmemset(i8* nonnull %13, i32 0, i32 %17) #5
  br label %18

; <label>:18:                                     ; preds = %8, %15
  %19 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 0, i32 6
  %20 = load i32, i32* %19, align 8
  %21 = and i32 %20, 1
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %34, label %23

; <label>:23:                                     ; preds = %18
  %24 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 22
  %25 = load float, float* %24, align 4
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 23
  %27 = load i16, i16* %26, align 8
  %28 = icmp eq i16 %27, 3
  %29 = fmul float %25, 0x400451EB80000000
  %. = select i1 %28, float %29, float %25
  %30 = fcmp ogt float %., 1.500000e+02
  %31 = select i1 %30, i32 4, i32 2
  %32 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 6
  store i32 %31, i32* %32, align 4
  %33 = add nsw i32 %31, -1
  br label %36

; <label>:34:                                     ; preds = %18
  %35 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 6
  store i32 0, i32* %35, align 4
  br label %36

; <label>:36:                                     ; preds = %34, %23
  %.sink = phi i32 [ 0, %34 ], [ %33, %23 ]
  %37 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %5, i64 0, i32 5
  store i32 %.sink, i32* %37, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3PostEncode(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %4 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %5 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 8
  br i1 %7, label %25, label %8

; <label>:8:                                      ; preds = %1
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %10 = load i32, i32* %9, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %12 = load i32, i32* %11, align 8
  %13 = icmp slt i32 %10, %12
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %8
  %15 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %16

; <label>:16:                                     ; preds = %8, %14
  %17 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 1
  %18 = load i32, i32* %17, align 8
  %19 = trunc i32 %18 to i8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 1
  store i8* %22, i8** %20, align 8
  store i8 %19, i8* %21, align 1
  %23 = load i32, i32* %9, align 8
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %9, align 8
  store i32 0, i32* %17, align 8
  store i32 8, i32* %5, align 4
  br label %25

; <label>:25:                                     ; preds = %1, %16
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Encode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3EncodeState**
  %7 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %6, align 8
  %8 = icmp sgt i32 %2, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 0
  %10 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 6
  %11 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 2
  %12 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 1
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %14 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 3
  %15 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 2
  %16 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 5
  %17 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 6
  %18 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 4
  %19 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 1
  %20 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 4
  %21 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 0, i32 2
  %22 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %7, i64 0, i32 5
  br label %23

; <label>:23:                                     ; preds = %.lr.ph, %.backedge
  %.04 = phi i32 [ %2, %.lr.ph ], [ %55, %.backedge ]
  %.012 = phi i8* [ %1, %.lr.ph ], [ %58, %.backedge ]
  %24 = load i32, i32* %9, align 8
  %25 = and i32 %24, 2
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %28

; <label>:27:                                     ; preds = %23
  tail call fastcc void @Fax3PutEOL(%struct.tiff* nonnull %0)
  br label %28

; <label>:28:                                     ; preds = %27, %23
  %29 = load i32, i32* %10, align 8
  %30 = and i32 %29, 1
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %51, label %32

; <label>:32:                                     ; preds = %28
  %33 = load i32, i32* %14, align 8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %32
  %36 = load i32, i32* %15, align 8
  tail call fastcc void @Fax3Encode1DRow(%struct.tiff* %0, i8* %.012, i32 %36)
  store i32 1, i32* %14, align 8
  %.pr = load i32, i32* %16, align 8
  br label %42

; <label>:37:                                     ; preds = %32
  %38 = load i8*, i8** %20, align 8
  %39 = load i32, i32* %21, align 8
  tail call fastcc void @Fax3Encode2DRow(%struct.tiff* %0, i8* %.012, i8* %38, i32 %39)
  %40 = load i32, i32* %22, align 8
  %41 = add nsw i32 %40, -1
  store i32 %41, i32* %22, align 8
  br label %42

; <label>:42:                                     ; preds = %37, %35
  %43 = phi i32 [ %41, %37 ], [ %.pr, %35 ]
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %48

; <label>:45:                                     ; preds = %42
  store i32 0, i32* %14, align 8
  %46 = load i32, i32* %17, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, i32* %16, align 8
  br label %53

; <label>:48:                                     ; preds = %42
  %49 = load i8*, i8** %18, align 8
  %50 = load i32, i32* %19, align 4
  tail call void @_TIFFmemcpy(i8* %49, i8* %.012, i32 %50) #5
  br label %53

; <label>:51:                                     ; preds = %28
  %52 = load i32, i32* %11, align 8
  tail call fastcc void @Fax3Encode1DRow(%struct.tiff* %0, i8* %.012, i32 %52)
  br label %53

; <label>:53:                                     ; preds = %45, %48, %51
  %54 = load i32, i32* %12, align 4
  %55 = sub i32 %.04, %54
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %._crit_edge.loopexit, label %.backedge

.backedge:                                        ; preds = %53
  %57 = zext i32 %54 to i64
  %58 = getelementptr inbounds i8, i8* %.012, i64 %57
  %59 = load i32, i32* %13, align 8
  %60 = add i32 %59, 1
  store i32 %60, i32* %13, align 8
  %61 = icmp sgt i32 %55, 0
  br i1 %61, label %23, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge, %53
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Close(%struct.tiff*) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.Fax3BaseState**
  %4 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %3, align 8
  %5 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %4, i64 0, i32 0
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 1
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %40

; <label>:9:                                      ; preds = %1
  %10 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %11 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %10, align 8
  %12 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %11, i64 0, i32 0, i32 6
  %13 = load i32, i32* %12, align 8
  %14 = and i32 %13, 1
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %22, label %16

; <label>:16:                                     ; preds = %9
  %17 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %11, i64 0, i32 3
  %18 = load i32, i32* %17, align 8
  %19 = icmp eq i32 %18, 0
  %20 = zext i1 %19 to i32
  %21 = or i32 %20, 2
  br label %22

; <label>:22:                                     ; preds = %16, %9
  %.02 = phi i32 [ %21, %16 ], [ 1, %9 ]
  %.01 = phi i32 [ 13, %16 ], [ 12, %9 ]
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  tail call fastcc void @Fax3PutBits(%struct.tiff* nonnull %0, i32 %.02, i32 %.01)
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %24 = load i32, i32* %23, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %26 = load i32, i32* %25, align 8
  %27 = icmp slt i32 %24, %26
  br i1 %27, label %30, label %28

; <label>:28:                                     ; preds = %22
  %29 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %30

; <label>:30:                                     ; preds = %22, %28
  %31 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %11, i64 0, i32 1
  %32 = load i32, i32* %31, align 8
  %33 = trunc i32 %32 to i8
  %34 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 1
  store i8* %36, i8** %34, align 8
  store i8 %33, i8* %35, align 1
  %37 = load i32, i32* %23, align 8
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %23, align 8
  store i32 0, i32* %31, align 8
  %39 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %11, i64 0, i32 2
  store i32 8, i32* %39, align 4
  br label %40

; <label>:40:                                     ; preds = %30, %1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal void @Fax3Cleanup(%struct.tiff* nocapture) #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = load i8*, i8** %2, align 8
  %4 = icmp eq i8* %3, null
  br i1 %4, label %34, label %5

; <label>:5:                                      ; preds = %1
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %18

; <label>:9:                                      ; preds = %5
  %10 = bitcast i8** %2 to %struct.Fax3DecodeState**
  %11 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %10, align 8
  %12 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %11, i64 0, i32 6
  %13 = load i32*, i32** %12, align 8
  %14 = icmp eq i32* %13, null
  br i1 %14, label %25, label %15

; <label>:15:                                     ; preds = %9
  %16 = bitcast i32** %12 to i8**
  %17 = load i8*, i8** %16, align 8
  tail call void @_TIFFfree(i8* %17) #5
  br label %25

; <label>:18:                                     ; preds = %5
  %19 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %20 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %19, align 8
  %21 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %20, i64 0, i32 4
  %22 = load i8*, i8** %21, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %25, label %24

; <label>:24:                                     ; preds = %18
  tail call void @_TIFFfree(i8* nonnull %22) #5
  br label %25

; <label>:25:                                     ; preds = %24, %18, %15, %9
  %26 = bitcast i8** %2 to %struct.Fax3BaseState**
  %27 = load %struct.Fax3BaseState*, %struct.Fax3BaseState** %26, align 8
  %28 = getelementptr inbounds %struct.Fax3BaseState, %struct.Fax3BaseState* %27, i64 0, i32 8
  %29 = load i8*, i8** %28, align 8
  %30 = icmp eq i8* %29, null
  br i1 %30, label %32, label %31

; <label>:31:                                     ; preds = %25
  tail call void @_TIFFfree(i8* nonnull %29) #5
  br label %32

; <label>:32:                                     ; preds = %25, %31
  %33 = load i8*, i8** %2, align 8
  tail call void @_TIFFfree(i8* %33) #5
  store i8* null, i8** %2, align 8
  br label %34

; <label>:34:                                     ; preds = %1, %32
  ret void
}

declare void @_TIFFsetString(i8**, i8*) local_unnamed_addr #2

declare %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

declare i32 @TIFFTileRowSize(%struct.tiff*) local_unnamed_addr #2

declare i32 @TIFFScanlineSize(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @Fax3Decode2D(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %6 = bitcast i8** %5 to %struct.Fax3DecodeState**
  %7 = load %struct.Fax3DecodeState*, %struct.Fax3DecodeState** %6, align 8
  %8 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 2
  %9 = load i32, i32* %8, align 8
  %10 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 1
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %15 = load i32, i32* %14, align 8
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %13, i64 %16
  %18 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 4
  %19 = load i32, i32* %18, align 8
  %20 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 2
  %23 = load i32, i32* %22, align 8
  %24 = icmp sgt i32 %2, 0
  br i1 %24, label %.lr.ph851, label %.loopexit365

.lr.ph851:                                        ; preds = %4
  %25 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 8
  %26 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 7
  %27 = icmp sgt i32 %9, 0
  %28 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %29 = bitcast i32** %25 to i64*
  %30 = bitcast i32** %26 to i64*
  %31 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 0, i32 1
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  br label %33

; <label>:33:                                     ; preds = %.lr.ph851, %.backedge
  %.02834 = phi i8* [ %1, %.lr.ph851 ], [ %746, %.backedge ]
  %.03833 = phi i32 [ %2, %.lr.ph851 ], [ %743, %.backedge ]
  %.031832 = phi i32 [ %19, %.lr.ph851 ], [ %.334, %.backedge ]
  %.037831 = phi i32 [ %23, %.lr.ph851 ], [ %.62, %.backedge ]
  %.083830 = phi i32 [ %21, %.lr.ph851 ], [ %.62145, %.backedge ]
  %.0182829 = phi i8* [ %13, %.lr.ph851 ], [ %.61243, %.backedge ]
  %34 = load i32*, i32** %25, align 8
  %35 = icmp eq i32 %.031832, 0
  br i1 %35, label %.preheader363.preheader, label %.preheader361.preheader

.preheader363.preheader:                          ; preds = %33
  br label %.preheader363

.preheader361.preheader.loopexit:                 ; preds = %64
  br label %.preheader361.preheader

.preheader361.preheader:                          ; preds = %.preheader361.preheader.loopexit, %33
  %.7189.ph = phi i8* [ %.0182829, %33 ], [ %.5187, %.preheader361.preheader.loopexit ]
  %.790.ph = phi i32 [ %.083830, %33 ], [ %.588, %.preheader361.preheader.loopexit ]
  %.744.ph = phi i32 [ %.037831, %33 ], [ %.542, %.preheader361.preheader.loopexit ]
  br label %.preheader361

.preheader363:                                    ; preds = %.preheader363.preheader, %67
  %.1183 = phi i8* [ %.5187, %67 ], [ %.0182829, %.preheader363.preheader ]
  %.184 = phi i32 [ %69, %67 ], [ %.083830, %.preheader363.preheader ]
  %.138 = phi i32 [ %68, %67 ], [ %.037831, %.preheader363.preheader ]
  %36 = icmp slt i32 %.184, 11
  br i1 %36, label %37, label %64

; <label>:37:                                     ; preds = %.preheader363
  %38 = icmp ult i8* %.1183, %17
  br i1 %38, label %41, label %39

; <label>:39:                                     ; preds = %37
  %40 = icmp eq i32 %.184, 0
  br i1 %40, label %.loopexit362.loopexit2188, label %64

; <label>:41:                                     ; preds = %37
  %42 = getelementptr inbounds i8, i8* %.1183, i64 1
  %43 = load i8, i8* %.1183, align 1
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds i8, i8* %11, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = shl i32 %47, %.184
  %49 = or i32 %48, %.138
  %50 = add nsw i32 %.184, 8
  %51 = icmp slt i32 %50, 11
  br i1 %51, label %52, label %64

; <label>:52:                                     ; preds = %41
  %53 = icmp ult i8* %42, %17
  br i1 %53, label %54, label %64

; <label>:54:                                     ; preds = %52
  %55 = getelementptr inbounds i8, i8* %.1183, i64 2
  %56 = load i8, i8* %42, align 1
  %57 = zext i8 %56 to i64
  %58 = getelementptr inbounds i8, i8* %11, i64 %57
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i32
  %61 = shl i32 %60, %50
  %62 = or i32 %61, %49
  %63 = add nsw i32 %.184, 16
  br label %64

; <label>:64:                                     ; preds = %.preheader363, %41, %52, %54, %39
  %.5187 = phi i8* [ %.1183, %.preheader363 ], [ %.1183, %39 ], [ %42, %41 ], [ %55, %54 ], [ %42, %52 ]
  %.588 = phi i32 [ %.184, %.preheader363 ], [ 11, %39 ], [ %50, %41 ], [ %63, %54 ], [ 11, %52 ]
  %.542 = phi i32 [ %.138, %.preheader363 ], [ %.138, %39 ], [ %49, %41 ], [ %62, %54 ], [ %49, %52 ]
  %65 = and i32 %.542, 2047
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %.preheader361.preheader.loopexit, label %67

; <label>:67:                                     ; preds = %64
  %68 = lshr i32 %.542, 1
  %69 = add nsw i32 %.588, -1
  br label %.preheader363

.preheader361:                                    ; preds = %.preheader361.preheader, %90
  %.7189 = phi i8* [ %.9191, %90 ], [ %.7189.ph, %.preheader361.preheader ]
  %.790 = phi i32 [ %92, %90 ], [ %.790.ph, %.preheader361.preheader ]
  %.744 = phi i32 [ %91, %90 ], [ %.744.ph, %.preheader361.preheader ]
  %70 = icmp slt i32 %.790, 8
  br i1 %70, label %71, label %85

; <label>:71:                                     ; preds = %.preheader361
  %72 = icmp ult i8* %.7189, %17
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %71
  %74 = icmp eq i32 %.790, 0
  br i1 %74, label %.loopexit362.loopexit, label %85

; <label>:75:                                     ; preds = %71
  %76 = getelementptr inbounds i8, i8* %.7189, i64 1
  %77 = load i8, i8* %.7189, align 1
  %78 = zext i8 %77 to i64
  %79 = getelementptr inbounds i8, i8* %11, i64 %78
  %80 = load i8, i8* %79, align 1
  %81 = zext i8 %80 to i32
  %82 = shl i32 %81, %.790
  %83 = or i32 %82, %.744
  %84 = add nsw i32 %.790, 8
  br label %85

; <label>:85:                                     ; preds = %.preheader361, %73, %75
  %.9191 = phi i8* [ %.7189, %.preheader361 ], [ %76, %75 ], [ %.7189, %73 ]
  %.992 = phi i32 [ %.790, %.preheader361 ], [ %84, %75 ], [ 8, %73 ]
  %.946 = phi i32 [ %.744, %.preheader361 ], [ %83, %75 ], [ %.744, %73 ]
  %86 = and i32 %.946, 255
  %87 = icmp eq i32 %86, 0
  br i1 %87, label %90, label %.preheader360

.preheader360:                                    ; preds = %85
  %88 = and i32 %.946, 1
  %89 = icmp eq i32 %88, 0
  br i1 %89, label %.lr.ph725.preheader, label %._crit_edge726

.lr.ph725.preheader:                              ; preds = %.preheader360
  br label %.lr.ph725

; <label>:90:                                     ; preds = %85
  %91 = lshr i32 %.946, 8
  %92 = add nsw i32 %.992, -8
  br label %.preheader361

.lr.ph725:                                        ; preds = %.lr.ph725.preheader, %.lr.ph725
  %.1047724 = phi i32 [ %93, %.lr.ph725 ], [ %.946, %.lr.ph725.preheader ]
  %.1093723 = phi i32 [ %94, %.lr.ph725 ], [ %.992, %.lr.ph725.preheader ]
  %93 = lshr i32 %.1047724, 1
  %94 = add nsw i32 %.1093723, -1
  %95 = and i32 %93, 1
  %96 = icmp eq i32 %95, 0
  br i1 %96, label %.lr.ph725, label %._crit_edge726.loopexit

._crit_edge726.loopexit:                          ; preds = %.lr.ph725
  br label %._crit_edge726

._crit_edge726:                                   ; preds = %._crit_edge726.loopexit, %.preheader360
  %.1093.lcssa = phi i32 [ %.992, %.preheader360 ], [ %94, %._crit_edge726.loopexit ]
  %.1047.lcssa = phi i32 [ %.946, %.preheader360 ], [ %93, %._crit_edge726.loopexit ]
  %97 = add nsw i32 %.1093.lcssa, -1
  %98 = lshr i32 %.1047.lcssa, 1
  %99 = icmp slt i32 %.1093.lcssa, 2
  br i1 %99, label %100, label %114

; <label>:100:                                    ; preds = %._crit_edge726
  %101 = icmp ult i8* %.9191, %17
  br i1 %101, label %104, label %102

; <label>:102:                                    ; preds = %100
  %103 = icmp eq i32 %97, 0
  br i1 %103, label %.loopexit362.loopexit2189, label %114

; <label>:104:                                    ; preds = %100
  %105 = getelementptr inbounds i8, i8* %.9191, i64 1
  %106 = load i8, i8* %.9191, align 1
  %107 = zext i8 %106 to i64
  %108 = getelementptr inbounds i8, i8* %11, i64 %107
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i32
  %111 = shl i32 %110, %97
  %112 = or i32 %111, %98
  %113 = add nsw i32 %.1093.lcssa, 7
  br label %114

; <label>:114:                                    ; preds = %._crit_edge726, %102, %104
  %.11193 = phi i8* [ %.9191, %._crit_edge726 ], [ %105, %104 ], [ %.9191, %102 ]
  %.1295 = phi i32 [ %97, %._crit_edge726 ], [ %113, %104 ], [ 1, %102 ]
  %.1249 = phi i32 [ %98, %._crit_edge726 ], [ %112, %104 ], [ %98, %102 ]
  %115 = and i32 %.1249, 1
  %116 = add nsw i32 %.1295, -1
  %117 = lshr i32 %.1249, 1
  %118 = load i32*, i32** %26, align 8
  %119 = getelementptr inbounds i32, i32* %118, i64 1
  %120 = load i32, i32* %118, align 4
  %121 = icmp eq i32 %115, 0
  br i1 %121, label %.preheader356, label %.preheader359.preheader

.preheader359.preheader:                          ; preds = %114
  br label %.preheader359

.preheader356:                                    ; preds = %114
  br i1 %27, label %.lr.ph754.lr.ph, label %.thread318

.lr.ph754.lr.ph:                                  ; preds = %.preheader356
  %122 = ptrtoint i32* %34 to i64
  br label %.lr.ph754

.preheader359:                                    ; preds = %.preheader359.preheader, %213
  %.0246 = phi i32* [ %217, %213 ], [ %34, %.preheader359.preheader ]
  %.12194 = phi i8* [ %.22204, %213 ], [ %.11193, %.preheader359.preheader ]
  %.1396 = phi i32 [ %209, %213 ], [ %116, %.preheader359.preheader ]
  %.1350 = phi i32 [ %210, %213 ], [ %117, %.preheader359.preheader ]
  %.016 = phi i32 [ %218, %213 ], [ 0, %.preheader359.preheader ]
  br label %123

; <label>:123:                                    ; preds = %170, %.preheader359
  %.13195 = phi i8* [ %.12194, %.preheader359 ], [ %.17199, %170 ]
  %.1149 = phi i32 [ 0, %.preheader359 ], [ %173, %170 ]
  %.1497 = phi i32 [ %.1396, %.preheader359 ], [ %158, %170 ]
  %.1451 = phi i32 [ %.1350, %.preheader359 ], [ %159, %170 ]
  %.117 = phi i32 [ %.016, %.preheader359 ], [ %174, %170 ]
  %124 = icmp slt i32 %.1497, 12
  br i1 %124, label %125, label %152

; <label>:125:                                    ; preds = %123
  %126 = icmp ult i8* %.13195, %17
  br i1 %126, label %129, label %127

; <label>:127:                                    ; preds = %125
  %128 = icmp eq i32 %.1497, 0
  br i1 %128, label %.loopexit352.loopexit2186, label %152

; <label>:129:                                    ; preds = %125
  %130 = getelementptr inbounds i8, i8* %.13195, i64 1
  %131 = load i8, i8* %.13195, align 1
  %132 = zext i8 %131 to i64
  %133 = getelementptr inbounds i8, i8* %11, i64 %132
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = shl i32 %135, %.1497
  %137 = or i32 %136, %.1451
  %138 = add nsw i32 %.1497, 8
  %139 = icmp slt i32 %138, 12
  br i1 %139, label %140, label %152

; <label>:140:                                    ; preds = %129
  %141 = icmp ult i8* %130, %17
  br i1 %141, label %142, label %152

; <label>:142:                                    ; preds = %140
  %143 = getelementptr inbounds i8, i8* %.13195, i64 2
  %144 = load i8, i8* %130, align 1
  %145 = zext i8 %144 to i64
  %146 = getelementptr inbounds i8, i8* %11, i64 %145
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i32
  %149 = shl i32 %148, %138
  %150 = or i32 %149, %137
  %151 = add nsw i32 %.1497, 16
  br label %152

; <label>:152:                                    ; preds = %123, %129, %140, %142, %127
  %.17199 = phi i8* [ %.13195, %123 ], [ %.13195, %127 ], [ %130, %129 ], [ %143, %142 ], [ %130, %140 ]
  %.18101 = phi i32 [ %.1497, %123 ], [ 12, %127 ], [ %138, %129 ], [ %151, %142 ], [ 12, %140 ]
  %.1855 = phi i32 [ %.1451, %123 ], [ %.1451, %127 ], [ %137, %129 ], [ %150, %142 ], [ %137, %140 ]
  %153 = and i32 %.1855, 4095
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %154, i32 1
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i32
  %158 = sub nsw i32 %.18101, %157
  %159 = lshr i32 %.1855, %157
  %160 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %154, i32 0
  %161 = load i8, i8* %160, align 4
  switch i8 %161, label %169 [
    i8 12, label %.loopexit353.loopexit2187
    i8 7, label %162
    i8 9, label %170
    i8 11, label %170
  ]

; <label>:162:                                    ; preds = %152
  %163 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %154, i32 2
  %164 = load i32, i32* %163, align 4
  %165 = add i32 %164, %.1149
  %166 = getelementptr inbounds i32, i32* %.0246, i64 1
  store i32 %165, i32* %.0246, align 4
  %167 = add i32 %164, %.117
  %168 = icmp slt i32 %167, %9
  br i1 %168, label %.preheader351.preheader, label %.thread.loopexit

.preheader351.preheader:                          ; preds = %162
  br label %.preheader351

; <label>:169:                                    ; preds = %152
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.117)
  br label %.loopexit353

; <label>:170:                                    ; preds = %152, %152
  %171 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %154, i32 2
  %172 = load i32, i32* %171, align 4
  %173 = add i32 %172, %.1149
  %174 = add i32 %172, %.117
  br label %123

.preheader351:                                    ; preds = %.preheader351.preheader, %221
  %.18200 = phi i8* [ %.22204, %221 ], [ %.17199, %.preheader351.preheader ]
  %.2150 = phi i32 [ %224, %221 ], [ 0, %.preheader351.preheader ]
  %.19102 = phi i32 [ %209, %221 ], [ %158, %.preheader351.preheader ]
  %.1956 = phi i32 [ %210, %221 ], [ %159, %.preheader351.preheader ]
  %.218 = phi i32 [ %225, %221 ], [ %167, %.preheader351.preheader ]
  %175 = icmp slt i32 %.19102, 13
  br i1 %175, label %176, label %203

; <label>:176:                                    ; preds = %.preheader351
  %177 = icmp ult i8* %.18200, %17
  br i1 %177, label %180, label %178

; <label>:178:                                    ; preds = %176
  %179 = icmp eq i32 %.19102, 0
  br i1 %179, label %.loopexit352.loopexit, label %203

; <label>:180:                                    ; preds = %176
  %181 = getelementptr inbounds i8, i8* %.18200, i64 1
  %182 = load i8, i8* %.18200, align 1
  %183 = zext i8 %182 to i64
  %184 = getelementptr inbounds i8, i8* %11, i64 %183
  %185 = load i8, i8* %184, align 1
  %186 = zext i8 %185 to i32
  %187 = shl i32 %186, %.19102
  %188 = or i32 %187, %.1956
  %189 = add nsw i32 %.19102, 8
  %190 = icmp slt i32 %189, 13
  br i1 %190, label %191, label %203

; <label>:191:                                    ; preds = %180
  %192 = icmp ult i8* %181, %17
  br i1 %192, label %193, label %203

; <label>:193:                                    ; preds = %191
  %194 = getelementptr inbounds i8, i8* %.18200, i64 2
  %195 = load i8, i8* %181, align 1
  %196 = zext i8 %195 to i64
  %197 = getelementptr inbounds i8, i8* %11, i64 %196
  %198 = load i8, i8* %197, align 1
  %199 = zext i8 %198 to i32
  %200 = shl i32 %199, %189
  %201 = or i32 %200, %188
  %202 = add nsw i32 %.19102, 16
  br label %203

; <label>:203:                                    ; preds = %.preheader351, %180, %191, %193, %178
  %.22204 = phi i8* [ %.18200, %.preheader351 ], [ %.18200, %178 ], [ %181, %180 ], [ %194, %193 ], [ %181, %191 ]
  %.23106 = phi i32 [ %.19102, %.preheader351 ], [ 13, %178 ], [ %189, %180 ], [ %202, %193 ], [ 13, %191 ]
  %.2360 = phi i32 [ %.1956, %.preheader351 ], [ %.1956, %178 ], [ %188, %180 ], [ %201, %193 ], [ %188, %191 ]
  %204 = and i32 %.2360, 8191
  %205 = zext i32 %204 to i64
  %206 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %205, i32 1
  %207 = load i8, i8* %206, align 1
  %208 = zext i8 %207 to i32
  %209 = sub nsw i32 %.23106, %208
  %210 = lshr i32 %.2360, %208
  %211 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %205, i32 0
  %212 = load i8, i8* %211, align 4
  switch i8 %212, label %220 [
    i8 12, label %.loopexit353.loopexit
    i8 8, label %213
    i8 10, label %221
    i8 11, label %221
  ]

; <label>:213:                                    ; preds = %203
  %214 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %205, i32 2
  %215 = load i32, i32* %214, align 4
  %216 = add i32 %215, %.2150
  %217 = getelementptr inbounds i32, i32* %.0246, i64 2
  store i32 %216, i32* %166, align 4
  %218 = add i32 %215, %.218
  %219 = icmp slt i32 %218, %9
  br i1 %219, label %.preheader359, label %.thread.loopexit

; <label>:220:                                    ; preds = %203
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.218)
  br label %.loopexit353

; <label>:221:                                    ; preds = %203, %203
  %222 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %205, i32 2
  %223 = load i32, i32* %222, align 4
  %224 = add i32 %223, %.2150
  %225 = add i32 %223, %.218
  br label %.preheader351

.loopexit352.loopexit:                            ; preds = %178
  br label %.loopexit352

.loopexit352.loopexit2186:                        ; preds = %127
  br label %.loopexit352

.loopexit352:                                     ; preds = %.loopexit352.loopexit2186, %.loopexit352.loopexit
  %.1247 = phi i32* [ %166, %.loopexit352.loopexit ], [ %.0246, %.loopexit352.loopexit2186 ]
  %.23205 = phi i8* [ %.18200, %.loopexit352.loopexit ], [ %.13195, %.loopexit352.loopexit2186 ]
  %.3151 = phi i32 [ %.2150, %.loopexit352.loopexit ], [ %.1149, %.loopexit352.loopexit2186 ]
  %.2461 = phi i32 [ %.1956, %.loopexit352.loopexit ], [ %.1451, %.loopexit352.loopexit2186 ]
  %.319 = phi i32 [ %.218, %.loopexit352.loopexit ], [ %.117, %.loopexit352.loopexit2186 ]
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.319)
  %226 = icmp eq i32 %.3151, 0
  br i1 %226, label %229, label %227

; <label>:227:                                    ; preds = %.loopexit352
  store i32 %.3151, i32* %.1247, align 4
  %228 = getelementptr inbounds i32, i32* %.1247, i64 1
  br label %229

; <label>:229:                                    ; preds = %.loopexit352, %227
  %.2248 = phi i32* [ %228, %227 ], [ %.1247, %.loopexit352 ]
  %230 = icmp eq i32 %.319, %9
  br i1 %230, label %758, label %231

; <label>:231:                                    ; preds = %229
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.319, i32 %9)
  %232 = icmp sgt i32 %.319, %9
  %233 = icmp ugt i32* %.2248, %34
  %.706 = and i1 %233, %232
  br i1 %.706, label %.lr.ph710.preheader, label %._crit_edge711

.lr.ph710.preheader:                              ; preds = %231
  br label %.lr.ph710

.lr.ph710:                                        ; preds = %.lr.ph710.preheader, %.lr.ph710
  %.521708 = phi i32 [ %236, %.lr.ph710 ], [ %.319, %.lr.ph710.preheader ]
  %.3249707 = phi i32* [ %234, %.lr.ph710 ], [ %.2248, %.lr.ph710.preheader ]
  %234 = getelementptr inbounds i32, i32* %.3249707, i64 -1
  %235 = load i32, i32* %234, align 4
  %236 = sub i32 %.521708, %235
  %237 = icmp sgt i32 %236, %9
  %238 = icmp ugt i32* %234, %34
  %. = and i1 %238, %237
  br i1 %., label %.lr.ph710, label %._crit_edge711.loopexit

._crit_edge711.loopexit:                          ; preds = %.lr.ph710
  br label %._crit_edge711

._crit_edge711:                                   ; preds = %._crit_edge711.loopexit, %231
  %.3249.lcssa = phi i32* [ %.2248, %231 ], [ %234, %._crit_edge711.loopexit ]
  %.521.lcssa = phi i32 [ %.319, %231 ], [ %236, %._crit_edge711.loopexit ]
  %.lcssa368 = phi i1 [ %232, %231 ], [ %237, %._crit_edge711.loopexit ]
  %239 = icmp slt i32 %.521.lcssa, %9
  br i1 %239, label %240, label %252

; <label>:240:                                    ; preds = %._crit_edge711
  %241 = icmp sgt i32 %.521.lcssa, 0
  %..521 = select i1 %241, i32 %.521.lcssa, i32 0
  %242 = ptrtoint i32* %.3249.lcssa to i64
  %243 = ptrtoint i32* %34 to i64
  %244 = sub i64 %242, %243
  %245 = and i64 %244, 4
  %246 = icmp eq i64 %245, 0
  br i1 %246, label %249, label %247

; <label>:247:                                    ; preds = %240
  store i32 0, i32* %.3249.lcssa, align 4
  %248 = getelementptr inbounds i32, i32* %.3249.lcssa, i64 1
  br label %249

; <label>:249:                                    ; preds = %247, %240
  %.4250 = phi i32* [ %248, %247 ], [ %.3249.lcssa, %240 ]
  %250 = sub nsw i32 %9, %..521
  store i32 %250, i32* %.4250, align 4
  %251 = getelementptr inbounds i32, i32* %.4250, i64 1
  br label %758

; <label>:252:                                    ; preds = %._crit_edge711
  br i1 %.lcssa368, label %253, label %758

; <label>:253:                                    ; preds = %252
  %254 = getelementptr inbounds i32, i32* %.3249.lcssa, i64 2
  %255 = getelementptr inbounds i32, i32* %.3249.lcssa, i64 1
  store i32 %9, i32* %.3249.lcssa, align 4
  store i32 0, i32* %255, align 4
  br label %758

.loopexit353.loopexit:                            ; preds = %203
  br label %.loopexit353

.loopexit353.loopexit2187:                        ; preds = %152
  br label %.loopexit353

.loopexit353:                                     ; preds = %.loopexit353.loopexit2187, %.loopexit353.loopexit, %169, %220
  %.8254 = phi i32* [ %.0246, %169 ], [ %166, %220 ], [ %166, %.loopexit353.loopexit ], [ %.0246, %.loopexit353.loopexit2187 ]
  %.24206 = phi i8* [ %.17199, %169 ], [ %.22204, %220 ], [ %.22204, %.loopexit353.loopexit ], [ %.17199, %.loopexit353.loopexit2187 ]
  %.6154 = phi i32 [ %.1149, %169 ], [ %.2150, %220 ], [ %.2150, %.loopexit353.loopexit ], [ %.1149, %.loopexit353.loopexit2187 ]
  %.25108 = phi i32 [ %158, %169 ], [ %209, %220 ], [ %209, %.loopexit353.loopexit ], [ %158, %.loopexit353.loopexit2187 ]
  %.2562 = phi i32 [ %159, %169 ], [ %210, %220 ], [ %210, %.loopexit353.loopexit ], [ %159, %.loopexit353.loopexit2187 ]
  %.132 = phi i32 [ 0, %169 ], [ 0, %220 ], [ 1, %.loopexit353.loopexit ], [ 1, %.loopexit353.loopexit2187 ]
  %.824 = phi i32 [ %.117, %169 ], [ %.218, %220 ], [ %.218, %.loopexit353.loopexit ], [ %.117, %.loopexit353.loopexit2187 ]
  %256 = icmp eq i32 %.6154, 0
  br i1 %256, label %.thread, label %257

; <label>:257:                                    ; preds = %.loopexit353
  store i32 %.6154, i32* %.8254, align 4
  %258 = getelementptr inbounds i32, i32* %.8254, i64 1
  br label %.thread

.thread.loopexit:                                 ; preds = %162, %213
  %.824305.ph = phi i32 [ %167, %162 ], [ %218, %213 ]
  %.2562303.ph = phi i32 [ %159, %162 ], [ %210, %213 ]
  %.25108302.ph = phi i32 [ %158, %162 ], [ %209, %213 ]
  %.24206301.ph = phi i8* [ %.17199, %162 ], [ %.22204, %213 ]
  %.9255.ph = phi i32* [ %166, %162 ], [ %217, %213 ]
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.loopexit353, %257
  %.824305 = phi i32 [ %.824, %257 ], [ %.824, %.loopexit353 ], [ %.824305.ph, %.thread.loopexit ]
  %.132304 = phi i32 [ %.132, %257 ], [ %.132, %.loopexit353 ], [ 0, %.thread.loopexit ]
  %.2562303 = phi i32 [ %.2562, %257 ], [ %.2562, %.loopexit353 ], [ %.2562303.ph, %.thread.loopexit ]
  %.25108302 = phi i32 [ %.25108, %257 ], [ %.25108, %.loopexit353 ], [ %.25108302.ph, %.thread.loopexit ]
  %.24206301 = phi i8* [ %.24206, %257 ], [ %.24206, %.loopexit353 ], [ %.24206301.ph, %.thread.loopexit ]
  %.9255 = phi i32* [ %258, %257 ], [ %.8254, %.loopexit353 ], [ %.9255.ph, %.thread.loopexit ]
  %259 = icmp eq i32 %.824305, %9
  br i1 %259, label %738, label %260

; <label>:260:                                    ; preds = %.thread
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.824305, i32 %9)
  %261 = icmp sgt i32 %.824305, %9
  %262 = icmp ugt i32* %.9255, %34
  %.289729 = and i1 %262, %261
  br i1 %.289729, label %.lr.ph733.preheader, label %._crit_edge734

.lr.ph733.preheader:                              ; preds = %260
  br label %.lr.ph733

.lr.ph733:                                        ; preds = %.lr.ph733.preheader, %.lr.ph733
  %.1026731 = phi i32 [ %265, %.lr.ph733 ], [ %.824305, %.lr.ph733.preheader ]
  %.10256730 = phi i32* [ %263, %.lr.ph733 ], [ %.9255, %.lr.ph733.preheader ]
  %263 = getelementptr inbounds i32, i32* %.10256730, i64 -1
  %264 = load i32, i32* %263, align 4
  %265 = sub i32 %.1026731, %264
  %266 = icmp sgt i32 %265, %9
  %267 = icmp ugt i32* %263, %34
  %.289 = and i1 %267, %266
  br i1 %.289, label %.lr.ph733, label %._crit_edge734.loopexit

._crit_edge734.loopexit:                          ; preds = %.lr.ph733
  br label %._crit_edge734

._crit_edge734:                                   ; preds = %._crit_edge734.loopexit, %260
  %.10256.lcssa = phi i32* [ %.9255, %260 ], [ %263, %._crit_edge734.loopexit ]
  %.1026.lcssa = phi i32 [ %.824305, %260 ], [ %265, %._crit_edge734.loopexit ]
  %.lcssa439 = phi i1 [ %261, %260 ], [ %266, %._crit_edge734.loopexit ]
  %268 = icmp slt i32 %.1026.lcssa, %9
  br i1 %268, label %269, label %281

; <label>:269:                                    ; preds = %._crit_edge734
  %270 = icmp sgt i32 %.1026.lcssa, 0
  %..1026 = select i1 %270, i32 %.1026.lcssa, i32 0
  %271 = ptrtoint i32* %.10256.lcssa to i64
  %272 = ptrtoint i32* %34 to i64
  %273 = sub i64 %271, %272
  %274 = and i64 %273, 4
  %275 = icmp eq i64 %274, 0
  br i1 %275, label %278, label %276

; <label>:276:                                    ; preds = %269
  store i32 0, i32* %.10256.lcssa, align 4
  %277 = getelementptr inbounds i32, i32* %.10256.lcssa, i64 1
  br label %278

; <label>:278:                                    ; preds = %276, %269
  %.11257 = phi i32* [ %277, %276 ], [ %.10256.lcssa, %269 ]
  %279 = sub nsw i32 %9, %..1026
  store i32 %279, i32* %.11257, align 4
  %280 = getelementptr inbounds i32, i32* %.11257, i64 1
  br label %738

; <label>:281:                                    ; preds = %._crit_edge734
  br i1 %.lcssa439, label %282, label %738

; <label>:282:                                    ; preds = %281
  %283 = getelementptr inbounds i32, i32* %.10256.lcssa, i64 2
  %284 = getelementptr inbounds i32, i32* %.10256.lcssa, i64 1
  store i32 %9, i32* %.10256.lcssa, align 4
  store i32 0, i32* %284, align 4
  br label %738

.lr.ph754:                                        ; preds = %.lr.ph754.lr.ph, %.outer.backedge
  %.16.neg745813 = phi i32 [ 0, %.lr.ph754.lr.ph ], [ %.16.neg745, %.outer.backedge ]
  %.01.ph812 = phi i32* [ %119, %.lr.ph754.lr.ph ], [ %.01.ph.be, %.outer.backedge ]
  %.04.ph811 = phi i32 [ %120, %.lr.ph754.lr.ph ], [ %.04.ph.be, %.outer.backedge ]
  %.16.ph810 = phi i32 [ 0, %.lr.ph754.lr.ph ], [ %.16.ph.be, %.outer.backedge ]
  %.2663.ph809 = phi i32 [ %117, %.lr.ph754.lr.ph ], [ %.2663.ph.be, %.outer.backedge ]
  %.26109.ph808 = phi i32 [ %116, %.lr.ph754.lr.ph ], [ %.26109.ph.be, %.outer.backedge ]
  %.25207.ph807 = phi i8* [ %.11193, %.lr.ph754.lr.ph ], [ %.25207.ph.be, %.outer.backedge ]
  %.15261.ph801 = phi i32* [ %34, %.lr.ph754.lr.ph ], [ %.15261.ph.be, %.outer.backedge ]
  %285 = icmp eq i32* %.15261.ph801, %34
  br i1 %285, label %.lr.ph754.split.us.preheader, label %.lr.ph754.split.preheader

.lr.ph754.split.preheader:                        ; preds = %.lr.ph754
  br label %.lr.ph754.split

.lr.ph754.split.us.preheader:                     ; preds = %.lr.ph754
  br label %.lr.ph754.split.us

.lr.ph754.split.us:                               ; preds = %.lr.ph754.split.us.preheader, %311
  %.16.neg753.us = phi i32 [ %.16.neg.us, %311 ], [ %.16.neg745813, %.lr.ph754.split.us.preheader ]
  %.01752.us = phi i32* [ %317, %311 ], [ %.01.ph812, %.lr.ph754.split.us.preheader ]
  %.04751.us = phi i32 [ %319, %311 ], [ %.04.ph811, %.lr.ph754.split.us.preheader ]
  %.16750.us = phi i32 [ %314, %311 ], [ %.16.ph810, %.lr.ph754.split.us.preheader ]
  %.2663749.us = phi i32 [ %308, %311 ], [ %.2663.ph809, %.lr.ph754.split.us.preheader ]
  %.26109748.us = phi i32 [ %307, %311 ], [ %.26109.ph808, %.lr.ph754.split.us.preheader ]
  %.12160747.us = phi i32 [ %316, %311 ], [ 0, %.lr.ph754.split.us.preheader ]
  %.25207746.us = phi i8* [ %.27209.us, %311 ], [ %.25207.ph807, %.lr.ph754.split.us.preheader ]
  %286 = icmp slt i32 %.26109748.us, 7
  br i1 %286, label %287, label %301

; <label>:287:                                    ; preds = %.lr.ph754.split.us
  %288 = icmp ult i8* %.25207746.us, %17
  br i1 %288, label %291, label %289

; <label>:289:                                    ; preds = %287
  %290 = icmp eq i32 %.26109748.us, 0
  br i1 %290, label %.loopexit335.loopexit2176, label %301

; <label>:291:                                    ; preds = %287
  %292 = getelementptr inbounds i8, i8* %.25207746.us, i64 1
  %293 = load i8, i8* %.25207746.us, align 1
  %294 = zext i8 %293 to i64
  %295 = getelementptr inbounds i8, i8* %11, i64 %294
  %296 = load i8, i8* %295, align 1
  %297 = zext i8 %296 to i32
  %298 = shl i32 %297, %.26109748.us
  %299 = or i32 %298, %.2663749.us
  %300 = add nsw i32 %.26109748.us, 8
  br label %301

; <label>:301:                                    ; preds = %291, %289, %.lr.ph754.split.us
  %.27209.us = phi i8* [ %.25207746.us, %.lr.ph754.split.us ], [ %292, %291 ], [ %.25207746.us, %289 ]
  %.28111.us = phi i32 [ %.26109748.us, %.lr.ph754.split.us ], [ %300, %291 ], [ 7, %289 ]
  %.2865.us = phi i32 [ %.2663749.us, %.lr.ph754.split.us ], [ %299, %291 ], [ %.2663749.us, %289 ]
  %302 = and i32 %.2865.us, 127
  %303 = zext i32 %302 to i64
  %304 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %303, i32 1
  %305 = load i8, i8* %304, align 1
  %306 = zext i8 %305 to i32
  %307 = sub nsw i32 %.28111.us, %306
  %308 = lshr i32 %.2865.us, %306
  %309 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %303, i32 0
  %310 = load i8, i8* %309, align 4
  switch i8 %310, label %.loopexit358.loopexit [
    i8 1, label %311
    i8 2, label %.us-lcssa.us.loopexit
    i8 3, label %.us-lcssa768.us.loopexit
    i8 4, label %.us-lcssa769.us.loopexit
    i8 5, label %.us-lcssa770.us.loopexit
    i8 6, label %.us-lcssa771.us.loopexit
    i8 12, label %.us-lcssa772.us.loopexit
  ]

; <label>:311:                                    ; preds = %301
  %312 = getelementptr inbounds i32, i32* %.01752.us, i64 1
  %313 = load i32, i32* %.01752.us, align 4
  %314 = add i32 %313, %.04751.us
  %315 = add i32 %.16.neg753.us, %.12160747.us
  %316 = add i32 %315, %314
  %317 = getelementptr inbounds i32, i32* %.01752.us, i64 2
  %318 = load i32, i32* %312, align 4
  %319 = add i32 %314, %318
  %.16.neg.us = sub i32 0, %314
  %320 = icmp sgt i32 %9, %314
  br i1 %320, label %.lr.ph754.split.us, label %.outer._crit_edge.loopexit

.lr.ph754.split:                                  ; preds = %.lr.ph754.split.preheader, %.loopexit
  %.16.neg753 = phi i32 [ %.16.neg, %.loopexit ], [ %.16.neg745813, %.lr.ph754.split.preheader ]
  %.01752 = phi i32* [ %359, %.loopexit ], [ %.01.ph812, %.lr.ph754.split.preheader ]
  %.04751 = phi i32 [ %361, %.loopexit ], [ %.04.ph811, %.lr.ph754.split.preheader ]
  %.16750 = phi i32 [ %356, %.loopexit ], [ %.16.ph810, %.lr.ph754.split.preheader ]
  %.2663749 = phi i32 [ %343, %.loopexit ], [ %.2663.ph809, %.lr.ph754.split.preheader ]
  %.26109748 = phi i32 [ %342, %.loopexit ], [ %.26109.ph808, %.lr.ph754.split.preheader ]
  %.12160747 = phi i32 [ %358, %.loopexit ], [ 0, %.lr.ph754.split.preheader ]
  %.25207746 = phi i8* [ %.27209, %.loopexit ], [ %.25207.ph807, %.lr.ph754.split.preheader ]
  %321 = icmp slt i32 %.26109748, 7
  br i1 %321, label %322, label %336

; <label>:322:                                    ; preds = %.lr.ph754.split
  %323 = icmp ult i8* %.25207746, %17
  br i1 %323, label %326, label %324

; <label>:324:                                    ; preds = %322
  %325 = icmp eq i32 %.26109748, 0
  br i1 %325, label %.loopexit335.loopexit2177, label %336

; <label>:326:                                    ; preds = %322
  %327 = getelementptr inbounds i8, i8* %.25207746, i64 1
  %328 = load i8, i8* %.25207746, align 1
  %329 = zext i8 %328 to i64
  %330 = getelementptr inbounds i8, i8* %11, i64 %329
  %331 = load i8, i8* %330, align 1
  %332 = zext i8 %331 to i32
  %333 = shl i32 %332, %.26109748
  %334 = or i32 %333, %.2663749
  %335 = add nsw i32 %.26109748, 8
  br label %336

; <label>:336:                                    ; preds = %.lr.ph754.split, %324, %326
  %.27209 = phi i8* [ %.25207746, %.lr.ph754.split ], [ %327, %326 ], [ %.25207746, %324 ]
  %.28111 = phi i32 [ %.26109748, %.lr.ph754.split ], [ %335, %326 ], [ 7, %324 ]
  %.2865 = phi i32 [ %.2663749, %.lr.ph754.split ], [ %334, %326 ], [ %.2663749, %324 ]
  %337 = and i32 %.2865, 127
  %338 = zext i32 %337 to i64
  %339 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %338, i32 1
  %340 = load i8, i8* %339, align 1
  %341 = zext i8 %340 to i32
  %342 = sub nsw i32 %.28111, %341
  %343 = lshr i32 %.2865, %341
  %344 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %338, i32 0
  %345 = load i8, i8* %344, align 4
  switch i8 %345, label %.loopexit358.loopexit2178 [
    i8 1, label %.preheader
    i8 2, label %.us-lcssa.us.loopexit2179
    i8 3, label %.us-lcssa768.us.loopexit2180
    i8 4, label %.us-lcssa769.us.loopexit2181
    i8 5, label %.us-lcssa770.us.loopexit2182
    i8 6, label %.us-lcssa771.us.loopexit2183
    i8 12, label %.us-lcssa772.us.loopexit2184
  ]

.preheader:                                       ; preds = %336
  %346 = icmp slt i32 %.04751, %9
  %not.331738 = icmp sle i32 %.04751, %.16750
  %.290739 = and i1 %346, %not.331738
  br i1 %.290739, label %.lr.ph742.preheader, label %.loopexit

.lr.ph742.preheader:                              ; preds = %.preheader
  br label %.lr.ph742

.lr.ph742:                                        ; preds = %.lr.ph742.preheader, %.lr.ph742
  %.1741 = phi i32* [ %352, %.lr.ph742 ], [ %.01752, %.lr.ph742.preheader ]
  %.15740 = phi i32 [ %351, %.lr.ph742 ], [ %.04751, %.lr.ph742.preheader ]
  %347 = load i32, i32* %.1741, align 4
  %348 = getelementptr inbounds i32, i32* %.1741, i64 1
  %349 = load i32, i32* %348, align 4
  %350 = add i32 %347, %.15740
  %351 = add i32 %350, %349
  %352 = getelementptr inbounds i32, i32* %.1741, i64 2
  %353 = icmp slt i32 %351, %9
  %not.331 = icmp sle i32 %351, %.16750
  %.290 = and i1 %353, %not.331
  br i1 %.290, label %.lr.ph742, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph742
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader
  %.15.lcssa = phi i32 [ %.04751, %.preheader ], [ %351, %.loopexit.loopexit ]
  %.1.lcssa = phi i32* [ %.01752, %.preheader ], [ %352, %.loopexit.loopexit ]
  %354 = getelementptr inbounds i32, i32* %.1.lcssa, i64 1
  %355 = load i32, i32* %.1.lcssa, align 4
  %356 = add i32 %355, %.15.lcssa
  %357 = add i32 %.16.neg753, %.12160747
  %358 = add i32 %357, %356
  %359 = getelementptr inbounds i32, i32* %.1.lcssa, i64 2
  %360 = load i32, i32* %354, align 4
  %361 = add i32 %356, %360
  %.16.neg = sub i32 0, %356
  %362 = icmp sgt i32 %9, %356
  br i1 %362, label %.lr.ph754.split, label %.outer._crit_edge.loopexit2185

.us-lcssa.us.loopexit:                            ; preds = %301
  br label %.us-lcssa.us

.us-lcssa.us.loopexit2179:                        ; preds = %336
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit2179, %.us-lcssa.us.loopexit
  %.12160.lcssa518 = phi i32 [ %.12160747.us, %.us-lcssa.us.loopexit ], [ %.12160747, %.us-lcssa.us.loopexit2179 ]
  %.16.lcssa493 = phi i32 [ %.16750.us, %.us-lcssa.us.loopexit ], [ %.16750, %.us-lcssa.us.loopexit2179 ]
  %.04.lcssa485 = phi i32 [ %.04751.us, %.us-lcssa.us.loopexit ], [ %.04751, %.us-lcssa.us.loopexit2179 ]
  %.01.lcssa477 = phi i32* [ %.01752.us, %.us-lcssa.us.loopexit ], [ %.01752, %.us-lcssa.us.loopexit2179 ]
  %.27209.lcssa461 = phi i8* [ %.27209.us, %.us-lcssa.us.loopexit ], [ %.27209, %.us-lcssa.us.loopexit2179 ]
  %.lcssa448 = phi i32 [ %307, %.us-lcssa.us.loopexit ], [ %342, %.us-lcssa.us.loopexit2179 ]
  %.lcssa441 = phi i32 [ %308, %.us-lcssa.us.loopexit ], [ %343, %.us-lcssa.us.loopexit2179 ]
  %363 = ptrtoint i32* %.15261.ph801 to i64
  %364 = sub i64 %363, %122
  %365 = and i64 %364, 4
  %366 = icmp eq i64 %365, 0
  br i1 %366, label %.preheader337.preheader, label %.preheader342.preheader

.preheader342.preheader:                          ; preds = %.us-lcssa.us
  br label %.preheader342

.preheader337.preheader:                          ; preds = %.us-lcssa.us
  br label %.preheader337

.preheader342:                                    ; preds = %.preheader342.preheader, %411
  %.28210 = phi i8* [ %.32214, %411 ], [ %.27209.lcssa461, %.preheader342.preheader ]
  %.13161 = phi i32 [ %414, %411 ], [ %.12160.lcssa518, %.preheader342.preheader ]
  %.29112 = phi i32 [ %401, %411 ], [ %.lcssa448, %.preheader342.preheader ]
  %.2966 = phi i32 [ %402, %411 ], [ %.lcssa441, %.preheader342.preheader ]
  %.17 = phi i32 [ %415, %411 ], [ %.16.lcssa493, %.preheader342.preheader ]
  %367 = icmp slt i32 %.29112, 13
  br i1 %367, label %368, label %395

; <label>:368:                                    ; preds = %.preheader342
  %369 = icmp ult i8* %.28210, %17
  br i1 %369, label %372, label %370

; <label>:370:                                    ; preds = %368
  %371 = icmp eq i32 %.29112, 0
  br i1 %371, label %.loopexit335.loopexit2174, label %395

; <label>:372:                                    ; preds = %368
  %373 = getelementptr inbounds i8, i8* %.28210, i64 1
  %374 = load i8, i8* %.28210, align 1
  %375 = zext i8 %374 to i64
  %376 = getelementptr inbounds i8, i8* %11, i64 %375
  %377 = load i8, i8* %376, align 1
  %378 = zext i8 %377 to i32
  %379 = shl i32 %378, %.29112
  %380 = or i32 %379, %.2966
  %381 = add nsw i32 %.29112, 8
  %382 = icmp slt i32 %381, 13
  br i1 %382, label %383, label %395

; <label>:383:                                    ; preds = %372
  %384 = icmp ult i8* %373, %17
  br i1 %384, label %385, label %395

; <label>:385:                                    ; preds = %383
  %386 = getelementptr inbounds i8, i8* %.28210, i64 2
  %387 = load i8, i8* %373, align 1
  %388 = zext i8 %387 to i64
  %389 = getelementptr inbounds i8, i8* %11, i64 %388
  %390 = load i8, i8* %389, align 1
  %391 = zext i8 %390 to i32
  %392 = shl i32 %391, %381
  %393 = or i32 %392, %380
  %394 = add nsw i32 %.29112, 16
  br label %395

; <label>:395:                                    ; preds = %.preheader342, %372, %383, %385, %370
  %.32214 = phi i8* [ %.28210, %.preheader342 ], [ %.28210, %370 ], [ %373, %372 ], [ %386, %385 ], [ %373, %383 ]
  %.33116 = phi i32 [ %.29112, %.preheader342 ], [ 13, %370 ], [ %381, %372 ], [ %394, %385 ], [ 13, %383 ]
  %.3370 = phi i32 [ %.2966, %.preheader342 ], [ %.2966, %370 ], [ %380, %372 ], [ %393, %385 ], [ %380, %383 ]
  %396 = and i32 %.3370, 8191
  %397 = zext i32 %396 to i64
  %398 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %397, i32 1
  %399 = load i8, i8* %398, align 1
  %400 = zext i8 %399 to i32
  %401 = sub nsw i32 %.33116, %400
  %402 = lshr i32 %.3370, %400
  %403 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %397, i32 0
  %404 = load i8, i8* %403, align 4
  switch i8 %404, label %.loopexit336.loopexit2175 [
    i8 8, label %405
    i8 10, label %411
    i8 11, label %411
  ]

; <label>:405:                                    ; preds = %395
  %406 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %397, i32 2
  %407 = load i32, i32* %406, align 4
  %408 = add i32 %407, %.13161
  %409 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  store i32 %408, i32* %.15261.ph801, align 4
  %410 = add i32 %407, %.17
  br label %416

; <label>:411:                                    ; preds = %395, %395
  %412 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %397, i32 2
  %413 = load i32, i32* %412, align 4
  %414 = add i32 %413, %.13161
  %415 = add i32 %413, %.17
  br label %.preheader342

; <label>:416:                                    ; preds = %460, %405
  %.33215 = phi i8* [ %.32214, %405 ], [ %.37219, %460 ]
  %.14162 = phi i32 [ 0, %405 ], [ %463, %460 ]
  %.34117 = phi i32 [ %401, %405 ], [ %451, %460 ]
  %.3471 = phi i32 [ %402, %405 ], [ %452, %460 ]
  %.18 = phi i32 [ %410, %405 ], [ %464, %460 ]
  %417 = icmp slt i32 %.34117, 12
  br i1 %417, label %418, label %445

; <label>:418:                                    ; preds = %416
  %419 = icmp ult i8* %.33215, %17
  br i1 %419, label %422, label %420

; <label>:420:                                    ; preds = %418
  %421 = icmp eq i32 %.34117, 0
  br i1 %421, label %.loopexit335.loopexit2172, label %445

; <label>:422:                                    ; preds = %418
  %423 = getelementptr inbounds i8, i8* %.33215, i64 1
  %424 = load i8, i8* %.33215, align 1
  %425 = zext i8 %424 to i64
  %426 = getelementptr inbounds i8, i8* %11, i64 %425
  %427 = load i8, i8* %426, align 1
  %428 = zext i8 %427 to i32
  %429 = shl i32 %428, %.34117
  %430 = or i32 %429, %.3471
  %431 = add nsw i32 %.34117, 8
  %432 = icmp slt i32 %431, 12
  br i1 %432, label %433, label %445

; <label>:433:                                    ; preds = %422
  %434 = icmp ult i8* %423, %17
  br i1 %434, label %435, label %445

; <label>:435:                                    ; preds = %433
  %436 = getelementptr inbounds i8, i8* %.33215, i64 2
  %437 = load i8, i8* %423, align 1
  %438 = zext i8 %437 to i64
  %439 = getelementptr inbounds i8, i8* %11, i64 %438
  %440 = load i8, i8* %439, align 1
  %441 = zext i8 %440 to i32
  %442 = shl i32 %441, %431
  %443 = or i32 %442, %430
  %444 = add nsw i32 %.34117, 16
  br label %445

; <label>:445:                                    ; preds = %416, %422, %433, %435, %420
  %.37219 = phi i8* [ %.33215, %416 ], [ %.33215, %420 ], [ %423, %422 ], [ %436, %435 ], [ %423, %433 ]
  %.38121 = phi i32 [ %.34117, %416 ], [ 12, %420 ], [ %431, %422 ], [ %444, %435 ], [ 12, %433 ]
  %.3875 = phi i32 [ %.3471, %416 ], [ %.3471, %420 ], [ %430, %422 ], [ %443, %435 ], [ %430, %433 ]
  %446 = and i32 %.3875, 4095
  %447 = zext i32 %446 to i64
  %448 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %447, i32 1
  %449 = load i8, i8* %448, align 1
  %450 = zext i8 %449 to i32
  %451 = sub nsw i32 %.38121, %450
  %452 = lshr i32 %.3875, %450
  %453 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %447, i32 0
  %454 = load i8, i8* %453, align 4
  switch i8 %454, label %.loopexit339.loopexit2173 [
    i8 7, label %455
    i8 9, label %460
    i8 11, label %460
  ]

; <label>:455:                                    ; preds = %445
  %456 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %447, i32 2
  %457 = load i32, i32* %456, align 4
  %458 = add i32 %457, %.14162
  store i32 %458, i32* %409, align 4
  %459 = add i32 %457, %.18
  br label %563

; <label>:460:                                    ; preds = %445, %445
  %461 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %447, i32 2
  %462 = load i32, i32* %461, align 4
  %463 = add i32 %462, %.14162
  %464 = add i32 %462, %.18
  br label %416

.preheader337:                                    ; preds = %.preheader337.preheader, %509
  %.38220 = phi i8* [ %.42224, %509 ], [ %.27209.lcssa461, %.preheader337.preheader ]
  %.15163 = phi i32 [ %512, %509 ], [ %.12160.lcssa518, %.preheader337.preheader ]
  %.39122 = phi i32 [ %499, %509 ], [ %.lcssa448, %.preheader337.preheader ]
  %.3976 = phi i32 [ %500, %509 ], [ %.lcssa441, %.preheader337.preheader ]
  %.19 = phi i32 [ %513, %509 ], [ %.16.lcssa493, %.preheader337.preheader ]
  %465 = icmp slt i32 %.39122, 12
  br i1 %465, label %466, label %493

; <label>:466:                                    ; preds = %.preheader337
  %467 = icmp ult i8* %.38220, %17
  br i1 %467, label %470, label %468

; <label>:468:                                    ; preds = %466
  %469 = icmp eq i32 %.39122, 0
  br i1 %469, label %.loopexit335.loopexit2171, label %493

; <label>:470:                                    ; preds = %466
  %471 = getelementptr inbounds i8, i8* %.38220, i64 1
  %472 = load i8, i8* %.38220, align 1
  %473 = zext i8 %472 to i64
  %474 = getelementptr inbounds i8, i8* %11, i64 %473
  %475 = load i8, i8* %474, align 1
  %476 = zext i8 %475 to i32
  %477 = shl i32 %476, %.39122
  %478 = or i32 %477, %.3976
  %479 = add nsw i32 %.39122, 8
  %480 = icmp slt i32 %479, 12
  br i1 %480, label %481, label %493

; <label>:481:                                    ; preds = %470
  %482 = icmp ult i8* %471, %17
  br i1 %482, label %483, label %493

; <label>:483:                                    ; preds = %481
  %484 = getelementptr inbounds i8, i8* %.38220, i64 2
  %485 = load i8, i8* %471, align 1
  %486 = zext i8 %485 to i64
  %487 = getelementptr inbounds i8, i8* %11, i64 %486
  %488 = load i8, i8* %487, align 1
  %489 = zext i8 %488 to i32
  %490 = shl i32 %489, %479
  %491 = or i32 %490, %478
  %492 = add nsw i32 %.39122, 16
  br label %493

; <label>:493:                                    ; preds = %.preheader337, %470, %481, %483, %468
  %.42224 = phi i8* [ %.38220, %.preheader337 ], [ %.38220, %468 ], [ %471, %470 ], [ %484, %483 ], [ %471, %481 ]
  %.43126 = phi i32 [ %.39122, %.preheader337 ], [ 12, %468 ], [ %479, %470 ], [ %492, %483 ], [ 12, %481 ]
  %.4380 = phi i32 [ %.3976, %.preheader337 ], [ %.3976, %468 ], [ %478, %470 ], [ %491, %483 ], [ %478, %481 ]
  %494 = and i32 %.4380, 4095
  %495 = zext i32 %494 to i64
  %496 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %495, i32 1
  %497 = load i8, i8* %496, align 1
  %498 = zext i8 %497 to i32
  %499 = sub nsw i32 %.43126, %498
  %500 = lshr i32 %.4380, %498
  %501 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %495, i32 0
  %502 = load i8, i8* %501, align 4
  switch i8 %502, label %.loopexit339.loopexit [
    i8 7, label %503
    i8 9, label %509
    i8 11, label %509
  ]

; <label>:503:                                    ; preds = %493
  %504 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %495, i32 2
  %505 = load i32, i32* %504, align 4
  %506 = add i32 %505, %.15163
  %507 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  store i32 %506, i32* %.15261.ph801, align 4
  %508 = add i32 %505, %.19
  br label %514

; <label>:509:                                    ; preds = %493, %493
  %510 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxWhiteTable, i64 0, i64 %495, i32 2
  %511 = load i32, i32* %510, align 4
  %512 = add i32 %511, %.15163
  %513 = add i32 %511, %.19
  br label %.preheader337

; <label>:514:                                    ; preds = %558, %503
  %.43225 = phi i8* [ %.42224, %503 ], [ %.47229, %558 ]
  %.16164 = phi i32 [ 0, %503 ], [ %561, %558 ]
  %.44127 = phi i32 [ %499, %503 ], [ %549, %558 ]
  %.44 = phi i32 [ %500, %503 ], [ %550, %558 ]
  %.20 = phi i32 [ %508, %503 ], [ %562, %558 ]
  %515 = icmp slt i32 %.44127, 13
  br i1 %515, label %516, label %543

; <label>:516:                                    ; preds = %514
  %517 = icmp ult i8* %.43225, %17
  br i1 %517, label %520, label %518

; <label>:518:                                    ; preds = %516
  %519 = icmp eq i32 %.44127, 0
  br i1 %519, label %.loopexit335.loopexit, label %543

; <label>:520:                                    ; preds = %516
  %521 = getelementptr inbounds i8, i8* %.43225, i64 1
  %522 = load i8, i8* %.43225, align 1
  %523 = zext i8 %522 to i64
  %524 = getelementptr inbounds i8, i8* %11, i64 %523
  %525 = load i8, i8* %524, align 1
  %526 = zext i8 %525 to i32
  %527 = shl i32 %526, %.44127
  %528 = or i32 %527, %.44
  %529 = add nsw i32 %.44127, 8
  %530 = icmp slt i32 %529, 13
  br i1 %530, label %531, label %543

; <label>:531:                                    ; preds = %520
  %532 = icmp ult i8* %521, %17
  br i1 %532, label %533, label %543

; <label>:533:                                    ; preds = %531
  %534 = getelementptr inbounds i8, i8* %.43225, i64 2
  %535 = load i8, i8* %521, align 1
  %536 = zext i8 %535 to i64
  %537 = getelementptr inbounds i8, i8* %11, i64 %536
  %538 = load i8, i8* %537, align 1
  %539 = zext i8 %538 to i32
  %540 = shl i32 %539, %529
  %541 = or i32 %540, %528
  %542 = add nsw i32 %.44127, 16
  br label %543

; <label>:543:                                    ; preds = %514, %520, %531, %533, %518
  %.47229 = phi i8* [ %.43225, %514 ], [ %.43225, %518 ], [ %521, %520 ], [ %534, %533 ], [ %521, %531 ]
  %.48131 = phi i32 [ %.44127, %514 ], [ 13, %518 ], [ %529, %520 ], [ %542, %533 ], [ 13, %531 ]
  %.4881 = phi i32 [ %.44, %514 ], [ %.44, %518 ], [ %528, %520 ], [ %541, %533 ], [ %528, %531 ]
  %544 = and i32 %.4881, 8191
  %545 = zext i32 %544 to i64
  %546 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %545, i32 1
  %547 = load i8, i8* %546, align 1
  %548 = zext i8 %547 to i32
  %549 = sub nsw i32 %.48131, %548
  %550 = lshr i32 %.4881, %548
  %551 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %545, i32 0
  %552 = load i8, i8* %551, align 4
  switch i8 %552, label %.loopexit336.loopexit [
    i8 8, label %553
    i8 10, label %558
    i8 11, label %558
  ]

; <label>:553:                                    ; preds = %543
  %554 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %545, i32 2
  %555 = load i32, i32* %554, align 4
  %556 = add i32 %555, %.16164
  store i32 %556, i32* %507, align 4
  %557 = add i32 %555, %.20
  br label %563

; <label>:558:                                    ; preds = %543, %543
  %559 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxBlackTable, i64 0, i64 %545, i32 2
  %560 = load i32, i32* %559, align 4
  %561 = add i32 %560, %.16164
  %562 = add i32 %560, %.20
  br label %514

; <label>:563:                                    ; preds = %553, %455
  %.48230 = phi i8* [ %.37219, %455 ], [ %.47229, %553 ]
  %.49132 = phi i32 [ %451, %455 ], [ %549, %553 ]
  %.49 = phi i32 [ %452, %455 ], [ %550, %553 ]
  %.21 = phi i32 [ %459, %455 ], [ %557, %553 ]
  %.16262 = getelementptr inbounds i32, i32* %.15261.ph801, i64 2
  %564 = icmp eq i32* %.16262, %34
  br i1 %564, label %.outer.backedge, label %.preheader333

.preheader333:                                    ; preds = %563
  %565 = icmp slt i32 %.04.lcssa485, %9
  %not.330794 = icmp sle i32 %.04.lcssa485, %.21
  %.291795 = and i1 %565, %not.330794
  br i1 %.291795, label %.lr.ph798.preheader, label %.outer.backedge

.lr.ph798.preheader:                              ; preds = %.preheader333
  br label %.lr.ph798

.lr.ph798:                                        ; preds = %.lr.ph798.preheader, %.lr.ph798
  %.3797 = phi i32* [ %571, %.lr.ph798 ], [ %.01.lcssa477, %.lr.ph798.preheader ]
  %.37796 = phi i32 [ %570, %.lr.ph798 ], [ %.04.lcssa485, %.lr.ph798.preheader ]
  %566 = load i32, i32* %.3797, align 4
  %567 = getelementptr inbounds i32, i32* %.3797, i64 1
  %568 = load i32, i32* %567, align 4
  %569 = add i32 %566, %.37796
  %570 = add i32 %569, %568
  %571 = getelementptr inbounds i32, i32* %.3797, i64 2
  %572 = icmp slt i32 %570, %9
  %not.330 = icmp sle i32 %570, %.21
  %.291 = and i1 %572, %not.330
  br i1 %.291, label %.lr.ph798, label %.outer.backedge.loopexit

.us-lcssa768.us.loopexit:                         ; preds = %301
  br label %.us-lcssa768.us

.us-lcssa768.us.loopexit2180:                     ; preds = %336
  br label %.us-lcssa768.us

.us-lcssa768.us:                                  ; preds = %.us-lcssa768.us.loopexit2180, %.us-lcssa768.us.loopexit
  %.12160.lcssa519 = phi i32 [ %.12160747.us, %.us-lcssa768.us.loopexit ], [ %.12160747, %.us-lcssa768.us.loopexit2180 ]
  %.16.lcssa494 = phi i32 [ %.16750.us, %.us-lcssa768.us.loopexit ], [ %.16750, %.us-lcssa768.us.loopexit2180 ]
  %.04.lcssa486 = phi i32 [ %.04751.us, %.us-lcssa768.us.loopexit ], [ %.04751, %.us-lcssa768.us.loopexit2180 ]
  %.01.lcssa478 = phi i32* [ %.01752.us, %.us-lcssa768.us.loopexit ], [ %.01752, %.us-lcssa768.us.loopexit2180 ]
  %.16.neg.lcssa470 = phi i32 [ %.16.neg753.us, %.us-lcssa768.us.loopexit ], [ %.16.neg753, %.us-lcssa768.us.loopexit2180 ]
  %.27209.lcssa462 = phi i8* [ %.27209.us, %.us-lcssa768.us.loopexit ], [ %.27209, %.us-lcssa768.us.loopexit2180 ]
  %.lcssa449 = phi i32 [ %307, %.us-lcssa768.us.loopexit ], [ %342, %.us-lcssa768.us.loopexit2180 ]
  %.lcssa442 = phi i32 [ %308, %.us-lcssa768.us.loopexit ], [ %343, %.us-lcssa768.us.loopexit2180 ]
  %573 = icmp eq i32* %.15261.ph801, %34
  br i1 %573, label %.loopexit346, label %.preheader345

.preheader345:                                    ; preds = %.us-lcssa768.us
  %574 = icmp slt i32 %.04.lcssa486, %9
  %not.329787 = icmp sle i32 %.04.lcssa486, %.16.lcssa494
  %.292788 = and i1 %574, %not.329787
  br i1 %.292788, label %.lr.ph791.preheader, label %.loopexit346

.lr.ph791.preheader:                              ; preds = %.preheader345
  br label %.lr.ph791

.lr.ph791:                                        ; preds = %.lr.ph791.preheader, %.lr.ph791
  %.5790 = phi i32* [ %580, %.lr.ph791 ], [ %.01.lcssa478, %.lr.ph791.preheader ]
  %.59789 = phi i32 [ %579, %.lr.ph791 ], [ %.04.lcssa486, %.lr.ph791.preheader ]
  %575 = load i32, i32* %.5790, align 4
  %576 = getelementptr inbounds i32, i32* %.5790, i64 1
  %577 = load i32, i32* %576, align 4
  %578 = add i32 %575, %.59789
  %579 = add i32 %578, %577
  %580 = getelementptr inbounds i32, i32* %.5790, i64 2
  %581 = icmp slt i32 %579, %9
  %not.329 = icmp sle i32 %579, %.16.lcssa494
  %.292 = and i1 %581, %not.329
  br i1 %.292, label %.lr.ph791, label %.loopexit346.loopexit

.loopexit346.loopexit:                            ; preds = %.lr.ph791
  br label %.loopexit346

.loopexit346:                                     ; preds = %.loopexit346.loopexit, %.preheader345, %.us-lcssa768.us
  %.610 = phi i32 [ %.04.lcssa486, %.us-lcssa768.us ], [ %.04.lcssa486, %.preheader345 ], [ %579, %.loopexit346.loopexit ]
  %.6 = phi i32* [ %.01.lcssa478, %.us-lcssa768.us ], [ %.01.lcssa478, %.preheader345 ], [ %580, %.loopexit346.loopexit ]
  %582 = add i32 %.16.neg.lcssa470, %.12160.lcssa519
  %583 = add i32 %582, %.610
  store i32 %583, i32* %.15261.ph801, align 4
  %584 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  %585 = getelementptr inbounds i32, i32* %.6, i64 1
  %586 = load i32, i32* %.6, align 4
  %587 = add i32 %586, %.610
  br label %.outer.backedge

.us-lcssa769.us.loopexit:                         ; preds = %301
  br label %.us-lcssa769.us

.us-lcssa769.us.loopexit2181:                     ; preds = %336
  br label %.us-lcssa769.us

.us-lcssa769.us:                                  ; preds = %.us-lcssa769.us.loopexit2181, %.us-lcssa769.us.loopexit
  %.12160.lcssa520 = phi i32 [ %.12160747.us, %.us-lcssa769.us.loopexit ], [ %.12160747, %.us-lcssa769.us.loopexit2181 ]
  %.16.lcssa495 = phi i32 [ %.16750.us, %.us-lcssa769.us.loopexit ], [ %.16750, %.us-lcssa769.us.loopexit2181 ]
  %.04.lcssa487 = phi i32 [ %.04751.us, %.us-lcssa769.us.loopexit ], [ %.04751, %.us-lcssa769.us.loopexit2181 ]
  %.01.lcssa479 = phi i32* [ %.01752.us, %.us-lcssa769.us.loopexit ], [ %.01752, %.us-lcssa769.us.loopexit2181 ]
  %.16.neg.lcssa471 = phi i32 [ %.16.neg753.us, %.us-lcssa769.us.loopexit ], [ %.16.neg753, %.us-lcssa769.us.loopexit2181 ]
  %.27209.lcssa463 = phi i8* [ %.27209.us, %.us-lcssa769.us.loopexit ], [ %.27209, %.us-lcssa769.us.loopexit2181 ]
  %.lcssa457 = phi i64 [ %303, %.us-lcssa769.us.loopexit ], [ %338, %.us-lcssa769.us.loopexit2181 ]
  %.lcssa450 = phi i32 [ %307, %.us-lcssa769.us.loopexit ], [ %342, %.us-lcssa769.us.loopexit2181 ]
  %.lcssa443 = phi i32 [ %308, %.us-lcssa769.us.loopexit ], [ %343, %.us-lcssa769.us.loopexit2181 ]
  %588 = icmp eq i32* %.15261.ph801, %34
  br i1 %588, label %.loopexit348, label %.preheader347

.preheader347:                                    ; preds = %.us-lcssa769.us
  %589 = icmp slt i32 %.04.lcssa487, %9
  %not.328780 = icmp sle i32 %.04.lcssa487, %.16.lcssa495
  %.293781 = and i1 %589, %not.328780
  br i1 %.293781, label %.lr.ph784.preheader, label %.loopexit348

.lr.ph784.preheader:                              ; preds = %.preheader347
  br label %.lr.ph784

.lr.ph784:                                        ; preds = %.lr.ph784.preheader, %.lr.ph784
  %.7783 = phi i32* [ %595, %.lr.ph784 ], [ %.01.lcssa479, %.lr.ph784.preheader ]
  %.711782 = phi i32 [ %594, %.lr.ph784 ], [ %.04.lcssa487, %.lr.ph784.preheader ]
  %590 = load i32, i32* %.7783, align 4
  %591 = getelementptr inbounds i32, i32* %.7783, i64 1
  %592 = load i32, i32* %591, align 4
  %593 = add i32 %590, %.711782
  %594 = add i32 %593, %592
  %595 = getelementptr inbounds i32, i32* %.7783, i64 2
  %596 = icmp slt i32 %594, %9
  %not.328 = icmp sle i32 %594, %.16.lcssa495
  %.293 = and i1 %596, %not.328
  br i1 %.293, label %.lr.ph784, label %.loopexit348.loopexit

.loopexit348.loopexit:                            ; preds = %.lr.ph784
  br label %.loopexit348

.loopexit348:                                     ; preds = %.loopexit348.loopexit, %.preheader347, %.us-lcssa769.us
  %.812 = phi i32 [ %.04.lcssa487, %.us-lcssa769.us ], [ %.04.lcssa487, %.preheader347 ], [ %594, %.loopexit348.loopexit ]
  %.8 = phi i32* [ %.01.lcssa479, %.us-lcssa769.us ], [ %.01.lcssa479, %.preheader347 ], [ %595, %.loopexit348.loopexit ]
  %597 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %.lcssa457, i32 2
  %598 = load i32, i32* %597, align 4
  %599 = add i32 %.16.neg.lcssa471, %.12160.lcssa520
  %600 = add i32 %599, %.812
  %601 = add i32 %600, %598
  store i32 %601, i32* %.15261.ph801, align 4
  %602 = add i32 %598, %.812
  %603 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  %604 = getelementptr inbounds i32, i32* %.8, i64 1
  %605 = load i32, i32* %.8, align 4
  %606 = add i32 %605, %.812
  br label %.outer.backedge

.us-lcssa770.us.loopexit:                         ; preds = %301
  br label %.us-lcssa770.us

.us-lcssa770.us.loopexit2182:                     ; preds = %336
  br label %.us-lcssa770.us

.us-lcssa770.us:                                  ; preds = %.us-lcssa770.us.loopexit2182, %.us-lcssa770.us.loopexit
  %.12160.lcssa521 = phi i32 [ %.12160747.us, %.us-lcssa770.us.loopexit ], [ %.12160747, %.us-lcssa770.us.loopexit2182 ]
  %.16.lcssa496 = phi i32 [ %.16750.us, %.us-lcssa770.us.loopexit ], [ %.16750, %.us-lcssa770.us.loopexit2182 ]
  %.04.lcssa488 = phi i32 [ %.04751.us, %.us-lcssa770.us.loopexit ], [ %.04751, %.us-lcssa770.us.loopexit2182 ]
  %.01.lcssa480 = phi i32* [ %.01752.us, %.us-lcssa770.us.loopexit ], [ %.01752, %.us-lcssa770.us.loopexit2182 ]
  %.27209.lcssa464 = phi i8* [ %.27209.us, %.us-lcssa770.us.loopexit ], [ %.27209, %.us-lcssa770.us.loopexit2182 ]
  %.lcssa458 = phi i64 [ %303, %.us-lcssa770.us.loopexit ], [ %338, %.us-lcssa770.us.loopexit2182 ]
  %.lcssa451 = phi i32 [ %307, %.us-lcssa770.us.loopexit ], [ %342, %.us-lcssa770.us.loopexit2182 ]
  %.lcssa444 = phi i32 [ %308, %.us-lcssa770.us.loopexit ], [ %343, %.us-lcssa770.us.loopexit2182 ]
  %607 = icmp eq i32* %.15261.ph801, %34
  br i1 %607, label %.loopexit350, label %.preheader349

.preheader349:                                    ; preds = %.us-lcssa770.us
  %608 = icmp slt i32 %.04.lcssa488, %9
  %not.773 = icmp sle i32 %.04.lcssa488, %.16.lcssa496
  %.294774 = and i1 %608, %not.773
  br i1 %.294774, label %.lr.ph777.preheader, label %.loopexit350

.lr.ph777.preheader:                              ; preds = %.preheader349
  br label %.lr.ph777

.lr.ph777:                                        ; preds = %.lr.ph777.preheader, %.lr.ph777
  %.9776 = phi i32* [ %614, %.lr.ph777 ], [ %.01.lcssa480, %.lr.ph777.preheader ]
  %.913775 = phi i32 [ %613, %.lr.ph777 ], [ %.04.lcssa488, %.lr.ph777.preheader ]
  %609 = load i32, i32* %.9776, align 4
  %610 = getelementptr inbounds i32, i32* %.9776, i64 1
  %611 = load i32, i32* %610, align 4
  %612 = add i32 %609, %.913775
  %613 = add i32 %612, %611
  %614 = getelementptr inbounds i32, i32* %.9776, i64 2
  %615 = icmp slt i32 %613, %9
  %not. = icmp sle i32 %613, %.16.lcssa496
  %.294 = and i1 %615, %not.
  br i1 %.294, label %.lr.ph777, label %.loopexit350.loopexit

.loopexit350.loopexit:                            ; preds = %.lr.ph777
  br label %.loopexit350

.loopexit350:                                     ; preds = %.loopexit350.loopexit, %.preheader349, %.us-lcssa770.us
  %.1014 = phi i32 [ %.04.lcssa488, %.us-lcssa770.us ], [ %.04.lcssa488, %.preheader349 ], [ %613, %.loopexit350.loopexit ]
  %.10 = phi i32* [ %.01.lcssa480, %.us-lcssa770.us ], [ %.01.lcssa480, %.preheader349 ], [ %614, %.loopexit350.loopexit ]
  %616 = sub nsw i32 %.1014, %.16.lcssa496
  %617 = getelementptr inbounds [0 x %struct.TIFFFaxTabEnt], [0 x %struct.TIFFFaxTabEnt]* @TIFFFaxMainTable, i64 0, i64 %.lcssa458, i32 2
  %618 = load i32, i32* %617, align 4
  %619 = sub i32 %616, %618
  %620 = add i32 %619, %.12160.lcssa521
  store i32 %620, i32* %.15261.ph801, align 4
  %621 = add i32 %619, %.16.lcssa496
  %622 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  %623 = getelementptr inbounds i32, i32* %.10, i64 -1
  %624 = load i32, i32* %623, align 4
  %625 = sub i32 %.1014, %624
  br label %.outer.backedge

.outer.backedge.loopexit:                         ; preds = %.lr.ph798
  br label %.outer.backedge

.outer.backedge:                                  ; preds = %.outer.backedge.loopexit, %.preheader333, %.loopexit350, %.loopexit348, %.loopexit346, %563
  %.15261.ph.be = phi i32* [ %.16262, %563 ], [ %584, %.loopexit346 ], [ %603, %.loopexit348 ], [ %622, %.loopexit350 ], [ %.16262, %.preheader333 ], [ %.16262, %.outer.backedge.loopexit ]
  %.25207.ph.be = phi i8* [ %.48230, %563 ], [ %.27209.lcssa462, %.loopexit346 ], [ %.27209.lcssa463, %.loopexit348 ], [ %.27209.lcssa464, %.loopexit350 ], [ %.48230, %.preheader333 ], [ %.48230, %.outer.backedge.loopexit ]
  %.26109.ph.be = phi i32 [ %.49132, %563 ], [ %.lcssa449, %.loopexit346 ], [ %.lcssa450, %.loopexit348 ], [ %.lcssa451, %.loopexit350 ], [ %.49132, %.preheader333 ], [ %.49132, %.outer.backedge.loopexit ]
  %.2663.ph.be = phi i32 [ %.49, %563 ], [ %.lcssa442, %.loopexit346 ], [ %.lcssa443, %.loopexit348 ], [ %.lcssa444, %.loopexit350 ], [ %.49, %.preheader333 ], [ %.49, %.outer.backedge.loopexit ]
  %.16.ph.be = phi i32 [ %.21, %563 ], [ %.610, %.loopexit346 ], [ %602, %.loopexit348 ], [ %621, %.loopexit350 ], [ %.21, %.preheader333 ], [ %.21, %.outer.backedge.loopexit ]
  %.04.ph.be = phi i32 [ %.04.lcssa485, %563 ], [ %587, %.loopexit346 ], [ %606, %.loopexit348 ], [ %625, %.loopexit350 ], [ %.04.lcssa485, %.preheader333 ], [ %570, %.outer.backedge.loopexit ]
  %.01.ph.be = phi i32* [ %.01.lcssa477, %563 ], [ %585, %.loopexit346 ], [ %604, %.loopexit348 ], [ %623, %.loopexit350 ], [ %.01.lcssa477, %.preheader333 ], [ %571, %.outer.backedge.loopexit ]
  %.16.neg745 = sub i32 0, %.16.ph.be
  %626 = icmp sgt i32 %9, %.16.ph.be
  br i1 %626, label %.lr.ph754, label %.thread318.loopexit

.us-lcssa771.us.loopexit:                         ; preds = %301
  br label %.us-lcssa771.us

.us-lcssa771.us.loopexit2183:                     ; preds = %336
  br label %.us-lcssa771.us

.us-lcssa771.us:                                  ; preds = %.us-lcssa771.us.loopexit2183, %.us-lcssa771.us.loopexit
  %.12160.lcssa522 = phi i32 [ %.12160747.us, %.us-lcssa771.us.loopexit ], [ %.12160747, %.us-lcssa771.us.loopexit2183 ]
  %.16.lcssa497 = phi i32 [ %.16750.us, %.us-lcssa771.us.loopexit ], [ %.16750, %.us-lcssa771.us.loopexit2183 ]
  %.27209.lcssa465 = phi i8* [ %.27209.us, %.us-lcssa771.us.loopexit ], [ %.27209, %.us-lcssa771.us.loopexit2183 ]
  %.lcssa452 = phi i32 [ %307, %.us-lcssa771.us.loopexit ], [ %342, %.us-lcssa771.us.loopexit2183 ]
  %.lcssa445 = phi i32 [ %308, %.us-lcssa771.us.loopexit ], [ %343, %.us-lcssa771.us.loopexit2183 ]
  %627 = sub nsw i32 %9, %.16.lcssa497
  %628 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  store i32 %627, i32* %.15261.ph801, align 4
  tail call fastcc void @Fax3Extension(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.16.lcssa497)
  br label %708

.us-lcssa772.us.loopexit:                         ; preds = %301
  br label %.us-lcssa772.us

.us-lcssa772.us.loopexit2184:                     ; preds = %336
  br label %.us-lcssa772.us

.us-lcssa772.us:                                  ; preds = %.us-lcssa772.us.loopexit2184, %.us-lcssa772.us.loopexit
  %.12160.lcssa523 = phi i32 [ %.12160747.us, %.us-lcssa772.us.loopexit ], [ %.12160747, %.us-lcssa772.us.loopexit2184 ]
  %.16.lcssa498 = phi i32 [ %.16750.us, %.us-lcssa772.us.loopexit ], [ %.16750, %.us-lcssa772.us.loopexit2184 ]
  %.27209.lcssa466 = phi i8* [ %.27209.us, %.us-lcssa772.us.loopexit ], [ %.27209, %.us-lcssa772.us.loopexit2184 ]
  %.lcssa453 = phi i32 [ %307, %.us-lcssa772.us.loopexit ], [ %342, %.us-lcssa772.us.loopexit2184 ]
  %.lcssa446 = phi i32 [ %308, %.us-lcssa772.us.loopexit ], [ %343, %.us-lcssa772.us.loopexit2184 ]
  %629 = sub nsw i32 %9, %.16.lcssa498
  %630 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  store i32 %629, i32* %.15261.ph801, align 4
  %631 = icmp slt i32 %.lcssa453, 5
  br i1 %631, label %632, label %646

; <label>:632:                                    ; preds = %.us-lcssa772.us
  %633 = icmp ult i8* %.27209.lcssa466, %17
  br i1 %633, label %636, label %634

; <label>:634:                                    ; preds = %632
  %635 = icmp eq i32 %.lcssa453, 0
  br i1 %635, label %.loopexit335.loopexit2190, label %646

; <label>:636:                                    ; preds = %632
  %637 = getelementptr inbounds i8, i8* %.27209.lcssa466, i64 1
  %638 = load i8, i8* %.27209.lcssa466, align 1
  %639 = zext i8 %638 to i64
  %640 = getelementptr inbounds i8, i8* %11, i64 %639
  %641 = load i8, i8* %640, align 1
  %642 = zext i8 %641 to i32
  %643 = shl i32 %642, %.lcssa453
  %644 = or i32 %643, %.lcssa446
  %645 = add nsw i32 %.lcssa453, 8
  br label %646

; <label>:646:                                    ; preds = %.us-lcssa772.us, %634, %636
  %.50232 = phi i8* [ %.27209.lcssa466, %.us-lcssa772.us ], [ %637, %636 ], [ %.27209.lcssa466, %634 ]
  %.51134 = phi i32 [ %.lcssa453, %.us-lcssa772.us ], [ %645, %636 ], [ 5, %634 ]
  %.51 = phi i32 [ %.lcssa446, %.us-lcssa772.us ], [ %644, %636 ], [ %.lcssa446, %634 ]
  %647 = and i32 %.51, 31
  %648 = icmp eq i32 %647, 0
  br i1 %648, label %708, label %649

; <label>:649:                                    ; preds = %646
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.16.lcssa498)
  br label %708

.loopexit358.loopexit:                            ; preds = %301
  br label %.loopexit358

.loopexit358.loopexit2178:                        ; preds = %336
  br label %.loopexit358

.loopexit358:                                     ; preds = %.loopexit358.loopexit2178, %.loopexit358.loopexit, %700
  %.12160524 = phi i32 [ %.12160.lcssa, %700 ], [ %.12160747.us, %.loopexit358.loopexit ], [ %.12160747, %.loopexit358.loopexit2178 ]
  %.16499 = phi i32 [ %.16.lcssa, %700 ], [ %.16750.us, %.loopexit358.loopexit ], [ %.16750, %.loopexit358.loopexit2178 ]
  %.51233 = phi i8* [ %.57239, %700 ], [ %.27209.us, %.loopexit358.loopexit ], [ %.27209, %.loopexit358.loopexit2178 ]
  %.52135 = phi i32 [ %.58141, %700 ], [ %307, %.loopexit358.loopexit ], [ %342, %.loopexit358.loopexit2178 ]
  %.52 = phi i32 [ %.58, %700 ], [ %308, %.loopexit358.loopexit ], [ %343, %.loopexit358.loopexit2178 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.16499)
  br label %708

.loopexit336.loopexit:                            ; preds = %543
  br label %.loopexit336

.loopexit336.loopexit2175:                        ; preds = %395
  br label %.loopexit336

.loopexit336:                                     ; preds = %.loopexit336.loopexit2175, %.loopexit336.loopexit
  %.17263 = phi i32* [ %507, %.loopexit336.loopexit ], [ %.15261.ph801, %.loopexit336.loopexit2175 ]
  %.52234 = phi i8* [ %.47229, %.loopexit336.loopexit ], [ %.32214, %.loopexit336.loopexit2175 ]
  %.18166 = phi i32 [ %.16164, %.loopexit336.loopexit ], [ %.13161, %.loopexit336.loopexit2175 ]
  %.53136 = phi i32 [ %549, %.loopexit336.loopexit ], [ %401, %.loopexit336.loopexit2175 ]
  %.53 = phi i32 [ %550, %.loopexit336.loopexit ], [ %402, %.loopexit336.loopexit2175 ]
  %.22 = phi i32 [ %.20, %.loopexit336.loopexit ], [ %.17, %.loopexit336.loopexit2175 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.22)
  br label %708

.loopexit339.loopexit:                            ; preds = %493
  br label %.loopexit339

.loopexit339.loopexit2173:                        ; preds = %445
  br label %.loopexit339

.loopexit339:                                     ; preds = %.loopexit339.loopexit2173, %.loopexit339.loopexit
  %.18264 = phi i32* [ %.15261.ph801, %.loopexit339.loopexit ], [ %409, %.loopexit339.loopexit2173 ]
  %.53235 = phi i8* [ %.42224, %.loopexit339.loopexit ], [ %.37219, %.loopexit339.loopexit2173 ]
  %.19167 = phi i32 [ %.15163, %.loopexit339.loopexit ], [ %.14162, %.loopexit339.loopexit2173 ]
  %.54137 = phi i32 [ %499, %.loopexit339.loopexit ], [ %451, %.loopexit339.loopexit2173 ]
  %.54 = phi i32 [ %500, %.loopexit339.loopexit ], [ %452, %.loopexit339.loopexit2173 ]
  %.23 = phi i32 [ %.19, %.loopexit339.loopexit ], [ %.18, %.loopexit339.loopexit2173 ]
  tail call fastcc void @Fax3Unexpected(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.23)
  br label %708

.loopexit335.loopexit:                            ; preds = %518
  br label %.loopexit335

.loopexit335.loopexit2171:                        ; preds = %468
  br label %.loopexit335

.loopexit335.loopexit2172:                        ; preds = %420
  br label %.loopexit335

.loopexit335.loopexit2174:                        ; preds = %370
  br label %.loopexit335

.loopexit335.loopexit2176:                        ; preds = %289
  br label %.loopexit335

.loopexit335.loopexit2177:                        ; preds = %324
  br label %.loopexit335

.loopexit335.loopexit2190:                        ; preds = %634
  br label %.loopexit335

.loopexit335:                                     ; preds = %.loopexit335.loopexit2190, %.loopexit335.loopexit2177, %.loopexit335.loopexit2176, %.loopexit335.loopexit2174, %.loopexit335.loopexit2172, %.loopexit335.loopexit2171, %.loopexit335.loopexit
  %.19265 = phi i32* [ %507, %.loopexit335.loopexit ], [ %.15261.ph801, %.loopexit335.loopexit2171 ], [ %409, %.loopexit335.loopexit2172 ], [ %.15261.ph801, %.loopexit335.loopexit2174 ], [ %.15261.ph801, %.loopexit335.loopexit2176 ], [ %.15261.ph801, %.loopexit335.loopexit2177 ], [ %630, %.loopexit335.loopexit2190 ]
  %.54236 = phi i8* [ %.43225, %.loopexit335.loopexit ], [ %.38220, %.loopexit335.loopexit2171 ], [ %.33215, %.loopexit335.loopexit2172 ], [ %.28210, %.loopexit335.loopexit2174 ], [ %.25207746.us, %.loopexit335.loopexit2176 ], [ %.25207746, %.loopexit335.loopexit2177 ], [ %.27209.lcssa466, %.loopexit335.loopexit2190 ]
  %.20168 = phi i32 [ %.16164, %.loopexit335.loopexit ], [ %.15163, %.loopexit335.loopexit2171 ], [ %.14162, %.loopexit335.loopexit2172 ], [ %.13161, %.loopexit335.loopexit2174 ], [ %.12160747.us, %.loopexit335.loopexit2176 ], [ %.12160747, %.loopexit335.loopexit2177 ], [ %.12160.lcssa523, %.loopexit335.loopexit2190 ]
  %.55 = phi i32 [ %.44, %.loopexit335.loopexit ], [ %.3976, %.loopexit335.loopexit2171 ], [ %.3471, %.loopexit335.loopexit2172 ], [ %.2966, %.loopexit335.loopexit2174 ], [ %.2663749.us, %.loopexit335.loopexit2176 ], [ %.2663749, %.loopexit335.loopexit2177 ], [ %.lcssa446, %.loopexit335.loopexit2190 ]
  %.24 = phi i32 [ %.20, %.loopexit335.loopexit ], [ %.19, %.loopexit335.loopexit2171 ], [ %.18, %.loopexit335.loopexit2172 ], [ %.17, %.loopexit335.loopexit2174 ], [ %.16750.us, %.loopexit335.loopexit2176 ], [ %.16750, %.loopexit335.loopexit2177 ], [ %.16.lcssa498, %.loopexit335.loopexit2190 ]
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.24)
  %650 = icmp eq i32 %.20168, 0
  br i1 %650, label %653, label %651

; <label>:651:                                    ; preds = %.thread306, %.loopexit335
  %.24315 = phi i32 [ %.16.lcssa, %.thread306 ], [ %.24, %.loopexit335 ]
  %.55313 = phi i32 [ %.2663.lcssa, %.thread306 ], [ %.55, %.loopexit335 ]
  %.20168310 = phi i32 [ %.12160.lcssa, %.thread306 ], [ %.20168, %.loopexit335 ]
  %.54236308 = phi i8* [ %.25207.lcssa, %.thread306 ], [ %.54236, %.loopexit335 ]
  %.19265307 = phi i32* [ %.15261.ph801, %.thread306 ], [ %.19265, %.loopexit335 ]
  store i32 %.20168310, i32* %.19265307, align 4
  %652 = getelementptr inbounds i32, i32* %.19265307, i64 1
  br label %653

; <label>:653:                                    ; preds = %.loopexit335, %651
  %.24316 = phi i32 [ %.24315, %651 ], [ %.24, %.loopexit335 ]
  %.55314 = phi i32 [ %.55313, %651 ], [ %.55, %.loopexit335 ]
  %.54236309 = phi i8* [ %.54236308, %651 ], [ %.54236, %.loopexit335 ]
  %.20266 = phi i32* [ %652, %651 ], [ %.19265, %.loopexit335 ]
  %654 = icmp eq i32 %.24316, %9
  br i1 %654, label %758, label %655

; <label>:655:                                    ; preds = %653
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.24316, i32 %9)
  %656 = icmp sgt i32 %.24316, %9
  %657 = icmp ugt i32* %.20266, %34
  %.295701 = and i1 %657, %656
  br i1 %.295701, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %655
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.2629703 = phi i32 [ %660, %.lr.ph ], [ %.24316, %.lr.ph.preheader ]
  %.21267702 = phi i32* [ %658, %.lr.ph ], [ %.20266, %.lr.ph.preheader ]
  %658 = getelementptr inbounds i32, i32* %.21267702, i64 -1
  %659 = load i32, i32* %658, align 4
  %660 = sub i32 %.2629703, %659
  %661 = icmp sgt i32 %660, %9
  %662 = icmp ugt i32* %658, %34
  %.295 = and i1 %662, %661
  br i1 %.295, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %655
  %.21267.lcssa = phi i32* [ %.20266, %655 ], [ %658, %._crit_edge.loopexit ]
  %.2629.lcssa = phi i32 [ %.24316, %655 ], [ %660, %._crit_edge.loopexit ]
  %.lcssa = phi i1 [ %656, %655 ], [ %661, %._crit_edge.loopexit ]
  %663 = icmp slt i32 %.2629.lcssa, %9
  br i1 %663, label %664, label %676

; <label>:664:                                    ; preds = %._crit_edge
  %665 = icmp sgt i32 %.2629.lcssa, 0
  %..2629 = select i1 %665, i32 %.2629.lcssa, i32 0
  %666 = ptrtoint i32* %.21267.lcssa to i64
  %667 = ptrtoint i32* %34 to i64
  %668 = sub i64 %666, %667
  %669 = and i64 %668, 4
  %670 = icmp eq i64 %669, 0
  br i1 %670, label %673, label %671

; <label>:671:                                    ; preds = %664
  store i32 0, i32* %.21267.lcssa, align 4
  %672 = getelementptr inbounds i32, i32* %.21267.lcssa, i64 1
  br label %673

; <label>:673:                                    ; preds = %671, %664
  %.22268 = phi i32* [ %672, %671 ], [ %.21267.lcssa, %664 ]
  %674 = sub nsw i32 %9, %..2629
  store i32 %674, i32* %.22268, align 4
  %675 = getelementptr inbounds i32, i32* %.22268, i64 1
  br label %758

; <label>:676:                                    ; preds = %._crit_edge
  br i1 %.lcssa, label %677, label %758

; <label>:677:                                    ; preds = %676
  %678 = getelementptr inbounds i32, i32* %.21267.lcssa, i64 2
  %679 = getelementptr inbounds i32, i32* %.21267.lcssa, i64 1
  store i32 %9, i32* %.21267.lcssa, align 4
  store i32 0, i32* %679, align 4
  br label %758

.outer._crit_edge.loopexit:                       ; preds = %311
  br label %.outer._crit_edge

.outer._crit_edge.loopexit2185:                   ; preds = %.loopexit
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit2185, %.outer._crit_edge.loopexit
  %.25207.lcssa = phi i8* [ %.27209.us, %.outer._crit_edge.loopexit ], [ %.27209, %.outer._crit_edge.loopexit2185 ]
  %.12160.lcssa = phi i32 [ %316, %.outer._crit_edge.loopexit ], [ %358, %.outer._crit_edge.loopexit2185 ]
  %.26109.lcssa = phi i32 [ %307, %.outer._crit_edge.loopexit ], [ %342, %.outer._crit_edge.loopexit2185 ]
  %.2663.lcssa = phi i32 [ %308, %.outer._crit_edge.loopexit ], [ %343, %.outer._crit_edge.loopexit2185 ]
  %.16.lcssa = phi i32 [ %314, %.outer._crit_edge.loopexit ], [ %356, %.outer._crit_edge.loopexit2185 ]
  %680 = icmp eq i32 %.12160.lcssa, 0
  br i1 %680, label %.thread318, label %681

; <label>:681:                                    ; preds = %.outer._crit_edge
  %682 = add nsw i32 %.16.lcssa, %.12160.lcssa
  %683 = icmp slt i32 %682, %9
  br i1 %683, label %684, label %706

; <label>:684:                                    ; preds = %681
  %685 = icmp slt i32 %.26109.lcssa, 1
  br i1 %685, label %686, label %700

; <label>:686:                                    ; preds = %684
  %687 = icmp ult i8* %.25207.lcssa, %17
  br i1 %687, label %690, label %688

; <label>:688:                                    ; preds = %686
  %689 = icmp eq i32 %.26109.lcssa, 0
  br i1 %689, label %.thread306, label %700

.thread306:                                       ; preds = %688
  tail call fastcc void @Fax3PrematureEOF(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.16.lcssa)
  br label %651

; <label>:690:                                    ; preds = %686
  %691 = getelementptr inbounds i8, i8* %.25207.lcssa, i64 1
  %692 = load i8, i8* %.25207.lcssa, align 1
  %693 = zext i8 %692 to i64
  %694 = getelementptr inbounds i8, i8* %11, i64 %693
  %695 = load i8, i8* %694, align 1
  %696 = zext i8 %695 to i32
  %697 = shl i32 %696, %.26109.lcssa
  %698 = or i32 %697, %.2663.lcssa
  %699 = add nsw i32 %.26109.lcssa, 8
  br label %700

; <label>:700:                                    ; preds = %684, %688, %690
  %.57239 = phi i8* [ %.25207.lcssa, %684 ], [ %691, %690 ], [ %.25207.lcssa, %688 ]
  %.58141 = phi i32 [ %.26109.lcssa, %684 ], [ %699, %690 ], [ 1, %688 ]
  %.58 = phi i32 [ %.2663.lcssa, %684 ], [ %698, %690 ], [ %.2663.lcssa, %688 ]
  %701 = and i32 %.58, 1
  %702 = icmp eq i32 %701, 0
  br i1 %702, label %.loopexit358, label %703

; <label>:703:                                    ; preds = %700
  %704 = lshr i32 %.58, 1
  %705 = add nsw i32 %.58141, -1
  br label %706

; <label>:706:                                    ; preds = %681, %703
  %.58240 = phi i8* [ %.57239, %703 ], [ %.25207.lcssa, %681 ]
  %.59142 = phi i32 [ %705, %703 ], [ %.26109.lcssa, %681 ]
  %.5982 = phi i32 [ %704, %703 ], [ %.2663.lcssa, %681 ]
  store i32 %.12160.lcssa, i32* %.15261.ph801, align 4
  %707 = getelementptr inbounds i32, i32* %.15261.ph801, i64 1
  br label %.thread318

; <label>:708:                                    ; preds = %.us-lcssa771.us, %.loopexit358, %.loopexit336, %.loopexit339, %646, %649
  %.28274 = phi i32* [ %.15261.ph801, %.loopexit358 ], [ %628, %.us-lcssa771.us ], [ %.17263, %.loopexit336 ], [ %.18264, %.loopexit339 ], [ %630, %646 ], [ %630, %649 ]
  %.60242 = phi i8* [ %.51233, %.loopexit358 ], [ %.27209.lcssa465, %.us-lcssa771.us ], [ %.52234, %.loopexit336 ], [ %.53235, %.loopexit339 ], [ %.50232, %646 ], [ %.50232, %649 ]
  %.25173 = phi i32 [ %.12160524, %.loopexit358 ], [ %.12160.lcssa522, %.us-lcssa771.us ], [ %.18166, %.loopexit336 ], [ %.19167, %.loopexit339 ], [ %.12160.lcssa523, %646 ], [ %.12160.lcssa523, %649 ]
  %.61144 = phi i32 [ %.52135, %.loopexit358 ], [ %.lcssa452, %.us-lcssa771.us ], [ %.53136, %.loopexit336 ], [ %.54137, %.loopexit339 ], [ %.51134, %646 ], [ %.51134, %649 ]
  %.61 = phi i32 [ %.52, %.loopexit358 ], [ %.lcssa445, %.us-lcssa771.us ], [ %.53, %.loopexit336 ], [ %.54, %.loopexit339 ], [ %.51, %646 ], [ %.51, %649 ]
  %.233 = phi i32 [ 0, %.loopexit358 ], [ 0, %.us-lcssa771.us ], [ 0, %.loopexit336 ], [ 0, %.loopexit339 ], [ 1, %646 ], [ 1, %649 ]
  %.31 = phi i32 [ %.16499, %.loopexit358 ], [ %.16.lcssa497, %.us-lcssa771.us ], [ %.22, %.loopexit336 ], [ %.23, %.loopexit339 ], [ %.16.lcssa498, %646 ], [ %.16.lcssa498, %649 ]
  %709 = icmp eq i32 %.25173, 0
  br i1 %709, label %.thread318, label %710

; <label>:710:                                    ; preds = %708
  store i32 %.25173, i32* %.28274, align 4
  %711 = getelementptr inbounds i32, i32* %.28274, i64 1
  br label %.thread318

.thread318.loopexit:                              ; preds = %.outer.backedge
  br label %.thread318

.thread318:                                       ; preds = %.thread318.loopexit, %.preheader356, %.outer._crit_edge, %706, %708, %710
  %.31323 = phi i32 [ %.31, %710 ], [ %.31, %708 ], [ %.16.lcssa, %706 ], [ %.16.lcssa, %.outer._crit_edge ], [ 0, %.preheader356 ], [ %.16.ph.be, %.thread318.loopexit ]
  %.233322 = phi i32 [ %.233, %710 ], [ %.233, %708 ], [ 0, %706 ], [ 0, %.outer._crit_edge ], [ 0, %.preheader356 ], [ 0, %.thread318.loopexit ]
  %.61321 = phi i32 [ %.61, %710 ], [ %.61, %708 ], [ %.5982, %706 ], [ %.2663.lcssa, %.outer._crit_edge ], [ %117, %.preheader356 ], [ %.2663.ph.be, %.thread318.loopexit ]
  %.61144320 = phi i32 [ %.61144, %710 ], [ %.61144, %708 ], [ %.59142, %706 ], [ %.26109.lcssa, %.outer._crit_edge ], [ %116, %.preheader356 ], [ %.26109.ph.be, %.thread318.loopexit ]
  %.60242319 = phi i8* [ %.60242, %710 ], [ %.60242, %708 ], [ %.58240, %706 ], [ %.25207.lcssa, %.outer._crit_edge ], [ %.11193, %.preheader356 ], [ %.25207.ph.be, %.thread318.loopexit ]
  %.29275 = phi i32* [ %711, %710 ], [ %.28274, %708 ], [ %707, %706 ], [ %.15261.ph801, %.outer._crit_edge ], [ %34, %.preheader356 ], [ %.15261.ph.be, %.thread318.loopexit ]
  %712 = icmp eq i32 %.31323, %9
  br i1 %712, label %738, label %713

; <label>:713:                                    ; preds = %.thread318
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 %.31323, i32 %9)
  %714 = icmp sgt i32 %.31323, %9
  %715 = icmp ugt i32* %.29275, %34
  %.296820 = and i1 %715, %714
  br i1 %.296820, label %.lr.ph824.preheader, label %._crit_edge825

.lr.ph824.preheader:                              ; preds = %713
  br label %.lr.ph824

.lr.ph824:                                        ; preds = %.lr.ph824.preheader, %.lr.ph824
  %.33822 = phi i32 [ %718, %.lr.ph824 ], [ %.31323, %.lr.ph824.preheader ]
  %.30276821 = phi i32* [ %716, %.lr.ph824 ], [ %.29275, %.lr.ph824.preheader ]
  %716 = getelementptr inbounds i32, i32* %.30276821, i64 -1
  %717 = load i32, i32* %716, align 4
  %718 = sub i32 %.33822, %717
  %719 = icmp sgt i32 %718, %9
  %720 = icmp ugt i32* %716, %34
  %.296 = and i1 %720, %719
  br i1 %.296, label %.lr.ph824, label %._crit_edge825.loopexit

._crit_edge825.loopexit:                          ; preds = %.lr.ph824
  br label %._crit_edge825

._crit_edge825:                                   ; preds = %._crit_edge825.loopexit, %713
  %.30276.lcssa = phi i32* [ %.29275, %713 ], [ %716, %._crit_edge825.loopexit ]
  %.33.lcssa = phi i32 [ %.31323, %713 ], [ %718, %._crit_edge825.loopexit ]
  %.lcssa611 = phi i1 [ %714, %713 ], [ %719, %._crit_edge825.loopexit ]
  %721 = icmp slt i32 %.33.lcssa, %9
  br i1 %721, label %722, label %734

; <label>:722:                                    ; preds = %._crit_edge825
  %723 = icmp sgt i32 %.33.lcssa, 0
  %..33 = select i1 %723, i32 %.33.lcssa, i32 0
  %724 = ptrtoint i32* %.30276.lcssa to i64
  %725 = ptrtoint i32* %34 to i64
  %726 = sub i64 %724, %725
  %727 = and i64 %726, 4
  %728 = icmp eq i64 %727, 0
  br i1 %728, label %731, label %729

; <label>:729:                                    ; preds = %722
  store i32 0, i32* %.30276.lcssa, align 4
  %730 = getelementptr inbounds i32, i32* %.30276.lcssa, i64 1
  br label %731

; <label>:731:                                    ; preds = %729, %722
  %.31277 = phi i32* [ %730, %729 ], [ %.30276.lcssa, %722 ]
  %732 = sub nsw i32 %9, %..33
  store i32 %732, i32* %.31277, align 4
  %733 = getelementptr inbounds i32, i32* %.31277, i64 1
  br label %738

; <label>:734:                                    ; preds = %._crit_edge825
  br i1 %.lcssa611, label %735, label %738

; <label>:735:                                    ; preds = %734
  %736 = getelementptr inbounds i32, i32* %.30276.lcssa, i64 2
  %737 = getelementptr inbounds i32, i32* %.30276.lcssa, i64 1
  store i32 %9, i32* %.30276.lcssa, align 4
  store i32 0, i32* %737, align 4
  br label %738

; <label>:738:                                    ; preds = %.thread318, %734, %735, %731, %.thread, %281, %282, %278
  %.35281 = phi i32* [ %.9255, %.thread ], [ %280, %278 ], [ %283, %282 ], [ %.10256.lcssa, %281 ], [ %.29275, %.thread318 ], [ %733, %731 ], [ %736, %735 ], [ %.30276.lcssa, %734 ]
  %.61243 = phi i8* [ %.24206301, %.thread ], [ %.24206301, %278 ], [ %.24206301, %282 ], [ %.24206301, %281 ], [ %.60242319, %.thread318 ], [ %.60242319, %731 ], [ %.60242319, %735 ], [ %.60242319, %734 ]
  %.62145 = phi i32 [ %.25108302, %.thread ], [ %.25108302, %278 ], [ %.25108302, %282 ], [ %.25108302, %281 ], [ %.61144320, %.thread318 ], [ %.61144320, %731 ], [ %.61144320, %735 ], [ %.61144320, %734 ]
  %.62 = phi i32 [ %.2562303, %.thread ], [ %.2562303, %278 ], [ %.2562303, %282 ], [ %.2562303, %281 ], [ %.61321, %.thread318 ], [ %.61321, %731 ], [ %.61321, %735 ], [ %.61321, %734 ]
  %.334 = phi i32 [ %.132304, %.thread ], [ %.132304, %278 ], [ %.132304, %282 ], [ %.132304, %281 ], [ %.233322, %.thread318 ], [ %.233322, %731 ], [ %.233322, %735 ], [ %.233322, %734 ]
  %739 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %28, align 8
  tail call void %739(i8* %.02834, i32* %34, i32* %.35281, i32 %9) #5
  store i32 0, i32* %.35281, align 4
  %740 = load i64, i64* %29, align 8
  %741 = load i64, i64* %30, align 8
  store i64 %741, i64* %29, align 8
  store i64 %740, i64* %30, align 8
  %742 = load i32, i32* %31, align 4
  %743 = sub i32 %.03833, %742
  %744 = icmp eq i32 %743, 0
  br i1 %744, label %.loopexit365.loopexit, label %.backedge

.backedge:                                        ; preds = %738
  %745 = zext i32 %742 to i64
  %746 = getelementptr inbounds i8, i8* %.02834, i64 %745
  %747 = load i32, i32* %32, align 8
  %748 = add i32 %747, 1
  store i32 %748, i32* %32, align 8
  %749 = icmp sgt i32 %743, 0
  br i1 %749, label %33, label %.loopexit365.loopexit

.loopexit362.loopexit:                            ; preds = %73
  br label %.loopexit362

.loopexit362.loopexit2188:                        ; preds = %39
  br label %.loopexit362

.loopexit362.loopexit2189:                        ; preds = %102
  br label %.loopexit362

.loopexit362:                                     ; preds = %.loopexit362.loopexit2189, %.loopexit362.loopexit2188, %.loopexit362.loopexit
  %.62244 = phi i8* [ %.7189, %.loopexit362.loopexit ], [ %.1183, %.loopexit362.loopexit2188 ], [ %.9191, %.loopexit362.loopexit2189 ]
  %.63 = phi i32 [ %.744, %.loopexit362.loopexit ], [ %.138, %.loopexit362.loopexit2188 ], [ %98, %.loopexit362.loopexit2189 ]
  %.435 = phi i32 [ %.031832, %.loopexit362.loopexit ], [ %.031832, %.loopexit362.loopexit2188 ], [ 0, %.loopexit362.loopexit2189 ]
  %750 = icmp eq i32 %9, 0
  br i1 %750, label %758, label %751

; <label>:751:                                    ; preds = %.loopexit362
  tail call fastcc void @Fax3BadLength(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @Fax3Decode2D.module, i64 0, i64 0), %struct.tiff* %0, i32 0, i32 %9)
  %752 = icmp sgt i32 %9, 0
  br i1 %752, label %753, label %755

; <label>:753:                                    ; preds = %751
  store i32 %9, i32* %34, align 4
  %754 = getelementptr inbounds i32, i32* %34, i64 1
  br label %758

; <label>:755:                                    ; preds = %751
  %756 = getelementptr inbounds i32, i32* %34, i64 1
  store i32 %9, i32* %34, align 4
  store i32 0, i32* %756, align 4
  %757 = getelementptr inbounds i32, i32* %34, i64 2
  br label %758

; <label>:758:                                    ; preds = %753, %755, %.loopexit362, %673, %677, %676, %653, %249, %253, %252, %229
  %.42288 = phi i32* [ %.2248, %229 ], [ %251, %249 ], [ %254, %253 ], [ %.3249.lcssa, %252 ], [ %.20266, %653 ], [ %675, %673 ], [ %678, %677 ], [ %.21267.lcssa, %676 ], [ %34, %.loopexit362 ], [ %754, %753 ], [ %757, %755 ]
  %.63245 = phi i8* [ %.23205, %229 ], [ %.23205, %249 ], [ %.23205, %253 ], [ %.23205, %252 ], [ %.54236309, %653 ], [ %.54236309, %673 ], [ %.54236309, %677 ], [ %.54236309, %676 ], [ %.62244, %.loopexit362 ], [ %.62244, %753 ], [ %.62244, %755 ]
  %.64 = phi i32 [ %.2461, %229 ], [ %.2461, %249 ], [ %.2461, %253 ], [ %.2461, %252 ], [ %.55314, %653 ], [ %.55314, %673 ], [ %.55314, %677 ], [ %.55314, %676 ], [ %.63, %.loopexit362 ], [ %.63, %753 ], [ %.63, %755 ]
  %.536 = phi i32 [ 0, %229 ], [ 0, %249 ], [ 0, %253 ], [ 0, %252 ], [ 0, %653 ], [ 0, %673 ], [ 0, %677 ], [ 0, %676 ], [ %.435, %.loopexit362 ], [ %.435, %753 ], [ %.435, %755 ]
  %759 = getelementptr inbounds %struct.Fax3DecodeState, %struct.Fax3DecodeState* %7, i64 0, i32 5
  %760 = load void (i8*, i32*, i32*, i32)*, void (i8*, i32*, i32*, i32)** %759, align 8
  tail call void %760(i8* %.02834, i32* %34, i32* %.42288, i32 %9) #5
  br label %.loopexit365

.loopexit365.loopexit:                            ; preds = %.backedge, %738
  br label %.loopexit365

.loopexit365:                                     ; preds = %.loopexit365.loopexit, %4, %758
  %.083.sink = phi i32 [ 0, %758 ], [ %21, %4 ], [ %.62145, %.loopexit365.loopexit ]
  %.037.sink = phi i32 [ %.64, %758 ], [ %23, %4 ], [ %.62, %.loopexit365.loopexit ]
  %.031.sink = phi i32 [ %.536, %758 ], [ %19, %4 ], [ %.334, %.loopexit365.loopexit ]
  %.0182.sink327 = phi i8* [ %.63245, %758 ], [ %13, %4 ], [ %.61243, %.loopexit365.loopexit ]
  %.0 = phi i32 [ -1, %758 ], [ 1, %4 ], [ 1, %.loopexit365.loopexit ]
  store i32 %.083.sink, i32* %20, align 4
  store i32 %.037.sink, i32* %22, align 8
  store i32 %.031.sink, i32* %18, align 8
  %761 = bitcast i8** %12 to i64*
  %762 = load i64, i64* %761, align 8
  %763 = ptrtoint i8* %.0182.sink327 to i64
  %764 = load i32, i32* %14, align 8
  %765 = zext i32 %764 to i64
  %766 = sub i64 %762, %763
  %767 = add i64 %766, %765
  %768 = trunc i64 %767 to i32
  store i32 %768, i32* %14, align 8
  store i8* %.0182.sink327, i8** %12, align 8
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3Unexpected(i8*, %struct.tiff* nocapture readonly, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 11
  %7 = load i32, i32* %6, align 8
  %8 = zext i32 %2 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.34, i64 0, i64 0), i8* %5, i32 %7, i64 %8) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3PrematureEOF(i8*, %struct.tiff* nocapture readonly, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 11
  %7 = load i32, i32* %6, align 8
  %8 = zext i32 %2 to i64
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.35, i64 0, i64 0), i8* %5, i32 %7, i64 %8) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3BadLength(i8*, %struct.tiff* nocapture readonly, i32, i32) unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 0
  %6 = load i8*, i8** %5, align 8
  %7 = icmp ult i32 %2, %3
  %8 = select i1 %7, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.37, i64 0, i64 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.38, i64 0, i64 0)
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 11
  %10 = load i32, i32* %9, align 8
  %11 = zext i32 %2 to i64
  %12 = zext i32 %3 to i64
  tail call void (i8*, i8*, ...) @TIFFWarning(i8* %0, i8* getelementptr inbounds ([46 x i8], [46 x i8]* @.str.36, i64 0, i64 0), i8* %6, i8* %8, i32 %10, i64 %11, i64 %12) #5
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3Extension(i8*, %struct.tiff* nocapture readonly, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %1, i64 0, i32 11
  %7 = load i32, i32* %6, align 8
  %8 = zext i32 %2 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %0, i8* getelementptr inbounds ([61 x i8], [61 x i8]* @.str.39, i64 0, i64 0), i8* %5, i32 %7, i64 %8) #5
  ret void
}

declare void @TIFFWarning(i8*, i8*, ...) local_unnamed_addr #2

declare i8* @TIFFGetBitRevTable(i32) local_unnamed_addr #2

declare void @_TIFFmemset(i8*, i32, i32) local_unnamed_addr #2

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3PutEOL(%struct.tiff*) unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %3 = bitcast i8** %2 to %struct.Fax3EncodeState**
  %4 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %3, align 8
  %5 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 1
  %8 = load i32, i32* %7, align 8
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 0, i32 6
  %10 = load i32, i32* %9, align 8
  %11 = and i32 %10, 4
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %52, label %13

; <label>:13:                                     ; preds = %1
  %14 = icmp eq i32 %6, 4
  br i1 %14, label %52, label %15

; <label>:15:                                     ; preds = %13
  %16 = icmp slt i32 %6, 4
  %.sink = select i1 %16, i32 4, i32 -4
  %17 = add nsw i32 %.sink, %6
  %18 = icmp ugt i32 %17, %6
  br i1 %18, label %.lr.ph21, label %._crit_edge22

.lr.ph21:                                         ; preds = %15
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %phitmp = trunc i32 %8 to i8
  br label %22

; <label>:22:                                     ; preds = %.lr.ph21, %29
  %.0119 = phi i32 [ %17, %.lr.ph21 ], [ %23, %29 ]
  %.0218 = phi i32 [ %6, %.lr.ph21 ], [ 8, %29 ]
  %.0317 = phi i8 [ %phitmp, %.lr.ph21 ], [ 0, %29 ]
  %23 = sub i32 %.0119, %.0218
  %24 = load i32, i32* %19, align 8
  %25 = load i32, i32* %20, align 8
  %26 = icmp slt i32 %24, %25
  br i1 %26, label %29, label %27

; <label>:27:                                     ; preds = %22
  %28 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %29

; <label>:29:                                     ; preds = %22, %27
  %30 = load i8*, i8** %21, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 1
  store i8* %31, i8** %21, align 8
  store i8 %.0317, i8* %30, align 1
  %32 = load i32, i32* %19, align 8
  %33 = add nsw i32 %32, 1
  store i32 %33, i32* %19, align 8
  %34 = icmp ugt i32 %23, 8
  br i1 %34, label %22, label %._crit_edge22.loopexit

._crit_edge22.loopexit:                           ; preds = %29
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22.loopexit, %15
  %.03.lcssa = phi i32 [ %8, %15 ], [ 0, %._crit_edge22.loopexit ]
  %.02.lcssa = phi i32 [ %6, %15 ], [ 8, %._crit_edge22.loopexit ]
  %.01.lcssa = phi i32 [ %17, %15 ], [ %23, %._crit_edge22.loopexit ]
  %35 = sub i32 %.02.lcssa, %.01.lcssa
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %37, label %52

; <label>:37:                                     ; preds = %._crit_edge22
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %39 = load i32, i32* %38, align 8
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %41 = load i32, i32* %40, align 8
  %42 = icmp slt i32 %39, %41
  br i1 %42, label %45, label %43

; <label>:43:                                     ; preds = %37
  %44 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %45

; <label>:45:                                     ; preds = %37, %43
  %46 = trunc i32 %.03.lcssa to i8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %48 = load i8*, i8** %47, align 8
  %49 = getelementptr inbounds i8, i8* %48, i64 1
  store i8* %49, i8** %47, align 8
  store i8 %46, i8* %48, align 1
  %50 = load i32, i32* %38, align 8
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %38, align 8
  br label %52

; <label>:52:                                     ; preds = %13, %45, %._crit_edge22, %1
  %.36 = phi i32 [ %8, %1 ], [ %8, %13 ], [ 0, %45 ], [ %.03.lcssa, %._crit_edge22 ]
  %.3 = phi i32 [ %6, %1 ], [ 4, %13 ], [ 8, %45 ], [ %35, %._crit_edge22 ]
  %53 = load i32, i32* %9, align 8
  %54 = and i32 %53, 1
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %62, label %56

; <label>:56:                                     ; preds = %52
  %57 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %4, i64 0, i32 3
  %58 = load i32, i32* %57, align 8
  %59 = icmp eq i32 %58, 0
  %60 = zext i1 %59 to i32
  %61 = or i32 %60, 2
  br label %62

; <label>:62:                                     ; preds = %52, %56
  %.010 = phi i32 [ 13, %56 ], [ 12, %52 ]
  %.09 = phi i32 [ %61, %56 ], [ 1, %52 ]
  %63 = icmp ugt i32 %.010, %.3
  br i1 %63, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %62
  %64 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %65 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %67

; <label>:67:                                     ; preds = %.lr.ph, %76
  %.414 = phi i32 [ %.3, %.lr.ph ], [ 8, %76 ]
  %.4713 = phi i32 [ %.36, %.lr.ph ], [ 0, %76 ]
  %.11112 = phi i32 [ %.010, %.lr.ph ], [ %68, %76 ]
  %68 = sub i32 %.11112, %.414
  %69 = lshr i32 %.09, %68
  %70 = or i32 %69, %.4713
  %71 = load i32, i32* %64, align 8
  %72 = load i32, i32* %65, align 8
  %73 = icmp slt i32 %71, %72
  br i1 %73, label %76, label %74

; <label>:74:                                     ; preds = %67
  %75 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %76

; <label>:76:                                     ; preds = %67, %74
  %77 = trunc i32 %70 to i8
  %78 = load i8*, i8** %66, align 8
  %79 = getelementptr inbounds i8, i8* %78, i64 1
  store i8* %79, i8** %66, align 8
  store i8 %77, i8* %78, align 1
  %80 = load i32, i32* %64, align 8
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %64, align 8
  %82 = icmp ugt i32 %68, 8
  br i1 %82, label %67, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %76
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %62
  %.111.lcssa = phi i32 [ %.010, %62 ], [ %68, %._crit_edge.loopexit ]
  %.47.lcssa = phi i32 [ %.36, %62 ], [ 0, %._crit_edge.loopexit ]
  %.4.lcssa = phi i32 [ %.3, %62 ], [ 8, %._crit_edge.loopexit ]
  %83 = zext i32 %.111.lcssa to i64
  %84 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = and i32 %85, %.09
  %87 = sub i32 %.4.lcssa, %.111.lcssa
  %88 = shl i32 %86, %87
  %89 = or i32 %88, %.47.lcssa
  %90 = icmp eq i32 %87, 0
  br i1 %90, label %91, label %106

; <label>:91:                                     ; preds = %._crit_edge
  %92 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %93 = load i32, i32* %92, align 8
  %94 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %95 = load i32, i32* %94, align 8
  %96 = icmp slt i32 %93, %95
  br i1 %96, label %99, label %97

; <label>:97:                                     ; preds = %91
  %98 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %99

; <label>:99:                                     ; preds = %91, %97
  %100 = trunc i32 %89 to i8
  %101 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %102 = load i8*, i8** %101, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 1
  store i8* %103, i8** %101, align 8
  store i8 %100, i8* %102, align 1
  %104 = load i32, i32* %92, align 8
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %92, align 8
  br label %106

; <label>:106:                                    ; preds = %99, %._crit_edge
  %.58 = phi i32 [ 0, %99 ], [ %89, %._crit_edge ]
  %.5 = phi i32 [ 8, %99 ], [ %87, %._crit_edge ]
  store i32 %.58, i32* %7, align 8
  store i32 %.5, i32* %5, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3Encode1DRow(%struct.tiff*, i8*, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3EncodeState**
  %6 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  br label %7

; <label>:7:                                      ; preds = %11, %3
  %.0 = phi i32 [ 0, %3 ], [ %13, %11 ]
  %8 = tail call fastcc i32 @find0span(i8* %1, i32 %.0, i32 %2)
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %8, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i64 0, i64 0))
  %9 = add i32 %8, %.0
  %10 = icmp ult i32 %9, %2
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %7
  %12 = tail call fastcc i32 @find1span(i8* %1, i32 %9, i32 %2)
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %12, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i64 0, i64 0))
  %13 = add i32 %12, %9
  %14 = icmp ult i32 %13, %2
  br i1 %14, label %7, label %15

; <label>:15:                                     ; preds = %11, %7
  %16 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = and i32 %17, 12
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %67, label %20

; <label>:20:                                     ; preds = %15
  %21 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 2
  %22 = load i32, i32* %21, align 4
  %23 = icmp eq i32 %22, 8
  br i1 %23, label %41, label %24

; <label>:24:                                     ; preds = %20
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %26 = load i32, i32* %25, align 8
  %27 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %28 = load i32, i32* %27, align 8
  %29 = icmp slt i32 %26, %28
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %24
  %31 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %32

; <label>:32:                                     ; preds = %24, %30
  %33 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 1
  %34 = load i32, i32* %33, align 8
  %35 = trunc i32 %34 to i8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 1
  store i8* %38, i8** %36, align 8
  store i8 %35, i8* %37, align 1
  %39 = load i32, i32* %25, align 8
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %25, align 8
  store i32 0, i32* %33, align 8
  store i32 8, i32* %21, align 4
  br label %41

; <label>:41:                                     ; preds = %20, %32
  %42 = load i32, i32* %16, align 8
  %43 = and i32 %42, 8
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %67, label %45

; <label>:45:                                     ; preds = %41
  %46 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %47 = bitcast i8** %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = and i64 %48, 1
  %50 = icmp eq i64 %49, 0
  br i1 %50, label %67, label %51

; <label>:51:                                     ; preds = %45
  %52 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %53 = load i32, i32* %52, align 8
  %54 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %55 = load i32, i32* %54, align 8
  %56 = icmp slt i32 %53, %55
  br i1 %56, label %59, label %57

; <label>:57:                                     ; preds = %51
  %58 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %59

; <label>:59:                                     ; preds = %51, %57
  %60 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 1
  %61 = load i32, i32* %60, align 8
  %62 = trunc i32 %61 to i8
  %63 = load i8*, i8** %46, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 1
  store i8* %64, i8** %46, align 8
  store i8 %62, i8* %63, align 1
  %65 = load i32, i32* %52, align 8
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %52, align 8
  store i32 0, i32* %60, align 8
  store i32 8, i32* %21, align 4
  br label %67

; <label>:67:                                     ; preds = %45, %59, %41, %15
  ret void
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3Encode2DRow(%struct.tiff*, i8*, i8*, i32) unnamed_addr #0 {
  %5 = load i8, i8* %1, align 1
  %6 = icmp slt i8 %5, 0
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %4
  %8 = tail call fastcc i32 @find0span(i8* nonnull %1, i32 0, i32 %3)
  br label %9

; <label>:9:                                      ; preds = %4, %7
  %10 = phi i32 [ %8, %7 ], [ 0, %4 ]
  %11 = load i8, i8* %2, align 1
  %12 = icmp slt i8 %11, 0
  br i1 %12, label %.preheader.preheader, label %13

; <label>:13:                                     ; preds = %9
  %14 = tail call fastcc i32 @find0span(i8* nonnull %2, i32 0, i32 %3)
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %9, %13
  %.0.ph = phi i32 [ %14, %13 ], [ 0, %9 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %130
  %.02 = phi i32 [ %.2, %130 ], [ 0, %.preheader.preheader ]
  %.01 = phi i32 [ %110, %130 ], [ %10, %.preheader.preheader ]
  %.0 = phi i32 [ %132, %130 ], [ %.0.ph, %.preheader.preheader ]
  %15 = icmp ult i32 %.0, %3
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %.preheader
  %17 = lshr i32 %.0, 3
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds i8, i8* %2, i64 %18
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = and i32 %.0, 7
  %23 = xor i32 %22, 7
  %24 = shl i32 1, %23
  %25 = and i32 %21, %24
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %29, label %27

; <label>:27:                                     ; preds = %16
  %28 = tail call fastcc i32 @find1span(i8* nonnull %2, i32 %.0, i32 %3)
  br label %31

; <label>:29:                                     ; preds = %16
  %30 = tail call fastcc i32 @find0span(i8* nonnull %2, i32 %.0, i32 %3)
  br label %31

; <label>:31:                                     ; preds = %29, %27
  %32 = phi i32 [ %28, %27 ], [ %30, %29 ]
  %33 = add i32 %32, %.0
  br label %34

; <label>:34:                                     ; preds = %.preheader, %31
  %35 = phi i32 [ %33, %31 ], [ %3, %.preheader ]
  %36 = icmp ult i32 %35, %.01
  br i1 %36, label %90, label %37

; <label>:37:                                     ; preds = %34
  %38 = sub i32 %.0, %.01
  %.off = add i32 %38, 3
  %39 = icmp ult i32 %.off, 7
  br i1 %39, label %81, label %40

; <label>:40:                                     ; preds = %37
  %41 = icmp ult i32 %.01, %3
  br i1 %41, label %42, label %60

; <label>:42:                                     ; preds = %40
  %43 = lshr i32 %.01, 3
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds i8, i8* %1, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = and i32 %.01, 7
  %49 = xor i32 %48, 7
  %50 = shl i32 1, %49
  %51 = and i32 %47, %50
  %52 = icmp eq i32 %51, 0
  br i1 %52, label %55, label %53

; <label>:53:                                     ; preds = %42
  %54 = tail call fastcc i32 @find1span(i8* nonnull %1, i32 %.01, i32 %3)
  br label %57

; <label>:55:                                     ; preds = %42
  %56 = tail call fastcc i32 @find0span(i8* nonnull %1, i32 %.01, i32 %3)
  br label %57

; <label>:57:                                     ; preds = %55, %53
  %58 = phi i32 [ %54, %53 ], [ %56, %55 ]
  %59 = add i32 %58, %.01
  br label %60

; <label>:60:                                     ; preds = %40, %57
  %61 = phi i32 [ %59, %57 ], [ %3, %40 ]
  tail call fastcc void @Fax3PutBits(%struct.tiff* %0, i32 1, i32 3)
  %62 = sub i32 0, %.01
  %63 = icmp eq i32 %.02, %62
  br i1 %63, label %75, label %64

; <label>:64:                                     ; preds = %60
  %65 = lshr i32 %.02, 3
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %1, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = and i32 %.02, 7
  %71 = xor i32 %70, 7
  %72 = shl i32 1, %71
  %73 = and i32 %69, %72
  %74 = icmp eq i32 %73, 0
  br i1 %74, label %75, label %78

; <label>:75:                                     ; preds = %64, %60
  %76 = sub i32 %.01, %.02
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %76, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i64 0, i64 0))
  %77 = sub i32 %61, %.01
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %77, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i64 0, i64 0))
  br label %91

; <label>:78:                                     ; preds = %64
  %79 = sub i32 %.01, %.02
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %79, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxBlackCodes, i64 0, i64 0))
  %80 = sub i32 %61, %.01
  tail call fastcc void @putspan(%struct.tiff* %0, i32 %80, %struct.tableentry* getelementptr inbounds ([109 x %struct.tableentry], [109 x %struct.tableentry]* @TIFFFaxWhiteCodes, i64 0, i64 0))
  br label %91

; <label>:81:                                     ; preds = %37
  %82 = add nsw i32 %38, 3
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [7 x %struct.tableentry], [7 x %struct.tableentry]* @vcodes, i64 0, i64 %83, i32 1
  %85 = load i16, i16* %84, align 2
  %86 = zext i16 %85 to i32
  %87 = getelementptr inbounds [7 x %struct.tableentry], [7 x %struct.tableentry]* @vcodes, i64 0, i64 %83, i32 0
  %88 = load i16, i16* %87, align 2
  %89 = zext i16 %88 to i32
  tail call fastcc void @Fax3PutBits(%struct.tiff* %0, i32 %86, i32 %89)
  br label %91

; <label>:90:                                     ; preds = %34
  tail call fastcc void @Fax3PutBits(%struct.tiff* %0, i32 1, i32 4)
  br label %91

; <label>:91:                                     ; preds = %81, %78, %75, %90
  %.2 = phi i32 [ %35, %90 ], [ %.01, %81 ], [ %61, %78 ], [ %61, %75 ]
  %92 = icmp ult i32 %.2, %3
  br i1 %92, label %93, label %133

; <label>:93:                                     ; preds = %91
  %94 = lshr i32 %.2, 3
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8* %1, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  %99 = and i32 %.2, 7
  %100 = xor i32 %99, 7
  %101 = shl i32 1, %100
  %102 = and i32 %98, %101
  %103 = icmp eq i32 %102, 0
  br i1 %103, label %106, label %104

; <label>:104:                                    ; preds = %93
  %105 = tail call fastcc i32 @find1span(i8* nonnull %1, i32 %.2, i32 %3)
  br label %108

; <label>:106:                                    ; preds = %93
  %107 = tail call fastcc i32 @find0span(i8* nonnull %1, i32 %.2, i32 %3)
  br label %108

; <label>:108:                                    ; preds = %106, %104
  %109 = phi i32 [ %105, %104 ], [ %107, %106 ]
  %110 = add i32 %109, %.2
  %111 = load i8, i8* %96, align 1
  %112 = zext i8 %111 to i32
  %113 = and i32 %112, %101
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %117

; <label>:115:                                    ; preds = %108
  %116 = tail call fastcc i32 @find1span(i8* %2, i32 %.2, i32 %3)
  br label %119

; <label>:117:                                    ; preds = %108
  %118 = tail call fastcc i32 @find0span(i8* %2, i32 %.2, i32 %3)
  br label %119

; <label>:119:                                    ; preds = %117, %115
  %120 = phi i32 [ %116, %115 ], [ %118, %117 ]
  %121 = add i32 %120, %.2
  %122 = load i8, i8* %96, align 1
  %123 = zext i8 %122 to i32
  %124 = and i32 %123, %101
  %125 = icmp eq i32 %124, 0
  br i1 %125, label %128, label %126

; <label>:126:                                    ; preds = %119
  %127 = tail call fastcc i32 @find1span(i8* %2, i32 %121, i32 %3)
  br label %130

; <label>:128:                                    ; preds = %119
  %129 = tail call fastcc i32 @find0span(i8* %2, i32 %121, i32 %3)
  br label %130

; <label>:130:                                    ; preds = %128, %126
  %131 = phi i32 [ %127, %126 ], [ %129, %128 ]
  %132 = add i32 %131, %121
  br label %.preheader

; <label>:133:                                    ; preds = %91
  ret void
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @find0span(i8*, i32, i32) unnamed_addr #4 {
  %4 = sub nsw i32 %2, %1
  %5 = ashr i32 %1, 3
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* %0, i64 %6
  %8 = icmp sgt i32 %4, 0
  br i1 %8, label %9, label %29

; <label>:9:                                      ; preds = %3
  %10 = and i32 %1, 7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %29, label %12

; <label>:12:                                     ; preds = %9
  %13 = load i8, i8* %7, align 1
  %14 = zext i8 %13 to i32
  %15 = shl i32 %14, %10
  %16 = and i32 %15, 255
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = sub nsw i32 8, %10
  %22 = icmp ugt i32 %20, %21
  %. = select i1 %22, i32 %21, i32 %20
  %23 = icmp sgt i32 %., %4
  %.14 = select i1 %23, i32 %4, i32 %.
  %24 = add nsw i32 %.14, %10
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %83, label %26

; <label>:26:                                     ; preds = %12
  %27 = sub nsw i32 %4, %.14
  %28 = getelementptr inbounds i8, i8* %7, i64 1
  br label %29

; <label>:29:                                     ; preds = %3, %9, %26
  %.07 = phi i32 [ %27, %26 ], [ %4, %9 ], [ %4, %3 ]
  %.25 = phi i32 [ %.14, %26 ], [ 0, %9 ], [ 0, %3 ]
  %.01 = phi i8* [ %28, %26 ], [ %7, %9 ], [ %7, %3 ]
  %30 = icmp ugt i32 %.07, 127
  br i1 %30, label %.preheader12, label %.preheader

.preheader12:                                     ; preds = %29
  %31 = ptrtoint i8* %.01 to i64
  %32 = and i64 %31, 7
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %._crit_edge41.thread, label %.lr.ph40.preheader

.lr.ph40.preheader:                               ; preds = %.preheader12
  br label %.lr.ph40

._crit_edge41.thread:                             ; preds = %.preheader12
  %34 = bitcast i8* %.01 to i64*
  br label %.lr.ph29.preheader

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %43
  %.139 = phi i8* [ %46, %43 ], [ %.01, %.lr.ph40.preheader ]
  %.3638 = phi i32 [ %44, %43 ], [ %.25, %.lr.ph40.preheader ]
  %.1837 = phi i32 [ %45, %43 ], [ %.07, %.lr.ph40.preheader ]
  %35 = load i8, i8* %.139, align 1
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %43, label %37

; <label>:37:                                     ; preds = %.lr.ph40
  %38 = zext i8 %35 to i64
  %39 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = add nsw i32 %41, %.3638
  br label %83

; <label>:43:                                     ; preds = %.lr.ph40
  %44 = add nsw i32 %.3638, 8
  %45 = add nsw i32 %.1837, -8
  %46 = getelementptr inbounds i8, i8* %.139, i64 1
  %47 = ptrtoint i8* %46 to i64
  %48 = and i64 %47, 7
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %._crit_edge41, label %.lr.ph40

._crit_edge41:                                    ; preds = %43
  %50 = bitcast i8* %46 to i64*
  %51 = icmp ugt i32 %45, 63
  br i1 %51, label %.lr.ph29.preheader, label %.critedge

.lr.ph29.preheader:                               ; preds = %._crit_edge41.thread, %._crit_edge41
  %.0227.ph = phi i64* [ %50, %._crit_edge41 ], [ %34, %._crit_edge41.thread ]
  %.426.ph = phi i32 [ %44, %._crit_edge41 ], [ %.25, %._crit_edge41.thread ]
  %.2925.ph = phi i32 [ %45, %._crit_edge41 ], [ %.07, %._crit_edge41.thread ]
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %54
  %.0227 = phi i64* [ %57, %54 ], [ %.0227.ph, %.lr.ph29.preheader ]
  %.426 = phi i32 [ %55, %54 ], [ %.426.ph, %.lr.ph29.preheader ]
  %.2925 = phi i32 [ %56, %54 ], [ %.2925.ph, %.lr.ph29.preheader ]
  %52 = load i64, i64* %.0227, align 8
  %53 = icmp eq i64 %52, 0
  br i1 %53, label %54, label %.critedge.loopexit

; <label>:54:                                     ; preds = %.lr.ph29
  %55 = add i32 %.426, 64
  %56 = add i32 %.2925, -64
  %57 = getelementptr inbounds i64, i64* %.0227, i64 1
  %58 = icmp ugt i32 %56, 63
  br i1 %58, label %.lr.ph29, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %54, %.lr.ph29
  %.29.lcssa.ph = phi i32 [ %56, %54 ], [ %.2925, %.lr.ph29 ]
  %.4.lcssa.ph = phi i32 [ %55, %54 ], [ %.426, %.lr.ph29 ]
  %.02.lcssa.ph = phi i64* [ %57, %54 ], [ %.0227, %.lr.ph29 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %._crit_edge41
  %.29.lcssa = phi i32 [ %45, %._crit_edge41 ], [ %.29.lcssa.ph, %.critedge.loopexit ]
  %.4.lcssa = phi i32 [ %44, %._crit_edge41 ], [ %.4.lcssa.ph, %.critedge.loopexit ]
  %.02.lcssa = phi i64* [ %50, %._crit_edge41 ], [ %.02.lcssa.ph, %.critedge.loopexit ]
  %59 = bitcast i64* %.02.lcssa to i8*
  br label %.preheader

.preheader:                                       ; preds = %.critedge, %29
  %.411.ph = phi i32 [ %.07, %29 ], [ %.29.lcssa, %.critedge ]
  %.6.ph = phi i32 [ %.25, %29 ], [ %.4.lcssa, %.critedge ]
  %.3.ph = phi i8* [ %.01, %29 ], [ %59, %.critedge ]
  %60 = icmp sgt i32 %.411.ph, 7
  br i1 %60, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %69
  %.322 = phi i8* [ %72, %69 ], [ %.3.ph, %.lr.ph.preheader ]
  %.621 = phi i32 [ %70, %69 ], [ %.6.ph, %.lr.ph.preheader ]
  %.41120 = phi i32 [ %71, %69 ], [ %.411.ph, %.lr.ph.preheader ]
  %61 = load i8, i8* %.322, align 1
  %62 = icmp eq i8 %61, 0
  br i1 %62, label %69, label %63

; <label>:63:                                     ; preds = %.lr.ph
  %64 = zext i8 %61 to i64
  %65 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = add nsw i32 %67, %.621
  br label %83

; <label>:69:                                     ; preds = %.lr.ph
  %70 = add nsw i32 %.621, 8
  %71 = add nsw i32 %.41120, -8
  %72 = getelementptr inbounds i8, i8* %.322, i64 1
  %73 = icmp sgt i32 %71, 7
  br i1 %73, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %69
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.411.lcssa = phi i32 [ %.411.ph, %.preheader ], [ %71, %._crit_edge.loopexit ]
  %.6.lcssa = phi i32 [ %.6.ph, %.preheader ], [ %70, %._crit_edge.loopexit ]
  %.3.lcssa = phi i8* [ %.3.ph, %.preheader ], [ %72, %._crit_edge.loopexit ]
  %74 = icmp sgt i32 %.411.lcssa, 0
  br i1 %74, label %75, label %83

; <label>:75:                                     ; preds = %._crit_edge
  %76 = load i8, i8* %.3.lcssa, align 1
  %77 = zext i8 %76 to i64
  %78 = getelementptr inbounds [256 x i8], [256 x i8]* @zeroruns, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp sgt i32 %80, %.411.lcssa
  %.411. = select i1 %81, i32 %.411.lcssa, i32 %80
  %82 = add nsw i32 %.411., %.6.lcssa
  br label %83

; <label>:83:                                     ; preds = %._crit_edge, %75, %12, %63, %37
  %.0 = phi i32 [ %42, %37 ], [ %68, %63 ], [ %.14, %12 ], [ %82, %75 ], [ %.6.lcssa, %._crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @putspan(%struct.tiff*, i32, %struct.tableentry* nocapture readonly) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3EncodeState**
  %6 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %7 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp sgt i32 %1, 2623
  br i1 %11, label %.lr.ph41, label %._crit_edge42

.lr.ph41:                                         ; preds = %3
  %12 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 103, i32 1
  %13 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 103, i32 0
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %17 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 103, i32 2
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %21

; <label>:21:                                     ; preds = %.lr.ph41, %62
  %.0139 = phi i32 [ %1, %.lr.ph41 ], [ %65, %62 ]
  %.0338 = phi i32 [ %10, %.lr.ph41 ], [ %.25, %62 ]
  %.0637 = phi i32 [ %8, %.lr.ph41 ], [ %.28, %62 ]
  %22 = load i16, i16* %12, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16, i16* %13, align 2
  %25 = zext i16 %24 to i32
  %26 = icmp ugt i32 %25, %.0637
  br i1 %26, label %.lr.ph32.preheader, label %._crit_edge33

.lr.ph32.preheader:                               ; preds = %21
  br label %.lr.ph32

.lr.ph32:                                         ; preds = %.lr.ph32.preheader, %35
  %.030 = phi i32 [ %27, %35 ], [ %25, %.lr.ph32.preheader ]
  %.1429 = phi i32 [ 0, %35 ], [ %.0338, %.lr.ph32.preheader ]
  %.1728 = phi i32 [ 8, %35 ], [ %.0637, %.lr.ph32.preheader ]
  %27 = sub i32 %.030, %.1728
  %28 = lshr i32 %23, %27
  %29 = or i32 %28, %.1429
  %30 = load i32, i32* %18, align 8
  %31 = load i32, i32* %19, align 8
  %32 = icmp slt i32 %30, %31
  br i1 %32, label %35, label %33

; <label>:33:                                     ; preds = %.lr.ph32
  %34 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %35

; <label>:35:                                     ; preds = %.lr.ph32, %33
  %36 = trunc i32 %29 to i8
  %37 = load i8*, i8** %20, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 1
  store i8* %38, i8** %20, align 8
  store i8 %36, i8* %37, align 1
  %39 = load i32, i32* %18, align 8
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %18, align 8
  %41 = icmp ugt i32 %27, 8
  br i1 %41, label %.lr.ph32, label %._crit_edge33.loopexit

._crit_edge33.loopexit:                           ; preds = %35
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %21
  %.17.lcssa = phi i32 [ %.0637, %21 ], [ 8, %._crit_edge33.loopexit ]
  %.14.lcssa = phi i32 [ %.0338, %21 ], [ 0, %._crit_edge33.loopexit ]
  %.0.lcssa = phi i32 [ %25, %21 ], [ %27, %._crit_edge33.loopexit ]
  %42 = zext i32 %.0.lcssa to i64
  %43 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %42
  %44 = load i32, i32* %43, align 4
  %45 = and i32 %44, %23
  %46 = sub i32 %.17.lcssa, %.0.lcssa
  %47 = shl i32 %45, %46
  %48 = or i32 %47, %.14.lcssa
  %49 = icmp eq i32 %46, 0
  br i1 %49, label %50, label %62

; <label>:50:                                     ; preds = %._crit_edge33
  %51 = load i32, i32* %14, align 8
  %52 = load i32, i32* %15, align 8
  %53 = icmp slt i32 %51, %52
  br i1 %53, label %56, label %54

; <label>:54:                                     ; preds = %50
  %55 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %56

; <label>:56:                                     ; preds = %50, %54
  %57 = trunc i32 %48 to i8
  %58 = load i8*, i8** %16, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 1
  store i8* %59, i8** %16, align 8
  store i8 %57, i8* %58, align 1
  %60 = load i32, i32* %14, align 8
  %61 = add nsw i32 %60, 1
  store i32 %61, i32* %14, align 8
  br label %62

; <label>:62:                                     ; preds = %56, %._crit_edge33
  %.28 = phi i32 [ 8, %56 ], [ %46, %._crit_edge33 ]
  %.25 = phi i32 [ 0, %56 ], [ %48, %._crit_edge33 ]
  %63 = load i16, i16* %17, align 2
  %64 = sext i16 %63 to i32
  %65 = sub nsw i32 %.0139, %64
  %66 = icmp sgt i32 %65, 2623
  br i1 %66, label %21, label %._crit_edge42.loopexit

._crit_edge42.loopexit:                           ; preds = %62
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %3
  %.06.lcssa = phi i32 [ %8, %3 ], [ %.28, %._crit_edge42.loopexit ]
  %.03.lcssa = phi i32 [ %10, %3 ], [ %.25, %._crit_edge42.loopexit ]
  %.01.lcssa = phi i32 [ %1, %3 ], [ %65, %._crit_edge42.loopexit ]
  %67 = icmp sgt i32 %.01.lcssa, 63
  br i1 %67, label %68, label %132

; <label>:68:                                     ; preds = %._crit_edge42
  %69 = lshr i32 %.01.lcssa, 6
  %70 = add nuw nsw i32 %69, 63
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 %71, i32 2
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = shl nuw nsw i32 %69, 6
  %76 = icmp eq i32 %74, %75
  br i1 %76, label %78, label %77

; <label>:77:                                     ; preds = %68
  tail call void @__assert_fail(i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.41, i64 0, i64 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i64 0, i64 0), i32 632, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @__PRETTY_FUNCTION__.putspan, i64 0, i64 0)) #7
  unreachable

; <label>:78:                                     ; preds = %68
  %79 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 %71, i32 1
  %80 = load i16, i16* %79, align 2
  %81 = zext i16 %80 to i32
  %82 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 %71, i32 0
  %83 = load i16, i16* %82, align 2
  %84 = zext i16 %83 to i32
  %85 = icmp ugt i32 %84, %.06.lcssa
  br i1 %85, label %.lr.ph23, label %._crit_edge24

.lr.ph23:                                         ; preds = %78
  %86 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %88 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %89

; <label>:89:                                     ; preds = %.lr.ph23, %98
  %.121 = phi i32 [ %84, %.lr.ph23 ], [ %90, %98 ]
  %.320 = phi i32 [ %.03.lcssa, %.lr.ph23 ], [ 0, %98 ]
  %.3919 = phi i32 [ %.06.lcssa, %.lr.ph23 ], [ 8, %98 ]
  %90 = sub i32 %.121, %.3919
  %91 = lshr i32 %81, %90
  %92 = or i32 %91, %.320
  %93 = load i32, i32* %86, align 8
  %94 = load i32, i32* %87, align 8
  %95 = icmp slt i32 %93, %94
  br i1 %95, label %98, label %96

; <label>:96:                                     ; preds = %89
  %97 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %98

; <label>:98:                                     ; preds = %89, %96
  %99 = trunc i32 %92 to i8
  %100 = load i8*, i8** %88, align 8
  %101 = getelementptr inbounds i8, i8* %100, i64 1
  store i8* %101, i8** %88, align 8
  store i8 %99, i8* %100, align 1
  %102 = load i32, i32* %86, align 8
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %86, align 8
  %104 = icmp ugt i32 %90, 8
  br i1 %104, label %89, label %._crit_edge24.loopexit

._crit_edge24.loopexit:                           ; preds = %98
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %78
  %.39.lcssa = phi i32 [ %.06.lcssa, %78 ], [ 8, %._crit_edge24.loopexit ]
  %.3.lcssa = phi i32 [ %.03.lcssa, %78 ], [ 0, %._crit_edge24.loopexit ]
  %.1.lcssa = phi i32 [ %84, %78 ], [ %90, %._crit_edge24.loopexit ]
  %105 = zext i32 %.1.lcssa to i64
  %106 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %105
  %107 = load i32, i32* %106, align 4
  %108 = and i32 %107, %81
  %109 = sub i32 %.39.lcssa, %.1.lcssa
  %110 = shl i32 %108, %109
  %111 = or i32 %110, %.3.lcssa
  %112 = icmp eq i32 %109, 0
  br i1 %112, label %113, label %128

; <label>:113:                                    ; preds = %._crit_edge24
  %114 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %115 = load i32, i32* %114, align 8
  %116 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %117 = load i32, i32* %116, align 8
  %118 = icmp slt i32 %115, %117
  br i1 %118, label %121, label %119

; <label>:119:                                    ; preds = %113
  %120 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %121

; <label>:121:                                    ; preds = %113, %119
  %122 = trunc i32 %111 to i8
  %123 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %124 = load i8*, i8** %123, align 8
  %125 = getelementptr inbounds i8, i8* %124, i64 1
  store i8* %125, i8** %123, align 8
  store i8 %122, i8* %124, align 1
  %126 = load i32, i32* %114, align 8
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %114, align 8
  br label %128

; <label>:128:                                    ; preds = %121, %._crit_edge24
  %.410 = phi i32 [ 8, %121 ], [ %109, %._crit_edge24 ]
  %.4 = phi i32 [ 0, %121 ], [ %111, %._crit_edge24 ]
  %129 = load i16, i16* %72, align 2
  %130 = sext i16 %129 to i32
  %131 = sub nsw i32 %.01.lcssa, %130
  br label %132

; <label>:132:                                    ; preds = %128, %._crit_edge42
  %.511 = phi i32 [ %.410, %128 ], [ %.06.lcssa, %._crit_edge42 ]
  %.5 = phi i32 [ %.4, %128 ], [ %.03.lcssa, %._crit_edge42 ]
  %.12 = phi i32 [ %131, %128 ], [ %.01.lcssa, %._crit_edge42 ]
  %133 = sext i32 %.12 to i64
  %134 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 %133, i32 1
  %135 = load i16, i16* %134, align 2
  %136 = zext i16 %135 to i32
  %137 = getelementptr inbounds %struct.tableentry, %struct.tableentry* %2, i64 %133, i32 0
  %138 = load i16, i16* %137, align 2
  %139 = zext i16 %138 to i32
  %140 = icmp ugt i32 %139, %.511
  br i1 %140, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %132
  %141 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %142 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %143 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %144

; <label>:144:                                    ; preds = %.lr.ph, %153
  %.216 = phi i32 [ %139, %.lr.ph ], [ %145, %153 ]
  %.615 = phi i32 [ %.5, %.lr.ph ], [ 0, %153 ]
  %.61214 = phi i32 [ %.511, %.lr.ph ], [ 8, %153 ]
  %145 = sub i32 %.216, %.61214
  %146 = lshr i32 %136, %145
  %147 = or i32 %146, %.615
  %148 = load i32, i32* %141, align 8
  %149 = load i32, i32* %142, align 8
  %150 = icmp slt i32 %148, %149
  br i1 %150, label %153, label %151

; <label>:151:                                    ; preds = %144
  %152 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %153

; <label>:153:                                    ; preds = %144, %151
  %154 = trunc i32 %147 to i8
  %155 = load i8*, i8** %143, align 8
  %156 = getelementptr inbounds i8, i8* %155, i64 1
  store i8* %156, i8** %143, align 8
  store i8 %154, i8* %155, align 1
  %157 = load i32, i32* %141, align 8
  %158 = add nsw i32 %157, 1
  store i32 %158, i32* %141, align 8
  %159 = icmp ugt i32 %145, 8
  br i1 %159, label %144, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %153
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %132
  %.612.lcssa = phi i32 [ %.511, %132 ], [ 8, %._crit_edge.loopexit ]
  %.6.lcssa = phi i32 [ %.5, %132 ], [ 0, %._crit_edge.loopexit ]
  %.2.lcssa = phi i32 [ %139, %132 ], [ %145, %._crit_edge.loopexit ]
  %160 = zext i32 %.2.lcssa to i64
  %161 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %160
  %162 = load i32, i32* %161, align 4
  %163 = and i32 %162, %136
  %164 = sub i32 %.612.lcssa, %.2.lcssa
  %165 = shl i32 %163, %164
  %166 = or i32 %165, %.6.lcssa
  %167 = icmp eq i32 %164, 0
  br i1 %167, label %168, label %183

; <label>:168:                                    ; preds = %._crit_edge
  %169 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %170 = load i32, i32* %169, align 8
  %171 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %172 = load i32, i32* %171, align 8
  %173 = icmp slt i32 %170, %172
  br i1 %173, label %176, label %174

; <label>:174:                                    ; preds = %168
  %175 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %176

; <label>:176:                                    ; preds = %168, %174
  %177 = trunc i32 %166 to i8
  %178 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %179 = load i8*, i8** %178, align 8
  %180 = getelementptr inbounds i8, i8* %179, i64 1
  store i8* %180, i8** %178, align 8
  store i8 %177, i8* %179, align 1
  %181 = load i32, i32* %169, align 8
  %182 = add nsw i32 %181, 1
  store i32 %182, i32* %169, align 8
  br label %183

; <label>:183:                                    ; preds = %176, %._crit_edge
  %.713 = phi i32 [ 8, %176 ], [ %164, %._crit_edge ]
  %.7 = phi i32 [ 0, %176 ], [ %166, %._crit_edge ]
  store i32 %.7, i32* %9, align 8
  store i32 %.713, i32* %7, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal fastcc i32 @find1span(i8*, i32, i32) unnamed_addr #4 {
  %4 = sub nsw i32 %2, %1
  %5 = ashr i32 %1, 3
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* %0, i64 %6
  %8 = icmp sgt i32 %4, 0
  br i1 %8, label %9, label %29

; <label>:9:                                      ; preds = %3
  %10 = and i32 %1, 7
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %29, label %12

; <label>:12:                                     ; preds = %9
  %13 = load i8, i8* %7, align 1
  %14 = zext i8 %13 to i32
  %15 = shl i32 %14, %10
  %16 = and i32 %15, 255
  %17 = zext i32 %16 to i64
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i32
  %21 = sub nsw i32 8, %10
  %22 = icmp ugt i32 %20, %21
  %. = select i1 %22, i32 %21, i32 %20
  %23 = icmp sgt i32 %., %4
  %.14 = select i1 %23, i32 %4, i32 %.
  %24 = add nsw i32 %.14, %10
  %25 = icmp slt i32 %24, 8
  br i1 %25, label %83, label %26

; <label>:26:                                     ; preds = %12
  %27 = sub nsw i32 %4, %.14
  %28 = getelementptr inbounds i8, i8* %7, i64 1
  br label %29

; <label>:29:                                     ; preds = %3, %9, %26
  %.07 = phi i32 [ %27, %26 ], [ %4, %9 ], [ %4, %3 ]
  %.25 = phi i32 [ %.14, %26 ], [ 0, %9 ], [ 0, %3 ]
  %.01 = phi i8* [ %28, %26 ], [ %7, %9 ], [ %7, %3 ]
  %30 = icmp ugt i32 %.07, 127
  br i1 %30, label %.preheader12, label %.preheader

.preheader12:                                     ; preds = %29
  %31 = ptrtoint i8* %.01 to i64
  %32 = and i64 %31, 7
  %33 = icmp eq i64 %32, 0
  br i1 %33, label %._crit_edge41.thread, label %.lr.ph40.preheader

.lr.ph40.preheader:                               ; preds = %.preheader12
  br label %.lr.ph40

._crit_edge41.thread:                             ; preds = %.preheader12
  %34 = bitcast i8* %.01 to i64*
  br label %.lr.ph29.preheader

.lr.ph40:                                         ; preds = %.lr.ph40.preheader, %43
  %.139 = phi i8* [ %46, %43 ], [ %.01, %.lr.ph40.preheader ]
  %.3638 = phi i32 [ %44, %43 ], [ %.25, %.lr.ph40.preheader ]
  %.1837 = phi i32 [ %45, %43 ], [ %.07, %.lr.ph40.preheader ]
  %35 = load i8, i8* %.139, align 1
  %36 = icmp eq i8 %35, -1
  br i1 %36, label %43, label %37

; <label>:37:                                     ; preds = %.lr.ph40
  %38 = zext i8 %35 to i64
  %39 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %38
  %40 = load i8, i8* %39, align 1
  %41 = zext i8 %40 to i32
  %42 = add nsw i32 %41, %.3638
  br label %83

; <label>:43:                                     ; preds = %.lr.ph40
  %44 = add nsw i32 %.3638, 8
  %45 = add nsw i32 %.1837, -8
  %46 = getelementptr inbounds i8, i8* %.139, i64 1
  %47 = ptrtoint i8* %46 to i64
  %48 = and i64 %47, 7
  %49 = icmp eq i64 %48, 0
  br i1 %49, label %._crit_edge41, label %.lr.ph40

._crit_edge41:                                    ; preds = %43
  %50 = bitcast i8* %46 to i64*
  %51 = icmp ugt i32 %45, 63
  br i1 %51, label %.lr.ph29.preheader, label %.critedge

.lr.ph29.preheader:                               ; preds = %._crit_edge41.thread, %._crit_edge41
  %.0227.ph = phi i64* [ %50, %._crit_edge41 ], [ %34, %._crit_edge41.thread ]
  %.426.ph = phi i32 [ %44, %._crit_edge41 ], [ %.25, %._crit_edge41.thread ]
  %.2925.ph = phi i32 [ %45, %._crit_edge41 ], [ %.07, %._crit_edge41.thread ]
  br label %.lr.ph29

.lr.ph29:                                         ; preds = %.lr.ph29.preheader, %54
  %.0227 = phi i64* [ %57, %54 ], [ %.0227.ph, %.lr.ph29.preheader ]
  %.426 = phi i32 [ %55, %54 ], [ %.426.ph, %.lr.ph29.preheader ]
  %.2925 = phi i32 [ %56, %54 ], [ %.2925.ph, %.lr.ph29.preheader ]
  %52 = load i64, i64* %.0227, align 8
  %53 = icmp eq i64 %52, -1
  br i1 %53, label %54, label %.critedge.loopexit

; <label>:54:                                     ; preds = %.lr.ph29
  %55 = add i32 %.426, 64
  %56 = add i32 %.2925, -64
  %57 = getelementptr inbounds i64, i64* %.0227, i64 1
  %58 = icmp ugt i32 %56, 63
  br i1 %58, label %.lr.ph29, label %.critedge.loopexit

.critedge.loopexit:                               ; preds = %54, %.lr.ph29
  %.29.lcssa.ph = phi i32 [ %56, %54 ], [ %.2925, %.lr.ph29 ]
  %.4.lcssa.ph = phi i32 [ %55, %54 ], [ %.426, %.lr.ph29 ]
  %.02.lcssa.ph = phi i64* [ %57, %54 ], [ %.0227, %.lr.ph29 ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %._crit_edge41
  %.29.lcssa = phi i32 [ %45, %._crit_edge41 ], [ %.29.lcssa.ph, %.critedge.loopexit ]
  %.4.lcssa = phi i32 [ %44, %._crit_edge41 ], [ %.4.lcssa.ph, %.critedge.loopexit ]
  %.02.lcssa = phi i64* [ %50, %._crit_edge41 ], [ %.02.lcssa.ph, %.critedge.loopexit ]
  %59 = bitcast i64* %.02.lcssa to i8*
  br label %.preheader

.preheader:                                       ; preds = %.critedge, %29
  %.411.ph = phi i32 [ %.07, %29 ], [ %.29.lcssa, %.critedge ]
  %.6.ph = phi i32 [ %.25, %29 ], [ %.4.lcssa, %.critedge ]
  %.3.ph = phi i8* [ %.01, %29 ], [ %59, %.critedge ]
  %60 = icmp sgt i32 %.411.ph, 7
  br i1 %60, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %69
  %.322 = phi i8* [ %72, %69 ], [ %.3.ph, %.lr.ph.preheader ]
  %.621 = phi i32 [ %70, %69 ], [ %.6.ph, %.lr.ph.preheader ]
  %.41120 = phi i32 [ %71, %69 ], [ %.411.ph, %.lr.ph.preheader ]
  %61 = load i8, i8* %.322, align 1
  %62 = icmp eq i8 %61, -1
  br i1 %62, label %69, label %63

; <label>:63:                                     ; preds = %.lr.ph
  %64 = zext i8 %61 to i64
  %65 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = zext i8 %66 to i32
  %68 = add nsw i32 %67, %.621
  br label %83

; <label>:69:                                     ; preds = %.lr.ph
  %70 = add nsw i32 %.621, 8
  %71 = add nsw i32 %.41120, -8
  %72 = getelementptr inbounds i8, i8* %.322, i64 1
  %73 = icmp sgt i32 %71, 7
  br i1 %73, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %69
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.411.lcssa = phi i32 [ %.411.ph, %.preheader ], [ %71, %._crit_edge.loopexit ]
  %.6.lcssa = phi i32 [ %.6.ph, %.preheader ], [ %70, %._crit_edge.loopexit ]
  %.3.lcssa = phi i8* [ %.3.ph, %.preheader ], [ %72, %._crit_edge.loopexit ]
  %74 = icmp sgt i32 %.411.lcssa, 0
  br i1 %74, label %75, label %83

; <label>:75:                                     ; preds = %._crit_edge
  %76 = load i8, i8* %.3.lcssa, align 1
  %77 = zext i8 %76 to i64
  %78 = getelementptr inbounds [256 x i8], [256 x i8]* @oneruns, i64 0, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = icmp sgt i32 %80, %.411.lcssa
  %.411. = select i1 %81, i32 %.411.lcssa, i32 %80
  %82 = add nsw i32 %.411., %.6.lcssa
  br label %83

; <label>:83:                                     ; preds = %._crit_edge, %75, %12, %63, %37
  %.0 = phi i32 [ %42, %37 ], [ %68, %63 ], [ %.14, %12 ], [ %82, %75 ], [ %.6.lcssa, %._crit_edge ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @Fax3PutBits(%struct.tiff*, i32, i32) unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 37
  %5 = bitcast i8** %4 to %struct.Fax3EncodeState**
  %6 = load %struct.Fax3EncodeState*, %struct.Fax3EncodeState** %5, align 8
  %7 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 2
  %8 = load i32, i32* %7, align 4
  %9 = getelementptr inbounds %struct.Fax3EncodeState, %struct.Fax3EncodeState* %6, i64 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = icmp ult i32 %8, %2
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %15

; <label>:15:                                     ; preds = %.lr.ph, %24
  %.06 = phi i32 [ %10, %.lr.ph ], [ 0, %24 ]
  %.015 = phi i32 [ %8, %.lr.ph ], [ 8, %24 ]
  %.034 = phi i32 [ %2, %.lr.ph ], [ %16, %24 ]
  %16 = sub i32 %.034, %.015
  %17 = lshr i32 %1, %16
  %18 = or i32 %17, %.06
  %19 = load i32, i32* %12, align 8
  %20 = load i32, i32* %13, align 8
  %21 = icmp slt i32 %19, %20
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %15
  %23 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %24

; <label>:24:                                     ; preds = %15, %22
  %25 = trunc i32 %18 to i8
  %26 = load i8*, i8** %14, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 1
  store i8* %27, i8** %14, align 8
  store i8 %25, i8* %26, align 1
  %28 = load i32, i32* %12, align 8
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %12, align 8
  %30 = icmp ugt i32 %16, 8
  br i1 %30, label %15, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %24
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %.03.lcssa = phi i32 [ %2, %3 ], [ %16, %._crit_edge.loopexit ]
  %.01.lcssa = phi i32 [ %8, %3 ], [ 8, %._crit_edge.loopexit ]
  %.0.lcssa = phi i32 [ %10, %3 ], [ 0, %._crit_edge.loopexit ]
  %31 = zext i32 %.03.lcssa to i64
  %32 = getelementptr inbounds [9 x i32], [9 x i32]* @_msbmask, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = and i32 %33, %1
  %35 = sub i32 %.01.lcssa, %.03.lcssa
  %36 = shl i32 %34, %35
  %37 = or i32 %36, %.0.lcssa
  %38 = icmp eq i32 %35, 0
  br i1 %38, label %39, label %54

; <label>:39:                                     ; preds = %._crit_edge
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %41 = load i32, i32* %40, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %43 = load i32, i32* %42, align 8
  %44 = icmp slt i32 %41, %43
  br i1 %44, label %47, label %45

; <label>:45:                                     ; preds = %39
  %46 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #5
  br label %47

; <label>:47:                                     ; preds = %39, %45
  %48 = trunc i32 %37 to i8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %50 = load i8*, i8** %49, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  store i8* %51, i8** %49, align 8
  store i8 %48, i8* %50, align 1
  %52 = load i32, i32* %40, align 8
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %40, align 8
  br label %54

; <label>:54:                                     ; preds = %47, %._crit_edge
  %.12 = phi i32 [ 8, %47 ], [ %35, %._crit_edge ]
  %.1 = phi i32 [ 0, %47 ], [ %37, %._crit_edge ]
  store i32 %.1, i32* %9, align 8
  store i32 %.12, i32* %7, align 4
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { argmemonly nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

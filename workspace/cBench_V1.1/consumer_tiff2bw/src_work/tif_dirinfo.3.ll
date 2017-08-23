; ModuleID = 'tif_dirinfo.2.ll'
source_filename = "tif_dirinfo.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, {}*, i32 (%struct.tiff*, i32)*, {}*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@tiffFieldInfo = internal constant [92 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 254, i16 1, i16 1, i32 4, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 254, i16 1, i16 1, i32 3, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 255, i16 1, i16 1, i32 3, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 256, i16 1, i16 1, i32 4, i16 1, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 256, i16 1, i16 1, i32 3, i16 1, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 257, i16 1, i16 1, i32 4, i16 1, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 257, i16 1, i16 1, i32 3, i16 1, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 258, i16 -1, i16 -1, i32 3, i16 6, i8 0, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 259, i16 -1, i16 1, i32 3, i16 7, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 262, i16 1, i16 1, i32 3, i16 8, i8 0, i8 0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 263, i16 1, i16 1, i32 3, i16 9, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.15, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 264, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 265, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 266, i16 1, i16 1, i32 3, i16 10, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.18, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 269, i16 -1, i16 -1, i32 2, i16 11, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 270, i16 -1, i16 -1, i32 2, i16 12, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 271, i16 -1, i16 -1, i32 2, i16 13, i8 1, i8 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 272, i16 -1, i16 -1, i32 2, i16 14, i8 1, i8 0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 273, i16 -1, i16 -1, i32 4, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 273, i16 -1, i16 -1, i32 3, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 274, i16 1, i16 1, i32 3, i16 15, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.24, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 277, i16 1, i16 1, i32 3, i16 16, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 278, i16 1, i16 1, i32 4, i16 17, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 278, i16 1, i16 1, i32 3, i16 17, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 279, i16 -1, i16 -1, i32 4, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.27, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 279, i16 -1, i16 -1, i32 3, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.27, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 280, i16 -2, i16 -1, i32 3, i16 18, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.28, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 281, i16 -2, i16 -1, i32 3, i16 19, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.29, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 282, i16 1, i16 1, i32 5, i16 3, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.30, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 283, i16 1, i16 1, i32 5, i16 3, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.31, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 284, i16 1, i16 1, i32 3, i16 20, i8 0, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.32, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 285, i16 -1, i16 -1, i32 2, i16 21, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 286, i16 1, i16 1, i32 5, i16 4, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 287, i16 1, i16 1, i32 5, i16 4, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 288, i16 -1, i16 -1, i32 4, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.36, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 289, i16 -1, i16 -1, i32 4, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.37, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 290, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 291, i16 -1, i16 -1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.39, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 296, i16 1, i16 1, i32 3, i16 22, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.40, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 297, i16 2, i16 2, i32 3, i16 23, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.41, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 300, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.42, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 301, i16 -1, i16 -1, i32 3, i16 44, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.43, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 305, i16 -1, i16 -1, i32 2, i16 30, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 306, i16 20, i16 20, i32 2, i16 28, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.45, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 315, i16 -1, i16 -1, i32 2, i16 27, i8 1, i8 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.46, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 316, i16 -1, i16 -1, i32 2, i16 29, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.47, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 318, i16 2, i16 2, i32 5, i16 42, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.48, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 319, i16 6, i16 6, i32 5, i16 43, i8 1, i8 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.49, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 320, i16 -1, i16 -1, i32 3, i16 26, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.50, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 321, i16 2, i16 2, i32 3, i16 37, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.51, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 322, i16 1, i16 1, i32 4, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.52, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 322, i16 1, i16 1, i32 3, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.52, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 323, i16 1, i16 1, i32 4, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.53, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 323, i16 1, i16 1, i32 3, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.53, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 324, i16 -1, i16 1, i32 4, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.54, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 325, i16 -1, i16 1, i32 4, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.55, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 325, i16 -1, i16 1, i32 3, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.55, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 330, i16 -1, i16 -1, i32 4, i16 49, i8 1, i8 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.56, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 332, i16 1, i16 1, i32 3, i16 45, i8 0, i8 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.57, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 333, i16 -1, i16 -1, i32 2, i16 46, i8 1, i8 1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.58, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 334, i16 1, i16 1, i32 3, i16 50, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.59, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 336, i16 2, i16 2, i32 3, i16 47, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 336, i16 2, i16 2, i32 1, i16 47, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 337, i16 -1, i16 -1, i32 2, i16 48, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.61, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 338, i16 -1, i16 -1, i32 3, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.62, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 338, i16 -1, i16 -1, i32 1, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.62, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 339, i16 -1, i16 -1, i32 3, i16 32, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.63, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 340, i16 -2, i16 -1, i32 0, i16 33, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.64, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 341, i16 -2, i16 -1, i32 0, i16 34, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.65, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 529, i16 3, i16 3, i32 5, i16 38, i8 0, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.66, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 530, i16 2, i16 2, i32 3, i16 39, i8 0, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.67, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 531, i16 1, i16 1, i32 3, i16 40, i8 0, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.68, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 532, i16 6, i16 6, i32 5, i16 41, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 532, i16 6, i16 6, i32 4, i16 41, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32995, i16 1, i16 1, i32 3, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.70, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32996, i16 -2, i16 -1, i32 3, i16 32, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.71, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32997, i16 1, i16 1, i32 4, i16 35, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32997, i16 1, i16 1, i32 3, i16 35, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32998, i16 1, i16 1, i32 4, i16 36, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.73, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32998, i16 1, i16 1, i32 3, i16 36, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.73, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33723, i16 -1, i16 -1, i32 4, i16 53, i8 0, i8 1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.74, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34377, i16 -1, i16 -3, i32 7, i16 52, i8 0, i8 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.75, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34377, i16 -1, i16 -1, i32 1, i16 52, i8 0, i8 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.75, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34675, i16 -1, i16 -3, i32 7, i16 51, i8 0, i8 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.76, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 37439, i16 1, i16 1, i32 12, i16 54, i8 0, i8 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.77, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33300, i16 1, i16 1, i32 4, i16 55, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.78, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33301, i16 1, i16 1, i32 4, i16 56, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.79, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33302, i16 -1, i16 -1, i32 2, i16 57, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.80, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33303, i16 -1, i16 -1, i32 2, i16 58, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.81, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33304, i16 1, i16 1, i32 11, i16 59, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.82, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33305, i16 16, i16 16, i32 11, i16 60, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.83, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33306, i16 16, i16 16, i32 11, i16 61, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.84, i32 0, i32 0) }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%s: \0A\00", align 1
@.str.1 = private unnamed_addr constant [50 x i8] c"field[%2d] %5lu, %2d, %2d, %d, %2d, %5s, %5s, %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"TRUE\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"FALSE\00", align 1
@tiffDataWidth = constant [13 x i32] [i32 1, i32 1, i32 1, i32 2, i32 4, i32 8, i32 1, i32 1, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@_TIFFFindFieldInfo.last = internal global %struct.TIFFFieldInfo* null, align 8
@.str.4 = private unnamed_addr constant [17 x i8] c"TIFFFieldWithTag\00", align 1
@.str.5 = private unnamed_addr constant [33 x i8] c"Internal error, unknown tag 0x%x\00", align 1
@.str.6 = private unnamed_addr constant [12 x i8] c"fip != NULL\00", align 1
@.str.7 = private unnamed_addr constant [14 x i8] c"tif_dirinfo.c\00", align 1
@__PRETTY_FUNCTION__._TIFFFieldWithTag = private unnamed_addr constant [55 x i8] c"const TIFFFieldInfo *_TIFFFieldWithTag(TIFF *, ttag_t)\00", align 1
@.str.8 = private unnamed_addr constant [12 x i8] c"SubfileType\00", align 1
@.str.9 = private unnamed_addr constant [15 x i8] c"OldSubfileType\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"ImageWidth\00", align 1
@.str.11 = private unnamed_addr constant [12 x i8] c"ImageLength\00", align 1
@.str.12 = private unnamed_addr constant [14 x i8] c"BitsPerSample\00", align 1
@.str.13 = private unnamed_addr constant [12 x i8] c"Compression\00", align 1
@.str.14 = private unnamed_addr constant [26 x i8] c"PhotometricInterpretation\00", align 1
@.str.15 = private unnamed_addr constant [14 x i8] c"Threshholding\00", align 1
@.str.16 = private unnamed_addr constant [10 x i8] c"CellWidth\00", align 1
@.str.17 = private unnamed_addr constant [11 x i8] c"CellLength\00", align 1
@.str.18 = private unnamed_addr constant [10 x i8] c"FillOrder\00", align 1
@.str.19 = private unnamed_addr constant [13 x i8] c"DocumentName\00", align 1
@.str.20 = private unnamed_addr constant [17 x i8] c"ImageDescription\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"Make\00", align 1
@.str.22 = private unnamed_addr constant [6 x i8] c"Model\00", align 1
@.str.23 = private unnamed_addr constant [13 x i8] c"StripOffsets\00", align 1
@.str.24 = private unnamed_addr constant [12 x i8] c"Orientation\00", align 1
@.str.25 = private unnamed_addr constant [16 x i8] c"SamplesPerPixel\00", align 1
@.str.26 = private unnamed_addr constant [13 x i8] c"RowsPerStrip\00", align 1
@.str.27 = private unnamed_addr constant [16 x i8] c"StripByteCounts\00", align 1
@.str.28 = private unnamed_addr constant [15 x i8] c"MinSampleValue\00", align 1
@.str.29 = private unnamed_addr constant [15 x i8] c"MaxSampleValue\00", align 1
@.str.30 = private unnamed_addr constant [12 x i8] c"XResolution\00", align 1
@.str.31 = private unnamed_addr constant [12 x i8] c"YResolution\00", align 1
@.str.32 = private unnamed_addr constant [20 x i8] c"PlanarConfiguration\00", align 1
@.str.33 = private unnamed_addr constant [9 x i8] c"PageName\00", align 1
@.str.34 = private unnamed_addr constant [10 x i8] c"XPosition\00", align 1
@.str.35 = private unnamed_addr constant [10 x i8] c"YPosition\00", align 1
@.str.36 = private unnamed_addr constant [12 x i8] c"FreeOffsets\00", align 1
@.str.37 = private unnamed_addr constant [15 x i8] c"FreeByteCounts\00", align 1
@.str.38 = private unnamed_addr constant [17 x i8] c"GrayResponseUnit\00", align 1
@.str.39 = private unnamed_addr constant [18 x i8] c"GrayResponseCurve\00", align 1
@.str.40 = private unnamed_addr constant [15 x i8] c"ResolutionUnit\00", align 1
@.str.41 = private unnamed_addr constant [11 x i8] c"PageNumber\00", align 1
@.str.42 = private unnamed_addr constant [18 x i8] c"ColorResponseUnit\00", align 1
@.str.43 = private unnamed_addr constant [17 x i8] c"TransferFunction\00", align 1
@.str.44 = private unnamed_addr constant [9 x i8] c"Software\00", align 1
@.str.45 = private unnamed_addr constant [9 x i8] c"DateTime\00", align 1
@.str.46 = private unnamed_addr constant [7 x i8] c"Artist\00", align 1
@.str.47 = private unnamed_addr constant [13 x i8] c"HostComputer\00", align 1
@.str.48 = private unnamed_addr constant [11 x i8] c"WhitePoint\00", align 1
@.str.49 = private unnamed_addr constant [22 x i8] c"PrimaryChromaticities\00", align 1
@.str.50 = private unnamed_addr constant [9 x i8] c"ColorMap\00", align 1
@.str.51 = private unnamed_addr constant [14 x i8] c"HalftoneHints\00", align 1
@.str.52 = private unnamed_addr constant [10 x i8] c"TileWidth\00", align 1
@.str.53 = private unnamed_addr constant [11 x i8] c"TileLength\00", align 1
@.str.54 = private unnamed_addr constant [12 x i8] c"TileOffsets\00", align 1
@.str.55 = private unnamed_addr constant [15 x i8] c"TileByteCounts\00", align 1
@.str.56 = private unnamed_addr constant [7 x i8] c"SubIFD\00", align 1
@.str.57 = private unnamed_addr constant [7 x i8] c"InkSet\00", align 1
@.str.58 = private unnamed_addr constant [9 x i8] c"InkNames\00", align 1
@.str.59 = private unnamed_addr constant [13 x i8] c"NumberOfInks\00", align 1
@.str.60 = private unnamed_addr constant [9 x i8] c"DotRange\00", align 1
@.str.61 = private unnamed_addr constant [14 x i8] c"TargetPrinter\00", align 1
@.str.62 = private unnamed_addr constant [13 x i8] c"ExtraSamples\00", align 1
@.str.63 = private unnamed_addr constant [13 x i8] c"SampleFormat\00", align 1
@.str.64 = private unnamed_addr constant [16 x i8] c"SMinSampleValue\00", align 1
@.str.65 = private unnamed_addr constant [16 x i8] c"SMaxSampleValue\00", align 1
@.str.66 = private unnamed_addr constant [18 x i8] c"YCbCrCoefficients\00", align 1
@.str.67 = private unnamed_addr constant [17 x i8] c"YCbCrSubsampling\00", align 1
@.str.68 = private unnamed_addr constant [17 x i8] c"YCbCrPositioning\00", align 1
@.str.69 = private unnamed_addr constant [20 x i8] c"ReferenceBlackWhite\00", align 1
@.str.70 = private unnamed_addr constant [9 x i8] c"Matteing\00", align 1
@.str.71 = private unnamed_addr constant [9 x i8] c"DataType\00", align 1
@.str.72 = private unnamed_addr constant [11 x i8] c"ImageDepth\00", align 1
@.str.73 = private unnamed_addr constant [10 x i8] c"TileDepth\00", align 1
@.str.74 = private unnamed_addr constant [13 x i8] c"RichTIFFIPTC\00", align 1
@.str.75 = private unnamed_addr constant [10 x i8] c"Photoshop\00", align 1
@.str.76 = private unnamed_addr constant [12 x i8] c"ICC Profile\00", align 1
@.str.77 = private unnamed_addr constant [8 x i8] c"StoNits\00", align 1
@.str.78 = private unnamed_addr constant [15 x i8] c"ImageFullWidth\00", align 1
@.str.79 = private unnamed_addr constant [16 x i8] c"ImageFullLength\00", align 1
@.str.80 = private unnamed_addr constant [14 x i8] c"TextureFormat\00", align 1
@.str.81 = private unnamed_addr constant [17 x i8] c"TextureWrapModes\00", align 1
@.str.82 = private unnamed_addr constant [17 x i8] c"FieldOfViewCotan\00", align 1
@.str.83 = private unnamed_addr constant [20 x i8] c"MatrixWorldToScreen\00", align 1
@.str.84 = private unnamed_addr constant [20 x i8] c"MatrixWorldToCamera\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn__TIFFSetupFieldInfo = private constant [19 x i8] c"_TIFFSetupFieldInfo"
@__profn__TIFFMergeFieldInfo = private constant [19 x i8] c"_TIFFMergeFieldInfo"
@__profn_tmp1.ll_tagCompare = private constant [18 x i8] c"tmp1.ll:tagCompare"
@__profn__TIFFPrintFieldInfo = private constant [19 x i8] c"_TIFFPrintFieldInfo"
@__profn__TIFFSampleToTagType = private constant [20 x i8] c"_TIFFSampleToTagType"
@__profn__TIFFFindFieldInfo = private constant [18 x i8] c"_TIFFFindFieldInfo"
@__profn__TIFFFieldWithTag = private constant [17 x i8] c"_TIFFFieldWithTag"
@__profc__TIFFSetupFieldInfo = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSetupFieldInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 111241758052333273, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSetupFieldInfo, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @_TIFFSetupFieldInfo to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFMergeFieldInfo = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFMergeFieldInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4804389208368101138, i64 66479220289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, %struct.TIFFFieldInfo*, i32)* @_TIFFMergeFieldInfo to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_tagCompare = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_tagCompare = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3710553080743424635, i64 144115217743403668, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*)* @tagCompare to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFPrintFieldInfo = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFPrintFieldInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6295856113503858069, i64 144115222213516188, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i32 0, i32 0), i8* bitcast (void (%struct.tiff*, %struct._IO_FILE*)* @_TIFFPrintFieldInfo to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFSampleToTagType = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFSampleToTagType = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5603118165212109116, i64 216172871996551187, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @_TIFFSampleToTagType to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFFindFieldInfo = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFFindFieldInfo = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -736405474029155758, i64 107345552224, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i32 0, i32 0), i8* bitcast (%struct.TIFFFieldInfo* (%struct.tiff*, i32, i32)* @_TIFFFindFieldInfo to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc__TIFFFieldWithTag = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd__TIFFFieldWithTag = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -164648780095577140, i64 45417335207, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i32 0, i32 0), i8* bitcast (%struct.TIFFFieldInfo* (%struct.tiff*, i32)* @_TIFFFieldWithTag to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [97 x i8] c"\88\01^x\DA\8B\0F\F1ts\0BN-)-p\CBL\CDI\F1\CCK\CBg\8C\07\89\F9\A6\16\A5\A7\22\C4Jr\0B\0C\F5rr\ACJ\12\D3\9D\F3s\0B\12\8BR!\CA\02\8A2\F3J\D0\B4\06'\E6\16\E4\A4\86\E4\87$\A6\87T\16@\15\BAe\E6\A5\A0\A9\03s\C33K2\80\0A\01\C6\FE/\CA", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSetupFieldInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFMergeFieldInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_tagCompare to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFPrintFieldInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFSampleToTagType to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFFindFieldInfo to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd__TIFFFieldWithTag to i8*), i8* getelementptr inbounds ([97 x i8], [97 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @_TIFFSetupFieldInfo(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %3 = load %struct.tiff*, %struct.tiff** %2, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %3, i32 0, i32 55
  %5 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %4, align 8
  %6 = icmp ne %struct.TIFFFieldInfo** %5, null
  br i1 %6, label %7, label %15

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSetupFieldInfo, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSetupFieldInfo, i64 0, i64 1)
  %9 = load %struct.tiff*, %struct.tiff** %2, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 55
  %11 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %10, align 8
  %12 = bitcast %struct.TIFFFieldInfo** %11 to i8*
  call void @_TIFFfree(i8* %12)
  %13 = load %struct.tiff*, %struct.tiff** %2, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %13, i32 0, i32 56
  store i32 0, i32* %14, align 8
  br label %15

; <label>:15:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSetupFieldInfo, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc__TIFFSetupFieldInfo, i64 0, i64 0)
  %17 = load %struct.tiff*, %struct.tiff** %2, align 8
  call void @_TIFFMergeFieldInfo(%struct.tiff* %17, %struct.TIFFFieldInfo* getelementptr inbounds ([92 x %struct.TIFFFieldInfo], [92 x %struct.TIFFFieldInfo]* @tiffFieldInfo, i32 0, i32 0), i32 92)
  ret void
}

declare void @_TIFFfree(i8*) #1

; Function Attrs: nounwind uwtable
define void @_TIFFMergeFieldInfo(%struct.tiff*, %struct.TIFFFieldInfo*, i32) #0 {
  %4 = alloca %struct.tiff*, align 8
  %5 = alloca %struct.TIFFFieldInfo*, align 8
  %6 = alloca i32, align 4
  %7 = alloca %struct.TIFFFieldInfo**, align 8
  %8 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %4, align 8
  store %struct.TIFFFieldInfo* %1, %struct.TIFFFieldInfo** %5, align 8
  store i32 %2, i32* %6, align 4
  %9 = load %struct.tiff*, %struct.tiff** %4, align 8
  %10 = getelementptr inbounds %struct.tiff, %struct.tiff* %9, i32 0, i32 56
  %11 = load i32, i32* %10, align 8
  %12 = icmp sgt i32 %11, 0
  br i1 %12, label %13, label %30

; <label>:13:                                     ; preds = %3
  %14 = load %struct.tiff*, %struct.tiff** %4, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 55
  %16 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %15, align 8
  %17 = bitcast %struct.TIFFFieldInfo** %16 to i8*
  %18 = load %struct.tiff*, %struct.tiff** %4, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 56
  %20 = load i32, i32* %19, align 8
  %21 = load i32, i32* %6, align 4
  %22 = add nsw i32 %20, %21
  %23 = sext i32 %22 to i64
  %24 = mul i64 %23, 8
  %25 = trunc i64 %24 to i32
  %26 = call i8* @_TIFFrealloc(i8* %17, i32 %25)
  %27 = bitcast i8* %26 to %struct.TIFFFieldInfo**
  %28 = load %struct.tiff*, %struct.tiff** %4, align 8
  %29 = getelementptr inbounds %struct.tiff, %struct.tiff* %28, i32 0, i32 55
  store %struct.TIFFFieldInfo** %27, %struct.TIFFFieldInfo*** %29, align 8
  br label %40

; <label>:30:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 2)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 2)
  %32 = load i32, i32* %6, align 4
  %33 = sext i32 %32 to i64
  %34 = mul i64 %33, 8
  %35 = trunc i64 %34 to i32
  %36 = call i8* @_TIFFmalloc(i32 %35)
  %37 = bitcast i8* %36 to %struct.TIFFFieldInfo**
  %38 = load %struct.tiff*, %struct.tiff** %4, align 8
  %39 = getelementptr inbounds %struct.tiff, %struct.tiff* %38, i32 0, i32 55
  store %struct.TIFFFieldInfo** %37, %struct.TIFFFieldInfo*** %39, align 8
  br label %40

; <label>:40:                                     ; preds = %30, %13
  %41 = load %struct.tiff*, %struct.tiff** %4, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 55
  %43 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %42, align 8
  %44 = load %struct.tiff*, %struct.tiff** %4, align 8
  %45 = getelementptr inbounds %struct.tiff, %struct.tiff* %44, i32 0, i32 56
  %46 = load i32, i32* %45, align 8
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %43, i64 %47
  store %struct.TIFFFieldInfo** %48, %struct.TIFFFieldInfo*** %7, align 8
  store i32 0, i32* %8, align 4
  br label %49

; <label>:49:                                     ; preds = %63, %40
  %50 = load i32, i32* %8, align 4
  %51 = load i32, i32* %6, align 4
  %52 = icmp slt i32 %50, %51
  br i1 %52, label %53, label %66

; <label>:53:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 0)
  %54 = add i64 %pgocount1, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 0)
  %55 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %5, align 8
  %56 = load i32, i32* %8, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %55, i64 %57
  %59 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %7, align 8
  %60 = load i32, i32* %8, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %59, i64 %61
  store %struct.TIFFFieldInfo* %58, %struct.TIFFFieldInfo** %62, align 8
  br label %63

; <label>:63:                                     ; preds = %53
  %64 = load i32, i32* %8, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %8, align 4
  br label %49

; <label>:66:                                     ; preds = %49
  %67 = load %struct.tiff*, %struct.tiff** %4, align 8
  %68 = getelementptr inbounds %struct.tiff, %struct.tiff* %67, i32 0, i32 56
  %69 = load i32, i32* %68, align 8
  %70 = icmp sgt i32 %69, 0
  br i1 %70, label %71, label %83

; <label>:71:                                     ; preds = %66
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 1)
  %72 = add i64 %pgocount2, 1
  store i64 %72, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 1)
  %73 = load %struct.tiff*, %struct.tiff** %4, align 8
  %74 = getelementptr inbounds %struct.tiff, %struct.tiff* %73, i32 0, i32 55
  %75 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %74, align 8
  %76 = bitcast %struct.TIFFFieldInfo** %75 to i8*
  %77 = load i32, i32* %6, align 4
  %78 = load %struct.tiff*, %struct.tiff** %4, align 8
  %79 = getelementptr inbounds %struct.tiff, %struct.tiff* %78, i32 0, i32 56
  %80 = load i32, i32* %79, align 8
  %81 = add nsw i32 %80, %77
  store i32 %81, i32* %79, align 8
  %82 = sext i32 %81 to i64
  call void @qsort(i8* %76, i64 %82, i64 8, i32 (i8*, i8*)* @tagCompare)
  br label %90

; <label>:83:                                     ; preds = %66
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 3)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFMergeFieldInfo, i64 0, i64 3)
  %85 = load i32, i32* %6, align 4
  %86 = load %struct.tiff*, %struct.tiff** %4, align 8
  %87 = getelementptr inbounds %struct.tiff, %struct.tiff* %86, i32 0, i32 56
  %88 = load i32, i32* %87, align 8
  %89 = add nsw i32 %88, %85
  store i32 %89, i32* %87, align 8
  br label %90

; <label>:90:                                     ; preds = %83, %71
  ret void
}

declare i8* @_TIFFrealloc(i8*, i32) #1

declare i8* @_TIFFmalloc(i32) #1

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)*) #1

; Function Attrs: nounwind uwtable
define internal i32 @tagCompare(i8*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.TIFFFieldInfo*, align 8
  %7 = alloca %struct.TIFFFieldInfo*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = bitcast i8* %8 to %struct.TIFFFieldInfo**
  %10 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %9, align 8
  store %struct.TIFFFieldInfo* %10, %struct.TIFFFieldInfo** %6, align 8
  %11 = load i8*, i8** %5, align 8
  %12 = bitcast i8* %11 to %struct.TIFFFieldInfo**
  %13 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %12, align 8
  store %struct.TIFFFieldInfo* %13, %struct.TIFFFieldInfo** %7, align 8
  %14 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %15 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %14, i32 0, i32 0
  %16 = load i32, i32* %15, align 8
  %17 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %18 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %17, i32 0, i32 0
  %19 = load i32, i32* %18, align 8
  %20 = icmp ne i32 %16, %19
  br i1 %20, label %21, label %33

; <label>:21:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 0)
  %23 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %24 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %23, i32 0, i32 0
  %25 = load i32, i32* %24, align 8
  %26 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %27 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 8
  %29 = icmp ult i32 %25, %28
  %30 = zext i1 %29 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 2)
  %31 = add i64 %pgocount1, %30
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 2)
  %32 = select i1 %29, i32 -1, i32 1
  store i32 %32, i32* %3, align 4
  br label %45

; <label>:33:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 1)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 1)
  %35 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %7, align 8
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %35, i32 0, i32 3
  %37 = load i32, i32* %36, align 8
  %38 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %39 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %38, i32 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = icmp ult i32 %37, %40
  %42 = zext i1 %41 to i64
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 3)
  %43 = add i64 %pgocount3, %42
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_tagCompare, i64 0, i64 3)
  %44 = select i1 %41, i32 -1, i32 1
  store i32 %44, i32* %3, align 4
  br label %45

; <label>:45:                                     ; preds = %33, %21
  %46 = load i32, i32* %3, align 4
  ret i32 %46
}

; Function Attrs: nounwind uwtable
define void @_TIFFPrintFieldInfo(%struct.tiff*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 0
  %10 = load i8*, i8** %9, align 8
  %11 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* %10)
  store i32 0, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %67, %2
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 56
  %16 = load i32, i32* %15, align 8
  %17 = icmp slt i32 %13, %16
  br i1 %17, label %18, label %71

; <label>:18:                                     ; preds = %12
  %19 = load %struct.tiff*, %struct.tiff** %3, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 55
  %21 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %20, align 8
  %22 = load i32, i32* %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %21, i64 %23
  %25 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %24, align 8
  store %struct.TIFFFieldInfo* %25, %struct.TIFFFieldInfo** %6, align 8
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %27 = load i32, i32* %5, align 4
  %28 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %29 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %28, i32 0, i32 0
  %30 = load i32, i32* %29, align 8
  %31 = zext i32 %30 to i64
  %32 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %33 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %32, i32 0, i32 1
  %34 = load i16, i16* %33, align 4
  %35 = sext i16 %34 to i32
  %36 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %37 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %36, i32 0, i32 2
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i32
  %40 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %41 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %40, i32 0, i32 3
  %42 = load i32, i32* %41, align 8
  %43 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %44 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %43, i32 0, i32 4
  %45 = load i16, i16* %44, align 4
  %46 = zext i16 %45 to i32
  %47 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %48 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %47, i32 0, i32 5
  %49 = load i8, i8* %48, align 2
  %50 = zext i8 %49 to i32
  %51 = icmp ne i32 %50, 0
  %52 = zext i1 %51 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 2)
  %53 = add i64 %pgocount, %52
  store i64 %53, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 2)
  %54 = select i1 %51, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)
  %55 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %56 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %55, i32 0, i32 6
  %57 = load i8, i8* %56, align 1
  %58 = zext i8 %57 to i32
  %59 = icmp ne i32 %58, 0
  %60 = zext i1 %59 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 3)
  %61 = add i64 %pgocount1, %60
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 3)
  %62 = select i1 %59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0)
  %63 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %6, align 8
  %64 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %63, i32 0, i32 7
  %65 = load i8*, i8** %64, align 8
  %66 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i32 0, i32 0), i32 %27, i64 %31, i32 %35, i32 %39, i32 %42, i32 %46, i8* %54, i8* %62, i8* %65)
  br label %67

; <label>:67:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 0)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 0)
  %69 = load i32, i32* %5, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %5, align 4
  br label %12

; <label>:71:                                     ; preds = %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 1)
  %72 = add i64 %pgocount3, 1
  store i64 %72, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc__TIFFPrintFieldInfo, i64 0, i64 1)
  ret void
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind uwtable
define i32 @_TIFFSampleToTagType(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %5 = load %struct.tiff*, %struct.tiff** %3, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %5, i32 0, i32 6
  %7 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %6, i32 0, i32 8
  %8 = load i16, i16* %7, align 4
  %9 = zext i16 %8 to i32
  %10 = add i32 %9, 7
  %11 = udiv i32 %10, 8
  store i32 %11, i32* %4, align 4
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 6
  %14 = getelementptr inbounds %struct.TIFFDirectory, %struct.TIFFDirectory* %13, i32 0, i32 9
  %15 = load i16, i16* %14, align 2
  %16 = zext i16 %15 to i32
  switch i32 %16, label %54 [
    i32 3, label %17
    i32 2, label %24
    i32 1, label %38
    i32 4, label %52
  ]

; <label>:17:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 1)
  %19 = load i32, i32* %4, align 4
  %20 = icmp eq i32 %19, 4
  %21 = zext i1 %20 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 7)
  %22 = add i64 %pgocount1, %21
  store i64 %22, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 7)
  %23 = select i1 %20, i32 11, i32 12
  store i32 %23, i32* %2, align 4
  br label %56

; <label>:24:                                     ; preds = %1
  %25 = load i32, i32* %4, align 4
  %26 = icmp sle i32 %25, 1
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 3)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 3)
  br label %36

; <label>:29:                                     ; preds = %24
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 4)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 4)
  %31 = load i32, i32* %4, align 4
  %32 = icmp sle i32 %31, 2
  %33 = zext i1 %32 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 8)
  %34 = add i64 %pgocount4, %33
  store i64 %34, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 8)
  %35 = select i1 %32, i32 8, i32 9
  br label %36

; <label>:36:                                     ; preds = %29, %27
  %37 = phi i32 [ 6, %27 ], [ %35, %29 ]
  store i32 %37, i32* %2, align 4
  br label %56

; <label>:38:                                     ; preds = %1
  %39 = load i32, i32* %4, align 4
  %40 = icmp sle i32 %39, 1
  br i1 %40, label %41, label %43

; <label>:41:                                     ; preds = %38
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 5)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 5)
  br label %50

; <label>:43:                                     ; preds = %38
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 6)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 6)
  %45 = load i32, i32* %4, align 4
  %46 = icmp sle i32 %45, 2
  %47 = zext i1 %46 to i64
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 9)
  %48 = add i64 %pgocount7, %47
  store i64 %48, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 9)
  %49 = select i1 %46, i32 3, i32 4
  br label %50

; <label>:50:                                     ; preds = %43, %41
  %51 = phi i32 [ 1, %41 ], [ %49, %43 ]
  store i32 %51, i32* %2, align 4
  br label %56

; <label>:52:                                     ; preds = %1
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 0)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 0)
  store i32 7, i32* %2, align 4
  br label %56

; <label>:54:                                     ; preds = %1
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 2)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc__TIFFSampleToTagType, i64 0, i64 2)
  store i32 7, i32* %2, align 4
  br label %56

; <label>:56:                                     ; preds = %54, %52, %50, %36, %17
  %57 = load i32, i32* %2, align 4
  ret i32 %57
}

; Function Attrs: nounwind uwtable
define %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff*, i32, i32) #0 {
  %4 = alloca %struct.TIFFFieldInfo*, align 8
  %5 = alloca %struct.tiff*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %11 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  %12 = icmp ne %struct.TIFFFieldInfo* %11, null
  br i1 %12, label %13, label %34

; <label>:13:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 3)
  %15 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  %16 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 8
  %18 = load i32, i32* %6, align 4
  %19 = icmp eq i32 %17, %18
  br i1 %19, label %20, label %34

; <label>:20:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 6)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 6)
  %22 = load i32, i32* %7, align 4
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %31, label %24

; <label>:24:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 8)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 8)
  %26 = load i32, i32* %7, align 4
  %27 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  %28 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %27, i32 0, i32 3
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %26, %29
  br i1 %30, label %31, label %34

; <label>:31:                                     ; preds = %24, %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 7)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 7)
  %33 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  store %struct.TIFFFieldInfo* %33, %struct.TIFFFieldInfo** %4, align 8
  br label %76

; <label>:34:                                     ; preds = %24, %13, %3
  store i32 0, i32* %8, align 4
  %35 = load %struct.tiff*, %struct.tiff** %5, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 56
  %37 = load i32, i32* %36, align 8
  store i32 %37, i32* %9, align 4
  br label %38

; <label>:38:                                     ; preds = %70, %34
  %39 = load i32, i32* %8, align 4
  %40 = load i32, i32* %9, align 4
  %41 = icmp slt i32 %39, %40
  br i1 %41, label %42, label %74

; <label>:42:                                     ; preds = %38
  %43 = load %struct.tiff*, %struct.tiff** %5, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 55
  %45 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %44, align 8
  %46 = load i32, i32* %8, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %45, i64 %47
  %49 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %48, align 8
  store %struct.TIFFFieldInfo* %49, %struct.TIFFFieldInfo** %10, align 8
  %50 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %10, align 8
  %51 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %50, i32 0, i32 0
  %52 = load i32, i32* %51, align 8
  %53 = load i32, i32* %6, align 4
  %54 = icmp eq i32 %52, %53
  br i1 %54, label %55, label %69

; <label>:55:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 1)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 1)
  %57 = load i32, i32* %7, align 4
  %58 = icmp eq i32 %57, 0
  br i1 %58, label %66, label %59

; <label>:59:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 2)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 2)
  %61 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %10, align 8
  %62 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %61, i32 0, i32 3
  %63 = load i32, i32* %62, align 8
  %64 = load i32, i32* %7, align 4
  %65 = icmp eq i32 %63, %64
  br i1 %65, label %66, label %69

; <label>:66:                                     ; preds = %59, %55
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 5)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 5)
  %68 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %10, align 8
  store %struct.TIFFFieldInfo* %68, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  store %struct.TIFFFieldInfo* %68, %struct.TIFFFieldInfo** %4, align 8
  br label %76

; <label>:69:                                     ; preds = %59, %42
  br label %70

; <label>:70:                                     ; preds = %69
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 0)
  %71 = add i64 %pgocount7, 1
  store i64 %71, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 0)
  %72 = load i32, i32* %8, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %8, align 4
  br label %38

; <label>:74:                                     ; preds = %38
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 4)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc__TIFFFindFieldInfo, i64 0, i64 4)
  store %struct.TIFFFieldInfo* null, %struct.TIFFFieldInfo** %4, align 8
  br label %76

; <label>:76:                                     ; preds = %74, %66, %31
  %77 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %4, align 8
  ret %struct.TIFFFieldInfo* %77
}

; Function Attrs: nounwind uwtable
define %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.TIFFFieldInfo*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = load i32, i32* %4, align 4
  %8 = call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %6, i32 %7, i32 0)
  store %struct.TIFFFieldInfo* %8, %struct.TIFFFieldInfo** %5, align 8
  %9 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %5, align 8
  %10 = icmp ne %struct.TIFFFieldInfo* %9, null
  br i1 %10, label %21, label %11

; <label>:11:                                     ; preds = %2
  %12 = load i32, i32* %4, align 4
  call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.5, i32 0, i32 0), i32 %12)
  %13 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %5, align 8
  %14 = icmp ne %struct.TIFFFieldInfo* %13, null
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %11
  br label %19

; <label>:16:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 2)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i32 0, i32 0), i32 398, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__._TIFFFieldWithTag, i32 0, i32 0)) #4
  unreachable
                                                  ; No predecessors!
  br label %19

; <label>:19:                                     ; preds = %18, %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 1)
  br label %21

; <label>:21:                                     ; preds = %19, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 0)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc__TIFFFieldWithTag, i64 0, i64 0)
  %23 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %5, align 8
  ret %struct.TIFFFieldInfo* %23
}

declare void @TIFFError(i8*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

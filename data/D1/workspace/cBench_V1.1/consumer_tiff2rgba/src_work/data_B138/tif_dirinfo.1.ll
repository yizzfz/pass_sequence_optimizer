; ModuleID = 'tif_dirinfo.ll'
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

@tiffFieldInfo = internal constant [92 x %struct.TIFFFieldInfo] [%struct.TIFFFieldInfo { i32 254, i16 1, i16 1, i32 4, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 254, i16 1, i16 1, i32 3, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.8, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 255, i16 1, i16 1, i32 3, i16 5, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.9, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 256, i16 1, i16 1, i32 4, i16 1, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 256, i16 1, i16 1, i32 3, i16 1, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 257, i16 1, i16 1, i32 4, i16 1, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 257, i16 1, i16 1, i32 3, i16 1, i8 1, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.11, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 258, i16 -1, i16 -1, i32 3, i16 6, i8 0, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.12, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 259, i16 -1, i16 1, i32 3, i16 7, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.13, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 262, i16 1, i16 1, i32 3, i16 8, i8 0, i8 0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.14, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 263, i16 1, i16 1, i32 3, i16 9, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.15, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 264, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.16, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 265, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.17, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 266, i16 1, i16 1, i32 3, i16 10, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.18, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 269, i16 -1, i16 -1, i32 2, i16 11, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.19, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 270, i16 -1, i16 -1, i32 2, i16 12, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 271, i16 -1, i16 -1, i32 2, i16 13, i8 1, i8 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 272, i16 -1, i16 -1, i32 2, i16 14, i8 1, i8 0, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.22, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 273, i16 -1, i16 -1, i32 4, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 273, i16 -1, i16 -1, i32 3, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.23, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 274, i16 1, i16 1, i32 3, i16 15, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.24, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 277, i16 1, i16 1, i32 3, i16 16, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.25, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 278, i16 1, i16 1, i32 4, i16 17, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 278, i16 1, i16 1, i32 3, i16 17, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.26, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 279, i16 -1, i16 -1, i32 4, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.27, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 279, i16 -1, i16 -1, i32 3, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.27, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 280, i16 -2, i16 -1, i32 3, i16 18, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.28, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 281, i16 -2, i16 -1, i32 3, i16 19, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.29, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 282, i16 1, i16 1, i32 5, i16 3, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.30, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 283, i16 1, i16 1, i32 5, i16 3, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.31, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 284, i16 1, i16 1, i32 3, i16 20, i8 0, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.32, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 285, i16 -1, i16 -1, i32 2, i16 21, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.33, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 286, i16 1, i16 1, i32 5, i16 4, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.34, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 287, i16 1, i16 1, i32 5, i16 4, i8 1, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.35, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 288, i16 -1, i16 -1, i32 4, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.36, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 289, i16 -1, i16 -1, i32 4, i16 0, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.37, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 290, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.38, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 291, i16 -1, i16 -1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.39, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 296, i16 1, i16 1, i32 3, i16 22, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.40, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 297, i16 2, i16 2, i32 3, i16 23, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.41, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 300, i16 1, i16 1, i32 3, i16 0, i8 1, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.42, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 301, i16 -1, i16 -1, i32 3, i16 44, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.43, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 305, i16 -1, i16 -1, i32 2, i16 30, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.44, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 306, i16 20, i16 20, i32 2, i16 28, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.45, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 315, i16 -1, i16 -1, i32 2, i16 27, i8 1, i8 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.46, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 316, i16 -1, i16 -1, i32 2, i16 29, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.47, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 318, i16 2, i16 2, i32 5, i16 42, i8 1, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.48, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 319, i16 6, i16 6, i32 5, i16 43, i8 1, i8 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.49, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 320, i16 -1, i16 -1, i32 3, i16 26, i8 1, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.50, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 321, i16 2, i16 2, i32 3, i16 37, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.51, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 322, i16 1, i16 1, i32 4, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.52, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 322, i16 1, i16 1, i32 3, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.52, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 323, i16 1, i16 1, i32 4, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.53, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 323, i16 1, i16 1, i32 3, i16 2, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.53, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 324, i16 -1, i16 1, i32 4, i16 25, i8 0, i8 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.54, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 325, i16 -1, i16 1, i32 4, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.55, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 325, i16 -1, i16 1, i32 3, i16 24, i8 0, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.55, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 330, i16 -1, i16 -1, i32 4, i16 49, i8 1, i8 1, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.56, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 332, i16 1, i16 1, i32 3, i16 45, i8 0, i8 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.57, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 333, i16 -1, i16 -1, i32 2, i16 46, i8 1, i8 1, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.58, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 334, i16 1, i16 1, i32 3, i16 50, i8 1, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.59, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 336, i16 2, i16 2, i32 3, i16 47, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 336, i16 2, i16 2, i32 1, i16 47, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.60, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 337, i16 -1, i16 -1, i32 2, i16 48, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.61, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 338, i16 -1, i16 -1, i32 3, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.62, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 338, i16 -1, i16 -1, i32 1, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.62, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 339, i16 -1, i16 -1, i32 3, i16 32, i8 0, i8 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.63, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 340, i16 -2, i16 -1, i32 0, i16 33, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.64, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 341, i16 -2, i16 -1, i32 0, i16 34, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.65, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 529, i16 3, i16 3, i32 5, i16 38, i8 0, i8 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.66, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 530, i16 2, i16 2, i32 3, i16 39, i8 0, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.67, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 531, i16 1, i16 1, i32 3, i16 40, i8 0, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.68, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 532, i16 6, i16 6, i32 5, i16 41, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 532, i16 6, i16 6, i32 4, i16 41, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.69, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32995, i16 1, i16 1, i32 3, i16 31, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.70, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32996, i16 -2, i16 -1, i32 3, i16 32, i8 0, i8 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.71, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32997, i16 1, i16 1, i32 4, i16 35, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32997, i16 1, i16 1, i32 3, i16 35, i8 0, i8 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.72, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32998, i16 1, i16 1, i32 4, i16 36, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.73, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 32998, i16 1, i16 1, i32 3, i16 36, i8 0, i8 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.73, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33723, i16 -1, i16 -1, i32 4, i16 53, i8 0, i8 1, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.74, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34377, i16 -1, i16 -3, i32 7, i16 52, i8 0, i8 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.75, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34377, i16 -1, i16 -1, i32 1, i16 52, i8 0, i8 1, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.75, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 34675, i16 -1, i16 -3, i32 7, i16 51, i8 0, i8 1, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.76, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 37439, i16 1, i16 1, i32 12, i16 54, i8 0, i8 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.77, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33300, i16 1, i16 1, i32 4, i16 55, i8 1, i8 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.78, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33301, i16 1, i16 1, i32 4, i16 56, i8 1, i8 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.79, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33302, i16 -1, i16 -1, i32 2, i16 57, i8 1, i8 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.80, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33303, i16 -1, i16 -1, i32 2, i16 58, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.81, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33304, i16 1, i16 1, i32 11, i16 59, i8 1, i8 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.82, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33305, i16 16, i16 16, i32 11, i16 60, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.83, i32 0, i32 0) }, %struct.TIFFFieldInfo { i32 33306, i16 16, i16 16, i32 11, i16 61, i8 1, i8 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.84, i32 0, i32 0) }], align 16
@.str = private unnamed_addr constant [6 x i8] c"%s: \0A\00", align 1
@.str.1 = private unnamed_addr constant [50 x i8] c"field[%2d] %5lu, %2d, %2d, %d, %2d, %5s, %5s, %s\0A\00", align 1
@.str.2 = private unnamed_addr constant [5 x i8] c"TRUE\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"FALSE\00", align 1
@tiffDataWidth = local_unnamed_addr constant [13 x i32] [i32 1, i32 1, i32 1, i32 2, i32 4, i32 8, i32 1, i32 1, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@_TIFFFindFieldInfo.last = internal unnamed_addr global %struct.TIFFFieldInfo* null, align 8
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

; Function Attrs: noinline nounwind uwtable
define void @_TIFFSetupFieldInfo(%struct.tiff* nocapture) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %3 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %2, align 8
  %4 = icmp eq %struct.TIFFFieldInfo** %3, null
  br i1 %4, label %9, label %5

; <label>:5:                                      ; preds = %1
  %6 = bitcast %struct.TIFFFieldInfo*** %2 to i8**
  %7 = load i8*, i8** %6, align 8
  tail call void @_TIFFfree(i8* %7) #6
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  store i32 0, i32* %8, align 8
  br label %9

; <label>:9:                                      ; preds = %1, %5
  tail call void @_TIFFMergeFieldInfo(%struct.tiff* nonnull %0, %struct.TIFFFieldInfo* getelementptr inbounds ([92 x %struct.TIFFFieldInfo], [92 x %struct.TIFFFieldInfo]* @tiffFieldInfo, i64 0, i64 0), i32 92)
  ret void
}

declare void @_TIFFfree(i8*) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @_TIFFMergeFieldInfo(%struct.tiff* nocapture, %struct.TIFFFieldInfo*, i32) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  %5 = load i32, i32* %4, align 8
  %6 = icmp sgt i32 %5, 0
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %3
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %9 = bitcast %struct.TIFFFieldInfo*** %8 to i8**
  %10 = load i8*, i8** %9, align 8
  %11 = add nsw i32 %5, %2
  %12 = shl i32 %11, 3
  %13 = tail call i8* @_TIFFrealloc(i8* %10, i32 %12) #6
  br label %17

; <label>:14:                                     ; preds = %3
  %15 = shl i32 %2, 3
  %16 = tail call i8* @_TIFFmalloc(i32 %15) #6
  br label %17

; <label>:17:                                     ; preds = %14, %7
  %.sink = phi i8* [ %16, %14 ], [ %13, %7 ]
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %19 = bitcast %struct.TIFFFieldInfo*** %18 to i8**
  store i8* %.sink, i8** %19, align 8
  %.cast = bitcast i8* %.sink to %struct.TIFFFieldInfo**
  %20 = load i32, i32* %4, align 8
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %.cast, i64 %21
  %23 = icmp sgt i32 %2, 0
  br i1 %23, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %17
  %24 = add i32 %2, -1
  %xtraiter = and i32 %2, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %25 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.prol
  %26 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.prol
  store %struct.TIFFFieldInfo* %25, %struct.TIFFFieldInfo** %26, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !1

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.prol, %.lr.ph.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %24, 7
  br i1 %27, label %._crit_edgethread-pre-split, label %.lr.ph.preheader4

.lr.ph.preheader4:                                ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count.7 = zext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader4, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph ], [ %indvars.iv.unr, %.lr.ph.preheader4 ]
  %28 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv
  %29 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv
  store %struct.TIFFFieldInfo* %28, %struct.TIFFFieldInfo** %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next
  %31 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next
  store %struct.TIFFFieldInfo* %30, %struct.TIFFFieldInfo** %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %32 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.1
  %33 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.1
  store %struct.TIFFFieldInfo* %32, %struct.TIFFFieldInfo** %33, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %34 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.2
  %35 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.2
  store %struct.TIFFFieldInfo* %34, %struct.TIFFFieldInfo** %35, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.3
  %37 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.3
  store %struct.TIFFFieldInfo* %36, %struct.TIFFFieldInfo** %37, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %38 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.4
  %39 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.4
  store %struct.TIFFFieldInfo* %38, %struct.TIFFFieldInfo** %39, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %40 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.5
  %41 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.5
  store %struct.TIFFFieldInfo* %40, %struct.TIFFFieldInfo** %41, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %42 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %1, i64 %indvars.iv.next.6
  %43 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %22, i64 %indvars.iv.next.6
  store %struct.TIFFFieldInfo* %42, %struct.TIFFFieldInfo** %43, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %._crit_edgethread-pre-split.loopexit, label %.lr.ph

._crit_edgethread-pre-split.loopexit:             ; preds = %.lr.ph
  br label %._crit_edgethread-pre-split

._crit_edgethread-pre-split:                      ; preds = %._crit_edgethread-pre-split.loopexit, %.lr.ph.prol.loopexit
  %.pr = load i32, i32* %4, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edgethread-pre-split, %17
  %44 = phi i32 [ %.pr, %._crit_edgethread-pre-split ], [ %20, %17 ]
  %45 = icmp sgt i32 %44, 0
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %._crit_edge
  %47 = load i8*, i8** %19, align 8
  %48 = add nsw i32 %44, %2
  store i32 %48, i32* %4, align 8
  %49 = sext i32 %48 to i64
  tail call void @qsort(i8* %47, i64 %49, i64 8, i32 (i8*, i8*)* nonnull @tagCompare) #6
  br label %52

; <label>:50:                                     ; preds = %._crit_edge
  %51 = add nsw i32 %44, %2
  store i32 %51, i32* %4, align 8
  br label %52

; <label>:52:                                     ; preds = %50, %46
  ret void
}

declare i8* @_TIFFrealloc(i8*, i32) local_unnamed_addr #1

declare i8* @_TIFFmalloc(i32) local_unnamed_addr #1

declare void @qsort(i8*, i64, i64, i32 (i8*, i8*)* nocapture) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define internal i32 @tagCompare(i8* nocapture readonly, i8* nocapture readonly) #2 {
  %3 = bitcast i8* %0 to %struct.TIFFFieldInfo**
  %4 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %3, align 8
  %5 = bitcast i8* %1 to %struct.TIFFFieldInfo**
  %6 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %5, align 8
  %7 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %4, i64 0, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %6, i64 0, i32 0
  %10 = load i32, i32* %9, align 8
  %11 = icmp eq i32 %8, %10
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %6, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %4, i64 0, i32 3
  br label %16

; <label>:16:                                     ; preds = %2, %12
  %.sink = phi i32* [ %15, %12 ], [ %9, %2 ]
  %.sink1 = phi i32 [ %14, %12 ], [ %8, %2 ]
  %17 = load i32, i32* %.sink, align 8
  %18 = icmp ult i32 %.sink1, %17
  %19 = select i1 %18, i32 -1, i32 1
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define void @_TIFFPrintFieldInfo(%struct.tiff* nocapture readonly, %struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %4 = load i8*, i8** %3, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i64 0, i64 0), i8* %4)
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  %7 = load i32, i32* %6, align 8
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %10
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %10 ]
  %11 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %9, align 8
  %12 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %11, i64 %indvars.iv
  %13 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %12, align 8
  %14 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 0
  %15 = load i32, i32* %14, align 8
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 1
  %18 = load i16, i16* %17, align 4
  %19 = sext i16 %18 to i32
  %20 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 2
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 3
  %24 = load i32, i32* %23, align 8
  %25 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 4
  %26 = load i16, i16* %25, align 4
  %27 = zext i16 %26 to i32
  %28 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 5
  %29 = load i8, i8* %28, align 2
  %30 = icmp ne i8 %29, 0
  %31 = select i1 %30, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)
  %32 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 6
  %33 = load i8, i8* %32, align 1
  %34 = icmp ne i8 %33, 0
  %35 = select i1 %34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i64 0, i64 0)
  %36 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %13, i64 0, i32 7
  %37 = load i8*, i8** %36, align 8
  %38 = trunc i64 %indvars.iv to i32
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i64 0, i64 0), i32 %38, i64 %16, i32 %19, i32 %22, i32 %24, i32 %27, i8* %31, i8* %35, i8* %37)
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %40 = load i32, i32* %6, align 8
  %41 = sext i32 %40 to i64
  %42 = icmp slt i64 %indvars.iv.next, %41
  br i1 %42, label %10, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %10
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  ret void
}

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @_TIFFSampleToTagType(%struct.tiff* nocapture readonly) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = add nuw nsw i32 %4, 7
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 9
  %7 = load i16, i16* %6, align 2
  switch i16 %7, label %21 [
    i16 3, label %8
    i16 2, label %11
    i16 1, label %16
  ]

; <label>:8:                                      ; preds = %1
  %.mask = and i32 %5, 131064
  %9 = icmp eq i32 %.mask, 32
  %10 = select i1 %9, i32 11, i32 12
  br label %21

; <label>:11:                                     ; preds = %1
  %12 = icmp ult i32 %5, 16
  %13 = icmp ult i32 %5, 24
  %14 = select i1 %13, i32 8, i32 9
  %15 = select i1 %12, i32 6, i32 %14
  br label %21

; <label>:16:                                     ; preds = %1
  %17 = icmp ult i32 %5, 16
  %18 = icmp ult i32 %5, 24
  %19 = select i1 %18, i32 3, i32 4
  %20 = select i1 %17, i32 1, i32 %19
  br label %21

; <label>:21:                                     ; preds = %1, %16, %11, %8
  %.0 = phi i32 [ %10, %8 ], [ %15, %11 ], [ %20, %16 ], [ 7, %1 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* nocapture readonly, i32, i32) local_unnamed_addr #4 {
  %4 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  %5 = icmp eq %struct.TIFFFieldInfo* %4, null
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %3
  %7 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %4, i64 0, i32 0
  %8 = load i32, i32* %7, align 8
  %9 = icmp eq i32 %8, %1
  br i1 %9, label %10, label %18

; <label>:10:                                     ; preds = %6
  %11 = icmp eq i32 %2, 0
  br i1 %11, label %16, label %12

; <label>:12:                                     ; preds = %10
  %13 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %4, i64 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, %2
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12, %10
  %17 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  br label %.loopexit

; <label>:18:                                     ; preds = %3, %12, %6
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 56
  %20 = load i32, i32* %19, align 8
  %21 = icmp sgt i32 %20, 0
  br i1 %21, label %.lr.ph, label %.loopexit

.lr.ph:                                           ; preds = %18
  %22 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %23 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %22, align 8
  %24 = icmp eq i32 %2, 0
  %25 = sext i32 %20 to i64
  br i1 %24, label %.lr.ph.split.us.preheader, label %.lr.ph.split.preheader

.lr.ph.split.preheader:                           ; preds = %.lr.ph
  br label %.lr.ph.split

.lr.ph.split.us.preheader:                        ; preds = %.lr.ph
  br label %.lr.ph.split.us

.lr.ph.split.us:                                  ; preds = %.lr.ph.split.us.preheader, %31
  %indvars.iv = phi i64 [ %indvars.iv.next, %31 ], [ 0, %.lr.ph.split.us.preheader ]
  %26 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %23, i64 %indvars.iv
  %27 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %26, align 8
  %28 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %27, i64 0, i32 0
  %29 = load i32, i32* %28, align 8
  %30 = icmp eq i32 %29, %1
  br i1 %30, label %.us-lcssa.us.loopexit, label %31

; <label>:31:                                     ; preds = %.lr.ph.split.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = icmp slt i64 %indvars.iv.next, %25
  br i1 %32, label %.lr.ph.split.us, label %.loopexit.loopexit

.lr.ph.split:                                     ; preds = %.lr.ph.split.preheader, %42
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %42 ], [ 0, %.lr.ph.split.preheader ]
  %33 = getelementptr inbounds %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %23, i64 %indvars.iv9
  %34 = load %struct.TIFFFieldInfo*, %struct.TIFFFieldInfo** %33, align 8
  %35 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %34, i64 0, i32 0
  %36 = load i32, i32* %35, align 8
  %37 = icmp eq i32 %36, %1
  br i1 %37, label %38, label %42

; <label>:38:                                     ; preds = %.lr.ph.split
  %39 = getelementptr inbounds %struct.TIFFFieldInfo, %struct.TIFFFieldInfo* %34, i64 0, i32 3
  %40 = load i32, i32* %39, align 8
  %41 = icmp eq i32 %40, %2
  br i1 %41, label %.us-lcssa.us.loopexit23, label %42

.us-lcssa.us.loopexit:                            ; preds = %.lr.ph.split.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit23:                          ; preds = %38
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit23, %.us-lcssa.us.loopexit
  %.lcssa = phi %struct.TIFFFieldInfo* [ %27, %.us-lcssa.us.loopexit ], [ %34, %.us-lcssa.us.loopexit23 ]
  store %struct.TIFFFieldInfo* %.lcssa, %struct.TIFFFieldInfo** @_TIFFFindFieldInfo.last, align 8
  br label %.loopexit

; <label>:42:                                     ; preds = %.lr.ph.split, %38
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %43 = icmp slt i64 %indvars.iv.next10, %25
  br i1 %43, label %.lr.ph.split, label %.loopexit.loopexit24

.loopexit.loopexit:                               ; preds = %31
  br label %.loopexit

.loopexit.loopexit24:                             ; preds = %42
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit24, %.loopexit.loopexit, %18, %.us-lcssa.us, %16
  %.0 = phi %struct.TIFFFieldInfo* [ %17, %16 ], [ %.lcssa, %.us-lcssa.us ], [ null, %18 ], [ null, %.loopexit.loopexit ], [ null, %.loopexit.loopexit24 ]
  ret %struct.TIFFFieldInfo* %.0
}

; Function Attrs: noinline nounwind uwtable
define %struct.TIFFFieldInfo* @_TIFFFieldWithTag(%struct.tiff* nocapture readonly, i32) local_unnamed_addr #0 {
  %3 = tail call %struct.TIFFFieldInfo* @_TIFFFindFieldInfo(%struct.tiff* %0, i32 %1, i32 0)
  %4 = icmp eq %struct.TIFFFieldInfo* %3, null
  br i1 %4, label %5, label %6

; <label>:5:                                      ; preds = %2
  tail call void (i8*, i8*, ...) @TIFFError(i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.4, i64 0, i64 0), i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.5, i64 0, i64 0), i32 %1) #6
  tail call void @__assert_fail(i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.7, i64 0, i64 0), i32 398, i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__PRETTY_FUNCTION__._TIFFFieldWithTag, i64 0, i64 0)) #7
  unreachable

; <label>:6:                                      ; preds = %2
  ret %struct.TIFFFieldInfo* %3
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

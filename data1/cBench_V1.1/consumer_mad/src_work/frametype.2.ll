; ModuleID = 'tmp1.ll'
source_filename = "frametype.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.id3_frametype = type { i8*, i32, i32*, i32, i8* }

$__llvm_profile_raw_version = comdat any

@fields_text = internal constant [2 x i32] [i32 0, i32 6], align 4
@.str = private unnamed_addr constant [31 x i8] c"Unknown text information frame\00", align 1
@id3_frametype_text = constant %struct.id3_frametype { i8* null, i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i32 0, i32 0) }, align 8
@fields_url = internal constant [1 x i32] [i32 1], align 4
@.str.1 = private unnamed_addr constant [23 x i8] c"Unknown URL link frame\00", align 1
@id3_frametype_url = constant %struct.id3_frametype { i8* null, i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0) }, align 8
@fields_unknown = internal constant [1 x i32] [i32 15], align 4
@.str.2 = private unnamed_addr constant [19 x i8] c"Experimental frame\00", align 1
@id3_frametype_experimental = constant %struct.id3_frametype { i8* null, i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_unknown, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.2, i32 0, i32 0) }, align 8
@.str.3 = private unnamed_addr constant [14 x i8] c"Unknown frame\00", align 1
@id3_frametype_unknown = constant %struct.id3_frametype { i8* null, i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_unknown, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.3, i32 0, i32 0) }, align 8
@.str.4 = private unnamed_addr constant [15 x i8] c"Obsolete frame\00", align 1
@id3_frametype_obsolete = constant %struct.id3_frametype { i8* null, i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_unknown, i32 0, i32 0), i32 24576, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0) }, align 8
@id3_frametype_lookup.wordlist = internal constant [84 x %struct.id3_frametype] [%struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.6, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.8, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @fields_COMM, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.10, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.12, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.14, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.16, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i32 6, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @fields_MLLT, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([27 x i8], [27 x i8]* @.str.18, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0), i32 9, i32* getelementptr inbounds ([9 x i32], [9 x i32]* @fields_COMR, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.20, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.22, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.24, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.26, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.28, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.29, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str.30, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.31, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_ETCO, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.32, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.34, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.35, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.36, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.38, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.40, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.41, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.42, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.43, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.44, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.45, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([49 x i8], [49 x i8]* @.str.46, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.47, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.48, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.49, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.50, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.51, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.52, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.53, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.54, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.55, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_MCDI, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.56, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_SYTC, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.58, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.60, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i32 6, i32* getelementptr inbounds ([6 x i32], [6 x i32]* @fields_SYLT, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.62, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.64, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.65, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.66, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.67, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_ENCR, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.68, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.69, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.70, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.71, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.72, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.73, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.74, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.75, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([22 x i8], [22 x i8]* @.str.76, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.77, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.78, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.79, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([41 x i8], [41 x i8]* @.str.80, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.81, i32 0, i32 0), i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @fields_USLT, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([40 x i8], [40 x i8]* @.str.82, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.83, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.84, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.85, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.86, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.87, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.88, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.89, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_POSS, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.90, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.91, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_PCNT, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.92, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.93, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_LINK, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([19 x i8], [19 x i8]* @.str.94, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.95, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.96, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.97, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.98, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.99, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.100, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.101, i32 0, i32 0), i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @fields_AENC, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.102, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.103, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_SIGN, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.104, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.105, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.106, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.107, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.108, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.109, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.110, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.111, i32 0, i32 0), i32 4, i32* getelementptr inbounds ([4 x i32], [4 x i32]* @fields_OWNE, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.112, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i32 0, i32 0), i32 5, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @fields_APIC, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.114, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.115, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.116, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.117, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.118, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.119, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.120, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.121, i32 0, i32 0), i32 5, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @fields_ASPI, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.122, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.124, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.125, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.126, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.127, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.128, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.129, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_USER, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.130, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.131, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.132, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.133, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_POPM, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.134, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.135, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_ZOBS, i32 0, i32 0), i32 24576, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.4, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.136, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_EQU2, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.137, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.138, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.139, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.140, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_SEEK, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.141, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.142, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.143, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.144, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_UFID, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.145, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.146, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_GRID, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([34 x i8], [34 x i8]* @.str.147, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.148, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.149, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.150, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_PRIV, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.151, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.152, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([47 x i8], [47 x i8]* @.str.153, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.154, i32 0, i32 0), i32 5, i32* getelementptr inbounds ([5 x i32], [5 x i32]* @fields_GEOB, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.155, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.156, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_RBUF, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.157, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.158, i32 0, i32 0), i32 10, i32* getelementptr inbounds ([10 x i32], [10 x i32]* @fields_RVRB, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.159, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.160, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_RVA2, i32 0, i32 0), i32 8192, i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.161, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.162, i32 0, i32 0), i32 2, i32* getelementptr inbounds ([2 x i32], [2 x i32]* @fields_text, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([10 x i8], [10 x i8]* @.str.163, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.164, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_TXXX, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([36 x i8], [36 x i8]* @.str.165, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.166, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.167, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.168, i32 0, i32 0), i32 1, i32* getelementptr inbounds ([1 x i32], [1 x i32]* @fields_url, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.169, i32 0, i32 0) }, %struct.id3_frametype { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.170, i32 0, i32 0), i32 3, i32* getelementptr inbounds ([3 x i32], [3 x i32]* @fields_WXXX, i32 0, i32 0), i32 0, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.171, i32 0, i32 0) }], align 16
@.str.5 = private unnamed_addr constant [5 x i8] c"TMOO\00", align 1
@.str.6 = private unnamed_addr constant [5 x i8] c"Mood\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"TCOM\00", align 1
@.str.8 = private unnamed_addr constant [9 x i8] c"Composer\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"COMM\00", align 1
@fields_COMM = internal constant [4 x i32] [i32 0, i32 7, i32 4, i32 5], align 16
@.str.10 = private unnamed_addr constant [9 x i8] c"Comments\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"TIT3\00", align 1
@.str.12 = private unnamed_addr constant [32 x i8] c"Subtitle/description refinement\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"TMCL\00", align 1
@.str.14 = private unnamed_addr constant [22 x i8] c"Musician credits list\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"TSOT\00", align 1
@.str.16 = private unnamed_addr constant [17 x i8] c"Title sort order\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"MLLT\00", align 1
@fields_MLLT = internal constant [6 x i32] [i32 11, i32 12, i32 12, i32 10, i32 10, i32 15], align 16
@.str.18 = private unnamed_addr constant [27 x i8] c"MPEG location lookup table\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"COMR\00", align 1
@fields_COMR = internal constant [9 x i32] [i32 0, i32 1, i32 9, i32 1, i32 10, i32 4, i32 4, i32 1, i32 15], align 16
@.str.20 = private unnamed_addr constant [17 x i8] c"Commercial frame\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"TSST\00", align 1
@.str.22 = private unnamed_addr constant [13 x i8] c"Set subtitle\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"TCON\00", align 1
@.str.24 = private unnamed_addr constant [13 x i8] c"Content type\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"TFLT\00", align 1
@.str.26 = private unnamed_addr constant [10 x i8] c"File type\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"TRSO\00", align 1
@.str.28 = private unnamed_addr constant [29 x i8] c"Internet radio station owner\00", align 1
@.str.29 = private unnamed_addr constant [5 x i8] c"TSRC\00", align 1
@.str.30 = private unnamed_addr constant [45 x i8] c"ISRC (international standard recording code)\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"ETCO\00", align 1
@fields_ETCO = internal constant [2 x i32] [i32 10, i32 15], align 4
@.str.32 = private unnamed_addr constant [19 x i8] c"Event timing codes\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"TIT2\00", align 1
@.str.34 = private unnamed_addr constant [35 x i8] c"Title/songname/content description\00", align 1
@.str.35 = private unnamed_addr constant [5 x i8] c"TOFN\00", align 1
@.str.36 = private unnamed_addr constant [18 x i8] c"Original filename\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"TIT1\00", align 1
@.str.38 = private unnamed_addr constant [26 x i8] c"Content group description\00", align 1
@.str.39 = private unnamed_addr constant [5 x i8] c"TOAL\00", align 1
@.str.40 = private unnamed_addr constant [32 x i8] c"Original album/movie/show title\00", align 1
@.str.41 = private unnamed_addr constant [5 x i8] c"TRSN\00", align 1
@.str.42 = private unnamed_addr constant [28 x i8] c"Internet radio station name\00", align 1
@.str.43 = private unnamed_addr constant [5 x i8] c"TSOA\00", align 1
@.str.44 = private unnamed_addr constant [17 x i8] c"Album sort order\00", align 1
@.str.45 = private unnamed_addr constant [5 x i8] c"TSSE\00", align 1
@.str.46 = private unnamed_addr constant [49 x i8] c"Software/hardware and settings used for encoding\00", align 1
@.str.47 = private unnamed_addr constant [5 x i8] c"WCOM\00", align 1
@.str.48 = private unnamed_addr constant [23 x i8] c"Commercial information\00", align 1
@.str.49 = private unnamed_addr constant [5 x i8] c"TENC\00", align 1
@.str.50 = private unnamed_addr constant [11 x i8] c"Encoded by\00", align 1
@.str.51 = private unnamed_addr constant [5 x i8] c"TOLY\00", align 1
@.str.52 = private unnamed_addr constant [36 x i8] c"Original lyricist(s)/text writer(s)\00", align 1
@.str.53 = private unnamed_addr constant [5 x i8] c"TLEN\00", align 1
@.str.54 = private unnamed_addr constant [7 x i8] c"Length\00", align 1
@.str.55 = private unnamed_addr constant [5 x i8] c"MCDI\00", align 1
@fields_MCDI = internal constant [1 x i32] [i32 15], align 4
@.str.56 = private unnamed_addr constant [20 x i8] c"Music CD identifier\00", align 1
@.str.57 = private unnamed_addr constant [5 x i8] c"SYTC\00", align 1
@fields_SYTC = internal constant [2 x i32] [i32 10, i32 15], align 4
@.str.58 = private unnamed_addr constant [25 x i8] c"Synchronised tempo codes\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"TCOP\00", align 1
@.str.60 = private unnamed_addr constant [18 x i8] c"Copyright message\00", align 1
@.str.61 = private unnamed_addr constant [5 x i8] c"SYLT\00", align 1
@fields_SYLT = internal constant [6 x i32] [i32 0, i32 7, i32 10, i32 10, i32 4, i32 15], align 16
@.str.62 = private unnamed_addr constant [24 x i8] c"Synchronised lyric/text\00", align 1
@.str.63 = private unnamed_addr constant [5 x i8] c"TLAN\00", align 1
@.str.64 = private unnamed_addr constant [12 x i8] c"Language(s)\00", align 1
@.str.65 = private unnamed_addr constant [5 x i8] c"TIPL\00", align 1
@.str.66 = private unnamed_addr constant [21 x i8] c"Involved people list\00", align 1
@.str.67 = private unnamed_addr constant [5 x i8] c"ENCR\00", align 1
@fields_ENCR = internal constant [3 x i32] [i32 1, i32 10, i32 15], align 4
@.str.68 = private unnamed_addr constant [31 x i8] c"Encryption method registration\00", align 1
@.str.69 = private unnamed_addr constant [5 x i8] c"TOWN\00", align 1
@.str.70 = private unnamed_addr constant [20 x i8] c"File owner/licensee\00", align 1
@.str.71 = private unnamed_addr constant [5 x i8] c"TPOS\00", align 1
@.str.72 = private unnamed_addr constant [14 x i8] c"Part of a set\00", align 1
@.str.73 = private unnamed_addr constant [5 x i8] c"TSOP\00", align 1
@.str.74 = private unnamed_addr constant [21 x i8] c"Performer sort order\00", align 1
@.str.75 = private unnamed_addr constant [5 x i8] c"TDOR\00", align 1
@.str.76 = private unnamed_addr constant [22 x i8] c"Original release time\00", align 1
@.str.77 = private unnamed_addr constant [5 x i8] c"TDRC\00", align 1
@.str.78 = private unnamed_addr constant [15 x i8] c"Recording time\00", align 1
@.str.79 = private unnamed_addr constant [5 x i8] c"WORS\00", align 1
@.str.80 = private unnamed_addr constant [41 x i8] c"Official Internet radio station homepage\00", align 1
@.str.81 = private unnamed_addr constant [5 x i8] c"USLT\00", align 1
@fields_USLT = internal constant [4 x i32] [i32 0, i32 7, i32 4, i32 5], align 16
@.str.82 = private unnamed_addr constant [40 x i8] c"Unsynchronised lyric/text transcription\00", align 1
@.str.83 = private unnamed_addr constant [5 x i8] c"TRCK\00", align 1
@.str.84 = private unnamed_addr constant [29 x i8] c"Track number/position in set\00", align 1
@.str.85 = private unnamed_addr constant [5 x i8] c"TPRO\00", align 1
@.str.86 = private unnamed_addr constant [16 x i8] c"Produced notice\00", align 1
@.str.87 = private unnamed_addr constant [5 x i8] c"TDRL\00", align 1
@.str.88 = private unnamed_addr constant [13 x i8] c"Release time\00", align 1
@.str.89 = private unnamed_addr constant [5 x i8] c"POSS\00", align 1
@fields_POSS = internal constant [2 x i32] [i32 10, i32 15], align 4
@.str.90 = private unnamed_addr constant [31 x i8] c"Position synchronisation frame\00", align 1
@.str.91 = private unnamed_addr constant [5 x i8] c"PCNT\00", align 1
@fields_PCNT = internal constant [1 x i32] [i32 14], align 4
@.str.92 = private unnamed_addr constant [13 x i8] c"Play counter\00", align 1
@.str.93 = private unnamed_addr constant [5 x i8] c"LINK\00", align 1
@fields_LINK = internal constant [3 x i32] [i32 8, i32 1, i32 3], align 4
@.str.94 = private unnamed_addr constant [19 x i8] c"Linked information\00", align 1
@.str.95 = private unnamed_addr constant [5 x i8] c"TMED\00", align 1
@.str.96 = private unnamed_addr constant [11 x i8] c"Media type\00", align 1
@.str.97 = private unnamed_addr constant [5 x i8] c"TEXT\00", align 1
@.str.98 = private unnamed_addr constant [21 x i8] c"Lyricist/text writer\00", align 1
@.str.99 = private unnamed_addr constant [5 x i8] c"TOPE\00", align 1
@.str.100 = private unnamed_addr constant [32 x i8] c"Original artist(s)/performer(s)\00", align 1
@.str.101 = private unnamed_addr constant [5 x i8] c"AENC\00", align 1
@fields_AENC = internal constant [4 x i32] [i32 1, i32 11, i32 11, i32 15], align 16
@.str.102 = private unnamed_addr constant [17 x i8] c"Audio encryption\00", align 1
@.str.103 = private unnamed_addr constant [5 x i8] c"SIGN\00", align 1
@fields_SIGN = internal constant [2 x i32] [i32 10, i32 15], align 4
@.str.104 = private unnamed_addr constant [16 x i8] c"Signature frame\00", align 1
@.str.105 = private unnamed_addr constant [5 x i8] c"TPE3\00", align 1
@.str.106 = private unnamed_addr constant [31 x i8] c"Conductor/performer refinement\00", align 1
@.str.107 = private unnamed_addr constant [5 x i8] c"WOAS\00", align 1
@.str.108 = private unnamed_addr constant [30 x i8] c"Official audio source webpage\00", align 1
@.str.109 = private unnamed_addr constant [5 x i8] c"TALB\00", align 1
@.str.110 = private unnamed_addr constant [23 x i8] c"Album/movie/show title\00", align 1
@.str.111 = private unnamed_addr constant [5 x i8] c"OWNE\00", align 1
@fields_OWNE = internal constant [4 x i32] [i32 0, i32 1, i32 9, i32 4], align 16
@.str.112 = private unnamed_addr constant [16 x i8] c"Ownership frame\00", align 1
@.str.113 = private unnamed_addr constant [5 x i8] c"APIC\00", align 1
@fields_APIC = internal constant [5 x i32] [i32 0, i32 1, i32 10, i32 4, i32 15], align 16
@.str.114 = private unnamed_addr constant [17 x i8] c"Attached picture\00", align 1
@.str.115 = private unnamed_addr constant [5 x i8] c"WOAR\00", align 1
@.str.116 = private unnamed_addr constant [34 x i8] c"Official artist/performer webpage\00", align 1
@.str.117 = private unnamed_addr constant [5 x i8] c"WOAF\00", align 1
@.str.118 = private unnamed_addr constant [28 x i8] c"Official audio file webpage\00", align 1
@.str.119 = private unnamed_addr constant [5 x i8] c"TDEN\00", align 1
@.str.120 = private unnamed_addr constant [14 x i8] c"Encoding time\00", align 1
@.str.121 = private unnamed_addr constant [5 x i8] c"ASPI\00", align 1
@fields_ASPI = internal constant [5 x i32] [i32 13, i32 13, i32 11, i32 10, i32 15], align 16
@.str.122 = private unnamed_addr constant [23 x i8] c"Audio seek point index\00", align 1
@.str.123 = private unnamed_addr constant [5 x i8] c"WCOP\00", align 1
@.str.124 = private unnamed_addr constant [28 x i8] c"Copyright/legal information\00", align 1
@.str.125 = private unnamed_addr constant [5 x i8] c"TDLY\00", align 1
@.str.126 = private unnamed_addr constant [15 x i8] c"Playlist delay\00", align 1
@.str.127 = private unnamed_addr constant [5 x i8] c"TBPM\00", align 1
@.str.128 = private unnamed_addr constant [23 x i8] c"BPM (beats per minute)\00", align 1
@.str.129 = private unnamed_addr constant [5 x i8] c"USER\00", align 1
@fields_USER = internal constant [3 x i32] [i32 0, i32 7, i32 4], align 4
@.str.130 = private unnamed_addr constant [13 x i8] c"Terms of use\00", align 1
@.str.131 = private unnamed_addr constant [5 x i8] c"TDTG\00", align 1
@.str.132 = private unnamed_addr constant [13 x i8] c"Tagging time\00", align 1
@.str.133 = private unnamed_addr constant [5 x i8] c"POPM\00", align 1
@fields_POPM = internal constant [3 x i32] [i32 1, i32 10, i32 14], align 4
@.str.134 = private unnamed_addr constant [14 x i8] c"Popularimeter\00", align 1
@.str.135 = private unnamed_addr constant [5 x i8] c"ZOBS\00", align 1
@fields_ZOBS = internal constant [2 x i32] [i32 8, i32 15], align 4
@.str.136 = private unnamed_addr constant [5 x i8] c"EQU2\00", align 1
@fields_EQU2 = internal constant [3 x i32] [i32 10, i32 1, i32 15], align 4
@.str.137 = private unnamed_addr constant [17 x i8] c"Equalisation (2)\00", align 1
@.str.138 = private unnamed_addr constant [5 x i8] c"TPE2\00", align 1
@.str.139 = private unnamed_addr constant [29 x i8] c"Band/orchestra/accompaniment\00", align 1
@.str.140 = private unnamed_addr constant [5 x i8] c"SEEK\00", align 1
@fields_SEEK = internal constant [1 x i32] [i32 13], align 4
@.str.141 = private unnamed_addr constant [11 x i8] c"Seek frame\00", align 1
@.str.142 = private unnamed_addr constant [5 x i8] c"TPE1\00", align 1
@.str.143 = private unnamed_addr constant [29 x i8] c"Lead performer(s)/soloist(s)\00", align 1
@.str.144 = private unnamed_addr constant [5 x i8] c"UFID\00", align 1
@fields_UFID = internal constant [2 x i32] [i32 1, i32 15], align 4
@.str.145 = private unnamed_addr constant [23 x i8] c"Unique file identifier\00", align 1
@.str.146 = private unnamed_addr constant [5 x i8] c"GRID\00", align 1
@fields_GRID = internal constant [3 x i32] [i32 1, i32 10, i32 15], align 4
@.str.147 = private unnamed_addr constant [34 x i8] c"Group identification registration\00", align 1
@.str.148 = private unnamed_addr constant [5 x i8] c"TKEY\00", align 1
@.str.149 = private unnamed_addr constant [12 x i8] c"Initial key\00", align 1
@.str.150 = private unnamed_addr constant [5 x i8] c"PRIV\00", align 1
@fields_PRIV = internal constant [2 x i32] [i32 1, i32 15], align 4
@.str.151 = private unnamed_addr constant [14 x i8] c"Private frame\00", align 1
@.str.152 = private unnamed_addr constant [5 x i8] c"TPE4\00", align 1
@.str.153 = private unnamed_addr constant [47 x i8] c"Interpreted, remixed, or otherwise modified by\00", align 1
@.str.154 = private unnamed_addr constant [5 x i8] c"GEOB\00", align 1
@fields_GEOB = internal constant [5 x i32] [i32 0, i32 1, i32 4, i32 4, i32 15], align 16
@.str.155 = private unnamed_addr constant [28 x i8] c"General encapsulated object\00", align 1
@.str.156 = private unnamed_addr constant [5 x i8] c"RBUF\00", align 1
@fields_RBUF = internal constant [3 x i32] [i32 12, i32 10, i32 13], align 4
@.str.157 = private unnamed_addr constant [24 x i8] c"Recommended buffer size\00", align 1
@.str.158 = private unnamed_addr constant [5 x i8] c"RVRB\00", align 1
@fields_RVRB = internal constant [10 x i32] [i32 11, i32 11, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10, i32 10], align 16
@.str.159 = private unnamed_addr constant [7 x i8] c"Reverb\00", align 1
@.str.160 = private unnamed_addr constant [5 x i8] c"RVA2\00", align 1
@fields_RVA2 = internal constant [2 x i32] [i32 1, i32 15], align 4
@.str.161 = private unnamed_addr constant [31 x i8] c"Relative volume adjustment (2)\00", align 1
@.str.162 = private unnamed_addr constant [5 x i8] c"TPUB\00", align 1
@.str.163 = private unnamed_addr constant [10 x i8] c"Publisher\00", align 1
@.str.164 = private unnamed_addr constant [5 x i8] c"TXXX\00", align 1
@fields_TXXX = internal constant [3 x i32] [i32 0, i32 4, i32 4], align 4
@.str.165 = private unnamed_addr constant [36 x i8] c"User defined text information frame\00", align 1
@.str.166 = private unnamed_addr constant [5 x i8] c"WPAY\00", align 1
@.str.167 = private unnamed_addr constant [8 x i8] c"Payment\00", align 1
@.str.168 = private unnamed_addr constant [5 x i8] c"WPUB\00", align 1
@.str.169 = private unnamed_addr constant [28 x i8] c"Publishers official webpage\00", align 1
@.str.170 = private unnamed_addr constant [5 x i8] c"WXXX\00", align 1
@fields_WXXX = internal constant [3 x i32] [i32 0, i32 4, i32 1], align 4
@.str.171 = private unnamed_addr constant [28 x i8] c"User defined URL link frame\00", align 1
@id3_frametype_lookup.lookup = internal constant [112 x i16] [i16 0, i16 -92, i16 3, i16 -1, i16 4, i16 5, i16 6, i16 -83, i16 -2, i16 7, i16 8, i16 9, i16 10, i16 11, i16 12, i16 -1, i16 13, i16 -1, i16 14, i16 15, i16 16, i16 -1, i16 17, i16 18, i16 19, i16 -183, i16 22, i16 23, i16 24, i16 25, i16 26, i16 27, i16 -179, i16 30, i16 -177, i16 -175, i16 35, i16 -173, i16 -168, i16 41, i16 42, i16 43, i16 44, i16 45, i16 46, i16 -166, i16 49, i16 50, i16 -164, i16 53, i16 54, i16 55, i16 56, i16 57, i16 58, i16 -162, i16 61, i16 62, i16 -1, i16 63, i16 64, i16 65, i16 66, i16 67, i16 68, i16 69, i16 70, i16 71, i16 72, i16 73, i16 74, i16 -1, i16 -159, i16 77, i16 -9, i16 -2, i16 78, i16 -25, i16 -2, i16 -33, i16 -2, i16 -37, i16 -2, i16 -45, i16 -2, i16 79, i16 -1, i16 80, i16 -48, i16 -3, i16 -51, i16 -2, i16 -53, i16 -2, i16 -56, i16 -2, i16 -1, i16 81, i16 -64, i16 -2, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 -1, i16 82, i16 -1, i16 83], align 16
@hash.asso_values = internal constant [256 x i8] c"ppppppppppppppppppppppppppppppppppppppppppppppppp\14\12\02\19pppppppppppp\13\1A\01\1C\0F\09\1Fp\00p\1D\03\00\0A\00\1E\00\08\05\00\1D\1F\18\1D\18\1Eppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_frametype_lookup = private constant [20 x i8] c"id3_frametype_lookup"
@__profn_tmp1.ll_hash = private constant [12 x i8] c"tmp1.ll:hash"
@__profc_id3_frametype_lookup = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_frametype_lookup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4068755904453357469, i64 149361229759, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i32 0, i32 0), i8* bitcast (%struct.id3_frametype* (i8*, i32)* @id3_frametype_lookup to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_hash = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_hash = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3636272088648199180, i64 53844221199, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [35 x i8] c"!\00id3_frametype_lookup\01tmp1.ll:hash", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_frametype_lookup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_hash to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.id3_frametype* @id3_frametype_lookup(i8*, i32) #0 {
  %3 = alloca %struct.id3_frametype*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.id3_frametype*, align 8
  %11 = alloca %struct.id3_frametype*, align 8
  %12 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %13 = load i32, i32* %5, align 4
  %14 = icmp ule i32 %13, 4
  br i1 %14, label %15, label %132

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 1)
  %17 = load i32, i32* %5, align 4
  %18 = icmp uge i32 %17, 4
  br i1 %18, label %19, label %132

; <label>:19:                                     ; preds = %15
  %20 = load i8*, i8** %4, align 8
  %21 = load i32, i32* %5, align 4
  %22 = call i32 @hash(i8* %20, i32 %21)
  store i32 %22, i32* %6, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp sle i32 %23, 111
  br i1 %24, label %25, label %130

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 5)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 5)
  %27 = load i32, i32* %6, align 4
  %28 = icmp sge i32 %27, 0
  br i1 %28, label %29, label %130

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [112 x i16], [112 x i16]* @id3_frametype_lookup.lookup, i64 0, i64 %31
  %33 = load i16, i16* %32, align 2
  %34 = sext i16 %33 to i32
  store i32 %34, i32* %7, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %68

; <label>:37:                                     ; preds = %29
  %38 = load i32, i32* %7, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [84 x %struct.id3_frametype], [84 x %struct.id3_frametype]* @id3_frametype_lookup.wordlist, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %40, i32 0, i32 0
  %42 = load i8*, i8** %41, align 8
  store i8* %42, i8** %8, align 8
  %43 = load i8*, i8** %4, align 8
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = load i8*, i8** %8, align 8
  %47 = load i8, i8* %46, align 1
  %48 = sext i8 %47 to i32
  %49 = icmp eq i32 %45, %48
  br i1 %49, label %50, label %66

; <label>:50:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 8)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 8)
  %52 = load i8*, i8** %4, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 1
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 1
  %56 = load i32, i32* %5, align 4
  %57 = sub i32 %56, 1
  %58 = zext i32 %57 to i64
  %59 = call i32 @strncmp(i8* %53, i8* %55, i64 %58) #3
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %66, label %61

; <label>:61:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 10)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 10)
  %63 = load i32, i32* %7, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [84 x %struct.id3_frametype], [84 x %struct.id3_frametype]* @id3_frametype_lookup.wordlist, i64 0, i64 %64
  store %struct.id3_frametype* %65, %struct.id3_frametype** %3, align 8
  br label %134

; <label>:66:                                     ; preds = %50, %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 7)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 7)
  br label %129

; <label>:68:                                     ; preds = %29
  %69 = load i32, i32* %7, align 4
  %70 = icmp slt i32 %69, -84
  br i1 %70, label %71, label %127

; <label>:71:                                     ; preds = %68
  %72 = load i32, i32* %7, align 4
  %73 = sub nsw i32 -85, %72
  store i32 %73, i32* %9, align 4
  %74 = load i32, i32* %9, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [112 x i16], [112 x i16]* @id3_frametype_lookup.lookup, i64 0, i64 %75
  %77 = load i16, i16* %76, align 2
  %78 = sext i16 %77 to i32
  %79 = add nsw i32 84, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [84 x %struct.id3_frametype], [84 x %struct.id3_frametype]* @id3_frametype_lookup.wordlist, i64 0, i64 %80
  store %struct.id3_frametype* %81, %struct.id3_frametype** %10, align 8
  %82 = load %struct.id3_frametype*, %struct.id3_frametype** %10, align 8
  %83 = load i32, i32* %9, align 4
  %84 = add nsw i32 %83, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [112 x i16], [112 x i16]* @id3_frametype_lookup.lookup, i64 0, i64 %85
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = sub nsw i32 0, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %82, i64 %90
  store %struct.id3_frametype* %91, %struct.id3_frametype** %11, align 8
  br label %92

; <label>:92:                                     ; preds = %121, %71
  %93 = load %struct.id3_frametype*, %struct.id3_frametype** %10, align 8
  %94 = load %struct.id3_frametype*, %struct.id3_frametype** %11, align 8
  %95 = icmp ult %struct.id3_frametype* %93, %94
  br i1 %95, label %96, label %125

; <label>:96:                                     ; preds = %92
  %97 = load %struct.id3_frametype*, %struct.id3_frametype** %10, align 8
  %98 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %97, i32 0, i32 0
  %99 = load i8*, i8** %98, align 8
  store i8* %99, i8** %12, align 8
  %100 = load i8*, i8** %4, align 8
  %101 = load i8, i8* %100, align 1
  %102 = sext i8 %101 to i32
  %103 = load i8*, i8** %12, align 8
  %104 = load i8, i8* %103, align 1
  %105 = sext i8 %104 to i32
  %106 = icmp eq i32 %102, %105
  br i1 %106, label %107, label %121

; <label>:107:                                    ; preds = %96
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 4)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 4)
  %109 = load i8*, i8** %4, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 1
  %111 = load i8*, i8** %12, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 1
  %113 = load i32, i32* %5, align 4
  %114 = sub i32 %113, 1
  %115 = zext i32 %114 to i64
  %116 = call i32 @strncmp(i8* %110, i8* %112, i64 %115) #3
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %121, label %118

; <label>:118:                                    ; preds = %107
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 11)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 11)
  %120 = load %struct.id3_frametype*, %struct.id3_frametype** %10, align 8
  store %struct.id3_frametype* %120, %struct.id3_frametype** %3, align 8
  br label %134

; <label>:121:                                    ; preds = %107, %96
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 2)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 2)
  %123 = load %struct.id3_frametype*, %struct.id3_frametype** %10, align 8
  %124 = getelementptr inbounds %struct.id3_frametype, %struct.id3_frametype* %123, i32 1
  store %struct.id3_frametype* %124, %struct.id3_frametype** %10, align 8
  br label %92

; <label>:125:                                    ; preds = %92
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 9)
  %126 = add i64 %pgocount8, 1
  store i64 %126, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 9)
  br label %127

; <label>:127:                                    ; preds = %125, %68
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 6)
  %128 = add i64 %pgocount9, 1
  store i64 %128, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 6)
  br label %129

; <label>:129:                                    ; preds = %127, %66
  br label %130

; <label>:130:                                    ; preds = %129, %25, %19
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 3)
  %131 = add i64 %pgocount10, 1
  store i64 %131, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 3)
  br label %132

; <label>:132:                                    ; preds = %130, %15, %2
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 0)
  %133 = add i64 %pgocount11, 1
  store i64 %133, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_frametype_lookup, i64 0, i64 0)
  store %struct.id3_frametype* null, %struct.id3_frametype** %3, align 8
  br label %134

; <label>:134:                                    ; preds = %132, %118, %61
  %135 = load %struct.id3_frametype*, %struct.id3_frametype** %3, align 8
  ret %struct.id3_frametype* %135
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @hash(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i32 0, i32* %5, align 4
  %6 = load i32, i32* %4, align 4
  switch i32 %6, label %7 [
    i32 4, label %9
    i32 3, label %20
    i32 2, label %31
    i32 1, label %42
  ]

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 4)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 4)
  br label %9

; <label>:9:                                      ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 3)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 3)
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 3
  %13 = load i8, i8* %12, align 1
  %14 = zext i8 %13 to i64
  %15 = getelementptr inbounds [256 x i8], [256 x i8]* @hash.asso_values, i64 0, i64 %14
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i32
  %18 = load i32, i32* %5, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %5, align 4
  br label %20

; <label>:20:                                     ; preds = %9, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 2)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 2)
  %22 = load i8*, i8** %3, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 2
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* @hash.asso_values, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i32, i32* %5, align 4
  %30 = add nsw i32 %29, %28
  store i32 %30, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %20, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 1)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 1)
  %33 = load i8*, i8** %3, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds [256 x i8], [256 x i8]* @hash.asso_values, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = load i32, i32* %5, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %5, align 4
  br label %42

; <label>:42:                                     ; preds = %31, %2
  %43 = load i8*, i8** %3, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i64
  %47 = getelementptr inbounds [256 x i8], [256 x i8]* @hash.asso_values, i64 0, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  %50 = load i32, i32* %5, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, i32* %5, align 4
  br label %52

; <label>:52:                                     ; preds = %42
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 0)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i64 0, i64 0)
  %54 = load i32, i32* %5, align 4
  ret i32 %54
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

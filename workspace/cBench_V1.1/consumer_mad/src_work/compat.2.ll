; ModuleID = 'tmp1.ll'
source_filename = "compat.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.id3_compat = type { i8*, i8*, i32 (%struct.id3_frame*, i8*, i8*, i64)* }
%struct.id3_frame = type { [5 x i8], i8*, i32, i32, i32, i32, i8*, i64, i64, i32, %union.id3_field* }
%union.id3_field = type { %struct.anon.5 }
%struct.anon.5 = type { i32, i8*, i64 }
%struct.id3_tag = type { i32, i32, i32, i32, i32, i32, i32, %struct.id3_frame**, i64 }

$__llvm_profile_raw_version = comdat any

@id3_compat_lookup.wordlist = internal constant [73 x %struct.id3_compat] [%struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.1, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.5, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.7, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.9, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.11, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.15, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.17, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.19, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.21, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.23, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* @translate_TCON }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.27, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.29, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.31, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.32, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.33, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.34, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.35, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.25, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* @translate_TCON }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.37, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.38, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.39, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.40, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.42, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.44, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.45, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.46, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.48, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.50, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.52, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.54, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.13, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.57, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.59, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.63, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.65, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.67, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.68, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.69, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.71, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.73, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.75, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.77, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.78, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.79, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.80, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.81, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.83, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.84, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.85, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.87, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.89, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.90, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.92, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.93, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.94, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.96, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.97, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.98, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.99, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.100, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.101, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.102, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.103, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.61, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.105, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.106, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.107, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.108, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.109, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.110, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.111, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.112, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.114, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.115, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.116, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.117, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.118, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.119, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.120, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.121, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.122, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.124, i32 0, i32 0), i8* null, i32 (%struct.id3_frame*, i8*, i8*, i64)* null }, %struct.id3_compat { i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.125, i32 0, i32 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.126, i32 0, i32 0), i32 (%struct.id3_frame*, i8*, i8*, i64)* null }], align 16
@.str = private unnamed_addr constant [4 x i8] c"POP\00", align 1
@.str.1 = private unnamed_addr constant [5 x i8] c"POPM\00", align 1
@.str.2 = private unnamed_addr constant [4 x i8] c"WCP\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"WCOP\00", align 1
@.str.4 = private unnamed_addr constant [4 x i8] c"WPB\00", align 1
@.str.5 = private unnamed_addr constant [5 x i8] c"WPUB\00", align 1
@.str.6 = private unnamed_addr constant [4 x i8] c"BUF\00", align 1
@.str.7 = private unnamed_addr constant [5 x i8] c"RBUF\00", align 1
@.str.8 = private unnamed_addr constant [4 x i8] c"PIC\00", align 1
@.str.9 = private unnamed_addr constant [5 x i8] c"APIC\00", align 1
@.str.10 = private unnamed_addr constant [4 x i8] c"COM\00", align 1
@.str.11 = private unnamed_addr constant [5 x i8] c"COMM\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"IPL\00", align 1
@.str.13 = private unnamed_addr constant [5 x i8] c"TIPL\00", align 1
@.str.14 = private unnamed_addr constant [4 x i8] c"MLL\00", align 1
@.str.15 = private unnamed_addr constant [5 x i8] c"MLLT\00", align 1
@.str.16 = private unnamed_addr constant [4 x i8] c"WAF\00", align 1
@.str.17 = private unnamed_addr constant [5 x i8] c"WOAF\00", align 1
@.str.18 = private unnamed_addr constant [4 x i8] c"WCM\00", align 1
@.str.19 = private unnamed_addr constant [5 x i8] c"WCOM\00", align 1
@.str.20 = private unnamed_addr constant [4 x i8] c"UFI\00", align 1
@.str.21 = private unnamed_addr constant [5 x i8] c"UFID\00", align 1
@.str.22 = private unnamed_addr constant [4 x i8] c"CRA\00", align 1
@.str.23 = private unnamed_addr constant [5 x i8] c"AENC\00", align 1
@.str.24 = private unnamed_addr constant [4 x i8] c"TCO\00", align 1
@.str.25 = private unnamed_addr constant [5 x i8] c"TCON\00", align 1
@.str.26 = private unnamed_addr constant [4 x i8] c"ULT\00", align 1
@.str.27 = private unnamed_addr constant [5 x i8] c"USLT\00", align 1
@.str.28 = private unnamed_addr constant [4 x i8] c"TOL\00", align 1
@.str.29 = private unnamed_addr constant [5 x i8] c"TOLY\00", align 1
@.str.30 = private unnamed_addr constant [4 x i8] c"TBP\00", align 1
@.str.31 = private unnamed_addr constant [5 x i8] c"TBPM\00", align 1
@.str.32 = private unnamed_addr constant [4 x i8] c"TPB\00", align 1
@.str.33 = private unnamed_addr constant [5 x i8] c"TPUB\00", align 1
@.str.34 = private unnamed_addr constant [4 x i8] c"CNT\00", align 1
@.str.35 = private unnamed_addr constant [5 x i8] c"PCNT\00", align 1
@.str.36 = private unnamed_addr constant [4 x i8] c"WAR\00", align 1
@.str.37 = private unnamed_addr constant [5 x i8] c"WOAR\00", align 1
@.str.38 = private unnamed_addr constant [4 x i8] c"LNK\00", align 1
@.str.39 = private unnamed_addr constant [5 x i8] c"LINK\00", align 1
@.str.40 = private unnamed_addr constant [4 x i8] c"CRM\00", align 1
@.str.41 = private unnamed_addr constant [4 x i8] c"TOF\00", align 1
@.str.42 = private unnamed_addr constant [5 x i8] c"TOFN\00", align 1
@.str.43 = private unnamed_addr constant [4 x i8] c"MCI\00", align 1
@.str.44 = private unnamed_addr constant [5 x i8] c"MCDI\00", align 1
@.str.45 = private unnamed_addr constant [4 x i8] c"TPA\00", align 1
@.str.46 = private unnamed_addr constant [5 x i8] c"TPOS\00", align 1
@.str.47 = private unnamed_addr constant [4 x i8] c"WAS\00", align 1
@.str.48 = private unnamed_addr constant [5 x i8] c"WOAS\00", align 1
@.str.49 = private unnamed_addr constant [4 x i8] c"TOA\00", align 1
@.str.50 = private unnamed_addr constant [5 x i8] c"TOPE\00", align 1
@.str.51 = private unnamed_addr constant [4 x i8] c"TAL\00", align 1
@.str.52 = private unnamed_addr constant [5 x i8] c"TALB\00", align 1
@.str.53 = private unnamed_addr constant [4 x i8] c"TLA\00", align 1
@.str.54 = private unnamed_addr constant [5 x i8] c"TLAN\00", align 1
@.str.55 = private unnamed_addr constant [5 x i8] c"IPLS\00", align 1
@.str.56 = private unnamed_addr constant [4 x i8] c"TCR\00", align 1
@.str.57 = private unnamed_addr constant [5 x i8] c"TCOP\00", align 1
@.str.58 = private unnamed_addr constant [4 x i8] c"TRC\00", align 1
@.str.59 = private unnamed_addr constant [5 x i8] c"TSRC\00", align 1
@.str.60 = private unnamed_addr constant [4 x i8] c"TOR\00", align 1
@.str.61 = private unnamed_addr constant [5 x i8] c"TDOR\00", align 1
@.str.62 = private unnamed_addr constant [4 x i8] c"TCM\00", align 1
@.str.63 = private unnamed_addr constant [5 x i8] c"TCOM\00", align 1
@.str.64 = private unnamed_addr constant [4 x i8] c"ETC\00", align 1
@.str.65 = private unnamed_addr constant [5 x i8] c"ETCO\00", align 1
@.str.66 = private unnamed_addr constant [4 x i8] c"STC\00", align 1
@.str.67 = private unnamed_addr constant [5 x i8] c"SYTC\00", align 1
@.str.68 = private unnamed_addr constant [4 x i8] c"TLE\00", align 1
@.str.69 = private unnamed_addr constant [5 x i8] c"TLEN\00", align 1
@.str.70 = private unnamed_addr constant [4 x i8] c"SLT\00", align 1
@.str.71 = private unnamed_addr constant [5 x i8] c"SYLT\00", align 1
@.str.72 = private unnamed_addr constant [4 x i8] c"TEN\00", align 1
@.str.73 = private unnamed_addr constant [5 x i8] c"TENC\00", align 1
@.str.74 = private unnamed_addr constant [4 x i8] c"TP2\00", align 1
@.str.75 = private unnamed_addr constant [5 x i8] c"TPE2\00", align 1
@.str.76 = private unnamed_addr constant [4 x i8] c"TP1\00", align 1
@.str.77 = private unnamed_addr constant [5 x i8] c"TPE1\00", align 1
@.str.78 = private unnamed_addr constant [4 x i8] c"TOT\00", align 1
@.str.79 = private unnamed_addr constant [5 x i8] c"TOAL\00", align 1
@.str.80 = private unnamed_addr constant [4 x i8] c"EQU\00", align 1
@.str.81 = private unnamed_addr constant [4 x i8] c"RVA\00", align 1
@.str.82 = private unnamed_addr constant [4 x i8] c"GEO\00", align 1
@.str.83 = private unnamed_addr constant [5 x i8] c"GEOB\00", align 1
@.str.84 = private unnamed_addr constant [4 x i8] c"TP4\00", align 1
@.str.85 = private unnamed_addr constant [5 x i8] c"TPE4\00", align 1
@.str.86 = private unnamed_addr constant [4 x i8] c"TP3\00", align 1
@.str.87 = private unnamed_addr constant [5 x i8] c"TPE3\00", align 1
@.str.88 = private unnamed_addr constant [4 x i8] c"TFT\00", align 1
@.str.89 = private unnamed_addr constant [5 x i8] c"TFLT\00", align 1
@.str.90 = private unnamed_addr constant [4 x i8] c"TIM\00", align 1
@.str.91 = private unnamed_addr constant [4 x i8] c"REV\00", align 1
@.str.92 = private unnamed_addr constant [5 x i8] c"RVRB\00", align 1
@.str.93 = private unnamed_addr constant [4 x i8] c"TSI\00", align 1
@.str.94 = private unnamed_addr constant [5 x i8] c"EQUA\00", align 1
@.str.95 = private unnamed_addr constant [4 x i8] c"TSS\00", align 1
@.str.96 = private unnamed_addr constant [5 x i8] c"TSSE\00", align 1
@.str.97 = private unnamed_addr constant [4 x i8] c"TRK\00", align 1
@.str.98 = private unnamed_addr constant [5 x i8] c"TRCK\00", align 1
@.str.99 = private unnamed_addr constant [4 x i8] c"TDA\00", align 1
@.str.100 = private unnamed_addr constant [4 x i8] c"TMT\00", align 1
@.str.101 = private unnamed_addr constant [5 x i8] c"TMED\00", align 1
@.str.102 = private unnamed_addr constant [4 x i8] c"TKE\00", align 1
@.str.103 = private unnamed_addr constant [5 x i8] c"TKEY\00", align 1
@.str.104 = private unnamed_addr constant [5 x i8] c"TORY\00", align 1
@.str.105 = private unnamed_addr constant [4 x i8] c"TRD\00", align 1
@.str.106 = private unnamed_addr constant [4 x i8] c"TYE\00", align 1
@.str.107 = private unnamed_addr constant [4 x i8] c"TT2\00", align 1
@.str.108 = private unnamed_addr constant [5 x i8] c"TIT2\00", align 1
@.str.109 = private unnamed_addr constant [4 x i8] c"TT1\00", align 1
@.str.110 = private unnamed_addr constant [5 x i8] c"TIT1\00", align 1
@.str.111 = private unnamed_addr constant [4 x i8] c"WXX\00", align 1
@.str.112 = private unnamed_addr constant [5 x i8] c"WXXX\00", align 1
@.str.113 = private unnamed_addr constant [5 x i8] c"TIME\00", align 1
@.str.114 = private unnamed_addr constant [5 x i8] c"TSIZ\00", align 1
@.str.115 = private unnamed_addr constant [4 x i8] c"TT3\00", align 1
@.str.116 = private unnamed_addr constant [5 x i8] c"TIT3\00", align 1
@.str.117 = private unnamed_addr constant [5 x i8] c"TRDA\00", align 1
@.str.118 = private unnamed_addr constant [5 x i8] c"RVAD\00", align 1
@.str.119 = private unnamed_addr constant [4 x i8] c"TDY\00", align 1
@.str.120 = private unnamed_addr constant [5 x i8] c"TDLY\00", align 1
@.str.121 = private unnamed_addr constant [4 x i8] c"TXT\00", align 1
@.str.122 = private unnamed_addr constant [5 x i8] c"TEXT\00", align 1
@.str.123 = private unnamed_addr constant [5 x i8] c"TYER\00", align 1
@.str.124 = private unnamed_addr constant [5 x i8] c"TDAT\00", align 1
@.str.125 = private unnamed_addr constant [4 x i8] c"TXX\00", align 1
@.str.126 = private unnamed_addr constant [5 x i8] c"TXXX\00", align 1
@id3_compat_lookup.lookup = internal constant [91 x i16] [i16 -1, i16 0, i16 -1, i16 -53, i16 -2, i16 1, i16 -49, i16 -2, i16 2, i16 3, i16 -1, i16 -46, i16 -2, i16 -43, i16 -2, i16 4, i16 5, i16 6, i16 -1, i16 7, i16 -163, i16 10, i16 11, i16 12, i16 13, i16 -161, i16 17, i16 -159, i16 -77, i16 22, i16 23, i16 -80, i16 26, i16 -85, i16 29, i16 -87, i16 32, i16 33, i16 34, i16 35, i16 36, i16 37, i16 38, i16 39, i16 40, i16 41, i16 -155, i16 44, i16 45, i16 46, i16 47, i16 -1, i16 48, i16 49, i16 50, i16 51, i16 52, i16 53, i16 54, i16 55, i16 56, i16 57, i16 58, i16 59, i16 -1, i16 60, i16 61, i16 62, i16 63, i16 64, i16 -1, i16 -151, i16 -1, i16 67, i16 68, i16 69, i16 70, i16 -8, i16 -2, i16 -1, i16 71, i16 -31, i16 -2, i16 -1, i16 72, i16 -55, i16 -2, i16 -59, i16 -3, i16 -65, i16 -2], align 16
@.str.127 = private unnamed_addr constant [5 x i8] c"ZOBS\00", align 1
@.str.128 = private unnamed_addr constant [3 x i8] c"id\00", align 1
@.str.129 = private unnamed_addr constant [9 x i8] c"compat.c\00", align 1
@__PRETTY_FUNCTION__.id3_compat_fixup = private unnamed_addr constant [39 x i8] c"int id3_compat_fixup(struct id3_tag *)\00", align 1
@.str.130 = private unnamed_addr constant [5 x i8] c"YTYE\00", align 1
@.str.131 = private unnamed_addr constant [5 x i8] c"YTDA\00", align 1
@.str.132 = private unnamed_addr constant [5 x i8] c"YTIM\00", align 1
@.str.133 = private unnamed_addr constant [5 x i8] c"data\00", align 1
@.str.134 = private unnamed_addr constant [5 x i8] c"TDRC\00", align 1
@hash.asso_values = internal constant [256 x i8] c"UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU\16\15\1B\1AUUUUUUUUUUUU\09\03\00\1B\10\06\1EU\0FU\16\02\0F\04\01\00\1E\0D\11\16\00\18\05\1F\19\0FUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU", align 16
@.str.135 = private unnamed_addr constant [20 x i8] c"frame->nfields == 2\00", align 1
@__PRETTY_FUNCTION__.translate_TCON = private unnamed_addr constant [87 x i8] c"int translate_TCON(struct id3_frame *, const char *, const id3_byte_t *, id3_length_t)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_compat_lookup = private constant [17 x i8] c"id3_compat_lookup"
@__profn_tmp1.ll_translate_TCON = private constant [22 x i8] c"tmp1.ll:translate_TCON"
@__profn_tmp1.ll_hash = private constant [12 x i8] c"tmp1.ll:hash"
@__profn_id3_compat_fixup = private constant [16 x i8] c"id3_compat_fixup"
@__profc_id3_compat_lookup = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_compat_lookup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4479477742572210615, i64 149361229759, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i32 0, i32 0), i8* bitcast (%struct.id3_compat* (i8*, i32)* @id3_compat_lookup to i8*), i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_translate_TCON = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_translate_TCON = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1299742372119495406, i64 194586920695, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i32 0, i32 0), i8* bitcast (i32 (%struct.id3_frame*, i8*, i8*, i64)* @translate_TCON to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_hash = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_hash = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3636272088648199180, i64 53844221199, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_hash, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_compat_fixup = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_compat_fixup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3796460487558587150, i64 276820412878, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i32 0, i32 0), i8* bitcast (i32 (%struct.id3_tag*)* @id3_compat_fixup to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [72 x i8] c"F\00id3_compat_lookup\01tmp1.ll:translate_TCON\01tmp1.ll:hash\01id3_compat_fixup", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_compat_lookup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_translate_TCON to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_hash to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_compat_fixup to i8*), i8* getelementptr inbounds ([72 x i8], [72 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.id3_compat* @id3_compat_lookup(i8*, i32) #0 {
  %3 = alloca %struct.id3_compat*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.id3_compat*, align 8
  %11 = alloca %struct.id3_compat*, align 8
  %12 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %13 = load i32, i32* %5, align 4
  %14 = icmp ule i32 %13, 4
  br i1 %14, label %15, label %132

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 1)
  %17 = load i32, i32* %5, align 4
  %18 = icmp uge i32 %17, 3
  br i1 %18, label %19, label %132

; <label>:19:                                     ; preds = %15
  %20 = load i8*, i8** %4, align 8
  %21 = load i32, i32* %5, align 4
  %22 = call i32 @hash(i8* %20, i32 %21)
  store i32 %22, i32* %6, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp sle i32 %23, 84
  br i1 %24, label %25, label %130

; <label>:25:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 5)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 5)
  %27 = load i32, i32* %6, align 4
  %28 = icmp sge i32 %27, 0
  br i1 %28, label %29, label %130

; <label>:29:                                     ; preds = %25
  %30 = load i32, i32* %6, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [91 x i16], [91 x i16]* @id3_compat_lookup.lookup, i64 0, i64 %31
  %33 = load i16, i16* %32, align 2
  %34 = sext i16 %33 to i32
  store i32 %34, i32* %7, align 4
  %35 = load i32, i32* %7, align 4
  %36 = icmp sge i32 %35, 0
  br i1 %36, label %37, label %68

; <label>:37:                                     ; preds = %29
  %38 = load i32, i32* %7, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [73 x %struct.id3_compat], [73 x %struct.id3_compat]* @id3_compat_lookup.wordlist, i64 0, i64 %39
  %41 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %40, i32 0, i32 0
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
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 8)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 8)
  %52 = load i8*, i8** %4, align 8
  %53 = getelementptr inbounds i8, i8* %52, i64 1
  %54 = load i8*, i8** %8, align 8
  %55 = getelementptr inbounds i8, i8* %54, i64 1
  %56 = load i32, i32* %5, align 4
  %57 = sub i32 %56, 1
  %58 = zext i32 %57 to i64
  %59 = call i32 @strncmp(i8* %53, i8* %55, i64 %58) #7
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %66, label %61

; <label>:61:                                     ; preds = %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 10)
  %62 = add i64 %pgocount3, 1
  store i64 %62, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 10)
  %63 = load i32, i32* %7, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [73 x %struct.id3_compat], [73 x %struct.id3_compat]* @id3_compat_lookup.wordlist, i64 0, i64 %64
  store %struct.id3_compat* %65, %struct.id3_compat** %3, align 8
  br label %134

; <label>:66:                                     ; preds = %50, %37
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 7)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 7)
  br label %129

; <label>:68:                                     ; preds = %29
  %69 = load i32, i32* %7, align 4
  %70 = icmp slt i32 %69, -73
  br i1 %70, label %71, label %127

; <label>:71:                                     ; preds = %68
  %72 = load i32, i32* %7, align 4
  %73 = sub nsw i32 -74, %72
  store i32 %73, i32* %9, align 4
  %74 = load i32, i32* %9, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [91 x i16], [91 x i16]* @id3_compat_lookup.lookup, i64 0, i64 %75
  %77 = load i16, i16* %76, align 2
  %78 = sext i16 %77 to i32
  %79 = add nsw i32 73, %78
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [73 x %struct.id3_compat], [73 x %struct.id3_compat]* @id3_compat_lookup.wordlist, i64 0, i64 %80
  store %struct.id3_compat* %81, %struct.id3_compat** %10, align 8
  %82 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %83 = load i32, i32* %9, align 4
  %84 = add nsw i32 %83, 1
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [91 x i16], [91 x i16]* @id3_compat_lookup.lookup, i64 0, i64 %85
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = sub nsw i32 0, %88
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %82, i64 %90
  store %struct.id3_compat* %91, %struct.id3_compat** %11, align 8
  br label %92

; <label>:92:                                     ; preds = %121, %71
  %93 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %94 = load %struct.id3_compat*, %struct.id3_compat** %11, align 8
  %95 = icmp ult %struct.id3_compat* %93, %94
  br i1 %95, label %96, label %125

; <label>:96:                                     ; preds = %92
  %97 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %98 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %97, i32 0, i32 0
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
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 4)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 4)
  %109 = load i8*, i8** %4, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 1
  %111 = load i8*, i8** %12, align 8
  %112 = getelementptr inbounds i8, i8* %111, i64 1
  %113 = load i32, i32* %5, align 4
  %114 = sub i32 %113, 1
  %115 = zext i32 %114 to i64
  %116 = call i32 @strncmp(i8* %110, i8* %112, i64 %115) #7
  %117 = icmp ne i32 %116, 0
  br i1 %117, label %121, label %118

; <label>:118:                                    ; preds = %107
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 11)
  %119 = add i64 %pgocount6, 1
  store i64 %119, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 11)
  %120 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  store %struct.id3_compat* %120, %struct.id3_compat** %3, align 8
  br label %134

; <label>:121:                                    ; preds = %107, %96
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 2)
  %122 = add i64 %pgocount7, 1
  store i64 %122, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 2)
  %123 = load %struct.id3_compat*, %struct.id3_compat** %10, align 8
  %124 = getelementptr inbounds %struct.id3_compat, %struct.id3_compat* %123, i32 1
  store %struct.id3_compat* %124, %struct.id3_compat** %10, align 8
  br label %92

; <label>:125:                                    ; preds = %92
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 9)
  %126 = add i64 %pgocount8, 1
  store i64 %126, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 9)
  br label %127

; <label>:127:                                    ; preds = %125, %68
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 6)
  %128 = add i64 %pgocount9, 1
  store i64 %128, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 6)
  br label %129

; <label>:129:                                    ; preds = %127, %66
  br label %130

; <label>:130:                                    ; preds = %129, %25, %19
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 3)
  %131 = add i64 %pgocount10, 1
  store i64 %131, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 3)
  br label %132

; <label>:132:                                    ; preds = %130, %15, %2
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 0)
  %133 = add i64 %pgocount11, 1
  store i64 %133, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_id3_compat_lookup, i64 0, i64 0)
  store %struct.id3_compat* null, %struct.id3_compat** %3, align 8
  br label %134

; <label>:134:                                    ; preds = %132, %118, %61
  %135 = load %struct.id3_compat*, %struct.id3_compat** %3, align 8
  ret %struct.id3_compat* %135
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @translate_TCON(%struct.id3_frame*, i8*, i8*, i64) #0 {
  %5 = alloca %struct.id3_frame*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64*, align 8
  %12 = alloca i64*, align 8
  %13 = alloca i64*, align 8
  %14 = alloca i32, align 4
  store %struct.id3_frame* %0, %struct.id3_frame** %5, align 8
  store i8* %1, i8** %6, align 8
  store i8* %2, i8** %7, align 8
  store i64 %3, i64* %8, align 8
  store i64* null, i64** %11, align 8
  store i32 0, i32* %14, align 4
  %15 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %16 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %15, i32 0, i32 9
  %17 = load i32, i32* %16, align 8
  %18 = icmp eq i32 %17, 2
  br i1 %18, label %19, label %20

; <label>:19:                                     ; preds = %4
  br label %23

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 13)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 13)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.135, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.129, i32 0, i32 0), i32 259, i8* getelementptr inbounds ([87 x i8], [87 x i8]* @__PRETTY_FUNCTION__.translate_TCON, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %23

; <label>:23:                                     ; preds = %22, %19
  store i32 0, i32* %10, align 4
  %24 = load i8*, i8** %7, align 8
  %25 = load i64, i64* %8, align 8
  %26 = getelementptr inbounds i8, i8* %24, i64 %25
  store i8* %26, i8** %9, align 8
  %27 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %28 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %27, i32 0, i32 10
  %29 = load %union.id3_field*, %union.id3_field** %28, align 8
  %30 = getelementptr inbounds %union.id3_field, %union.id3_field* %29, i64 0
  %31 = load i8*, i8** %9, align 8
  %32 = load i8*, i8** %7, align 8
  %33 = ptrtoint i8* %31 to i64
  %34 = ptrtoint i8* %32 to i64
  %35 = sub i64 %33, %34
  %36 = call i32 @id3_field_parse(%union.id3_field* %30, i8** %7, i64 %35, i32* %10)
  %37 = icmp eq i32 %36, -1
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 6)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 6)
  br label %122

; <label>:40:                                     ; preds = %23
  %41 = load i8*, i8** %9, align 8
  %42 = load i8*, i8** %7, align 8
  %43 = ptrtoint i8* %41 to i64
  %44 = ptrtoint i8* %42 to i64
  %45 = sub i64 %43, %44
  %46 = load i32, i32* %10, align 4
  %47 = call i64* @id3_parse_string(i8** %7, i64 %45, i32 %46, i32 0)
  store i64* %47, i64** %11, align 8
  %48 = load i64*, i64** %11, align 8
  %49 = icmp eq i64* %48, null
  br i1 %49, label %50, label %52

; <label>:50:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 7)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 7)
  br label %122

; <label>:52:                                     ; preds = %40
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 5)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 5)
  %54 = load i64*, i64** %11, align 8
  store i64* %54, i64** %12, align 8
  br label %55

; <label>:55:                                     ; preds = %101, %52
  %56 = load i64*, i64** %12, align 8
  %57 = load i64, i64* %56, align 8
  %58 = icmp eq i64 %57, 40
  br i1 %58, label %59, label %104

; <label>:59:                                     ; preds = %55
  %60 = load i64*, i64** %12, align 8
  %61 = getelementptr inbounds i64, i64* %60, i32 1
  store i64* %61, i64** %12, align 8
  %62 = load i64, i64* %61, align 8
  %63 = icmp eq i64 %62, 40
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %59
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 9)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 9)
  br label %104

; <label>:66:                                     ; preds = %59
  %67 = load i64*, i64** %12, align 8
  store i64* %67, i64** %13, align 8
  br label %68

; <label>:68:                                     ; preds = %79, %66
  %69 = load i64*, i64** %13, align 8
  %70 = load i64, i64* %69, align 8
  %71 = icmp ne i64 %70, 0
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 1)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 1)
  %74 = load i64*, i64** %13, align 8
  %75 = load i64, i64* %74, align 8
  %76 = icmp ne i64 %75, 41
  br label %77

; <label>:77:                                     ; preds = %72, %68
  %78 = phi i1 [ false, %68 ], [ %76, %72 ]
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %77
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 0)
  %80 = add i64 %pgocount6, 1
  store i64 %80, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 0)
  %81 = load i64*, i64** %13, align 8
  %82 = getelementptr inbounds i64, i64* %81, i32 1
  store i64* %82, i64** %13, align 8
  br label %68

; <label>:83:                                     ; preds = %77
  %84 = load i64*, i64** %13, align 8
  %85 = load i64, i64* %84, align 8
  %86 = icmp ne i64 %85, 0
  br i1 %86, label %87, label %91

; <label>:87:                                     ; preds = %83
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 3)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 3)
  %89 = load i64*, i64** %13, align 8
  %90 = getelementptr inbounds i64, i64* %89, i32 1
  store i64* %90, i64** %13, align 8
  store i64 0, i64* %89, align 8
  br label %91

; <label>:91:                                     ; preds = %87, %83
  %92 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %93 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %92, i32 0, i32 10
  %94 = load %union.id3_field*, %union.id3_field** %93, align 8
  %95 = getelementptr inbounds %union.id3_field, %union.id3_field* %94, i64 1
  %96 = load i64*, i64** %12, align 8
  %97 = call i32 @id3_field_addstring(%union.id3_field* %95, i64* %96)
  %98 = icmp eq i32 %97, -1
  br i1 %98, label %99, label %101

; <label>:99:                                     ; preds = %91
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 10)
  %100 = add i64 %pgocount8, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 10)
  br label %122

; <label>:101:                                    ; preds = %91
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 2)
  %102 = add i64 %pgocount9, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 2)
  %103 = load i64*, i64** %13, align 8
  store i64* %103, i64** %12, align 8
  br label %55

; <label>:104:                                    ; preds = %64, %55
  %105 = load i64*, i64** %12, align 8
  %106 = load i64, i64* %105, align 8
  %107 = icmp ne i64 %106, 0
  br i1 %107, label %108, label %119

; <label>:108:                                    ; preds = %104
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 8)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 8)
  %110 = load %struct.id3_frame*, %struct.id3_frame** %5, align 8
  %111 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %110, i32 0, i32 10
  %112 = load %union.id3_field*, %union.id3_field** %111, align 8
  %113 = getelementptr inbounds %union.id3_field, %union.id3_field* %112, i64 1
  %114 = load i64*, i64** %12, align 8
  %115 = call i32 @id3_field_addstring(%union.id3_field* %113, i64* %114)
  %116 = icmp eq i32 %115, -1
  br i1 %116, label %117, label %119

; <label>:117:                                    ; preds = %108
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 12)
  %118 = add i64 %pgocount11, 1
  store i64 %118, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 12)
  br label %122

; <label>:119:                                    ; preds = %108, %104
  br i1 false, label %120, label %123

; <label>:120:                                    ; preds = %119
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 11)
  %121 = add i64 %pgocount12, 1
  store i64 %121, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 11)
  br label %122

; <label>:122:                                    ; preds = %120, %117, %99, %50, %38
  store i32 -1, i32* %14, align 4
  br label %123

; <label>:123:                                    ; preds = %122, %119
  %124 = load i64*, i64** %11, align 8
  %125 = icmp ne i64* %124, null
  br i1 %125, label %126, label %130

; <label>:126:                                    ; preds = %123
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 4)
  %127 = add i64 %pgocount13, 1
  store i64 %127, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_translate_TCON, i64 0, i64 4)
  %128 = load i64*, i64** %11, align 8
  %129 = bitcast i64* %128 to i8*
  call void @free(i8* %129) #6
  br label %130

; <label>:130:                                    ; preds = %126, %123
  %131 = load i32, i32* %14, align 4
  ret i32 %131
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

; Function Attrs: noinline nounwind uwtable
define i32 @id3_compat_fixup(%struct.id3_tag*) #0 {
  %2 = alloca %struct.id3_tag*, align 8
  %3 = alloca %struct.id3_frame*, align 8
  %4 = alloca i32, align 4
  %5 = alloca [17 x i64], align 16
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  %12 = alloca i64*, align 8
  %13 = alloca i64*, align 8
  store %struct.id3_tag* %0, %struct.id3_tag** %2, align 8
  %14 = bitcast [17 x i64]* %5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 136, i32 16, i1 false)
  store i32 0, i32* %6, align 4
  store i32 0, i32* %4, align 4
  br label %15

; <label>:15:                                     ; preds = %178, %97, %79, %62, %1
  %16 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %17 = load i32, i32* %4, align 4
  %18 = add i32 %17, 1
  store i32 %18, i32* %4, align 4
  %19 = call %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag* %16, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.127, i32 0, i32 0), i32 %17)
  store %struct.id3_frame* %19, %struct.id3_frame** %3, align 8
  %20 = icmp ne %struct.id3_frame* %19, null
  br i1 %20, label %21, label %181

; <label>:21:                                     ; preds = %15
  %22 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %23 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %22, i32 0, i32 10
  %24 = load %union.id3_field*, %union.id3_field** %23, align 8
  %25 = getelementptr inbounds %union.id3_field, %union.id3_field* %24, i64 0
  %26 = call i8* @id3_field_getframeid(%union.id3_field* %25)
  store i8* %26, i8** %7, align 8
  %27 = load i8*, i8** %7, align 8
  %28 = icmp ne i8* %27, null
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %21
  br label %33

; <label>:30:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 20)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.128, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.129, i32 0, i32 0), i32 334, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.id3_compat_fixup, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %33

; <label>:33:                                     ; preds = %32, %29
  %34 = load i8*, i8** %7, align 8
  %35 = call i32 @strcmp(i8* %34, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i32 0, i32 0)) #7
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %64

; <label>:37:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 0)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 0)
  %39 = load i8*, i8** %7, align 8
  %40 = call i32 @strcmp(i8* %39, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.130, i32 0, i32 0)) #7
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %64

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 2)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 2)
  %44 = load i8*, i8** %7, align 8
  %45 = call i32 @strcmp(i8* %44, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.124, i32 0, i32 0)) #7
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %64

; <label>:47:                                     ; preds = %42
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 3)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 3)
  %49 = load i8*, i8** %7, align 8
  %50 = call i32 @strcmp(i8* %49, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.131, i32 0, i32 0)) #7
  %51 = icmp ne i32 %50, 0
  br i1 %51, label %52, label %64

; <label>:52:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 5)
  %53 = add i64 %pgocount4, 1
  store i64 %53, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 5)
  %54 = load i8*, i8** %7, align 8
  %55 = call i32 @strcmp(i8* %54, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.113, i32 0, i32 0)) #7
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %64

; <label>:57:                                     ; preds = %52
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 8)
  %58 = add i64 %pgocount5, 1
  store i64 %58, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 8)
  %59 = load i8*, i8** %7, align 8
  %60 = call i32 @strcmp(i8* %59, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.132, i32 0, i32 0)) #7
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %57
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 9)
  %63 = add i64 %pgocount6, 1
  store i64 %63, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 9)
  br label %15

; <label>:64:                                     ; preds = %57, %52, %47, %42, %37, %33
  %65 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %66 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %65, i32 0, i32 10
  %67 = load %union.id3_field*, %union.id3_field** %66, align 8
  %68 = getelementptr inbounds %union.id3_field, %union.id3_field* %67, i64 1
  %69 = call i8* @id3_field_getbinarydata(%union.id3_field* %68, i64* %10)
  store i8* %69, i8** %8, align 8
  %70 = load i8*, i8** %8, align 8
  %71 = icmp ne i8* %70, null
  br i1 %71, label %72, label %73

; <label>:72:                                     ; preds = %64
  br label %76

; <label>:73:                                     ; preds = %64
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 21)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 21)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.133, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.129, i32 0, i32 0), i32 342, i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__PRETTY_FUNCTION__.id3_compat_fixup, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %76

; <label>:76:                                     ; preds = %75, %72
  %77 = load i64, i64* %10, align 8
  %78 = icmp ult i64 %77, 1
  br i1 %78, label %79, label %81

; <label>:79:                                     ; preds = %76
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 1)
  %80 = add i64 %pgocount8, 1
  store i64 %80, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 1)
  br label %15

; <label>:81:                                     ; preds = %76
  %82 = load i8*, i8** %8, align 8
  %83 = load i64, i64* %10, align 8
  %84 = getelementptr inbounds i8, i8* %82, i64 %83
  store i8* %84, i8** %9, align 8
  %85 = call i64 @id3_parse_uint(i8** %8, i32 1)
  %86 = trunc i64 %85 to i32
  store i32 %86, i32* %11, align 4
  %87 = load i8*, i8** %9, align 8
  %88 = load i8*, i8** %8, align 8
  %89 = ptrtoint i8* %87 to i64
  %90 = ptrtoint i8* %88 to i64
  %91 = sub i64 %89, %90
  %92 = load i32, i32* %11, align 4
  %93 = call i64* @id3_parse_string(i8** %8, i64 %91, i32 %92, i32 0)
  store i64* %93, i64** %12, align 8
  %94 = load i64*, i64** %12, align 8
  %95 = call i64 @id3_ucs4_length(i64* %94)
  %96 = icmp ult i64 %95, 4
  br i1 %96, label %97, label %101

; <label>:97:                                     ; preds = %81
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 4)
  %98 = add i64 %pgocount9, 1
  store i64 %98, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 4)
  %99 = load i64*, i64** %12, align 8
  %100 = bitcast i64* %99 to i8*
  call void @free(i8* %100) #6
  br label %15

; <label>:101:                                    ; preds = %81
  %102 = load i8*, i8** %7, align 8
  %103 = call i32 @strcmp(i8* %102, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.123, i32 0, i32 0)) #7
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %110, label %105

; <label>:105:                                    ; preds = %101
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 6)
  %106 = add i64 %pgocount10, 1
  store i64 %106, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 6)
  %107 = load i8*, i8** %7, align 8
  %108 = call i32 @strcmp(i8* %107, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.130, i32 0, i32 0)) #7
  %109 = icmp eq i32 %108, 0
  br i1 %109, label %110, label %128

; <label>:110:                                    ; preds = %105, %101
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 7)
  %111 = add i64 %pgocount11, 1
  store i64 %111, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 7)
  %112 = load i64*, i64** %12, align 8
  %113 = getelementptr inbounds i64, i64* %112, i64 0
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 0
  store i64 %114, i64* %115, align 16
  %116 = load i64*, i64** %12, align 8
  %117 = getelementptr inbounds i64, i64* %116, i64 1
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 1
  store i64 %118, i64* %119, align 8
  %120 = load i64*, i64** %12, align 8
  %121 = getelementptr inbounds i64, i64* %120, i64 2
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 2
  store i64 %122, i64* %123, align 16
  %124 = load i64*, i64** %12, align 8
  %125 = getelementptr inbounds i64, i64* %124, i64 3
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 3
  store i64 %126, i64* %127, align 8
  br label %178

; <label>:128:                                    ; preds = %105
  %129 = load i8*, i8** %7, align 8
  %130 = call i32 @strcmp(i8* %129, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.124, i32 0, i32 0)) #7
  %131 = icmp eq i32 %130, 0
  br i1 %131, label %137, label %132

; <label>:132:                                    ; preds = %128
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 10)
  %133 = add i64 %pgocount12, 1
  store i64 %133, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 10)
  %134 = load i8*, i8** %7, align 8
  %135 = call i32 @strcmp(i8* %134, i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.131, i32 0, i32 0)) #7
  %136 = icmp eq i32 %135, 0
  br i1 %136, label %137, label %157

; <label>:137:                                    ; preds = %132, %128
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 11)
  %138 = add i64 %pgocount13, 1
  store i64 %138, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 11)
  %139 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 4
  store i64 45, i64* %139, align 16
  %140 = load i64*, i64** %12, align 8
  %141 = getelementptr inbounds i64, i64* %140, i64 2
  %142 = load i64, i64* %141, align 8
  %143 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 5
  store i64 %142, i64* %143, align 8
  %144 = load i64*, i64** %12, align 8
  %145 = getelementptr inbounds i64, i64* %144, i64 3
  %146 = load i64, i64* %145, align 8
  %147 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 6
  store i64 %146, i64* %147, align 16
  %148 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 7
  store i64 45, i64* %148, align 8
  %149 = load i64*, i64** %12, align 8
  %150 = getelementptr inbounds i64, i64* %149, i64 0
  %151 = load i64, i64* %150, align 8
  %152 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 8
  store i64 %151, i64* %152, align 16
  %153 = load i64*, i64** %12, align 8
  %154 = getelementptr inbounds i64, i64* %153, i64 1
  %155 = load i64, i64* %154, align 8
  %156 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 9
  store i64 %155, i64* %156, align 8
  br label %177

; <label>:157:                                    ; preds = %132
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 12)
  %158 = add i64 %pgocount14, 1
  store i64 %158, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 12)
  %159 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 10
  store i64 84, i64* %159, align 16
  %160 = load i64*, i64** %12, align 8
  %161 = getelementptr inbounds i64, i64* %160, i64 0
  %162 = load i64, i64* %161, align 8
  %163 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 11
  store i64 %162, i64* %163, align 8
  %164 = load i64*, i64** %12, align 8
  %165 = getelementptr inbounds i64, i64* %164, i64 1
  %166 = load i64, i64* %165, align 8
  %167 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 12
  store i64 %166, i64* %167, align 16
  %168 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 13
  store i64 58, i64* %168, align 8
  %169 = load i64*, i64** %12, align 8
  %170 = getelementptr inbounds i64, i64* %169, i64 2
  %171 = load i64, i64* %170, align 8
  %172 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 14
  store i64 %171, i64* %172, align 16
  %173 = load i64*, i64** %12, align 8
  %174 = getelementptr inbounds i64, i64* %173, i64 3
  %175 = load i64, i64* %174, align 8
  %176 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 15
  store i64 %175, i64* %176, align 8
  br label %177

; <label>:177:                                    ; preds = %157, %137
  br label %178

; <label>:178:                                    ; preds = %177, %110
  %179 = load i64*, i64** %12, align 8
  %180 = bitcast i64* %179 to i8*
  call void @free(i8* %180) #6
  br label %15

; <label>:181:                                    ; preds = %15
  %182 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i64 0, i64 0
  %183 = load i64, i64* %182, align 16
  %184 = icmp ne i64 %183, 0
  br i1 %184, label %185, label %218

; <label>:185:                                    ; preds = %181
  %186 = call %struct.id3_frame* @id3_frame_new(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.134, i32 0, i32 0))
  store %struct.id3_frame* %186, %struct.id3_frame** %3, align 8
  %187 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %188 = icmp eq %struct.id3_frame* %187, null
  br i1 %188, label %189, label %191

; <label>:189:                                    ; preds = %185
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 17)
  %190 = add i64 %pgocount15, 1
  store i64 %190, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 17)
  br label %221

; <label>:191:                                    ; preds = %185
  %192 = getelementptr inbounds [17 x i64], [17 x i64]* %5, i32 0, i32 0
  store i64* %192, i64** %13, align 8
  %193 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %194 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %193, i32 0, i32 10
  %195 = load %union.id3_field*, %union.id3_field** %194, align 8
  %196 = getelementptr inbounds %union.id3_field, %union.id3_field* %195, i64 0
  %197 = call i32 @id3_field_settextencoding(%union.id3_field* %196, i32 0)
  %198 = icmp eq i32 %197, -1
  br i1 %198, label %213, label %199

; <label>:199:                                    ; preds = %191
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 15)
  %200 = add i64 %pgocount16, 1
  store i64 %200, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 15)
  %201 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %202 = getelementptr inbounds %struct.id3_frame, %struct.id3_frame* %201, i32 0, i32 10
  %203 = load %union.id3_field*, %union.id3_field** %202, align 8
  %204 = getelementptr inbounds %union.id3_field, %union.id3_field* %203, i64 1
  %205 = call i32 @id3_field_setstrings(%union.id3_field* %204, i32 1, i64** %13)
  %206 = icmp eq i32 %205, -1
  br i1 %206, label %213, label %207

; <label>:207:                                    ; preds = %199
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 18)
  %208 = add i64 %pgocount17, 1
  store i64 %208, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 18)
  %209 = load %struct.id3_tag*, %struct.id3_tag** %2, align 8
  %210 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  %211 = call i32 @id3_tag_attachframe(%struct.id3_tag* %209, %struct.id3_frame* %210)
  %212 = icmp eq i32 %211, -1
  br i1 %212, label %213, label %216

; <label>:213:                                    ; preds = %207, %199, %191
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 14)
  %214 = add i64 %pgocount18, 1
  store i64 %214, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 14)
  %215 = load %struct.id3_frame*, %struct.id3_frame** %3, align 8
  call void @id3_frame_delete(%struct.id3_frame* %215)
  br label %221

; <label>:216:                                    ; preds = %207
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 19)
  %217 = add i64 %pgocount19, 1
  store i64 %217, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 19)
  br label %218

; <label>:218:                                    ; preds = %216, %181
  br i1 false, label %219, label %222

; <label>:219:                                    ; preds = %218
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 16)
  %220 = add i64 %pgocount20, 1
  store i64 %220, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 16)
  br label %221

; <label>:221:                                    ; preds = %219, %213, %189
  store i32 -1, i32* %6, align 4
  br label %222

; <label>:222:                                    ; preds = %221, %218
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 13)
  %223 = add i64 %pgocount21, 1
  store i64 %223, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_id3_compat_fixup, i64 0, i64 13)
  %224 = load i32, i32* %6, align 4
  ret i32 %224
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare %struct.id3_frame* @id3_tag_findframe(%struct.id3_tag*, i8*, i32) #3

declare i8* @id3_field_getframeid(%union.id3_field*) #3

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

declare i8* @id3_field_getbinarydata(%union.id3_field*, i64*) #3

declare i64 @id3_parse_uint(i8**, i32) #3

declare i64* @id3_parse_string(i8**, i64, i32, i32) #3

declare i64 @id3_ucs4_length(i64*) #3

; Function Attrs: nounwind
declare void @free(i8*) #5

declare %struct.id3_frame* @id3_frame_new(i8*) #3

declare i32 @id3_field_settextencoding(%union.id3_field*, i32) #3

declare i32 @id3_field_setstrings(%union.id3_field*, i32, i64**) #3

declare i32 @id3_tag_attachframe(%struct.id3_tag*, %struct.id3_frame*) #3

declare void @id3_frame_delete(%struct.id3_frame*) #3

declare i32 @id3_field_parse(%union.id3_field*, i8**, i64, i32*) #3

declare i32 @id3_field_addstring(%union.id3_field*, i64*) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readonly }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

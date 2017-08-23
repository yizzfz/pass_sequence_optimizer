; ModuleID = 'phtoelm.2.ll'
source_filename = "phtoelm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.trie_s = type opaque
%struct.Elm_s = type { i8*, i8, i8, i8, i8, i8*, i8*, i64, [19 x %struct.interp_t] }
%struct.interp_t = type { float, float, i8, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.darray_t = type { i8*, i32, i32, i16, i16 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [64 x i8] c"$Id: phtoelm.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@phtoelm_id = global i8* getelementptr inbounds ([64 x i8], [64 x i8]* @.str, i32 0, i32 0), align 8
@phtoelm = global %struct.trie_s* null, align 8
@Elements = external global [0 x %struct.Elm_s], align 8
@speed = external global i32, align 4
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"Ignoring %c in '%.*s'\0A\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c" \00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"p\00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"P\00", align 1
@.str.6 = private unnamed_addr constant [3 x i8] c"PY\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"PZ\00", align 1
@.str.8 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"T\00", align 1
@.str.10 = private unnamed_addr constant [3 x i8] c"TY\00", align 1
@.str.11 = private unnamed_addr constant [3 x i8] c"TZ\00", align 1
@.str.12 = private unnamed_addr constant [2 x i8] c"k\00", align 1
@.str.13 = private unnamed_addr constant [2 x i8] c"K\00", align 1
@.str.14 = private unnamed_addr constant [3 x i8] c"KY\00", align 1
@.str.15 = private unnamed_addr constant [3 x i8] c"KZ\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str.17 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.18 = private unnamed_addr constant [3 x i8] c"BY\00", align 1
@.str.19 = private unnamed_addr constant [3 x i8] c"BZ\00", align 1
@.str.20 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str.21 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.22 = private unnamed_addr constant [3 x i8] c"DY\00", align 1
@.str.23 = private unnamed_addr constant [3 x i8] c"DZ\00", align 1
@.str.24 = private unnamed_addr constant [2 x i8] c"g\00", align 1
@.str.25 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.26 = private unnamed_addr constant [3 x i8] c"GY\00", align 1
@.str.27 = private unnamed_addr constant [3 x i8] c"GZ\00", align 1
@.str.28 = private unnamed_addr constant [2 x i8] c"m\00", align 1
@.str.29 = private unnamed_addr constant [2 x i8] c"M\00", align 1
@.str.30 = private unnamed_addr constant [2 x i8] c"n\00", align 1
@.str.31 = private unnamed_addr constant [2 x i8] c"N\00", align 1
@.str.32 = private unnamed_addr constant [3 x i8] c"NG\00", align 1
@.str.33 = private unnamed_addr constant [2 x i8] c"f\00", align 1
@.str.34 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.35 = private unnamed_addr constant [3 x i8] c"TH\00", align 1
@.str.36 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.37 = private unnamed_addr constant [2 x i8] c"S\00", align 1
@.str.38 = private unnamed_addr constant [3 x i8] c"SH\00", align 1
@.str.39 = private unnamed_addr constant [2 x i8] c"h\00", align 1
@.str.40 = private unnamed_addr constant [2 x i8] c"H\00", align 1
@.str.41 = private unnamed_addr constant [2 x i8] c"v\00", align 1
@.str.42 = private unnamed_addr constant [2 x i8] c"V\00", align 1
@.str.43 = private unnamed_addr constant [3 x i8] c"QQ\00", align 1
@.str.44 = private unnamed_addr constant [3 x i8] c"DH\00", align 1
@.str.45 = private unnamed_addr constant [3 x i8] c"DI\00", align 1
@.str.46 = private unnamed_addr constant [2 x i8] c"z\00", align 1
@.str.47 = private unnamed_addr constant [2 x i8] c"Z\00", align 1
@.str.48 = private unnamed_addr constant [3 x i8] c"ZZ\00", align 1
@.str.49 = private unnamed_addr constant [3 x i8] c"ZH\00", align 1
@.str.50 = private unnamed_addr constant [3 x i8] c"tS\00", align 1
@.str.51 = private unnamed_addr constant [3 x i8] c"CH\00", align 1
@.str.52 = private unnamed_addr constant [3 x i8] c"CI\00", align 1
@.str.53 = private unnamed_addr constant [3 x i8] c"dZ\00", align 1
@.str.54 = private unnamed_addr constant [2 x i8] c"J\00", align 1
@.str.55 = private unnamed_addr constant [3 x i8] c"JY\00", align 1
@.str.56 = private unnamed_addr constant [2 x i8] c"l\00", align 1
@.str.57 = private unnamed_addr constant [2 x i8] c"L\00", align 1
@.str.58 = private unnamed_addr constant [2 x i8] c"r\00", align 1
@.str.59 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.60 = private unnamed_addr constant [3 x i8] c"rr\00", align 1
@.str.61 = private unnamed_addr constant [3 x i8] c"RX\00", align 1
@.str.62 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.63 = private unnamed_addr constant [2 x i8] c"W\00", align 1
@.str.64 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.65 = private unnamed_addr constant [2 x i8] c"X\00", align 1
@.str.66 = private unnamed_addr constant [2 x i8] c"%\00", align 1
@.str.67 = private unnamed_addr constant [2 x i8] c"j\00", align 1
@.str.68 = private unnamed_addr constant [2 x i8] c"Y\00", align 1
@.str.69 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.70 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@.str.71 = private unnamed_addr constant [2 x i8] c"E\00", align 1
@.str.72 = private unnamed_addr constant [2 x i8] c"&\00", align 1
@.str.73 = private unnamed_addr constant [3 x i8] c"AA\00", align 1
@.str.74 = private unnamed_addr constant [2 x i8] c"U\00", align 1
@.str.75 = private unnamed_addr constant [2 x i8] c"0\00", align 1
@.str.76 = private unnamed_addr constant [2 x i8] c"O\00", align 1
@.str.77 = private unnamed_addr constant [3 x i8] c"OO\00", align 1
@.str.78 = private unnamed_addr constant [2 x i8] c"@\00", align 1
@.str.79 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.80 = private unnamed_addr constant [2 x i8] c"i\00", align 1
@.str.81 = private unnamed_addr constant [3 x i8] c"EE\00", align 1
@.str.82 = private unnamed_addr constant [2 x i8] c"3\00", align 1
@.str.83 = private unnamed_addr constant [3 x i8] c"ER\00", align 1
@.str.84 = private unnamed_addr constant [3 x i8] c"AR\00", align 1
@.str.85 = private unnamed_addr constant [3 x i8] c"AW\00", align 1
@.str.86 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.87 = private unnamed_addr constant [3 x i8] c"UU\00", align 1
@.str.88 = private unnamed_addr constant [2 x i8] c"o\00", align 1
@.str.89 = private unnamed_addr constant [3 x i8] c"OI\00", align 1
@.str.90 = private unnamed_addr constant [3 x i8] c"eI\00", align 1
@.str.91 = private unnamed_addr constant [3 x i8] c"AI\00", align 1
@.str.92 = private unnamed_addr constant [3 x i8] c"aI\00", align 1
@.str.93 = private unnamed_addr constant [3 x i8] c"IE\00", align 1
@.str.94 = private unnamed_addr constant [3 x i8] c"oI\00", align 1
@.str.95 = private unnamed_addr constant [3 x i8] c"aU\00", align 1
@.str.96 = private unnamed_addr constant [3 x i8] c"OU\00", align 1
@.str.97 = private unnamed_addr constant [3 x i8] c"OV\00", align 1
@.str.98 = private unnamed_addr constant [3 x i8] c"@U\00", align 1
@.str.99 = private unnamed_addr constant [3 x i8] c"OA\00", align 1
@.str.100 = private unnamed_addr constant [3 x i8] c"I@\00", align 1
@.str.101 = private unnamed_addr constant [3 x i8] c"IA\00", align 1
@.str.102 = private unnamed_addr constant [3 x i8] c"IB\00", align 1
@.str.103 = private unnamed_addr constant [3 x i8] c"e@\00", align 1
@.str.104 = private unnamed_addr constant [4 x i8] c"AIR\00", align 1
@.str.105 = private unnamed_addr constant [3 x i8] c"U@\00", align 1
@.str.106 = private unnamed_addr constant [4 x i8] c"OOR\00", align 1
@.str.107 = private unnamed_addr constant [3 x i8] c"O@\00", align 1
@.str.108 = private unnamed_addr constant [3 x i8] c"OR\00", align 1
@.str.109 = private unnamed_addr constant [3 x i8] c"oU\00", align 1
@.str.110 = private unnamed_addr constant [16 x i8] c"Cannot find %s\0A\00", align 1
@num_Elements = external global i32, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_phone_append = private constant [12 x i8] c"phone_append"
@__profn_tmp1.ll_darray_find = private constant [19 x i8] c"tmp1.ll:darray_find"
@__profn_phone_to_elm = private constant [12 x i8] c"phone_to_elm"
@__profn_tmp1.ll_enter_phonemes = private constant [22 x i8] c"tmp1.ll:enter_phonemes"
@__profn_tmp1.ll_enter = private constant [13 x i8] c"tmp1.ll:enter"
@__profn_tmp1.ll_find_elm = private constant [16 x i8] c"tmp1.ll:find_elm"
@__profc_phone_append = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_phone_append = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5686990970496353210, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_phone_append, i32 0, i32 0), i8* bitcast (i32 (%struct.darray_t*, i32)* @phone_append to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_darray_find = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_darray_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4594349971239127650, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_phone_to_elm = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_phone_to_elm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -856179011389118214, i64 143700916064, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, %struct.darray_t*)* @phone_to_elm to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_enter_phonemes = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_enter_phonemes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5183704975232604529, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_enter_phonemes, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_enter = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_enter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 258964356939657982, i64 61478522974, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_find_elm = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_find_elm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5863319488762571827, i64 44670996879, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [71 x i8] c"cEx\DA+\C8\C8\CFK\8DO,(H\CDKa,\C9-0\D4\CB\C9\B1JI,*J\AC\8CO\CB\04\8A\15\80\15\94\E4\C7\A7\E6\E4\C2\15\A4\E6\95\A4\16\C5\83\A5rS\8BQ\85\E1<\90v\90.\00;\A1$\B3", section "__llvm_prf_names"
@llvm.used = appending global [7 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_phone_append to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_darray_find to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_phone_to_elm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_enter_phonemes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_enter to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_find_elm to i8*), i8* getelementptr inbounds ([71 x i8], [71 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @phone_append(%struct.darray_t*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_phone_append, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_phone_append, i64 0, i64 0)
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %8 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %9 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %8, i32 0, i32 1
  %10 = load i32, i32* %9, align 8
  %11 = call i8* @darray_find(%struct.darray_t* %7, i32 %10)
  store i8* %11, i8** %6, align 8
  %12 = load i32, i32* %5, align 4
  %13 = trunc i32 %12 to i8
  %14 = load i8*, i8** %6, align 8
  store i8 %13, i8* %14, align 1
  %15 = load i32, i32* %5, align 4
  ret i32 %15
}

; Function Attrs: inlinehint nounwind uwtable
define internal i8* @darray_find(%struct.darray_t*, i32) #1 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %8 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = icmp ult i32 %6, %9
  br i1 %10, label %11, label %31

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %15 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp ult i32 %13, %16
  br i1 %17, label %18, label %31

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %20 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %21 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = load i32, i32* %5, align 4
  %24 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %25 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %24, i32 0, i32 3
  %26 = load i16, i16* %25, align 8
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %22, i64 %29
  store i8* %30, i8** %3, align 8
  br label %36

; <label>:31:                                     ; preds = %11, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %33 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = call i8* @Darray_find(%struct.darray_t* %33, i32 %34)
  store i8* %35, i8** %3, align 8
  br label %36

; <label>:36:                                     ; preds = %31, %18
  %37 = load i8*, i8** %3, align 8
  ret i8* %37
}

; Function Attrs: nounwind uwtable
define i32 @phone_to_elm(i8*, i32, %struct.darray_t*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.darray_t*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.Elm_s*, align 8
  %15 = alloca i8, align 1
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store %struct.darray_t* %2, %struct.darray_t** %6, align 8
  store i32 0, i32* %7, align 4
  %16 = load i8*, i8** %4, align 8
  store i8* %16, i8** %8, align 8
  store i32 0, i32* %9, align 4
  %17 = load i8*, i8** %8, align 8
  %18 = load i32, i32* %5, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i8, i8* %17, i64 %19
  store i8* %20, i8** %10, align 8
  %21 = load %struct.trie_s*, %struct.trie_s** @phtoelm, align 8
  %22 = icmp ne %struct.trie_s* %21, null
  br i1 %22, label %25, label %23

; <label>:23:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 10)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 10)
  call void @enter_phonemes()
  br label %25

; <label>:25:                                     ; preds = %23, %3
  br label %26

; <label>:26:                                     ; preds = %116, %25
  %27 = load i8*, i8** %8, align 8
  %28 = load i8*, i8** %10, align 8
  %29 = icmp ult i8* %27, %28
  br i1 %29, label %30, label %36

; <label>:30:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 3)
  %32 = load i8*, i8** %8, align 8
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = icmp ne i32 %34, 0
  br label %36

; <label>:36:                                     ; preds = %30, %26
  %37 = phi i1 [ false, %26 ], [ %35, %30 ]
  br i1 %37, label %38, label %117

; <label>:38:                                     ; preds = %36
  %39 = call i8* @trie_lookup(%struct.trie_s** @phtoelm, i8** %8)
  store i8* %39, i8** %11, align 8
  %40 = load i8*, i8** %11, align 8
  %41 = icmp ne i8* %40, null
  br i1 %41, label %42, label %93

; <label>:42:                                     ; preds = %38
  %43 = load i8*, i8** %11, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %11, align 8
  %45 = load i8, i8* %43, align 1
  %46 = sext i8 %45 to i32
  store i32 %46, i32* %12, align 4
  br label %47

; <label>:47:                                     ; preds = %70, %42
  %48 = load i32, i32* %12, align 4
  %49 = add nsw i32 %48, -1
  store i32 %49, i32* %12, align 4
  %50 = icmp sgt i32 %48, 0
  br i1 %50, label %51, label %91

; <label>:51:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 0)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 0)
  %53 = load i8*, i8** %11, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %11, align 8
  %55 = load i8, i8* %53, align 1
  %56 = sext i8 %55 to i32
  store i32 %56, i32* %13, align 4
  %57 = load i32, i32* %13, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i64 0, i64 %58
  store %struct.Elm_s* %59, %struct.Elm_s** %14, align 8
  %60 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %61 = load i32, i32* %13, align 4
  %62 = call i32 @phone_append(%struct.darray_t* %60, i32 %61)
  %63 = load %struct.Elm_s*, %struct.Elm_s** %14, align 8
  %64 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %63, i32 0, i32 7
  %65 = load i64, i64* %64, align 8
  %66 = and i64 %65, 268435456
  %67 = icmp ne i64 %66, 0
  br i1 %67, label %70, label %68

; <label>:68:                                     ; preds = %51
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 1)
  %69 = add i64 %pgocount3, 1
  store i64 %69, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 1)
  store i32 0, i32* %7, align 4
  br label %70

; <label>:70:                                     ; preds = %68, %51
  %71 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %72 = load i32, i32* %7, align 4
  %73 = load %struct.Elm_s*, %struct.Elm_s** %14, align 8
  %74 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %73, i32 0, i32 2
  %75 = load i8, i8* %74, align 1
  %76 = sext i8 %75 to i32
  %77 = load %struct.Elm_s*, %struct.Elm_s** %14, align 8
  %78 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %77, i32 0, i32 3
  %79 = load i8, i8* %78, align 2
  %80 = sext i8 %79 to i32
  %81 = add nsw i32 %76, %80
  %82 = sdiv i32 %81, 2
  %83 = load i32, i32* @speed, align 4
  %84 = mul nsw i32 %82, %83
  %85 = call i32 @phone_append(%struct.darray_t* %71, i32 %84)
  %86 = load i32, i32* %9, align 4
  %87 = add i32 %86, %85
  store i32 %87, i32* %9, align 4
  %88 = load %struct.darray_t*, %struct.darray_t** %6, align 8
  %89 = load i32, i32* %7, align 4
  %90 = call i32 @phone_append(%struct.darray_t* %88, i32 %89)
  br label %47

; <label>:91:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 2)
  %92 = add i64 %pgocount4, 1
  store i64 %92, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 2)
  br label %116

; <label>:93:                                     ; preds = %38
  %94 = load i8*, i8** %8, align 8
  %95 = getelementptr inbounds i8, i8* %94, i32 1
  store i8* %95, i8** %8, align 8
  %96 = load i8, i8* %94, align 1
  store i8 %96, i8* %15, align 1
  %97 = load i8, i8* %15, align 1
  %98 = sext i8 %97 to i32
  switch i32 %98, label %107 [
    i32 39, label %99
    i32 44, label %101
    i32 43, label %103
    i32 45, label %105
  ]

; <label>:99:                                     ; preds = %93
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 4)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 4)
  store i32 3, i32* %7, align 4
  br label %115

; <label>:101:                                    ; preds = %93
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 5)
  %102 = add i64 %pgocount6, 1
  store i64 %102, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 5)
  store i32 2, i32* %7, align 4
  br label %115

; <label>:103:                                    ; preds = %93
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 6)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 6)
  store i32 1, i32* %7, align 4
  br label %115

; <label>:105:                                    ; preds = %93
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 7)
  %106 = add i64 %pgocount8, 1
  store i64 %106, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 7)
  br label %115

; <label>:107:                                    ; preds = %93
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 8)
  %108 = add i64 %pgocount9, 1
  store i64 %108, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 8)
  %109 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %110 = load i8, i8* %15, align 1
  %111 = sext i8 %110 to i32
  %112 = load i32, i32* %5, align 4
  %113 = load i8*, i8** %4, align 8
  %114 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %109, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0), i32 %111, i32 %112, i8* %113)
  br label %115

; <label>:115:                                    ; preds = %107, %105, %103, %101, %99
  br label %116

; <label>:116:                                    ; preds = %115, %91
  br label %26

; <label>:117:                                    ; preds = %36
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 9)
  %118 = add i64 %pgocount10, 1
  store i64 %118, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_phone_to_elm, i64 0, i64 9)
  %119 = load i32, i32* %9, align 4
  ret i32 %119
}

; Function Attrs: nounwind uwtable
define internal void @enter_phonemes() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_enter_phonemes, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_enter_phonemes, i64 0, i64 0)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.11, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.12, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.15, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.17, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.18, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.19, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.20, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.22, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.23, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.24, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.25, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.26, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.27, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.28, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.29, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.30, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.31, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.31, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.32, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.33, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.34, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.35, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.36, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.37, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.37, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.38, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.39, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.40, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.41, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.21, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.44, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.45, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.46, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.48, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.47, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.49, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.50, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.51, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.52, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.53, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.54, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.55, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.56, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.57, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.58, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.60, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.59, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.61, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.62, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.63, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.64, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.65, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.66, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.43, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.67, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.68, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.70, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.71, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.72, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.73, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.42, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.75, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.76, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.74, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.77, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.78, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.79, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.80, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.81, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.82, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.83, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.79, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.84, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.76, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.85, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.86, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.87, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.88, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.89, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.90, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.91, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.92, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.93, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.94, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.69, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.95, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.96, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.97, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.98, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.99, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.97, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.100, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.101, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.102, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.103, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.104, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.102, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.105, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.106, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.102, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.107, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.108, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.102, i32 0, i32 0), i8* null)
  call void (i8*, ...) @enter(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.109, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.89, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.97, i32 0, i32 0), i8* null)
  ret void
}

declare i8* @trie_lookup(%struct.trie_s**, i8**) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

declare i8* @Darray_find(%struct.darray_t*, i32) #2

; Function Attrs: nounwind uwtable
define internal void @enter(i8*, ...) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca [1 x %struct.__va_list_tag], align 16
  %4 = alloca i8*, align 8
  %5 = alloca [20 x i8], align 16
  %6 = alloca i8*, align 8
  %7 = alloca %struct.Elm_s*, align 8
  store i8* %0, i8** %2, align 8
  %8 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i32 0, i32 0
  %9 = getelementptr inbounds i8, i8* %8, i64 1
  store i8* %9, i8** %6, align 8
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  br label %12

; <label>:12:                                     ; preds = %52, %1
  %13 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %14 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 0
  %15 = load i32, i32* %14, align 16
  %16 = icmp ule i32 %15, 40
  br i1 %16, label %17, label %24

; <label>:17:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 0)
  %19 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 3
  %20 = load i8*, i8** %19, align 16
  %21 = getelementptr i8, i8* %20, i32 %15
  %22 = bitcast i8* %21 to i8**
  %23 = add i32 %15, 8
  store i32 %23, i32* %14, align 16
  br label %30

; <label>:24:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 1)
  %26 = getelementptr inbounds %struct.__va_list_tag, %struct.__va_list_tag* %13, i32 0, i32 2
  %27 = load i8*, i8** %26, align 8
  %28 = bitcast i8* %27 to i8**
  %29 = getelementptr i8, i8* %27, i32 8
  store i8* %29, i8** %26, align 8
  br label %30

; <label>:30:                                     ; preds = %24, %17
  %31 = phi i8** [ %22, %17 ], [ %28, %24 ]
  %32 = load i8*, i8** %31, align 8
  store i8* %32, i8** %4, align 8
  %33 = icmp ne i8* %32, null
  br i1 %33, label %34, label %53

; <label>:34:                                     ; preds = %30
  %35 = load i8*, i8** %4, align 8
  %36 = call %struct.Elm_s* @find_elm(i8* %35)
  store %struct.Elm_s* %36, %struct.Elm_s** %7, align 8
  %37 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %38 = icmp ne %struct.Elm_s* %37, null
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %34
  %40 = load %struct.Elm_s*, %struct.Elm_s** %7, align 8
  %41 = ptrtoint %struct.Elm_s* %40 to i64
  %42 = sub i64 %41, ptrtoint ([0 x %struct.Elm_s]* @Elements to i64)
  %43 = sdiv exact i64 %42, 272
  %44 = trunc i64 %43 to i8
  %45 = load i8*, i8** %6, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %6, align 8
  store i8 %44, i8* %45, align 1
  br label %52

; <label>:47:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 2)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 2)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %50 = load i8*, i8** %4, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.110, i32 0, i32 0), i8* %50)
  br label %52

; <label>:52:                                     ; preds = %47, %39
  br label %12

; <label>:53:                                     ; preds = %30
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 3)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_enter, i64 0, i64 3)
  %55 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %3, i32 0, i32 0
  %56 = bitcast %struct.__va_list_tag* %55 to i8*
  call void @llvm.va_end(i8* %56)
  %57 = load i8*, i8** %6, align 8
  %58 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i32 0, i32 0
  %59 = ptrtoint i8* %57 to i64
  %60 = ptrtoint i8* %58 to i64
  %61 = sub i64 %59, %60
  %62 = sub nsw i64 %61, 1
  %63 = trunc i64 %62 to i8
  %64 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i64 0, i64 0
  store i8 %63, i8* %64, align 16
  %65 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i64 0, i64 0
  %66 = load i8, i8* %65, align 16
  %67 = sext i8 %66 to i32
  %68 = add nsw i32 %67, 1
  %69 = sext i32 %68 to i64
  %70 = call noalias i8* @malloc(i64 %69) #3
  store i8* %70, i8** %6, align 8
  %71 = load i8*, i8** %6, align 8
  %72 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i32 0, i32 0
  %73 = getelementptr inbounds [20 x i8], [20 x i8]* %5, i64 0, i64 0
  %74 = load i8, i8* %73, align 16
  %75 = sext i8 %74 to i32
  %76 = add nsw i32 %75, 1
  %77 = sext i32 %76 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %71, i8* %72, i64 %77, i32 1, i1 false)
  %78 = load i8*, i8** %2, align 8
  %79 = load i8*, i8** %6, align 8
  call void @trie_insert(%struct.trie_s** @phtoelm, i8* %78, i8* %79)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #3

; Function Attrs: nounwind uwtable
define internal %struct.Elm_s* @find_elm(i8*) #0 {
  %2 = alloca %struct.Elm_s*, align 8
  %3 = alloca i8*, align 8
  %4 = alloca %struct.Elm_s*, align 8
  store i8* %0, i8** %3, align 8
  store %struct.Elm_s* getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i32 0, i32 0), %struct.Elm_s** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %21, %1
  %6 = load %struct.Elm_s*, %struct.Elm_s** %4, align 8
  %7 = load i32, i32* @num_Elements, align 4
  %8 = zext i32 %7 to i64
  %9 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* getelementptr inbounds ([0 x %struct.Elm_s], [0 x %struct.Elm_s]* @Elements, i32 0, i32 0), i64 %8
  %10 = icmp ult %struct.Elm_s* %6, %9
  br i1 %10, label %11, label %25

; <label>:11:                                     ; preds = %5
  %12 = load i8*, i8** %3, align 8
  %13 = load %struct.Elm_s*, %struct.Elm_s** %4, align 8
  %14 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = call i32 @strcmp(i8* %12, i8* %15) #7
  %17 = icmp ne i32 %16, 0
  br i1 %17, label %21, label %18

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 2)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 2)
  %20 = load %struct.Elm_s*, %struct.Elm_s** %4, align 8
  store %struct.Elm_s* %20, %struct.Elm_s** %2, align 8
  br label %27

; <label>:21:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 0)
  %23 = load %struct.Elm_s*, %struct.Elm_s** %4, align 8
  %24 = getelementptr inbounds %struct.Elm_s, %struct.Elm_s* %23, i32 1
  store %struct.Elm_s* %24, %struct.Elm_s** %4, align 8
  br label %5

; <label>:25:                                     ; preds = %5
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 1)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_find_elm, i64 0, i64 1)
  store %struct.Elm_s* null, %struct.Elm_s** %2, align 8
  br label %27

; <label>:27:                                     ; preds = %25, %18
  %28 = load %struct.Elm_s*, %struct.Elm_s** %2, align 8
  ret %struct.Elm_s* %28
}

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #3

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

declare void @trie_insert(%struct.trie_s**, i8*, i8*) #2

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #6

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { argmemonly nounwind }
attributes #6 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #7 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

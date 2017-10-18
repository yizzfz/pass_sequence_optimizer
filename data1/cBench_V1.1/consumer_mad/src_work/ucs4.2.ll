; ModuleID = 'tmp1.ll'
source_filename = "ucs4.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@id3_ucs4_empty = constant [1 x i64] zeroinitializer, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_ucs4_length = private constant [15 x i8] c"id3_ucs4_length"
@__profn_id3_ucs4_size = private constant [13 x i8] c"id3_ucs4_size"
@__profn_id3_ucs4_latin1size = private constant [19 x i8] c"id3_ucs4_latin1size"
@__profn_id3_ucs4_utf16size = private constant [18 x i8] c"id3_ucs4_utf16size"
@__profn_id3_ucs4_utf8size = private constant [17 x i8] c"id3_ucs4_utf8size"
@__profn_id3_ucs4_latin1duplicate = private constant [24 x i8] c"id3_ucs4_latin1duplicate"
@__profn_id3_ucs4_utf16duplicate = private constant [23 x i8] c"id3_ucs4_utf16duplicate"
@__profn_id3_ucs4_utf8duplicate = private constant [22 x i8] c"id3_ucs4_utf8duplicate"
@__profn_id3_ucs4_copy = private constant [13 x i8] c"id3_ucs4_copy"
@__profn_id3_ucs4_duplicate = private constant [18 x i8] c"id3_ucs4_duplicate"
@__profn_id3_ucs4_putnumber = private constant [18 x i8] c"id3_ucs4_putnumber"
@__profn_id3_ucs4_getnumber = private constant [18 x i8] c"id3_ucs4_getnumber"
@__profc_id3_ucs4_length = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5302275996272281974, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_length, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_length to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_size = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6529631908537080543, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_size, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_size to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_latin1size = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_latin1size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7124933939390891167, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_latin1size, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_latin1size to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_utf16size = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_utf16size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6468350660240134518, i64 50360214718, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_utf16size to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_utf8size = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_utf8size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -227968269808079863, i64 129145785934, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_utf8size to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_latin1duplicate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_latin1duplicate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5161833549831420012, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_latin1duplicate, i32 0, i32 0), i8* bitcast (i8* (i64*)* @id3_ucs4_latin1duplicate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_utf16duplicate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_utf16duplicate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8203634048003521994, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf16duplicate, i32 0, i32 0), i8* bitcast (i16* (i64*)* @id3_ucs4_utf16duplicate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_utf8duplicate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_utf8duplicate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5537685222509056323, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf8duplicate, i32 0, i32 0), i8* bitcast (i8* (i64*)* @id3_ucs4_utf8duplicate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_copy = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_copy = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1559544722672513983, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_copy, i32 0, i32 0), i8* bitcast (void (i64*, i64*)* @id3_ucs4_copy to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_duplicate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_duplicate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3537429392676354387, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_duplicate, i32 0, i32 0), i8* bitcast (i64* (i64*)* @id3_ucs4_duplicate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_putnumber = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_putnumber = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5044772171013538505, i64 46762755819, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i32 0, i32 0), i8* bitcast (void (i64*, i64)* @id3_ucs4_putnumber to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_ucs4_getnumber = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_ucs4_getnumber = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8748262232740110434, i64 39911148230, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i32 0, i32 0), i8* bitcast (i64 (i64*)* @id3_ucs4_getnumber to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [232 x i8] c"\E5\01\00id3_ucs4_length\01id3_ucs4_size\01id3_ucs4_latin1size\01id3_ucs4_utf16size\01id3_ucs4_utf8size\01id3_ucs4_latin1duplicate\01id3_ucs4_utf16duplicate\01id3_ucs4_utf8duplicate\01id3_ucs4_copy\01id3_ucs4_duplicate\01id3_ucs4_putnumber\01id3_ucs4_getnumber", section "__llvm_prf_names"
@llvm.used = appending global [13 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_latin1size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_utf16size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_utf8size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_latin1duplicate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_utf16duplicate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_utf8duplicate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_copy to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_duplicate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_putnumber to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_ucs4_getnumber to i8*), i8* getelementptr inbounds ([232 x i8], [232 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_length(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64*, align 8
  store i64* %0, i64** %2, align 8
  %4 = load i64*, i64** %2, align 8
  store i64* %4, i64** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %9, %1
  %6 = load i64*, i64** %3, align 8
  %7 = load i64, i64* %6, align 8
  %8 = icmp ne i64 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_length, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_length, i64 0, i64 0)
  %11 = load i64*, i64** %3, align 8
  %12 = getelementptr inbounds i64, i64* %11, i32 1
  store i64* %12, i64** %3, align 8
  br label %5

; <label>:13:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_length, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_length, i64 0, i64 1)
  %15 = load i64*, i64** %3, align 8
  %16 = load i64*, i64** %2, align 8
  %17 = ptrtoint i64* %15 to i64
  %18 = ptrtoint i64* %16 to i64
  %19 = sub i64 %17, %18
  %20 = sdiv exact i64 %19, 8
  ret i64 %20
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_size(i64*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_size, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_size, i64 0, i64 0)
  %3 = alloca i64*, align 8
  store i64* %0, i64** %3, align 8
  %4 = load i64*, i64** %3, align 8
  %5 = call i64 @id3_ucs4_length(i64* %4)
  %6 = add i64 %5, 1
  ret i64 %6
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_latin1size(i64*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_latin1size, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_ucs4_latin1size, i64 0, i64 0)
  %3 = alloca i64*, align 8
  store i64* %0, i64** %3, align 8
  %4 = load i64*, i64** %3, align 8
  %5 = call i64 @id3_ucs4_size(i64* %4)
  ret i64 %5
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_utf16size(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64, align 8
  store i64* %0, i64** %2, align 8
  store i64 0, i64* %3, align 8
  br label %4

; <label>:4:                                      ; preds = %23, %1
  %5 = load i64*, i64** %2, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %27

; <label>:8:                                      ; preds = %4
  %9 = load i64, i64* %3, align 8
  %10 = add i64 %9, 1
  store i64 %10, i64* %3, align 8
  %11 = load i64*, i64** %2, align 8
  %12 = load i64, i64* %11, align 8
  %13 = icmp uge i64 %12, 65536
  br i1 %13, label %14, label %23

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 1)
  %16 = load i64*, i64** %2, align 8
  %17 = load i64, i64* %16, align 8
  %18 = icmp ule i64 %17, 1114111
  br i1 %18, label %19, label %23

; <label>:19:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 2)
  %21 = load i64, i64* %3, align 8
  %22 = add i64 %21, 1
  store i64 %22, i64* %3, align 8
  br label %23

; <label>:23:                                     ; preds = %19, %14, %8
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 0)
  %25 = load i64*, i64** %2, align 8
  %26 = getelementptr inbounds i64, i64* %25, i32 1
  store i64* %26, i64** %2, align 8
  br label %4

; <label>:27:                                     ; preds = %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 3)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_ucs4_utf16size, i64 0, i64 3)
  %29 = load i64, i64* %3, align 8
  %30 = add i64 %29, 1
  ret i64 %30
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_utf8size(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64, align 8
  store i64* %0, i64** %2, align 8
  store i64 0, i64* %3, align 8
  br label %4

; <label>:4:                                      ; preds = %65, %1
  %5 = load i64*, i64** %2, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %68

; <label>:8:                                      ; preds = %4
  %9 = load i64*, i64** %2, align 8
  %10 = load i64, i64* %9, align 8
  %11 = icmp ule i64 %10, 127
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 0)
  %14 = load i64, i64* %3, align 8
  %15 = add i64 %14, 1
  store i64 %15, i64* %3, align 8
  br label %65

; <label>:16:                                     ; preds = %8
  %17 = load i64*, i64** %2, align 8
  %18 = load i64, i64* %17, align 8
  %19 = icmp ule i64 %18, 2047
  br i1 %19, label %20, label %24

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 1)
  %22 = load i64, i64* %3, align 8
  %23 = add i64 %22, 2
  store i64 %23, i64* %3, align 8
  br label %64

; <label>:24:                                     ; preds = %16
  %25 = load i64*, i64** %2, align 8
  %26 = load i64, i64* %25, align 8
  %27 = icmp ule i64 %26, 65535
  br i1 %27, label %28, label %32

; <label>:28:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 2)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 2)
  %30 = load i64, i64* %3, align 8
  %31 = add i64 %30, 3
  store i64 %31, i64* %3, align 8
  br label %63

; <label>:32:                                     ; preds = %24
  %33 = load i64*, i64** %2, align 8
  %34 = load i64, i64* %33, align 8
  %35 = icmp ule i64 %34, 2097151
  br i1 %35, label %36, label %40

; <label>:36:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 3)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 3)
  %38 = load i64, i64* %3, align 8
  %39 = add i64 %38, 4
  store i64 %39, i64* %3, align 8
  br label %62

; <label>:40:                                     ; preds = %32
  %41 = load i64*, i64** %2, align 8
  %42 = load i64, i64* %41, align 8
  %43 = icmp ule i64 %42, 67108863
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 5)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 5)
  %46 = load i64, i64* %3, align 8
  %47 = add i64 %46, 5
  store i64 %47, i64* %3, align 8
  br label %61

; <label>:48:                                     ; preds = %40
  %49 = load i64*, i64** %2, align 8
  %50 = load i64, i64* %49, align 8
  %51 = icmp ule i64 %50, 2147483647
  br i1 %51, label %52, label %56

; <label>:52:                                     ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 6)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 6)
  %54 = load i64, i64* %3, align 8
  %55 = add i64 %54, 6
  store i64 %55, i64* %3, align 8
  br label %60

; <label>:56:                                     ; preds = %48
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 7)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 7)
  %58 = load i64, i64* %3, align 8
  %59 = add i64 %58, 2
  store i64 %59, i64* %3, align 8
  br label %60

; <label>:60:                                     ; preds = %56, %52
  br label %61

; <label>:61:                                     ; preds = %60, %44
  br label %62

; <label>:62:                                     ; preds = %61, %36
  br label %63

; <label>:63:                                     ; preds = %62, %28
  br label %64

; <label>:64:                                     ; preds = %63, %20
  br label %65

; <label>:65:                                     ; preds = %64, %12
  %66 = load i64*, i64** %2, align 8
  %67 = getelementptr inbounds i64, i64* %66, i32 1
  store i64* %67, i64** %2, align 8
  br label %4

; <label>:68:                                     ; preds = %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 4)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_ucs4_utf8size, i64 0, i64 4)
  %70 = load i64, i64* %3, align 8
  %71 = add i64 %70, 1
  ret i64 %71
}

; Function Attrs: noinline nounwind uwtable
define i8* @id3_ucs4_latin1duplicate(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  store i64* %0, i64** %2, align 8
  %4 = load i64*, i64** %2, align 8
  %5 = call i64 @id3_ucs4_latin1size(i64* %4)
  %6 = mul i64 %5, 1
  %7 = call noalias i8* @malloc(i64 %6) #3
  store i8* %7, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_latin1duplicate, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_latin1duplicate, i64 0, i64 1)
  %12 = load i8*, i8** %3, align 8
  %13 = load i64*, i64** %2, align 8
  call void @id3_latin1_encode(i8* %12, i64* %13)
  br label %14

; <label>:14:                                     ; preds = %10, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_latin1duplicate, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_latin1duplicate, i64 0, i64 0)
  %16 = load i8*, i8** %3, align 8
  ret i8* %16
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare void @id3_latin1_encode(i8*, i64*) #2

; Function Attrs: noinline nounwind uwtable
define i16* @id3_ucs4_utf16duplicate(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i16*, align 8
  store i64* %0, i64** %2, align 8
  %4 = load i64*, i64** %2, align 8
  %5 = call i64 @id3_ucs4_utf16size(i64* %4)
  %6 = mul i64 %5, 2
  %7 = call noalias i8* @malloc(i64 %6) #3
  %8 = bitcast i8* %7 to i16*
  store i16* %8, i16** %3, align 8
  %9 = load i16*, i16** %3, align 8
  %10 = icmp ne i16* %9, null
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf16duplicate, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf16duplicate, i64 0, i64 1)
  %13 = load i16*, i16** %3, align 8
  %14 = load i64*, i64** %2, align 8
  call void @id3_utf16_encode(i16* %13, i64* %14)
  br label %15

; <label>:15:                                     ; preds = %11, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf16duplicate, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf16duplicate, i64 0, i64 0)
  %17 = load i16*, i16** %3, align 8
  ret i16* %17
}

declare void @id3_utf16_encode(i16*, i64*) #2

; Function Attrs: noinline nounwind uwtable
define i8* @id3_ucs4_utf8duplicate(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i8*, align 8
  store i64* %0, i64** %2, align 8
  %4 = load i64*, i64** %2, align 8
  %5 = call i64 @id3_ucs4_utf8size(i64* %4)
  %6 = mul i64 %5, 1
  %7 = call noalias i8* @malloc(i64 %6) #3
  store i8* %7, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf8duplicate, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf8duplicate, i64 0, i64 1)
  %12 = load i8*, i8** %3, align 8
  %13 = load i64*, i64** %2, align 8
  call void @id3_utf8_encode(i8* %12, i64* %13)
  br label %14

; <label>:14:                                     ; preds = %10, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf8duplicate, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_utf8duplicate, i64 0, i64 0)
  %16 = load i8*, i8** %3, align 8
  ret i8* %16
}

declare void @id3_utf8_encode(i8*, i64*) #2

; Function Attrs: noinline nounwind uwtable
define void @id3_ucs4_copy(i64*, i64*) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i64*, align 8
  store i64* %0, i64** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %6 = load i64*, i64** %4, align 8
  %7 = getelementptr inbounds i64, i64* %6, i32 1
  store i64* %7, i64** %4, align 8
  %8 = load i64, i64* %6, align 8
  %9 = load i64*, i64** %3, align 8
  %10 = getelementptr inbounds i64, i64* %9, i32 1
  store i64* %10, i64** %3, align 8
  store i64 %8, i64* %9, align 8
  %11 = icmp ne i64 %8, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_copy, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_copy, i64 0, i64 0)
  br label %5

; <label>:14:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_copy, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_copy, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64* @id3_ucs4_duplicate(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64*, align 8
  store i64* %0, i64** %2, align 8
  %4 = load i64*, i64** %2, align 8
  %5 = call i64 @id3_ucs4_size(i64* %4)
  %6 = mul i64 %5, 8
  %7 = call noalias i8* @malloc(i64 %6) #3
  %8 = bitcast i8* %7 to i64*
  store i64* %8, i64** %3, align 8
  %9 = load i64*, i64** %3, align 8
  %10 = icmp ne i64* %9, null
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_duplicate, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_duplicate, i64 0, i64 1)
  %13 = load i64*, i64** %3, align 8
  %14 = load i64*, i64** %2, align 8
  call void @id3_ucs4_copy(i64* %13, i64* %14)
  br label %15

; <label>:15:                                     ; preds = %11, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_duplicate, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_ucs4_duplicate, i64 0, i64 0)
  %17 = load i64*, i64** %3, align 8
  ret i64* %17
}

; Function Attrs: noinline nounwind uwtable
define void @id3_ucs4_putnumber(i64*, i64) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i64, align 8
  %5 = alloca [10 x i32], align 16
  %6 = alloca i32*, align 8
  store i64* %0, i64** %3, align 8
  store i64 %1, i64* %4, align 8
  %7 = getelementptr inbounds [10 x i32], [10 x i32]* %5, i32 0, i32 0
  store i32* %7, i32** %6, align 8
  br label %8

; <label>:8:                                      ; preds = %17, %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 0)
  %10 = load i64, i64* %4, align 8
  %11 = urem i64 %10, 10
  %12 = trunc i64 %11 to i32
  %13 = load i32*, i32** %6, align 8
  %14 = getelementptr inbounds i32, i32* %13, i32 1
  store i32* %14, i32** %6, align 8
  store i32 %12, i32* %13, align 4
  %15 = load i64, i64* %4, align 8
  %16 = udiv i64 %15, 10
  store i64 %16, i64* %4, align 8
  br label %17

; <label>:17:                                     ; preds = %8
  %18 = load i64, i64* %4, align 8
  %19 = icmp ne i64 %18, 0
  br i1 %19, label %8, label %20

; <label>:20:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 2)
  br label %22

; <label>:22:                                     ; preds = %26, %20
  %23 = load i32*, i32** %6, align 8
  %24 = getelementptr inbounds [10 x i32], [10 x i32]* %5, i32 0, i32 0
  %25 = icmp ne i32* %23, %24
  br i1 %25, label %26, label %35

; <label>:26:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 1)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_putnumber, i64 0, i64 1)
  %28 = load i32*, i32** %6, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 -1
  store i32* %29, i32** %6, align 8
  %30 = load i32, i32* %29, align 4
  %31 = add nsw i32 48, %30
  %32 = sext i32 %31 to i64
  %33 = load i64*, i64** %3, align 8
  %34 = getelementptr inbounds i64, i64* %33, i32 1
  store i64* %34, i64** %3, align 8
  store i64 %32, i64* %33, align 8
  br label %22

; <label>:35:                                     ; preds = %22
  %36 = load i64*, i64** %3, align 8
  store i64 0, i64* %36, align 8
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_ucs4_getnumber(i64*) #0 {
  %2 = alloca i64*, align 8
  %3 = alloca i64, align 8
  store i64* %0, i64** %2, align 8
  store i64 0, i64* %3, align 8
  br label %4

; <label>:4:                                      ; preds = %15, %1
  %5 = load i64*, i64** %2, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp uge i64 %6, 48
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 1)
  %10 = load i64*, i64** %2, align 8
  %11 = load i64, i64* %10, align 8
  %12 = icmp ule i64 %11, 57
  br label %13

; <label>:13:                                     ; preds = %8, %4
  %14 = phi i1 [ false, %4 ], [ %12, %8 ]
  br i1 %14, label %15, label %24

; <label>:15:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 0)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 0)
  %17 = load i64, i64* %3, align 8
  %18 = mul i64 10, %17
  %19 = load i64*, i64** %2, align 8
  %20 = getelementptr inbounds i64, i64* %19, i32 1
  store i64* %20, i64** %2, align 8
  %21 = load i64, i64* %19, align 8
  %22 = sub i64 %21, 48
  %23 = add i64 %18, %22
  store i64 %23, i64* %3, align 8
  br label %4

; <label>:24:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 2)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_ucs4_getnumber, i64 0, i64 2)
  %26 = load i64, i64* %3, align 8
  ret i64 %26
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

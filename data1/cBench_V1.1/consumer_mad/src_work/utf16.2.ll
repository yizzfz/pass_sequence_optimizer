; ModuleID = 'tmp1.ll'
source_filename = "utf16.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_utf16_length = private constant [16 x i8] c"id3_utf16_length"
@__profn_id3_utf16_size = private constant [14 x i8] c"id3_utf16_size"
@__profn_id3_utf16_decodechar = private constant [20 x i8] c"id3_utf16_decodechar"
@__profn_id3_utf16_encodechar = private constant [20 x i8] c"id3_utf16_encodechar"
@__profn_id3_utf16_decode = private constant [16 x i8] c"id3_utf16_decode"
@__profn_id3_utf16_encode = private constant [16 x i8] c"id3_utf16_encode"
@__profn_id3_utf16_put = private constant [13 x i8] c"id3_utf16_put"
@__profn_id3_utf16_get = private constant [13 x i8] c"id3_utf16_get"
@__profn_id3_utf16_serialize = private constant [19 x i8] c"id3_utf16_serialize"
@__profn_id3_utf16_deserialize = private constant [21 x i8] c"id3_utf16_deserialize"
@__profc_id3_utf16_length = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9068312832621437632, i64 91965168293, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i32 0, i32 0), i8* bitcast (i64 (i16*)* @id3_utf16_length to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_size = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5195284170710725295, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_size, i32 0, i32 0), i8* bitcast (i64 (i16*)* @id3_utf16_size to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_decodechar = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_decodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4484947527037825304, i64 83367598302, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i32 0, i32 0), i8* bitcast (i64 (i16*, i64*)* @id3_utf16_decodechar to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_encodechar = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_encodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2819628835438915424, i64 44213347061, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i32 0, i32 0), i8* bitcast (i64 (i16*, i64)* @id3_utf16_encodechar to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_decode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7033664820179668039, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_decode, i32 0, i32 0), i8* bitcast (void (i16*, i64*)* @id3_utf16_decode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_encode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7004601204339721024, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_encode, i32 0, i32 0), i8* bitcast (void (i16*, i64*)* @id3_utf16_encode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_put = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_put = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8787809977656383072, i64 50761624137, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i32 0, i32 0), i8* bitcast (i64 (i8**, i16, i32)* @id3_utf16_put to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_get = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_get = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2128101911746041709, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i32 0, i32 0), i8* bitcast (i16 (i8**, i32)* @id3_utf16_get to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_serialize = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_serialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1691116609554103476, i64 84978572886, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i32 0, i32 0), i8* bitcast (i64 (i8**, i64*, i32, i32)* @id3_utf16_serialize to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf16_deserialize = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf16_deserialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -426147919137830539, i64 113955547370, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i32 0, i32 0), i8* bitcast (i64* (i8**, i64, i32)* @id3_utf16_deserialize to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [180 x i8] c"\B1\01\00id3_utf16_length\01id3_utf16_size\01id3_utf16_decodechar\01id3_utf16_encodechar\01id3_utf16_decode\01id3_utf16_encode\01id3_utf16_put\01id3_utf16_get\01id3_utf16_serialize\01id3_utf16_deserialize", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_decodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_encodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_put to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_get to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_serialize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf16_deserialize to i8*), i8* getelementptr inbounds ([180 x i8], [180 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_length(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i64, align 8
  store i16* %0, i16** %2, align 8
  store i64 0, i64* %3, align 8
  br label %4

; <label>:4:                                      ; preds = %60, %1
  %5 = load i16*, i16** %2, align 8
  %6 = load i16, i16* %5, align 2
  %7 = icmp ne i16 %6, 0
  br i1 %7, label %8, label %63

; <label>:8:                                      ; preds = %4
  %9 = load i16*, i16** %2, align 8
  %10 = getelementptr inbounds i16, i16* %9, i64 0
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp slt i32 %12, 55296
  br i1 %13, label %21, label %14

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 1)
  %16 = load i16*, i16** %2, align 8
  %17 = getelementptr inbounds i16, i16* %16, i64 0
  %18 = load i16, i16* %17, align 2
  %19 = zext i16 %18 to i32
  %20 = icmp sgt i32 %19, 57343
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %14, %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 0)
  %23 = load i64, i64* %3, align 8
  %24 = add i64 %23, 1
  store i64 %24, i64* %3, align 8
  br label %60

; <label>:25:                                     ; preds = %14
  %26 = load i16*, i16** %2, align 8
  %27 = getelementptr inbounds i16, i16* %26, i64 0
  %28 = load i16, i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = icmp sge i32 %29, 55296
  br i1 %30, label %31, label %58

; <label>:31:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 3)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 3)
  %33 = load i16*, i16** %2, align 8
  %34 = getelementptr inbounds i16, i16* %33, i64 0
  %35 = load i16, i16* %34, align 2
  %36 = zext i16 %35 to i32
  %37 = icmp sle i32 %36, 56319
  br i1 %37, label %38, label %58

; <label>:38:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 4)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 4)
  %40 = load i16*, i16** %2, align 8
  %41 = getelementptr inbounds i16, i16* %40, i64 1
  %42 = load i16, i16* %41, align 2
  %43 = zext i16 %42 to i32
  %44 = icmp sge i32 %43, 56320
  br i1 %44, label %45, label %58

; <label>:45:                                     ; preds = %38
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 6)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 6)
  %47 = load i16*, i16** %2, align 8
  %48 = getelementptr inbounds i16, i16* %47, i64 1
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = icmp sle i32 %50, 57343
  br i1 %51, label %52, label %58

; <label>:52:                                     ; preds = %45
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 7)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 7)
  %54 = load i64, i64* %3, align 8
  %55 = add i64 %54, 1
  store i64 %55, i64* %3, align 8
  %56 = load i16*, i16** %2, align 8
  %57 = getelementptr inbounds i16, i16* %56, i32 1
  store i16* %57, i16** %2, align 8
  br label %58

; <label>:58:                                     ; preds = %52, %45, %38, %31, %25
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 2)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 2)
  br label %60

; <label>:60:                                     ; preds = %58, %21
  %61 = load i16*, i16** %2, align 8
  %62 = getelementptr inbounds i16, i16* %61, i32 1
  store i16* %62, i16** %2, align 8
  br label %4

; <label>:63:                                     ; preds = %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 5)
  %64 = add i64 %pgocount7, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_utf16_length, i64 0, i64 5)
  %65 = load i64, i64* %3, align 8
  ret i64 %65
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_size(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  store i16* %0, i16** %2, align 8
  %4 = load i16*, i16** %2, align 8
  store i16* %4, i16** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %9, %1
  %6 = load i16*, i16** %3, align 8
  %7 = load i16, i16* %6, align 2
  %8 = icmp ne i16 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_size, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_size, i64 0, i64 0)
  %11 = load i16*, i16** %3, align 8
  %12 = getelementptr inbounds i16, i16* %11, i32 1
  store i16* %12, i16** %3, align 8
  br label %5

; <label>:13:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_size, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_size, i64 0, i64 1)
  %15 = load i16*, i16** %3, align 8
  %16 = load i16*, i16** %2, align 8
  %17 = ptrtoint i16* %15 to i64
  %18 = ptrtoint i16* %16 to i64
  %19 = sub i64 %17, %18
  %20 = sdiv exact i64 %19, 2
  %21 = add nsw i64 %20, 1
  ret i64 %21
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_decodechar(i16*, i64*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i16*, align 8
  store i16* %0, i16** %4, align 8
  store i64* %1, i64** %5, align 8
  %7 = load i16*, i16** %4, align 8
  store i16* %7, i16** %6, align 8
  br label %8

; <label>:8:                                      ; preds = %87, %2
  %9 = load i16*, i16** %4, align 8
  %10 = getelementptr inbounds i16, i16* %9, i64 0
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp slt i32 %12, 55296
  br i1 %13, label %21, label %14

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 0)
  %16 = load i16*, i16** %4, align 8
  %17 = getelementptr inbounds i16, i16* %16, i64 0
  %18 = load i16, i16* %17, align 2
  %19 = zext i16 %18 to i32
  %20 = icmp sgt i32 %19, 57343
  br i1 %20, label %21, label %35

; <label>:21:                                     ; preds = %14, %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 5)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 5)
  %23 = load i16*, i16** %4, align 8
  %24 = getelementptr inbounds i16, i16* %23, i64 0
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i64
  %27 = load i64*, i64** %5, align 8
  store i64 %26, i64* %27, align 8
  %28 = load i16*, i16** %4, align 8
  %29 = load i16*, i16** %6, align 8
  %30 = ptrtoint i16* %28 to i64
  %31 = ptrtoint i16* %29 to i64
  %32 = sub i64 %30, %31
  %33 = sdiv exact i64 %32, 2
  %34 = add nsw i64 %33, 1
  store i64 %34, i64* %3, align 8
  br label %91

; <label>:35:                                     ; preds = %14
  %36 = load i16*, i16** %4, align 8
  %37 = getelementptr inbounds i16, i16* %36, i64 0
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = icmp sge i32 %39, 55296
  br i1 %40, label %41, label %86

; <label>:41:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 2)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 2)
  %43 = load i16*, i16** %4, align 8
  %44 = getelementptr inbounds i16, i16* %43, i64 0
  %45 = load i16, i16* %44, align 2
  %46 = zext i16 %45 to i32
  %47 = icmp sle i32 %46, 56319
  br i1 %47, label %48, label %86

; <label>:48:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 3)
  %50 = load i16*, i16** %4, align 8
  %51 = getelementptr inbounds i16, i16* %50, i64 1
  %52 = load i16, i16* %51, align 2
  %53 = zext i16 %52 to i32
  %54 = icmp sge i32 %53, 56320
  br i1 %54, label %55, label %86

; <label>:55:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 4)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 4)
  %57 = load i16*, i16** %4, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 1
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = icmp sle i32 %60, 57343
  br i1 %61, label %62, label %86

; <label>:62:                                     ; preds = %55
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 6)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 6)
  %64 = load i16*, i16** %4, align 8
  %65 = getelementptr inbounds i16, i16* %64, i64 0
  %66 = load i16, i16* %65, align 2
  %67 = zext i16 %66 to i64
  %68 = and i64 %67, 1023
  %69 = shl i64 %68, 10
  %70 = load i16*, i16** %4, align 8
  %71 = getelementptr inbounds i16, i16* %70, i64 1
  %72 = load i16, i16* %71, align 2
  %73 = zext i16 %72 to i64
  %74 = and i64 %73, 1023
  %75 = shl i64 %74, 0
  %76 = or i64 %69, %75
  %77 = add nsw i64 %76, 65536
  %78 = load i64*, i64** %5, align 8
  store i64 %77, i64* %78, align 8
  %79 = load i16*, i16** %4, align 8
  %80 = load i16*, i16** %6, align 8
  %81 = ptrtoint i16* %79 to i64
  %82 = ptrtoint i16* %80 to i64
  %83 = sub i64 %81, %82
  %84 = sdiv exact i64 %83, 2
  %85 = add nsw i64 %84, 2
  store i64 %85, i64* %3, align 8
  br label %91

; <label>:86:                                     ; preds = %55, %48, %41, %35
  br label %87

; <label>:87:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 1)
  %88 = add i64 %pgocount6, 1
  store i64 %88, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_decodechar, i64 0, i64 1)
  %89 = load i16*, i16** %4, align 8
  %90 = getelementptr inbounds i16, i16* %89, i32 1
  store i16* %90, i16** %4, align 8
  br label %8

; <label>:91:                                     ; preds = %62, %21
  %92 = load i64, i64* %3, align 8
  ret i64 %92
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_encodechar(i16*, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i16*, align 8
  %5 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp ult i64 %6, 65536
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 0)
  %10 = load i64, i64* %5, align 8
  %11 = trunc i64 %10 to i16
  %12 = load i16*, i16** %4, align 8
  %13 = getelementptr inbounds i16, i16* %12, i64 0
  store i16 %11, i16* %13, align 2
  store i64 1, i64* %3, align 8
  br label %40

; <label>:14:                                     ; preds = %2
  %15 = load i64, i64* %5, align 8
  %16 = icmp ult i64 %15, 1114112
  br i1 %16, label %17, label %35

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 1)
  %19 = load i64, i64* %5, align 8
  %20 = sub i64 %19, 65536
  store i64 %20, i64* %5, align 8
  %21 = load i64, i64* %5, align 8
  %22 = lshr i64 %21, 10
  %23 = and i64 %22, 1023
  %24 = or i64 %23, 55296
  %25 = trunc i64 %24 to i16
  %26 = load i16*, i16** %4, align 8
  %27 = getelementptr inbounds i16, i16* %26, i64 0
  store i16 %25, i16* %27, align 2
  %28 = load i64, i64* %5, align 8
  %29 = lshr i64 %28, 0
  %30 = and i64 %29, 1023
  %31 = or i64 %30, 56320
  %32 = trunc i64 %31 to i16
  %33 = load i16*, i16** %4, align 8
  %34 = getelementptr inbounds i16, i16* %33, i64 1
  store i16 %32, i16* %34, align 2
  store i64 2, i64* %3, align 8
  br label %40

; <label>:35:                                     ; preds = %14
  br label %36

; <label>:36:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_encodechar, i64 0, i64 2)
  %38 = load i16*, i16** %4, align 8
  %39 = call i64 @id3_utf16_encodechar(i16* %38, i64 183)
  store i64 %39, i64* %3, align 8
  br label %40

; <label>:40:                                     ; preds = %36, %17, %8
  %41 = load i64, i64* %3, align 8
  ret i64 %41
}

; Function Attrs: noinline nounwind uwtable
define void @id3_utf16_decode(i16*, i64*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i64*, align 8
  store i16* %0, i16** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_decode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_decode, i64 0, i64 0)
  %7 = load i16*, i16** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = call i64 @id3_utf16_decodechar(i16* %7, i64* %8)
  %10 = load i16*, i16** %3, align 8
  %11 = getelementptr inbounds i16, i16* %10, i64 %9
  store i16* %11, i16** %3, align 8
  br label %12

; <label>:12:                                     ; preds = %5
  %13 = load i64*, i64** %4, align 8
  %14 = getelementptr inbounds i64, i64* %13, i32 1
  store i64* %14, i64** %4, align 8
  %15 = load i64, i64* %13, align 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %5, label %17

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_decode, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_decode, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @id3_utf16_encode(i16*, i64*) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i64*, align 8
  store i16* %0, i16** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %13, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_encode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_encode, i64 0, i64 0)
  %7 = load i16*, i16** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = load i64, i64* %8, align 8
  %10 = call i64 @id3_utf16_encodechar(i16* %7, i64 %9)
  %11 = load i16*, i16** %3, align 8
  %12 = getelementptr inbounds i16, i16* %11, i64 %10
  store i16* %12, i16** %3, align 8
  br label %13

; <label>:13:                                     ; preds = %5
  %14 = load i64*, i64** %4, align 8
  %15 = getelementptr inbounds i64, i64* %14, i32 1
  store i64* %15, i64** %4, align 8
  %16 = load i64, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %5, label %18

; <label>:18:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_encode, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf16_encode, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_put(i8**, i16 zeroext, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store i16 %1, i16* %5, align 2
  store i32 %2, i32* %6, align 4
  %7 = load i8**, i8*** %4, align 8
  %8 = icmp ne i8** %7, null
  br i1 %8, label %9, label %53

; <label>:9:                                      ; preds = %3
  %10 = load i32, i32* %6, align 4
  switch i32 %10, label %11 [
    i32 1, label %13
    i32 2, label %31
  ]

; <label>:11:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 2)
  br label %13

; <label>:13:                                     ; preds = %11, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 1)
  %15 = load i16, i16* %5, align 2
  %16 = zext i16 %15 to i32
  %17 = ashr i32 %16, 8
  %18 = and i32 %17, 255
  %19 = trunc i32 %18 to i8
  %20 = load i8**, i8*** %4, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 0
  store i8 %19, i8* %22, align 1
  %23 = load i16, i16* %5, align 2
  %24 = zext i16 %23 to i32
  %25 = ashr i32 %24, 0
  %26 = and i32 %25, 255
  %27 = trunc i32 %26 to i8
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 1
  store i8 %27, i8* %30, align 1
  br label %49

; <label>:31:                                     ; preds = %9
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 3)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 3)
  %33 = load i16, i16* %5, align 2
  %34 = zext i16 %33 to i32
  %35 = ashr i32 %34, 0
  %36 = and i32 %35, 255
  %37 = trunc i32 %36 to i8
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 0
  store i8 %37, i8* %40, align 1
  %41 = load i16, i16* %5, align 2
  %42 = zext i16 %41 to i32
  %43 = ashr i32 %42, 8
  %44 = and i32 %43, 255
  %45 = trunc i32 %44 to i8
  %46 = load i8**, i8*** %4, align 8
  %47 = load i8*, i8** %46, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 1
  store i8 %45, i8* %48, align 1
  br label %49

; <label>:49:                                     ; preds = %31, %13
  %50 = load i8**, i8*** %4, align 8
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 2
  store i8* %52, i8** %50, align 8
  br label %53

; <label>:53:                                     ; preds = %49, %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 0)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_utf16_put, i64 0, i64 0)
  ret i64 2
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @id3_utf16_get(i8**, i32) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  store i8** %0, i8*** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load i32, i32* %4, align 4
  switch i32 %6, label %7 [
    i32 1, label %9
    i32 2, label %25
  ]

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 2)
  br label %9

; <label>:9:                                      ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 0)
  %11 = load i8**, i8*** %3, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = shl i32 %15, 8
  %17 = load i8**, i8*** %3, align 8
  %18 = load i8*, i8** %17, align 8
  %19 = getelementptr inbounds i8, i8* %18, i64 1
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = shl i32 %21, 0
  %23 = or i32 %16, %22
  %24 = trunc i32 %23 to i16
  store i16 %24, i16* %5, align 2
  br label %41

; <label>:25:                                     ; preds = %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 1)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_utf16_get, i64 0, i64 1)
  %27 = load i8**, i8*** %3, align 8
  %28 = load i8*, i8** %27, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 0
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  %32 = shl i32 %31, 0
  %33 = load i8**, i8*** %3, align 8
  %34 = load i8*, i8** %33, align 8
  %35 = getelementptr inbounds i8, i8* %34, i64 1
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = shl i32 %37, 8
  %39 = or i32 %32, %38
  %40 = trunc i32 %39 to i16
  store i16 %40, i16* %5, align 2
  br label %41

; <label>:41:                                     ; preds = %25, %9
  %42 = load i8**, i8*** %3, align 8
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 2
  store i8* %44, i8** %42, align 8
  %45 = load i16, i16* %5, align 2
  ret i16 %45
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf16_serialize(i8**, i64*, i32, i32) #0 {
  %5 = alloca i8**, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64, align 8
  %10 = alloca [2 x i16], align 2
  %11 = alloca i16*, align 8
  store i8** %0, i8*** %5, align 8
  store i64* %1, i64** %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i64 0, i64* %9, align 8
  %12 = load i32, i32* %7, align 4
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %21

; <label>:14:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 6)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 6)
  %16 = load i8**, i8*** %5, align 8
  %17 = load i32, i32* %7, align 4
  %18 = call i64 @id3_utf16_put(i8** %16, i16 zeroext -257, i32 %17)
  %19 = load i64, i64* %9, align 8
  %20 = add i64 %19, %18
  store i64 %20, i64* %9, align 8
  br label %21

; <label>:21:                                     ; preds = %14, %4
  br label %22

; <label>:22:                                     ; preds = %55, %21
  %23 = load i64*, i64** %6, align 8
  %24 = load i64, i64* %23, align 8
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %26, label %56

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 0)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 0)
  %28 = getelementptr inbounds [2 x i16], [2 x i16]* %10, i32 0, i32 0
  store i16* %28, i16** %11, align 8
  %29 = load i64*, i64** %6, align 8
  %30 = getelementptr inbounds i64, i64* %29, i32 1
  store i64* %30, i64** %6, align 8
  %31 = load i64, i64* %29, align 8
  %32 = call i64 @id3_utf16_encodechar(i16* %28, i64 %31)
  switch i64 %32, label %55 [
    i64 2, label %33
    i64 1, label %43
    i64 0, label %53
  ]

; <label>:33:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 3)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 3)
  %35 = load i8**, i8*** %5, align 8
  %36 = load i16*, i16** %11, align 8
  %37 = getelementptr inbounds i16, i16* %36, i32 1
  store i16* %37, i16** %11, align 8
  %38 = load i16, i16* %36, align 2
  %39 = load i32, i32* %7, align 4
  %40 = call i64 @id3_utf16_put(i8** %35, i16 zeroext %38, i32 %39)
  %41 = load i64, i64* %9, align 8
  %42 = add i64 %41, %40
  store i64 %42, i64* %9, align 8
  br label %43

; <label>:43:                                     ; preds = %33, %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 2)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 2)
  %45 = load i8**, i8*** %5, align 8
  %46 = load i16*, i16** %11, align 8
  %47 = getelementptr inbounds i16, i16* %46, i32 1
  store i16* %47, i16** %11, align 8
  %48 = load i16, i16* %46, align 2
  %49 = load i32, i32* %7, align 4
  %50 = call i64 @id3_utf16_put(i8** %45, i16 zeroext %48, i32 %49)
  %51 = load i64, i64* %9, align 8
  %52 = add i64 %51, %50
  store i64 %52, i64* %9, align 8
  br label %53

; <label>:53:                                     ; preds = %43, %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 1)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 1)
  br label %55

; <label>:55:                                     ; preds = %53, %26
  br label %22

; <label>:56:                                     ; preds = %22
  %57 = load i32, i32* %8, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %59, label %66

; <label>:59:                                     ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 5)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 5)
  %61 = load i8**, i8*** %5, align 8
  %62 = load i32, i32* %7, align 4
  %63 = call i64 @id3_utf16_put(i8** %61, i16 zeroext 0, i32 %62)
  %64 = load i64, i64* %9, align 8
  %65 = add i64 %64, %63
  store i64 %65, i64* %9, align 8
  br label %66

; <label>:66:                                     ; preds = %59, %56
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 4)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf16_serialize, i64 0, i64 4)
  %68 = load i64, i64* %9, align 8
  ret i64 %68
}

; Function Attrs: noinline nounwind uwtable
define i64* @id3_utf16_deserialize(i8**, i64, i32) #0 {
  %4 = alloca i64*, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i64*, align 8
  store i8** %0, i8*** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  %12 = load i8**, i8*** %5, align 8
  %13 = load i8*, i8** %12, align 8
  %14 = load i64, i64* %6, align 8
  %15 = and i64 %14, -2
  %16 = getelementptr inbounds i8, i8* %13, i64 %15
  store i8* %16, i8** %8, align 8
  %17 = load i64, i64* %6, align 8
  %18 = udiv i64 %17, 2
  %19 = add i64 %18, 1
  %20 = mul i64 %19, 2
  %21 = call noalias i8* @malloc(i64 %20) #2
  %22 = bitcast i8* %21 to i16*
  store i16* %22, i16** %10, align 8
  %23 = load i16*, i16** %10, align 8
  %24 = icmp eq i16* %23, null
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 4)
  %26 = add i64 %pgocount, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 4)
  store i64* null, i64** %4, align 8
  br label %108

; <label>:27:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 2)
  %28 = add i64 %pgocount1, 1
  store i64 %28, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 2)
  %29 = load i32, i32* %7, align 4
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %66

; <label>:31:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 5)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 5)
  %33 = load i8*, i8** %8, align 8
  %34 = load i8**, i8*** %5, align 8
  %35 = load i8*, i8** %34, align 8
  %36 = ptrtoint i8* %33 to i64
  %37 = ptrtoint i8* %35 to i64
  %38 = sub i64 %36, %37
  %39 = icmp sgt i64 %38, 0
  br i1 %39, label %40, label %66

; <label>:40:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 6)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 6)
  %42 = load i8**, i8*** %5, align 8
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  %45 = load i8, i8* %44, align 1
  %46 = zext i8 %45 to i32
  %47 = shl i32 %46, 8
  %48 = load i8**, i8*** %5, align 8
  %49 = load i8*, i8** %48, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 1
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i32
  %53 = shl i32 %52, 0
  %54 = or i32 %47, %53
  switch i32 %54, label %65 [
    i32 65279, label %55
    i32 65534, label %60
  ]

; <label>:55:                                     ; preds = %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 7)
  %56 = add i64 %pgocount4, 1
  store i64 %56, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 7)
  store i32 1, i32* %7, align 4
  %57 = load i8**, i8*** %5, align 8
  %58 = load i8*, i8** %57, align 8
  %59 = getelementptr inbounds i8, i8* %58, i64 2
  store i8* %59, i8** %57, align 8
  br label %65

; <label>:60:                                     ; preds = %40
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 8)
  %61 = add i64 %pgocount5, 1
  store i64 %61, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 8)
  store i32 2, i32* %7, align 4
  %62 = load i8**, i8*** %5, align 8
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 2
  store i8* %64, i8** %62, align 8
  br label %65

; <label>:65:                                     ; preds = %60, %55, %40
  br label %66

; <label>:66:                                     ; preds = %65, %31, %27
  %67 = load i16*, i16** %10, align 8
  store i16* %67, i16** %9, align 8
  br label %68

; <label>:68:                                     ; preds = %86, %66
  %69 = load i8*, i8** %8, align 8
  %70 = load i8**, i8*** %5, align 8
  %71 = load i8*, i8** %70, align 8
  %72 = ptrtoint i8* %69 to i64
  %73 = ptrtoint i8* %71 to i64
  %74 = sub i64 %72, %73
  %75 = icmp sgt i64 %74, 0
  br i1 %75, label %76, label %84

; <label>:76:                                     ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 1)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 1)
  %78 = load i8**, i8*** %5, align 8
  %79 = load i32, i32* %7, align 4
  %80 = call zeroext i16 @id3_utf16_get(i8** %78, i32 %79)
  %81 = load i16*, i16** %9, align 8
  store i16 %80, i16* %81, align 2
  %82 = zext i16 %80 to i32
  %83 = icmp ne i32 %82, 0
  br label %84

; <label>:84:                                     ; preds = %76, %68
  %85 = phi i1 [ false, %68 ], [ %83, %76 ]
  br i1 %85, label %86, label %90

; <label>:86:                                     ; preds = %84
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 0)
  %87 = add i64 %pgocount7, 1
  store i64 %87, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 0)
  %88 = load i16*, i16** %9, align 8
  %89 = getelementptr inbounds i16, i16* %88, i32 1
  store i16* %89, i16** %9, align 8
  br label %68

; <label>:90:                                     ; preds = %84
  %91 = load i16*, i16** %9, align 8
  store i16 0, i16* %91, align 2
  %92 = load i16*, i16** %10, align 8
  %93 = call i64 @id3_utf16_length(i16* %92)
  %94 = add i64 %93, 1
  %95 = mul i64 %94, 8
  %96 = call noalias i8* @malloc(i64 %95) #2
  %97 = bitcast i8* %96 to i64*
  store i64* %97, i64** %11, align 8
  %98 = load i64*, i64** %11, align 8
  %99 = icmp ne i64* %98, null
  br i1 %99, label %100, label %104

; <label>:100:                                    ; preds = %90
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 3)
  %101 = add i64 %pgocount8, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_utf16_deserialize, i64 0, i64 3)
  %102 = load i16*, i16** %10, align 8
  %103 = load i64*, i64** %11, align 8
  call void @id3_utf16_decode(i16* %102, i64* %103)
  br label %104

; <label>:104:                                    ; preds = %100, %90
  %105 = load i16*, i16** %10, align 8
  %106 = bitcast i16* %105 to i8*
  call void @free(i8* %106) #2
  %107 = load i64*, i64** %11, align 8
  store i64* %107, i64** %4, align 8
  br label %108

; <label>:108:                                    ; preds = %104, %25
  %109 = load i64*, i64** %4, align 8
  ret i64* %109
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

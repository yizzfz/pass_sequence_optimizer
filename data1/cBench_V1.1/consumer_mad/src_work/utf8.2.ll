; ModuleID = 'tmp1.ll'
source_filename = "utf8.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_utf8_length = private constant [15 x i8] c"id3_utf8_length"
@__profn_id3_utf8_size = private constant [13 x i8] c"id3_utf8_size"
@__profn_id3_utf8_decodechar = private constant [19 x i8] c"id3_utf8_decodechar"
@__profn_id3_utf8_encodechar = private constant [19 x i8] c"id3_utf8_encodechar"
@__profn_id3_utf8_decode = private constant [15 x i8] c"id3_utf8_decode"
@__profn_id3_utf8_encode = private constant [15 x i8] c"id3_utf8_encode"
@__profn_id3_utf8_put = private constant [12 x i8] c"id3_utf8_put"
@__profn_id3_utf8_get = private constant [12 x i8] c"id3_utf8_get"
@__profn_id3_utf8_serialize = private constant [18 x i8] c"id3_utf8_serialize"
@__profn_id3_utf8_deserialize = private constant [20 x i8] c"id3_utf8_deserialize"
@__profc_id3_utf8_length = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7065937605925603351, i64 318411034934, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i32 0, i32 0), i8* bitcast (i64 (i8*)* @id3_utf8_length to i8*), i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_size = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5789543610193418509, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_size, i32 0, i32 0), i8* bitcast (i64 (i8*)* @id3_utf8_size to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_decodechar = private global [27 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_decodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4706207866088269761, i64 309552472041, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i32 0, i32 0), i8* bitcast (i64 (i8*, i64*)* @id3_utf8_decodechar to i8*), i8* null, i32 27, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_encodechar = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_encodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3454861022663215324, i64 115820468032, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i32 0, i32 0), i8* bitcast (i64 (i8*, i64)* @id3_utf8_encodechar to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_decode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8740211019952787310, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_decode, i32 0, i32 0), i8* bitcast (void (i8*, i64*)* @id3_utf8_decode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_encode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4312402067160837937, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_encode, i32 0, i32 0), i8* bitcast (void (i8*, i64*)* @id3_utf8_encode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_put = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_put = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6193591638815711135, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_put, i32 0, i32 0), i8* bitcast (i64 (i8**, i8)* @id3_utf8_put to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_get = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_get = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7241016333213980609, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_utf8_get, i32 0, i32 0), i8* bitcast (i8 (i8**)* @id3_utf8_get to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_serialize = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_serialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2950252214986599795, i64 104713966821, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i32 0, i32 0), i8* bitcast (i64 (i8**, i64*, i32)* @id3_utf8_serialize to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_utf8_deserialize = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_utf8_deserialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5692746117884492127, i64 69969360692, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i32 0, i32 0), i8* bitcast (i64* (i8**, i64)* @id3_utf8_deserialize to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [170 x i8] c"\A7\01\00id3_utf8_length\01id3_utf8_size\01id3_utf8_decodechar\01id3_utf8_encodechar\01id3_utf8_decode\01id3_utf8_encode\01id3_utf8_put\01id3_utf8_get\01id3_utf8_serialize\01id3_utf8_deserialize", section "__llvm_prf_names"
@llvm.used = appending global [11 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_decodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_encodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_put to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_get to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_serialize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_utf8_deserialize to i8*), i8* getelementptr inbounds ([170 x i8], [170 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_length(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i64, align 8
  store i8* %0, i8** %2, align 8
  store i64 0, i64* %3, align 8
  br label %4

; <label>:4:                                      ; preds = %288, %1
  %5 = load i8*, i8** %2, align 8
  %6 = load i8, i8* %5, align 1
  %7 = icmp ne i8 %6, 0
  br i1 %7, label %8, label %291

; <label>:8:                                      ; preds = %4
  %9 = load i8*, i8** %2, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = and i32 %12, 128
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 0)
  %17 = load i64, i64* %3, align 8
  %18 = add i64 %17, 1
  store i64 %18, i64* %3, align 8
  br label %288

; <label>:19:                                     ; preds = %8
  %20 = load i8*, i8** %2, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 0
  %22 = load i8, i8* %21, align 1
  %23 = sext i8 %22 to i32
  %24 = and i32 %23, 224
  %25 = icmp eq i32 %24, 192
  br i1 %25, label %26, label %50

; <label>:26:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 2)
  %28 = load i8*, i8** %2, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 1
  %30 = load i8, i8* %29, align 1
  %31 = sext i8 %30 to i32
  %32 = and i32 %31, 192
  %33 = icmp eq i32 %32, 128
  br i1 %33, label %34, label %50

; <label>:34:                                     ; preds = %26
  %35 = load i8*, i8** %2, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 0
  %37 = load i8, i8* %36, align 1
  %38 = sext i8 %37 to i64
  %39 = and i64 %38, 31
  %40 = shl i64 %39, 6
  %41 = icmp sge i64 %40, 128
  br i1 %41, label %42, label %48

; <label>:42:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 12)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 12)
  %44 = load i64, i64* %3, align 8
  %45 = add i64 %44, 1
  store i64 %45, i64* %3, align 8
  %46 = load i8*, i8** %2, align 8
  %47 = getelementptr inbounds i8, i8* %46, i64 1
  store i8* %47, i8** %2, align 8
  br label %48

; <label>:48:                                     ; preds = %42, %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 7)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 7)
  br label %287

; <label>:50:                                     ; preds = %26, %19
  %51 = load i8*, i8** %2, align 8
  %52 = getelementptr inbounds i8, i8* %51, i64 0
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = and i32 %54, 240
  %56 = icmp eq i32 %55, 224
  br i1 %56, label %57, label %96

; <label>:57:                                     ; preds = %50
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 3)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 3)
  %59 = load i8*, i8** %2, align 8
  %60 = getelementptr inbounds i8, i8* %59, i64 1
  %61 = load i8, i8* %60, align 1
  %62 = sext i8 %61 to i32
  %63 = and i32 %62, 192
  %64 = icmp eq i32 %63, 128
  br i1 %64, label %65, label %96

; <label>:65:                                     ; preds = %57
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 8)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 8)
  %67 = load i8*, i8** %2, align 8
  %68 = getelementptr inbounds i8, i8* %67, i64 2
  %69 = load i8, i8* %68, align 1
  %70 = sext i8 %69 to i32
  %71 = and i32 %70, 192
  %72 = icmp eq i32 %71, 128
  br i1 %72, label %73, label %96

; <label>:73:                                     ; preds = %65
  %74 = load i8*, i8** %2, align 8
  %75 = getelementptr inbounds i8, i8* %74, i64 0
  %76 = load i8, i8* %75, align 1
  %77 = sext i8 %76 to i64
  %78 = and i64 %77, 15
  %79 = shl i64 %78, 12
  %80 = load i8*, i8** %2, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  %82 = load i8, i8* %81, align 1
  %83 = sext i8 %82 to i64
  %84 = and i64 %83, 63
  %85 = shl i64 %84, 6
  %86 = or i64 %79, %85
  %87 = icmp sge i64 %86, 2048
  br i1 %87, label %88, label %94

; <label>:88:                                     ; preds = %73
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 18)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 18)
  %90 = load i64, i64* %3, align 8
  %91 = add i64 %90, 1
  store i64 %91, i64* %3, align 8
  %92 = load i8*, i8** %2, align 8
  %93 = getelementptr inbounds i8, i8* %92, i64 2
  store i8* %93, i8** %2, align 8
  br label %94

; <label>:94:                                     ; preds = %88, %73
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 13)
  %95 = add i64 %pgocount7, 1
  store i64 %95, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 13)
  br label %286

; <label>:96:                                     ; preds = %65, %57, %50
  %97 = load i8*, i8** %2, align 8
  %98 = getelementptr inbounds i8, i8* %97, i64 0
  %99 = load i8, i8* %98, align 1
  %100 = sext i8 %99 to i32
  %101 = and i32 %100, 248
  %102 = icmp eq i32 %101, 240
  br i1 %102, label %103, label %150

; <label>:103:                                    ; preds = %96
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 4)
  %104 = add i64 %pgocount8, 1
  store i64 %104, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 4)
  %105 = load i8*, i8** %2, align 8
  %106 = getelementptr inbounds i8, i8* %105, i64 1
  %107 = load i8, i8* %106, align 1
  %108 = sext i8 %107 to i32
  %109 = and i32 %108, 192
  %110 = icmp eq i32 %109, 128
  br i1 %110, label %111, label %150

; <label>:111:                                    ; preds = %103
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 9)
  %112 = add i64 %pgocount9, 1
  store i64 %112, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 9)
  %113 = load i8*, i8** %2, align 8
  %114 = getelementptr inbounds i8, i8* %113, i64 2
  %115 = load i8, i8* %114, align 1
  %116 = sext i8 %115 to i32
  %117 = and i32 %116, 192
  %118 = icmp eq i32 %117, 128
  br i1 %118, label %119, label %150

; <label>:119:                                    ; preds = %111
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 14)
  %120 = add i64 %pgocount10, 1
  store i64 %120, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 14)
  %121 = load i8*, i8** %2, align 8
  %122 = getelementptr inbounds i8, i8* %121, i64 3
  %123 = load i8, i8* %122, align 1
  %124 = sext i8 %123 to i32
  %125 = and i32 %124, 192
  %126 = icmp eq i32 %125, 128
  br i1 %126, label %127, label %150

; <label>:127:                                    ; preds = %119
  %128 = load i8*, i8** %2, align 8
  %129 = getelementptr inbounds i8, i8* %128, i64 0
  %130 = load i8, i8* %129, align 1
  %131 = sext i8 %130 to i64
  %132 = and i64 %131, 7
  %133 = shl i64 %132, 18
  %134 = load i8*, i8** %2, align 8
  %135 = getelementptr inbounds i8, i8* %134, i64 1
  %136 = load i8, i8* %135, align 1
  %137 = sext i8 %136 to i64
  %138 = and i64 %137, 63
  %139 = shl i64 %138, 12
  %140 = or i64 %133, %139
  %141 = icmp sge i64 %140, 65536
  br i1 %141, label %142, label %148

; <label>:142:                                    ; preds = %127
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 22)
  %143 = add i64 %pgocount11, 1
  store i64 %143, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 22)
  %144 = load i64, i64* %3, align 8
  %145 = add i64 %144, 1
  store i64 %145, i64* %3, align 8
  %146 = load i8*, i8** %2, align 8
  %147 = getelementptr inbounds i8, i8* %146, i64 3
  store i8* %147, i8** %2, align 8
  br label %148

; <label>:148:                                    ; preds = %142, %127
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 19)
  %149 = add i64 %pgocount12, 1
  store i64 %149, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 19)
  br label %285

; <label>:150:                                    ; preds = %119, %111, %103, %96
  %151 = load i8*, i8** %2, align 8
  %152 = getelementptr inbounds i8, i8* %151, i64 0
  %153 = load i8, i8* %152, align 1
  %154 = sext i8 %153 to i32
  %155 = and i32 %154, 252
  %156 = icmp eq i32 %155, 248
  br i1 %156, label %157, label %212

; <label>:157:                                    ; preds = %150
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 5)
  %158 = add i64 %pgocount13, 1
  store i64 %158, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 5)
  %159 = load i8*, i8** %2, align 8
  %160 = getelementptr inbounds i8, i8* %159, i64 1
  %161 = load i8, i8* %160, align 1
  %162 = sext i8 %161 to i32
  %163 = and i32 %162, 192
  %164 = icmp eq i32 %163, 128
  br i1 %164, label %165, label %212

; <label>:165:                                    ; preds = %157
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 10)
  %166 = add i64 %pgocount14, 1
  store i64 %166, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 10)
  %167 = load i8*, i8** %2, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 2
  %169 = load i8, i8* %168, align 1
  %170 = sext i8 %169 to i32
  %171 = and i32 %170, 192
  %172 = icmp eq i32 %171, 128
  br i1 %172, label %173, label %212

; <label>:173:                                    ; preds = %165
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 15)
  %174 = add i64 %pgocount15, 1
  store i64 %174, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 15)
  %175 = load i8*, i8** %2, align 8
  %176 = getelementptr inbounds i8, i8* %175, i64 3
  %177 = load i8, i8* %176, align 1
  %178 = sext i8 %177 to i32
  %179 = and i32 %178, 192
  %180 = icmp eq i32 %179, 128
  br i1 %180, label %181, label %212

; <label>:181:                                    ; preds = %173
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 20)
  %182 = add i64 %pgocount16, 1
  store i64 %182, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 20)
  %183 = load i8*, i8** %2, align 8
  %184 = getelementptr inbounds i8, i8* %183, i64 4
  %185 = load i8, i8* %184, align 1
  %186 = sext i8 %185 to i32
  %187 = and i32 %186, 192
  %188 = icmp eq i32 %187, 128
  br i1 %188, label %189, label %212

; <label>:189:                                    ; preds = %181
  %190 = load i8*, i8** %2, align 8
  %191 = getelementptr inbounds i8, i8* %190, i64 0
  %192 = load i8, i8* %191, align 1
  %193 = sext i8 %192 to i64
  %194 = and i64 %193, 3
  %195 = shl i64 %194, 24
  %196 = load i8*, i8** %2, align 8
  %197 = getelementptr inbounds i8, i8* %196, i64 0
  %198 = load i8, i8* %197, align 1
  %199 = sext i8 %198 to i64
  %200 = and i64 %199, 63
  %201 = shl i64 %200, 18
  %202 = or i64 %195, %201
  %203 = icmp sge i64 %202, 2097152
  br i1 %203, label %204, label %210

; <label>:204:                                    ; preds = %189
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 25)
  %205 = add i64 %pgocount17, 1
  store i64 %205, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 25)
  %206 = load i64, i64* %3, align 8
  %207 = add i64 %206, 1
  store i64 %207, i64* %3, align 8
  %208 = load i8*, i8** %2, align 8
  %209 = getelementptr inbounds i8, i8* %208, i64 4
  store i8* %209, i8** %2, align 8
  br label %210

; <label>:210:                                    ; preds = %204, %189
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 23)
  %211 = add i64 %pgocount18, 1
  store i64 %211, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 23)
  br label %284

; <label>:212:                                    ; preds = %181, %173, %165, %157, %150
  %213 = load i8*, i8** %2, align 8
  %214 = getelementptr inbounds i8, i8* %213, i64 0
  %215 = load i8, i8* %214, align 1
  %216 = sext i8 %215 to i32
  %217 = and i32 %216, 254
  %218 = icmp eq i32 %217, 252
  br i1 %218, label %219, label %282

; <label>:219:                                    ; preds = %212
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 6)
  %220 = add i64 %pgocount19, 1
  store i64 %220, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 6)
  %221 = load i8*, i8** %2, align 8
  %222 = getelementptr inbounds i8, i8* %221, i64 1
  %223 = load i8, i8* %222, align 1
  %224 = sext i8 %223 to i32
  %225 = and i32 %224, 192
  %226 = icmp eq i32 %225, 128
  br i1 %226, label %227, label %282

; <label>:227:                                    ; preds = %219
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 11)
  %228 = add i64 %pgocount20, 1
  store i64 %228, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 11)
  %229 = load i8*, i8** %2, align 8
  %230 = getelementptr inbounds i8, i8* %229, i64 2
  %231 = load i8, i8* %230, align 1
  %232 = sext i8 %231 to i32
  %233 = and i32 %232, 192
  %234 = icmp eq i32 %233, 128
  br i1 %234, label %235, label %282

; <label>:235:                                    ; preds = %227
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 16)
  %236 = add i64 %pgocount21, 1
  store i64 %236, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 16)
  %237 = load i8*, i8** %2, align 8
  %238 = getelementptr inbounds i8, i8* %237, i64 3
  %239 = load i8, i8* %238, align 1
  %240 = sext i8 %239 to i32
  %241 = and i32 %240, 192
  %242 = icmp eq i32 %241, 128
  br i1 %242, label %243, label %282

; <label>:243:                                    ; preds = %235
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 21)
  %244 = add i64 %pgocount22, 1
  store i64 %244, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 21)
  %245 = load i8*, i8** %2, align 8
  %246 = getelementptr inbounds i8, i8* %245, i64 4
  %247 = load i8, i8* %246, align 1
  %248 = sext i8 %247 to i32
  %249 = and i32 %248, 192
  %250 = icmp eq i32 %249, 128
  br i1 %250, label %251, label %282

; <label>:251:                                    ; preds = %243
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 24)
  %252 = add i64 %pgocount23, 1
  store i64 %252, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 24)
  %253 = load i8*, i8** %2, align 8
  %254 = getelementptr inbounds i8, i8* %253, i64 5
  %255 = load i8, i8* %254, align 1
  %256 = sext i8 %255 to i32
  %257 = and i32 %256, 192
  %258 = icmp eq i32 %257, 128
  br i1 %258, label %259, label %282

; <label>:259:                                    ; preds = %251
  %260 = load i8*, i8** %2, align 8
  %261 = getelementptr inbounds i8, i8* %260, i64 0
  %262 = load i8, i8* %261, align 1
  %263 = sext i8 %262 to i64
  %264 = and i64 %263, 1
  %265 = shl i64 %264, 30
  %266 = load i8*, i8** %2, align 8
  %267 = getelementptr inbounds i8, i8* %266, i64 0
  %268 = load i8, i8* %267, align 1
  %269 = sext i8 %268 to i64
  %270 = and i64 %269, 63
  %271 = shl i64 %270, 24
  %272 = or i64 %265, %271
  %273 = icmp sge i64 %272, 67108864
  br i1 %273, label %274, label %280

; <label>:274:                                    ; preds = %259
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 27)
  %275 = add i64 %pgocount24, 1
  store i64 %275, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 27)
  %276 = load i64, i64* %3, align 8
  %277 = add i64 %276, 1
  store i64 %277, i64* %3, align 8
  %278 = load i8*, i8** %2, align 8
  %279 = getelementptr inbounds i8, i8* %278, i64 5
  store i8* %279, i8** %2, align 8
  br label %280

; <label>:280:                                    ; preds = %274, %259
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 26)
  %281 = add i64 %pgocount25, 1
  store i64 %281, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 26)
  br label %282

; <label>:282:                                    ; preds = %280, %251, %243, %235, %227, %219, %212
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 1)
  %283 = add i64 %pgocount26, 1
  store i64 %283, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 1)
  br label %284

; <label>:284:                                    ; preds = %282, %210
  br label %285

; <label>:285:                                    ; preds = %284, %148
  br label %286

; <label>:286:                                    ; preds = %285, %94
  br label %287

; <label>:287:                                    ; preds = %286, %48
  br label %288

; <label>:288:                                    ; preds = %287, %15
  %289 = load i8*, i8** %2, align 8
  %290 = getelementptr inbounds i8, i8* %289, i32 1
  store i8* %290, i8** %2, align 8
  br label %4

; <label>:291:                                    ; preds = %4
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 17)
  %292 = add i64 %pgocount27, 1
  store i64 %292, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_id3_utf8_length, i64 0, i64 17)
  %293 = load i64, i64* %3, align 8
  ret i64 %293
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_size(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  store i8* %4, i8** %3, align 8
  br label %5

; <label>:5:                                      ; preds = %9, %1
  %6 = load i8*, i8** %3, align 8
  %7 = load i8, i8* %6, align 1
  %8 = icmp ne i8 %7, 0
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_size, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_size, i64 0, i64 0)
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %3, align 8
  br label %5

; <label>:13:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_size, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_size, i64 0, i64 1)
  %15 = load i8*, i8** %3, align 8
  %16 = load i8*, i8** %2, align 8
  %17 = ptrtoint i8* %15 to i64
  %18 = ptrtoint i8* %16 to i64
  %19 = sub i64 %17, %18
  %20 = add nsw i64 %19, 1
  ret i64 %20
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_decodechar(i8*, i64*) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i64* %1, i64** %5, align 8
  %7 = load i8*, i8** %4, align 8
  store i8* %7, i8** %6, align 8
  br label %8

; <label>:8:                                      ; preds = %399, %2
  %9 = load i8*, i8** %4, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = load i8, i8* %10, align 1
  %12 = sext i8 %11 to i32
  %13 = and i32 %12, 128
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %28

; <label>:15:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 18)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 18)
  %17 = load i8*, i8** %4, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 0
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i64
  %21 = load i64*, i64** %5, align 8
  store i64 %20, i64* %21, align 8
  %22 = load i8*, i8** %4, align 8
  %23 = load i8*, i8** %6, align 8
  %24 = ptrtoint i8* %22 to i64
  %25 = ptrtoint i8* %23 to i64
  %26 = sub i64 %24, %25
  %27 = add nsw i64 %26, 1
  store i64 %27, i64* %3, align 8
  br label %402

; <label>:28:                                     ; preds = %8
  %29 = load i8*, i8** %4, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 0
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = and i32 %32, 224
  %34 = icmp eq i32 %33, 192
  br i1 %34, label %35, label %71

; <label>:35:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 1)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 1)
  %37 = load i8*, i8** %4, align 8
  %38 = getelementptr inbounds i8, i8* %37, i64 1
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = and i32 %40, 192
  %42 = icmp eq i32 %41, 128
  br i1 %42, label %43, label %71

; <label>:43:                                     ; preds = %35
  %44 = load i8*, i8** %4, align 8
  %45 = getelementptr inbounds i8, i8* %44, i64 0
  %46 = load i8, i8* %45, align 1
  %47 = sext i8 %46 to i64
  %48 = and i64 %47, 31
  %49 = shl i64 %48, 6
  %50 = load i8*, i8** %4, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  %52 = load i8, i8* %51, align 1
  %53 = sext i8 %52 to i64
  %54 = and i64 %53, 63
  %55 = shl i64 %54, 0
  %56 = or i64 %49, %55
  %57 = load i64*, i64** %5, align 8
  store i64 %56, i64* %57, align 8
  %58 = load i64*, i64** %5, align 8
  %59 = load i64, i64* %58, align 8
  %60 = icmp uge i64 %59, 128
  br i1 %60, label %61, label %69

; <label>:61:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 22)
  %62 = add i64 %pgocount2, 1
  store i64 %62, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 22)
  %63 = load i8*, i8** %4, align 8
  %64 = load i8*, i8** %6, align 8
  %65 = ptrtoint i8* %63 to i64
  %66 = ptrtoint i8* %64 to i64
  %67 = sub i64 %65, %66
  %68 = add nsw i64 %67, 2
  store i64 %68, i64* %3, align 8
  br label %402

; <label>:69:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 6)
  %70 = add i64 %pgocount3, 1
  store i64 %70, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 6)
  br label %398

; <label>:71:                                     ; preds = %35, %28
  %72 = load i8*, i8** %4, align 8
  %73 = getelementptr inbounds i8, i8* %72, i64 0
  %74 = load i8, i8* %73, align 1
  %75 = sext i8 %74 to i32
  %76 = and i32 %75, 240
  %77 = icmp eq i32 %76, 224
  br i1 %77, label %78, label %129

; <label>:78:                                     ; preds = %71
  %pgocount4 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 2)
  %79 = add i64 %pgocount4, 1
  store i64 %79, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 2)
  %80 = load i8*, i8** %4, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 1
  %82 = load i8, i8* %81, align 1
  %83 = sext i8 %82 to i32
  %84 = and i32 %83, 192
  %85 = icmp eq i32 %84, 128
  br i1 %85, label %86, label %129

; <label>:86:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 7)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 7)
  %88 = load i8*, i8** %4, align 8
  %89 = getelementptr inbounds i8, i8* %88, i64 2
  %90 = load i8, i8* %89, align 1
  %91 = sext i8 %90 to i32
  %92 = and i32 %91, 192
  %93 = icmp eq i32 %92, 128
  br i1 %93, label %94, label %129

; <label>:94:                                     ; preds = %86
  %95 = load i8*, i8** %4, align 8
  %96 = getelementptr inbounds i8, i8* %95, i64 0
  %97 = load i8, i8* %96, align 1
  %98 = sext i8 %97 to i64
  %99 = and i64 %98, 15
  %100 = shl i64 %99, 12
  %101 = load i8*, i8** %4, align 8
  %102 = getelementptr inbounds i8, i8* %101, i64 1
  %103 = load i8, i8* %102, align 1
  %104 = sext i8 %103 to i64
  %105 = and i64 %104, 63
  %106 = shl i64 %105, 6
  %107 = or i64 %100, %106
  %108 = load i8*, i8** %4, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 2
  %110 = load i8, i8* %109, align 1
  %111 = sext i8 %110 to i64
  %112 = and i64 %111, 63
  %113 = shl i64 %112, 0
  %114 = or i64 %107, %113
  %115 = load i64*, i64** %5, align 8
  store i64 %114, i64* %115, align 8
  %116 = load i64*, i64** %5, align 8
  %117 = load i64, i64* %116, align 8
  %118 = icmp uge i64 %117, 2048
  br i1 %118, label %119, label %127

; <label>:119:                                    ; preds = %94
  %pgocount6 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 23)
  %120 = add i64 %pgocount6, 1
  store i64 %120, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 23)
  %121 = load i8*, i8** %4, align 8
  %122 = load i8*, i8** %6, align 8
  %123 = ptrtoint i8* %121 to i64
  %124 = ptrtoint i8* %122 to i64
  %125 = sub i64 %123, %124
  %126 = add nsw i64 %125, 3
  store i64 %126, i64* %3, align 8
  br label %402

; <label>:127:                                    ; preds = %94
  %pgocount7 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 11)
  %128 = add i64 %pgocount7, 1
  store i64 %128, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 11)
  br label %397

; <label>:129:                                    ; preds = %86, %78, %71
  %130 = load i8*, i8** %4, align 8
  %131 = getelementptr inbounds i8, i8* %130, i64 0
  %132 = load i8, i8* %131, align 1
  %133 = sext i8 %132 to i32
  %134 = and i32 %133, 248
  %135 = icmp eq i32 %134, 240
  br i1 %135, label %136, label %202

; <label>:136:                                    ; preds = %129
  %pgocount8 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 3)
  %137 = add i64 %pgocount8, 1
  store i64 %137, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 3)
  %138 = load i8*, i8** %4, align 8
  %139 = getelementptr inbounds i8, i8* %138, i64 1
  %140 = load i8, i8* %139, align 1
  %141 = sext i8 %140 to i32
  %142 = and i32 %141, 192
  %143 = icmp eq i32 %142, 128
  br i1 %143, label %144, label %202

; <label>:144:                                    ; preds = %136
  %pgocount9 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 8)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 8)
  %146 = load i8*, i8** %4, align 8
  %147 = getelementptr inbounds i8, i8* %146, i64 2
  %148 = load i8, i8* %147, align 1
  %149 = sext i8 %148 to i32
  %150 = and i32 %149, 192
  %151 = icmp eq i32 %150, 128
  br i1 %151, label %152, label %202

; <label>:152:                                    ; preds = %144
  %pgocount10 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 12)
  %153 = add i64 %pgocount10, 1
  store i64 %153, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 12)
  %154 = load i8*, i8** %4, align 8
  %155 = getelementptr inbounds i8, i8* %154, i64 3
  %156 = load i8, i8* %155, align 1
  %157 = sext i8 %156 to i32
  %158 = and i32 %157, 192
  %159 = icmp eq i32 %158, 128
  br i1 %159, label %160, label %202

; <label>:160:                                    ; preds = %152
  %161 = load i8*, i8** %4, align 8
  %162 = getelementptr inbounds i8, i8* %161, i64 0
  %163 = load i8, i8* %162, align 1
  %164 = sext i8 %163 to i64
  %165 = and i64 %164, 7
  %166 = shl i64 %165, 18
  %167 = load i8*, i8** %4, align 8
  %168 = getelementptr inbounds i8, i8* %167, i64 1
  %169 = load i8, i8* %168, align 1
  %170 = sext i8 %169 to i64
  %171 = and i64 %170, 63
  %172 = shl i64 %171, 12
  %173 = or i64 %166, %172
  %174 = load i8*, i8** %4, align 8
  %175 = getelementptr inbounds i8, i8* %174, i64 2
  %176 = load i8, i8* %175, align 1
  %177 = sext i8 %176 to i64
  %178 = and i64 %177, 63
  %179 = shl i64 %178, 6
  %180 = or i64 %173, %179
  %181 = load i8*, i8** %4, align 8
  %182 = getelementptr inbounds i8, i8* %181, i64 3
  %183 = load i8, i8* %182, align 1
  %184 = sext i8 %183 to i64
  %185 = and i64 %184, 63
  %186 = shl i64 %185, 0
  %187 = or i64 %180, %186
  %188 = load i64*, i64** %5, align 8
  store i64 %187, i64* %188, align 8
  %189 = load i64*, i64** %5, align 8
  %190 = load i64, i64* %189, align 8
  %191 = icmp uge i64 %190, 65536
  br i1 %191, label %192, label %200

; <label>:192:                                    ; preds = %160
  %pgocount11 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 24)
  %193 = add i64 %pgocount11, 1
  store i64 %193, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 24)
  %194 = load i8*, i8** %4, align 8
  %195 = load i8*, i8** %6, align 8
  %196 = ptrtoint i8* %194 to i64
  %197 = ptrtoint i8* %195 to i64
  %198 = sub i64 %196, %197
  %199 = add nsw i64 %198, 4
  store i64 %199, i64* %3, align 8
  br label %402

; <label>:200:                                    ; preds = %160
  %pgocount12 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 15)
  %201 = add i64 %pgocount12, 1
  store i64 %201, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 15)
  br label %396

; <label>:202:                                    ; preds = %152, %144, %136, %129
  %203 = load i8*, i8** %4, align 8
  %204 = getelementptr inbounds i8, i8* %203, i64 0
  %205 = load i8, i8* %204, align 1
  %206 = sext i8 %205 to i32
  %207 = and i32 %206, 252
  %208 = icmp eq i32 %207, 248
  br i1 %208, label %209, label %290

; <label>:209:                                    ; preds = %202
  %pgocount13 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 4)
  %210 = add i64 %pgocount13, 1
  store i64 %210, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 4)
  %211 = load i8*, i8** %4, align 8
  %212 = getelementptr inbounds i8, i8* %211, i64 1
  %213 = load i8, i8* %212, align 1
  %214 = sext i8 %213 to i32
  %215 = and i32 %214, 192
  %216 = icmp eq i32 %215, 128
  br i1 %216, label %217, label %290

; <label>:217:                                    ; preds = %209
  %pgocount14 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 9)
  %218 = add i64 %pgocount14, 1
  store i64 %218, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 9)
  %219 = load i8*, i8** %4, align 8
  %220 = getelementptr inbounds i8, i8* %219, i64 2
  %221 = load i8, i8* %220, align 1
  %222 = sext i8 %221 to i32
  %223 = and i32 %222, 192
  %224 = icmp eq i32 %223, 128
  br i1 %224, label %225, label %290

; <label>:225:                                    ; preds = %217
  %pgocount15 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 13)
  %226 = add i64 %pgocount15, 1
  store i64 %226, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 13)
  %227 = load i8*, i8** %4, align 8
  %228 = getelementptr inbounds i8, i8* %227, i64 3
  %229 = load i8, i8* %228, align 1
  %230 = sext i8 %229 to i32
  %231 = and i32 %230, 192
  %232 = icmp eq i32 %231, 128
  br i1 %232, label %233, label %290

; <label>:233:                                    ; preds = %225
  %pgocount16 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 16)
  %234 = add i64 %pgocount16, 1
  store i64 %234, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 16)
  %235 = load i8*, i8** %4, align 8
  %236 = getelementptr inbounds i8, i8* %235, i64 4
  %237 = load i8, i8* %236, align 1
  %238 = sext i8 %237 to i32
  %239 = and i32 %238, 192
  %240 = icmp eq i32 %239, 128
  br i1 %240, label %241, label %290

; <label>:241:                                    ; preds = %233
  %242 = load i8*, i8** %4, align 8
  %243 = getelementptr inbounds i8, i8* %242, i64 0
  %244 = load i8, i8* %243, align 1
  %245 = sext i8 %244 to i64
  %246 = and i64 %245, 3
  %247 = shl i64 %246, 24
  %248 = load i8*, i8** %4, align 8
  %249 = getelementptr inbounds i8, i8* %248, i64 1
  %250 = load i8, i8* %249, align 1
  %251 = sext i8 %250 to i64
  %252 = and i64 %251, 63
  %253 = shl i64 %252, 18
  %254 = or i64 %247, %253
  %255 = load i8*, i8** %4, align 8
  %256 = getelementptr inbounds i8, i8* %255, i64 2
  %257 = load i8, i8* %256, align 1
  %258 = sext i8 %257 to i64
  %259 = and i64 %258, 63
  %260 = shl i64 %259, 12
  %261 = or i64 %254, %260
  %262 = load i8*, i8** %4, align 8
  %263 = getelementptr inbounds i8, i8* %262, i64 3
  %264 = load i8, i8* %263, align 1
  %265 = sext i8 %264 to i64
  %266 = and i64 %265, 63
  %267 = shl i64 %266, 6
  %268 = or i64 %261, %267
  %269 = load i8*, i8** %4, align 8
  %270 = getelementptr inbounds i8, i8* %269, i64 4
  %271 = load i8, i8* %270, align 1
  %272 = sext i8 %271 to i64
  %273 = and i64 %272, 63
  %274 = shl i64 %273, 0
  %275 = or i64 %268, %274
  %276 = load i64*, i64** %5, align 8
  store i64 %275, i64* %276, align 8
  %277 = load i64*, i64** %5, align 8
  %278 = load i64, i64* %277, align 8
  %279 = icmp uge i64 %278, 2097152
  br i1 %279, label %280, label %288

; <label>:280:                                    ; preds = %241
  %pgocount17 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 25)
  %281 = add i64 %pgocount17, 1
  store i64 %281, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 25)
  %282 = load i8*, i8** %4, align 8
  %283 = load i8*, i8** %6, align 8
  %284 = ptrtoint i8* %282 to i64
  %285 = ptrtoint i8* %283 to i64
  %286 = sub i64 %284, %285
  %287 = add nsw i64 %286, 5
  store i64 %287, i64* %3, align 8
  br label %402

; <label>:288:                                    ; preds = %241
  %pgocount18 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 20)
  %289 = add i64 %pgocount18, 1
  store i64 %289, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 20)
  br label %395

; <label>:290:                                    ; preds = %233, %225, %217, %209, %202
  %291 = load i8*, i8** %4, align 8
  %292 = getelementptr inbounds i8, i8* %291, i64 0
  %293 = load i8, i8* %292, align 1
  %294 = sext i8 %293 to i32
  %295 = and i32 %294, 254
  %296 = icmp eq i32 %295, 252
  br i1 %296, label %297, label %393

; <label>:297:                                    ; preds = %290
  %pgocount19 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 5)
  %298 = add i64 %pgocount19, 1
  store i64 %298, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 5)
  %299 = load i8*, i8** %4, align 8
  %300 = getelementptr inbounds i8, i8* %299, i64 1
  %301 = load i8, i8* %300, align 1
  %302 = sext i8 %301 to i32
  %303 = and i32 %302, 192
  %304 = icmp eq i32 %303, 128
  br i1 %304, label %305, label %393

; <label>:305:                                    ; preds = %297
  %pgocount20 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 10)
  %306 = add i64 %pgocount20, 1
  store i64 %306, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 10)
  %307 = load i8*, i8** %4, align 8
  %308 = getelementptr inbounds i8, i8* %307, i64 2
  %309 = load i8, i8* %308, align 1
  %310 = sext i8 %309 to i32
  %311 = and i32 %310, 192
  %312 = icmp eq i32 %311, 128
  br i1 %312, label %313, label %393

; <label>:313:                                    ; preds = %305
  %pgocount21 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 14)
  %314 = add i64 %pgocount21, 1
  store i64 %314, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 14)
  %315 = load i8*, i8** %4, align 8
  %316 = getelementptr inbounds i8, i8* %315, i64 3
  %317 = load i8, i8* %316, align 1
  %318 = sext i8 %317 to i32
  %319 = and i32 %318, 192
  %320 = icmp eq i32 %319, 128
  br i1 %320, label %321, label %393

; <label>:321:                                    ; preds = %313
  %pgocount22 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 17)
  %322 = add i64 %pgocount22, 1
  store i64 %322, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 17)
  %323 = load i8*, i8** %4, align 8
  %324 = getelementptr inbounds i8, i8* %323, i64 4
  %325 = load i8, i8* %324, align 1
  %326 = sext i8 %325 to i32
  %327 = and i32 %326, 192
  %328 = icmp eq i32 %327, 128
  br i1 %328, label %329, label %393

; <label>:329:                                    ; preds = %321
  %pgocount23 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 19)
  %330 = add i64 %pgocount23, 1
  store i64 %330, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 19)
  %331 = load i8*, i8** %4, align 8
  %332 = getelementptr inbounds i8, i8* %331, i64 5
  %333 = load i8, i8* %332, align 1
  %334 = sext i8 %333 to i32
  %335 = and i32 %334, 192
  %336 = icmp eq i32 %335, 128
  br i1 %336, label %337, label %393

; <label>:337:                                    ; preds = %329
  %338 = load i8*, i8** %4, align 8
  %339 = getelementptr inbounds i8, i8* %338, i64 0
  %340 = load i8, i8* %339, align 1
  %341 = sext i8 %340 to i64
  %342 = and i64 %341, 1
  %343 = shl i64 %342, 30
  %344 = load i8*, i8** %4, align 8
  %345 = getelementptr inbounds i8, i8* %344, i64 1
  %346 = load i8, i8* %345, align 1
  %347 = sext i8 %346 to i64
  %348 = and i64 %347, 63
  %349 = shl i64 %348, 24
  %350 = or i64 %343, %349
  %351 = load i8*, i8** %4, align 8
  %352 = getelementptr inbounds i8, i8* %351, i64 2
  %353 = load i8, i8* %352, align 1
  %354 = sext i8 %353 to i64
  %355 = and i64 %354, 63
  %356 = shl i64 %355, 18
  %357 = or i64 %350, %356
  %358 = load i8*, i8** %4, align 8
  %359 = getelementptr inbounds i8, i8* %358, i64 3
  %360 = load i8, i8* %359, align 1
  %361 = sext i8 %360 to i64
  %362 = and i64 %361, 63
  %363 = shl i64 %362, 12
  %364 = or i64 %357, %363
  %365 = load i8*, i8** %4, align 8
  %366 = getelementptr inbounds i8, i8* %365, i64 4
  %367 = load i8, i8* %366, align 1
  %368 = sext i8 %367 to i64
  %369 = and i64 %368, 63
  %370 = shl i64 %369, 6
  %371 = or i64 %364, %370
  %372 = load i8*, i8** %4, align 8
  %373 = getelementptr inbounds i8, i8* %372, i64 5
  %374 = load i8, i8* %373, align 1
  %375 = sext i8 %374 to i64
  %376 = and i64 %375, 63
  %377 = shl i64 %376, 0
  %378 = or i64 %371, %377
  %379 = load i64*, i64** %5, align 8
  store i64 %378, i64* %379, align 8
  %380 = load i64*, i64** %5, align 8
  %381 = load i64, i64* %380, align 8
  %382 = icmp uge i64 %381, 67108864
  br i1 %382, label %383, label %391

; <label>:383:                                    ; preds = %337
  %pgocount24 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 26)
  %384 = add i64 %pgocount24, 1
  store i64 %384, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 26)
  %385 = load i8*, i8** %4, align 8
  %386 = load i8*, i8** %6, align 8
  %387 = ptrtoint i8* %385 to i64
  %388 = ptrtoint i8* %386 to i64
  %389 = sub i64 %387, %388
  %390 = add nsw i64 %389, 6
  store i64 %390, i64* %3, align 8
  br label %402

; <label>:391:                                    ; preds = %337
  %pgocount25 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 21)
  %392 = add i64 %pgocount25, 1
  store i64 %392, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 21)
  br label %393

; <label>:393:                                    ; preds = %391, %329, %321, %313, %305, %297, %290
  %pgocount26 = load i64, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 0)
  %394 = add i64 %pgocount26, 1
  store i64 %394, i64* getelementptr inbounds ([27 x i64], [27 x i64]* @__profc_id3_utf8_decodechar, i64 0, i64 0)
  br label %395

; <label>:395:                                    ; preds = %393, %288
  br label %396

; <label>:396:                                    ; preds = %395, %200
  br label %397

; <label>:397:                                    ; preds = %396, %127
  br label %398

; <label>:398:                                    ; preds = %397, %69
  br label %399

; <label>:399:                                    ; preds = %398
  %400 = load i8*, i8** %4, align 8
  %401 = getelementptr inbounds i8, i8* %400, i32 1
  store i8* %401, i8** %4, align 8
  br label %8

; <label>:402:                                    ; preds = %383, %280, %192, %119, %61, %15
  %403 = load i64, i64* %3, align 8
  ret i64 %403
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_encodechar(i8*, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = icmp ule i64 %6, 127
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 0)
  %10 = load i64, i64* %5, align 8
  %11 = trunc i64 %10 to i8
  %12 = load i8*, i8** %4, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  store i8 %11, i8* %13, align 1
  store i64 1, i64* %3, align 8
  br label %188

; <label>:14:                                     ; preds = %2
  %15 = load i64, i64* %5, align 8
  %16 = icmp ule i64 %15, 2047
  br i1 %16, label %17, label %33

; <label>:17:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 1)
  %19 = load i64, i64* %5, align 8
  %20 = lshr i64 %19, 6
  %21 = and i64 %20, 31
  %22 = or i64 192, %21
  %23 = trunc i64 %22 to i8
  %24 = load i8*, i8** %4, align 8
  %25 = getelementptr inbounds i8, i8* %24, i64 0
  store i8 %23, i8* %25, align 1
  %26 = load i64, i64* %5, align 8
  %27 = lshr i64 %26, 0
  %28 = and i64 %27, 63
  %29 = or i64 128, %28
  %30 = trunc i64 %29 to i8
  %31 = load i8*, i8** %4, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 1
  store i8 %30, i8* %32, align 1
  store i64 2, i64* %3, align 8
  br label %188

; <label>:33:                                     ; preds = %14
  %34 = load i64, i64* %5, align 8
  %35 = icmp ule i64 %34, 65535
  br i1 %35, label %36, label %59

; <label>:36:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 2)
  %38 = load i64, i64* %5, align 8
  %39 = lshr i64 %38, 12
  %40 = and i64 %39, 15
  %41 = or i64 224, %40
  %42 = trunc i64 %41 to i8
  %43 = load i8*, i8** %4, align 8
  %44 = getelementptr inbounds i8, i8* %43, i64 0
  store i8 %42, i8* %44, align 1
  %45 = load i64, i64* %5, align 8
  %46 = lshr i64 %45, 6
  %47 = and i64 %46, 63
  %48 = or i64 128, %47
  %49 = trunc i64 %48 to i8
  %50 = load i8*, i8** %4, align 8
  %51 = getelementptr inbounds i8, i8* %50, i64 1
  store i8 %49, i8* %51, align 1
  %52 = load i64, i64* %5, align 8
  %53 = lshr i64 %52, 0
  %54 = and i64 %53, 63
  %55 = or i64 128, %54
  %56 = trunc i64 %55 to i8
  %57 = load i8*, i8** %4, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 2
  store i8 %56, i8* %58, align 1
  store i64 3, i64* %3, align 8
  br label %188

; <label>:59:                                     ; preds = %33
  %60 = load i64, i64* %5, align 8
  %61 = icmp ule i64 %60, 2097151
  br i1 %61, label %62, label %92

; <label>:62:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 3)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 3)
  %64 = load i64, i64* %5, align 8
  %65 = lshr i64 %64, 18
  %66 = and i64 %65, 7
  %67 = or i64 240, %66
  %68 = trunc i64 %67 to i8
  %69 = load i8*, i8** %4, align 8
  %70 = getelementptr inbounds i8, i8* %69, i64 0
  store i8 %68, i8* %70, align 1
  %71 = load i64, i64* %5, align 8
  %72 = lshr i64 %71, 12
  %73 = and i64 %72, 63
  %74 = or i64 128, %73
  %75 = trunc i64 %74 to i8
  %76 = load i8*, i8** %4, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 1
  store i8 %75, i8* %77, align 1
  %78 = load i64, i64* %5, align 8
  %79 = lshr i64 %78, 6
  %80 = and i64 %79, 63
  %81 = or i64 128, %80
  %82 = trunc i64 %81 to i8
  %83 = load i8*, i8** %4, align 8
  %84 = getelementptr inbounds i8, i8* %83, i64 2
  store i8 %82, i8* %84, align 1
  %85 = load i64, i64* %5, align 8
  %86 = lshr i64 %85, 0
  %87 = and i64 %86, 63
  %88 = or i64 128, %87
  %89 = trunc i64 %88 to i8
  %90 = load i8*, i8** %4, align 8
  %91 = getelementptr inbounds i8, i8* %90, i64 3
  store i8 %89, i8* %91, align 1
  store i64 4, i64* %3, align 8
  br label %188

; <label>:92:                                     ; preds = %59
  %93 = load i64, i64* %5, align 8
  %94 = icmp ule i64 %93, 67108863
  br i1 %94, label %95, label %132

; <label>:95:                                     ; preds = %92
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 4)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 4)
  %97 = load i64, i64* %5, align 8
  %98 = lshr i64 %97, 24
  %99 = and i64 %98, 3
  %100 = or i64 248, %99
  %101 = trunc i64 %100 to i8
  %102 = load i8*, i8** %4, align 8
  %103 = getelementptr inbounds i8, i8* %102, i64 0
  store i8 %101, i8* %103, align 1
  %104 = load i64, i64* %5, align 8
  %105 = lshr i64 %104, 18
  %106 = and i64 %105, 63
  %107 = or i64 128, %106
  %108 = trunc i64 %107 to i8
  %109 = load i8*, i8** %4, align 8
  %110 = getelementptr inbounds i8, i8* %109, i64 1
  store i8 %108, i8* %110, align 1
  %111 = load i64, i64* %5, align 8
  %112 = lshr i64 %111, 12
  %113 = and i64 %112, 63
  %114 = or i64 128, %113
  %115 = trunc i64 %114 to i8
  %116 = load i8*, i8** %4, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 2
  store i8 %115, i8* %117, align 1
  %118 = load i64, i64* %5, align 8
  %119 = lshr i64 %118, 6
  %120 = and i64 %119, 63
  %121 = or i64 128, %120
  %122 = trunc i64 %121 to i8
  %123 = load i8*, i8** %4, align 8
  %124 = getelementptr inbounds i8, i8* %123, i64 3
  store i8 %122, i8* %124, align 1
  %125 = load i64, i64* %5, align 8
  %126 = lshr i64 %125, 0
  %127 = and i64 %126, 63
  %128 = or i64 128, %127
  %129 = trunc i64 %128 to i8
  %130 = load i8*, i8** %4, align 8
  %131 = getelementptr inbounds i8, i8* %130, i64 4
  store i8 %129, i8* %131, align 1
  store i64 5, i64* %3, align 8
  br label %188

; <label>:132:                                    ; preds = %92
  %133 = load i64, i64* %5, align 8
  %134 = icmp ule i64 %133, 2147483647
  br i1 %134, label %135, label %179

; <label>:135:                                    ; preds = %132
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 5)
  %136 = add i64 %pgocount5, 1
  store i64 %136, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 5)
  %137 = load i64, i64* %5, align 8
  %138 = lshr i64 %137, 30
  %139 = and i64 %138, 1
  %140 = or i64 252, %139
  %141 = trunc i64 %140 to i8
  %142 = load i8*, i8** %4, align 8
  %143 = getelementptr inbounds i8, i8* %142, i64 0
  store i8 %141, i8* %143, align 1
  %144 = load i64, i64* %5, align 8
  %145 = lshr i64 %144, 24
  %146 = and i64 %145, 63
  %147 = or i64 128, %146
  %148 = trunc i64 %147 to i8
  %149 = load i8*, i8** %4, align 8
  %150 = getelementptr inbounds i8, i8* %149, i64 1
  store i8 %148, i8* %150, align 1
  %151 = load i64, i64* %5, align 8
  %152 = lshr i64 %151, 18
  %153 = and i64 %152, 63
  %154 = or i64 128, %153
  %155 = trunc i64 %154 to i8
  %156 = load i8*, i8** %4, align 8
  %157 = getelementptr inbounds i8, i8* %156, i64 2
  store i8 %155, i8* %157, align 1
  %158 = load i64, i64* %5, align 8
  %159 = lshr i64 %158, 12
  %160 = and i64 %159, 63
  %161 = or i64 128, %160
  %162 = trunc i64 %161 to i8
  %163 = load i8*, i8** %4, align 8
  %164 = getelementptr inbounds i8, i8* %163, i64 3
  store i8 %162, i8* %164, align 1
  %165 = load i64, i64* %5, align 8
  %166 = lshr i64 %165, 6
  %167 = and i64 %166, 63
  %168 = or i64 128, %167
  %169 = trunc i64 %168 to i8
  %170 = load i8*, i8** %4, align 8
  %171 = getelementptr inbounds i8, i8* %170, i64 4
  store i8 %169, i8* %171, align 1
  %172 = load i64, i64* %5, align 8
  %173 = lshr i64 %172, 0
  %174 = and i64 %173, 63
  %175 = or i64 128, %174
  %176 = trunc i64 %175 to i8
  %177 = load i8*, i8** %4, align 8
  %178 = getelementptr inbounds i8, i8* %177, i64 5
  store i8 %176, i8* %178, align 1
  store i64 6, i64* %3, align 8
  br label %188

; <label>:179:                                    ; preds = %132
  br label %180

; <label>:180:                                    ; preds = %179
  br label %181

; <label>:181:                                    ; preds = %180
  br label %182

; <label>:182:                                    ; preds = %181
  br label %183

; <label>:183:                                    ; preds = %182
  br label %184

; <label>:184:                                    ; preds = %183
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 6)
  %185 = add i64 %pgocount6, 1
  store i64 %185, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_utf8_encodechar, i64 0, i64 6)
  %186 = load i8*, i8** %4, align 8
  %187 = call i64 @id3_utf8_encodechar(i8* %186, i64 183)
  store i64 %187, i64* %3, align 8
  br label %188

; <label>:188:                                    ; preds = %184, %135, %95, %62, %36, %17, %8
  %189 = load i64, i64* %3, align 8
  ret i64 %189
}

; Function Attrs: noinline nounwind uwtable
define void @id3_utf8_decode(i8*, i64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_decode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_decode, i64 0, i64 0)
  %7 = load i8*, i8** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = call i64 @id3_utf8_decodechar(i8* %7, i64* %8)
  %10 = load i8*, i8** %3, align 8
  %11 = getelementptr inbounds i8, i8* %10, i64 %9
  store i8* %11, i8** %3, align 8
  br label %12

; <label>:12:                                     ; preds = %5
  %13 = load i64*, i64** %4, align 8
  %14 = getelementptr inbounds i64, i64* %13, i32 1
  store i64* %14, i64** %4, align 8
  %15 = load i64, i64* %13, align 8
  %16 = icmp ne i64 %15, 0
  br i1 %16, label %5, label %17

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_decode, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_decode, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @id3_utf8_encode(i8*, i64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %13, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_encode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_encode, i64 0, i64 0)
  %7 = load i8*, i8** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = load i64, i64* %8, align 8
  %10 = call i64 @id3_utf8_encodechar(i8* %7, i64 %9)
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i64 %10
  store i8* %12, i8** %3, align 8
  br label %13

; <label>:13:                                     ; preds = %5
  %14 = load i64*, i64** %4, align 8
  %15 = getelementptr inbounds i64, i64* %14, i32 1
  store i64* %15, i64** %4, align 8
  %16 = load i64, i64* %14, align 8
  %17 = icmp ne i64 %16, 0
  br i1 %17, label %5, label %18

; <label>:18:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_encode, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_encode, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_put(i8**, i8 signext) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i8, align 1
  store i8** %0, i8*** %3, align 8
  store i8 %1, i8* %4, align 1
  %5 = load i8**, i8*** %3, align 8
  %6 = icmp ne i8** %5, null
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_put, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_put, i64 0, i64 1)
  %9 = load i8, i8* %4, align 1
  %10 = load i8**, i8*** %3, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %10, align 8
  store i8 %9, i8* %11, align 1
  br label %13

; <label>:13:                                     ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_put, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_utf8_put, i64 0, i64 0)
  ret i64 1
}

; Function Attrs: noinline nounwind uwtable
define signext i8 @id3_utf8_get(i8**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_utf8_get, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_utf8_get, i64 0, i64 0)
  %3 = alloca i8**, align 8
  store i8** %0, i8*** %3, align 8
  %4 = load i8**, i8*** %3, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %6, i8** %4, align 8
  %7 = load i8, i8* %5, align 1
  ret i8 %7
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_utf8_serialize(i8**, i64*, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca [6 x i8], align 1
  %9 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i64* %1, i64** %5, align 8
  store i32 %2, i32* %6, align 4
  store i64 0, i64* %7, align 8
  br label %10

; <label>:10:                                     ; preds = %76, %3
  %11 = load i64*, i64** %5, align 8
  %12 = load i64, i64* %11, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %78

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds [6 x i8], [6 x i8]* %8, i32 0, i32 0
  store i8* %15, i8** %9, align 8
  %16 = load i64*, i64** %5, align 8
  %17 = getelementptr inbounds i64, i64* %16, i32 1
  store i64* %17, i64** %5, align 8
  %18 = load i64, i64* %16, align 8
  %19 = call i64 @id3_utf8_encodechar(i8* %15, i64 %18)
  switch i64 %19, label %76 [
    i64 6, label %20
    i64 5, label %29
    i64 4, label %38
    i64 3, label %47
    i64 2, label %56
    i64 1, label %65
    i64 0, label %74
  ]

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 7)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 7)
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %9, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %9, align 8
  %25 = load i8, i8* %23, align 1
  %26 = call i64 @id3_utf8_put(i8** %22, i8 signext %25)
  %27 = load i64, i64* %7, align 8
  %28 = add i64 %27, %26
  store i64 %28, i64* %7, align 8
  br label %29

; <label>:29:                                     ; preds = %20, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 6)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 6)
  %31 = load i8**, i8*** %4, align 8
  %32 = load i8*, i8** %9, align 8
  %33 = getelementptr inbounds i8, i8* %32, i32 1
  store i8* %33, i8** %9, align 8
  %34 = load i8, i8* %32, align 1
  %35 = call i64 @id3_utf8_put(i8** %31, i8 signext %34)
  %36 = load i64, i64* %7, align 8
  %37 = add i64 %36, %35
  store i64 %37, i64* %7, align 8
  br label %38

; <label>:38:                                     ; preds = %29, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 5)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 5)
  %40 = load i8**, i8*** %4, align 8
  %41 = load i8*, i8** %9, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %9, align 8
  %43 = load i8, i8* %41, align 1
  %44 = call i64 @id3_utf8_put(i8** %40, i8 signext %43)
  %45 = load i64, i64* %7, align 8
  %46 = add i64 %45, %44
  store i64 %46, i64* %7, align 8
  br label %47

; <label>:47:                                     ; preds = %38, %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 4)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 4)
  %49 = load i8**, i8*** %4, align 8
  %50 = load i8*, i8** %9, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 1
  store i8* %51, i8** %9, align 8
  %52 = load i8, i8* %50, align 1
  %53 = call i64 @id3_utf8_put(i8** %49, i8 signext %52)
  %54 = load i64, i64* %7, align 8
  %55 = add i64 %54, %53
  store i64 %55, i64* %7, align 8
  br label %56

; <label>:56:                                     ; preds = %47, %14
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 3)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 3)
  %58 = load i8**, i8*** %4, align 8
  %59 = load i8*, i8** %9, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %9, align 8
  %61 = load i8, i8* %59, align 1
  %62 = call i64 @id3_utf8_put(i8** %58, i8 signext %61)
  %63 = load i64, i64* %7, align 8
  %64 = add i64 %63, %62
  store i64 %64, i64* %7, align 8
  br label %65

; <label>:65:                                     ; preds = %56, %14
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 2)
  %66 = add i64 %pgocount5, 1
  store i64 %66, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 2)
  %67 = load i8**, i8*** %4, align 8
  %68 = load i8*, i8** %9, align 8
  %69 = getelementptr inbounds i8, i8* %68, i32 1
  store i8* %69, i8** %9, align 8
  %70 = load i8, i8* %68, align 1
  %71 = call i64 @id3_utf8_put(i8** %67, i8 signext %70)
  %72 = load i64, i64* %7, align 8
  %73 = add i64 %72, %71
  store i64 %73, i64* %7, align 8
  br label %74

; <label>:74:                                     ; preds = %65, %14
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 1)
  %75 = add i64 %pgocount6, 1
  store i64 %75, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 1)
  br label %76

; <label>:76:                                     ; preds = %74, %14
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 0)
  %77 = add i64 %pgocount7, 1
  store i64 %77, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 0)
  br label %10

; <label>:78:                                     ; preds = %10
  %79 = load i32, i32* %6, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %87

; <label>:81:                                     ; preds = %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 9)
  %82 = add i64 %pgocount8, 1
  store i64 %82, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 9)
  %83 = load i8**, i8*** %4, align 8
  %84 = call i64 @id3_utf8_put(i8** %83, i8 signext 0)
  %85 = load i64, i64* %7, align 8
  %86 = add i64 %85, %84
  store i64 %86, i64* %7, align 8
  br label %87

; <label>:87:                                     ; preds = %81, %78
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 8)
  %88 = add i64 %pgocount9, 1
  store i64 %88, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_id3_utf8_serialize, i64 0, i64 8)
  %89 = load i64, i64* %7, align 8
  ret i64 %89
}

; Function Attrs: noinline nounwind uwtable
define i64* @id3_utf8_deserialize(i8**, i64) #0 {
  %3 = alloca i64*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64*, align 8
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  %10 = load i8**, i8*** %4, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = load i64, i64* %5, align 8
  %13 = getelementptr inbounds i8, i8* %11, i64 %12
  store i8* %13, i8** %6, align 8
  %14 = load i64, i64* %5, align 8
  %15 = add i64 %14, 1
  %16 = mul i64 %15, 1
  %17 = call noalias i8* @malloc(i64 %16) #2
  store i8* %17, i8** %8, align 8
  %18 = load i8*, i8** %8, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 4)
  store i64* null, i64** %3, align 8
  br label %63

; <label>:22:                                     ; preds = %2
  %23 = load i8*, i8** %8, align 8
  store i8* %23, i8** %7, align 8
  br label %24

; <label>:24:                                     ; preds = %41, %22
  %25 = load i8*, i8** %6, align 8
  %26 = load i8**, i8*** %4, align 8
  %27 = load i8*, i8** %26, align 8
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %27 to i64
  %30 = sub i64 %28, %29
  %31 = icmp sgt i64 %30, 0
  br i1 %31, label %32, label %39

; <label>:32:                                     ; preds = %24
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 1)
  %34 = load i8**, i8*** %4, align 8
  %35 = call signext i8 @id3_utf8_get(i8** %34)
  %36 = load i8*, i8** %7, align 8
  store i8 %35, i8* %36, align 1
  %37 = sext i8 %35 to i32
  %38 = icmp ne i32 %37, 0
  br label %39

; <label>:39:                                     ; preds = %32, %24
  %40 = phi i1 [ false, %24 ], [ %38, %32 ]
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 0)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 0)
  %43 = load i8*, i8** %7, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %7, align 8
  br label %24

; <label>:45:                                     ; preds = %39
  %46 = load i8*, i8** %7, align 8
  store i8 0, i8* %46, align 1
  %47 = load i8*, i8** %8, align 8
  %48 = call i64 @id3_utf8_length(i8* %47)
  %49 = add i64 %48, 1
  %50 = mul i64 %49, 8
  %51 = call noalias i8* @malloc(i64 %50) #2
  %52 = bitcast i8* %51 to i64*
  store i64* %52, i64** %9, align 8
  %53 = load i64*, i64** %9, align 8
  %54 = icmp ne i64* %53, null
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 3)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 3)
  %57 = load i8*, i8** %8, align 8
  %58 = load i64*, i64** %9, align 8
  call void @id3_utf8_decode(i8* %57, i64* %58)
  br label %59

; <label>:59:                                     ; preds = %55, %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_utf8_deserialize, i64 0, i64 2)
  %61 = load i8*, i8** %8, align 8
  call void @free(i8* %61) #2
  %62 = load i64*, i64** %9, align 8
  store i64* %62, i64** %3, align 8
  br label %63

; <label>:63:                                     ; preds = %59, %20
  %64 = load i64*, i64** %3, align 8
  ret i64* %64
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

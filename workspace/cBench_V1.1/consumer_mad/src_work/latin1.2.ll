; ModuleID = 'tmp1.ll'
source_filename = "latin1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_latin1_length = private constant [17 x i8] c"id3_latin1_length"
@__profn_id3_latin1_size = private constant [15 x i8] c"id3_latin1_size"
@__profn_id3_latin1_copy = private constant [15 x i8] c"id3_latin1_copy"
@__profn_id3_latin1_duplicate = private constant [20 x i8] c"id3_latin1_duplicate"
@__profn_id3_latin1_decodechar = private constant [21 x i8] c"id3_latin1_decodechar"
@__profn_id3_latin1_encodechar = private constant [21 x i8] c"id3_latin1_encodechar"
@__profn_id3_latin1_decode = private constant [17 x i8] c"id3_latin1_decode"
@__profn_id3_latin1_encode = private constant [17 x i8] c"id3_latin1_encode"
@__profn_id3_latin1_put = private constant [14 x i8] c"id3_latin1_put"
@__profn_id3_latin1_get = private constant [14 x i8] c"id3_latin1_get"
@__profn_id3_latin1_serialize = private constant [20 x i8] c"id3_latin1_serialize"
@__profn_id3_latin1_deserialize = private constant [22 x i8] c"id3_latin1_deserialize"
@__profc_id3_latin1_length = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_length = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8242697545579386697, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_length, i32 0, i32 0), i8* bitcast (i64 (i8*)* @id3_latin1_length to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_size = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_size = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1008090553707881421, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_size, i32 0, i32 0), i8* bitcast (i64 (i8*)* @id3_latin1_size to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_copy = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_copy = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -502643830209608205, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_copy, i32 0, i32 0), i8* bitcast (void (i8*, i8*)* @id3_latin1_copy to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_duplicate = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_duplicate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6964726368120058499, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_duplicate, i32 0, i32 0), i8* bitcast (i8* (i8*)* @id3_latin1_duplicate to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_decodechar = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_decodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7393453850290007244, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_decodechar, i32 0, i32 0), i8* bitcast (i64 (i8*, i64*)* @id3_latin1_decodechar to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_encodechar = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_encodechar = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1110617423921537924, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encodechar, i32 0, i32 0), i8* bitcast (i64 (i8*, i64)* @id3_latin1_encodechar to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_decode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_decode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5478116984759380986, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_decode, i32 0, i32 0), i8* bitcast (void (i8*, i64*)* @id3_latin1_decode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_encode = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_encode = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4111868294722326189, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encode, i32 0, i32 0), i8* bitcast (void (i8*, i64*)* @id3_latin1_encode to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_put = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_put = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7432903792355169032, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_put, i32 0, i32 0), i8* bitcast (i64 (i8**, i8)* @id3_latin1_put to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_get = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_get = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3480904648660092580, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_get, i32 0, i32 0), i8* bitcast (i8 (i8**)* @id3_latin1_get to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_serialize = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_serialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2350776438061716768, i64 63383410321, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i32 0, i32 0), i8* bitcast (i64 (i8**, i64*, i32)* @id3_latin1_serialize to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_latin1_deserialize = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_latin1_deserialize = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3531066231075173368, i64 69969360692, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i32 0, i32 0), i8* bitcast (i64* (i8**, i64)* @id3_latin1_deserialize to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [94 x i8] c"\E0\01[x\DAm\8EA\0A\C0 \0C\04\E9\93J\1F$\C1\04\0D\04\15\8D\07\FB\FA\16\0Aml{\D8\C3\0CsX\C6\CD\09(\A7\D5\09\A5\A0q\E1\C74\DE\C9\B2\CFeX\C6^\84=\E8\14!\F9|.B\B5\96\D2\9F\BD\DAogM\E9j1\D0\84\8D*\83\BC~\22\DD\FA\00\D7\83Q\E5", section "__llvm_prf_names"
@llvm.used = appending global [13 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_length to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_size to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_copy to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_duplicate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_decodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_encodechar to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_decode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_encode to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_put to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_get to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_serialize to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_latin1_deserialize to i8*), i8* getelementptr inbounds ([94 x i8], [94 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_length(i8*) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_length, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_length, i64 0, i64 0)
  %11 = load i8*, i8** %3, align 8
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %3, align 8
  br label %5

; <label>:13:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_length, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_length, i64 0, i64 1)
  %15 = load i8*, i8** %3, align 8
  %16 = load i8*, i8** %2, align 8
  %17 = ptrtoint i8* %15 to i64
  %18 = ptrtoint i8* %16 to i64
  %19 = sub i64 %17, %18
  ret i64 %19
}

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_size(i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_size, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_size, i64 0, i64 0)
  %3 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  %4 = load i8*, i8** %3, align 8
  %5 = call i64 @id3_latin1_length(i8* %4)
  %6 = add i64 %5, 1
  ret i64 %6
}

; Function Attrs: nounwind uwtable
define void @id3_latin1_copy(i8*, i8*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %6 = load i8*, i8** %4, align 8
  %7 = getelementptr inbounds i8, i8* %6, i32 1
  store i8* %7, i8** %4, align 8
  %8 = load i8, i8* %6, align 1
  %9 = load i8*, i8** %3, align 8
  %10 = getelementptr inbounds i8, i8* %9, i32 1
  store i8* %10, i8** %3, align 8
  store i8 %8, i8* %9, align 1
  %11 = icmp ne i8 %8, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_copy, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_copy, i64 0, i64 0)
  br label %5

; <label>:14:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_copy, i64 0, i64 1)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_copy, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i8* @id3_latin1_duplicate(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i8*, align 8
  store i8* %0, i8** %2, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = call i64 @id3_latin1_size(i8* %4)
  %6 = mul i64 %5, 1
  %7 = call noalias i8* @malloc(i64 %6) #2
  store i8* %7, i8** %3, align 8
  %8 = load i8*, i8** %3, align 8
  %9 = icmp ne i8* %8, null
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_duplicate, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_duplicate, i64 0, i64 1)
  %12 = load i8*, i8** %3, align 8
  %13 = load i8*, i8** %2, align 8
  call void @id3_latin1_copy(i8* %12, i8* %13)
  br label %14

; <label>:14:                                     ; preds = %10, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_duplicate, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_duplicate, i64 0, i64 0)
  %16 = load i8*, i8** %3, align 8
  ret i8* %16
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_decodechar(i8*, i64*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_decodechar, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_decodechar, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i64*, align 8
  store i8* %0, i8** %4, align 8
  store i64* %1, i64** %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = load i64*, i64** %5, align 8
  store i64 %8, i64* %9, align 8
  ret i64 1
}

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_encodechar(i8*, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = trunc i64 %5 to i8
  %7 = load i8*, i8** %3, align 8
  store i8 %6, i8* %7, align 1
  %8 = load i64, i64* %4, align 8
  %9 = icmp ugt i64 %8, 255
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encodechar, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encodechar, i64 0, i64 1)
  %12 = load i8*, i8** %3, align 8
  store i8 -73, i8* %12, align 1
  br label %13

; <label>:13:                                     ; preds = %10, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encodechar, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encodechar, i64 0, i64 0)
  ret i64 1
}

; Function Attrs: nounwind uwtable
define void @id3_latin1_decode(i8*, i64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %12, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_decode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_decode, i64 0, i64 0)
  %7 = load i8*, i8** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = call i64 @id3_latin1_decodechar(i8* %7, i64* %8)
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_decode, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_decode, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @id3_latin1_encode(i8*, i64*) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64*, align 8
  store i8* %0, i8** %3, align 8
  store i64* %1, i64** %4, align 8
  br label %5

; <label>:5:                                      ; preds = %13, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encode, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encode, i64 0, i64 0)
  %7 = load i8*, i8** %3, align 8
  %8 = load i64*, i64** %4, align 8
  %9 = load i64, i64* %8, align 8
  %10 = call i64 @id3_latin1_encodechar(i8* %7, i64 %9)
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encode, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_encode, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_put(i8**, i8 zeroext) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i8, align 1
  store i8** %0, i8*** %3, align 8
  store i8 %1, i8* %4, align 1
  %5 = load i8**, i8*** %3, align 8
  %6 = icmp ne i8** %5, null
  br i1 %6, label %7, label %13

; <label>:7:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_put, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_put, i64 0, i64 1)
  %9 = load i8, i8* %4, align 1
  %10 = load i8**, i8*** %3, align 8
  %11 = load i8*, i8** %10, align 8
  %12 = getelementptr inbounds i8, i8* %11, i32 1
  store i8* %12, i8** %10, align 8
  store i8 %9, i8* %11, align 1
  br label %13

; <label>:13:                                     ; preds = %7, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_put, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_latin1_put, i64 0, i64 0)
  ret i64 1
}

; Function Attrs: nounwind uwtable
define zeroext i8 @id3_latin1_get(i8**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_get, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_id3_latin1_get, i64 0, i64 0)
  %3 = alloca i8**, align 8
  store i8** %0, i8*** %3, align 8
  %4 = load i8**, i8*** %3, align 8
  %5 = load i8*, i8** %4, align 8
  %6 = getelementptr inbounds i8, i8* %5, i32 1
  store i8* %6, i8** %4, align 8
  %7 = load i8, i8* %5, align 1
  ret i8 %7
}

; Function Attrs: nounwind uwtable
define i64 @id3_latin1_serialize(i8**, i64*, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca [1 x i8], align 1
  %9 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i64* %1, i64** %5, align 8
  store i32 %2, i32* %6, align 4
  store i64 0, i64* %7, align 8
  br label %10

; <label>:10:                                     ; preds = %31, %3
  %11 = load i64*, i64** %5, align 8
  %12 = load i64, i64* %11, align 8
  %13 = icmp ne i64 %12, 0
  br i1 %13, label %14, label %33

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds [1 x i8], [1 x i8]* %8, i32 0, i32 0
  store i8* %15, i8** %9, align 8
  %16 = load i64*, i64** %5, align 8
  %17 = getelementptr inbounds i64, i64* %16, i32 1
  store i64* %17, i64** %5, align 8
  %18 = load i64, i64* %16, align 8
  %19 = call i64 @id3_latin1_encodechar(i8* %15, i64 %18)
  switch i64 %19, label %31 [
    i64 1, label %20
    i64 0, label %29
  ]

; <label>:20:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 2)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 2)
  %22 = load i8**, i8*** %4, align 8
  %23 = load i8*, i8** %9, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %9, align 8
  %25 = load i8, i8* %23, align 1
  %26 = call i64 @id3_latin1_put(i8** %22, i8 zeroext %25)
  %27 = load i64, i64* %7, align 8
  %28 = add i64 %27, %26
  store i64 %28, i64* %7, align 8
  br label %29

; <label>:29:                                     ; preds = %20, %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 1)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 1)
  br label %31

; <label>:31:                                     ; preds = %29, %14
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 0)
  br label %10

; <label>:33:                                     ; preds = %10
  %34 = load i32, i32* %6, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %42

; <label>:36:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 4)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 4)
  %38 = load i8**, i8*** %4, align 8
  %39 = call i64 @id3_latin1_put(i8** %38, i8 zeroext 0)
  %40 = load i64, i64* %7, align 8
  %41 = add i64 %40, %39
  store i64 %41, i64* %7, align 8
  br label %42

; <label>:42:                                     ; preds = %36, %33
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 3)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_serialize, i64 0, i64 3)
  %44 = load i64, i64* %7, align 8
  ret i64 %44
}

; Function Attrs: nounwind uwtable
define i64* @id3_latin1_deserialize(i8**, i64) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 4)
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 1)
  %34 = load i8**, i8*** %4, align 8
  %35 = call zeroext i8 @id3_latin1_get(i8** %34)
  %36 = load i8*, i8** %7, align 8
  store i8 %35, i8* %36, align 1
  %37 = zext i8 %35 to i32
  %38 = icmp ne i32 %37, 0
  br label %39

; <label>:39:                                     ; preds = %32, %24
  %40 = phi i1 [ false, %24 ], [ %38, %32 ]
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 0)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 0)
  %43 = load i8*, i8** %7, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %7, align 8
  br label %24

; <label>:45:                                     ; preds = %39
  %46 = load i8*, i8** %7, align 8
  store i8 0, i8* %46, align 1
  %47 = load i8*, i8** %8, align 8
  %48 = call i64 @id3_latin1_length(i8* %47)
  %49 = add i64 %48, 1
  %50 = mul i64 %49, 8
  %51 = call noalias i8* @malloc(i64 %50) #2
  %52 = bitcast i8* %51 to i64*
  store i64* %52, i64** %9, align 8
  %53 = load i64*, i64** %9, align 8
  %54 = icmp ne i64* %53, null
  br i1 %54, label %55, label %59

; <label>:55:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 3)
  %56 = add i64 %pgocount3, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 3)
  %57 = load i8*, i8** %8, align 8
  %58 = load i64*, i64** %9, align 8
  call void @id3_latin1_decode(i8* %57, i64* %58)
  br label %59

; <label>:59:                                     ; preds = %55, %45
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 2)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_latin1_deserialize, i64 0, i64 2)
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
declare void @free(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

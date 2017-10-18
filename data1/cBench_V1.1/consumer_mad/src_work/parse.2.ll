; ModuleID = 'tmp1.ll'
source_filename = "parse.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [25 x i8] c"bytes >= 1 && bytes <= 4\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"parse.c\00", align 1
@__PRETTY_FUNCTION__.id3_parse_int = private unnamed_addr constant [54 x i8] c"long id3_parse_int(const id3_byte_t **, unsigned int)\00", align 1
@__PRETTY_FUNCTION__.id3_parse_uint = private unnamed_addr constant [64 x i8] c"unsigned long id3_parse_uint(const id3_byte_t **, unsigned int)\00", align 1
@.str.2 = private unnamed_addr constant [25 x i8] c"bytes == 4 || bytes == 5\00", align 1
@__PRETTY_FUNCTION__.id3_parse_syncsafe = private unnamed_addr constant [68 x i8] c"unsigned long id3_parse_syncsafe(const id3_byte_t **, unsigned int)\00", align 1
@.str.3 = private unnamed_addr constant [6 x i8] c"value\00", align 1
@__PRETTY_FUNCTION__.id3_parse_immediate = private unnamed_addr constant [68 x i8] c"void id3_parse_immediate(const id3_byte_t **, unsigned int, char *)\00", align 1
@.str.4 = private unnamed_addr constant [39 x i8] c"bytes == 8 || bytes == 4 || bytes == 3\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_parse_int = private constant [13 x i8] c"id3_parse_int"
@__profn_id3_parse_uint = private constant [14 x i8] c"id3_parse_uint"
@__profn_id3_parse_syncsafe = private constant [18 x i8] c"id3_parse_syncsafe"
@__profn_id3_parse_immediate = private constant [19 x i8] c"id3_parse_immediate"
@__profn_id3_parse_latin1 = private constant [16 x i8] c"id3_parse_latin1"
@__profn_id3_parse_string = private constant [16 x i8] c"id3_parse_string"
@__profn_id3_parse_binary = private constant [16 x i8] c"id3_parse_binary"
@__profc_id3_parse_int = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_int = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8318880055816450562, i64 93259422642, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i32 0, i32 0), i8* bitcast (i64 (i8**, i32)* @id3_parse_int to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_uint = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_uint = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4508655601220082411, i64 78002665955, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i32 0, i32 0), i8* bitcast (i64 (i8**, i32)* @id3_parse_uint to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_syncsafe = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_syncsafe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1152406383302194783, i64 63888309792, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i32 0, i32 0), i8* bitcast (i64 (i8**, i32)* @id3_parse_syncsafe to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_immediate = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_immediate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -565281938715073142, i64 100303504911, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i32 0, i32 0), i8* bitcast (void (i8**, i32, i8*)* @id3_parse_immediate to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_latin1 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_latin1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1949827962566919226, i64 88068235316, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i32 0, i32 0), i8* bitcast (i8* (i8**, i64, i32)* @id3_parse_latin1 to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_string = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_string = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6961693654854833327, i64 107210807945, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i32 0, i32 0), i8* bitcast (i64* (i8**, i64, i32, i32)* @id3_parse_string to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_parse_binary = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_parse_binary = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5837646847585953446, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i32 0, i32 0), i8* bitcast (i8* (i8**, i64)* @id3_parse_binary to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [120 x i8] c"v\00id3_parse_int\01id3_parse_uint\01id3_parse_syncsafe\01id3_parse_immediate\01id3_parse_latin1\01id3_parse_string\01id3_parse_binary", section "__llvm_prf_names"
@llvm.used = appending global [8 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_int to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_uint to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_syncsafe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_immediate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_latin1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_string to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_parse_binary to i8*), i8* getelementptr inbounds ([120 x i8], [120 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @id3_parse_int(i8**, i32) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i8** %0, i8*** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp uge i32 %6, 1
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %9 = load i32, i32* %4, align 4
  %10 = icmp ule i32 %9, 4
  br i1 %10, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 6)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 6)
  br label %14

; <label>:12:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 0)
  br label %17

; <label>:14:                                     ; preds = %._crit_edge, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 7)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 45, i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__PRETTY_FUNCTION__.id3_parse_int, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %12
  %18 = load i8**, i8*** %3, align 8
  %19 = load i8*, i8** %18, align 8
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i32
  %22 = and i32 %21, 128
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 3)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 3)
  store i64 -1, i64* %5, align 8
  br label %26

; <label>:26:                                     ; preds = %24, %17
  %27 = load i32, i32* %4, align 4
  switch i32 %27, label %68 [
    i32 4, label %28
    i32 3, label %38
    i32 2, label %48
    i32 1, label %58
  ]

; <label>:28:                                     ; preds = %26
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 5)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 5)
  %30 = load i64, i64* %5, align 8
  %31 = shl i64 %30, 8
  %32 = load i8**, i8*** %3, align 8
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %32, align 8
  %35 = load i8, i8* %33, align 1
  %36 = zext i8 %35 to i64
  %37 = or i64 %31, %36
  store i64 %37, i64* %5, align 8
  br label %38

; <label>:38:                                     ; preds = %28, %26
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 4)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 4)
  %40 = load i64, i64* %5, align 8
  %41 = shl i64 %40, 8
  %42 = load i8**, i8*** %3, align 8
  %43 = load i8*, i8** %42, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %42, align 8
  %45 = load i8, i8* %43, align 1
  %46 = zext i8 %45 to i64
  %47 = or i64 %41, %46
  store i64 %47, i64* %5, align 8
  br label %48

; <label>:48:                                     ; preds = %38, %26
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 2)
  %49 = add i64 %pgocount6, 1
  store i64 %49, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 2)
  %50 = load i64, i64* %5, align 8
  %51 = shl i64 %50, 8
  %52 = load i8**, i8*** %3, align 8
  %53 = load i8*, i8** %52, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %52, align 8
  %55 = load i8, i8* %53, align 1
  %56 = zext i8 %55 to i64
  %57 = or i64 %51, %56
  store i64 %57, i64* %5, align 8
  br label %58

; <label>:58:                                     ; preds = %48, %26
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 1)
  %59 = add i64 %pgocount7, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_int, i64 0, i64 1)
  %60 = load i64, i64* %5, align 8
  %61 = shl i64 %60, 8
  %62 = load i8**, i8*** %3, align 8
  %63 = load i8*, i8** %62, align 8
  %64 = getelementptr inbounds i8, i8* %63, i32 1
  store i8* %64, i8** %62, align 8
  %65 = load i8, i8* %63, align 1
  %66 = zext i8 %65 to i64
  %67 = or i64 %61, %66
  store i64 %67, i64* %5, align 8
  br label %68

; <label>:68:                                     ; preds = %58, %26
  %69 = load i64, i64* %5, align 8
  ret i64 %69
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: noinline nounwind uwtable
define i64 @id3_parse_uint(i8**, i32) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i8** %0, i8*** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp uge i32 %6, 1
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %9 = load i32, i32* %4, align 4
  %10 = icmp ule i32 %9, 4
  br i1 %10, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 5)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 5)
  br label %14

; <label>:12:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 0)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 0)
  br label %17

; <label>:14:                                     ; preds = %._crit_edge, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 6)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 68, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__PRETTY_FUNCTION__.id3_parse_uint, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %12
  %18 = load i32, i32* %4, align 4
  switch i32 %18, label %59 [
    i32 4, label %19
    i32 3, label %29
    i32 2, label %39
    i32 1, label %49
  ]

; <label>:19:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 4)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 4)
  %21 = load i64, i64* %5, align 8
  %22 = shl i64 %21, 8
  %23 = load i8**, i8*** %3, align 8
  %24 = load i8*, i8** %23, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %23, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i64
  %28 = or i64 %22, %27
  store i64 %28, i64* %5, align 8
  br label %29

; <label>:29:                                     ; preds = %19, %17
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 3)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 3)
  %31 = load i64, i64* %5, align 8
  %32 = shl i64 %31, 8
  %33 = load i8**, i8*** %3, align 8
  %34 = load i8*, i8** %33, align 8
  %35 = getelementptr inbounds i8, i8* %34, i32 1
  store i8* %35, i8** %33, align 8
  %36 = load i8, i8* %34, align 1
  %37 = zext i8 %36 to i64
  %38 = or i64 %32, %37
  store i64 %38, i64* %5, align 8
  br label %39

; <label>:39:                                     ; preds = %29, %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 2)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 2)
  %41 = load i64, i64* %5, align 8
  %42 = shl i64 %41, 8
  %43 = load i8**, i8*** %3, align 8
  %44 = load i8*, i8** %43, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %43, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i64
  %48 = or i64 %42, %47
  store i64 %48, i64* %5, align 8
  br label %49

; <label>:49:                                     ; preds = %39, %17
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 1)
  %50 = add i64 %pgocount6, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_parse_uint, i64 0, i64 1)
  %51 = load i64, i64* %5, align 8
  %52 = shl i64 %51, 8
  %53 = load i8**, i8*** %3, align 8
  %54 = load i8*, i8** %53, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %53, align 8
  %56 = load i8, i8* %54, align 1
  %57 = zext i8 %56 to i64
  %58 = or i64 %52, %57
  store i64 %58, i64* %5, align 8
  br label %59

; <label>:59:                                     ; preds = %49, %17
  %60 = load i64, i64* %5, align 8
  ret i64 %60
}

; Function Attrs: noinline nounwind uwtable
define i64 @id3_parse_syncsafe(i8**, i32) #0 {
  %3 = alloca i8**, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  store i8** %0, i8*** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %5, align 8
  %6 = load i32, i32* %4, align 4
  %7 = icmp eq i32 %6, 4
  br i1 %7, label %12, label %8

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 2)
  %10 = load i32, i32* %4, align 4
  %11 = icmp eq i32 %10, 5
  br i1 %11, label %12, label %13

; <label>:12:                                     ; preds = %8, %2
  br label %16

; <label>:13:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 4)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 4)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 88, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__PRETTY_FUNCTION__.id3_parse_syncsafe, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %16

; <label>:16:                                     ; preds = %15, %12
  %17 = load i32, i32* %4, align 4
  switch i32 %17, label %72 [
    i32 5, label %18
    i32 4, label %30
  ]

; <label>:18:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 3)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 3)
  %20 = load i64, i64* %5, align 8
  %21 = shl i64 %20, 4
  %22 = load i8**, i8*** %3, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %22, align 8
  %25 = load i8, i8* %23, align 1
  %26 = zext i8 %25 to i32
  %27 = and i32 %26, 15
  %28 = sext i32 %27 to i64
  %29 = or i64 %21, %28
  store i64 %29, i64* %5, align 8
  br label %30

; <label>:30:                                     ; preds = %18, %16
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 1)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 1)
  %32 = load i64, i64* %5, align 8
  %33 = shl i64 %32, 7
  %34 = load i8**, i8*** %3, align 8
  %35 = load i8*, i8** %34, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %34, align 8
  %37 = load i8, i8* %35, align 1
  %38 = zext i8 %37 to i32
  %39 = and i32 %38, 127
  %40 = sext i32 %39 to i64
  %41 = or i64 %33, %40
  store i64 %41, i64* %5, align 8
  %42 = load i64, i64* %5, align 8
  %43 = shl i64 %42, 7
  %44 = load i8**, i8*** %3, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %44, align 8
  %47 = load i8, i8* %45, align 1
  %48 = zext i8 %47 to i32
  %49 = and i32 %48, 127
  %50 = sext i32 %49 to i64
  %51 = or i64 %43, %50
  store i64 %51, i64* %5, align 8
  %52 = load i64, i64* %5, align 8
  %53 = shl i64 %52, 7
  %54 = load i8**, i8*** %3, align 8
  %55 = load i8*, i8** %54, align 8
  %56 = getelementptr inbounds i8, i8* %55, i32 1
  store i8* %56, i8** %54, align 8
  %57 = load i8, i8* %55, align 1
  %58 = zext i8 %57 to i32
  %59 = and i32 %58, 127
  %60 = sext i32 %59 to i64
  %61 = or i64 %53, %60
  store i64 %61, i64* %5, align 8
  %62 = load i64, i64* %5, align 8
  %63 = shl i64 %62, 7
  %64 = load i8**, i8*** %3, align 8
  %65 = load i8*, i8** %64, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %66, i8** %64, align 8
  %67 = load i8, i8* %65, align 1
  %68 = zext i8 %67 to i32
  %69 = and i32 %68, 127
  %70 = sext i32 %69 to i64
  %71 = or i64 %63, %70
  store i64 %71, i64* %5, align 8
  br label %72

; <label>:72:                                     ; preds = %30, %16
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 0)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_parse_syncsafe, i64 0, i64 0)
  %74 = load i64, i64* %5, align 8
  ret i64 %74
}

; Function Attrs: noinline nounwind uwtable
define void @id3_parse_immediate(i8**, i32, i8*) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i32 %1, i32* %5, align 4
  store i8* %2, i8** %6, align 8
  %7 = load i8*, i8** %6, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %3
  br label %13

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 6)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 106, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__PRETTY_FUNCTION__.id3_parse_immediate, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13:                                     ; preds = %12, %9
  %14 = load i32, i32* %5, align 4
  %15 = icmp eq i32 %14, 8
  br i1 %15, label %24, label %16

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 2)
  %18 = load i32, i32* %5, align 4
  %19 = icmp eq i32 %18, 4
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 4)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 4)
  %22 = load i32, i32* %5, align 4
  %23 = icmp eq i32 %22, 3
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %20, %16, %13
  br label %28

; <label>:25:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 7)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 107, i8* getelementptr inbounds ([68 x i8], [68 x i8]* @__PRETTY_FUNCTION__.id3_parse_immediate, i32 0, i32 0)) #7
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load i32, i32* %5, align 4
  switch i32 %29, label %84 [
    i32 8, label %30
    i32 4, label %56
    i32 3, label %64
  ]

; <label>:30:                                     ; preds = %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 5)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 5)
  %32 = load i8**, i8*** %4, align 8
  %33 = load i8*, i8** %32, align 8
  %34 = getelementptr inbounds i8, i8* %33, i32 1
  store i8* %34, i8** %32, align 8
  %35 = load i8, i8* %33, align 1
  %36 = load i8*, i8** %6, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %6, align 8
  store i8 %35, i8* %36, align 1
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %38, align 8
  %41 = load i8, i8* %39, align 1
  %42 = load i8*, i8** %6, align 8
  %43 = getelementptr inbounds i8, i8* %42, i32 1
  store i8* %43, i8** %6, align 8
  store i8 %41, i8* %42, align 1
  %44 = load i8**, i8*** %4, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %44, align 8
  %47 = load i8, i8* %45, align 1
  %48 = load i8*, i8** %6, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %6, align 8
  store i8 %47, i8* %48, align 1
  %50 = load i8**, i8*** %4, align 8
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %50, align 8
  %53 = load i8, i8* %51, align 1
  %54 = load i8*, i8** %6, align 8
  %55 = getelementptr inbounds i8, i8* %54, i32 1
  store i8* %55, i8** %6, align 8
  store i8 %53, i8* %54, align 1
  br label %56

; <label>:56:                                     ; preds = %30, %28
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 3)
  %57 = add i64 %pgocount5, 1
  store i64 %57, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 3)
  %58 = load i8**, i8*** %4, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %58, align 8
  %61 = load i8, i8* %59, align 1
  %62 = load i8*, i8** %6, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 1
  store i8* %63, i8** %6, align 8
  store i8 %61, i8* %62, align 1
  br label %64

; <label>:64:                                     ; preds = %56, %28
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 1)
  %65 = add i64 %pgocount6, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 1)
  %66 = load i8**, i8*** %4, align 8
  %67 = load i8*, i8** %66, align 8
  %68 = getelementptr inbounds i8, i8* %67, i32 1
  store i8* %68, i8** %66, align 8
  %69 = load i8, i8* %67, align 1
  %70 = load i8*, i8** %6, align 8
  %71 = getelementptr inbounds i8, i8* %70, i32 1
  store i8* %71, i8** %6, align 8
  store i8 %69, i8* %70, align 1
  %72 = load i8**, i8*** %4, align 8
  %73 = load i8*, i8** %72, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %72, align 8
  %75 = load i8, i8* %73, align 1
  %76 = load i8*, i8** %6, align 8
  %77 = getelementptr inbounds i8, i8* %76, i32 1
  store i8* %77, i8** %6, align 8
  store i8 %75, i8* %76, align 1
  %78 = load i8**, i8*** %4, align 8
  %79 = load i8*, i8** %78, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %78, align 8
  %81 = load i8, i8* %79, align 1
  %82 = load i8*, i8** %6, align 8
  %83 = getelementptr inbounds i8, i8* %82, i32 1
  store i8* %83, i8** %6, align 8
  store i8 %81, i8* %82, align 1
  br label %84

; <label>:84:                                     ; preds = %64, %28
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 0)
  %85 = add i64 %pgocount7, 1
  store i64 %85, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_parse_immediate, i64 0, i64 0)
  %86 = load i8*, i8** %6, align 8
  store i8 0, i8* %86, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @id3_parse_latin1(i8**, i64, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %8, align 4
  %11 = load i8**, i8*** %4, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = load i64, i64* %5, align 8
  %14 = call i8* @memchr(i8* %12, i32 0, i64 %13) #8
  store i8* %14, i8** %7, align 8
  %15 = load i8*, i8** %7, align 8
  %16 = icmp eq i8* %15, null
  br i1 %16, label %17, label %23

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 4)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 4)
  %19 = load i8**, i8*** %4, align 8
  %20 = load i8*, i8** %19, align 8
  %21 = load i64, i64* %5, align 8
  %22 = getelementptr inbounds i8, i8* %20, i64 %21
  store i8* %22, i8** %7, align 8
  br label %31

; <label>:23:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 2)
  %25 = load i8*, i8** %7, align 8
  %26 = load i8**, i8*** %4, align 8
  %27 = load i8*, i8** %26, align 8
  %28 = ptrtoint i8* %25 to i64
  %29 = ptrtoint i8* %27 to i64
  %30 = sub i64 %28, %29
  store i64 %30, i64* %5, align 8
  store i32 1, i32* %8, align 4
  br label %31

; <label>:31:                                     ; preds = %23, %17
  %32 = load i64, i64* %5, align 8
  %33 = add i64 %32, 1
  %34 = call noalias i8* @malloc(i64 %33) #6
  store i8* %34, i8** %9, align 8
  %35 = load i8*, i8** %9, align 8
  %36 = icmp ne i8* %35, null
  br i1 %36, label %37, label %70

; <label>:37:                                     ; preds = %31
  %38 = load i8*, i8** %9, align 8
  %39 = load i8**, i8*** %4, align 8
  %40 = load i8*, i8** %39, align 8
  %41 = load i64, i64* %5, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %38, i8* %40, i64 %41, i32 1, i1 false)
  %42 = load i8*, i8** %9, align 8
  %43 = load i64, i64* %5, align 8
  %44 = getelementptr inbounds i8, i8* %42, i64 %43
  store i8 0, i8* %44, align 1
  %45 = load i32, i32* %6, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %68, label %47

; <label>:47:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 5)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 5)
  %49 = load i8*, i8** %9, align 8
  store i8* %49, i8** %10, align 8
  br label %50

; <label>:50:                                     ; preds = %63, %47
  %51 = load i8*, i8** %10, align 8
  %52 = load i8, i8* %51, align 1
  %53 = icmp ne i8 %52, 0
  br i1 %53, label %54, label %67

; <label>:54:                                     ; preds = %50
  %55 = load i8*, i8** %10, align 8
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = icmp eq i32 %57, 10
  br i1 %58, label %59, label %62

; <label>:59:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 1)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 1)
  %61 = load i8*, i8** %10, align 8
  store i8 32, i8* %61, align 1
  br label %62

; <label>:62:                                     ; preds = %59, %54
  br label %63

; <label>:63:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 0)
  %64 = add i64 %pgocount4, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 0)
  %65 = load i8*, i8** %10, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %66, i8** %10, align 8
  br label %50

; <label>:67:                                     ; preds = %50
  br label %68

; <label>:68:                                     ; preds = %67, %37
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 3)
  %69 = add i64 %pgocount5, 1
  store i64 %69, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_parse_latin1, i64 0, i64 3)
  br label %70

; <label>:70:                                     ; preds = %68, %31
  %71 = load i64, i64* %5, align 8
  %72 = load i32, i32* %8, align 4
  %73 = sext i32 %72 to i64
  %74 = add i64 %71, %73
  %75 = load i8**, i8*** %4, align 8
  %76 = load i8*, i8** %75, align 8
  %77 = getelementptr inbounds i8, i8* %76, i64 %74
  store i8* %77, i8** %75, align 8
  %78 = load i8*, i8** %9, align 8
  ret i8* %78
}

; Function Attrs: nounwind readonly
declare i8* @memchr(i8*, i32, i64) #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define i64* @id3_parse_string(i8**, i64, i32, i32) #0 {
  %5 = alloca i8**, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i64*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64*, align 8
  store i8** %0, i8*** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  store i64* null, i64** %9, align 8
  store i32 0, i32* %10, align 4
  %12 = load i32, i32* %7, align 4
  switch i32 %12, label %31 [
    i32 0, label %13
    i32 2, label %18
    i32 1, label %20
    i32 3, label %26
  ]

; <label>:13:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 6)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 6)
  %15 = load i8**, i8*** %5, align 8
  %16 = load i64, i64* %6, align 8
  %17 = call i64* @id3_latin1_deserialize(i8** %15, i64 %16)
  store i64* %17, i64** %9, align 8
  br label %31

; <label>:18:                                     ; preds = %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 7)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 7)
  store i32 1, i32* %10, align 4
  br label %20

; <label>:20:                                     ; preds = %18, %4
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 4)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 4)
  %22 = load i8**, i8*** %5, align 8
  %23 = load i64, i64* %6, align 8
  %24 = load i32, i32* %10, align 4
  %25 = call i64* @id3_utf16_deserialize(i8** %22, i64 %23, i32 %24)
  store i64* %25, i64** %9, align 8
  br label %31

; <label>:26:                                     ; preds = %4
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 8)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 8)
  %28 = load i8**, i8*** %5, align 8
  %29 = load i64, i64* %6, align 8
  %30 = call i64* @id3_utf8_deserialize(i8** %28, i64 %29)
  store i64* %30, i64** %9, align 8
  br label %31

; <label>:31:                                     ; preds = %26, %20, %13, %4
  %32 = load i64*, i64** %9, align 8
  %33 = icmp ne i64* %32, null
  br i1 %33, label %34, label %58

; <label>:34:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 3)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 3)
  %36 = load i32, i32* %8, align 4
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %58, label %38

; <label>:38:                                     ; preds = %34
  %39 = load i64*, i64** %9, align 8
  store i64* %39, i64** %11, align 8
  br label %40

; <label>:40:                                     ; preds = %52, %38
  %41 = load i64*, i64** %11, align 8
  %42 = load i64, i64* %41, align 8
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %56

; <label>:44:                                     ; preds = %40
  %45 = load i64*, i64** %11, align 8
  %46 = load i64, i64* %45, align 8
  %47 = icmp eq i64 %46, 10
  br i1 %47, label %48, label %51

; <label>:48:                                     ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 1)
  %49 = add i64 %pgocount5, 1
  store i64 %49, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 1)
  %50 = load i64*, i64** %11, align 8
  store i64 32, i64* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %48, %44
  br label %52

; <label>:52:                                     ; preds = %51
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 0)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 0)
  %54 = load i64*, i64** %11, align 8
  %55 = getelementptr inbounds i64, i64* %54, i32 1
  store i64* %55, i64** %11, align 8
  br label %40

; <label>:56:                                     ; preds = %40
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 5)
  %57 = add i64 %pgocount7, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 5)
  br label %58

; <label>:58:                                     ; preds = %56, %34, %31
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 2)
  %59 = add i64 %pgocount8, 1
  store i64 %59, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_parse_string, i64 0, i64 2)
  %60 = load i64*, i64** %9, align 8
  ret i64* %60
}

declare i64* @id3_latin1_deserialize(i8**, i64) #5

declare i64* @id3_utf16_deserialize(i8**, i64, i32) #5

declare i64* @id3_utf8_deserialize(i8**, i64) #5

; Function Attrs: noinline nounwind uwtable
define i8* @id3_parse_binary(i8**, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  %7 = load i64, i64* %5, align 8
  %8 = icmp eq i64 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 2)
  %11 = call noalias i8* @malloc(i64 1) #6
  store i8* %11, i8** %3, align 8
  br label %30

; <label>:12:                                     ; preds = %2
  %13 = load i64, i64* %5, align 8
  %14 = call noalias i8* @malloc(i64 %13) #6
  store i8* %14, i8** %6, align 8
  %15 = load i8*, i8** %6, align 8
  %16 = icmp ne i8* %15, null
  br i1 %16, label %17, label %23

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 1)
  %19 = load i8*, i8** %6, align 8
  %20 = load i8**, i8*** %4, align 8
  %21 = load i8*, i8** %20, align 8
  %22 = load i64, i64* %5, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %21, i64 %22, i32 1, i1 false)
  br label %23

; <label>:23:                                     ; preds = %17, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 0)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_parse_binary, i64 0, i64 0)
  %25 = load i64, i64* %5, align 8
  %26 = load i8**, i8*** %4, align 8
  %27 = load i8*, i8** %26, align 8
  %28 = getelementptr inbounds i8, i8* %27, i64 %25
  store i8* %28, i8** %26, align 8
  %29 = load i8*, i8** %6, align 8
  store i8* %29, i8** %3, align 8
  br label %30

; <label>:30:                                     ; preds = %23, %9
  %31 = load i8*, i8** %3, align 8
  ret i8* %31
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { noreturn nounwind }
attributes #8 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

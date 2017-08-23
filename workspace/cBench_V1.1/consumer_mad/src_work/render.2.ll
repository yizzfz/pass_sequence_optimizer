; ModuleID = 'tmp1.ll'
source_filename = "render.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [6 x i8] c"value\00", align 1
@.str.1 = private unnamed_addr constant [9 x i8] c"render.c\00", align 1
@__PRETTY_FUNCTION__.id3_render_immediate = private unnamed_addr constant [77 x i8] c"id3_length_t id3_render_immediate(id3_byte_t **, const char *, unsigned int)\00", align 1
@.str.2 = private unnamed_addr constant [39 x i8] c"bytes == 8 || bytes == 4 || bytes == 3\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"bytes == 4 || bytes == 5\00", align 1
@__PRETTY_FUNCTION__.id3_render_syncsafe = private unnamed_addr constant [77 x i8] c"id3_length_t id3_render_syncsafe(id3_byte_t **, unsigned long, unsigned int)\00", align 1
@.str.4 = private unnamed_addr constant [25 x i8] c"bytes >= 1 && bytes <= 4\00", align 1
@__PRETTY_FUNCTION__.id3_render_int = private unnamed_addr constant [63 x i8] c"id3_length_t id3_render_int(id3_byte_t **, long, unsigned int)\00", align 1
@.str.5 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@id3_ucs4_empty = external constant [0 x i64], align 8
@.str.6 = private unnamed_addr constant [13 x i8] c"length <= 30\00", align 1
@__PRETTY_FUNCTION__.id3_render_paddedstring = private unnamed_addr constant [86 x i8] c"id3_length_t id3_render_paddedstring(id3_byte_t **, const id3_ucs4_t *, id3_length_t)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_render_immediate = private constant [20 x i8] c"id3_render_immediate"
@__profn_id3_render_syncsafe = private constant [19 x i8] c"id3_render_syncsafe"
@__profn_id3_render_int = private constant [14 x i8] c"id3_render_int"
@__profn_id3_render_binary = private constant [17 x i8] c"id3_render_binary"
@__profn_id3_render_latin1 = private constant [17 x i8] c"id3_render_latin1"
@__profn_id3_render_string = private constant [17 x i8] c"id3_render_string"
@__profn_id3_render_padding = private constant [18 x i8] c"id3_render_padding"
@__profn_id3_render_paddedstring = private constant [23 x i8] c"id3_render_paddedstring"
@__profc_id3_render_immediate = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_immediate = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1216943557426865051, i64 113022652627, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i32 0, i32 0), i8* bitcast (i64 (i8**, i8*, i32)* @id3_render_immediate to i8*), i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_syncsafe = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_syncsafe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4568727413572935975, i64 76988261128, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i32 0, i32 0), i8* bitcast (i64 (i8**, i64, i32)* @id3_render_syncsafe to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_int = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_int = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6951997816666437224, i64 93808419205, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i32 0, i32 0), i8* bitcast (i64 (i8**, i64, i32)* @id3_render_int to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_binary = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_binary = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1371079766907620256, i64 41716471419, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i32 0, i32 0), i8* bitcast (i64 (i8**, i8*, i64)* @id3_render_binary to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_latin1 = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_latin1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8039579602212883832, i64 48344234846, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i32 0, i32 0), i8* bitcast (i64 (i8**, i8*, i32)* @id3_render_latin1 to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_string = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_string = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6739507230198561070, i64 67656620329, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i32 0, i32 0), i8* bitcast (i64 (i8**, i64*, i32, i32)* @id3_render_string to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_padding = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_padding = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9001709649282159405, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_render_padding, i32 0, i32 0), i8* bitcast (i64 (i8**, i8, i64)* @id3_render_padding to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_render_paddedstring = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_render_paddedstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1985061340650590627, i64 103276356065, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i32 0, i32 0), i8* bitcast (i64 (i8**, i64*, i64)* @id3_render_paddedstring to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [80 x i8] c"\98\01Mx\DAm\CCA\0A\800\0CDQ<\92x\A0\12M\94\01;\944\9B\DE\DE\85\0BSp9\8F\E1C\B7\E2F5/\A8\D5\14\12\B6\E0\C3>xt9'\03#\CF\1D\14\1FYn\09p\9D2\E1\E0\95\A5\89\EA\0F\99\BE\D7\07\1C\DD9\83", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_immediate to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_syncsafe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_int to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_binary to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_latin1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_string to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_padding to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_render_paddedstring to i8*), i8* getelementptr inbounds ([80 x i8], [80 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i64 @id3_render_immediate(i8**, i8*, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i8*, i8** %5, align 8
  %8 = icmp ne i8* %7, null
  br i1 %8, label %9, label %10

; <label>:9:                                      ; preds = %3
  br label %13

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 7)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 45, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.id3_render_immediate, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %13

; <label>:13:                                     ; preds = %12, %9
  %14 = load i32, i32* %6, align 4
  %15 = icmp eq i32 %14, 8
  br i1 %15, label %24, label %16

; <label>:16:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 2)
  %18 = load i32, i32* %6, align 4
  %19 = icmp eq i32 %18, 4
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 5)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 5)
  %22 = load i32, i32* %6, align 4
  %23 = icmp eq i32 %22, 3
  br i1 %23, label %24, label %25

; <label>:24:                                     ; preds = %20, %16, %13
  br label %28

; <label>:25:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 8)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 8)
  call void @__assert_fail(i8* getelementptr inbounds ([39 x i8], [39 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 46, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.id3_render_immediate, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %28

; <label>:28:                                     ; preds = %27, %24
  %29 = load i8**, i8*** %4, align 8
  %30 = icmp ne i8** %29, null
  br i1 %30, label %31, label %89

; <label>:31:                                     ; preds = %28
  %32 = load i32, i32* %6, align 4
  switch i32 %32, label %87 [
    i32 8, label %33
    i32 4, label %59
    i32 3, label %67
  ]

; <label>:33:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 6)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 6)
  %35 = load i8*, i8** %5, align 8
  %36 = getelementptr inbounds i8, i8* %35, i32 1
  store i8* %36, i8** %5, align 8
  %37 = load i8, i8* %35, align 1
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %38, align 8
  store i8 %37, i8* %39, align 1
  %41 = load i8*, i8** %5, align 8
  %42 = getelementptr inbounds i8, i8* %41, i32 1
  store i8* %42, i8** %5, align 8
  %43 = load i8, i8* %41, align 1
  %44 = load i8**, i8*** %4, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %44, align 8
  store i8 %43, i8* %45, align 1
  %47 = load i8*, i8** %5, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %5, align 8
  %49 = load i8, i8* %47, align 1
  %50 = load i8**, i8*** %4, align 8
  %51 = load i8*, i8** %50, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %50, align 8
  store i8 %49, i8* %51, align 1
  %53 = load i8*, i8** %5, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %5, align 8
  %55 = load i8, i8* %53, align 1
  %56 = load i8**, i8*** %4, align 8
  %57 = load i8*, i8** %56, align 8
  %58 = getelementptr inbounds i8, i8* %57, i32 1
  store i8* %58, i8** %56, align 8
  store i8 %55, i8* %57, align 1
  br label %59

; <label>:59:                                     ; preds = %33, %31
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 4)
  %60 = add i64 %pgocount5, 1
  store i64 %60, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 4)
  %61 = load i8*, i8** %5, align 8
  %62 = getelementptr inbounds i8, i8* %61, i32 1
  store i8* %62, i8** %5, align 8
  %63 = load i8, i8* %61, align 1
  %64 = load i8**, i8*** %4, align 8
  %65 = load i8*, i8** %64, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 1
  store i8* %66, i8** %64, align 8
  store i8 %63, i8* %65, align 1
  br label %67

; <label>:67:                                     ; preds = %59, %31
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 3)
  %68 = add i64 %pgocount6, 1
  store i64 %68, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 3)
  %69 = load i8*, i8** %5, align 8
  %70 = getelementptr inbounds i8, i8* %69, i32 1
  store i8* %70, i8** %5, align 8
  %71 = load i8, i8* %69, align 1
  %72 = load i8**, i8*** %4, align 8
  %73 = load i8*, i8** %72, align 8
  %74 = getelementptr inbounds i8, i8* %73, i32 1
  store i8* %74, i8** %72, align 8
  store i8 %71, i8* %73, align 1
  %75 = load i8*, i8** %5, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %5, align 8
  %77 = load i8, i8* %75, align 1
  %78 = load i8**, i8*** %4, align 8
  %79 = load i8*, i8** %78, align 8
  %80 = getelementptr inbounds i8, i8* %79, i32 1
  store i8* %80, i8** %78, align 8
  store i8 %77, i8* %79, align 1
  %81 = load i8*, i8** %5, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %5, align 8
  %83 = load i8, i8* %81, align 1
  %84 = load i8**, i8*** %4, align 8
  %85 = load i8*, i8** %84, align 8
  %86 = getelementptr inbounds i8, i8* %85, i32 1
  store i8* %86, i8** %84, align 8
  store i8 %83, i8* %85, align 1
  br label %87

; <label>:87:                                     ; preds = %67, %31
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 1)
  %88 = add i64 %pgocount7, 1
  store i64 %88, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 1)
  br label %89

; <label>:89:                                     ; preds = %87, %28
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 0)
  %90 = add i64 %pgocount8, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_id3_render_immediate, i64 0, i64 0)
  %91 = load i32, i32* %6, align 4
  %92 = zext i32 %91 to i64
  ret i64 %92
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #1

; Function Attrs: nounwind uwtable
define i64 @id3_render_syncsafe(i8**, i64, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp eq i32 %7, 4
  br i1 %8, label %13, label %9

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 2)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 2)
  %11 = load i32, i32* %6, align 4
  %12 = icmp eq i32 %11, 5
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %9, %3
  br label %17

; <label>:14:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 5)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 5)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 70, i8* getelementptr inbounds ([77 x i8], [77 x i8]* @__PRETTY_FUNCTION__.id3_render_syncsafe, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %17

; <label>:17:                                     ; preds = %16, %13
  %18 = load i8**, i8*** %4, align 8
  %19 = icmp ne i8** %18, null
  br i1 %19, label %20, label %63

; <label>:20:                                     ; preds = %17
  %21 = load i32, i32* %6, align 4
  switch i32 %21, label %61 [
    i32 5, label %22
    i32 4, label %31
  ]

; <label>:22:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 4)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 4)
  %24 = load i64, i64* %5, align 8
  %25 = lshr i64 %24, 28
  %26 = and i64 %25, 15
  %27 = trunc i64 %26 to i8
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %28, align 8
  store i8 %27, i8* %29, align 1
  br label %31

; <label>:31:                                     ; preds = %22, %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 3)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 3)
  %33 = load i64, i64* %5, align 8
  %34 = lshr i64 %33, 21
  %35 = and i64 %34, 127
  %36 = trunc i64 %35 to i8
  %37 = load i8**, i8*** %4, align 8
  %38 = load i8*, i8** %37, align 8
  %39 = getelementptr inbounds i8, i8* %38, i32 1
  store i8* %39, i8** %37, align 8
  store i8 %36, i8* %38, align 1
  %40 = load i64, i64* %5, align 8
  %41 = lshr i64 %40, 14
  %42 = and i64 %41, 127
  %43 = trunc i64 %42 to i8
  %44 = load i8**, i8*** %4, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %44, align 8
  store i8 %43, i8* %45, align 1
  %47 = load i64, i64* %5, align 8
  %48 = lshr i64 %47, 7
  %49 = and i64 %48, 127
  %50 = trunc i64 %49 to i8
  %51 = load i8**, i8*** %4, align 8
  %52 = load i8*, i8** %51, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %51, align 8
  store i8 %50, i8* %52, align 1
  %54 = load i64, i64* %5, align 8
  %55 = lshr i64 %54, 0
  %56 = and i64 %55, 127
  %57 = trunc i64 %56 to i8
  %58 = load i8**, i8*** %4, align 8
  %59 = load i8*, i8** %58, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %58, align 8
  store i8 %57, i8* %59, align 1
  br label %61

; <label>:61:                                     ; preds = %31, %20
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 1)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 1)
  br label %63

; <label>:63:                                     ; preds = %61, %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 0)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_syncsafe, i64 0, i64 0)
  %65 = load i32, i32* %6, align 4
  %66 = zext i32 %65 to i64
  ret i64 %66
}

; Function Attrs: nounwind uwtable
define i64 @id3_render_int(i8**, i64, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i8** %0, i8*** %4, align 8
  store i64 %1, i64* %5, align 8
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %6, align 4
  %8 = icmp uge i32 %7, 1
  br i1 %8, label %9, label %15

; <label>:9:                                      ; preds = %3
  %10 = load i32, i32* %6, align 4
  %11 = icmp ule i32 %10, 4
  br i1 %11, label %13, label %._crit_edge

._crit_edge:                                      ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 6)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 6)
  br label %15

; <label>:13:                                     ; preds = %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 0)
  br label %18

; <label>:15:                                     ; preds = %._crit_edge, %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 7)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 7)
  call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 90, i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__PRETTY_FUNCTION__.id3_render_int, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %13
  %19 = load i8**, i8*** %4, align 8
  %20 = icmp ne i8** %19, null
  br i1 %20, label %21, label %57

; <label>:21:                                     ; preds = %18
  %22 = load i32, i32* %6, align 4
  switch i32 %22, label %55 [
    i32 4, label %23
    i32 3, label %31
    i32 2, label %39
    i32 1, label %47
  ]

; <label>:23:                                     ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 5)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 5)
  %25 = load i64, i64* %5, align 8
  %26 = ashr i64 %25, 24
  %27 = trunc i64 %26 to i8
  %28 = load i8**, i8*** %4, align 8
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %28, align 8
  store i8 %27, i8* %29, align 1
  br label %31

; <label>:31:                                     ; preds = %23, %21
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 4)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 4)
  %33 = load i64, i64* %5, align 8
  %34 = ashr i64 %33, 16
  %35 = trunc i64 %34 to i8
  %36 = load i8**, i8*** %4, align 8
  %37 = load i8*, i8** %36, align 8
  %38 = getelementptr inbounds i8, i8* %37, i32 1
  store i8* %38, i8** %36, align 8
  store i8 %35, i8* %37, align 1
  br label %39

; <label>:39:                                     ; preds = %31, %21
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 3)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 3)
  %41 = load i64, i64* %5, align 8
  %42 = ashr i64 %41, 8
  %43 = trunc i64 %42 to i8
  %44 = load i8**, i8*** %4, align 8
  %45 = load i8*, i8** %44, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %44, align 8
  store i8 %43, i8* %45, align 1
  br label %47

; <label>:47:                                     ; preds = %39, %21
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 2)
  %48 = add i64 %pgocount6, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 2)
  %49 = load i64, i64* %5, align 8
  %50 = ashr i64 %49, 0
  %51 = trunc i64 %50 to i8
  %52 = load i8**, i8*** %4, align 8
  %53 = load i8*, i8** %52, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %52, align 8
  store i8 %51, i8* %53, align 1
  br label %55

; <label>:55:                                     ; preds = %47, %21
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 1)
  %56 = add i64 %pgocount7, 1
  store i64 %56, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_id3_render_int, i64 0, i64 1)
  br label %57

; <label>:57:                                     ; preds = %55, %18
  %58 = load i32, i32* %6, align 4
  %59 = zext i32 %58 to i64
  ret i64 %59
}

; Function Attrs: nounwind uwtable
define i64 @id3_render_binary(i8**, i8*, i64) #0 {
  %4 = alloca i64, align 8
  %5 = alloca i8**, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i64, align 8
  store i8** %0, i8*** %5, align 8
  store i8* %1, i8** %6, align 8
  store i64 %2, i64* %7, align 8
  %8 = load i8*, i8** %6, align 8
  %9 = icmp eq i8* %8, null
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 2)
  store i64 0, i64* %4, align 8
  br label %28

; <label>:12:                                     ; preds = %3
  %13 = load i8**, i8*** %5, align 8
  %14 = icmp ne i8** %13, null
  br i1 %14, label %15, label %25

; <label>:15:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 1)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 1)
  %17 = load i8**, i8*** %5, align 8
  %18 = load i8*, i8** %17, align 8
  %19 = load i8*, i8** %6, align 8
  %20 = load i64, i64* %7, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 %20, i32 1, i1 false)
  %21 = load i64, i64* %7, align 8
  %22 = load i8**, i8*** %5, align 8
  %23 = load i8*, i8** %22, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 %21
  store i8* %24, i8** %22, align 8
  br label %25

; <label>:25:                                     ; preds = %15, %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 0)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_id3_render_binary, i64 0, i64 0)
  %27 = load i64, i64* %7, align 8
  store i64 %27, i64* %4, align 8
  br label %28

; <label>:28:                                     ; preds = %25, %10
  %29 = load i64, i64* %4, align 8
  ret i64 %29
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i64 @id3_render_latin1(i8**, i8*, i32) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  store i8** %0, i8*** %4, align 8
  store i8* %1, i8** %5, align 8
  store i32 %2, i32* %6, align 4
  %8 = load i8*, i8** %5, align 8
  %9 = icmp eq i8* %8, null
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 2)
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str.5, i32 0, i32 0), i8** %5, align 8
  br label %12

; <label>:12:                                     ; preds = %10, %3
  %13 = load i8*, i8** %5, align 8
  %14 = call i64 @id3_latin1_size(i8* %13)
  store i64 %14, i64* %7, align 8
  %15 = load i32, i32* %6, align 4
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %21, label %17

; <label>:17:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 3)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 3)
  %19 = load i64, i64* %7, align 8
  %20 = add i64 %19, -1
  store i64 %20, i64* %7, align 8
  br label %21

; <label>:21:                                     ; preds = %17, %12
  %22 = load i8**, i8*** %4, align 8
  %23 = icmp ne i8** %22, null
  br i1 %23, label %24, label %34

; <label>:24:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 1)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 1)
  %26 = load i8**, i8*** %4, align 8
  %27 = load i8*, i8** %26, align 8
  %28 = load i8*, i8** %5, align 8
  %29 = load i64, i64* %7, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %27, i8* %28, i64 %29, i32 1, i1 false)
  %30 = load i64, i64* %7, align 8
  %31 = load i8**, i8*** %4, align 8
  %32 = load i8*, i8** %31, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 %30
  store i8* %33, i8** %31, align 8
  br label %34

; <label>:34:                                     ; preds = %24, %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 0)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_render_latin1, i64 0, i64 0)
  %36 = load i64, i64* %7, align 8
  ret i64 %36
}

declare i64 @id3_latin1_size(i8*) #3

; Function Attrs: nounwind uwtable
define i64 @id3_render_string(i8**, i64*, i32, i32) #0 {
  %5 = alloca i64, align 8
  %6 = alloca i8**, align 8
  %7 = alloca i64*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i8** %0, i8*** %6, align 8
  store i64* %1, i64** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32 0, i32* %10, align 4
  %11 = load i64*, i64** %7, align 8
  %12 = icmp eq i64* %11, null
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 1)
  store i64* getelementptr inbounds ([0 x i64], [0 x i64]* @id3_ucs4_empty, i32 0, i32 0), i64** %7, align 8
  br label %15

; <label>:15:                                     ; preds = %13, %4
  %16 = load i32, i32* %8, align 4
  switch i32 %16, label %38 [
    i32 0, label %17
    i32 2, label %23
    i32 1, label %25
    i32 3, label %32
  ]

; <label>:17:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 2)
  %19 = load i8**, i8*** %6, align 8
  %20 = load i64*, i64** %7, align 8
  %21 = load i32, i32* %9, align 4
  %22 = call i64 @id3_latin1_serialize(i8** %19, i64* %20, i32 %21)
  store i64 %22, i64* %5, align 8
  br label %40

; <label>:23:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 3)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 3)
  store i32 1, i32* %10, align 4
  br label %25

; <label>:25:                                     ; preds = %23, %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 0)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 0)
  %27 = load i8**, i8*** %6, align 8
  %28 = load i64*, i64** %7, align 8
  %29 = load i32, i32* %10, align 4
  %30 = load i32, i32* %9, align 4
  %31 = call i64 @id3_utf16_serialize(i8** %27, i64* %28, i32 %29, i32 %30)
  store i64 %31, i64* %5, align 8
  br label %40

; <label>:32:                                     ; preds = %15
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 4)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 4)
  %34 = load i8**, i8*** %6, align 8
  %35 = load i64*, i64** %7, align 8
  %36 = load i32, i32* %9, align 4
  %37 = call i64 @id3_utf8_serialize(i8** %34, i64* %35, i32 %36)
  store i64 %37, i64* %5, align 8
  br label %40

; <label>:38:                                     ; preds = %15
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 5)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_id3_render_string, i64 0, i64 5)
  store i64 0, i64* %5, align 8
  br label %40

; <label>:40:                                     ; preds = %38, %32, %25, %17
  %41 = load i64, i64* %5, align 8
  ret i64 %41
}

declare i64 @id3_latin1_serialize(i8**, i64*, i32) #3

declare i64 @id3_utf16_serialize(i8**, i64*, i32, i32) #3

declare i64 @id3_utf8_serialize(i8**, i64*, i32) #3

; Function Attrs: nounwind uwtable
define i64 @id3_render_padding(i8**, i8 zeroext, i64) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i8, align 1
  %6 = alloca i64, align 8
  store i8** %0, i8*** %4, align 8
  store i8 %1, i8* %5, align 1
  store i64 %2, i64* %6, align 8
  %7 = load i8**, i8*** %4, align 8
  %8 = icmp ne i8** %7, null
  br i1 %8, label %9, label %21

; <label>:9:                                      ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_render_padding, i64 0, i64 1)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_render_padding, i64 0, i64 1)
  %11 = load i8**, i8*** %4, align 8
  %12 = load i8*, i8** %11, align 8
  %13 = load i8, i8* %5, align 1
  %14 = zext i8 %13 to i32
  %15 = trunc i32 %14 to i8
  %16 = load i64, i64* %6, align 8
  call void @llvm.memset.p0i8.i64(i8* %12, i8 %15, i64 %16, i32 1, i1 false)
  %17 = load i64, i64* %6, align 8
  %18 = load i8**, i8*** %4, align 8
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 %17
  store i8* %20, i8** %18, align 8
  br label %21

; <label>:21:                                     ; preds = %9, %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_render_padding, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_id3_render_padding, i64 0, i64 0)
  %23 = load i64, i64* %6, align 8
  ret i64 %23
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define i64 @id3_render_paddedstring(i8**, i64*, i64) #0 {
  %4 = alloca i8**, align 8
  %5 = alloca i64*, align 8
  %6 = alloca i64, align 8
  %7 = alloca [31 x i64], align 16
  %8 = alloca i64*, align 8
  store i8** %0, i8*** %4, align 8
  store i64* %1, i64** %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load i64, i64* %6, align 8
  %10 = icmp ule i64 %9, 30
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %3
  br label %15

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 6)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 6)
  call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([9 x i8], [9 x i8]* @.str.1, i32 0, i32 0), i32 189, i8* getelementptr inbounds ([86 x i8], [86 x i8]* @__PRETTY_FUNCTION__.id3_render_paddedstring, i32 0, i32 0)) #5
  unreachable
                                                  ; No predecessors!
  br label %15

; <label>:15:                                     ; preds = %14, %11
  %16 = getelementptr inbounds [31 x i64], [31 x i64]* %7, i32 0, i32 0
  store i64* %16, i64** %8, align 8
  %17 = load i64*, i64** %5, align 8
  %18 = icmp ne i64* %17, null
  br i1 %18, label %19, label %49

; <label>:19:                                     ; preds = %15
  br label %20

; <label>:20:                                     ; preds = %45, %19
  %21 = load i64*, i64** %5, align 8
  %22 = load i64, i64* %21, align 8
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %24, label %29

; <label>:24:                                     ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 2)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 2)
  %26 = load i64, i64* %6, align 8
  %27 = add i64 %26, -1
  store i64 %27, i64* %6, align 8
  %28 = icmp ne i64 %26, 0
  br label %29

; <label>:29:                                     ; preds = %24, %20
  %30 = phi i1 [ false, %20 ], [ %28, %24 ]
  br i1 %30, label %31, label %47

; <label>:31:                                     ; preds = %29
  %32 = load i64*, i64** %5, align 8
  %33 = getelementptr inbounds i64, i64* %32, i32 1
  store i64* %33, i64** %5, align 8
  %34 = load i64, i64* %32, align 8
  %35 = load i64*, i64** %8, align 8
  %36 = getelementptr inbounds i64, i64* %35, i32 1
  store i64* %36, i64** %8, align 8
  store i64 %34, i64* %35, align 8
  %37 = load i64*, i64** %8, align 8
  %38 = getelementptr inbounds i64, i64* %37, i64 -1
  %39 = load i64, i64* %38, align 8
  %40 = icmp eq i64 %39, 10
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 3)
  %43 = load i64*, i64** %8, align 8
  %44 = getelementptr inbounds i64, i64* %43, i64 -1
  store i64 32, i64* %44, align 8
  br label %45

; <label>:45:                                     ; preds = %41, %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 1)
  %46 = add i64 %pgocount3, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 1)
  br label %20

; <label>:47:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 5)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 5)
  br label %49

; <label>:49:                                     ; preds = %47, %15
  br label %50

; <label>:50:                                     ; preds = %54, %49
  %51 = load i64, i64* %6, align 8
  %52 = add i64 %51, -1
  store i64 %52, i64* %6, align 8
  %53 = icmp ne i64 %51, 0
  br i1 %53, label %54, label %58

; <label>:54:                                     ; preds = %50
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 0)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 0)
  %56 = load i64*, i64** %8, align 8
  %57 = getelementptr inbounds i64, i64* %56, i32 1
  store i64* %57, i64** %8, align 8
  store i64 32, i64* %56, align 8
  br label %50

; <label>:58:                                     ; preds = %50
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 4)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_id3_render_paddedstring, i64 0, i64 4)
  %60 = load i64*, i64** %8, align 8
  store i64 0, i64* %60, align 8
  %61 = load i8**, i8*** %4, align 8
  %62 = getelementptr inbounds [31 x i64], [31 x i64]* %7, i32 0, i32 0
  %63 = call i64 @id3_latin1_serialize(i8** %61, i64* %62, i32 0)
  ret i64 %63
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

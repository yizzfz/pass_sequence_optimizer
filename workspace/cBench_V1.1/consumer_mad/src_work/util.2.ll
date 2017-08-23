; ModuleID = 'tmp1.ll'
source_filename = "util.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_id3_util_unsynchronise = private constant [22 x i8] c"id3_util_unsynchronise"
@__profn_id3_util_deunsynchronise = private constant [24 x i8] c"id3_util_deunsynchronise"
@__profn_id3_util_compress = private constant [17 x i8] c"id3_util_compress"
@__profn_id3_util_decompress = private constant [19 x i8] c"id3_util_decompress"
@__profc_id3_util_unsynchronise = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_util_unsynchronise = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 455867030175846633, i64 144850841653, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i32 0, i32 0), i8* bitcast (i64 (i8*, i64)* @id3_util_unsynchronise to i8*), i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_util_deunsynchronise = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_util_deunsynchronise = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7259669728240119867, i64 71523458795, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i32 0, i32 0), i8* bitcast (i64 (i8*, i64)* @id3_util_deunsynchronise to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_util_compress = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_util_compress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1916805676279657106, i64 44857336110, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i32 0, i32 0), i8* bitcast (i8* (i8*, i64, i64*)* @id3_util_compress to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_id3_util_decompress = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_id3_util_decompress = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2813674006213497520, i64 62610911268, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i32 0, i32 0), i8* bitcast (i8* (i8*, i64, i64)* @id3_util_decompress to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [52 x i8] c"U2x\DA\CBL1\8E/-\C9\CC\89/\CD+\AE\CCK\CE(\CA\CF\CB,Ne\CC\84\09\A7\A4\E2\90H\CE\CF-(J-.FV\0A\13\03\00\A2\AA!\8E", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_util_unsynchronise to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_util_deunsynchronise to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_util_compress to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_id3_util_decompress to i8*), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i64 @id3_util_unsynchronise(i8*, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 0, i64* %6, align 8
  %10 = load i8*, i8** %4, align 8
  %11 = load i64, i64* %5, align 8
  %12 = getelementptr inbounds i8, i8* %10, i64 %11
  store i8* %12, i8** %8, align 8
  %13 = load i64, i64* %5, align 8
  %14 = icmp eq i64 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 10)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 10)
  store i64 0, i64* %3, align 8
  br label %113

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %4, align 8
  store i8* %18, i8** %9, align 8
  br label %19

; <label>:19:                                     ; preds = %51, %17
  %20 = load i8*, i8** %9, align 8
  %21 = load i8*, i8** %8, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 -1
  %23 = icmp ult i8* %20, %22
  br i1 %23, label %24, label %54

; <label>:24:                                     ; preds = %19
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 0)
  %26 = load i8*, i8** %9, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 0
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i32
  %30 = icmp eq i32 %29, 255
  br i1 %30, label %31, label %50

; <label>:31:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 2)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 2)
  %33 = load i8*, i8** %9, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 1
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i32
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %46, label %38

; <label>:38:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 5)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 5)
  %40 = load i8*, i8** %9, align 8
  %41 = getelementptr inbounds i8, i8* %40, i64 1
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i32
  %44 = and i32 %43, 224
  %45 = icmp eq i32 %44, 224
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %38, %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 3)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 3)
  %48 = load i64, i64* %6, align 8
  %49 = add i64 %48, 1
  store i64 %49, i64* %6, align 8
  br label %50

; <label>:50:                                     ; preds = %46, %38, %24
  br label %51

; <label>:51:                                     ; preds = %50
  %52 = load i8*, i8** %9, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %9, align 8
  br label %19

; <label>:54:                                     ; preds = %19
  %55 = load i64, i64* %6, align 8
  %56 = icmp ne i64 %55, 0
  br i1 %56, label %57, label %108

; <label>:57:                                     ; preds = %54
  %58 = load i8*, i8** %8, align 8
  store i8* %58, i8** %9, align 8
  %59 = load i64, i64* %6, align 8
  %60 = load i8*, i8** %8, align 8
  %61 = getelementptr inbounds i8, i8* %60, i64 %59
  store i8* %61, i8** %8, align 8
  %62 = load i8*, i8** %9, align 8
  %63 = getelementptr inbounds i8, i8* %62, i32 -1
  store i8* %63, i8** %9, align 8
  %64 = load i8, i8* %63, align 1
  %65 = load i8*, i8** %8, align 8
  %66 = getelementptr inbounds i8, i8* %65, i32 -1
  store i8* %66, i8** %8, align 8
  store i8 %64, i8* %66, align 1
  %67 = load i64, i64* %6, align 8
  store i64 %67, i64* %7, align 8
  br label %68

; <label>:68:                                     ; preds = %100, %57
  %69 = load i64, i64* %7, align 8
  %70 = icmp ne i64 %69, 0
  br i1 %70, label %71, label %106

; <label>:71:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 1)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 1)
  %73 = load i8*, i8** %9, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 -1
  %75 = load i8, i8* %74, align 1
  %76 = zext i8 %75 to i32
  %77 = icmp eq i32 %76, 255
  br i1 %77, label %78, label %99

; <label>:78:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 4)
  %79 = add i64 %pgocount6, 1
  store i64 %79, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 4)
  %80 = load i8*, i8** %9, align 8
  %81 = getelementptr inbounds i8, i8* %80, i64 0
  %82 = load i8, i8* %81, align 1
  %83 = zext i8 %82 to i32
  %84 = icmp eq i32 %83, 0
  br i1 %84, label %93, label %85

; <label>:85:                                     ; preds = %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 7)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 7)
  %87 = load i8*, i8** %9, align 8
  %88 = getelementptr inbounds i8, i8* %87, i64 0
  %89 = load i8, i8* %88, align 1
  %90 = zext i8 %89 to i32
  %91 = and i32 %90, 224
  %92 = icmp eq i32 %91, 224
  br i1 %92, label %93, label %99

; <label>:93:                                     ; preds = %85, %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 6)
  %94 = add i64 %pgocount8, 1
  store i64 %94, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 6)
  %95 = load i8*, i8** %8, align 8
  %96 = getelementptr inbounds i8, i8* %95, i32 -1
  store i8* %96, i8** %8, align 8
  store i8 0, i8* %96, align 1
  %97 = load i64, i64* %7, align 8
  %98 = add i64 %97, -1
  store i64 %98, i64* %7, align 8
  br label %99

; <label>:99:                                     ; preds = %93, %85, %71
  br label %100

; <label>:100:                                    ; preds = %99
  %101 = load i8*, i8** %9, align 8
  %102 = getelementptr inbounds i8, i8* %101, i32 -1
  store i8* %102, i8** %9, align 8
  %103 = load i8, i8* %102, align 1
  %104 = load i8*, i8** %8, align 8
  %105 = getelementptr inbounds i8, i8* %104, i32 -1
  store i8* %105, i8** %8, align 8
  store i8 %103, i8* %105, align 1
  br label %68

; <label>:106:                                    ; preds = %68
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 9)
  %107 = add i64 %pgocount9, 1
  store i64 %107, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 9)
  br label %108

; <label>:108:                                    ; preds = %106, %54
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 8)
  %109 = add i64 %pgocount10, 1
  store i64 %109, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_id3_util_unsynchronise, i64 0, i64 8)
  %110 = load i64, i64* %5, align 8
  %111 = load i64, i64* %6, align 8
  %112 = add i64 %110, %111
  store i64 %112, i64* %3, align 8
  br label %113

; <label>:113:                                    ; preds = %108, %15
  %114 = load i64, i64* %3, align 8
  ret i64 %114
}

; Function Attrs: nounwind uwtable
define i64 @id3_util_deunsynchronise(i8*, i64) #0 {
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %9 = load i8*, i8** %4, align 8
  %10 = load i64, i64* %5, align 8
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  store i8* %11, i8** %7, align 8
  %12 = load i64, i64* %5, align 8
  %13 = icmp eq i64 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 4)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 4)
  store i64 0, i64* %3, align 8
  br label %60

; <label>:16:                                     ; preds = %2
  %17 = load i8*, i8** %4, align 8
  store i8* %17, i8** %8, align 8
  store i8* %17, i8** %6, align 8
  br label %18

; <label>:18:                                     ; preds = %46, %16
  %19 = load i8*, i8** %6, align 8
  %20 = load i8*, i8** %7, align 8
  %21 = getelementptr inbounds i8, i8* %20, i64 -1
  %22 = icmp ult i8* %19, %21
  br i1 %22, label %23, label %49

; <label>:23:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 0)
  %25 = load i8*, i8** %6, align 8
  %26 = load i8, i8* %25, align 1
  %27 = load i8*, i8** %8, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %8, align 8
  store i8 %26, i8* %27, align 1
  %29 = load i8*, i8** %6, align 8
  %30 = getelementptr inbounds i8, i8* %29, i64 0
  %31 = load i8, i8* %30, align 1
  %32 = zext i8 %31 to i32
  %33 = icmp eq i32 %32, 255
  br i1 %33, label %34, label %45

; <label>:34:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 1)
  %36 = load i8*, i8** %6, align 8
  %37 = getelementptr inbounds i8, i8* %36, i64 1
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i32
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %45

; <label>:41:                                     ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 2)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 2)
  %43 = load i8*, i8** %6, align 8
  %44 = getelementptr inbounds i8, i8* %43, i32 1
  store i8* %44, i8** %6, align 8
  br label %45

; <label>:45:                                     ; preds = %41, %34, %23
  br label %46

; <label>:46:                                     ; preds = %45
  %47 = load i8*, i8** %6, align 8
  %48 = getelementptr inbounds i8, i8* %47, i32 1
  store i8* %48, i8** %6, align 8
  br label %18

; <label>:49:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 3)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_deunsynchronise, i64 0, i64 3)
  %51 = load i8*, i8** %6, align 8
  %52 = load i8, i8* %51, align 1
  %53 = load i8*, i8** %8, align 8
  %54 = getelementptr inbounds i8, i8* %53, i32 1
  store i8* %54, i8** %8, align 8
  store i8 %52, i8* %53, align 1
  %55 = load i8*, i8** %8, align 8
  %56 = load i8*, i8** %4, align 8
  %57 = ptrtoint i8* %55 to i64
  %58 = ptrtoint i8* %56 to i64
  %59 = sub i64 %57, %58
  store i64 %59, i64* %3, align 8
  br label %60

; <label>:60:                                     ; preds = %49, %14
  %61 = load i64, i64* %3, align 8
  ret i64 %61
}

; Function Attrs: nounwind uwtable
define i8* @id3_util_compress(i8*, i64, i64*) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64*, align 8
  %7 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64* %2, i64** %6, align 8
  %8 = load i64, i64* %5, align 8
  %9 = add i64 %8, 12
  %10 = load i64*, i64** %6, align 8
  store i64 %9, i64* %10, align 8
  %11 = load i64*, i64** %6, align 8
  %12 = load i64, i64* %11, align 8
  %13 = udiv i64 %12, 1000
  %14 = load i64*, i64** %6, align 8
  %15 = load i64, i64* %14, align 8
  %16 = add i64 %15, %13
  store i64 %16, i64* %14, align 8
  %17 = load i64*, i64** %6, align 8
  %18 = load i64, i64* %17, align 8
  %19 = call noalias i8* @malloc(i64 %18) #3
  store i8* %19, i8** %7, align 8
  %20 = load i8*, i8** %7, align 8
  %21 = icmp ne i8* %20, null
  br i1 %21, label %22, label %40

; <label>:22:                                     ; preds = %3
  %23 = load i8*, i8** %7, align 8
  %24 = load i64*, i64** %6, align 8
  %25 = load i8*, i8** %4, align 8
  %26 = load i64, i64* %5, align 8
  %27 = call i32 @compress2(i8* %23, i64* %24, i8* %25, i64 %26, i32 9)
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %35, label %29

; <label>:29:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 3)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 3)
  %31 = load i64*, i64** %6, align 8
  %32 = load i64, i64* %31, align 8
  %33 = load i64, i64* %5, align 8
  %34 = icmp uge i64 %32, %33
  br i1 %34, label %35, label %38

; <label>:35:                                     ; preds = %29, %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 2)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 2)
  %37 = load i8*, i8** %7, align 8
  call void @free(i8* %37) #3
  store i8* null, i8** %7, align 8
  br label %38

; <label>:38:                                     ; preds = %35, %29
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 1)
  br label %40

; <label>:40:                                     ; preds = %38, %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 0)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_id3_util_compress, i64 0, i64 0)
  %42 = load i8*, i8** %7, align 8
  ret i8* %42
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare i32 @compress2(i8*, i64*, i8*, i64, i32) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind uwtable
define i8* @id3_util_decompress(i8*, i64, i64) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load i64, i64* %6, align 8
  %10 = icmp ne i64 %9, 0
  br i1 %10, label %11, label %14

; <label>:11:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 0)
  %13 = load i64, i64* %6, align 8
  br label %16

; <label>:14:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 3)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 3)
  br label %16

; <label>:16:                                     ; preds = %14, %11
  %17 = phi i64 [ %13, %11 ], [ 1, %14 ]
  %18 = call noalias i8* @malloc(i64 %17) #3
  store i8* %18, i8** %7, align 8
  %19 = load i8*, i8** %7, align 8
  %20 = icmp ne i8* %19, null
  br i1 %20, label %21, label %38

; <label>:21:                                     ; preds = %16
  %22 = load i64, i64* %6, align 8
  store i64 %22, i64* %8, align 8
  %23 = load i8*, i8** %7, align 8
  %24 = load i8*, i8** %4, align 8
  %25 = load i64, i64* %5, align 8
  %26 = call i32 @uncompress(i8* %23, i64* %8, i8* %24, i64 %25)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %33, label %28

; <label>:28:                                     ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 4)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 4)
  %30 = load i64, i64* %8, align 8
  %31 = load i64, i64* %6, align 8
  %32 = icmp ne i64 %30, %31
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %28, %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 2)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 2)
  %35 = load i8*, i8** %7, align 8
  call void @free(i8* %35) #3
  store i8* null, i8** %7, align 8
  br label %36

; <label>:36:                                     ; preds = %33, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 1)
  %37 = add i64 %pgocount4, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_id3_util_decompress, i64 0, i64 1)
  br label %38

; <label>:38:                                     ; preds = %36, %16
  %39 = load i8*, i8** %7, align 8
  ret i8* %39
}

declare i32 @uncompress(i8*, i64*, i8*, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

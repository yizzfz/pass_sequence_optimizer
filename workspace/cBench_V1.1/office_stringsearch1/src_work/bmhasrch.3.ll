; ModuleID = 'bmhasrch.2.ll'
source_filename = "bmhasrch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@lowervec = global [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@abcdefghijklmnopqrstuvwxyz[\5C]^_`abcdefghijklmnopqrstuvwxyz{|}~\7Fcueaaaaceeeiiiaae\91\92ooouuyou\9B\9C\9D\9E\9Faiounn\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16
@pat = internal global i8* null, align 8
@patlen = internal global i32 0, align 4
@skip = internal global [256 x i32] zeroinitializer, align 16
@skip2 = internal global i32 0, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bmha_init = private constant [9 x i8] c"bmha_init"
@__profn_bmha_search = private constant [11 x i8] c"bmha_search"
@__profc_bmha_init = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmha_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4109711212533073515, i64 128297008677, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i32 0, i32 0), i8* bitcast (void (i8*)* @bmha_init to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bmha_search = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmha_search = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5118745765777816972, i64 118582203326, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @bmha_search to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [28 x i8] c"\15\1Ax\DAK\CA\CDH\8C\CF\CC\CB,aL\02\B1\8AS\13\8B\923\00X\A0\08\1A", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmha_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmha_search to i8*), i8* getelementptr inbounds ([28 x i8], [28 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @bmha_init(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  store i8* %5, i8** @pat, align 8
  %6 = load i8*, i8** %2, align 8
  %7 = call i64 @strlen(i8* %6) #3
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* @patlen, align 4
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9:                                      ; preds = %69, %1
  %10 = load i32, i32* %3, align 4
  %11 = icmp sle i32 %10, 255
  br i1 %11, label %12, label %73

; <label>:12:                                     ; preds = %9
  %13 = load i32, i32* @patlen, align 4
  %14 = load i32, i32* %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %15
  store i32 %13, i32* %16, align 4
  %17 = load i32, i32* @patlen, align 4
  %18 = sub nsw i32 %17, 1
  store i32 %18, i32* %4, align 4
  br label %19

; <label>:19:                                     ; preds = %42, %12
  %20 = load i32, i32* %4, align 4
  %21 = icmp sge i32 %20, 0
  br i1 %21, label %22, label %46

; <label>:22:                                     ; preds = %19
  %23 = load i32, i32* %3, align 4
  %24 = trunc i32 %23 to i8
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i32
  %29 = load i8*, i8** @pat, align 8
  %30 = load i32, i32* %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i8, i8* %29, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = zext i8 %36 to i32
  %38 = icmp eq i32 %28, %37
  br i1 %38, label %39, label %41

; <label>:39:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 6)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 6)
  br label %46

; <label>:41:                                     ; preds = %22
  br label %42

; <label>:42:                                     ; preds = %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 0)
  %44 = load i32, i32* %4, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %4, align 4
  br label %19

; <label>:46:                                     ; preds = %39, %19
  %47 = load i32, i32* %4, align 4
  %48 = icmp sge i32 %47, 0
  br i1 %48, label %49, label %58

; <label>:49:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 3)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 3)
  %51 = load i32, i32* @patlen, align 4
  %52 = load i32, i32* %4, align 4
  %53 = sub nsw i32 %51, %52
  %54 = sub nsw i32 %53, 1
  %55 = load i32, i32* %3, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %56
  store i32 %54, i32* %57, align 4
  br label %58

; <label>:58:                                     ; preds = %49, %46
  %59 = load i32, i32* %4, align 4
  %60 = load i32, i32* @patlen, align 4
  %61 = sub nsw i32 %60, 1
  %62 = icmp eq i32 %59, %61
  br i1 %62, label %63, label %68

; <label>:63:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 4)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 4)
  %65 = load i32, i32* %3, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %66
  store i32 32767, i32* %67, align 4
  br label %68

; <label>:68:                                     ; preds = %63, %58
  br label %69

; <label>:69:                                     ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 1)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 1)
  %71 = load i32, i32* %3, align 4
  %72 = add nsw i32 %71, 1
  store i32 %72, i32* %3, align 4
  br label %9

; <label>:73:                                     ; preds = %9
  %74 = load i32, i32* @patlen, align 4
  store i32 %74, i32* @skip2, align 4
  store i32 0, i32* %3, align 4
  br label %75

; <label>:75:                                     ; preds = %108, %73
  %76 = load i32, i32* %3, align 4
  %77 = load i32, i32* @patlen, align 4
  %78 = sub nsw i32 %77, 1
  %79 = icmp slt i32 %76, %78
  br i1 %79, label %80, label %112

; <label>:80:                                     ; preds = %75
  %81 = load i8*, i8** @pat, align 8
  %82 = load i32, i32* %3, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %81, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i64
  %87 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %86
  %88 = load i8, i8* %87, align 1
  %89 = zext i8 %88 to i32
  %90 = load i8*, i8** @pat, align 8
  %91 = load i32, i32* @patlen, align 4
  %92 = sub nsw i32 %91, 1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds i8, i8* %90, i64 %93
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %96
  %98 = load i8, i8* %97, align 1
  %99 = zext i8 %98 to i32
  %100 = icmp eq i32 %89, %99
  br i1 %100, label %101, label %107

; <label>:101:                                    ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 5)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 5)
  %103 = load i32, i32* @patlen, align 4
  %104 = load i32, i32* %3, align 4
  %105 = sub nsw i32 %103, %104
  %106 = sub nsw i32 %105, 1
  store i32 %106, i32* @skip2, align 4
  br label %107

; <label>:107:                                    ; preds = %101, %80
  br label %108

; <label>:108:                                    ; preds = %107
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 2)
  %109 = add i64 %pgocount6, 1
  store i64 %109, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 2)
  %110 = load i32, i32* %3, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %3, align 4
  br label %75

; <label>:112:                                    ; preds = %75
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 7)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_init, i64 0, i64 7)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: nounwind uwtable
define i8* @bmha_search(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %9 = load i32, i32* @patlen, align 4
  %10 = sub nsw i32 %9, 1
  %11 = load i32, i32* %5, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, i32* %6, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 4)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 4)
  store i8* null, i8** %3, align 8
  br label %99

; <label>:17:                                     ; preds = %2
  %18 = load i32, i32* %5, align 4
  %19 = load i8*, i8** %4, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %4, align 8
  br label %22

; <label>:22:                                     ; preds = %97, %17
  br label %23

; <label>:23:                                     ; preds = %35, %22
  %24 = load i8*, i8** %4, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* %24, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %6, align 4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 0)
  br label %23

; <label>:37:                                     ; preds = %23
  %38 = load i32, i32* %6, align 4
  %39 = load i32, i32* %5, align 4
  %40 = sub nsw i32 32767, %39
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 5)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 5)
  store i8* null, i8** %3, align 8
  br label %99

; <label>:44:                                     ; preds = %37
  %45 = load i32, i32* %6, align 4
  %46 = sub nsw i32 %45, 32767
  store i32 %46, i32* %6, align 4
  %47 = load i32, i32* @patlen, align 4
  %48 = sub nsw i32 %47, 1
  store i32 %48, i32* %7, align 4
  %49 = load i8*, i8** %4, align 8
  %50 = load i32, i32* %6, align 4
  %51 = load i32, i32* %7, align 4
  %52 = sub nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %49, i64 %53
  store i8* %54, i8** %8, align 8
  br label %55

; <label>:55:                                     ; preds = %82, %44
  %56 = load i32, i32* %7, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %7, align 4
  %58 = icmp sge i32 %57, 0
  br i1 %58, label %59, label %80

; <label>:59:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 2)
  %61 = load i8*, i8** %8, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = zext i8 %65 to i64
  %67 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i32
  %70 = load i8*, i8** @pat, align 8
  %71 = load i32, i32* %7, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds i8, i8* %70, i64 %72
  %74 = load i8, i8* %73, align 1
  %75 = zext i8 %74 to i64
  %76 = getelementptr inbounds [256 x i8], [256 x i8]* @lowervec, i64 0, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = zext i8 %77 to i32
  %79 = icmp eq i32 %69, %78
  br label %80

; <label>:80:                                     ; preds = %59, %55
  %81 = phi i1 [ false, %55 ], [ %79, %59 ]
  br i1 %81, label %82, label %84

; <label>:82:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 1)
  %83 = add i64 %pgocount4, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 1)
  br label %55

; <label>:84:                                     ; preds = %80
  %85 = load i32, i32* %7, align 4
  %86 = icmp slt i32 %85, 0
  br i1 %86, label %87, label %90

; <label>:87:                                     ; preds = %84
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 6)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 6)
  %89 = load i8*, i8** %8, align 8
  store i8* %89, i8** %3, align 8
  br label %99

; <label>:90:                                     ; preds = %84
  %91 = load i32, i32* @skip2, align 4
  %92 = load i32, i32* %6, align 4
  %93 = add nsw i32 %92, %91
  store i32 %93, i32* %6, align 4
  %94 = icmp sge i32 %93, 0
  br i1 %94, label %95, label %97

; <label>:95:                                     ; preds = %90
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 7)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 7)
  store i8* null, i8** %3, align 8
  br label %99

; <label>:97:                                     ; preds = %90
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 3)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmha_search, i64 0, i64 3)
  br label %22

; <label>:99:                                     ; preds = %95, %87, %42, %15
  %100 = load i8*, i8** %3, align 8
  ret i8* %100
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

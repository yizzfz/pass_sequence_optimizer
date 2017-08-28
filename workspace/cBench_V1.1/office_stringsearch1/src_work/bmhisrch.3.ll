; ModuleID = 'bmhisrch.2.ll'
source_filename = "bmhisrch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@patlen = internal global i32 0, align 4
@pat = internal global i8* null, align 8
@skip = internal global [256 x i32] zeroinitializer, align 16
@skip2 = internal global i32 0, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bmhi_init = private constant [9 x i8] c"bmhi_init"
@__profn_bhmi_cleanup = private constant [12 x i8] c"bhmi_cleanup"
@__profn_bmhi_search = private constant [11 x i8] c"bmhi_search"
@__profc_bmhi_init = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmhi_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4425970358218400142, i64 127023198201, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i32 0, i32 0), i8* bitcast (void (i8*)* @bmhi_init to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bhmi_cleanup = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bhmi_cleanup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7904940528273817350, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bhmi_cleanup, i32 0, i32 0), i8* bitcast (void ()* @bhmi_cleanup to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bmhi_search = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmhi_search = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2354819242240113030, i64 118582203326, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @bmhi_search to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [36 x i8] c"\22\00bmhi_init\01bhmi_cleanup\01bmhi_search", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmhi_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bhmi_cleanup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmhi_search to i8*), i8* getelementptr inbounds ([36 x i8], [36 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @bmhi_init(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  %6 = call i64 @strlen(i8* %5) #5
  %7 = trunc i64 %6 to i32
  store i32 %7, i32* @patlen, align 4
  %8 = load i8*, i8** @pat, align 8
  %9 = load i32, i32* @patlen, align 4
  %10 = sext i32 %9 to i64
  %11 = call i8* @realloc(i8* %8, i64 %10) #4
  store i8* %11, i8** @pat, align 8
  %12 = load i8*, i8** @pat, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 6)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 6)
  call void @exit(i32 1) #6
  unreachable

; <label>:16:                                     ; preds = %1
  %17 = call i32 @atexit(void ()* @bhmi_cleanup) #4
  br label %18

; <label>:18:                                     ; preds = %16
  store i32 0, i32* %3, align 4
  br label %19

; <label>:19:                                     ; preds = %36, %18
  %20 = load i32, i32* %3, align 4
  %21 = load i32, i32* @patlen, align 4
  %22 = icmp slt i32 %20, %21
  br i1 %22, label %23, label %40

; <label>:23:                                     ; preds = %19
  %24 = load i8*, i8** %2, align 8
  %25 = load i32, i32* %3, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* %24, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = call i32 @toupper(i32 %29) #5
  %31 = trunc i32 %30 to i8
  %32 = load i8*, i8** @pat, align 8
  %33 = load i32, i32* %3, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds i8, i8* %32, i64 %34
  store i8 %31, i8* %35, align 1
  br label %36

; <label>:36:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 0)
  %38 = load i32, i32* %3, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %3, align 4
  br label %19

; <label>:40:                                     ; preds = %19
  store i32 0, i32* %3, align 4
  br label %41

; <label>:41:                                     ; preds = %49, %40
  %42 = load i32, i32* %3, align 4
  %43 = icmp sle i32 %42, 255
  br i1 %43, label %44, label %53

; <label>:44:                                     ; preds = %41
  %45 = load i32, i32* @patlen, align 4
  %46 = load i32, i32* %3, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %47
  store i32 %45, i32* %48, align 4
  br label %49

; <label>:49:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 1)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 1)
  %51 = load i32, i32* %3, align 4
  %52 = add nsw i32 %51, 1
  store i32 %52, i32* %3, align 4
  br label %41

; <label>:53:                                     ; preds = %41
  store i32 0, i32* %3, align 4
  br label %54

; <label>:54:                                     ; preds = %84, %53
  %55 = load i32, i32* %3, align 4
  %56 = load i32, i32* @patlen, align 4
  %57 = sub nsw i32 %56, 1
  %58 = icmp slt i32 %55, %57
  br i1 %58, label %59, label %88

; <label>:59:                                     ; preds = %54
  %60 = load i32, i32* @patlen, align 4
  %61 = load i32, i32* %3, align 4
  %62 = sub nsw i32 %60, %61
  %63 = sub nsw i32 %62, 1
  %64 = load i8*, i8** @pat, align 8
  %65 = load i32, i32* %3, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds i8, i8* %64, i64 %66
  %68 = load i8, i8* %67, align 1
  %69 = zext i8 %68 to i64
  %70 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %69
  store i32 %63, i32* %70, align 4
  %71 = load i32, i32* @patlen, align 4
  %72 = load i32, i32* %3, align 4
  %73 = sub nsw i32 %71, %72
  %74 = sub nsw i32 %73, 1
  %75 = load i8*, i8** @pat, align 8
  %76 = load i32, i32* %3, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds i8, i8* %75, i64 %77
  %79 = load i8, i8* %78, align 1
  %80 = zext i8 %79 to i32
  %81 = call i32 @tolower(i32 %80) #5
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %82
  store i32 %74, i32* %83, align 4
  br label %84

; <label>:84:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 2)
  %85 = add i64 %pgocount3, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 2)
  %86 = load i32, i32* %3, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %3, align 4
  br label %54

; <label>:88:                                     ; preds = %54
  %89 = load i8*, i8** @pat, align 8
  %90 = load i32, i32* @patlen, align 4
  %91 = sub nsw i32 %90, 1
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i8, i8* %89, i64 %92
  %94 = load i8, i8* %93, align 1
  %95 = zext i8 %94 to i32
  store i32 %95, i32* %4, align 4
  %96 = load i32, i32* %4, align 4
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %97
  store i32 32767, i32* %98, align 4
  %99 = load i32, i32* %4, align 4
  %100 = call i32 @tolower(i32 %99) #5
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %101
  store i32 32767, i32* %102, align 4
  %103 = load i32, i32* @patlen, align 4
  store i32 %103, i32* @skip2, align 4
  store i32 0, i32* %3, align 4
  br label %104

; <label>:104:                                    ; preds = %125, %88
  %105 = load i32, i32* %3, align 4
  %106 = load i32, i32* @patlen, align 4
  %107 = sub nsw i32 %106, 1
  %108 = icmp slt i32 %105, %107
  br i1 %108, label %109, label %129

; <label>:109:                                    ; preds = %104
  %110 = load i8*, i8** @pat, align 8
  %111 = load i32, i32* %3, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i8, i8* %110, i64 %112
  %114 = load i8, i8* %113, align 1
  %115 = zext i8 %114 to i32
  %116 = load i32, i32* %4, align 4
  %117 = icmp eq i32 %115, %116
  br i1 %117, label %118, label %124

; <label>:118:                                    ; preds = %109
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 4)
  %119 = add i64 %pgocount4, 1
  store i64 %119, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 4)
  %120 = load i32, i32* @patlen, align 4
  %121 = load i32, i32* %3, align 4
  %122 = sub nsw i32 %120, %121
  %123 = sub nsw i32 %122, 1
  store i32 %123, i32* @skip2, align 4
  br label %124

; <label>:124:                                    ; preds = %118, %109
  br label %125

; <label>:125:                                    ; preds = %124
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 3)
  %126 = add i64 %pgocount5, 1
  store i64 %126, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 3)
  %127 = load i32, i32* %3, align 4
  %128 = add nsw i32 %127, 1
  store i32 %128, i32* %3, align 4
  br label %104

; <label>:129:                                    ; preds = %104
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 5)
  %130 = add i64 %pgocount6, 1
  store i64 %130, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_bmhi_init, i64 0, i64 5)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind
declare i32 @atexit(void ()*) #2

; Function Attrs: noinline nounwind uwtable
define void @bhmi_cleanup() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bhmi_cleanup, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bhmi_cleanup, i64 0, i64 0)
  %2 = load i8*, i8** @pat, align 8
  call void @free(i8* %2) #4
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @toupper(i32) #1

; Function Attrs: nounwind readonly
declare i32 @tolower(i32) #1

; Function Attrs: noinline nounwind uwtable
define i8* @bmhi_search(i8*, i32) #0 {
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
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 4)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 4)
  store i8* null, i8** %3, align 8
  br label %94

; <label>:17:                                     ; preds = %2
  %18 = load i32, i32* %5, align 4
  %19 = load i8*, i8** %4, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %4, align 8
  br label %22

; <label>:22:                                     ; preds = %92, %17
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
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 0)
  br label %23

; <label>:37:                                     ; preds = %23
  %38 = load i32, i32* %6, align 4
  %39 = load i32, i32* %5, align 4
  %40 = sub nsw i32 32767, %39
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 5)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 5)
  store i8* null, i8** %3, align 8
  br label %94

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

; <label>:55:                                     ; preds = %77, %44
  %56 = load i32, i32* %7, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %7, align 4
  %58 = icmp sge i32 %57, 0
  br i1 %58, label %59, label %75

; <label>:59:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 2)
  %61 = load i8*, i8** %8, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = call i32 @toupper(i32 %66) #5
  %68 = load i8*, i8** @pat, align 8
  %69 = load i32, i32* %7, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i8, i8* %68, i64 %70
  %72 = load i8, i8* %71, align 1
  %73 = zext i8 %72 to i32
  %74 = icmp eq i32 %67, %73
  br label %75

; <label>:75:                                     ; preds = %59, %55
  %76 = phi i1 [ false, %55 ], [ %74, %59 ]
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %75
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 1)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 1)
  br label %55

; <label>:79:                                     ; preds = %75
  %80 = load i32, i32* %7, align 4
  %81 = icmp slt i32 %80, 0
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 6)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 6)
  %84 = load i8*, i8** %8, align 8
  store i8* %84, i8** %3, align 8
  br label %94

; <label>:85:                                     ; preds = %79
  %86 = load i32, i32* @skip2, align 4
  %87 = load i32, i32* %6, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %6, align 4
  %89 = icmp sge i32 %88, 0
  br i1 %89, label %90, label %92

; <label>:90:                                     ; preds = %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 7)
  %91 = add i64 %pgocount6, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 7)
  store i8* null, i8** %3, align 8
  br label %94

; <label>:92:                                     ; preds = %85
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 3)
  %93 = add i64 %pgocount7, 1
  store i64 %93, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmhi_search, i64 0, i64 3)
  br label %22

; <label>:94:                                     ; preds = %90, %82, %42, %15
  %95 = load i8*, i8** %3, align 8
  ret i8* %95
}

; Function Attrs: nounwind
declare void @free(i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }
attributes #6 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

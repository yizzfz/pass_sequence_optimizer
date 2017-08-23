; ModuleID = 'tmp1.ll'
source_filename = "good.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }
%struct.success = type { %struct.dent*, %struct.flagent*, %struct.flagent* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@hashheader = external global %struct.hashheader, align 4
@numhits = external global i32, align 4
@cflag = external global i32, align 4
@.str = private unnamed_addr constant [3 x i8] c"%s\00", align 1
@orig_word = internal global i8* null, align 8
@hits = external global [10 x %struct.success], align 16
@compoundflag = external global i32, align 4
@outfile1 = external global %struct._IO_FILE*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_good = private constant [4 x i8] c"good"
@__profn_cap_ok = private constant [6 x i8] c"cap_ok"
@__profn_tmp1.ll_entryhasaffixes = private constant [23 x i8] c"tmp1.ll:entryhasaffixes"
@__profn_flagpr = private constant [6 x i8] c"flagpr"
@__profc_good = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_good = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7803828365227106443, i64 157140673160, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i32 0, i32 0), i8* bitcast (i32 (i8*, i32, i32, i32, i32)* @good to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_cap_ok = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_cap_ok = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2281344961233944320, i64 398692724453, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i32 0, i32 0), i8* bitcast (i32 (i8*, %struct.success*, i32)* @cap_ok to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_entryhasaffixes = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_entryhasaffixes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2700867155745368103, i64 59148973324, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_flagpr = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_flagpr = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7360782108679543067, i64 355344504040, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32, i32, i32, i32)* @flagpr to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [52 x i8] c"*2x\DAK\CF\CFOaLN,\88\CF\CFf,\C9-0\D4\CB\C9\B1J\CD+)\AA\CCH,NLK\CB\ACH-fL\CBIL/(\02\00H\D8\0F\AC", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_good to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_cap_ok to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_entryhasaffixes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_flagpr to i8*), i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @good(i8*, i32, i32, i32, i32) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca [120 x i8], align 16
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i32, align 4
  %16 = alloca %struct.dent*, align 8
  store i8* %0, i8** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  %17 = load i8*, i8** %7, align 8
  store i8* %17, i8** %13, align 8
  %18 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  store i8* %18, i8** %14, align 8
  br label %19

; <label>:19:                                     ; preds = %23, %5
  %20 = load i8*, i8** %13, align 8
  %21 = load i8, i8* %20, align 1
  %22 = icmp ne i8 %21, 0
  br i1 %22, label %23, label %33

; <label>:23:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 0)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 0)
  %25 = load i8*, i8** %13, align 8
  %26 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %26, i8** %13, align 8
  %27 = load i8, i8* %25, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = load i8*, i8** %14, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %14, align 8
  store i8 %30, i8* %31, align 1
  br label %19

; <label>:33:                                     ; preds = %19
  %34 = load i8*, i8** %14, align 8
  store i8 0, i8* %34, align 1
  %35 = load i8*, i8** %14, align 8
  %36 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %37 = ptrtoint i8* %35 to i64
  %38 = ptrtoint i8* %36 to i64
  %39 = sub i64 %37, %38
  %40 = trunc i64 %39 to i32
  store i32 %40, i32* %15, align 4
  store i32 0, i32* @numhits, align 4
  %41 = load i32, i32* @cflag, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %49

; <label>:43:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 1)
  %45 = load i8*, i8** %7, align 8
  %46 = call i8* @ichartosstr(i8* %45, i32 0)
  %47 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8* %46)
  %48 = load i8*, i8** %7, align 8
  store i8* %48, i8** @orig_word, align 8
  br label %98

; <label>:49:                                     ; preds = %33
  %50 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %51 = call %struct.dent* @lookup(i8* %50, i32 1)
  store %struct.dent* %51, %struct.dent** %16, align 8
  %52 = icmp ne %struct.dent* %51, null
  br i1 %52, label %53, label %96

; <label>:53:                                     ; preds = %49
  %54 = load %struct.dent*, %struct.dent** %16, align 8
  store %struct.dent* %54, %struct.dent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 0), align 16
  store %struct.flagent* null, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 1), align 8
  store %struct.flagent* null, %struct.flagent** getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0, i32 2), align 16
  %55 = load i32, i32* %9, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %63, label %57

; <label>:57:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 9)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 9)
  %59 = load i8*, i8** %7, align 8
  %60 = load i32, i32* %15, align 4
  %61 = call i32 @cap_ok(i8* %59, %struct.success* getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0), i32 %60)
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %57, %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 7)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 7)
  store i32 1, i32* @numhits, align 4
  br label %65

; <label>:65:                                     ; preds = %63, %57
  %66 = load i32, i32* @compoundflag, align 4
  %67 = icmp eq i32 %66, 2
  br i1 %67, label %68, label %94

; <label>:68:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 8)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 8)
  %70 = load i32, i32* %10, align 4
  %71 = load i32, i32* %11, align 4
  %72 = or i32 %70, %71
  %73 = and i32 %72, 2
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %94

; <label>:75:                                     ; preds = %68
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 10)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 10)
  %77 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 5), align 2
  %78 = sext i16 %77 to i32
  %79 = icmp sge i32 %78, 0
  br i1 %79, label %80, label %94

; <label>:80:                                     ; preds = %75
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 11)
  %81 = add i64 %pgocount6, 1
  store i64 %81, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 11)
  %82 = load %struct.dent*, %struct.dent** %16, align 8
  %83 = getelementptr inbounds %struct.dent, %struct.dent* %82, i32 0, i32 2
  %84 = getelementptr inbounds [1 x i64], [1 x i64]* %83, i64 0, i64 0
  %85 = load i64, i64* %84, align 8
  %86 = load i16, i16* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 5), align 2
  %87 = sext i16 %86 to i32
  %88 = zext i32 %87 to i64
  %89 = shl i64 1, %88
  %90 = and i64 %85, %89
  %91 = icmp eq i64 %90, 0
  br i1 %91, label %92, label %94

; <label>:92:                                     ; preds = %80
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 12)
  %93 = add i64 %pgocount7, 1
  store i64 %93, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 12)
  store i32 0, i32* @numhits, align 4
  br label %94

; <label>:94:                                     ; preds = %92, %80, %75, %68, %65
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 5)
  %95 = add i64 %pgocount8, 1
  store i64 %95, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 5)
  br label %96

; <label>:96:                                     ; preds = %94, %49
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 4)
  %97 = add i64 %pgocount9, 1
  store i64 %97, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 4)
  br label %98

; <label>:98:                                     ; preds = %96, %43
  %99 = load i32, i32* @numhits, align 4
  %100 = icmp ne i32 %99, 0
  br i1 %100, label %101, label %107

; <label>:101:                                    ; preds = %98
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 2)
  %102 = add i64 %pgocount10, 1
  store i64 %102, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 2)
  %103 = load i32, i32* %9, align 4
  %104 = icmp ne i32 %103, 0
  br i1 %104, label %107, label %105

; <label>:105:                                    ; preds = %101
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 6)
  %106 = add i64 %pgocount11, 1
  store i64 %106, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 6)
  store i32 1, i32* %6, align 4
  br label %122

; <label>:107:                                    ; preds = %101, %98
  %108 = load i8*, i8** %7, align 8
  %109 = getelementptr inbounds [120 x i8], [120 x i8]* %12, i32 0, i32 0
  %110 = load i32, i32* %15, align 4
  %111 = load i32, i32* %8, align 4
  %112 = load i32, i32* %9, align 4
  %113 = load i32, i32* %10, align 4
  %114 = load i32, i32* %11, align 4
  call void @chk_aff(i8* %108, i8* %109, i32 %110, i32 %111, i32 %112, i32 %113, i32 %114)
  %115 = load i32, i32* @cflag, align 4
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %117, label %120

; <label>:117:                                    ; preds = %107
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 3)
  %118 = add i64 %pgocount12, 1
  store i64 %118, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_good, i64 0, i64 3)
  %119 = call i32 @putchar(i32 10)
  br label %120

; <label>:120:                                    ; preds = %117, %107
  %121 = load i32, i32* @numhits, align 4
  store i32 %121, i32* %6, align 4
  br label %122

; <label>:122:                                    ; preds = %120, %105
  %123 = load i32, i32* %6, align 4
  ret i32 %123
}

declare i32 @printf(i8*, ...) #1

declare i8* @ichartosstr(i8*, i32) #1

declare %struct.dent* @lookup(i8*, i32) #1

; Function Attrs: nounwind uwtable
define i32 @cap_ok(i8*, %struct.success*, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8*, align 8
  %6 = alloca %struct.success*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.dent*, align 8
  %11 = alloca [120 x i8], align 16
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i64, align 8
  %17 = alloca i64, align 8
  store i8* %0, i8** %5, align 8
  store %struct.success* %1, %struct.success** %6, align 8
  store i32 %2, i32* %7, align 4
  %18 = load i8*, i8** %5, align 8
  %19 = call i64 @whatcap(i8* %18)
  store i64 %19, i64* %16, align 8
  store i32 0, i32* %14, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  %20 = load i64, i64* %16, align 8
  %21 = icmp eq i64 %20, 268435456
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 13)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 13)
  store i32 1, i32* %4, align 4
  br label %280

; <label>:24:                                     ; preds = %3
  %25 = load i64, i64* %16, align 8
  %26 = icmp eq i64 %25, 805306368
  br i1 %26, label %27, label %64

; <label>:27:                                     ; preds = %24
  %28 = load %struct.success*, %struct.success** %6, align 8
  %29 = getelementptr inbounds %struct.success, %struct.success* %28, i32 0, i32 1
  %30 = load %struct.flagent*, %struct.flagent** %29, align 8
  %31 = icmp ne %struct.flagent* %30, null
  br i1 %31, label %32, label %45

; <label>:32:                                     ; preds = %27
  %33 = load %struct.success*, %struct.success** %6, align 8
  %34 = getelementptr inbounds %struct.success, %struct.success* %33, i32 0, i32 1
  %35 = load %struct.flagent*, %struct.flagent** %34, align 8
  %36 = getelementptr inbounds %struct.flagent, %struct.flagent* %35, i32 0, i32 4
  %37 = load i16, i16* %36, align 4
  %38 = sext i16 %37 to i32
  store i32 %38, i32* %12, align 4
  %39 = load %struct.success*, %struct.success** %6, align 8
  %40 = getelementptr inbounds %struct.success, %struct.success* %39, i32 0, i32 1
  %41 = load %struct.flagent*, %struct.flagent** %40, align 8
  %42 = getelementptr inbounds %struct.flagent, %struct.flagent* %41, i32 0, i32 3
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i32
  store i32 %44, i32* %13, align 4
  br label %47

; <label>:45:                                     ; preds = %27
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 20)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 20)
  store i32 0, i32* %13, align 4
  store i32 0, i32* %12, align 4
  br label %47

; <label>:47:                                     ; preds = %45, %32
  %48 = load %struct.success*, %struct.success** %6, align 8
  %49 = getelementptr inbounds %struct.success, %struct.success* %48, i32 0, i32 2
  %50 = load %struct.flagent*, %struct.flagent** %49, align 8
  %51 = icmp ne %struct.flagent* %50, null
  br i1 %51, label %52, label %60

; <label>:52:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 17)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 17)
  %54 = load %struct.success*, %struct.success** %6, align 8
  %55 = getelementptr inbounds %struct.success, %struct.success* %54, i32 0, i32 2
  %56 = load %struct.flagent*, %struct.flagent** %55, align 8
  %57 = getelementptr inbounds %struct.flagent, %struct.flagent* %56, i32 0, i32 4
  %58 = load i16, i16* %57, align 4
  %59 = sext i16 %58 to i32
  br label %62

; <label>:60:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 21)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 21)
  br label %62

; <label>:62:                                     ; preds = %60, %52
  %63 = phi i32 [ %59, %52 ], [ 0, %60 ]
  store i32 %63, i32* %14, align 4
  br label %64

; <label>:64:                                     ; preds = %62, %24
  br label %65

; <label>:65:                                     ; preds = %64
  %66 = load %struct.success*, %struct.success** %6, align 8
  %67 = getelementptr inbounds %struct.success, %struct.success* %66, i32 0, i32 0
  %68 = load %struct.dent*, %struct.dent** %67, align 8
  store %struct.dent* %68, %struct.dent** %10, align 8
  br label %69

; <label>:69:                                     ; preds = %274, %65
  %70 = load %struct.dent*, %struct.dent** %10, align 8
  %71 = getelementptr inbounds %struct.dent, %struct.dent* %70, i32 0, i32 2
  %72 = getelementptr inbounds [1 x i64], [1 x i64]* %71, i64 0, i64 0
  %73 = load i64, i64* %72, align 8
  %74 = and i64 %73, 805306368
  store i64 %74, i64* %17, align 8
  %75 = load i64, i64* %17, align 8
  %76 = load i64, i64* %16, align 8
  %77 = icmp ne i64 %75, %76
  br i1 %77, label %78, label %95

; <label>:78:                                     ; preds = %69
  %79 = load i64, i64* %17, align 8
  %80 = icmp eq i64 %79, 0
  br i1 %80, label %81, label %93

; <label>:81:                                     ; preds = %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 7)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 7)
  %83 = load i64, i64* %16, align 8
  %84 = icmp eq i64 %83, 536870912
  br i1 %84, label %85, label %93

; <label>:85:                                     ; preds = %81
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 8)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 8)
  %87 = load %struct.dent*, %struct.dent** %10, align 8
  %88 = load %struct.success*, %struct.success** %6, align 8
  %89 = call i32 @entryhasaffixes(%struct.dent* %87, %struct.success* %88)
  %90 = icmp ne i32 %89, 0
  br i1 %90, label %91, label %93

; <label>:91:                                     ; preds = %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 23)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 23)
  store i32 1, i32* %4, align 4
  br label %280

; <label>:93:                                     ; preds = %85, %81, %78
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 4)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 4)
  br label %266

; <label>:95:                                     ; preds = %69
  %96 = load i64, i64* %16, align 8
  %97 = icmp ne i64 %96, 805306368
  br i1 %97, label %98, label %107

; <label>:98:                                     ; preds = %95
  %99 = load %struct.dent*, %struct.dent** %10, align 8
  %100 = load %struct.success*, %struct.success** %6, align 8
  %101 = call i32 @entryhasaffixes(%struct.dent* %99, %struct.success* %100)
  %102 = icmp ne i32 %101, 0
  br i1 %102, label %103, label %105

; <label>:103:                                    ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 22)
  %104 = add i64 %pgocount8, 1
  store i64 %104, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 22)
  store i32 1, i32* %4, align 4
  br label %280

; <label>:105:                                    ; preds = %98
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 6)
  %106 = add i64 %pgocount9, 1
  store i64 %106, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 6)
  br label %265

; <label>:107:                                    ; preds = %95
  %108 = getelementptr inbounds [120 x i8], [120 x i8]* %11, i32 0, i32 0
  %109 = load %struct.dent*, %struct.dent** %10, align 8
  %110 = getelementptr inbounds %struct.dent, %struct.dent* %109, i32 0, i32 1
  %111 = load i8*, i8** %110, align 8
  %112 = call i32 @strtoichar(i8* %108, i8* %111, i32 100, i32 1)
  %113 = getelementptr inbounds [120 x i8], [120 x i8]* %11, i32 0, i32 0
  store i8* %113, i8** %8, align 8
  %114 = load i8*, i8** %5, align 8
  %115 = load i32, i32* %12, align 4
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i8, i8* %114, i64 %116
  store i8* %117, i8** %15, align 8
  %118 = load i8*, i8** %8, align 8
  %119 = load i32, i32* %13, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i8, i8* %118, i64 %120
  %122 = load i8, i8* %121, align 1
  %123 = zext i8 %122 to i64
  %124 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %123
  %125 = load i8, i8* %124, align 1
  %126 = icmp ne i8 %125, 0
  br i1 %126, label %127, label %148

; <label>:127:                                    ; preds = %107
  %128 = load i8*, i8** %5, align 8
  store i8* %128, i8** %9, align 8
  br label %129

; <label>:129:                                    ; preds = %144, %127
  %130 = load i8*, i8** %9, align 8
  %131 = load i8*, i8** %15, align 8
  %132 = icmp ult i8* %130, %131
  br i1 %132, label %133, label %147

; <label>:133:                                    ; preds = %129
  %134 = load i8*, i8** %9, align 8
  %135 = load i8, i8* %134, align 1
  %136 = zext i8 %135 to i64
  %137 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %142

; <label>:140:                                    ; preds = %133
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 9)
  %141 = add i64 %pgocount10, 1
  store i64 %141, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 9)
  br label %264

; <label>:142:                                    ; preds = %133
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 0)
  %143 = add i64 %pgocount11, 1
  store i64 %143, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 0)
  br label %144

; <label>:144:                                    ; preds = %142
  %145 = load i8*, i8** %9, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %9, align 8
  br label %129

; <label>:147:                                    ; preds = %129
  br label %170

; <label>:148:                                    ; preds = %107
  %149 = load i8*, i8** %5, align 8
  store i8* %149, i8** %9, align 8
  br label %150

; <label>:150:                                    ; preds = %165, %148
  %151 = load i8*, i8** %9, align 8
  %152 = load i8*, i8** %15, align 8
  %153 = icmp ult i8* %151, %152
  br i1 %153, label %154, label %168

; <label>:154:                                    ; preds = %150
  %155 = load i8*, i8** %9, align 8
  %156 = load i8, i8* %155, align 1
  %157 = zext i8 %156 to i64
  %158 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %157
  %159 = load i8, i8* %158, align 1
  %160 = icmp ne i8 %159, 0
  br i1 %160, label %161, label %163

; <label>:161:                                    ; preds = %154
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 12)
  %162 = add i64 %pgocount12, 1
  store i64 %162, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 12)
  br label %264

; <label>:163:                                    ; preds = %154
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 2)
  %164 = add i64 %pgocount13, 1
  store i64 %164, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 2)
  br label %165

; <label>:165:                                    ; preds = %163
  %166 = load i8*, i8** %9, align 8
  %167 = getelementptr inbounds i8, i8* %166, i32 1
  store i8* %167, i8** %9, align 8
  br label %150

; <label>:168:                                    ; preds = %150
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 11)
  %169 = add i64 %pgocount14, 1
  store i64 %169, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 11)
  br label %170

; <label>:170:                                    ; preds = %168, %147
  %171 = load i32, i32* %13, align 4
  %172 = load i8*, i8** %8, align 8
  %173 = sext i32 %171 to i64
  %174 = getelementptr inbounds i8, i8* %172, i64 %173
  store i8* %174, i8** %8, align 8
  %175 = load i8*, i8** %8, align 8
  %176 = load i32, i32* %7, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds i8, i8* %175, i64 %177
  %179 = load i32, i32* %12, align 4
  %180 = sext i32 %179 to i64
  %181 = sub i64 0, %180
  %182 = getelementptr inbounds i8, i8* %178, i64 %181
  %183 = load i32, i32* %14, align 4
  %184 = sext i32 %183 to i64
  %185 = sub i64 0, %184
  %186 = getelementptr inbounds i8, i8* %182, i64 %185
  store i8* %186, i8** %15, align 8
  br label %187

; <label>:187:                                    ; preds = %203, %170
  %188 = load i8*, i8** %8, align 8
  %189 = load i8*, i8** %15, align 8
  %190 = icmp ult i8* %188, %189
  br i1 %190, label %191, label %205

; <label>:191:                                    ; preds = %187
  %192 = load i8*, i8** %8, align 8
  %193 = getelementptr inbounds i8, i8* %192, i32 1
  store i8* %193, i8** %8, align 8
  %194 = load i8, i8* %192, align 1
  %195 = zext i8 %194 to i32
  %196 = load i8*, i8** %9, align 8
  %197 = getelementptr inbounds i8, i8* %196, i32 1
  store i8* %197, i8** %9, align 8
  %198 = load i8, i8* %196, align 1
  %199 = zext i8 %198 to i32
  %200 = icmp ne i32 %195, %199
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %191
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 10)
  %202 = add i64 %pgocount15, 1
  store i64 %202, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 10)
  br label %264

; <label>:203:                                    ; preds = %191
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 1)
  %204 = add i64 %pgocount16, 1
  store i64 %204, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 1)
  br label %187

; <label>:205:                                    ; preds = %187
  %206 = load i8*, i8** %15, align 8
  %207 = getelementptr inbounds i8, i8* %206, i64 -1
  store i8* %207, i8** %8, align 8
  %208 = load i8*, i8** %8, align 8
  %209 = load i8, i8* %208, align 1
  %210 = zext i8 %209 to i64
  %211 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %210
  %212 = load i8, i8* %211, align 1
  %213 = icmp ne i8 %212, 0
  br i1 %213, label %214, label %235

; <label>:214:                                    ; preds = %205
  br label %215

; <label>:215:                                    ; preds = %229, %214
  %216 = load i8*, i8** %9, align 8
  %217 = load i8, i8* %216, align 1
  %218 = icmp ne i8 %217, 0
  br i1 %218, label %219, label %233

; <label>:219:                                    ; preds = %215
  %220 = load i8*, i8** %9, align 8
  %221 = load i8, i8* %220, align 1
  %222 = zext i8 %221 to i64
  %223 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %222
  %224 = load i8, i8* %223, align 1
  %225 = icmp ne i8 %224, 0
  br i1 %225, label %226, label %228

; <label>:226:                                    ; preds = %219
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 16)
  %227 = add i64 %pgocount17, 1
  store i64 %227, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 16)
  br label %264

; <label>:228:                                    ; preds = %219
  br label %229

; <label>:229:                                    ; preds = %228
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 3)
  %230 = add i64 %pgocount18, 1
  store i64 %230, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 3)
  %231 = load i8*, i8** %9, align 8
  %232 = getelementptr inbounds i8, i8* %231, i32 1
  store i8* %232, i8** %9, align 8
  br label %215

; <label>:233:                                    ; preds = %215
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 15)
  %234 = add i64 %pgocount19, 1
  store i64 %234, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 15)
  br label %256

; <label>:235:                                    ; preds = %205
  br label %236

; <label>:236:                                    ; preds = %250, %235
  %237 = load i8*, i8** %9, align 8
  %238 = load i8, i8* %237, align 1
  %239 = icmp ne i8 %238, 0
  br i1 %239, label %240, label %254

; <label>:240:                                    ; preds = %236
  %241 = load i8*, i8** %9, align 8
  %242 = load i8, i8* %241, align 1
  %243 = zext i8 %242 to i64
  %244 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %243
  %245 = load i8, i8* %244, align 1
  %246 = icmp ne i8 %245, 0
  br i1 %246, label %247, label %249

; <label>:247:                                    ; preds = %240
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 19)
  %248 = add i64 %pgocount20, 1
  store i64 %248, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 19)
  br label %264

; <label>:249:                                    ; preds = %240
  br label %250

; <label>:250:                                    ; preds = %249
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 5)
  %251 = add i64 %pgocount21, 1
  store i64 %251, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 5)
  %252 = load i8*, i8** %9, align 8
  %253 = getelementptr inbounds i8, i8* %252, i32 1
  store i8* %253, i8** %9, align 8
  br label %236

; <label>:254:                                    ; preds = %236
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 18)
  %255 = add i64 %pgocount22, 1
  store i64 %255, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 18)
  br label %256

; <label>:256:                                    ; preds = %254, %233
  %257 = load %struct.dent*, %struct.dent** %10, align 8
  %258 = load %struct.success*, %struct.success** %6, align 8
  %259 = call i32 @entryhasaffixes(%struct.dent* %257, %struct.success* %258)
  %260 = icmp ne i32 %259, 0
  br i1 %260, label %261, label %263

; <label>:261:                                    ; preds = %256
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 24)
  %262 = add i64 %pgocount23, 1
  store i64 %262, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 24)
  store i32 1, i32* %4, align 4
  br label %280

; <label>:263:                                    ; preds = %256
  br label %264

; <label>:264:                                    ; preds = %263, %247, %226, %201, %161, %140
  br label %265

; <label>:265:                                    ; preds = %264, %105
  br label %266

; <label>:266:                                    ; preds = %265, %93
  %267 = load %struct.dent*, %struct.dent** %10, align 8
  %268 = getelementptr inbounds %struct.dent, %struct.dent* %267, i32 0, i32 2
  %269 = getelementptr inbounds [1 x i64], [1 x i64]* %268, i64 0, i64 0
  %270 = load i64, i64* %269, align 8
  %271 = and i64 %270, 1073741824
  %272 = icmp eq i64 %271, 0
  br i1 %272, label %273, label %274

; <label>:273:                                    ; preds = %266
  br label %278

; <label>:274:                                    ; preds = %266
  %275 = load %struct.dent*, %struct.dent** %10, align 8
  %276 = getelementptr inbounds %struct.dent, %struct.dent* %275, i32 0, i32 0
  %277 = load %struct.dent*, %struct.dent** %276, align 8
  store %struct.dent* %277, %struct.dent** %10, align 8
  br label %69

; <label>:278:                                    ; preds = %273
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 14)
  %279 = add i64 %pgocount24, 1
  store i64 %279, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_cap_ok, i64 0, i64 14)
  store i32 0, i32* %4, align 4
  br label %280

; <label>:280:                                    ; preds = %278, %261, %103, %91, %22
  %281 = load i32, i32* %4, align 4
  ret i32 %281
}

declare void @chk_aff(i8*, i8*, i32, i32, i32, i32, i32) #1

declare i32 @putchar(i32) #1

declare i64 @whatcap(i8*) #1

; Function Attrs: nounwind uwtable
define internal i32 @entryhasaffixes(%struct.dent*, %struct.success*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.dent*, align 8
  %5 = alloca %struct.success*, align 8
  store %struct.dent* %0, %struct.dent** %4, align 8
  store %struct.success* %1, %struct.success** %5, align 8
  %6 = load %struct.success*, %struct.success** %5, align 8
  %7 = getelementptr inbounds %struct.success, %struct.success* %6, i32 0, i32 1
  %8 = load %struct.flagent*, %struct.flagent** %7, align 8
  %9 = icmp ne %struct.flagent* %8, null
  br i1 %9, label %10, label %28

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 0)
  %12 = load %struct.dent*, %struct.dent** %4, align 8
  %13 = getelementptr inbounds %struct.dent, %struct.dent* %12, i32 0, i32 2
  %14 = getelementptr inbounds [1 x i64], [1 x i64]* %13, i64 0, i64 0
  %15 = load i64, i64* %14, align 8
  %16 = load %struct.success*, %struct.success** %5, align 8
  %17 = getelementptr inbounds %struct.success, %struct.success* %16, i32 0, i32 1
  %18 = load %struct.flagent*, %struct.flagent** %17, align 8
  %19 = getelementptr inbounds %struct.flagent, %struct.flagent* %18, i32 0, i32 2
  %20 = load i16, i16* %19, align 8
  %21 = sext i16 %20 to i32
  %22 = zext i32 %21 to i64
  %23 = shl i64 1, %22
  %24 = and i64 %15, %23
  %25 = icmp ne i64 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 3)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %53

; <label>:28:                                     ; preds = %10, %2
  %29 = load %struct.success*, %struct.success** %5, align 8
  %30 = getelementptr inbounds %struct.success, %struct.success* %29, i32 0, i32 2
  %31 = load %struct.flagent*, %struct.flagent** %30, align 8
  %32 = icmp ne %struct.flagent* %31, null
  br i1 %32, label %33, label %51

; <label>:33:                                     ; preds = %28
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 2)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 2)
  %35 = load %struct.dent*, %struct.dent** %4, align 8
  %36 = getelementptr inbounds %struct.dent, %struct.dent* %35, i32 0, i32 2
  %37 = getelementptr inbounds [1 x i64], [1 x i64]* %36, i64 0, i64 0
  %38 = load i64, i64* %37, align 8
  %39 = load %struct.success*, %struct.success** %5, align 8
  %40 = getelementptr inbounds %struct.success, %struct.success* %39, i32 0, i32 2
  %41 = load %struct.flagent*, %struct.flagent** %40, align 8
  %42 = getelementptr inbounds %struct.flagent, %struct.flagent* %41, i32 0, i32 2
  %43 = load i16, i16* %42, align 8
  %44 = sext i16 %43 to i32
  %45 = zext i32 %44 to i64
  %46 = shl i64 1, %45
  %47 = and i64 %38, %46
  %48 = icmp ne i64 %47, 0
  br i1 %48, label %51, label %49

; <label>:49:                                     ; preds = %33
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 4)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %53

; <label>:51:                                     ; preds = %33, %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 1)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_entryhasaffixes, i64 0, i64 1)
  store i32 1, i32* %3, align 4
  br label %53

; <label>:53:                                     ; preds = %51, %49, %26
  %54 = load i32, i32* %3, align 4
  ret i32 %54
}

declare i32 @strtoichar(i8*, i8*, i32, i32) #1

; Function Attrs: nounwind uwtable
define void @flagpr(i8*, i32, i32, i32, i32, i32) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  store i8* %0, i8** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %15 = load i8*, i8** @orig_word, align 8
  %16 = call i64 @strlen(i8* %15) #4
  %17 = trunc i64 %16 to i32
  store i32 %17, i32* %14, align 4
  %18 = load i32, i32* %8, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %82

; <label>:20:                                     ; preds = %6
  %21 = load i8*, i8** @orig_word, align 8
  %22 = load i32, i32* %10, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds i8, i8* %21, i64 %23
  store i8* %24, i8** %13, align 8
  %25 = load i8*, i8** %13, align 8
  %26 = load i8, i8* %25, align 1
  %27 = zext i8 %26 to i64
  %28 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %27
  %29 = load i8, i8* %28, align 1
  %30 = icmp ne i8 %29, 0
  br i1 %30, label %31, label %56

; <label>:31:                                     ; preds = %20
  %32 = load i8*, i8** @orig_word, align 8
  store i8* %32, i8** %13, align 8
  br label %33

; <label>:33:                                     ; preds = %50, %31
  %34 = load i8*, i8** %13, align 8
  %35 = load i8*, i8** @orig_word, align 8
  %36 = load i32, i32* %10, align 4
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %35, i64 %37
  %39 = icmp ult i8* %34, %38
  br i1 %39, label %40, label %54

; <label>:40:                                     ; preds = %33
  %41 = load i8*, i8** %13, align 8
  %42 = load i8, i8* %41, align 1
  %43 = zext i8 %42 to i64
  %44 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %49

; <label>:47:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 12)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 12)
  br label %279

; <label>:49:                                     ; preds = %40
  br label %50

; <label>:50:                                     ; preds = %49
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 2)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 2)
  %52 = load i8*, i8** %13, align 8
  %53 = getelementptr inbounds i8, i8* %52, i32 1
  store i8* %53, i8** %13, align 8
  br label %33

; <label>:54:                                     ; preds = %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 13)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 13)
  br label %81

; <label>:56:                                     ; preds = %20
  %57 = load i8*, i8** @orig_word, align 8
  store i8* %57, i8** %13, align 8
  br label %58

; <label>:58:                                     ; preds = %76, %56
  %59 = load i8*, i8** %13, align 8
  %60 = load i8*, i8** @orig_word, align 8
  %61 = load i32, i32* %10, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  %64 = icmp ult i8* %59, %63
  br i1 %64, label %65, label %79

; <label>:65:                                     ; preds = %58
  %66 = load i8*, i8** %13, align 8
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = icmp ne i8 %70, 0
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %65
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 18)
  %73 = add i64 %pgocount3, 1
  store i64 %73, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 18)
  br label %279

; <label>:74:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 6)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 6)
  br label %76

; <label>:76:                                     ; preds = %74
  %77 = load i8*, i8** %13, align 8
  %78 = getelementptr inbounds i8, i8* %77, i32 1
  store i8* %78, i8** %13, align 8
  br label %58

; <label>:79:                                     ; preds = %58
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 19)
  %80 = add i64 %pgocount5, 1
  store i64 %80, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 19)
  br label %81

; <label>:81:                                     ; preds = %79, %54
  br label %82

; <label>:82:                                     ; preds = %81, %6
  %83 = load i32, i32* %11, align 4
  %84 = icmp sgt i32 %83, 0
  br i1 %84, label %85, label %154

; <label>:85:                                     ; preds = %82
  %86 = load i8*, i8** @orig_word, align 8
  %87 = load i32, i32* %14, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds i8, i8* %86, i64 %88
  %90 = load i32, i32* %12, align 4
  %91 = sext i32 %90 to i64
  %92 = sub i64 0, %91
  %93 = getelementptr inbounds i8, i8* %89, i64 %92
  store i8* %93, i8** %13, align 8
  %94 = load i8*, i8** %13, align 8
  %95 = getelementptr inbounds i8, i8* %94, i64 -1
  %96 = load i8, i8* %95, align 1
  %97 = zext i8 %96 to i64
  %98 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %97
  %99 = load i8, i8* %98, align 1
  %100 = icmp ne i8 %99, 0
  br i1 %100, label %101, label %123

; <label>:101:                                    ; preds = %85
  br label %102

; <label>:102:                                    ; preds = %118, %101
  %103 = load i8*, i8** %13, align 8
  %104 = load i8, i8* %103, align 1
  %105 = zext i8 %104 to i32
  %106 = icmp ne i32 %105, 0
  br i1 %106, label %107, label %121

; <label>:107:                                    ; preds = %102
  %108 = load i8*, i8** %13, align 8
  %109 = load i8, i8* %108, align 1
  %110 = zext i8 %109 to i64
  %111 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 25), i64 0, i64 %110
  %112 = load i8, i8* %111, align 1
  %113 = icmp ne i8 %112, 0
  br i1 %113, label %114, label %116

; <label>:114:                                    ; preds = %107
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 16)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 16)
  br label %279

; <label>:116:                                    ; preds = %107
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 5)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 5)
  br label %118

; <label>:118:                                    ; preds = %116
  %119 = load i8*, i8** %13, align 8
  %120 = getelementptr inbounds i8, i8* %119, i32 1
  store i8* %120, i8** %13, align 8
  br label %102

; <label>:121:                                    ; preds = %102
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 17)
  %122 = add i64 %pgocount8, 1
  store i64 %122, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 17)
  br label %153

; <label>:123:                                    ; preds = %85
  %124 = load i8*, i8** @orig_word, align 8
  %125 = load i32, i32* %14, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds i8, i8* %124, i64 %126
  %128 = load i32, i32* %12, align 4
  %129 = sext i32 %128 to i64
  %130 = sub i64 0, %129
  %131 = getelementptr inbounds i8, i8* %127, i64 %130
  store i8* %131, i8** %13, align 8
  br label %132

; <label>:132:                                    ; preds = %147, %123
  %133 = load i8*, i8** %13, align 8
  %134 = load i8, i8* %133, align 1
  %135 = zext i8 %134 to i32
  %136 = icmp ne i32 %135, 0
  br i1 %136, label %137, label %151

; <label>:137:                                    ; preds = %132
  %138 = load i8*, i8** %13, align 8
  %139 = load i8, i8* %138, align 1
  %140 = zext i8 %139 to i64
  %141 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %140
  %142 = load i8, i8* %141, align 1
  %143 = icmp ne i8 %142, 0
  br i1 %143, label %144, label %146

; <label>:144:                                    ; preds = %137
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 21)
  %145 = add i64 %pgocount9, 1
  store i64 %145, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 21)
  br label %279

; <label>:146:                                    ; preds = %137
  br label %147

; <label>:147:                                    ; preds = %146
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 7)
  %148 = add i64 %pgocount10, 1
  store i64 %148, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 7)
  %149 = load i8*, i8** %13, align 8
  %150 = getelementptr inbounds i8, i8* %149, i32 1
  store i8* %150, i8** %13, align 8
  br label %132

; <label>:151:                                    ; preds = %132
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 20)
  %152 = add i64 %pgocount11, 1
  store i64 %152, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 20)
  br label %153

; <label>:153:                                    ; preds = %151, %121
  br label %154

; <label>:154:                                    ; preds = %153, %82
  %155 = call i32 @putchar(i32 32)
  %156 = load i8*, i8** @orig_word, align 8
  %157 = load i32, i32* %10, align 4
  %158 = sext i32 %157 to i64
  %159 = getelementptr inbounds i8, i8* %156, i64 %158
  store i8* %159, i8** %13, align 8
  %160 = load i8*, i8** %13, align 8
  %161 = load i8, i8* %160, align 1
  %162 = zext i8 %161 to i64
  %163 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %162
  %164 = load i8, i8* %163, align 1
  %165 = icmp ne i8 %164, 0
  br i1 %165, label %166, label %181

; <label>:166:                                    ; preds = %154
  br label %167

; <label>:167:                                    ; preds = %171, %166
  %168 = load i32, i32* %9, align 4
  %169 = add nsw i32 %168, -1
  store i32 %169, i32* %9, align 4
  %170 = icmp sge i32 %169, 0
  br i1 %170, label %171, label %180

; <label>:171:                                    ; preds = %167
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 1)
  %172 = add i64 %pgocount12, 1
  store i64 %172, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 1)
  %173 = load i8*, i8** %7, align 8
  %174 = getelementptr inbounds i8, i8* %173, i32 1
  store i8* %174, i8** %7, align 8
  %175 = load i8, i8* %173, align 1
  %176 = zext i8 %175 to i32
  %177 = call i8* @printichar(i32 %176)
  %178 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %179 = call i32 @fputs(i8* %177, %struct._IO_FILE* %178)
  br label %167

; <label>:180:                                    ; preds = %167
  br label %200

; <label>:181:                                    ; preds = %154
  br label %182

; <label>:182:                                    ; preds = %186, %181
  %183 = load i32, i32* %9, align 4
  %184 = add nsw i32 %183, -1
  store i32 %184, i32* %9, align 4
  %185 = icmp sge i32 %184, 0
  br i1 %185, label %186, label %198

; <label>:186:                                    ; preds = %182
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 3)
  %187 = add i64 %pgocount13, 1
  store i64 %187, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 3)
  %188 = load i8*, i8** %7, align 8
  %189 = getelementptr inbounds i8, i8* %188, i32 1
  store i8* %189, i8** %7, align 8
  %190 = load i8, i8* %188, align 1
  %191 = zext i8 %190 to i64
  %192 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %191
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i32
  %195 = call i8* @printichar(i32 %194)
  %196 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %197 = call i32 @fputs(i8* %195, %struct._IO_FILE* %196)
  br label %182

; <label>:198:                                    ; preds = %182
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 14)
  %199 = add i64 %pgocount14, 1
  store i64 %199, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 14)
  br label %200

; <label>:200:                                    ; preds = %198, %180
  %201 = load i32, i32* %14, align 4
  %202 = load i32, i32* %10, align 4
  %203 = sub nsw i32 %201, %202
  %204 = load i32, i32* %12, align 4
  %205 = sub nsw i32 %203, %204
  store i32 %205, i32* %9, align 4
  br label %206

; <label>:206:                                    ; preds = %219, %200
  %207 = load i32, i32* %9, align 4
  %208 = add nsw i32 %207, -1
  store i32 %208, i32* %9, align 4
  %209 = icmp sge i32 %208, 0
  br i1 %209, label %210, label %222

; <label>:210:                                    ; preds = %206
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 0)
  %211 = add i64 %pgocount15, 1
  store i64 %211, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 0)
  %212 = load i8*, i8** %13, align 8
  %213 = getelementptr inbounds i8, i8* %212, i32 1
  store i8* %213, i8** %13, align 8
  %214 = load i8, i8* %212, align 1
  %215 = zext i8 %214 to i32
  %216 = call i8* @printichar(i32 %215)
  %217 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %218 = call i32 @fputs(i8* %216, %struct._IO_FILE* %217)
  br label %219

; <label>:219:                                    ; preds = %210
  %220 = load i8*, i8** %7, align 8
  %221 = getelementptr inbounds i8, i8* %220, i32 1
  store i8* %221, i8** %7, align 8
  br label %206

; <label>:222:                                    ; preds = %206
  %223 = load i8*, i8** %13, align 8
  %224 = load i8*, i8** @orig_word, align 8
  %225 = icmp ugt i8* %223, %224
  br i1 %225, label %226, label %230

; <label>:226:                                    ; preds = %222
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 11)
  %227 = add i64 %pgocount16, 1
  store i64 %227, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 11)
  %228 = load i8*, i8** %13, align 8
  %229 = getelementptr inbounds i8, i8* %228, i32 -1
  store i8* %229, i8** %13, align 8
  br label %230

; <label>:230:                                    ; preds = %226, %222
  %231 = load i8*, i8** %13, align 8
  %232 = load i8, i8* %231, align 1
  %233 = zext i8 %232 to i64
  %234 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %233
  %235 = load i8, i8* %234, align 1
  %236 = icmp ne i8 %235, 0
  br i1 %236, label %237, label %243

; <label>:237:                                    ; preds = %230
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 8)
  %238 = add i64 %pgocount17, 1
  store i64 %238, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 8)
  %239 = load i8*, i8** %7, align 8
  %240 = call i8* @ichartosstr(i8* %239, i32 0)
  %241 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %242 = call i32 @fputs(i8* %240, %struct._IO_FILE* %241)
  br label %262

; <label>:243:                                    ; preds = %230
  br label %244

; <label>:244:                                    ; preds = %248, %243
  %245 = load i8*, i8** %7, align 8
  %246 = load i8, i8* %245, align 1
  %247 = icmp ne i8 %246, 0
  br i1 %247, label %248, label %260

; <label>:248:                                    ; preds = %244
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 4)
  %249 = add i64 %pgocount18, 1
  store i64 %249, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 4)
  %250 = load i8*, i8** %7, align 8
  %251 = getelementptr inbounds i8, i8* %250, i32 1
  store i8* %251, i8** %7, align 8
  %252 = load i8, i8* %250, align 1
  %253 = zext i8 %252 to i64
  %254 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %253
  %255 = load i8, i8* %254, align 1
  %256 = zext i8 %255 to i32
  %257 = call i8* @printichar(i32 %256)
  %258 = load %struct._IO_FILE*, %struct._IO_FILE** @outfile1, align 8
  %259 = call i32 @fputs(i8* %257, %struct._IO_FILE* %258)
  br label %244

; <label>:260:                                    ; preds = %244
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 15)
  %261 = add i64 %pgocount19, 1
  store i64 %261, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 15)
  br label %262

; <label>:262:                                    ; preds = %260, %237
  %263 = load i8, i8* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 19), align 4
  %264 = sext i8 %263 to i32
  %265 = call i32 @putchar(i32 %264)
  %266 = load i32, i32* %8, align 4
  %267 = icmp sgt i32 %266, 0
  br i1 %267, label %268, label %272

; <label>:268:                                    ; preds = %262
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 9)
  %269 = add i64 %pgocount20, 1
  store i64 %269, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 9)
  %270 = load i32, i32* %8, align 4
  %271 = call i32 @putchar(i32 %270)
  br label %272

; <label>:272:                                    ; preds = %268, %262
  %273 = load i32, i32* %11, align 4
  %274 = icmp sgt i32 %273, 0
  br i1 %274, label %275, label %279

; <label>:275:                                    ; preds = %272
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 10)
  %276 = add i64 %pgocount21, 1
  store i64 %276, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_flagpr, i64 0, i64 10)
  %277 = load i32, i32* %11, align 4
  %278 = call i32 @putchar(i32 %277)
  br label %279

; <label>:279:                                    ; preds = %275, %272, %144, %114, %72, %47
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

declare i32 @fputs(i8*, %struct._IO_FILE*) #1

declare i8* @printichar(i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

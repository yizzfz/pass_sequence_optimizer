; ModuleID = 'tmp1.ll'
source_filename = "tgood.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.flagptr = type { %union.ptr_union, i32 }
%union.ptr_union = type { %struct.flagptr* }
%struct.flagent = type { i8*, i8*, i16, i16, i16, i16, i16, [228 x i8] }
%struct.success = type { %struct.dent*, %struct.flagent*, %struct.flagent* }
%struct.dent = type { %struct.dent*, i8*, [1 x i64] }
%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }

$__llvm_profile_raw_version = comdat any

@pflagindex = external global [228 x %struct.flagptr], align 16
@numhits = external global i32, align 4
@cflag = external global i32, align 4
@pflaglist = external global %struct.flagent*, align 8
@numpflags = external global i32, align 4
@sflaglist = external global %struct.flagent*, align 8
@numsflags = external global i32, align 4
@compoundflag = external global i32, align 4
@hits = external global [10 x %struct.success], align 16
@sflagindex = external global [228 x %struct.flagptr], align 16
@hashheader = external global %struct.hashheader, align 4
@.str = private unnamed_addr constant [4 x i8] c"\0A%s\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c" %s%s\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_chk_aff = private constant [7 x i8] c"chk_aff"
@__profn_tmp1.ll_pfx_list_chk = private constant [20 x i8] c"tmp1.ll:pfx_list_chk"
@__profn_tmp1.ll_chk_suf = private constant [15 x i8] c"tmp1.ll:chk_suf"
@__profn_expand_pre = private constant [10 x i8] c"expand_pre"
@__profn_tmp1.ll_pr_pre_expansion = private constant [24 x i8] c"tmp1.ll:pr_pre_expansion"
@__profn_expand_suf = private constant [10 x i8] c"expand_suf"
@__profn_tmp1.ll_pr_suf_expansion = private constant [24 x i8] c"tmp1.ll:pr_suf_expansion"
@__profn_tmp1.ll_suf_list_chk = private constant [20 x i8] c"tmp1.ll:suf_list_chk"
@__profn_tmp1.ll_forcelc = private constant [15 x i8] c"tmp1.ll:forcelc"
@__profc_chk_aff = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_chk_aff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4185685353276197128, i64 150170326183, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i32 0, i32 0), i8* bitcast (void (i8*, i8*, i32, i32, i32, i32, i32)* @chk_aff to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pfx_list_chk = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pfx_list_chk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7851164693269108926, i64 320364711704, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_chk_suf = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_chk_suf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4012098604065331713, i64 107452652587, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_expand_pre = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_expand_pre = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4812859139586808308, i64 45130900406, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i64*, i32, i8*)* @expand_pre to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pr_pre_expansion = private global [18 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pr_pre_expansion = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8471609065006647637, i64 267310079512, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i32 0, i32 0), i8* null, i8* null, i32 18, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_expand_suf = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_expand_suf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8317027047756954182, i64 67866699102, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i32 0, i32 0), i8* bitcast (i32 (i8*, i8*, i64*, i32, i32, i8*)* @expand_suf to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_pr_suf_expansion = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_pr_suf_expansion = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1436822625109938023, i64 125494711358, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_suf_list_chk = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_suf_list_chk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1094638824400609392, i64 422518972305, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i32 0, i32 0), i8* null, i8* null, i32 34, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_forcelc = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_forcelc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7985831616432979388, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_forcelc, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [92 x i8] c"\99\01Yx\DAK\CE\C8\8EOLKc,\C9-0\D4\CB\C9\B1*H\AB\88\CF\C9,.\89O\CE\C8\86\0B\02\D9\F1\C5\A5i\8C\A9\15\05\89y)\F1\05E\A9\08\F5E n<X\A683?\0F\A6\06\A4\1CI\0D\90\8B\A4\06&\01\12\C5\B0,-\BF(95'\19\00\05\E78\E6", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_chk_aff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pfx_list_chk to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_chk_suf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_expand_pre to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pr_pre_expansion to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_expand_suf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_pr_suf_expansion to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_suf_list_chk to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_forcelc to i8*), i8* getelementptr inbounds ([92 x i8], [92 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @chk_aff(i8*, i8*, i32, i32, i32, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca %struct.flagptr*, align 8
  store i8* %0, i8** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %17 = load i8*, i8** %8, align 8
  %18 = load i8*, i8** %9, align 8
  %19 = load i32, i32* %10, align 4
  %20 = load i32, i32* %13, align 4
  %21 = load i32, i32* %14, align 4
  %22 = load i32, i32* %11, align 4
  %23 = load i32, i32* %12, align 4
  call void @pfx_list_chk(i8* %17, i8* %18, i32 %19, i32 %20, i32 %21, %struct.flagptr* getelementptr inbounds ([228 x %struct.flagptr], [228 x %struct.flagptr]* @pflagindex, i64 0, i64 0), i32 %22, i32 %23)
  %24 = load i8*, i8** %9, align 8
  store i8* %24, i8** %15, align 8
  %25 = load i8*, i8** %15, align 8
  %26 = getelementptr inbounds i8, i8* %25, i32 1
  store i8* %26, i8** %15, align 8
  %27 = load i8, i8* %25, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds [228 x %struct.flagptr], [228 x %struct.flagptr]* @pflagindex, i64 0, i64 %28
  store %struct.flagptr* %29, %struct.flagptr** %16, align 8
  br label %30

; <label>:30:                                     ; preds = %91, %7
  %31 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %32 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %31, i32 0, i32 1
  %33 = load i32, i32* %32, align 8
  %34 = icmp eq i32 %33, 0
  br i1 %34, label %35, label %42

; <label>:35:                                     ; preds = %30
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 2)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 2)
  %37 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %38 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %37, i32 0, i32 0
  %39 = bitcast %union.ptr_union* %38 to %struct.flagptr**
  %40 = load %struct.flagptr*, %struct.flagptr** %39, align 8
  %41 = icmp ne %struct.flagptr* %40, null
  br label %42

; <label>:42:                                     ; preds = %35, %30
  %43 = phi i1 [ false, %30 ], [ %41, %35 ]
  br i1 %43, label %44, label %102

; <label>:44:                                     ; preds = %42
  %45 = load i8*, i8** %15, align 8
  %46 = load i8, i8* %45, align 1
  %47 = zext i8 %46 to i32
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 6)
  %50 = add i64 %pgocount1, 1
  store i64 %50, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 6)
  br label %135

; <label>:51:                                     ; preds = %44
  %52 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %53 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %52, i32 0, i32 0
  %54 = bitcast %union.ptr_union* %53 to %struct.flagptr**
  %55 = load %struct.flagptr*, %struct.flagptr** %54, align 8
  %56 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %55, i64 0
  %57 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %56, i32 0, i32 1
  %58 = load i32, i32* %57, align 8
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %91

; <label>:60:                                     ; preds = %51
  %61 = load i8*, i8** %8, align 8
  %62 = load i8*, i8** %9, align 8
  %63 = load i32, i32* %10, align 4
  %64 = load i32, i32* %13, align 4
  %65 = load i32, i32* %14, align 4
  %66 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %67 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %66, i32 0, i32 0
  %68 = bitcast %union.ptr_union* %67 to %struct.flagptr**
  %69 = load %struct.flagptr*, %struct.flagptr** %68, align 8
  %70 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %69, i64 0
  %71 = load i32, i32* %11, align 4
  %72 = load i32, i32* %12, align 4
  call void @pfx_list_chk(i8* %61, i8* %62, i32 %63, i32 %64, i32 %65, %struct.flagptr* %70, i32 %71, i32 %72)
  %73 = load i32, i32* @numhits, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %89

; <label>:75:                                     ; preds = %60
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 3)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 3)
  %77 = load i32, i32* %12, align 4
  %78 = icmp ne i32 %77, 0
  br i1 %78, label %89, label %79

; <label>:79:                                     ; preds = %75
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 4)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 4)
  %81 = load i32, i32* @cflag, align 4
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %89, label %83

; <label>:83:                                     ; preds = %79
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 5)
  %84 = add i64 %pgocount4, 1
  store i64 %84, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 5)
  %85 = load i32, i32* %11, align 4
  %86 = icmp ne i32 %85, 0
  br i1 %86, label %89, label %87

; <label>:87:                                     ; preds = %83
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 11)
  %88 = add i64 %pgocount5, 1
  store i64 %88, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 11)
  br label %135

; <label>:89:                                     ; preds = %83, %79, %75, %60
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 1)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 1)
  br label %91

; <label>:91:                                     ; preds = %89, %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 0)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 0)
  %93 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %94 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %93, i32 0, i32 0
  %95 = bitcast %union.ptr_union* %94 to %struct.flagptr**
  %96 = load %struct.flagptr*, %struct.flagptr** %95, align 8
  %97 = load i8*, i8** %15, align 8
  %98 = getelementptr inbounds i8, i8* %97, i32 1
  store i8* %98, i8** %15, align 8
  %99 = load i8, i8* %97, align 1
  %100 = zext i8 %99 to i64
  %101 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %96, i64 %100
  store %struct.flagptr* %101, %struct.flagptr** %16, align 8
  br label %30

; <label>:102:                                    ; preds = %42
  %103 = load i8*, i8** %8, align 8
  %104 = load i8*, i8** %9, align 8
  %105 = load i32, i32* %10, align 4
  %106 = load i32, i32* %13, align 4
  %107 = load i32, i32* %14, align 4
  %108 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %109 = load i32, i32* %11, align 4
  %110 = load i32, i32* %12, align 4
  call void @pfx_list_chk(i8* %103, i8* %104, i32 %105, i32 %106, i32 %107, %struct.flagptr* %108, i32 %109, i32 %110)
  %111 = load i32, i32* @numhits, align 4
  %112 = icmp ne i32 %111, 0
  br i1 %112, label %113, label %127

; <label>:113:                                    ; preds = %102
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 8)
  %114 = add i64 %pgocount8, 1
  store i64 %114, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 8)
  %115 = load i32, i32* %12, align 4
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %127, label %117

; <label>:117:                                    ; preds = %113
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 9)
  %118 = add i64 %pgocount9, 1
  store i64 %118, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 9)
  %119 = load i32, i32* @cflag, align 4
  %120 = icmp ne i32 %119, 0
  br i1 %120, label %127, label %121

; <label>:121:                                    ; preds = %117
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 10)
  %122 = add i64 %pgocount10, 1
  store i64 %122, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 10)
  %123 = load i32, i32* %11, align 4
  %124 = icmp ne i32 %123, 0
  br i1 %124, label %127, label %125

; <label>:125:                                    ; preds = %121
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 12)
  %126 = add i64 %pgocount11, 1
  store i64 %126, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 12)
  br label %135

; <label>:127:                                    ; preds = %121, %117, %113, %102
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 7)
  %128 = add i64 %pgocount12, 1
  store i64 %128, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_chk_aff, i64 0, i64 7)
  %129 = load i8*, i8** %8, align 8
  %130 = load i8*, i8** %9, align 8
  %131 = load i32, i32* %10, align 4
  %132 = load i32, i32* %14, align 4
  %133 = load i32, i32* %11, align 4
  %134 = load i32, i32* %12, align 4
  call void @chk_suf(i8* %129, i8* %130, i32 %131, i32 %132, %struct.flagent* null, i32 %133, i32 %134)
  br label %135

; <label>:135:                                    ; preds = %127, %125, %87, %49
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @pfx_list_chk(i8*, i8*, i32, i32, i32, %struct.flagptr*, i32, i32) #0 {
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca %struct.flagptr*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i8*, align 8
  %19 = alloca %struct.dent*, align 8
  %20 = alloca i32, align 4
  %21 = alloca %struct.flagent*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca [184 x i8], align 16
  %25 = alloca [184 x i8], align 16
  store i8* %0, i8** %9, align 8
  store i8* %1, i8** %10, align 8
  store i32 %2, i32* %11, align 4
  store i32 %3, i32* %12, align 4
  store i32 %4, i32* %13, align 4
  store %struct.flagptr* %5, %struct.flagptr** %14, align 8
  store i32 %6, i32* %15, align 4
  store i32 %7, i32* %16, align 4
  %26 = load %struct.flagptr*, %struct.flagptr** %14, align 8
  %27 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %26, i32 0, i32 0
  %28 = bitcast %union.ptr_union* %27 to %struct.flagent**
  %29 = load %struct.flagent*, %struct.flagent** %28, align 8
  store %struct.flagent* %29, %struct.flagent** %21, align 8
  %30 = load %struct.flagptr*, %struct.flagptr** %14, align 8
  %31 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %30, i32 0, i32 1
  %32 = load i32, i32* %31, align 8
  store i32 %32, i32* %20, align 4
  br label %33

; <label>:33:                                     ; preds = %355, %8
  %34 = load i32, i32* %20, align 4
  %35 = icmp sgt i32 %34, 0
  br i1 %35, label %36, label %360

; <label>:36:                                     ; preds = %33
  %37 = load %struct.flagent*, %struct.flagent** %21, align 8
  %38 = getelementptr inbounds %struct.flagent, %struct.flagent* %37, i32 0, i32 6
  %39 = load i16, i16* %38, align 8
  %40 = sext i16 %39 to i32
  %41 = and i32 %40, 2
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %50

; <label>:43:                                     ; preds = %36
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 3)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 3)
  %45 = load i32, i32* %12, align 4
  %46 = and i32 %45, 2
  %47 = icmp eq i32 %46, 0
  br i1 %47, label %48, label %50

; <label>:48:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 6)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 6)
  br label %355

; <label>:50:                                     ; preds = %43, %36
  %51 = load i32, i32* @compoundflag, align 4
  %52 = icmp eq i32 %51, 2
  br i1 %52, label %53, label %65

; <label>:53:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 4)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 4)
  %55 = load %struct.flagent*, %struct.flagent** %21, align 8
  %56 = getelementptr inbounds %struct.flagent, %struct.flagent* %55, i32 0, i32 6
  %57 = load i16, i16* %56, align 8
  %58 = sext i16 %57 to i32
  %59 = load i32, i32* %12, align 4
  %60 = xor i32 %58, %59
  %61 = and i32 %60, 2
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %63, label %65

; <label>:63:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 8)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 8)
  br label %355

; <label>:65:                                     ; preds = %53, %50
  %66 = load i32, i32* %11, align 4
  %67 = load %struct.flagent*, %struct.flagent** %21, align 8
  %68 = getelementptr inbounds %struct.flagent, %struct.flagent* %67, i32 0, i32 4
  %69 = load i16, i16* %68, align 4
  %70 = sext i16 %69 to i32
  %71 = sub nsw i32 %66, %70
  store i32 %71, i32* %23, align 4
  %72 = load i32, i32* %23, align 4
  %73 = icmp sgt i32 %72, 0
  br i1 %73, label %74, label %353

; <label>:74:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 5)
  %75 = add i64 %pgocount4, 1
  store i64 %75, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 5)
  %76 = load %struct.flagent*, %struct.flagent** %21, align 8
  %77 = getelementptr inbounds %struct.flagent, %struct.flagent* %76, i32 0, i32 4
  %78 = load i16, i16* %77, align 4
  %79 = sext i16 %78 to i32
  %80 = icmp eq i32 %79, 0
  br i1 %80, label %94, label %81

; <label>:81:                                     ; preds = %74
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 7)
  %82 = add i64 %pgocount5, 1
  store i64 %82, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 7)
  %83 = load %struct.flagent*, %struct.flagent** %21, align 8
  %84 = getelementptr inbounds %struct.flagent, %struct.flagent* %83, i32 0, i32 1
  %85 = load i8*, i8** %84, align 8
  %86 = load i8*, i8** %10, align 8
  %87 = load %struct.flagent*, %struct.flagent** %21, align 8
  %88 = getelementptr inbounds %struct.flagent, %struct.flagent* %87, i32 0, i32 4
  %89 = load i16, i16* %88, align 4
  %90 = sext i16 %89 to i64
  %91 = call i32 @strncmp(i8* %85, i8* %86, i64 %90) #5
  %92 = icmp eq i32 %91, 0
  br i1 %92, label %._crit_edge, label %353

._crit_edge:                                      ; preds = %81
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 0)
  %93 = add i64 %pgocount6, 1
  store i64 %93, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 0)
  br label %94

; <label>:94:                                     ; preds = %._crit_edge, %74
  %95 = load i32, i32* %23, align 4
  %96 = load %struct.flagent*, %struct.flagent** %21, align 8
  %97 = getelementptr inbounds %struct.flagent, %struct.flagent* %96, i32 0, i32 3
  %98 = load i16, i16* %97, align 2
  %99 = sext i16 %98 to i32
  %100 = add nsw i32 %95, %99
  %101 = load %struct.flagent*, %struct.flagent** %21, align 8
  %102 = getelementptr inbounds %struct.flagent, %struct.flagent* %101, i32 0, i32 5
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = icmp sge i32 %100, %104
  br i1 %105, label %106, label %353

; <label>:106:                                    ; preds = %94
  %107 = load %struct.flagent*, %struct.flagent** %21, align 8
  %108 = getelementptr inbounds %struct.flagent, %struct.flagent* %107, i32 0, i32 3
  %109 = load i16, i16* %108, align 2
  %110 = icmp ne i16 %109, 0
  br i1 %110, label %111, label %118

; <label>:111:                                    ; preds = %106
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 10)
  %112 = add i64 %pgocount7, 1
  store i64 %112, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 10)
  %113 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %114 = load %struct.flagent*, %struct.flagent** %21, align 8
  %115 = getelementptr inbounds %struct.flagent, %struct.flagent* %114, i32 0, i32 0
  %116 = load i8*, i8** %115, align 8
  %117 = call i8* @strcpy(i8* %113, i8* %116) #4
  br label %118

; <label>:118:                                    ; preds = %111, %106
  %119 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %120 = load %struct.flagent*, %struct.flagent** %21, align 8
  %121 = getelementptr inbounds %struct.flagent, %struct.flagent* %120, i32 0, i32 3
  %122 = load i16, i16* %121, align 2
  %123 = sext i16 %122 to i32
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i8, i8* %119, i64 %124
  %126 = load i8*, i8** %10, align 8
  %127 = load %struct.flagent*, %struct.flagent** %21, align 8
  %128 = getelementptr inbounds %struct.flagent, %struct.flagent* %127, i32 0, i32 4
  %129 = load i16, i16* %128, align 4
  %130 = sext i16 %129 to i32
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i8, i8* %126, i64 %131
  %133 = call i8* @strcpy(i8* %125, i8* %132) #4
  %134 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  store i8* %134, i8** %18, align 8
  store i32 0, i32* %17, align 4
  br label %135

; <label>:135:                                    ; preds = %160, %118
  %136 = load i32, i32* %17, align 4
  %137 = load %struct.flagent*, %struct.flagent** %21, align 8
  %138 = getelementptr inbounds %struct.flagent, %struct.flagent* %137, i32 0, i32 5
  %139 = load i16, i16* %138, align 2
  %140 = sext i16 %139 to i32
  %141 = icmp slt i32 %136, %140
  br i1 %141, label %142, label %163

; <label>:142:                                    ; preds = %135
  %143 = load %struct.flagent*, %struct.flagent** %21, align 8
  %144 = getelementptr inbounds %struct.flagent, %struct.flagent* %143, i32 0, i32 7
  %145 = load i8*, i8** %18, align 8
  %146 = getelementptr inbounds i8, i8* %145, i32 1
  store i8* %146, i8** %18, align 8
  %147 = load i8, i8* %145, align 1
  %148 = zext i8 %147 to i64
  %149 = getelementptr inbounds [228 x i8], [228 x i8]* %144, i64 0, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = sext i8 %150 to i32
  %152 = load i32, i32* %17, align 4
  %153 = shl i32 1, %152
  %154 = and i32 %151, %153
  %155 = icmp eq i32 %154, 0
  br i1 %155, label %156, label %158

; <label>:156:                                    ; preds = %142
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 11)
  %157 = add i64 %pgocount8, 1
  store i64 %157, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 11)
  br label %163

; <label>:158:                                    ; preds = %142
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 1)
  %159 = add i64 %pgocount9, 1
  store i64 %159, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 1)
  br label %160

; <label>:160:                                    ; preds = %158
  %161 = load i32, i32* %17, align 4
  %162 = add nsw i32 %161, 1
  store i32 %162, i32* %17, align 4
  br label %135

; <label>:163:                                    ; preds = %156, %135
  %164 = load i32, i32* %17, align 4
  %165 = load %struct.flagent*, %struct.flagent** %21, align 8
  %166 = getelementptr inbounds %struct.flagent, %struct.flagent* %165, i32 0, i32 5
  %167 = load i16, i16* %166, align 2
  %168 = sext i16 %167 to i32
  %169 = icmp sge i32 %164, %168
  br i1 %169, label %170, label %351

; <label>:170:                                    ; preds = %163
  %171 = load %struct.flagent*, %struct.flagent** %21, align 8
  %172 = getelementptr inbounds %struct.flagent, %struct.flagent* %171, i32 0, i32 3
  %173 = load i16, i16* %172, align 2
  %174 = sext i16 %173 to i32
  %175 = load i32, i32* %23, align 4
  %176 = add nsw i32 %175, %174
  store i32 %176, i32* %23, align 4
  %177 = load i32, i32* @cflag, align 4
  %178 = icmp ne i32 %177, 0
  br i1 %178, label %179, label %195

; <label>:179:                                    ; preds = %170
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 12)
  %180 = add i64 %pgocount10, 1
  store i64 %180, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 12)
  %181 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %182 = load %struct.flagent*, %struct.flagent** %21, align 8
  %183 = getelementptr inbounds %struct.flagent, %struct.flagent* %182, i32 0, i32 2
  %184 = load i16, i16* %183, align 8
  %185 = sext i16 %184 to i32
  %186 = add nsw i32 %185, 65
  %187 = load %struct.flagent*, %struct.flagent** %21, align 8
  %188 = getelementptr inbounds %struct.flagent, %struct.flagent* %187, i32 0, i32 3
  %189 = load i16, i16* %188, align 2
  %190 = sext i16 %189 to i32
  %191 = load %struct.flagent*, %struct.flagent** %21, align 8
  %192 = getelementptr inbounds %struct.flagent, %struct.flagent* %191, i32 0, i32 4
  %193 = load i16, i16* %192, align 4
  %194 = sext i16 %193 to i32
  call void @flagpr(i8* %181, i32 %186, i32 %190, i32 %194, i32 -1, i32 0)
  br label %333

; <label>:195:                                    ; preds = %170
  %196 = load i32, i32* %15, align 4
  %197 = icmp ne i32 %196, 0
  br i1 %197, label %198, label %277

; <label>:198:                                    ; preds = %195
  %199 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %200 = call %struct.dent* @lookup(i8* %199, i32 1)
  store %struct.dent* %200, %struct.dent** %19, align 8
  %201 = icmp ne %struct.dent* %200, null
  br i1 %201, label %202, label %275

; <label>:202:                                    ; preds = %198
  %203 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  store i8* %203, i8** %18, align 8
  %204 = load %struct.flagent*, %struct.flagent** %21, align 8
  %205 = getelementptr inbounds %struct.flagent, %struct.flagent* %204, i32 0, i32 4
  %206 = load i16, i16* %205, align 4
  %207 = icmp ne i16 %206, 0
  br i1 %207, label %208, label %224

; <label>:208:                                    ; preds = %202
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 18)
  %209 = add i64 %pgocount11, 1
  store i64 %209, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 18)
  %210 = load i8*, i8** %18, align 8
  %211 = load %struct.flagent*, %struct.flagent** %21, align 8
  %212 = getelementptr inbounds %struct.flagent, %struct.flagent* %211, i32 0, i32 1
  %213 = load i8*, i8** %212, align 8
  %214 = call i8* @strcpy(i8* %210, i8* %213) #4
  %215 = load %struct.flagent*, %struct.flagent** %21, align 8
  %216 = getelementptr inbounds %struct.flagent, %struct.flagent* %215, i32 0, i32 4
  %217 = load i16, i16* %216, align 4
  %218 = sext i16 %217 to i32
  %219 = load i8*, i8** %18, align 8
  %220 = sext i32 %218 to i64
  %221 = getelementptr inbounds i8, i8* %219, i64 %220
  store i8* %221, i8** %18, align 8
  %222 = load i8*, i8** %18, align 8
  %223 = getelementptr inbounds i8, i8* %222, i32 1
  store i8* %223, i8** %18, align 8
  store i8 43, i8* %222, align 1
  br label %224

; <label>:224:                                    ; preds = %208, %202
  %225 = load i8*, i8** %18, align 8
  %226 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %227 = ptrtoint i8* %225 to i64
  %228 = ptrtoint i8* %226 to i64
  %229 = sub i64 %227, %228
  %230 = trunc i64 %229 to i32
  store i32 %230, i32* %22, align 4
  %231 = load i8*, i8** %18, align 8
  %232 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %233 = call i8* @strcpy(i8* %231, i8* %232) #4
  %234 = load i32, i32* %23, align 4
  %235 = load i8*, i8** %18, align 8
  %236 = sext i32 %234 to i64
  %237 = getelementptr inbounds i8, i8* %235, i64 %236
  store i8* %237, i8** %18, align 8
  %238 = load %struct.flagent*, %struct.flagent** %21, align 8
  %239 = getelementptr inbounds %struct.flagent, %struct.flagent* %238, i32 0, i32 3
  %240 = load i16, i16* %239, align 2
  %241 = icmp ne i16 %240, 0
  br i1 %241, label %242, label %251

; <label>:242:                                    ; preds = %224
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 19)
  %243 = add i64 %pgocount12, 1
  store i64 %243, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 19)
  %244 = load i8*, i8** %18, align 8
  %245 = getelementptr inbounds i8, i8* %244, i32 1
  store i8* %245, i8** %18, align 8
  store i8 45, i8* %244, align 1
  %246 = load i8*, i8** %18, align 8
  %247 = load %struct.flagent*, %struct.flagent** %21, align 8
  %248 = getelementptr inbounds %struct.flagent, %struct.flagent* %247, i32 0, i32 0
  %249 = load i8*, i8** %248, align 8
  %250 = call i8* @strcpy(i8* %246, i8* %249) #4
  br label %251

; <label>:251:                                    ; preds = %242, %224
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 16)
  %252 = add i64 %pgocount13, 1
  store i64 %252, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 16)
  %253 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %254 = load i8*, i8** %9, align 8
  %255 = load %struct.flagent*, %struct.flagent** %21, align 8
  %256 = getelementptr inbounds %struct.flagent, %struct.flagent* %255, i32 0, i32 3
  %257 = load i16, i16* %256, align 2
  %258 = sext i16 %257 to i32
  %259 = load i32, i32* %22, align 4
  %260 = load i8*, i8** %18, align 8
  %261 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %262 = ptrtoint i8* %260 to i64
  %263 = ptrtoint i8* %261 to i64
  %264 = sub i64 %262, %263
  %265 = load i32, i32* %23, align 4
  %266 = sext i32 %265 to i64
  %267 = sub nsw i64 %264, %266
  %268 = load i32, i32* %22, align 4
  %269 = sext i32 %268 to i64
  %270 = sub nsw i64 %267, %269
  %271 = trunc i64 %270 to i32
  %272 = load %struct.dent*, %struct.dent** %19, align 8
  %273 = load %struct.flagent*, %struct.flagent** %21, align 8
  %274 = call i32 @ins_root_cap(i8* %253, i8* %254, i32 %258, i32 %259, i32 0, i32 %271, %struct.dent* %272, %struct.flagent* %273, %struct.flagent* null)
  br label %275

; <label>:275:                                    ; preds = %251, %198
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 15)
  %276 = add i64 %pgocount14, 1
  store i64 %276, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 15)
  br label %332

; <label>:277:                                    ; preds = %195
  %278 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %279 = call %struct.dent* @lookup(i8* %278, i32 1)
  store %struct.dent* %279, %struct.dent** %19, align 8
  %280 = icmp ne %struct.dent* %279, null
  br i1 %280, label %281, label %330

; <label>:281:                                    ; preds = %277
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 20)
  %282 = add i64 %pgocount15, 1
  store i64 %282, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 20)
  %283 = load %struct.dent*, %struct.dent** %19, align 8
  %284 = getelementptr inbounds %struct.dent, %struct.dent* %283, i32 0, i32 2
  %285 = getelementptr inbounds [1 x i64], [1 x i64]* %284, i64 0, i64 0
  %286 = load i64, i64* %285, align 8
  %287 = load %struct.flagent*, %struct.flagent** %21, align 8
  %288 = getelementptr inbounds %struct.flagent, %struct.flagent* %287, i32 0, i32 2
  %289 = load i16, i16* %288, align 8
  %290 = sext i16 %289 to i32
  %291 = zext i32 %290 to i64
  %292 = shl i64 1, %291
  %293 = and i64 %286, %292
  %294 = icmp ne i64 %293, 0
  br i1 %294, label %295, label %330

; <label>:295:                                    ; preds = %281
  %296 = load i32, i32* @numhits, align 4
  %297 = icmp slt i32 %296, 10
  br i1 %297, label %298, label %316

; <label>:298:                                    ; preds = %295
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 22)
  %299 = add i64 %pgocount16, 1
  store i64 %299, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 22)
  %300 = load %struct.dent*, %struct.dent** %19, align 8
  %301 = load i32, i32* @numhits, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %302
  %304 = getelementptr inbounds %struct.success, %struct.success* %303, i32 0, i32 0
  store %struct.dent* %300, %struct.dent** %304, align 8
  %305 = load %struct.flagent*, %struct.flagent** %21, align 8
  %306 = load i32, i32* @numhits, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %307
  %309 = getelementptr inbounds %struct.success, %struct.success* %308, i32 0, i32 1
  store %struct.flagent* %305, %struct.flagent** %309, align 8
  %310 = load i32, i32* @numhits, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %311
  %313 = getelementptr inbounds %struct.success, %struct.success* %312, i32 0, i32 2
  store %struct.flagent* null, %struct.flagent** %313, align 8
  %314 = load i32, i32* @numhits, align 4
  %315 = add nsw i32 %314, 1
  store i32 %315, i32* @numhits, align 4
  br label %316

; <label>:316:                                    ; preds = %298, %295
  %317 = load i32, i32* %16, align 4
  %318 = icmp ne i32 %317, 0
  br i1 %318, label %328, label %319

; <label>:319:                                    ; preds = %316
  %320 = load i8*, i8** %9, align 8
  %321 = load i32, i32* %11, align 4
  %322 = call i32 @cap_ok(i8* %320, %struct.success* getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0), i32 %321)
  %323 = icmp ne i32 %322, 0
  br i1 %323, label %324, label %326

; <label>:324:                                    ; preds = %319
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 24)
  %325 = add i64 %pgocount17, 1
  store i64 %325, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 24)
  br label %360

; <label>:326:                                    ; preds = %319
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 23)
  %327 = add i64 %pgocount18, 1
  store i64 %327, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 23)
  store i32 0, i32* @numhits, align 4
  br label %328

; <label>:328:                                    ; preds = %326, %316
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 21)
  %329 = add i64 %pgocount19, 1
  store i64 %329, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 21)
  br label %330

; <label>:330:                                    ; preds = %328, %281, %277
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 17)
  %331 = add i64 %pgocount20, 1
  store i64 %331, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 17)
  br label %332

; <label>:332:                                    ; preds = %330, %275
  br label %333

; <label>:333:                                    ; preds = %332, %179
  %334 = load %struct.flagent*, %struct.flagent** %21, align 8
  %335 = getelementptr inbounds %struct.flagent, %struct.flagent* %334, i32 0, i32 6
  %336 = load i16, i16* %335, align 8
  %337 = sext i16 %336 to i32
  %338 = and i32 %337, 1
  %339 = icmp ne i32 %338, 0
  br i1 %339, label %340, label %350

; <label>:340:                                    ; preds = %333
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 14)
  %341 = add i64 %pgocount21, 1
  store i64 %341, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 14)
  %342 = load i8*, i8** %9, align 8
  %343 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %344 = load i32, i32* %23, align 4
  %345 = load i32, i32* %13, align 4
  %346 = or i32 %345, 1
  %347 = load %struct.flagent*, %struct.flagent** %21, align 8
  %348 = load i32, i32* %15, align 4
  %349 = load i32, i32* %16, align 4
  call void @chk_suf(i8* %342, i8* %343, i32 %344, i32 %346, %struct.flagent* %347, i32 %348, i32 %349)
  br label %350

; <label>:350:                                    ; preds = %340, %333
  br label %351

; <label>:351:                                    ; preds = %350, %163
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 9)
  %352 = add i64 %pgocount22, 1
  store i64 %352, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 9)
  br label %353

; <label>:353:                                    ; preds = %351, %94, %81, %65
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 2)
  %354 = add i64 %pgocount23, 1
  store i64 %354, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 2)
  br label %355

; <label>:355:                                    ; preds = %353, %63, %48
  %356 = load %struct.flagent*, %struct.flagent** %21, align 8
  %357 = getelementptr inbounds %struct.flagent, %struct.flagent* %356, i32 1
  store %struct.flagent* %357, %struct.flagent** %21, align 8
  %358 = load i32, i32* %20, align 4
  %359 = add nsw i32 %358, -1
  store i32 %359, i32* %20, align 4
  br label %33

; <label>:360:                                    ; preds = %324, %33
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 13)
  %361 = add i64 %pgocount24, 1
  store i64 %361, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_tmp1.ll_pfx_list_chk, i64 0, i64 13)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @chk_suf(i8*, i8*, i32, i32, %struct.flagent*, i32, i32) #0 {
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.flagent*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca %struct.flagptr*, align 8
  store i8* %0, i8** %8, align 8
  store i8* %1, i8** %9, align 8
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store %struct.flagent* %4, %struct.flagent** %12, align 8
  store i32 %5, i32* %13, align 4
  store i32 %6, i32* %14, align 4
  %17 = load i8*, i8** %8, align 8
  %18 = load i8*, i8** %9, align 8
  %19 = load i32, i32* %10, align 4
  %20 = load i32, i32* %11, align 4
  %21 = load %struct.flagent*, %struct.flagent** %12, align 8
  %22 = load i32, i32* %13, align 4
  %23 = load i32, i32* %14, align 4
  call void @suf_list_chk(i8* %17, i8* %18, i32 %19, %struct.flagptr* getelementptr inbounds ([228 x %struct.flagptr], [228 x %struct.flagptr]* @sflagindex, i64 0, i64 0), i32 %20, %struct.flagent* %21, i32 %22, i32 %23)
  %24 = load i8*, i8** %9, align 8
  %25 = load i32, i32* %10, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* %24, i64 %26
  %28 = getelementptr inbounds i8, i8* %27, i64 -1
  store i8* %28, i8** %15, align 8
  %29 = load i8*, i8** %15, align 8
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i64
  %32 = getelementptr inbounds [228 x %struct.flagptr], [228 x %struct.flagptr]* @sflagindex, i64 0, i64 %31
  store %struct.flagptr* %32, %struct.flagptr** %16, align 8
  br label %33

; <label>:33:                                     ; preds = %93, %7
  %34 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %35 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %34, i32 0, i32 1
  %36 = load i32, i32* %35, align 8
  %37 = icmp eq i32 %36, 0
  br i1 %37, label %38, label %45

; <label>:38:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 2)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 2)
  %40 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %41 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %40, i32 0, i32 0
  %42 = bitcast %union.ptr_union* %41 to %struct.flagptr**
  %43 = load %struct.flagptr*, %struct.flagptr** %42, align 8
  %44 = icmp ne %struct.flagptr* %43, null
  br label %45

; <label>:45:                                     ; preds = %38, %33
  %46 = phi i1 [ false, %33 ], [ %44, %38 ]
  br i1 %46, label %47, label %104

; <label>:47:                                     ; preds = %45
  %48 = load i8*, i8** %15, align 8
  %49 = load i8*, i8** %9, align 8
  %50 = icmp eq i8* %48, %49
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 7)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 7)
  br label %114

; <label>:53:                                     ; preds = %47
  %54 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %55 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %54, i32 0, i32 0
  %56 = bitcast %union.ptr_union* %55 to %struct.flagptr**
  %57 = load %struct.flagptr*, %struct.flagptr** %56, align 8
  %58 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %57, i64 0
  %59 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %58, i32 0, i32 1
  %60 = load i32, i32* %59, align 8
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %93

; <label>:62:                                     ; preds = %53
  %63 = load i8*, i8** %8, align 8
  %64 = load i8*, i8** %9, align 8
  %65 = load i32, i32* %10, align 4
  %66 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %67 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %66, i32 0, i32 0
  %68 = bitcast %union.ptr_union* %67 to %struct.flagptr**
  %69 = load %struct.flagptr*, %struct.flagptr** %68, align 8
  %70 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %69, i64 0
  %71 = load i32, i32* %11, align 4
  %72 = load %struct.flagent*, %struct.flagent** %12, align 8
  %73 = load i32, i32* %13, align 4
  %74 = load i32, i32* %14, align 4
  call void @suf_list_chk(i8* %63, i8* %64, i32 %65, %struct.flagptr* %70, i32 %71, %struct.flagent* %72, i32 %73, i32 %74)
  %75 = load i32, i32* @numhits, align 4
  %76 = icmp ne i32 %75, 0
  br i1 %76, label %77, label %91

; <label>:77:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 3)
  %78 = add i64 %pgocount2, 1
  store i64 %78, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 3)
  %79 = load i32, i32* %14, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %91, label %81

; <label>:81:                                     ; preds = %77
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 4)
  %82 = add i64 %pgocount3, 1
  store i64 %82, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 4)
  %83 = load i32, i32* @cflag, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %91, label %85

; <label>:85:                                     ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 5)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 5)
  %87 = load i32, i32* %13, align 4
  %88 = icmp ne i32 %87, 0
  br i1 %88, label %91, label %89

; <label>:89:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 8)
  %90 = add i64 %pgocount5, 1
  store i64 %90, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 8)
  br label %114

; <label>:91:                                     ; preds = %85, %81, %77, %62
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 1)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 1)
  br label %93

; <label>:93:                                     ; preds = %91, %53
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 0)
  %94 = add i64 %pgocount7, 1
  store i64 %94, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 0)
  %95 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %96 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %95, i32 0, i32 0
  %97 = bitcast %union.ptr_union* %96 to %struct.flagptr**
  %98 = load %struct.flagptr*, %struct.flagptr** %97, align 8
  %99 = load i8*, i8** %15, align 8
  %100 = getelementptr inbounds i8, i8* %99, i32 -1
  store i8* %100, i8** %15, align 8
  %101 = load i8, i8* %100, align 1
  %102 = zext i8 %101 to i64
  %103 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %98, i64 %102
  store %struct.flagptr* %103, %struct.flagptr** %16, align 8
  br label %33

; <label>:104:                                    ; preds = %45
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 6)
  %105 = add i64 %pgocount8, 1
  store i64 %105, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_chk_suf, i64 0, i64 6)
  %106 = load i8*, i8** %8, align 8
  %107 = load i8*, i8** %9, align 8
  %108 = load i32, i32* %10, align 4
  %109 = load %struct.flagptr*, %struct.flagptr** %16, align 8
  %110 = load i32, i32* %11, align 4
  %111 = load %struct.flagent*, %struct.flagent** %12, align 8
  %112 = load i32, i32* %13, align 4
  %113 = load i32, i32* %14, align 4
  call void @suf_list_chk(i8* %106, i8* %107, i32 %108, %struct.flagptr* %109, i32 %110, %struct.flagent* %111, i32 %112, i32 %113)
  br label %114

; <label>:114:                                    ; preds = %104, %89, %51
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @expand_pre(i8*, i8*, i64*, i32, i8*) #0 {
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.flagent*, align 8
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store i64* %2, i64** %8, align 8
  store i32 %3, i32* %9, align 4
  store i8* %4, i8** %10, align 8
  %14 = load %struct.flagent*, %struct.flagent** @pflaglist, align 8
  store %struct.flagent* %14, %struct.flagent** %13, align 8
  %15 = load i32, i32* @numpflags, align 4
  store i32 %15, i32* %11, align 4
  store i32 0, i32* %12, align 4
  br label %16

; <label>:16:                                     ; preds = %43, %5
  %17 = load i32, i32* %11, align 4
  %18 = icmp sgt i32 %17, 0
  br i1 %18, label %19, label %49

; <label>:19:                                     ; preds = %16
  %20 = load i64*, i64** %8, align 8
  %21 = getelementptr inbounds i64, i64* %20, i64 0
  %22 = load i64, i64* %21, align 8
  %23 = load %struct.flagent*, %struct.flagent** %13, align 8
  %24 = getelementptr inbounds %struct.flagent, %struct.flagent* %23, i32 0, i32 2
  %25 = load i16, i16* %24, align 8
  %26 = sext i16 %25 to i32
  %27 = zext i32 %26 to i64
  %28 = shl i64 1, %27
  %29 = and i64 %22, %28
  %30 = icmp ne i64 %29, 0
  br i1 %30, label %31, label %42

; <label>:31:                                     ; preds = %19
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 1)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 1)
  %33 = load i8*, i8** %6, align 8
  %34 = load i8*, i8** %7, align 8
  %35 = load %struct.flagent*, %struct.flagent** %13, align 8
  %36 = load i64*, i64** %8, align 8
  %37 = load i32, i32* %9, align 4
  %38 = load i8*, i8** %10, align 8
  %39 = call i32 @pr_pre_expansion(i8* %33, i8* %34, %struct.flagent* %35, i64* %36, i32 %37, i8* %38)
  %40 = load i32, i32* %12, align 4
  %41 = add nsw i32 %40, %39
  store i32 %41, i32* %12, align 4
  br label %42

; <label>:42:                                     ; preds = %31, %19
  br label %43

; <label>:43:                                     ; preds = %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 0)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 0)
  %45 = load %struct.flagent*, %struct.flagent** %13, align 8
  %46 = getelementptr inbounds %struct.flagent, %struct.flagent* %45, i32 1
  store %struct.flagent* %46, %struct.flagent** %13, align 8
  %47 = load i32, i32* %11, align 4
  %48 = add nsw i32 %47, -1
  store i32 %48, i32* %11, align 4
  br label %16

; <label>:49:                                     ; preds = %16
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 2)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_expand_pre, i64 0, i64 2)
  %51 = load i32, i32* %12, align 4
  ret i32 %51
}

; Function Attrs: nounwind uwtable
define internal i32 @pr_pre_expansion(i8*, i8*, %struct.flagent*, i64*, i32, i8*) #0 {
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  %9 = alloca i8*, align 8
  %10 = alloca %struct.flagent*, align 8
  %11 = alloca i64*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i8*, align 8
  %16 = alloca i32, align 4
  %17 = alloca [120 x i8], align 16
  store i8* %0, i8** %8, align 8
  store i8* %1, i8** %9, align 8
  store %struct.flagent* %2, %struct.flagent** %10, align 8
  store i64* %3, i64** %11, align 8
  store i32 %4, i32* %12, align 4
  store i8* %5, i8** %13, align 8
  %18 = load i8*, i8** %9, align 8
  %19 = call i64 @strlen(i8* %18) #5
  %20 = trunc i64 %19 to i32
  store i32 %20, i32* %16, align 4
  %21 = load %struct.flagent*, %struct.flagent** %10, align 8
  %22 = getelementptr inbounds %struct.flagent, %struct.flagent* %21, i32 0, i32 5
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = load i32, i32* %16, align 4
  %26 = icmp sgt i32 %24, %25
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 3)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 3)
  store i32 0, i32* %7, align 4
  br label %243

; <label>:29:                                     ; preds = %6
  %30 = load %struct.flagent*, %struct.flagent** %10, align 8
  %31 = getelementptr inbounds %struct.flagent, %struct.flagent* %30, i32 0, i32 3
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = load i32, i32* %16, align 4
  %35 = sub nsw i32 %34, %33
  store i32 %35, i32* %16, align 4
  %36 = load i32, i32* %16, align 4
  %37 = icmp sle i32 %36, 0
  br i1 %37, label %38, label %40

; <label>:38:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 4)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 4)
  store i32 0, i32* %7, align 4
  br label %243

; <label>:40:                                     ; preds = %29
  %41 = load %struct.flagent*, %struct.flagent** %10, align 8
  %42 = getelementptr inbounds %struct.flagent, %struct.flagent* %41, i32 0, i32 4
  %43 = load i16, i16* %42, align 4
  %44 = sext i16 %43 to i32
  %45 = load i32, i32* %16, align 4
  %46 = add nsw i32 %45, %44
  store i32 %46, i32* %16, align 4
  store i32 0, i32* %14, align 4
  %47 = load i8*, i8** %9, align 8
  store i8* %47, i8** %15, align 8
  br label %48

; <label>:48:                                     ; preds = %76, %40
  %49 = load i32, i32* %14, align 4
  %50 = load %struct.flagent*, %struct.flagent** %10, align 8
  %51 = getelementptr inbounds %struct.flagent, %struct.flagent* %50, i32 0, i32 5
  %52 = load i16, i16* %51, align 2
  %53 = sext i16 %52 to i32
  %54 = icmp slt i32 %49, %53
  br i1 %54, label %55, label %79

; <label>:55:                                     ; preds = %48
  %56 = load %struct.flagent*, %struct.flagent** %10, align 8
  %57 = getelementptr inbounds %struct.flagent, %struct.flagent* %56, i32 0, i32 7
  %58 = load i8*, i8** %15, align 8
  %59 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %59, i8** %15, align 8
  %60 = load i8, i8* %58, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %61
  %63 = load i8, i8* %62, align 1
  %64 = zext i8 %63 to i64
  %65 = getelementptr inbounds [228 x i8], [228 x i8]* %57, i64 0, i64 %64
  %66 = load i8, i8* %65, align 1
  %67 = sext i8 %66 to i32
  %68 = load i32, i32* %14, align 4
  %69 = shl i32 1, %68
  %70 = and i32 %67, %69
  %71 = icmp eq i32 %70, 0
  br i1 %71, label %72, label %74

; <label>:72:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 5)
  %73 = add i64 %pgocount2, 1
  store i64 %73, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 5)
  store i32 0, i32* %7, align 4
  br label %243

; <label>:74:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 0)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 0)
  br label %76

; <label>:76:                                     ; preds = %74
  %77 = load i32, i32* %14, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %14, align 4
  br label %48

; <label>:79:                                     ; preds = %48
  %80 = load %struct.flagent*, %struct.flagent** %10, align 8
  %81 = getelementptr inbounds %struct.flagent, %struct.flagent* %80, i32 0, i32 4
  %82 = load i16, i16* %81, align 4
  %83 = icmp ne i16 %82, 0
  br i1 %83, label %84, label %98

; <label>:84:                                     ; preds = %79
  %pgocount4 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 6)
  %85 = add i64 %pgocount4, 1
  store i64 %85, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 6)
  %86 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %87 = load %struct.flagent*, %struct.flagent** %10, align 8
  %88 = getelementptr inbounds %struct.flagent, %struct.flagent* %87, i32 0, i32 1
  %89 = load i8*, i8** %88, align 8
  %90 = call i8* @strcpy(i8* %86, i8* %89) #4
  %91 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %92 = load %struct.flagent*, %struct.flagent** %10, align 8
  %93 = getelementptr inbounds %struct.flagent, %struct.flagent* %92, i32 0, i32 4
  %94 = load i16, i16* %93, align 4
  %95 = sext i16 %94 to i32
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds i8, i8* %91, i64 %96
  store i8* %97, i8** %15, align 8
  br label %98

; <label>:98:                                     ; preds = %84, %79
  %99 = load i8*, i8** %15, align 8
  %100 = load i8*, i8** %9, align 8
  %101 = load %struct.flagent*, %struct.flagent** %10, align 8
  %102 = getelementptr inbounds %struct.flagent, %struct.flagent* %101, i32 0, i32 3
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8* %100, i64 %105
  %107 = call i8* @strcpy(i8* %99, i8* %106) #4
  %108 = load i8*, i8** %9, align 8
  %109 = getelementptr inbounds i8, i8* %108, i64 0
  %110 = load i8, i8* %109, align 1
  %111 = zext i8 %110 to i64
  %112 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %111
  %113 = load i8, i8* %112, align 1
  %114 = icmp ne i8 %113, 0
  br i1 %114, label %115, label %191

; <label>:115:                                    ; preds = %98
  %116 = load i8*, i8** %9, align 8
  %117 = getelementptr inbounds i8, i8* %116, i64 1
  store i8* %117, i8** %15, align 8
  br label %118

; <label>:118:                                    ; preds = %133, %115
  %119 = load i8*, i8** %15, align 8
  %120 = load i8, i8* %119, align 1
  %121 = icmp ne i8 %120, 0
  br i1 %121, label %122, label %136

; <label>:122:                                    ; preds = %118
  %123 = load i8*, i8** %15, align 8
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %125
  %127 = load i8, i8* %126, align 1
  %128 = icmp ne i8 %127, 0
  br i1 %128, label %131, label %129

; <label>:129:                                    ; preds = %122
  %pgocount5 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 12)
  %130 = add i64 %pgocount5, 1
  store i64 %130, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 12)
  br label %136

; <label>:131:                                    ; preds = %122
  %pgocount6 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 1)
  %132 = add i64 %pgocount6, 1
  store i64 %132, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 1)
  br label %133

; <label>:133:                                    ; preds = %131
  %134 = load i8*, i8** %15, align 8
  %135 = getelementptr inbounds i8, i8* %134, i32 1
  store i8* %135, i8** %15, align 8
  br label %118

; <label>:136:                                    ; preds = %129, %118
  %137 = load i8*, i8** %15, align 8
  %138 = load i8, i8* %137, align 1
  %139 = icmp ne i8 %138, 0
  br i1 %139, label %140, label %190

; <label>:140:                                    ; preds = %136
  br label %141

; <label>:141:                                    ; preds = %155, %140
  %142 = load i8*, i8** %15, align 8
  %143 = load i8, i8* %142, align 1
  %144 = icmp ne i8 %143, 0
  br i1 %144, label %145, label %159

; <label>:145:                                    ; preds = %141
  %146 = load i8*, i8** %15, align 8
  %147 = load i8, i8* %146, align 1
  %148 = zext i8 %147 to i64
  %149 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %148
  %150 = load i8, i8* %149, align 1
  %151 = icmp ne i8 %150, 0
  br i1 %151, label %152, label %154

; <label>:152:                                    ; preds = %145
  %pgocount7 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 14)
  %153 = add i64 %pgocount7, 1
  store i64 %153, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 14)
  br label %159

; <label>:154:                                    ; preds = %145
  br label %155

; <label>:155:                                    ; preds = %154
  %pgocount8 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 2)
  %156 = add i64 %pgocount8, 1
  store i64 %156, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 2)
  %157 = load i8*, i8** %15, align 8
  %158 = getelementptr inbounds i8, i8* %157, i32 1
  store i8* %158, i8** %15, align 8
  br label %141

; <label>:159:                                    ; preds = %152, %141
  %160 = load i8*, i8** %15, align 8
  %161 = load i8, i8* %160, align 1
  %162 = icmp ne i8 %161, 0
  br i1 %162, label %163, label %183

; <label>:163:                                    ; preds = %159
  %164 = load %struct.flagent*, %struct.flagent** %10, align 8
  %165 = getelementptr inbounds %struct.flagent, %struct.flagent* %164, i32 0, i32 4
  %166 = load i16, i16* %165, align 4
  %167 = sext i16 %166 to i64
  %168 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i64 0, i64 %167
  %169 = load i8, i8* %168, align 1
  %170 = zext i8 %169 to i64
  %171 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %170
  %172 = load i8, i8* %171, align 1
  %173 = icmp ne i8 %172, 0
  br i1 %173, label %181, label %174

; <label>:174:                                    ; preds = %163
  %pgocount9 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 17)
  %175 = add i64 %pgocount9, 1
  store i64 %175, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 17)
  %176 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %177 = load %struct.flagent*, %struct.flagent** %10, align 8
  %178 = getelementptr inbounds %struct.flagent, %struct.flagent* %177, i32 0, i32 4
  %179 = load i16, i16* %178, align 4
  %180 = sext i16 %179 to i32
  call void @forcelc(i8* %176, i32 %180)
  br label %181

; <label>:181:                                    ; preds = %174, %163
  %pgocount10 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 13)
  %182 = add i64 %pgocount10, 1
  store i64 %182, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 13)
  br label %189

; <label>:183:                                    ; preds = %159
  %pgocount11 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 15)
  %184 = add i64 %pgocount11, 1
  store i64 %184, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 15)
  %185 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %186 = getelementptr inbounds i8, i8* %185, i64 1
  %187 = load i32, i32* %16, align 4
  %188 = sub nsw i32 %187, 1
  call void @forcelc(i8* %186, i32 %188)
  br label %189

; <label>:189:                                    ; preds = %183, %181
  br label %190

; <label>:190:                                    ; preds = %189, %136
  br label %207

; <label>:191:                                    ; preds = %98
  %192 = load i8*, i8** %15, align 8
  %193 = load i8, i8* %192, align 1
  %194 = zext i8 %193 to i64
  %195 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %194
  %196 = load i8, i8* %195, align 1
  %197 = icmp ne i8 %196, 0
  br i1 %197, label %205, label %198

; <label>:198:                                    ; preds = %191
  %pgocount12 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 16)
  %199 = add i64 %pgocount12, 1
  store i64 %199, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 16)
  %200 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %201 = load %struct.flagent*, %struct.flagent** %10, align 8
  %202 = getelementptr inbounds %struct.flagent, %struct.flagent* %201, i32 0, i32 4
  %203 = load i16, i16* %202, align 4
  %204 = sext i16 %203 to i32
  call void @forcelc(i8* %200, i32 %204)
  br label %205

; <label>:205:                                    ; preds = %198, %191
  %pgocount13 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 11)
  %206 = add i64 %pgocount13, 1
  store i64 %206, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 11)
  br label %207

; <label>:207:                                    ; preds = %205, %190
  %208 = load i32, i32* %12, align 4
  %209 = icmp eq i32 %208, 3
  br i1 %209, label %210, label %214

; <label>:210:                                    ; preds = %207
  %pgocount14 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 7)
  %211 = add i64 %pgocount14, 1
  store i64 %211, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 7)
  %212 = load i8*, i8** %8, align 8
  %213 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %212)
  br label %214

; <label>:214:                                    ; preds = %210, %207
  %215 = load i32, i32* %12, align 4
  %216 = icmp ne i32 %215, 4
  br i1 %216, label %217, label %223

; <label>:217:                                    ; preds = %214
  %pgocount15 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 8)
  %218 = add i64 %pgocount15, 1
  store i64 %218, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 8)
  %219 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %220 = call i8* @ichartosstr(i8* %219, i32 1)
  %221 = load i8*, i8** %13, align 8
  %222 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* %220, i8* %221)
  br label %223

; <label>:223:                                    ; preds = %217, %214
  %224 = load %struct.flagent*, %struct.flagent** %10, align 8
  %225 = getelementptr inbounds %struct.flagent, %struct.flagent* %224, i32 0, i32 6
  %226 = load i16, i16* %225, align 8
  %227 = sext i16 %226 to i32
  %228 = and i32 %227, 1
  %229 = icmp ne i32 %228, 0
  br i1 %229, label %230, label %240

; <label>:230:                                    ; preds = %223
  %pgocount16 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 9)
  %231 = add i64 %pgocount16, 1
  store i64 %231, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 9)
  %232 = load i32, i32* %16, align 4
  %233 = load i8*, i8** %8, align 8
  %234 = getelementptr inbounds [120 x i8], [120 x i8]* %17, i32 0, i32 0
  %235 = load i64*, i64** %11, align 8
  %236 = load i32, i32* %12, align 4
  %237 = load i8*, i8** %13, align 8
  %238 = call i32 @expand_suf(i8* %233, i8* %234, i64* %235, i32 1, i32 %236, i8* %237)
  %239 = add nsw i32 %232, %238
  store i32 %239, i32* %7, align 4
  br label %243

; <label>:240:                                    ; preds = %223
  %pgocount17 = load i64, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 10)
  %241 = add i64 %pgocount17, 1
  store i64 %241, i64* getelementptr inbounds ([18 x i64], [18 x i64]* @__profc_tmp1.ll_pr_pre_expansion, i64 0, i64 10)
  %242 = load i32, i32* %16, align 4
  store i32 %242, i32* %7, align 4
  br label %243

; <label>:243:                                    ; preds = %240, %230, %72, %38, %27
  %244 = load i32, i32* %7, align 4
  ret i32 %244
}

; Function Attrs: nounwind uwtable
define i32 @expand_suf(i8*, i8*, i64*, i32, i32, i8*) #0 {
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca i64*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i8*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca %struct.flagent*, align 8
  store i8* %0, i8** %7, align 8
  store i8* %1, i8** %8, align 8
  store i64* %2, i64** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i8* %5, i8** %12, align 8
  %16 = load %struct.flagent*, %struct.flagent** @sflaglist, align 8
  store %struct.flagent* %16, %struct.flagent** %15, align 8
  %17 = load i32, i32* @numsflags, align 4
  store i32 %17, i32* %13, align 4
  store i32 0, i32* %14, align 4
  br label %18

; <label>:18:                                     ; preds = %58, %6
  %19 = load i32, i32* %13, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %64

; <label>:21:                                     ; preds = %18
  %22 = load i64*, i64** %9, align 8
  %23 = getelementptr inbounds i64, i64* %22, i64 0
  %24 = load i64, i64* %23, align 8
  %25 = load %struct.flagent*, %struct.flagent** %15, align 8
  %26 = getelementptr inbounds %struct.flagent, %struct.flagent* %25, i32 0, i32 2
  %27 = load i16, i16* %26, align 8
  %28 = sext i16 %27 to i32
  %29 = zext i32 %28 to i64
  %30 = shl i64 1, %29
  %31 = and i64 %24, %30
  %32 = icmp ne i64 %31, 0
  br i1 %32, label %33, label %57

; <label>:33:                                     ; preds = %21
  %34 = load i32, i32* %10, align 4
  %35 = and i32 %34, 1
  %36 = icmp eq i32 %35, 0
  br i1 %36, label %45, label %37

; <label>:37:                                     ; preds = %33
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 3)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 3)
  %39 = load %struct.flagent*, %struct.flagent** %15, align 8
  %40 = getelementptr inbounds %struct.flagent, %struct.flagent* %39, i32 0, i32 6
  %41 = load i16, i16* %40, align 8
  %42 = sext i16 %41 to i32
  %43 = and i32 %42, 1
  %44 = icmp ne i32 %43, 0
  br i1 %44, label %45, label %55

; <label>:45:                                     ; preds = %37, %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 2)
  %46 = add i64 %pgocount1, 1
  store i64 %46, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 2)
  %47 = load i8*, i8** %7, align 8
  %48 = load i8*, i8** %8, align 8
  %49 = load %struct.flagent*, %struct.flagent** %15, align 8
  %50 = load i32, i32* %11, align 4
  %51 = load i8*, i8** %12, align 8
  %52 = call i32 @pr_suf_expansion(i8* %47, i8* %48, %struct.flagent* %49, i32 %50, i8* %51)
  %53 = load i32, i32* %14, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, i32* %14, align 4
  br label %55

; <label>:55:                                     ; preds = %45, %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 1)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 1)
  br label %57

; <label>:57:                                     ; preds = %55, %21
  br label %58

; <label>:58:                                     ; preds = %57
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 0)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 0)
  %60 = load %struct.flagent*, %struct.flagent** %15, align 8
  %61 = getelementptr inbounds %struct.flagent, %struct.flagent* %60, i32 1
  store %struct.flagent* %61, %struct.flagent** %15, align 8
  %62 = load i32, i32* %13, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, i32* %13, align 4
  br label %18

; <label>:64:                                     ; preds = %18
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 4)
  %65 = add i64 %pgocount4, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_expand_suf, i64 0, i64 4)
  %66 = load i32, i32* %14, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define internal i32 @pr_suf_expansion(i8*, i8*, %struct.flagent*, i32, i8*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  %9 = alloca %struct.flagent*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i8*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i32, align 4
  %15 = alloca [120 x i8], align 16
  store i8* %0, i8** %7, align 8
  store i8* %1, i8** %8, align 8
  store %struct.flagent* %2, %struct.flagent** %9, align 8
  store i32 %3, i32* %10, align 4
  store i8* %4, i8** %11, align 8
  %16 = load i8*, i8** %8, align 8
  %17 = call i64 @strlen(i8* %16) #5
  %18 = trunc i64 %17 to i32
  store i32 %18, i32* %14, align 4
  %19 = load %struct.flagent*, %struct.flagent** %9, align 8
  %20 = getelementptr inbounds %struct.flagent, %struct.flagent* %19, i32 0, i32 5
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  store i32 %22, i32* %12, align 4
  %23 = load i32, i32* %12, align 4
  %24 = load i32, i32* %14, align 4
  %25 = icmp sgt i32 %23, %24
  br i1 %25, label %26, label %28

; <label>:26:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 1)
  store i32 0, i32* %6, align 4
  br label %140

; <label>:28:                                     ; preds = %5
  %29 = load i32, i32* %14, align 4
  %30 = load %struct.flagent*, %struct.flagent** %9, align 8
  %31 = getelementptr inbounds %struct.flagent, %struct.flagent* %30, i32 0, i32 3
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = sub nsw i32 %29, %33
  %35 = icmp sle i32 %34, 0
  br i1 %35, label %36, label %38

; <label>:36:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 2)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 2)
  store i32 0, i32* %6, align 4
  br label %140

; <label>:38:                                     ; preds = %28
  %39 = load i8*, i8** %8, align 8
  %40 = load i32, i32* %14, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i8, i8* %39, i64 %41
  store i8* %42, i8** %13, align 8
  br label %43

; <label>:43:                                     ; preds = %66, %38
  %44 = load i32, i32* %12, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %12, align 4
  %46 = icmp sge i32 %45, 0
  br i1 %46, label %47, label %68

; <label>:47:                                     ; preds = %43
  %48 = load %struct.flagent*, %struct.flagent** %9, align 8
  %49 = getelementptr inbounds %struct.flagent, %struct.flagent* %48, i32 0, i32 7
  %50 = load i8*, i8** %13, align 8
  %51 = getelementptr inbounds i8, i8* %50, i32 -1
  store i8* %51, i8** %13, align 8
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i64
  %54 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = zext i8 %55 to i64
  %57 = getelementptr inbounds [228 x i8], [228 x i8]* %49, i64 0, i64 %56
  %58 = load i8, i8* %57, align 1
  %59 = sext i8 %58 to i32
  %60 = load i32, i32* %12, align 4
  %61 = shl i32 1, %60
  %62 = and i32 %59, %61
  %63 = icmp eq i32 %62, 0
  br i1 %63, label %64, label %66

; <label>:64:                                     ; preds = %47
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 3)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 3)
  store i32 0, i32* %6, align 4
  br label %140

; <label>:66:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 0)
  %67 = add i64 %pgocount3, 1
  store i64 %67, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 0)
  br label %43

; <label>:68:                                     ; preds = %43
  %69 = getelementptr inbounds [120 x i8], [120 x i8]* %15, i32 0, i32 0
  %70 = load i8*, i8** %8, align 8
  %71 = call i8* @strcpy(i8* %69, i8* %70) #4
  %72 = getelementptr inbounds [120 x i8], [120 x i8]* %15, i32 0, i32 0
  %73 = load i32, i32* %14, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8* %72, i64 %74
  %76 = load %struct.flagent*, %struct.flagent** %9, align 8
  %77 = getelementptr inbounds %struct.flagent, %struct.flagent* %76, i32 0, i32 3
  %78 = load i16, i16* %77, align 2
  %79 = sext i16 %78 to i32
  %80 = sext i32 %79 to i64
  %81 = sub i64 0, %80
  %82 = getelementptr inbounds i8, i8* %75, i64 %81
  store i8* %82, i8** %13, align 8
  %83 = load %struct.flagent*, %struct.flagent** %9, align 8
  %84 = getelementptr inbounds %struct.flagent, %struct.flagent* %83, i32 0, i32 4
  %85 = load i16, i16* %84, align 4
  %86 = icmp ne i16 %85, 0
  br i1 %86, label %87, label %109

; <label>:87:                                     ; preds = %68
  %88 = load i8*, i8** %13, align 8
  %89 = load %struct.flagent*, %struct.flagent** %9, align 8
  %90 = getelementptr inbounds %struct.flagent, %struct.flagent* %89, i32 0, i32 1
  %91 = load i8*, i8** %90, align 8
  %92 = call i8* @strcpy(i8* %88, i8* %91) #4
  %93 = load i8*, i8** %13, align 8
  %94 = getelementptr inbounds i8, i8* %93, i64 -1
  %95 = load i8, i8* %94, align 1
  %96 = zext i8 %95 to i64
  %97 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 24), i64 0, i64 %96
  %98 = load i8, i8* %97, align 1
  %99 = icmp ne i8 %98, 0
  br i1 %99, label %107, label %100

; <label>:100:                                    ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 8)
  %101 = add i64 %pgocount4, 1
  store i64 %101, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 8)
  %102 = load i8*, i8** %13, align 8
  %103 = load %struct.flagent*, %struct.flagent** %9, align 8
  %104 = getelementptr inbounds %struct.flagent, %struct.flagent* %103, i32 0, i32 4
  %105 = load i16, i16* %104, align 4
  %106 = sext i16 %105 to i32
  call void @forcelc(i8* %102, i32 %106)
  br label %107

; <label>:107:                                    ; preds = %100, %87
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 4)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 4)
  br label %112

; <label>:109:                                    ; preds = %68
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 7)
  %110 = add i64 %pgocount6, 1
  store i64 %110, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 7)
  %111 = load i8*, i8** %13, align 8
  store i8 0, i8* %111, align 1
  br label %112

; <label>:112:                                    ; preds = %109, %107
  %113 = load i32, i32* %10, align 4
  %114 = icmp eq i32 %113, 3
  br i1 %114, label %115, label %119

; <label>:115:                                    ; preds = %112
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 5)
  %116 = add i64 %pgocount7, 1
  store i64 %116, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 5)
  %117 = load i8*, i8** %7, align 8
  %118 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i8* %117)
  br label %119

; <label>:119:                                    ; preds = %115, %112
  %120 = load i32, i32* %10, align 4
  %121 = icmp ne i32 %120, 4
  br i1 %121, label %122, label %128

; <label>:122:                                    ; preds = %119
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 6)
  %123 = add i64 %pgocount8, 1
  store i64 %123, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_pr_suf_expansion, i64 0, i64 6)
  %124 = getelementptr inbounds [120 x i8], [120 x i8]* %15, i32 0, i32 0
  %125 = call i8* @ichartosstr(i8* %124, i32 1)
  %126 = load i8*, i8** %11, align 8
  %127 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i32 0, i32 0), i8* %125, i8* %126)
  br label %128

; <label>:128:                                    ; preds = %122, %119
  %129 = load i32, i32* %14, align 4
  %130 = load %struct.flagent*, %struct.flagent** %9, align 8
  %131 = getelementptr inbounds %struct.flagent, %struct.flagent* %130, i32 0, i32 4
  %132 = load i16, i16* %131, align 4
  %133 = sext i16 %132 to i32
  %134 = add nsw i32 %129, %133
  %135 = load %struct.flagent*, %struct.flagent** %9, align 8
  %136 = getelementptr inbounds %struct.flagent, %struct.flagent* %135, i32 0, i32 3
  %137 = load i16, i16* %136, align 2
  %138 = sext i16 %137 to i32
  %139 = sub nsw i32 %134, %138
  store i32 %139, i32* %6, align 4
  br label %140

; <label>:140:                                    ; preds = %128, %64, %36, %26
  %141 = load i32, i32* %6, align 4
  ret i32 %141
}

; Function Attrs: nounwind readonly
declare i32 @strncmp(i8*, i8*, i64) #1

; Function Attrs: nounwind
declare i8* @strcpy(i8*, i8*) #2

declare void @flagpr(i8*, i32, i32, i32, i32, i32) #3

declare %struct.dent* @lookup(i8*, i32) #3

declare i32 @ins_root_cap(i8*, i8*, i32, i32, i32, i32, %struct.dent*, %struct.flagent*, %struct.flagent*) #3

declare i32 @cap_ok(i8*, %struct.success*, i32) #3

; Function Attrs: nounwind uwtable
define internal void @suf_list_chk(i8*, i8*, i32, %struct.flagptr*, i32, %struct.flagent*, i32, i32) #0 {
  %9 = alloca i8*, align 8
  %10 = alloca i8*, align 8
  %11 = alloca i32, align 4
  %12 = alloca %struct.flagptr*, align 8
  %13 = alloca i32, align 4
  %14 = alloca %struct.flagent*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i8*, align 8
  %18 = alloca i32, align 4
  %19 = alloca %struct.dent*, align 8
  %20 = alloca i32, align 4
  %21 = alloca %struct.flagent*, align 8
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca [184 x i8], align 16
  %25 = alloca [184 x i8], align 16
  store i8* %0, i8** %9, align 8
  store i8* %1, i8** %10, align 8
  store i32 %2, i32* %11, align 4
  store %struct.flagptr* %3, %struct.flagptr** %12, align 8
  store i32 %4, i32* %13, align 4
  store %struct.flagent* %5, %struct.flagent** %14, align 8
  store i32 %6, i32* %15, align 4
  store i32 %7, i32* %16, align 4
  %26 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %27 = load i8*, i8** %10, align 8
  %28 = call i8* @strcpy(i8* %26, i8* %27) #4
  %29 = load %struct.flagptr*, %struct.flagptr** %12, align 8
  %30 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %29, i32 0, i32 0
  %31 = bitcast %union.ptr_union* %30 to %struct.flagent**
  %32 = load %struct.flagent*, %struct.flagent** %31, align 8
  store %struct.flagent* %32, %struct.flagent** %21, align 8
  %33 = load %struct.flagptr*, %struct.flagptr** %12, align 8
  %34 = getelementptr inbounds %struct.flagptr, %struct.flagptr* %33, i32 0, i32 1
  %35 = load i32, i32* %34, align 8
  store i32 %35, i32* %20, align 4
  br label %36

; <label>:36:                                     ; preds = %465, %8
  %37 = load i32, i32* %20, align 4
  %38 = icmp sgt i32 %37, 0
  br i1 %38, label %39, label %470

; <label>:39:                                     ; preds = %36
  %40 = load i32, i32* %13, align 4
  %41 = and i32 %40, 1
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %53

; <label>:43:                                     ; preds = %39
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 2)
  %44 = add i64 %pgocount, 1
  store i64 %44, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 2)
  %45 = load %struct.flagent*, %struct.flagent** %21, align 8
  %46 = getelementptr inbounds %struct.flagent, %struct.flagent* %45, i32 0, i32 6
  %47 = load i16, i16* %46, align 8
  %48 = sext i16 %47 to i32
  %49 = and i32 %48, 1
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 7)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 7)
  br label %465

; <label>:53:                                     ; preds = %43, %39
  %54 = load %struct.flagent*, %struct.flagent** %21, align 8
  %55 = getelementptr inbounds %struct.flagent, %struct.flagent* %54, i32 0, i32 6
  %56 = load i16, i16* %55, align 8
  %57 = sext i16 %56 to i32
  %58 = and i32 %57, 2
  %59 = icmp ne i32 %58, 0
  br i1 %59, label %60, label %67

; <label>:60:                                     ; preds = %53
  %pgocount2 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 4)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 4)
  %62 = load i32, i32* %13, align 4
  %63 = and i32 %62, 2
  %64 = icmp eq i32 %63, 0
  br i1 %64, label %65, label %67

; <label>:65:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 8)
  %66 = add i64 %pgocount3, 1
  store i64 %66, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 8)
  br label %465

; <label>:67:                                     ; preds = %60, %53
  %68 = load i32, i32* @compoundflag, align 4
  %69 = icmp eq i32 %68, 2
  br i1 %69, label %70, label %82

; <label>:70:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 5)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 5)
  %72 = load %struct.flagent*, %struct.flagent** %21, align 8
  %73 = getelementptr inbounds %struct.flagent, %struct.flagent* %72, i32 0, i32 6
  %74 = load i16, i16* %73, align 8
  %75 = sext i16 %74 to i32
  %76 = load i32, i32* %13, align 4
  %77 = xor i32 %75, %76
  %78 = and i32 %77, 2
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 10)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 10)
  br label %465

; <label>:82:                                     ; preds = %70, %67
  %83 = load i32, i32* %11, align 4
  %84 = load %struct.flagent*, %struct.flagent** %21, align 8
  %85 = getelementptr inbounds %struct.flagent, %struct.flagent* %84, i32 0, i32 4
  %86 = load i16, i16* %85, align 4
  %87 = sext i16 %86 to i32
  %88 = sub nsw i32 %83, %87
  store i32 %88, i32* %23, align 4
  %89 = load i32, i32* %23, align 4
  %90 = icmp sgt i32 %89, 0
  br i1 %90, label %91, label %463

; <label>:91:                                     ; preds = %82
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 6)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 6)
  %93 = load %struct.flagent*, %struct.flagent** %21, align 8
  %94 = getelementptr inbounds %struct.flagent, %struct.flagent* %93, i32 0, i32 4
  %95 = load i16, i16* %94, align 4
  %96 = sext i16 %95 to i32
  %97 = icmp eq i32 %96, 0
  br i1 %97, label %110, label %98

; <label>:98:                                     ; preds = %91
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 9)
  %99 = add i64 %pgocount7, 1
  store i64 %99, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 9)
  %100 = load %struct.flagent*, %struct.flagent** %21, align 8
  %101 = getelementptr inbounds %struct.flagent, %struct.flagent* %100, i32 0, i32 1
  %102 = load i8*, i8** %101, align 8
  %103 = load i8*, i8** %10, align 8
  %104 = load i32, i32* %23, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds i8, i8* %103, i64 %105
  %107 = call i32 @strcmp(i8* %102, i8* %106) #5
  %108 = icmp eq i32 %107, 0
  br i1 %108, label %._crit_edge, label %463

._crit_edge:                                      ; preds = %98
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 0)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 0)
  br label %110

; <label>:110:                                    ; preds = %._crit_edge, %91
  %111 = load i32, i32* %23, align 4
  %112 = load %struct.flagent*, %struct.flagent** %21, align 8
  %113 = getelementptr inbounds %struct.flagent, %struct.flagent* %112, i32 0, i32 3
  %114 = load i16, i16* %113, align 2
  %115 = sext i16 %114 to i32
  %116 = add nsw i32 %111, %115
  %117 = load %struct.flagent*, %struct.flagent** %21, align 8
  %118 = getelementptr inbounds %struct.flagent, %struct.flagent* %117, i32 0, i32 5
  %119 = load i16, i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = icmp sge i32 %116, %120
  br i1 %121, label %122, label %463

; <label>:122:                                    ; preds = %110
  %123 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %124 = load i8*, i8** %10, align 8
  %125 = call i8* @strcpy(i8* %123, i8* %124) #4
  %126 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %127 = load i32, i32* %23, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i8, i8* %126, i64 %128
  store i8* %129, i8** %17, align 8
  %130 = load %struct.flagent*, %struct.flagent** %21, align 8
  %131 = getelementptr inbounds %struct.flagent, %struct.flagent* %130, i32 0, i32 3
  %132 = load i16, i16* %131, align 2
  %133 = icmp ne i16 %132, 0
  br i1 %133, label %134, label %151

; <label>:134:                                    ; preds = %122
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 11)
  %135 = add i64 %pgocount9, 1
  store i64 %135, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 11)
  %136 = load i8*, i8** %17, align 8
  %137 = load %struct.flagent*, %struct.flagent** %21, align 8
  %138 = getelementptr inbounds %struct.flagent, %struct.flagent* %137, i32 0, i32 0
  %139 = load i8*, i8** %138, align 8
  %140 = call i8* @strcpy(i8* %136, i8* %139) #4
  %141 = load %struct.flagent*, %struct.flagent** %21, align 8
  %142 = getelementptr inbounds %struct.flagent, %struct.flagent* %141, i32 0, i32 3
  %143 = load i16, i16* %142, align 2
  %144 = sext i16 %143 to i32
  %145 = load i32, i32* %23, align 4
  %146 = add nsw i32 %145, %144
  store i32 %146, i32* %23, align 4
  %147 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %148 = load i32, i32* %23, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i8, i8* %147, i64 %149
  store i8* %150, i8** %17, align 8
  br label %154

; <label>:151:                                    ; preds = %122
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 14)
  %152 = add i64 %pgocount10, 1
  store i64 %152, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 14)
  %153 = load i8*, i8** %17, align 8
  store i8 0, i8* %153, align 1
  br label %154

; <label>:154:                                    ; preds = %151, %134
  %155 = load %struct.flagent*, %struct.flagent** %21, align 8
  %156 = getelementptr inbounds %struct.flagent, %struct.flagent* %155, i32 0, i32 5
  %157 = load i16, i16* %156, align 2
  %158 = sext i16 %157 to i32
  store i32 %158, i32* %18, align 4
  br label %159

; <label>:159:                                    ; preds = %179, %154
  %160 = load i32, i32* %18, align 4
  %161 = add nsw i32 %160, -1
  store i32 %161, i32* %18, align 4
  %162 = icmp sge i32 %161, 0
  br i1 %162, label %163, label %181

; <label>:163:                                    ; preds = %159
  %164 = load %struct.flagent*, %struct.flagent** %21, align 8
  %165 = getelementptr inbounds %struct.flagent, %struct.flagent* %164, i32 0, i32 7
  %166 = load i8*, i8** %17, align 8
  %167 = getelementptr inbounds i8, i8* %166, i32 -1
  store i8* %167, i8** %17, align 8
  %168 = load i8, i8* %167, align 1
  %169 = zext i8 %168 to i64
  %170 = getelementptr inbounds [228 x i8], [228 x i8]* %165, i64 0, i64 %169
  %171 = load i8, i8* %170, align 1
  %172 = sext i8 %171 to i32
  %173 = load i32, i32* %18, align 4
  %174 = shl i32 1, %173
  %175 = and i32 %172, %174
  %176 = icmp eq i32 %175, 0
  br i1 %176, label %177, label %179

; <label>:177:                                    ; preds = %163
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 12)
  %178 = add i64 %pgocount11, 1
  store i64 %178, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 12)
  br label %181

; <label>:179:                                    ; preds = %163
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 1)
  %180 = add i64 %pgocount12, 1
  store i64 %180, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 1)
  br label %159

; <label>:181:                                    ; preds = %177, %159
  %182 = load i32, i32* %18, align 4
  %183 = icmp slt i32 %182, 0
  br i1 %183, label %184, label %462

; <label>:184:                                    ; preds = %181
  %185 = load i32, i32* @cflag, align 4
  %186 = icmp ne i32 %185, 0
  br i1 %186, label %187, label %229

; <label>:187:                                    ; preds = %184
  %188 = load i32, i32* %13, align 4
  %189 = and i32 %188, 1
  %190 = icmp ne i32 %189, 0
  br i1 %190, label %191, label %216

; <label>:191:                                    ; preds = %187
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 15)
  %192 = add i64 %pgocount13, 1
  store i64 %192, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 15)
  %193 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %194 = load %struct.flagent*, %struct.flagent** %14, align 8
  %195 = getelementptr inbounds %struct.flagent, %struct.flagent* %194, i32 0, i32 2
  %196 = load i16, i16* %195, align 8
  %197 = sext i16 %196 to i32
  %198 = add nsw i32 %197, 65
  %199 = load %struct.flagent*, %struct.flagent** %14, align 8
  %200 = getelementptr inbounds %struct.flagent, %struct.flagent* %199, i32 0, i32 3
  %201 = load i16, i16* %200, align 2
  %202 = sext i16 %201 to i32
  %203 = load %struct.flagent*, %struct.flagent** %14, align 8
  %204 = getelementptr inbounds %struct.flagent, %struct.flagent* %203, i32 0, i32 4
  %205 = load i16, i16* %204, align 4
  %206 = sext i16 %205 to i32
  %207 = load %struct.flagent*, %struct.flagent** %21, align 8
  %208 = getelementptr inbounds %struct.flagent, %struct.flagent* %207, i32 0, i32 2
  %209 = load i16, i16* %208, align 8
  %210 = sext i16 %209 to i32
  %211 = add nsw i32 %210, 65
  %212 = load %struct.flagent*, %struct.flagent** %21, align 8
  %213 = getelementptr inbounds %struct.flagent, %struct.flagent* %212, i32 0, i32 4
  %214 = load i16, i16* %213, align 4
  %215 = sext i16 %214 to i32
  call void @flagpr(i8* %193, i32 %198, i32 %202, i32 %206, i32 %211, i32 %215)
  br label %228

; <label>:216:                                    ; preds = %187
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 16)
  %217 = add i64 %pgocount14, 1
  store i64 %217, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 16)
  %218 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %219 = load %struct.flagent*, %struct.flagent** %21, align 8
  %220 = getelementptr inbounds %struct.flagent, %struct.flagent* %219, i32 0, i32 2
  %221 = load i16, i16* %220, align 8
  %222 = sext i16 %221 to i32
  %223 = add nsw i32 %222, 65
  %224 = load %struct.flagent*, %struct.flagent** %21, align 8
  %225 = getelementptr inbounds %struct.flagent, %struct.flagent* %224, i32 0, i32 4
  %226 = load i16, i16* %225, align 4
  %227 = sext i16 %226 to i32
  call void @flagpr(i8* %218, i32 -1, i32 0, i32 0, i32 %223, i32 %227)
  br label %228

; <label>:228:                                    ; preds = %216, %191
  br label %461

; <label>:229:                                    ; preds = %184
  %230 = load i32, i32* %15, align 4
  %231 = icmp ne i32 %230, 0
  br i1 %231, label %232, label %385

; <label>:232:                                    ; preds = %229
  %233 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %234 = call %struct.dent* @lookup(i8* %233, i32 1)
  store %struct.dent* %234, %struct.dent** %19, align 8
  %235 = icmp ne %struct.dent* %234, null
  br i1 %235, label %236, label %383

; <label>:236:                                    ; preds = %232
  %237 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  store i8* %237, i8** %17, align 8
  %238 = load i32, i32* %13, align 4
  %239 = and i32 %238, 1
  %240 = icmp ne i32 %239, 0
  br i1 %240, label %241, label %264

; <label>:241:                                    ; preds = %236
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 22)
  %242 = add i64 %pgocount15, 1
  store i64 %242, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 22)
  %243 = load %struct.flagent*, %struct.flagent** %14, align 8
  %244 = getelementptr inbounds %struct.flagent, %struct.flagent* %243, i32 0, i32 4
  %245 = load i16, i16* %244, align 4
  %246 = sext i16 %245 to i32
  %247 = icmp ne i32 %246, 0
  br i1 %247, label %248, label %264

; <label>:248:                                    ; preds = %241
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 27)
  %249 = add i64 %pgocount16, 1
  store i64 %249, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 27)
  %250 = load i8*, i8** %17, align 8
  %251 = load %struct.flagent*, %struct.flagent** %14, align 8
  %252 = getelementptr inbounds %struct.flagent, %struct.flagent* %251, i32 0, i32 1
  %253 = load i8*, i8** %252, align 8
  %254 = call i8* @strcpy(i8* %250, i8* %253) #4
  %255 = load %struct.flagent*, %struct.flagent** %14, align 8
  %256 = getelementptr inbounds %struct.flagent, %struct.flagent* %255, i32 0, i32 4
  %257 = load i16, i16* %256, align 4
  %258 = sext i16 %257 to i32
  %259 = load i8*, i8** %17, align 8
  %260 = sext i32 %258 to i64
  %261 = getelementptr inbounds i8, i8* %259, i64 %260
  store i8* %261, i8** %17, align 8
  %262 = load i8*, i8** %17, align 8
  %263 = getelementptr inbounds i8, i8* %262, i32 1
  store i8* %263, i8** %17, align 8
  store i8 43, i8* %262, align 1
  br label %264

; <label>:264:                                    ; preds = %248, %241, %236
  %265 = load i8*, i8** %17, align 8
  %266 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %267 = ptrtoint i8* %265 to i64
  %268 = ptrtoint i8* %266 to i64
  %269 = sub i64 %267, %268
  %270 = trunc i64 %269 to i32
  store i32 %270, i32* %22, align 4
  %271 = load i8*, i8** %17, align 8
  %272 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %273 = call i8* @strcpy(i8* %271, i8* %272) #4
  %274 = load i32, i32* %23, align 4
  %275 = load i8*, i8** %17, align 8
  %276 = sext i32 %274 to i64
  %277 = getelementptr inbounds i8, i8* %275, i64 %276
  store i8* %277, i8** %17, align 8
  %278 = load i32, i32* %13, align 4
  %279 = and i32 %278, 1
  %280 = icmp ne i32 %279, 0
  br i1 %280, label %281, label %304

; <label>:281:                                    ; preds = %264
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 23)
  %282 = add i64 %pgocount17, 1
  store i64 %282, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 23)
  %283 = load %struct.flagent*, %struct.flagent** %14, align 8
  %284 = getelementptr inbounds %struct.flagent, %struct.flagent* %283, i32 0, i32 3
  %285 = load i16, i16* %284, align 2
  %286 = sext i16 %285 to i32
  %287 = icmp ne i32 %286, 0
  br i1 %287, label %288, label %304

; <label>:288:                                    ; preds = %281
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 28)
  %289 = add i64 %pgocount18, 1
  store i64 %289, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 28)
  %290 = load i8*, i8** %17, align 8
  %291 = getelementptr inbounds i8, i8* %290, i32 1
  store i8* %291, i8** %17, align 8
  store i8 45, i8* %290, align 1
  %292 = load i8*, i8** %17, align 8
  %293 = load %struct.flagent*, %struct.flagent** %14, align 8
  %294 = getelementptr inbounds %struct.flagent, %struct.flagent* %293, i32 0, i32 0
  %295 = load i8*, i8** %294, align 8
  %296 = call i8* @strcpy(i8* %292, i8* %295) #4
  %297 = load %struct.flagent*, %struct.flagent** %14, align 8
  %298 = getelementptr inbounds %struct.flagent, %struct.flagent* %297, i32 0, i32 3
  %299 = load i16, i16* %298, align 2
  %300 = sext i16 %299 to i32
  %301 = load i8*, i8** %17, align 8
  %302 = sext i32 %300 to i64
  %303 = getelementptr inbounds i8, i8* %301, i64 %302
  store i8* %303, i8** %17, align 8
  br label %304

; <label>:304:                                    ; preds = %288, %281, %264
  %305 = load %struct.flagent*, %struct.flagent** %21, align 8
  %306 = getelementptr inbounds %struct.flagent, %struct.flagent* %305, i32 0, i32 3
  %307 = load i16, i16* %306, align 2
  %308 = icmp ne i16 %307, 0
  br i1 %308, label %309, label %325

; <label>:309:                                    ; preds = %304
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 19)
  %310 = add i64 %pgocount19, 1
  store i64 %310, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 19)
  %311 = load i8*, i8** %17, align 8
  %312 = getelementptr inbounds i8, i8* %311, i32 1
  store i8* %312, i8** %17, align 8
  store i8 45, i8* %311, align 1
  %313 = load i8*, i8** %17, align 8
  %314 = load %struct.flagent*, %struct.flagent** %21, align 8
  %315 = getelementptr inbounds %struct.flagent, %struct.flagent* %314, i32 0, i32 0
  %316 = load i8*, i8** %315, align 8
  %317 = call i8* @strcpy(i8* %313, i8* %316) #4
  %318 = load %struct.flagent*, %struct.flagent** %21, align 8
  %319 = getelementptr inbounds %struct.flagent, %struct.flagent* %318, i32 0, i32 3
  %320 = load i16, i16* %319, align 2
  %321 = sext i16 %320 to i32
  %322 = load i8*, i8** %17, align 8
  %323 = sext i32 %321 to i64
  %324 = getelementptr inbounds i8, i8* %322, i64 %323
  store i8* %324, i8** %17, align 8
  br label %325

; <label>:325:                                    ; preds = %309, %304
  %326 = load %struct.flagent*, %struct.flagent** %21, align 8
  %327 = getelementptr inbounds %struct.flagent, %struct.flagent* %326, i32 0, i32 4
  %328 = load i16, i16* %327, align 4
  %329 = icmp ne i16 %328, 0
  br i1 %329, label %330, label %346

; <label>:330:                                    ; preds = %325
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 20)
  %331 = add i64 %pgocount20, 1
  store i64 %331, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 20)
  %332 = load i8*, i8** %17, align 8
  %333 = getelementptr inbounds i8, i8* %332, i32 1
  store i8* %333, i8** %17, align 8
  store i8 43, i8* %332, align 1
  %334 = load i8*, i8** %17, align 8
  %335 = load %struct.flagent*, %struct.flagent** %21, align 8
  %336 = getelementptr inbounds %struct.flagent, %struct.flagent* %335, i32 0, i32 1
  %337 = load i8*, i8** %336, align 8
  %338 = call i8* @strcpy(i8* %334, i8* %337) #4
  %339 = load %struct.flagent*, %struct.flagent** %21, align 8
  %340 = getelementptr inbounds %struct.flagent, %struct.flagent* %339, i32 0, i32 4
  %341 = load i16, i16* %340, align 4
  %342 = sext i16 %341 to i32
  %343 = load i8*, i8** %17, align 8
  %344 = sext i32 %342 to i64
  %345 = getelementptr inbounds i8, i8* %343, i64 %344
  store i8* %345, i8** %17, align 8
  br label %346

; <label>:346:                                    ; preds = %330, %325
  %347 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %348 = load i8*, i8** %9, align 8
  %349 = load i32, i32* %13, align 4
  %350 = and i32 %349, 1
  %351 = icmp ne i32 %350, 0
  br i1 %351, label %352, label %358

; <label>:352:                                    ; preds = %346
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 24)
  %353 = add i64 %pgocount21, 1
  store i64 %353, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 24)
  %354 = load %struct.flagent*, %struct.flagent** %14, align 8
  %355 = getelementptr inbounds %struct.flagent, %struct.flagent* %354, i32 0, i32 3
  %356 = load i16, i16* %355, align 2
  %357 = sext i16 %356 to i32
  br label %360

; <label>:358:                                    ; preds = %346
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 25)
  %359 = add i64 %pgocount22, 1
  store i64 %359, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 25)
  br label %360

; <label>:360:                                    ; preds = %358, %352
  %361 = phi i32 [ %357, %352 ], [ 0, %358 ]
  %362 = load i32, i32* %22, align 4
  %363 = load %struct.flagent*, %struct.flagent** %21, align 8
  %364 = getelementptr inbounds %struct.flagent, %struct.flagent* %363, i32 0, i32 3
  %365 = load i16, i16* %364, align 2
  %366 = sext i16 %365 to i32
  %367 = load i8*, i8** %17, align 8
  %368 = getelementptr inbounds [184 x i8], [184 x i8]* %25, i32 0, i32 0
  %369 = ptrtoint i8* %367 to i64
  %370 = ptrtoint i8* %368 to i64
  %371 = sub i64 %369, %370
  %372 = load i32, i32* %23, align 4
  %373 = sext i32 %372 to i64
  %374 = sub nsw i64 %371, %373
  %375 = load i32, i32* %22, align 4
  %376 = sext i32 %375 to i64
  %377 = sub nsw i64 %374, %376
  %378 = trunc i64 %377 to i32
  %379 = load %struct.dent*, %struct.dent** %19, align 8
  %380 = load %struct.flagent*, %struct.flagent** %14, align 8
  %381 = load %struct.flagent*, %struct.flagent** %21, align 8
  %382 = call i32 @ins_root_cap(i8* %347, i8* %348, i32 %361, i32 %362, i32 %366, i32 %378, %struct.dent* %379, %struct.flagent* %380, %struct.flagent* %381)
  br label %383

; <label>:383:                                    ; preds = %360, %232
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 17)
  %384 = add i64 %pgocount23, 1
  store i64 %384, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 17)
  br label %460

; <label>:385:                                    ; preds = %229
  %386 = getelementptr inbounds [184 x i8], [184 x i8]* %24, i32 0, i32 0
  %387 = call %struct.dent* @lookup(i8* %386, i32 1)
  store %struct.dent* %387, %struct.dent** %19, align 8
  %388 = icmp ne %struct.dent* %387, null
  br i1 %388, label %389, label %458

; <label>:389:                                    ; preds = %385
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 21)
  %390 = add i64 %pgocount24, 1
  store i64 %390, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 21)
  %391 = load %struct.dent*, %struct.dent** %19, align 8
  %392 = getelementptr inbounds %struct.dent, %struct.dent* %391, i32 0, i32 2
  %393 = getelementptr inbounds [1 x i64], [1 x i64]* %392, i64 0, i64 0
  %394 = load i64, i64* %393, align 8
  %395 = load %struct.flagent*, %struct.flagent** %21, align 8
  %396 = getelementptr inbounds %struct.flagent, %struct.flagent* %395, i32 0, i32 2
  %397 = load i16, i16* %396, align 8
  %398 = sext i16 %397 to i32
  %399 = zext i32 %398 to i64
  %400 = shl i64 1, %399
  %401 = and i64 %394, %400
  %402 = icmp ne i64 %401, 0
  br i1 %402, label %403, label %458

; <label>:403:                                    ; preds = %389
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 26)
  %404 = add i64 %pgocount25, 1
  store i64 %404, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 26)
  %405 = load i32, i32* %13, align 4
  %406 = and i32 %405, 1
  %407 = icmp eq i32 %406, 0
  br i1 %407, label %422, label %408

; <label>:408:                                    ; preds = %403
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 30)
  %409 = add i64 %pgocount26, 1
  store i64 %409, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 30)
  %410 = load %struct.dent*, %struct.dent** %19, align 8
  %411 = getelementptr inbounds %struct.dent, %struct.dent* %410, i32 0, i32 2
  %412 = getelementptr inbounds [1 x i64], [1 x i64]* %411, i64 0, i64 0
  %413 = load i64, i64* %412, align 8
  %414 = load %struct.flagent*, %struct.flagent** %14, align 8
  %415 = getelementptr inbounds %struct.flagent, %struct.flagent* %414, i32 0, i32 2
  %416 = load i16, i16* %415, align 8
  %417 = sext i16 %416 to i32
  %418 = zext i32 %417 to i64
  %419 = shl i64 1, %418
  %420 = and i64 %413, %419
  %421 = icmp ne i64 %420, 0
  br i1 %421, label %422, label %458

; <label>:422:                                    ; preds = %408, %403
  %423 = load i32, i32* @numhits, align 4
  %424 = icmp slt i32 %423, 10
  br i1 %424, label %425, label %444

; <label>:425:                                    ; preds = %422
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 31)
  %426 = add i64 %pgocount27, 1
  store i64 %426, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 31)
  %427 = load %struct.dent*, %struct.dent** %19, align 8
  %428 = load i32, i32* @numhits, align 4
  %429 = sext i32 %428 to i64
  %430 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %429
  %431 = getelementptr inbounds %struct.success, %struct.success* %430, i32 0, i32 0
  store %struct.dent* %427, %struct.dent** %431, align 8
  %432 = load %struct.flagent*, %struct.flagent** %14, align 8
  %433 = load i32, i32* @numhits, align 4
  %434 = sext i32 %433 to i64
  %435 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %434
  %436 = getelementptr inbounds %struct.success, %struct.success* %435, i32 0, i32 1
  store %struct.flagent* %432, %struct.flagent** %436, align 8
  %437 = load %struct.flagent*, %struct.flagent** %21, align 8
  %438 = load i32, i32* @numhits, align 4
  %439 = sext i32 %438 to i64
  %440 = getelementptr inbounds [10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 %439
  %441 = getelementptr inbounds %struct.success, %struct.success* %440, i32 0, i32 2
  store %struct.flagent* %437, %struct.flagent** %441, align 8
  %442 = load i32, i32* @numhits, align 4
  %443 = add nsw i32 %442, 1
  store i32 %443, i32* @numhits, align 4
  br label %444

; <label>:444:                                    ; preds = %425, %422
  %445 = load i32, i32* %16, align 4
  %446 = icmp ne i32 %445, 0
  br i1 %446, label %456, label %447

; <label>:447:                                    ; preds = %444
  %448 = load i8*, i8** %9, align 8
  %449 = load i32, i32* %11, align 4
  %450 = call i32 @cap_ok(i8* %448, %struct.success* getelementptr inbounds ([10 x %struct.success], [10 x %struct.success]* @hits, i64 0, i64 0), i32 %449)
  %451 = icmp ne i32 %450, 0
  br i1 %451, label %452, label %454

; <label>:452:                                    ; preds = %447
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 33)
  %453 = add i64 %pgocount28, 1
  store i64 %453, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 33)
  br label %470

; <label>:454:                                    ; preds = %447
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 32)
  %455 = add i64 %pgocount29, 1
  store i64 %455, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 32)
  store i32 0, i32* @numhits, align 4
  br label %456

; <label>:456:                                    ; preds = %454, %444
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 29)
  %457 = add i64 %pgocount30, 1
  store i64 %457, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 29)
  br label %458

; <label>:458:                                    ; preds = %456, %408, %389, %385
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 18)
  %459 = add i64 %pgocount31, 1
  store i64 %459, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 18)
  br label %460

; <label>:460:                                    ; preds = %458, %383
  br label %461

; <label>:461:                                    ; preds = %460, %228
  br label %462

; <label>:462:                                    ; preds = %461, %181
  br label %463

; <label>:463:                                    ; preds = %462, %110, %98, %82
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 3)
  %464 = add i64 %pgocount32, 1
  store i64 %464, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 3)
  br label %465

; <label>:465:                                    ; preds = %463, %80, %65, %51
  %466 = load %struct.flagent*, %struct.flagent** %21, align 8
  %467 = getelementptr inbounds %struct.flagent, %struct.flagent* %466, i32 1
  store %struct.flagent* %467, %struct.flagent** %21, align 8
  %468 = load i32, i32* %20, align 4
  %469 = add nsw i32 %468, -1
  store i32 %469, i32* %20, align 4
  br label %36

; <label>:470:                                    ; preds = %452, %36
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 13)
  %471 = add i64 %pgocount33, 1
  store i64 %471, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_tmp1.ll_suf_list_chk, i64 0, i64 13)
  ret void
}

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: nounwind uwtable
define internal void @forcelc(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  br label %5

; <label>:5:                                      ; preds = %16, %2
  %6 = load i32, i32* %4, align 4
  %7 = add nsw i32 %6, -1
  store i32 %7, i32* %4, align 4
  %8 = icmp sge i32 %7, 0
  br i1 %8, label %9, label %20

; <label>:9:                                      ; preds = %5
  %10 = load i8*, i8** %3, align 8
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 21), i64 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = load i8*, i8** %3, align 8
  store i8 %14, i8* %15, align 1
  br label %16

; <label>:16:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_forcelc, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_forcelc, i64 0, i64 0)
  %18 = load i8*, i8** %3, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 1
  store i8* %19, i8** %3, align 8
  br label %5

; <label>:20:                                     ; preds = %5
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_forcelc, i64 0, i64 1)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_forcelc, i64 0, i64 1)
  ret void
}

declare i32 @printf(i8*, ...) #3

declare i8* @ichartosstr(i8*, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

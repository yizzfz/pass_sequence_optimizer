; ModuleID = 'tmp1.ll'
source_filename = "darray.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.darray_t = type { i8*, i32, i32, i16, i16 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [63 x i8] c"$Id: darray.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@darray_id = global i8* getelementptr inbounds ([63 x i8], [63 x i8]* @.str, i32 0, i32 0), align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_darray_free = private constant [11 x i8] c"darray_free"
@__profn_Darray_find = private constant [11 x i8] c"Darray_find"
@__profn_darray_delete = private constant [13 x i8] c"darray_delete"
@__profn_tmp1.ll_darray_find = private constant [19 x i8] c"tmp1.ll:darray_find"
@__profc_darray_free = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_darray_free = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6716655085910481536, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_darray_free, i32 0, i32 0), i8* bitcast (void (%struct.darray_t*)* @darray_free to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_Darray_find = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_Darray_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8608266835842550716, i64 139807554447, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i32 0, i32 0), i8* bitcast (i8* (%struct.darray_t*, i32)* @Darray_find to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_darray_delete = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_darray_delete = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5311318738258772007, i64 56622256881, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i32 0, i32 0), i8* bitcast (i32 (%struct.darray_t*, i32)* @darray_delete to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_darray_find = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_darray_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4594349971239127650, i64 38490985531, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00darray_free\01Darray_find\01darray_delete\01tmp1.ll:darray_find", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_darray_free to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_Darray_find to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_darray_delete to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_darray_find to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @darray_free(%struct.darray_t*) #0 {
  %2 = alloca %struct.darray_t*, align 8
  store %struct.darray_t* %0, %struct.darray_t** %2, align 8
  %3 = load %struct.darray_t*, %struct.darray_t** %2, align 8
  %4 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %3, i32 0, i32 0
  %5 = load i8*, i8** %4, align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %14

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_darray_free, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_darray_free, i64 0, i64 1)
  %9 = load %struct.darray_t*, %struct.darray_t** %2, align 8
  %10 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %9, i32 0, i32 0
  %11 = load i8*, i8** %10, align 8
  call void @free(i8* %11) #4
  %12 = load %struct.darray_t*, %struct.darray_t** %2, align 8
  %13 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %12, i32 0, i32 0
  store i8* null, i8** %13, align 8
  br label %14

; <label>:14:                                     ; preds = %7, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_darray_free, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_darray_free, i64 0, i64 0)
  %16 = load %struct.darray_t*, %struct.darray_t** %2, align 8
  %17 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %16, i32 0, i32 2
  store i32 0, i32* %17, align 4
  %18 = load %struct.darray_t*, %struct.darray_t** %2, align 8
  %19 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %18, i32 0, i32 1
  store i32 0, i32* %19, align 8
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @Darray_find(%struct.darray_t*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %10 = load i32, i32* %5, align 4
  %11 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %12 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %11, i32 0, i32 2
  %13 = load i32, i32* %12, align 4
  %14 = icmp uge i32 %10, %13
  br i1 %14, label %22, label %15

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 1)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 1)
  %17 = load i32, i32* %5, align 4
  %18 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %19 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 8
  %21 = icmp uge i32 %17, %20
  br i1 %21, label %22, label %136

; <label>:22:                                     ; preds = %15, %2
  %23 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %24 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %23, i32 0, i32 1
  %25 = load i32, i32* %24, align 8
  %26 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %27 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %26, i32 0, i32 3
  %28 = load i16, i16* %27, align 8
  %29 = zext i16 %28 to i32
  %30 = mul i32 %25, %29
  store i32 %30, i32* %6, align 4
  %31 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %32 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %31, i32 0, i32 3
  %33 = load i16, i16* %32, align 8
  %34 = icmp ne i16 %33, 0
  br i1 %34, label %37, label %35

; <label>:35:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 9)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 9)
  call void @abort() #5
  unreachable

; <label>:37:                                     ; preds = %22
  %38 = load i32, i32* %5, align 4
  %39 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %40 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %39, i32 0, i32 2
  %41 = load i32, i32* %40, align 4
  %42 = icmp uge i32 %38, %41
  br i1 %42, label %43, label %104

; <label>:43:                                     ; preds = %37
  %44 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %45 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %44, i32 0, i32 4
  %46 = load i16, i16* %45, align 2
  %47 = zext i16 %46 to i32
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %54

; <label>:49:                                     ; preds = %43
  %50 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %51 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %50, i32 0, i32 4
  %52 = load i16, i16* %51, align 2
  %53 = zext i16 %52 to i32
  br label %56

; <label>:54:                                     ; preds = %43
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 7)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 7)
  br label %56

; <label>:56:                                     ; preds = %54, %49
  %57 = phi i32 [ %53, %49 ], [ 1, %54 ]
  store i32 %57, i32* %8, align 4
  %58 = load i32, i32* %5, align 4
  %59 = load i32, i32* %8, align 4
  %60 = add i32 %58, %59
  %61 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %62 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %61, i32 0, i32 3
  %63 = load i16, i16* %62, align 8
  %64 = zext i16 %63 to i32
  %65 = mul i32 %60, %64
  store i32 %65, i32* %7, align 4
  %66 = zext i32 %65 to i64
  %67 = call noalias i8* @malloc(i64 %66) #4
  store i8* %67, i8** %9, align 8
  %68 = load i8*, i8** %9, align 8
  %69 = icmp ne i8* %68, null
  br i1 %69, label %70, label %100

; <label>:70:                                     ; preds = %56
  %71 = load i32, i32* %6, align 4
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %81

; <label>:73:                                     ; preds = %70
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 5)
  %74 = add i64 %pgocount3, 1
  store i64 %74, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 5)
  %75 = load i8*, i8** %9, align 8
  %76 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %77 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %76, i32 0, i32 0
  %78 = load i8*, i8** %77, align 8
  %79 = load i32, i32* %6, align 4
  %80 = zext i32 %79 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %75, i8* %78, i64 %80, i32 1, i1 false)
  br label %81

; <label>:81:                                     ; preds = %73, %70
  %82 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %83 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %82, i32 0, i32 0
  %84 = load i8*, i8** %83, align 8
  %85 = icmp ne i8* %84, null
  br i1 %85, label %86, label %91

; <label>:86:                                     ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 6)
  %87 = add i64 %pgocount4, 1
  store i64 %87, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 6)
  %88 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %89 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %88, i32 0, i32 0
  %90 = load i8*, i8** %89, align 8
  call void @free(i8* %90) #4
  br label %91

; <label>:91:                                     ; preds = %86, %81
  %92 = load i8*, i8** %9, align 8
  %93 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %94 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %93, i32 0, i32 0
  store i8* %92, i8** %94, align 8
  %95 = load i32, i32* %5, align 4
  %96 = load i32, i32* %8, align 4
  %97 = add i32 %95, %96
  %98 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %99 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %98, i32 0, i32 2
  store i32 %97, i32* %99, align 4
  br label %102

; <label>:100:                                    ; preds = %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 8)
  %101 = add i64 %pgocount5, 1
  store i64 %101, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 8)
  store i8* null, i8** %3, align 8
  br label %149

; <label>:102:                                    ; preds = %91
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 4)
  %103 = add i64 %pgocount6, 1
  store i64 %103, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 4)
  br label %113

; <label>:104:                                    ; preds = %37
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 2)
  %105 = add i64 %pgocount7, 1
  store i64 %105, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 2)
  %106 = load i32, i32* %5, align 4
  %107 = add i32 %106, 1
  %108 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %109 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %108, i32 0, i32 3
  %110 = load i16, i16* %109, align 8
  %111 = zext i16 %110 to i32
  %112 = mul i32 %107, %111
  store i32 %112, i32* %7, align 4
  br label %113

; <label>:113:                                    ; preds = %104, %102
  %114 = load i32, i32* %5, align 4
  %115 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %116 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %115, i32 0, i32 1
  %117 = load i32, i32* %116, align 8
  %118 = icmp uge i32 %114, %117
  br i1 %118, label %119, label %135

; <label>:119:                                    ; preds = %113
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 3)
  %120 = add i64 %pgocount8, 1
  store i64 %120, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 3)
  %121 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %122 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %121, i32 0, i32 0
  %123 = load i8*, i8** %122, align 8
  %124 = load i32, i32* %6, align 4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds i8, i8* %123, i64 %125
  %127 = load i32, i32* %7, align 4
  %128 = load i32, i32* %6, align 4
  %129 = sub i32 %127, %128
  %130 = zext i32 %129 to i64
  call void @llvm.memset.p0i8.i64(i8* %126, i8 0, i64 %130, i32 1, i1 false)
  %131 = load i32, i32* %5, align 4
  %132 = add i32 %131, 1
  %133 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %134 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %133, i32 0, i32 1
  store i32 %132, i32* %134, align 8
  br label %135

; <label>:135:                                    ; preds = %119, %113
  br label %136

; <label>:136:                                    ; preds = %135, %15
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 0)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_Darray_find, i64 0, i64 0)
  %138 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %139 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %138, i32 0, i32 0
  %140 = load i8*, i8** %139, align 8
  %141 = load i32, i32* %5, align 4
  %142 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %143 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %142, i32 0, i32 3
  %144 = load i16, i16* %143, align 8
  %145 = zext i16 %144 to i32
  %146 = mul i32 %141, %145
  %147 = zext i32 %146 to i64
  %148 = getelementptr inbounds i8, i8* %140, i64 %147
  store i8* %148, i8** %3, align 8
  br label %149

; <label>:149:                                    ; preds = %136, %100
  %150 = load i8*, i8** %3, align 8
  ret i8* %150
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline nounwind uwtable
define i32 @darray_delete(%struct.darray_t*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i8*, align 8
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %8 = load i32, i32* %5, align 4
  %9 = call i8* @darray_find(%struct.darray_t* %7, i32 %8)
  store i8* %9, i8** %6, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = icmp ne i8* %10, null
  br i1 %11, label %12, label %59

; <label>:12:                                     ; preds = %2
  %13 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %14 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %13, i32 0, i32 1
  %15 = load i32, i32* %14, align 8
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %57

; <label>:17:                                     ; preds = %12
  %18 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %19 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %18, i32 0, i32 1
  %20 = load i32, i32* %19, align 8
  %21 = add i32 %20, -1
  store i32 %21, i32* %19, align 8
  br label %22

; <label>:22:                                     ; preds = %29, %17
  %23 = load i32, i32* %5, align 4
  %24 = add i32 %23, 1
  store i32 %24, i32* %5, align 4
  %25 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %26 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %25, i32 0, i32 1
  %27 = load i32, i32* %26, align 8
  %28 = icmp ult i32 %23, %27
  br i1 %28, label %29, label %50

; <label>:29:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 0)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 0)
  %31 = load i8*, i8** %6, align 8
  %32 = load i8*, i8** %6, align 8
  %33 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %34 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %33, i32 0, i32 3
  %35 = load i16, i16* %34, align 8
  %36 = zext i16 %35 to i32
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds i8, i8* %32, i64 %37
  %39 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %40 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %39, i32 0, i32 3
  %41 = load i16, i16* %40, align 8
  %42 = zext i16 %41 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %31, i8* %38, i64 %42, i32 1, i1 false)
  %43 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %44 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %43, i32 0, i32 3
  %45 = load i16, i16* %44, align 8
  %46 = zext i16 %45 to i32
  %47 = load i8*, i8** %6, align 8
  %48 = sext i32 %46 to i64
  %49 = getelementptr inbounds i8, i8* %47, i64 %48
  store i8* %49, i8** %6, align 8
  br label %22

; <label>:50:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 1)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 1)
  %52 = load i8*, i8** %6, align 8
  %53 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %54 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %53, i32 0, i32 3
  %55 = load i16, i16* %54, align 8
  %56 = zext i16 %55 to i64
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 %56, i32 1, i1 false)
  store i32 1, i32* %3, align 4
  br label %61

; <label>:57:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 3)
  %58 = add i64 %pgocount2, 1
  store i64 %58, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 3)
  call void @abort() #5
  unreachable

; <label>:59:                                     ; preds = %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_darray_delete, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %61

; <label>:61:                                     ; preds = %59, %50
  %62 = load i32, i32* %3, align 4
  ret i32 %62
}

; Function Attrs: noinline nounwind uwtable
define internal i8* @darray_find(%struct.darray_t*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca %struct.darray_t*, align 8
  %5 = alloca i32, align 4
  store %struct.darray_t* %0, %struct.darray_t** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %8 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %7, i32 0, i32 2
  %9 = load i32, i32* %8, align 4
  %10 = icmp ult i32 %6, %9
  br i1 %10, label %11, label %31

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 1)
  %13 = load i32, i32* %5, align 4
  %14 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %15 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  %17 = icmp ult i32 %13, %16
  br i1 %17, label %18, label %31

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 2)
  %20 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %21 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %20, i32 0, i32 0
  %22 = load i8*, i8** %21, align 8
  %23 = load i32, i32* %5, align 4
  %24 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %25 = getelementptr inbounds %struct.darray_t, %struct.darray_t* %24, i32 0, i32 3
  %26 = load i16, i16* %25, align 8
  %27 = zext i16 %26 to i32
  %28 = mul i32 %23, %27
  %29 = zext i32 %28 to i64
  %30 = getelementptr inbounds i8, i8* %22, i64 %29
  store i8* %30, i8** %3, align 8
  br label %36

; <label>:31:                                     ; preds = %11, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_darray_find, i64 0, i64 0)
  %33 = load %struct.darray_t*, %struct.darray_t** %4, align 8
  %34 = load i32, i32* %5, align 4
  %35 = call i8* @Darray_find(%struct.darray_t* %33, i32 %34)
  store i8* %35, i8** %3, align 8
  br label %36

; <label>:36:                                     ; preds = %31, %18
  %37 = load i8*, i8** %3, align 8
  ret i8* %37
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'jutils.2.ll'
source_filename = "jutils.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@jpeg_natural_order = constant [80 x i32] [i32 0, i32 1, i32 8, i32 16, i32 9, i32 2, i32 3, i32 10, i32 17, i32 24, i32 32, i32 25, i32 18, i32 11, i32 4, i32 5, i32 12, i32 19, i32 26, i32 33, i32 40, i32 48, i32 41, i32 34, i32 27, i32 20, i32 13, i32 6, i32 7, i32 14, i32 21, i32 28, i32 35, i32 42, i32 49, i32 56, i32 57, i32 50, i32 43, i32 36, i32 29, i32 22, i32 15, i32 23, i32 30, i32 37, i32 44, i32 51, i32 58, i32 59, i32 52, i32 45, i32 38, i32 31, i32 39, i32 46, i32 53, i32 60, i32 61, i32 54, i32 47, i32 55, i32 62, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jdiv_round_up = private constant [13 x i8] c"jdiv_round_up"
@__profn_jround_up = private constant [9 x i8] c"jround_up"
@__profn_jcopy_sample_rows = private constant [17 x i8] c"jcopy_sample_rows"
@__profn_jcopy_block_row = private constant [15 x i8] c"jcopy_block_row"
@__profn_jzero_far = private constant [9 x i8] c"jzero_far"
@__profc_jdiv_round_up = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jdiv_round_up = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1963101366598563268, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jdiv_round_up, i32 0, i32 0), i8* bitcast (i64 (i64, i64)* @jdiv_round_up to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jround_up = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jround_up = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3214851438347407949, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jround_up, i32 0, i32 0), i8* bitcast (i64 (i64, i64)* @jround_up to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jcopy_sample_rows = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jcopy_sample_rows = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7849802045973099851, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jcopy_sample_rows, i32 0, i32 0), i8* bitcast (void (i8**, i32, i8**, i32, i32, i32)* @jcopy_sample_rows to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jcopy_block_row = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jcopy_block_row = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3327884894076559936, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jcopy_block_row, i32 0, i32 0), i8* bitcast (void ([64 x i16]*, [64 x i16]*, i32)* @jcopy_block_row to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jzero_far = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jzero_far = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2785040349035789971, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jzero_far, i32 0, i32 0), i8* bitcast (void (i8*, i64)* @jzero_far to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [69 x i8] c"C\00jdiv_round_up\01jround_up\01jcopy_sample_rows\01jcopy_block_row\01jzero_far", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jdiv_round_up to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jround_up to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jcopy_sample_rows to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jcopy_block_row to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jzero_far to i8*), i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i64 @jdiv_round_up(i64, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jdiv_round_up, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jdiv_round_up, i64 0, i64 0)
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %4, align 8
  %7 = load i64, i64* %5, align 8
  %8 = add nsw i64 %6, %7
  %9 = sub nsw i64 %8, 1
  %10 = load i64, i64* %5, align 8
  %11 = sdiv i64 %9, %10
  ret i64 %11
}

; Function Attrs: noinline nounwind uwtable
define i64 @jround_up(i64, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jround_up, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jround_up, i64 0, i64 0)
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, i64* %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i64, i64* %5, align 8
  %7 = sub nsw i64 %6, 1
  %8 = load i64, i64* %4, align 8
  %9 = add nsw i64 %8, %7
  store i64 %9, i64* %4, align 8
  %10 = load i64, i64* %4, align 8
  %11 = load i64, i64* %4, align 8
  %12 = load i64, i64* %5, align 8
  %13 = srem i64 %11, %12
  %14 = sub nsw i64 %10, %13
  ret i64 %14
}

; Function Attrs: noinline nounwind uwtable
define void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #0 {
  %7 = alloca i8**, align 8
  %8 = alloca i32, align 4
  %9 = alloca i8**, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i8*, align 8
  %14 = alloca i8*, align 8
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  store i8** %0, i8*** %7, align 8
  store i32 %1, i32* %8, align 4
  store i8** %2, i8*** %9, align 8
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %17 = load i32, i32* %12, align 4
  %18 = zext i32 %17 to i64
  %19 = mul i64 %18, 1
  store i64 %19, i64* %15, align 8
  %20 = load i32, i32* %8, align 4
  %21 = load i8**, i8*** %7, align 8
  %22 = sext i32 %20 to i64
  %23 = getelementptr inbounds i8*, i8** %21, i64 %22
  store i8** %23, i8*** %7, align 8
  %24 = load i32, i32* %10, align 4
  %25 = load i8**, i8*** %9, align 8
  %26 = sext i32 %24 to i64
  %27 = getelementptr inbounds i8*, i8** %25, i64 %26
  store i8** %27, i8*** %9, align 8
  %28 = load i32, i32* %11, align 4
  store i32 %28, i32* %16, align 4
  br label %29

; <label>:29:                                     ; preds = %42, %6
  %30 = load i32, i32* %16, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %32, label %46

; <label>:32:                                     ; preds = %29
  %33 = load i8**, i8*** %7, align 8
  %34 = getelementptr inbounds i8*, i8** %33, i32 1
  store i8** %34, i8*** %7, align 8
  %35 = load i8*, i8** %33, align 8
  store i8* %35, i8** %13, align 8
  %36 = load i8**, i8*** %9, align 8
  %37 = getelementptr inbounds i8*, i8** %36, i32 1
  store i8** %37, i8*** %9, align 8
  %38 = load i8*, i8** %36, align 8
  store i8* %38, i8** %14, align 8
  %39 = load i8*, i8** %14, align 8
  %40 = load i8*, i8** %13, align 8
  %41 = load i64, i64* %15, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %39, i8* %40, i64 %41, i32 1, i1 false)
  br label %42

; <label>:42:                                     ; preds = %32
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jcopy_sample_rows, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jcopy_sample_rows, i64 0, i64 0)
  %44 = load i32, i32* %16, align 4
  %45 = add nsw i32 %44, -1
  store i32 %45, i32* %16, align 4
  br label %29

; <label>:46:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jcopy_sample_rows, i64 0, i64 1)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jcopy_sample_rows, i64 0, i64 1)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define void @jcopy_block_row([64 x i16]*, [64 x i16]*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jcopy_block_row, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jcopy_block_row, i64 0, i64 0)
  %5 = alloca [64 x i16]*, align 8
  %6 = alloca [64 x i16]*, align 8
  %7 = alloca i32, align 4
  store [64 x i16]* %0, [64 x i16]** %5, align 8
  store [64 x i16]* %1, [64 x i16]** %6, align 8
  store i32 %2, i32* %7, align 4
  %8 = load [64 x i16]*, [64 x i16]** %6, align 8
  %9 = bitcast [64 x i16]* %8 to i8*
  %10 = load [64 x i16]*, [64 x i16]** %5, align 8
  %11 = bitcast [64 x i16]* %10 to i8*
  %12 = load i32, i32* %7, align 4
  %13 = zext i32 %12 to i64
  %14 = mul i64 %13, 128
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %9, i8* %11, i64 %14, i32 1, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jzero_far(i8*, i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jzero_far, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jzero_far, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i64, align 8
  store i8* %0, i8** %4, align 8
  store i64 %1, i64* %5, align 8
  %6 = load i8*, i8** %4, align 8
  %7 = load i64, i64* %5, align 8
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %7, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

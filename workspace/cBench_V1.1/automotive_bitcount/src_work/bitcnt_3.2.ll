; ModuleID = 'tmp1.ll'
source_filename = "bitcnt_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }

$__llvm_profile_raw_version = comdat any

@bits = internal global [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_ntbl_bitcount = private constant [13 x i8] c"ntbl_bitcount"
@__profn_BW_btbl_bitcount = private constant [16 x i8] c"BW_btbl_bitcount"
@__profn_AR_btbl_bitcount = private constant [16 x i8] c"AR_btbl_bitcount"
@__profc_ntbl_bitcount = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ntbl_bitcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -786141232039470214, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ntbl_bitcount, i32 0, i32 0), i8* bitcast (i32 (i64)* @ntbl_bitcount to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BW_btbl_bitcount = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BW_btbl_bitcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8915236106534507225, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BW_btbl_bitcount, i32 0, i32 0), i8* bitcast (i32 (i64)* @BW_btbl_bitcount to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_AR_btbl_bitcount = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_AR_btbl_bitcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1739263631994884047, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_AR_btbl_bitcount, i32 0, i32 0), i8* bitcast (i32 (i64)* @AR_btbl_bitcount to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [34 x i8] c"/ x\DA\CB+I\CA\89O\CA,I\CE/\CD+at\0A\8FOB\11p\0CB\15\00\00\B3y\12:", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ntbl_bitcount to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BW_btbl_bitcount to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_AR_btbl_bitcount to i8*), i8* getelementptr inbounds ([34 x i8], [34 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @ntbl_bitcount(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ntbl_bitcount, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_ntbl_bitcount, i64 0, i64 0)
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = and i64 %4, 15
  %6 = trunc i64 %5 to i32
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = load i64, i64* %3, align 8
  %12 = and i64 %11, 240
  %13 = lshr i64 %12, 4
  %14 = trunc i64 %13 to i32
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %15
  %17 = load i8, i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = add nsw i32 %10, %18
  %20 = load i64, i64* %3, align 8
  %21 = and i64 %20, 3840
  %22 = lshr i64 %21, 8
  %23 = trunc i64 %22 to i32
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %24
  %26 = load i8, i8* %25, align 1
  %27 = sext i8 %26 to i32
  %28 = add nsw i32 %19, %27
  %29 = load i64, i64* %3, align 8
  %30 = and i64 %29, 61440
  %31 = lshr i64 %30, 12
  %32 = trunc i64 %31 to i32
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = add nsw i32 %28, %36
  %38 = load i64, i64* %3, align 8
  %39 = and i64 %38, 983040
  %40 = lshr i64 %39, 16
  %41 = trunc i64 %40 to i32
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %42
  %44 = load i8, i8* %43, align 1
  %45 = sext i8 %44 to i32
  %46 = add nsw i32 %37, %45
  %47 = load i64, i64* %3, align 8
  %48 = and i64 %47, 15728640
  %49 = lshr i64 %48, 20
  %50 = trunc i64 %49 to i32
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %51
  %53 = load i8, i8* %52, align 1
  %54 = sext i8 %53 to i32
  %55 = add nsw i32 %46, %54
  %56 = load i64, i64* %3, align 8
  %57 = and i64 %56, 251658240
  %58 = lshr i64 %57, 24
  %59 = trunc i64 %58 to i32
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = sext i8 %62 to i32
  %64 = add nsw i32 %55, %63
  %65 = load i64, i64* %3, align 8
  %66 = and i64 %65, 4026531840
  %67 = lshr i64 %66, 28
  %68 = trunc i64 %67 to i32
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = sext i8 %71 to i32
  %73 = add nsw i32 %64, %72
  ret i32 %73
}

; Function Attrs: nounwind uwtable
define i32 @BW_btbl_bitcount(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BW_btbl_bitcount, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BW_btbl_bitcount, i64 0, i64 0)
  %3 = alloca i64, align 8
  %4 = alloca %union.anon, align 8
  store i64 %0, i64* %3, align 8
  %5 = load i64, i64* %3, align 8
  %6 = bitcast %union.anon* %4 to i64*
  store i64 %5, i64* %6, align 8
  %7 = bitcast %union.anon* %4 to [4 x i8]*
  %8 = getelementptr inbounds [4 x i8], [4 x i8]* %7, i64 0, i64 0
  %9 = load i8, i8* %8, align 8
  %10 = zext i8 %9 to i64
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = bitcast %union.anon* %4 to [4 x i8]*
  %15 = getelementptr inbounds [4 x i8], [4 x i8]* %14, i64 0, i64 1
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i64
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = add nsw i32 %13, %20
  %22 = bitcast %union.anon* %4 to [4 x i8]*
  %23 = getelementptr inbounds [4 x i8], [4 x i8]* %22, i64 0, i64 3
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = add nsw i32 %21, %28
  %30 = bitcast %union.anon* %4 to [4 x i8]*
  %31 = getelementptr inbounds [4 x i8], [4 x i8]* %30, i64 0, i64 2
  %32 = load i8, i8* %31, align 2
  %33 = zext i8 %32 to i64
  %34 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = sext i8 %35 to i32
  %37 = add nsw i32 %29, %36
  ret i32 %37
}

; Function Attrs: nounwind uwtable
define i32 @AR_btbl_bitcount(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_AR_btbl_bitcount, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_AR_btbl_bitcount, i64 0, i64 0)
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i64 %0, i64* %3, align 8
  %6 = bitcast i64* %3 to i8*
  store i8* %6, i8** %4, align 8
  %7 = load i8*, i8** %4, align 8
  %8 = getelementptr inbounds i8, i8* %7, i32 1
  store i8* %8, i8** %4, align 8
  %9 = load i8, i8* %7, align 1
  %10 = zext i8 %9 to i64
  %11 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %10
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  store i32 %13, i32* %5, align 4
  %14 = load i8*, i8** %4, align 8
  %15 = getelementptr inbounds i8, i8* %14, i32 1
  store i8* %15, i8** %4, align 8
  %16 = load i8, i8* %14, align 1
  %17 = zext i8 %16 to i64
  %18 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %17
  %19 = load i8, i8* %18, align 1
  %20 = sext i8 %19 to i32
  %21 = load i32, i32* %5, align 4
  %22 = add nsw i32 %21, %20
  store i32 %22, i32* %5, align 4
  %23 = load i8*, i8** %4, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %4, align 8
  %25 = load i8, i8* %23, align 1
  %26 = zext i8 %25 to i64
  %27 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = sext i8 %28 to i32
  %30 = load i32, i32* %5, align 4
  %31 = add nsw i32 %30, %29
  store i32 %31, i32* %5, align 4
  %32 = load i8*, i8** %4, align 8
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %34
  %36 = load i8, i8* %35, align 1
  %37 = sext i8 %36 to i32
  %38 = load i32, i32* %5, align 4
  %39 = add nsw i32 %38, %37
  store i32 %39, i32* %5, align 4
  %40 = load i32, i32* %5, align 4
  ret i32 %40
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

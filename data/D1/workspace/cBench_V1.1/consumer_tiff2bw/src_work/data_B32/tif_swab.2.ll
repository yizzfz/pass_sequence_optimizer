; ModuleID = 'tmp1.ll'
source_filename = "tif_swab.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@TIFFBitRevTable = internal constant [256 x i8] c"\00\80@\C0 \A0`\E0\10\90P\D00\B0p\F0\08\88H\C8(\A8h\E8\18\98X\D88\B8x\F8\04\84D\C4$\A4d\E4\14\94T\D44\B4t\F4\0C\8CL\CC,\ACl\EC\1C\9C\5C\DC<\BC|\FC\02\82B\C2\22\A2b\E2\12\92R\D22\B2r\F2\0A\8AJ\CA*\AAj\EA\1A\9AZ\DA:\BAz\FA\06\86F\C6&\A6f\E6\16\96V\D66\B6v\F6\0E\8EN\CE.\AEn\EE\1E\9E^\DE>\BE~\FE\01\81A\C1!\A1a\E1\11\91Q\D11\B1q\F1\09\89I\C9)\A9i\E9\19\99Y\D99\B9y\F9\05\85E\C5%\A5e\E5\15\95U\D55\B5u\F5\0D\8DM\CD-\ADm\ED\1D\9D]\DD=\BD}\FD\03\83C\C3#\A3c\E3\13\93S\D33\B3s\F3\0B\8BK\CB+\ABk\EB\1B\9B[\DB;\BB{\FB\07\87G\C7'\A7g\E7\17\97W\D77\B7w\F7\0F\8FO\CF/\AFo\EF\1F\9F_\DF?\BF\7F\FF", align 16
@TIFFNoBitRevTable = internal constant [256 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B\0C\0D\0E\0F\10\11\12\13\14\15\16\17\18\19\1A\1B\1C\1D\1E\1F !\22#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\5C]^_`abcdefghijklmnopqrstuvwxyz{|}~\7F\80\81\82\83\84\85\86\87\88\89\8A\8B\8C\8D\8E\8F\90\91\92\93\94\95\96\97\98\99\9A\9B\9C\9D\9E\9F\A0\A1\A2\A3\A4\A5\A6\A7\A8\A9\AA\AB\AC\AD\AE\AF\B0\B1\B2\B3\B4\B5\B6\B7\B8\B9\BA\BB\BC\BD\BE\BF\C0\C1\C2\C3\C4\C5\C6\C7\C8\C9\CA\CB\CC\CD\CE\CF\D0\D1\D2\D3\D4\D5\D6\D7\D8\D9\DA\DB\DC\DD\DE\DF\E0\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\EB\EC\ED\EE\EF\F0\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA\FB\FC\FD\FE\FF", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFSwabShort = private constant [13 x i8] c"TIFFSwabShort"
@__profn_TIFFSwabLong = private constant [12 x i8] c"TIFFSwabLong"
@__profn_TIFFSwabArrayOfShort = private constant [20 x i8] c"TIFFSwabArrayOfShort"
@__profn_TIFFSwabArrayOfLong = private constant [19 x i8] c"TIFFSwabArrayOfLong"
@__profn_TIFFSwabDouble = private constant [14 x i8] c"TIFFSwabDouble"
@__profn_TIFFSwabArrayOfDouble = private constant [21 x i8] c"TIFFSwabArrayOfDouble"
@__profn_TIFFGetBitRevTable = private constant [18 x i8] c"TIFFGetBitRevTable"
@__profn_TIFFReverseBits = private constant [15 x i8] c"TIFFReverseBits"
@__profc_TIFFSwabShort = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabShort = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2733025255689358264, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabShort, i32 0, i32 0), i8* bitcast (void (i16*)* @TIFFSwabShort to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSwabLong = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabLong = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1966572850049188543, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabLong, i32 0, i32 0), i8* bitcast (void (i32*)* @TIFFSwabLong to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSwabArrayOfShort = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabArrayOfShort = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6254066249961145427, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfShort, i32 0, i32 0), i8* bitcast (void (i16*, i64)* @TIFFSwabArrayOfShort to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSwabArrayOfLong = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabArrayOfLong = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 345288362255187469, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfLong, i32 0, i32 0), i8* bitcast (void (i32*, i64)* @TIFFSwabArrayOfLong to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSwabDouble = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabDouble = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 749246310483266528, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabDouble, i32 0, i32 0), i8* bitcast (void (double*)* @TIFFSwabDouble to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFSwabArrayOfDouble = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSwabArrayOfDouble = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5829109406218506512, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfDouble, i32 0, i32 0), i8* bitcast (void (double*, i64)* @TIFFSwabArrayOfDouble to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFGetBitRevTable = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFGetBitRevTable = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3070880749470633213, i64 72057606922829823, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFGetBitRevTable, i32 0, i32 0), i8* bitcast (i8* (i32)* @TIFFGetBitRevTable to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFReverseBits = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFReverseBits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5545644545858251785, i64 48729118588, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i32 0, i32 0), i8* bitcast (void (i8*, i64)* @TIFFReverseBits to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [142 x i8] c"\8B\01\00TIFFSwabShort\01TIFFSwabLong\01TIFFSwabArrayOfShort\01TIFFSwabArrayOfLong\01TIFFSwabDouble\01TIFFSwabArrayOfDouble\01TIFFGetBitRevTable\01TIFFReverseBits", section "__llvm_prf_names"
@llvm.used = appending global [9 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabShort to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabLong to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabArrayOfShort to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabArrayOfLong to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabDouble to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSwabArrayOfDouble to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFGetBitRevTable to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFReverseBits to i8*), i8* getelementptr inbounds ([142 x i8], [142 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabShort(i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabShort, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabShort, i64 0, i64 0)
  %3 = alloca i16*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  %6 = load i16*, i16** %3, align 8
  %7 = bitcast i16* %6 to i8*
  store i8* %7, i8** %4, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 1
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i32
  store i32 %11, i32* %5, align 4
  %12 = load i8*, i8** %4, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = load i8, i8* %13, align 1
  %15 = load i8*, i8** %4, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  store i8 %14, i8* %16, align 1
  %17 = load i32, i32* %5, align 4
  %18 = trunc i32 %17 to i8
  %19 = load i8*, i8** %4, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  store i8 %18, i8* %20, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabLong(i32*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabLong, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabLong, i64 0, i64 0)
  %3 = alloca i32*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  %6 = load i32*, i32** %3, align 8
  %7 = bitcast i32* %6 to i8*
  store i8* %7, i8** %4, align 8
  %8 = load i8*, i8** %4, align 8
  %9 = getelementptr inbounds i8, i8* %8, i64 3
  %10 = load i8, i8* %9, align 1
  %11 = zext i8 %10 to i32
  store i32 %11, i32* %5, align 4
  %12 = load i8*, i8** %4, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 0
  %14 = load i8, i8* %13, align 1
  %15 = load i8*, i8** %4, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 3
  store i8 %14, i8* %16, align 1
  %17 = load i32, i32* %5, align 4
  %18 = trunc i32 %17 to i8
  %19 = load i8*, i8** %4, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  store i8 %18, i8* %20, align 1
  %21 = load i8*, i8** %4, align 8
  %22 = getelementptr inbounds i8, i8* %21, i64 2
  %23 = load i8, i8* %22, align 1
  %24 = zext i8 %23 to i32
  store i32 %24, i32* %5, align 4
  %25 = load i8*, i8** %4, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 1
  %27 = load i8, i8* %26, align 1
  %28 = load i8*, i8** %4, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 2
  store i8 %27, i8* %29, align 1
  %30 = load i32, i32* %5, align 4
  %31 = trunc i32 %30 to i8
  %32 = load i8*, i8** %4, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  store i8 %31, i8* %33, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabArrayOfShort(i16*, i64) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  store i64 %1, i64* %4, align 8
  br label %7

; <label>:7:                                      ; preds = %11, %2
  %8 = load i64, i64* %4, align 8
  %9 = add i64 %8, -1
  store i64 %9, i64* %4, align 8
  %10 = icmp ugt i64 %8, 0
  br i1 %10, label %11, label %30

; <label>:11:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfShort, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfShort, i64 0, i64 0)
  %13 = load i16*, i16** %3, align 8
  %14 = bitcast i16* %13 to i8*
  store i8* %14, i8** %5, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 1
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  store i32 %18, i32* %6, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %5, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 1
  store i8 %21, i8* %23, align 1
  %24 = load i32, i32* %6, align 4
  %25 = trunc i32 %24 to i8
  %26 = load i8*, i8** %5, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 0
  store i8 %25, i8* %27, align 1
  %28 = load i16*, i16** %3, align 8
  %29 = getelementptr inbounds i16, i16* %28, i32 1
  store i16* %29, i16** %3, align 8
  br label %7

; <label>:30:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfShort, i64 0, i64 1)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfShort, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabArrayOfLong(i32*, i64) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i64 %1, i64* %4, align 8
  br label %7

; <label>:7:                                      ; preds = %11, %2
  %8 = load i64, i64* %4, align 8
  %9 = add i64 %8, -1
  store i64 %9, i64* %4, align 8
  %10 = icmp ugt i64 %8, 0
  br i1 %10, label %11, label %43

; <label>:11:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfLong, i64 0, i64 0)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfLong, i64 0, i64 0)
  %13 = load i32*, i32** %3, align 8
  %14 = bitcast i32* %13 to i8*
  store i8* %14, i8** %5, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 3
  %17 = load i8, i8* %16, align 1
  %18 = zext i8 %17 to i32
  store i32 %18, i32* %6, align 4
  %19 = load i8*, i8** %5, align 8
  %20 = getelementptr inbounds i8, i8* %19, i64 0
  %21 = load i8, i8* %20, align 1
  %22 = load i8*, i8** %5, align 8
  %23 = getelementptr inbounds i8, i8* %22, i64 3
  store i8 %21, i8* %23, align 1
  %24 = load i32, i32* %6, align 4
  %25 = trunc i32 %24 to i8
  %26 = load i8*, i8** %5, align 8
  %27 = getelementptr inbounds i8, i8* %26, i64 0
  store i8 %25, i8* %27, align 1
  %28 = load i8*, i8** %5, align 8
  %29 = getelementptr inbounds i8, i8* %28, i64 2
  %30 = load i8, i8* %29, align 1
  %31 = zext i8 %30 to i32
  store i32 %31, i32* %6, align 4
  %32 = load i8*, i8** %5, align 8
  %33 = getelementptr inbounds i8, i8* %32, i64 1
  %34 = load i8, i8* %33, align 1
  %35 = load i8*, i8** %5, align 8
  %36 = getelementptr inbounds i8, i8* %35, i64 2
  store i8 %34, i8* %36, align 1
  %37 = load i32, i32* %6, align 4
  %38 = trunc i32 %37 to i8
  %39 = load i8*, i8** %5, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 1
  store i8 %38, i8* %40, align 1
  %41 = load i32*, i32** %3, align 8
  %42 = getelementptr inbounds i32, i32* %41, i32 1
  store i32* %42, i32** %3, align 8
  br label %7

; <label>:43:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfLong, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfLong, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabDouble(double*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabDouble, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSwabDouble, i64 0, i64 0)
  %3 = alloca double*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  store double* %0, double** %3, align 8
  %6 = load double*, double** %3, align 8
  %7 = bitcast double* %6 to i32*
  store i32* %7, i32** %4, align 8
  %8 = load i32*, i32** %4, align 8
  call void @TIFFSwabArrayOfLong(i32* %8, i64 2)
  %9 = load i32*, i32** %4, align 8
  %10 = getelementptr inbounds i32, i32* %9, i64 0
  %11 = load i32, i32* %10, align 4
  store i32 %11, i32* %5, align 4
  %12 = load i32*, i32** %4, align 8
  %13 = getelementptr inbounds i32, i32* %12, i64 1
  %14 = load i32, i32* %13, align 4
  %15 = load i32*, i32** %4, align 8
  %16 = getelementptr inbounds i32, i32* %15, i64 0
  store i32 %14, i32* %16, align 4
  %17 = load i32, i32* %5, align 4
  %18 = load i32*, i32** %4, align 8
  %19 = getelementptr inbounds i32, i32* %18, i64 1
  store i32 %17, i32* %19, align 4
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFSwabArrayOfDouble(double*, i64) #0 {
  %3 = alloca double*, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  store double* %0, double** %3, align 8
  store i64 %1, i64* %4, align 8
  %7 = load double*, double** %3, align 8
  %8 = bitcast double* %7 to i32*
  store i32* %8, i32** %5, align 8
  %9 = load i32*, i32** %5, align 8
  %10 = load i64, i64* %4, align 8
  %11 = load i64, i64* %4, align 8
  %12 = add i64 %10, %11
  call void @TIFFSwabArrayOfLong(i32* %9, i64 %12)
  br label %13

; <label>:13:                                     ; preds = %17, %2
  %14 = load i64, i64* %4, align 8
  %15 = add i64 %14, -1
  store i64 %15, i64* %4, align 8
  %16 = icmp ugt i64 %14, 0
  br i1 %16, label %17, label %32

; <label>:17:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfDouble, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfDouble, i64 0, i64 0)
  %19 = load i32*, i32** %5, align 8
  %20 = getelementptr inbounds i32, i32* %19, i64 0
  %21 = load i32, i32* %20, align 4
  store i32 %21, i32* %6, align 4
  %22 = load i32*, i32** %5, align 8
  %23 = getelementptr inbounds i32, i32* %22, i64 1
  %24 = load i32, i32* %23, align 4
  %25 = load i32*, i32** %5, align 8
  %26 = getelementptr inbounds i32, i32* %25, i64 0
  store i32 %24, i32* %26, align 4
  %27 = load i32, i32* %6, align 4
  %28 = load i32*, i32** %5, align 8
  %29 = getelementptr inbounds i32, i32* %28, i64 1
  store i32 %27, i32* %29, align 4
  %30 = load i32*, i32** %5, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 2
  store i32* %31, i32** %5, align 8
  br label %13

; <label>:32:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfDouble, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFSwabArrayOfDouble, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @TIFFGetBitRevTable(i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFGetBitRevTable, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFGetBitRevTable, i64 0, i64 0)
  %3 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 0
  %6 = zext i1 %5 to i64
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFGetBitRevTable, i64 0, i64 1)
  %7 = add i64 %pgocount1, %6
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFGetBitRevTable, i64 0, i64 1)
  %8 = select i1 %5, i8* getelementptr inbounds ([256 x i8], [256 x i8]* @TIFFBitRevTable, i32 0, i32 0), i8* getelementptr inbounds ([256 x i8], [256 x i8]* @TIFFNoBitRevTable, i32 0, i32 0)
  ret i8* %8
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFReverseBits(i8*, i64) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i64, align 8
  store i8* %0, i8** %3, align 8
  store i64 %1, i64* %4, align 8
  br label %5

; <label>:5:                                      ; preds = %75, %2
  %6 = load i64, i64* %4, align 8
  %7 = icmp ugt i64 %6, 8
  br i1 %7, label %8, label %79

; <label>:8:                                      ; preds = %5
  %9 = load i8*, i8** %3, align 8
  %10 = getelementptr inbounds i8, i8* %9, i64 0
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %12
  %14 = load i8, i8* %13, align 1
  %15 = load i8*, i8** %3, align 8
  %16 = getelementptr inbounds i8, i8* %15, i64 0
  store i8 %14, i8* %16, align 1
  %17 = load i8*, i8** %3, align 8
  %18 = getelementptr inbounds i8, i8* %17, i64 1
  %19 = load i8, i8* %18, align 1
  %20 = zext i8 %19 to i64
  %21 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %20
  %22 = load i8, i8* %21, align 1
  %23 = load i8*, i8** %3, align 8
  %24 = getelementptr inbounds i8, i8* %23, i64 1
  store i8 %22, i8* %24, align 1
  %25 = load i8*, i8** %3, align 8
  %26 = getelementptr inbounds i8, i8* %25, i64 2
  %27 = load i8, i8* %26, align 1
  %28 = zext i8 %27 to i64
  %29 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %28
  %30 = load i8, i8* %29, align 1
  %31 = load i8*, i8** %3, align 8
  %32 = getelementptr inbounds i8, i8* %31, i64 2
  store i8 %30, i8* %32, align 1
  %33 = load i8*, i8** %3, align 8
  %34 = getelementptr inbounds i8, i8* %33, i64 3
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %36
  %38 = load i8, i8* %37, align 1
  %39 = load i8*, i8** %3, align 8
  %40 = getelementptr inbounds i8, i8* %39, i64 3
  store i8 %38, i8* %40, align 1
  %41 = load i8*, i8** %3, align 8
  %42 = getelementptr inbounds i8, i8* %41, i64 4
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %44
  %46 = load i8, i8* %45, align 1
  %47 = load i8*, i8** %3, align 8
  %48 = getelementptr inbounds i8, i8* %47, i64 4
  store i8 %46, i8* %48, align 1
  %49 = load i8*, i8** %3, align 8
  %50 = getelementptr inbounds i8, i8* %49, i64 5
  %51 = load i8, i8* %50, align 1
  %52 = zext i8 %51 to i64
  %53 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %52
  %54 = load i8, i8* %53, align 1
  %55 = load i8*, i8** %3, align 8
  %56 = getelementptr inbounds i8, i8* %55, i64 5
  store i8 %54, i8* %56, align 1
  %57 = load i8*, i8** %3, align 8
  %58 = getelementptr inbounds i8, i8* %57, i64 6
  %59 = load i8, i8* %58, align 1
  %60 = zext i8 %59 to i64
  %61 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %60
  %62 = load i8, i8* %61, align 1
  %63 = load i8*, i8** %3, align 8
  %64 = getelementptr inbounds i8, i8* %63, i64 6
  store i8 %62, i8* %64, align 1
  %65 = load i8*, i8** %3, align 8
  %66 = getelementptr inbounds i8, i8* %65, i64 7
  %67 = load i8, i8* %66, align 1
  %68 = zext i8 %67 to i64
  %69 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %68
  %70 = load i8, i8* %69, align 1
  %71 = load i8*, i8** %3, align 8
  %72 = getelementptr inbounds i8, i8* %71, i64 7
  store i8 %70, i8* %72, align 1
  %73 = load i8*, i8** %3, align 8
  %74 = getelementptr inbounds i8, i8* %73, i64 8
  store i8* %74, i8** %3, align 8
  br label %75

; <label>:75:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 0)
  %76 = add i64 %pgocount, 1
  store i64 %76, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 0)
  %77 = load i64, i64* %4, align 8
  %78 = sub i64 %77, 8
  store i64 %78, i64* %4, align 8
  br label %5

; <label>:79:                                     ; preds = %5
  br label %80

; <label>:80:                                     ; preds = %84, %79
  %81 = load i64, i64* %4, align 8
  %82 = add i64 %81, -1
  store i64 %82, i64* %4, align 8
  %83 = icmp ugt i64 %81, 0
  br i1 %83, label %84, label %94

; <label>:84:                                     ; preds = %80
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 1)
  %85 = add i64 %pgocount1, 1
  store i64 %85, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 1)
  %86 = load i8*, i8** %3, align 8
  %87 = load i8, i8* %86, align 1
  %88 = zext i8 %87 to i64
  %89 = getelementptr inbounds [256 x i8], [256 x i8]* @TIFFBitRevTable, i64 0, i64 %88
  %90 = load i8, i8* %89, align 1
  %91 = load i8*, i8** %3, align 8
  store i8 %90, i8* %91, align 1
  %92 = load i8*, i8** %3, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %3, align 8
  br label %80

; <label>:94:                                     ; preds = %80
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 2)
  %95 = add i64 %pgocount2, 1
  store i64 %95, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_TIFFReverseBits, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

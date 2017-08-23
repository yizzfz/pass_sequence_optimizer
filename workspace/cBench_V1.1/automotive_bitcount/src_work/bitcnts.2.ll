; ModuleID = 'tmp1.ll'
source_filename = "bitcnts.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@main1.pBitCntFunc = internal global [7 x i32 (i64)*] [i32 (i64)* @bit_count, i32 (i64)* @bitcount, i32 (i64)* @ntbl_bitcnt, i32 (i64)* @ntbl_bitcount, i32 (i64)* @BW_btbl_bitcount, i32 (i64)* @AR_btbl_bitcount, i32 (i64)* @bit_shifter], align 16
@main1.text = internal global [7 x i8*] [i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str.1, i32 0, i32 0), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str.6, i32 0, i32 0)], align 16
@.str = private unnamed_addr constant [29 x i8] c"Optimized 1 bit/loop counter\00", align 1
@.str.1 = private unnamed_addr constant [26 x i8] c"Ratko's mystery algorithm\00", align 1
@.str.2 = private unnamed_addr constant [31 x i8] c"Recursive bit count by nybbles\00", align 1
@.str.3 = private unnamed_addr constant [35 x i8] c"Non-recursive bit count by nybbles\00", align 1
@.str.4 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (BW)\00", align 1
@.str.5 = private unnamed_addr constant [38 x i8] c"Non-recursive bit count by bytes (AR)\00", align 1
@.str.6 = private unnamed_addr constant [21 x i8] c"Shift and count bits\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.7 = private unnamed_addr constant [29 x i8] c"Usage: bitcnts <iterations>\0A\00", align 1
@.str.8 = private unnamed_addr constant [33 x i8] c"Bit counter algorithm benchmark\0A\00", align 1
@.str.9 = private unnamed_addr constant [18 x i8] c"%-38s> Bits: %ld\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main1 = private constant [5 x i8] c"main1"
@__profn_tmp1.ll_bit_shifter = private constant [19 x i8] c"tmp1.ll:bit_shifter"
@__profc_main1 = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_main1 = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_main1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1389521736752106184, i64 281567418008286, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i32 0, i32 0), i8* bitcast (i32 (i32, i8**, i32)* @main1 to i8*), i8* bitcast ([1 x i64]* @__profvp_main1 to i8*), i32 6, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_bit_shifter = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_bit_shifter = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1296417616186567699, i64 46417144834, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i32 0, i32 0), i8* bitcast (i32 (i64)* @bit_shifter to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [35 x i8] c"\19!x\DA\CBM\CC\CC3d,\C9-0\D4\CB\C9\B1J\CA,\89/\CE\C8L+I-\02\00q\94\09-", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_bit_shifter to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main1(i32, i8**, i32) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  %10 = alloca i64, align 8
  %11 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  store i32 %2, i32* %6, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp slt i32 %12, 2
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 5)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 5)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:18:                                     ; preds = %3
  %19 = load i8**, i8*** %5, align 8
  %20 = getelementptr inbounds i8*, i8** %19, i64 1
  %21 = load i8*, i8** %20, align 8
  %22 = call i32 @atoi(i8* %21) #6
  store i32 %22, i32* %11, align 4
  %23 = load i32, i32* %6, align 4
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %28

; <label>:25:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 4)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 4)
  %27 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.8, i32 0, i32 0))
  br label %28

; <label>:28:                                     ; preds = %25, %18
  store i32 0, i32* %7, align 4
  br label %29

; <label>:29:                                     ; preds = %67, %28
  %30 = load i32, i32* %7, align 4
  %31 = icmp slt i32 %30, 7
  br i1 %31, label %32, label %71

; <label>:32:                                     ; preds = %29
  store i64 0, i64* %9, align 8
  store i64 0, i64* %8, align 8
  store i64 1, i64* %10, align 8
  br label %33

; <label>:33:                                     ; preds = %49, %32
  %34 = load i64, i64* %8, align 8
  %35 = load i32, i32* %11, align 4
  %36 = sext i32 %35 to i64
  %37 = icmp slt i64 %34, %36
  br i1 %37, label %38, label %55

; <label>:38:                                     ; preds = %33
  %39 = load i32, i32* %7, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [7 x i32 (i64)*], [7 x i32 (i64)*]* @main1.pBitCntFunc, i64 0, i64 %40
  %42 = load i32 (i64)*, i32 (i64)** %41, align 8
  %43 = load i64, i64* %10, align 8
  %44 = ptrtoint i32 (i64)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %44, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main1 to i8*), i32 0)
  %45 = call i32 %42(i64 %43)
  %46 = sext i32 %45 to i64
  %47 = load i64, i64* %9, align 8
  %48 = add nsw i64 %47, %46
  store i64 %48, i64* %9, align 8
  br label %49

; <label>:49:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 0)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 0)
  %51 = load i64, i64* %8, align 8
  %52 = add nsw i64 %51, 1
  store i64 %52, i64* %8, align 8
  %53 = load i64, i64* %10, align 8
  %54 = add nsw i64 %53, 13
  store i64 %54, i64* %10, align 8
  br label %33

; <label>:55:                                     ; preds = %33
  %56 = load i32, i32* %6, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %66

; <label>:58:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 2)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 2)
  %60 = load i32, i32* %7, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [7 x i8*], [7 x i8*]* @main1.text, i64 0, i64 %61
  %63 = load i8*, i8** %62, align 8
  %64 = load i64, i64* %9, align 8
  %65 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i32 0, i32 0), i8* %63, i64 %64)
  br label %66

; <label>:66:                                     ; preds = %58, %55
  br label %67

; <label>:67:                                     ; preds = %66
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 1)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 1)
  %69 = load i32, i32* %7, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %7, align 4
  br label %29

; <label>:71:                                     ; preds = %29
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 3)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_main1, i64 0, i64 3)
  ret i32 0
}

declare i32 @bit_count(i64) #1

declare i32 @bitcount(i64) #1

declare i32 @ntbl_bitcnt(i64) #1

declare i32 @ntbl_bitcount(i64) #1

declare i32 @BW_btbl_bitcount(i64) #1

declare i32 @AR_btbl_bitcount(i64) #1

; Function Attrs: nounwind uwtable
define internal i32 @bit_shifter(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %3, align 4
  br label %5

; <label>:5:                                      ; preds = %21, %1
  %6 = load i64, i64* %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 1)
  %10 = load i32, i32* %3, align 4
  %11 = sext i32 %10 to i64
  %12 = icmp ult i64 %11, 64
  br label %13

; <label>:13:                                     ; preds = %8, %5
  %14 = phi i1 [ false, %5 ], [ %12, %8 ]
  br i1 %14, label %15, label %27

; <label>:15:                                     ; preds = %13
  %16 = load i64, i64* %2, align 8
  %17 = and i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = load i32, i32* %4, align 4
  %20 = add nsw i32 %19, %18
  store i32 %20, i32* %4, align 4
  br label %21

; <label>:21:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 0)
  %23 = load i32, i32* %3, align 4
  %24 = add nsw i32 %23, 1
  store i32 %24, i32* %3, align 4
  %25 = load i64, i64* %2, align 8
  %26 = ashr i64 %25, 1
  store i64 %26, i64* %2, align 8
  br label %5

; <label>:27:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 2)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_bit_shifter, i64 0, i64 2)
  %29 = load i32, i32* %4, align 4
  ret i32 %29
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @puts(i8*) #1

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }
attributes #6 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

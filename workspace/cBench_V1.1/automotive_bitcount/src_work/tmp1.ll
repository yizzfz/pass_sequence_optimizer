; ModuleID = 'bitcnts.ll'
source_filename = "bitcnts.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

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
  br i1 %13, label %14, label %17

; <label>:14:                                     ; preds = %3
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.7, i32 0, i32 0))
  call void @exit(i32 1) #4
  unreachable

; <label>:17:                                     ; preds = %3
  %18 = load i8**, i8*** %5, align 8
  %19 = getelementptr inbounds i8*, i8** %18, i64 1
  %20 = load i8*, i8** %19, align 8
  %21 = call i32 @atoi(i8* %20) #5
  store i32 %21, i32* %11, align 4
  %22 = load i32, i32* %6, align 4
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %17
  %25 = call i32 @puts(i8* getelementptr inbounds ([33 x i8], [33 x i8]* @.str.8, i32 0, i32 0))
  br label %26

; <label>:26:                                     ; preds = %24, %17
  store i32 0, i32* %7, align 4
  br label %27

; <label>:27:                                     ; preds = %62, %26
  %28 = load i32, i32* %7, align 4
  %29 = icmp slt i32 %28, 7
  br i1 %29, label %30, label %65

; <label>:30:                                     ; preds = %27
  store i64 0, i64* %9, align 8
  store i64 0, i64* %8, align 8
  store i64 1, i64* %10, align 8
  br label %31

; <label>:31:                                     ; preds = %46, %30
  %32 = load i64, i64* %8, align 8
  %33 = load i32, i32* %11, align 4
  %34 = sext i32 %33 to i64
  %35 = icmp slt i64 %32, %34
  br i1 %35, label %36, label %51

; <label>:36:                                     ; preds = %31
  %37 = load i32, i32* %7, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [7 x i32 (i64)*], [7 x i32 (i64)*]* @main1.pBitCntFunc, i64 0, i64 %38
  %40 = load i32 (i64)*, i32 (i64)** %39, align 8
  %41 = load i64, i64* %10, align 8
  %42 = call i32 %40(i64 %41)
  %43 = sext i32 %42 to i64
  %44 = load i64, i64* %9, align 8
  %45 = add nsw i64 %44, %43
  store i64 %45, i64* %9, align 8
  br label %46

; <label>:46:                                     ; preds = %36
  %47 = load i64, i64* %8, align 8
  %48 = add nsw i64 %47, 1
  store i64 %48, i64* %8, align 8
  %49 = load i64, i64* %10, align 8
  %50 = add nsw i64 %49, 13
  store i64 %50, i64* %10, align 8
  br label %31

; <label>:51:                                     ; preds = %31
  %52 = load i32, i32* %6, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %61

; <label>:54:                                     ; preds = %51
  %55 = load i32, i32* %7, align 4
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds [7 x i8*], [7 x i8*]* @main1.text, i64 0, i64 %56
  %58 = load i8*, i8** %57, align 8
  %59 = load i64, i64* %9, align 8
  %60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.9, i32 0, i32 0), i8* %58, i64 %59)
  br label %61

; <label>:61:                                     ; preds = %54, %51
  br label %62

; <label>:62:                                     ; preds = %61
  %63 = load i32, i32* %7, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %7, align 4
  br label %27

; <label>:65:                                     ; preds = %27
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

; <label>:5:                                      ; preds = %20, %1
  %6 = load i64, i64* %2, align 8
  %7 = icmp ne i64 %6, 0
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %5
  %9 = load i32, i32* %3, align 4
  %10 = sext i32 %9 to i64
  %11 = icmp ult i64 %10, 64
  br label %12

; <label>:12:                                     ; preds = %8, %5
  %13 = phi i1 [ false, %5 ], [ %11, %8 ]
  br i1 %13, label %14, label %25

; <label>:14:                                     ; preds = %12
  %15 = load i64, i64* %2, align 8
  %16 = and i64 %15, 1
  %17 = trunc i64 %16 to i32
  %18 = load i32, i32* %4, align 4
  %19 = add nsw i32 %18, %17
  store i32 %19, i32* %4, align 4
  br label %20

; <label>:20:                                     ; preds = %14
  %21 = load i32, i32* %3, align 4
  %22 = add nsw i32 %21, 1
  store i32 %22, i32* %3, align 4
  %23 = load i64, i64* %2, align 8
  %24 = ashr i64 %23, 1
  store i64 %24, i64* %2, align 8
  br label %5

; <label>:25:                                     ; preds = %12
  %26 = load i32, i32* %4, align 4
  ret i32 %26
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: nounwind readonly
declare i32 @atoi(i8*) #3

declare i32 @puts(i8*) #1

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

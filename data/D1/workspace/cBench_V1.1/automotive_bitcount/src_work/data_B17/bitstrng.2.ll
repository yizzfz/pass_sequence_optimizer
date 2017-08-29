; ModuleID = 'tmp1.ll'
source_filename = "bitstrng.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bitstring = private constant [9 x i8] c"bitstring"
@__profc_bitstring = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bitstring = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8697337062985179107, i64 72057666405306535, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i32 0, i32 0), i8* bitcast (void (i8*, i64, i32, i32)* @bitstring to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [11 x i8] c"\09\00bitstring", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bitstring to i8*), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @bitstring(i8*, i64, i32, i32) #0 {
  %5 = alloca i8*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i8* %0, i8** %5, align 8
  store i64 %1, i64* %6, align 8
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %11 = load i32, i32* %8, align 4
  %12 = load i32, i32* %7, align 4
  %13 = load i32, i32* %7, align 4
  %14 = ashr i32 %13, 2
  %15 = add nsw i32 %12, %14
  %16 = load i32, i32* %7, align 4
  %17 = srem i32 %16, 4
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 5)
  %20 = add i64 %pgocount, %19
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 5)
  %21 = select i1 %18, i32 0, i32 1
  %22 = sub nsw i32 %15, %21
  %23 = sub nsw i32 %11, %22
  store i32 %23, i32* %10, align 4
  store i32 0, i32* %9, align 4
  br label %24

; <label>:24:                                     ; preds = %31, %4
  %25 = load i32, i32* %9, align 4
  %26 = load i32, i32* %10, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %35

; <label>:28:                                     ; preds = %24
  %29 = load i8*, i8** %5, align 8
  %30 = getelementptr inbounds i8, i8* %29, i32 1
  store i8* %30, i8** %5, align 8
  store i8 32, i8* %29, align 1
  br label %31

; <label>:31:                                     ; preds = %28
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 0)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 0)
  %33 = load i32, i32* %9, align 4
  %34 = add nsw i32 %33, 1
  store i32 %34, i32* %9, align 4
  br label %24

; <label>:35:                                     ; preds = %24
  br label %36

; <label>:36:                                     ; preds = %61, %35
  %37 = load i32, i32* %7, align 4
  %38 = add nsw i32 %37, -1
  store i32 %38, i32* %7, align 4
  %39 = icmp sge i32 %38, 0
  br i1 %39, label %40, label %63

; <label>:40:                                     ; preds = %36
  %41 = load i64, i64* %6, align 8
  %42 = load i32, i32* %7, align 4
  %43 = zext i32 %42 to i64
  %44 = ashr i64 %41, %43
  %45 = and i64 %44, 1
  %46 = add nsw i64 %45, 48
  %47 = trunc i64 %46 to i8
  %48 = load i8*, i8** %5, align 8
  %49 = getelementptr inbounds i8, i8* %48, i32 1
  store i8* %49, i8** %5, align 8
  store i8 %47, i8* %48, align 1
  %50 = load i32, i32* %7, align 4
  %51 = srem i32 %50, 4
  %52 = icmp ne i32 %51, 0
  br i1 %52, label %61, label %53

; <label>:53:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 2)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 2)
  %55 = load i32, i32* %7, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 3)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 3)
  %59 = load i8*, i8** %5, align 8
  %60 = getelementptr inbounds i8, i8* %59, i32 1
  store i8* %60, i8** %5, align 8
  store i8 32, i8* %59, align 1
  br label %61

; <label>:61:                                     ; preds = %57, %53, %40
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 1)
  %62 = add i64 %pgocount4, 1
  store i64 %62, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 1)
  br label %36

; <label>:63:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 4)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_bitstring, i64 0, i64 4)
  %65 = load i8*, i8** %5, align 8
  store i8 0, i8* %65, align 1
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

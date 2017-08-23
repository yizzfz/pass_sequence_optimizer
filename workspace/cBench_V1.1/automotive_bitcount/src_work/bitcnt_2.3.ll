; ModuleID = 'bitcnt_2.2.ll'
source_filename = "bitcnt_2.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bitcount = private constant [8 x i8] c"bitcount"
@__profc_bitcount = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bitcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6954369411074493370, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bitcount, i32 0, i32 0), i8* bitcast (i32 (i64)* @bitcount to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [18 x i8] c"\08\10x\DAK\CA,I\CE/\CD+\01\00\0F\09\03i", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bitcount to i8*), i8* getelementptr inbounds ([18 x i8], [18 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @bitcount(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bitcount, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bitcount, i64 0, i64 0)
  %3 = alloca i64, align 8
  store i64 %0, i64* %3, align 8
  %4 = load i64, i64* %3, align 8
  %5 = and i64 %4, 2863311530
  %6 = ashr i64 %5, 1
  %7 = load i64, i64* %3, align 8
  %8 = and i64 %7, 1431655765
  %9 = add nsw i64 %6, %8
  store i64 %9, i64* %3, align 8
  %10 = load i64, i64* %3, align 8
  %11 = and i64 %10, 3435973836
  %12 = ashr i64 %11, 2
  %13 = load i64, i64* %3, align 8
  %14 = and i64 %13, 858993459
  %15 = add nsw i64 %12, %14
  store i64 %15, i64* %3, align 8
  %16 = load i64, i64* %3, align 8
  %17 = and i64 %16, 4042322160
  %18 = ashr i64 %17, 4
  %19 = load i64, i64* %3, align 8
  %20 = and i64 %19, 252645135
  %21 = add nsw i64 %18, %20
  store i64 %21, i64* %3, align 8
  %22 = load i64, i64* %3, align 8
  %23 = and i64 %22, 4278255360
  %24 = ashr i64 %23, 8
  %25 = load i64, i64* %3, align 8
  %26 = and i64 %25, 16711935
  %27 = add nsw i64 %24, %26
  store i64 %27, i64* %3, align 8
  %28 = load i64, i64* %3, align 8
  %29 = and i64 %28, 4294901760
  %30 = ashr i64 %29, 16
  %31 = load i64, i64* %3, align 8
  %32 = and i64 %31, 65535
  %33 = add nsw i64 %30, %32
  store i64 %33, i64* %3, align 8
  %34 = load i64, i64* %3, align 8
  %35 = trunc i64 %34 to i32
  ret i32 %35
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

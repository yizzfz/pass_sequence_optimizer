; ModuleID = 'tmp1.ll'
source_filename = "bitcnt_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bit_count = private constant [9 x i8] c"bit_count"
@__profc_bit_count = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bit_count = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -982174029300811949, i64 42002968669, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i32 0, i32 0), i8* bitcast (i32 (i64)* @bit_count to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [19 x i8] c"\09\11x\DAK\CA,\89O\CE/\CD+\01\00\12\83\03\C8", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bit_count to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @bit_count(i64) #0 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  store i64 %0, i64* %2, align 8
  store i32 0, i32* %3, align 4
  %4 = load i64, i64* %2, align 8
  %5 = icmp ne i64 %4, 0
  br i1 %5, label %6, label %19

; <label>:6:                                      ; preds = %1
  br label %7

; <label>:7:                                      ; preds = %11, %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 0)
  %9 = load i32, i32* %3, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* %3, align 4
  br label %11

; <label>:11:                                     ; preds = %7
  %12 = load i64, i64* %2, align 8
  %13 = load i64, i64* %2, align 8
  %14 = sub nsw i64 %13, 1
  %15 = and i64 %12, %14
  store i64 %15, i64* %2, align 8
  %16 = icmp ne i64 0, %15
  br i1 %16, label %7, label %17

; <label>:17:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 2)
  br label %19

; <label>:19:                                     ; preds = %17, %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 1)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bit_count, i64 0, i64 1)
  %21 = load i32, i32* %3, align 4
  ret i32 %21
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

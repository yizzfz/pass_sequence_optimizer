; ModuleID = 'tmp1.ll'
source_filename = "sleep.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_sleep = private constant [5 x i8] c"sleep"
@__profc_sleep = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_sleep = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3188927404885408457, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sleep, i32 0, i32 0), i8* bitcast (i32 (i32)* @sleep to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [7 x i8] c"\05\00sleep", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_sleep to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @sleep(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i32 %0, i32* %2, align 4
  %6 = call i64 @time(i64* %3) #2
  %7 = load i64, i64* %3, align 8
  %8 = load i32, i32* %2, align 4
  %9 = zext i32 %8 to i64
  %10 = add nsw i64 %7, %9
  store i64 %10, i64* %5, align 8
  br label %11

; <label>:11:                                     ; preds = %18, %1
  %12 = call i64 @time(i64* %4) #2
  %13 = load i64, i64* %4, align 8
  %14 = load i64, i64* %5, align 8
  %15 = icmp sgt i64 %13, %14
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sleep, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sleep, i64 0, i64 1)
  br label %20

; <label>:18:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sleep, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_sleep, i64 0, i64 0)
  br label %11

; <label>:20:                                     ; preds = %16
  ret i32 0
}

; Function Attrs: nounwind
declare i64 @time(i64*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'tmp1.ll'
source_filename = "fixed.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mad_f_abs = private constant [9 x i8] c"mad_f_abs"
@__profc_mad_f_abs = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mad_f_abs = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1943369775753864295, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_f_abs, i32 0, i32 0), i8* bitcast (i32 (i32)* @mad_f_abs to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [19 x i8] c"\09\11x\DA\CBML\89O\8BOL*\06\00\11\B0\03\8D", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mad_f_abs to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @mad_f_abs(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp slt i32 %3, 0
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_f_abs, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_f_abs, i64 0, i64 1)
  %7 = load i32, i32* %2, align 4
  %8 = sub nsw i32 0, %7
  br label %12

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_f_abs, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mad_f_abs, i64 0, i64 0)
  %11 = load i32, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %9, %5
  %13 = phi i32 [ %8, %5 ], [ %11, %9 ]
  ret i32 %13
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

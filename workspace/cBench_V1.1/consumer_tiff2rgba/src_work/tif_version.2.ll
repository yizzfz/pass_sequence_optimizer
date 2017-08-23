; ModuleID = 'tmp1.ll'
source_filename = "tif_version.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@TIFFVersion = internal constant [106 x i8] c"LIBTIFF, Version 3.5.4\0ACopyright (c) 1988-1996 Sam Leffler\0ACopyright (c) 1991-1996 Silicon Graphics, Inc.\00", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFGetVersion = private constant [14 x i8] c"TIFFGetVersion"
@__profc_TIFFGetVersion = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFGetVersion = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2071385012815445898, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetVersion, i32 0, i32 0), i8* bitcast (i8* ()* @TIFFGetVersion to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [24 x i8] c"\0E\16x\DA\0B\F1tssO-\09K-*\CE\CC\CF\03\00#\DD\050", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFGetVersion to i8*), i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i8* @TIFFGetVersion() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetVersion, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFGetVersion, i64 0, i64 0)
  ret i8* getelementptr inbounds ([106 x i8], [106 x i8]* @TIFFVersion, i32 0, i32 0)
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

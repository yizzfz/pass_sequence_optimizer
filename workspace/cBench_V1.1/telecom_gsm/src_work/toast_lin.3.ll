; ModuleID = 'toast_lin.2.ll'
source_filename = "toast_lin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@in = external global %struct._IO_FILE*, align 8
@out = external global %struct._IO_FILE*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_linear_input = private constant [12 x i8] c"linear_input"
@__profn_linear_output = private constant [13 x i8] c"linear_output"
@__profc_linear_input = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_linear_input = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7116516321245496273, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_input, i32 0, i32 0), i8* bitcast (i32 (i16*)* @linear_input to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_linear_output = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_linear_output = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1213763143436260420, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_output, i32 0, i32 0), i8* bitcast (i32 (i16*)* @linear_output to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [30 x i8] c"\1A\1Cx\DA\CB\C9\CCKM,\8A\CF\CC+(-a\CC\81p\F2KK\80<\00\8C\FA\0A\97", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_linear_input to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_linear_output to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @linear_input(i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_input, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_input, i64 0, i64 0)
  %3 = alloca i16*, align 8
  store i16* %0, i16** %3, align 8
  %4 = load i16*, i16** %3, align 8
  %5 = bitcast i16* %4 to i8*
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @in, align 8
  %7 = call i64 @fread(i8* %5, i64 2, i64 160, %struct._IO_FILE* %6)
  %8 = trunc i64 %7 to i32
  ret i32 %8
}

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind uwtable
define i32 @linear_output(i16*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_output, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_linear_output, i64 0, i64 0)
  %3 = alloca i16*, align 8
  store i16* %0, i16** %3, align 8
  %4 = load i16*, i16** %3, align 8
  %5 = bitcast i16* %4 to i8*
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @out, align 8
  %7 = call i64 @fwrite(i8* %5, i64 2, i64 160, %struct._IO_FILE* %6)
  %8 = icmp ne i64 %7, 160
  %9 = zext i1 %8 to i32
  %10 = sub nsw i32 0, %9
  ret i32 %10
}

declare i64 @fwrite(i8*, i64, i64, %struct._IO_FILE*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

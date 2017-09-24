; ModuleID = 'tmp1.ll'
source_filename = "gettime.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.timeval = type { i64, i64 }
%struct.timezone = type { i32, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gettimeofday = private constant [12 x i8] c"gettimeofday"
@__profc_gettimeofday = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gettimeofday = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1970690760593347500, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gettimeofday, i32 0, i32 0), i8* bitcast (i32 (%struct.timeval*, %struct.timezone*)* @gettimeofday to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\0C\00gettimeofday", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gettimeofday to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @gettimeofday(%struct.timeval* nonnull, %struct.timezone*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gettimeofday, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_gettimeofday, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca %struct.timeval*, align 8
  %6 = alloca %struct.timezone*, align 8
  store %struct.timeval* %0, %struct.timeval** %5, align 8
  store %struct.timezone* %1, %struct.timezone** %6, align 8
  %7 = call i64 (i64*, ...) bitcast (i64 (...)* @time to i64 (i64*, ...)*)(i64* null)
  %8 = load %struct.timeval*, %struct.timeval** %5, align 8
  %9 = getelementptr inbounds %struct.timeval, %struct.timeval* %8, i32 0, i32 0
  store i64 %7, i64* %9, align 8
  %10 = load %struct.timeval*, %struct.timeval** %5, align 8
  %11 = getelementptr inbounds %struct.timeval, %struct.timeval* %10, i32 0, i32 1
  store i64 0, i64* %11, align 8
  %12 = load i32, i32* %4, align 4
  ret i32 %12
}

declare i64 @time(...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

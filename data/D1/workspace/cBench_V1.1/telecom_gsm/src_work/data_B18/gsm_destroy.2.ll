; ModuleID = 'tmp1.ll'
source_filename = "gsm_destroy.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type opaque

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_destroy = private constant [11 x i8] c"gsm_destroy"
@__profc_gsm_destroy = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_destroy = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3827657002223685743, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_destroy, i32 0, i32 0), i8* bitcast (void (%struct.gsm_state*)* @gsm_destroy to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [13 x i8] c"\0B\00gsm_destroy", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_destroy to i8*), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @gsm_destroy(%struct.gsm_state*) #0 {
  %2 = alloca %struct.gsm_state*, align 8
  store %struct.gsm_state* %0, %struct.gsm_state** %2, align 8
  %3 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %4 = icmp ne %struct.gsm_state* %3, null
  br i1 %4, label %5, label %9

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_destroy, i64 0, i64 1)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_destroy, i64 0, i64 1)
  %7 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %8 = bitcast %struct.gsm_state* %7 to i8*
  call void @free(i8* %8) #2
  br label %9

; <label>:9:                                      ; preds = %5, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_destroy, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_destroy, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

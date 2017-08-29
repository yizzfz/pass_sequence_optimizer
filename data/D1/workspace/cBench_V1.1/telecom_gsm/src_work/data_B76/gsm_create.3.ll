; ModuleID = 'gsm_create.2.ll'
source_filename = "gsm_create.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_create = private constant [10 x i8] c"gsm_create"
@__profc_gsm_create = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_create = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 382495090636944330, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_create, i32 0, i32 0), i8* bitcast (%struct.gsm_state* ()* @gsm_create to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [12 x i8] c"\0A\00gsm_create", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_create to i8*), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.gsm_state* @gsm_create() #0 {
  %1 = alloca %struct.gsm_state*, align 8
  %2 = alloca %struct.gsm_state*, align 8
  %3 = call noalias i8* @malloc(i64 656) #3
  %4 = bitcast i8* %3 to %struct.gsm_state*
  store %struct.gsm_state* %4, %struct.gsm_state** %2, align 8
  %5 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %6 = icmp ne %struct.gsm_state* %5, null
  br i1 %6, label %10, label %7

; <label>:7:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_create, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_create, i64 0, i64 1)
  %9 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  store %struct.gsm_state* %9, %struct.gsm_state** %1, align 8
  br label %17

; <label>:10:                                     ; preds = %0
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_create, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_gsm_create, i64 0, i64 0)
  %12 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %13 = bitcast %struct.gsm_state* %12 to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 656, i32 1, i1 false)
  %14 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  %15 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %14, i32 0, i32 7
  store i16 40, i16* %15, align 2
  %16 = load %struct.gsm_state*, %struct.gsm_state** %2, align 8
  store %struct.gsm_state* %16, %struct.gsm_state** %1, align 8
  br label %17

; <label>:17:                                     ; preds = %10, %7
  %18 = load %struct.gsm_state*, %struct.gsm_state** %1, align 8
  ret %struct.gsm_state* %18
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

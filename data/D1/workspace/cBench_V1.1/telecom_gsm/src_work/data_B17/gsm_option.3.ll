; ModuleID = 'gsm_option.2.ll'
source_filename = "gsm_option.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_gsm_option = private constant [10 x i8] c"gsm_option"
@__profc_gsm_option = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_gsm_option = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6324528141792891274, i64 49241836012, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i32 0, i32 0), i8* bitcast (i32 (%struct.gsm_state*, i32, i32*)* @gsm_option to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [12 x i8] c"\0A\00gsm_option", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_gsm_option to i8*), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @gsm_option(%struct.gsm_state*, i32, i32*) #0 {
  %4 = alloca %struct.gsm_state*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32*, align 8
  %7 = alloca i32, align 4
  store %struct.gsm_state* %0, %struct.gsm_state** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32* %2, i32** %6, align 8
  store i32 -1, i32* %7, align 4
  %8 = load i32, i32* %5, align 4
  switch i32 %8, label %27 [
    i32 1, label %9
    i32 2, label %25
  ]

; <label>:9:                                      ; preds = %3
  %10 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %11 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %10, i32 0, i32 10
  %12 = load i8, i8* %11, align 4
  %13 = sext i8 %12 to i32
  store i32 %13, i32* %7, align 4
  %14 = load i32*, i32** %6, align 8
  %15 = icmp ne i32* %14, null
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %9
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 3)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 3)
  %18 = load i32*, i32** %6, align 8
  %19 = load i32, i32* %18, align 4
  %20 = trunc i32 %19 to i8
  %21 = load %struct.gsm_state*, %struct.gsm_state** %4, align 8
  %22 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %21, i32 0, i32 10
  store i8 %20, i8* %22, align 4
  br label %23

; <label>:23:                                     ; preds = %16, %9
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 0)
  br label %29

; <label>:25:                                     ; preds = %3
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 1)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 1)
  br label %29

; <label>:27:                                     ; preds = %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 2)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_gsm_option, i64 0, i64 2)
  br label %29

; <label>:29:                                     ; preds = %27, %25, %23
  %30 = load i32, i32* %7, align 4
  ret i32 %30
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'def_pars.2.ll'
source_filename = "def_pars.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.klatt_frame_t = type { i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64, i64 }
%struct.klatt_global_t = type { i32, i32, i32, i32, i64, i64, i64, i64 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [65 x i8] c"$Id: def_pars.c,v 1.13 1994/11/08 13:30:50 a904209 Exp a904209 $\00", align 1
@def_pars_id = global i8* getelementptr inbounds ([65 x i8], [65 x i8]* @.str, i32 0, i32 0), align 8
@def_pars = global %struct.klatt_frame_t { i64 1330, i64 60, i64 500, i64 60, i64 1500, i64 90, i64 2800, i64 150, i64 3250, i64 200, i64 3700, i64 200, i64 4990, i64 500, i64 270, i64 100, i64 270, i64 100, i64 0, i64 30, i64 0, i64 10, i64 0, i64 0, i64 0, i64 80, i64 0, i64 200, i64 0, i64 350, i64 0, i64 500, i64 0, i64 600, i64 0, i64 800, i64 0, i64 0, i64 0, i64 62 }, align 8
@samp_rate = external global i64, align 8
@klatt_global = common global %struct.klatt_global_t zeroinitializer, align 8
@.str.1 = private unnamed_addr constant [16 x i8] c"Synth paramters\00", align 1
@.str.2 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.3 = private unnamed_addr constant [25 x i8] c"Quiet - minimal messages\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"I\00", align 1
@.str.5 = private unnamed_addr constant [23 x i8] c"Impulse glottal source\00", align 1
@.str.6 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"%d\00", align 1
@.str.8 = private unnamed_addr constant [24 x i8] c"Number cascade formants\00", align 1
@.str.9 = private unnamed_addr constant [2 x i8] c"F\00", align 1
@.str.10 = private unnamed_addr constant [11 x i8] c"F0 flutter\00", align 1
@.str.11 = private unnamed_addr constant [2 x i8] c"f\00", align 1
@.str.12 = private unnamed_addr constant [4 x i8] c"%lg\00", align 1
@.str.13 = private unnamed_addr constant [15 x i8] c"mSec per frame\00", align 1
@.str.14 = private unnamed_addr constant [2 x i8] c"t\00", align 1
@.str.15 = private unnamed_addr constant [8 x i8] c"Tilt dB\00", align 1
@.str.16 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.17 = private unnamed_addr constant [17 x i8] c"Base F0 in 0.1Hz\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_init_synth = private constant [10 x i8] c"init_synth"
@__profc_init_synth = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_synth = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9177195351718039827, i64 41968295313, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @init_synth to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [20 x i8] c"\0A\12x\DA\CB\CC\CB,\89/\AE\CC+\C9\00\00\17m\04J", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_synth to i8*), i8* getelementptr inbounds ([20 x i8], [20 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @init_synth(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store double 1.000000e+01, double* %5, align 8
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  %8 = load i64, i64* @samp_rate, align 8
  store i64 %8, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 4), align 8
  store i32 1, i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 1), align 4
  store i64 2, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 6), align 8
  store i32 0, i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 2), align 8
  %9 = load i32, i32* %3, align 4
  %10 = load i8**, i8*** %4, align 8
  %11 = call i32 (i8*, i32, i8**, ...) @getargs(i8* getelementptr inbounds ([16 x i8], [16 x i8]* @.str.1, i32 0, i32 0), i32 %9, i8** %10, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.2, i32 0, i32 0), i8* null, i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 1), i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0), i8* null, i32* %6, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i32* %7, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.9, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 2), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.10, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.11, i32 0, i32 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.12, i32 0, i32 0), double* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.13, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.14, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i64* getelementptr inbounds (%struct.klatt_frame_t, %struct.klatt_frame_t* @def_pars, i32 0, i32 21), i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.15, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.16, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i32 0, i32 0), i64* getelementptr inbounds (%struct.klatt_frame_t, %struct.klatt_frame_t* @def_pars, i32 0, i32 0), i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.17, i32 0, i32 0), i8* null)
  store i32 %11, i32* %3, align 4
  %12 = load i32, i32* %7, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 0)
  store i32 1, i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 0), align 8
  %16 = load i32, i32* %7, align 4
  %17 = sext i32 %16 to i64
  store i64 %17, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 5), align 8
  br label %20

; <label>:18:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 2)
  store i32 2, i32* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 0), align 8
  br label %20

; <label>:20:                                     ; preds = %18, %14
  %21 = load i32, i32* %6, align 4
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 1)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_init_synth, i64 0, i64 1)
  store i64 1, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 6), align 8
  br label %25

; <label>:25:                                     ; preds = %23, %20
  %26 = load i64, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 4), align 8
  %27 = sitofp i64 %26 to double
  %28 = load double, double* %5, align 8
  %29 = fmul double %27, %28
  %30 = fdiv double %29, 1.000000e+03
  %31 = fptosi double %30 to i64
  store i64 %31, i64* getelementptr inbounds (%struct.klatt_global_t, %struct.klatt_global_t* @klatt_global, i32 0, i32 7), align 8
  %32 = load i32, i32* %3, align 4
  ret i32 %32
}

declare i32 @getargs(i8*, i32, i8**, ...) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

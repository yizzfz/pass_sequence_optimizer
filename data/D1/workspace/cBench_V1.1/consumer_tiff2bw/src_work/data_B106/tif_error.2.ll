; ModuleID = 'tmp1.ll'
source_filename = "tif_error.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

$__llvm_profile_raw_version = comdat any

@_TIFFerrorHandler = external global void (i8*, i8*, %struct.__va_list_tag*)*, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFSetErrorHandler = private constant [19 x i8] c"TIFFSetErrorHandler"
@__profn_TIFFError = private constant [9 x i8] c"TIFFError"
@__profc_TIFFSetErrorHandler = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFSetErrorHandler = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3406452876975741335, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetErrorHandler, i32 0, i32 0), i8* bitcast (void (i8*, i8*, %struct.__va_list_tag*)* (void (i8*, i8*, %struct.__va_list_tag*)*)* @TIFFSetErrorHandler to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFError = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFError = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFError = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 774431138046896148, i64 281500548009730, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFError, i32 0, i32 0), i8* bitcast (void (i8*, i8*, ...)* @TIFFError to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFError to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [31 x i8] c"\1D\00TIFFSetErrorHandler\01TIFFError", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFSetErrorHandler to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFError to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void (i8*, i8*, %struct.__va_list_tag*)* @TIFFSetErrorHandler(void (i8*, i8*, %struct.__va_list_tag*)*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetErrorHandler, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_TIFFSetErrorHandler, i64 0, i64 0)
  %3 = alloca void (i8*, i8*, %struct.__va_list_tag*)*, align 8
  %4 = alloca void (i8*, i8*, %struct.__va_list_tag*)*, align 8
  store void (i8*, i8*, %struct.__va_list_tag*)* %0, void (i8*, i8*, %struct.__va_list_tag*)** %3, align 8
  %5 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  store void (i8*, i8*, %struct.__va_list_tag*)* %5, void (i8*, i8*, %struct.__va_list_tag*)** %4, align 8
  %6 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** %3, align 8
  store void (i8*, i8*, %struct.__va_list_tag*)* %6, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  %7 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** %4, align 8
  ret void (i8*, i8*, %struct.__va_list_tag*)* %7
}

; Function Attrs: noinline nounwind uwtable
define void @TIFFError(i8*, i8*, ...) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca [1 x %struct.__va_list_tag], align 16
  store i8* %0, i8** %3, align 8
  store i8* %1, i8** %4, align 8
  %6 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  %7 = icmp ne void (i8*, i8*, %struct.__va_list_tag*)* %6, null
  br i1 %7, label %8, label %19

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFError, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFError, i64 0, i64 1)
  %10 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i32 0, i32 0
  %11 = bitcast %struct.__va_list_tag* %10 to i8*
  call void @llvm.va_start(i8* %11)
  %12 = load void (i8*, i8*, %struct.__va_list_tag*)*, void (i8*, i8*, %struct.__va_list_tag*)** @_TIFFerrorHandler, align 8
  %13 = load i8*, i8** %3, align 8
  %14 = load i8*, i8** %4, align 8
  %15 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i32 0, i32 0
  %16 = ptrtoint void (i8*, i8*, %struct.__va_list_tag*)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFError to i8*), i32 0)
  call void %12(i8* %13, i8* %14, %struct.__va_list_tag* %15)
  %17 = getelementptr inbounds [1 x %struct.__va_list_tag], [1 x %struct.__va_list_tag]* %5, i32 0, i32 0
  %18 = bitcast %struct.__va_list_tag* %17 to i8*
  call void @llvm.va_end(i8* %18)
  br label %19

; <label>:19:                                     ; preds = %8, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFError, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_TIFFError, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.va_start(i8*) #1

; Function Attrs: nounwind
declare void @llvm.va_end(i8*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

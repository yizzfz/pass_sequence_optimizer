; ModuleID = 'tmp1.ll'
source_filename = "dict.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@ph_am = external global [0 x i8*], align 8
@dialect = global i8** getelementptr inbounds ([0 x i8*], [0 x i8*]* @ph_am, i32 0, i32 0), align 8
@dict = common global i8* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_dict_find = private constant [9 x i8] c"dict_find"
@__profn_dict_init = private constant [9 x i8] c"dict_init"
@__profn_dict_term = private constant [9 x i8] c"dict_term"
@__profc_dict_find = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dict_find = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2543006617566422377, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_find, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @dict_find to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_dict_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dict_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7823627041874901695, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_init, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @dict_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_dict_term = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_dict_term = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1746197423684321093, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_term, i32 0, i32 0), i8* bitcast (void ()* @dict_term to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [31 x i8] c"\1D\00dict_find\01dict_init\01dict_term", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dict_find to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dict_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_dict_term to i8*), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i8* @dict_find(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_find, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_find, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  ret i8* null
}

; Function Attrs: noinline nounwind uwtable
define i32 @dict_init(i32, i8**) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_init, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_init, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i8**, align 8
  store i32 %0, i32* %4, align 4
  store i8** %1, i8*** %5, align 8
  %6 = load i32, i32* %4, align 4
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define void @dict_term() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_term, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_dict_term, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

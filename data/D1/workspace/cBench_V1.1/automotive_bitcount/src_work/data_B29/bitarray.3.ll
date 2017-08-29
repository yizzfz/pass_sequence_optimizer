; ModuleID = 'bitarray.2.ll'
source_filename = "bitarray.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_alloc_bit_array = private constant [15 x i8] c"alloc_bit_array"
@__profn_getbit = private constant [6 x i8] c"getbit"
@__profn_setbit = private constant [6 x i8] c"setbit"
@__profn_flipbit = private constant [7 x i8] c"flipbit"
@__profc_alloc_bit_array = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_alloc_bit_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6859980879310414326, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_bit_array, i32 0, i32 0), i8* bitcast (i8* (i64)* @alloc_bit_array to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_getbit = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_getbit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5040219570890704792, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbit, i32 0, i32 0), i8* bitcast (i32 (i8*, i32)* @getbit to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_setbit = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_setbit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4359079383795262503, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setbit, i32 0, i32 0), i8* bitcast (void (i8*, i32, i32)* @setbit to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_flipbit = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_flipbit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7349013350231439708, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_flipbit, i32 0, i32 0), i8* bitcast (void (i8*, i32)* @flipbit to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [39 x i8] c"%\00alloc_bit_array\01getbit\01setbit\01flipbit", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_alloc_bit_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_getbit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_setbit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_flipbit to i8*), i8* getelementptr inbounds ([39 x i8], [39 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i8* @alloc_bit_array(i64) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_bit_array, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_alloc_bit_array, i64 0, i64 0)
  %3 = alloca i64, align 8
  %4 = alloca i8*, align 8
  store i64 %0, i64* %3, align 8
  %5 = load i64, i64* %3, align 8
  %6 = add i64 %5, 8
  %7 = sub i64 %6, 1
  %8 = udiv i64 %7, 8
  %9 = call noalias i8* @calloc(i64 %8, i64 1) #2
  store i8* %9, i8** %4, align 8
  %10 = load i8*, i8** %4, align 8
  ret i8* %10
}

; Function Attrs: nounwind
declare noalias i8* @calloc(i64, i64) #1

; Function Attrs: noinline nounwind uwtable
define i32 @getbit(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbit, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_getbit, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = sdiv i32 %6, 8
  %8 = load i8*, i8** %4, align 8
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  store i8* %10, i8** %4, align 8
  %11 = load i8*, i8** %4, align 8
  %12 = load i8, i8* %11, align 1
  %13 = sext i8 %12 to i32
  %14 = load i32, i32* %5, align 4
  %15 = srem i32 %14, 8
  %16 = shl i32 1, %15
  %17 = and i32 %13, %16
  %18 = icmp ne i32 %17, 0
  %19 = zext i1 %18 to i32
  ret i32 %19
}

; Function Attrs: noinline nounwind uwtable
define void @setbit(i8*, i32, i32) #0 {
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %7 = load i32, i32* %5, align 4
  %8 = sdiv i32 %7, 8
  %9 = load i8*, i8** %4, align 8
  %10 = sext i32 %8 to i64
  %11 = getelementptr inbounds i8, i8* %9, i64 %10
  store i8* %11, i8** %4, align 8
  %12 = load i32, i32* %6, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %24

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setbit, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setbit, i64 0, i64 0)
  %16 = load i32, i32* %5, align 4
  %17 = srem i32 %16, 8
  %18 = shl i32 1, %17
  %19 = load i8*, i8** %4, align 8
  %20 = load i8, i8* %19, align 1
  %21 = sext i8 %20 to i32
  %22 = or i32 %21, %18
  %23 = trunc i32 %22 to i8
  store i8 %23, i8* %19, align 1
  br label %35

; <label>:24:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setbit, i64 0, i64 1)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_setbit, i64 0, i64 1)
  %26 = load i32, i32* %5, align 4
  %27 = srem i32 %26, 8
  %28 = shl i32 1, %27
  %29 = xor i32 %28, -1
  %30 = load i8*, i8** %4, align 8
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = and i32 %32, %29
  %34 = trunc i32 %33 to i8
  store i8 %34, i8* %30, align 1
  br label %35

; <label>:35:                                     ; preds = %24, %14
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @flipbit(i8*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_flipbit, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_flipbit, i64 0, i64 0)
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load i32, i32* %5, align 4
  %7 = sdiv i32 %6, 8
  %8 = load i8*, i8** %4, align 8
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds i8, i8* %8, i64 %9
  store i8* %10, i8** %4, align 8
  %11 = load i32, i32* %5, align 4
  %12 = srem i32 %11, 8
  %13 = shl i32 1, %12
  %14 = load i8*, i8** %4, align 8
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = xor i32 %16, %13
  %18 = trunc i32 %17 to i8
  store i8 %18, i8* %14, align 1
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

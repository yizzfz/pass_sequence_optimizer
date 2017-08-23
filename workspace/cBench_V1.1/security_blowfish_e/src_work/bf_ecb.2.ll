; ModuleID = 'tmp1.ll'
source_filename = "bf_ecb.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [42 x i8] c"BlowFish part of SSLeay 0.7.0 30-Jan-1997\00", align 1
@BF_version = global i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i32 0, i32 0), align 8
@.str.1 = private unnamed_addr constant [14 x i8] c"blowfish(idx)\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_BF_options = private constant [10 x i8] c"BF_options"
@__profn_BF_ecb_encrypt = private constant [14 x i8] c"BF_ecb_encrypt"
@__profc_BF_options = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_options = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1422257385967195131, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_options, i32 0, i32 0), i8* bitcast (i8* ()* @BF_options to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_BF_ecb_encrypt = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_BF_ecb_encrypt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5224320879288476122, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_ecb_encrypt, i32 0, i32 0), i8* bitcast (void (i8*, i8*, %struct.bf_key_st*, i32)* @BF_ecb_encrypt to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [35 x i8] c"\19!x\DAsr\8B\CF/(\C9\CC\CF+ftr\8BOMN\8AO\CDK.\AA,(\01\00u\9E\09j", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_options to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_BF_ecb_encrypt to i8*), i8* getelementptr inbounds ([35 x i8], [35 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i8* @BF_options() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_options, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_options, i64 0, i64 0)
  ret i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i32 0, i32 0)
}

; Function Attrs: nounwind uwtable
define void @BF_ecb_encrypt(i8*, i8*, %struct.bf_key_st*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_ecb_encrypt, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_BF_ecb_encrypt, i64 0, i64 0)
  %6 = alloca i8*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca %struct.bf_key_st*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i64, align 8
  %11 = alloca [2 x i64], align 16
  store i8* %0, i8** %6, align 8
  store i8* %1, i8** %7, align 8
  store %struct.bf_key_st* %2, %struct.bf_key_st** %8, align 8
  store i32 %3, i32* %9, align 4
  %12 = load i8*, i8** %6, align 8
  %13 = getelementptr inbounds i8, i8* %12, i32 1
  store i8* %13, i8** %6, align 8
  %14 = load i8, i8* %12, align 1
  %15 = zext i8 %14 to i64
  %16 = shl i64 %15, 24
  store i64 %16, i64* %10, align 8
  %17 = load i8*, i8** %6, align 8
  %18 = getelementptr inbounds i8, i8* %17, i32 1
  store i8* %18, i8** %6, align 8
  %19 = load i8, i8* %17, align 1
  %20 = zext i8 %19 to i64
  %21 = shl i64 %20, 16
  %22 = load i64, i64* %10, align 8
  %23 = or i64 %22, %21
  store i64 %23, i64* %10, align 8
  %24 = load i8*, i8** %6, align 8
  %25 = getelementptr inbounds i8, i8* %24, i32 1
  store i8* %25, i8** %6, align 8
  %26 = load i8, i8* %24, align 1
  %27 = zext i8 %26 to i64
  %28 = shl i64 %27, 8
  %29 = load i64, i64* %10, align 8
  %30 = or i64 %29, %28
  store i64 %30, i64* %10, align 8
  %31 = load i8*, i8** %6, align 8
  %32 = getelementptr inbounds i8, i8* %31, i32 1
  store i8* %32, i8** %6, align 8
  %33 = load i8, i8* %31, align 1
  %34 = zext i8 %33 to i64
  %35 = load i64, i64* %10, align 8
  %36 = or i64 %35, %34
  store i64 %36, i64* %10, align 8
  %37 = load i64, i64* %10, align 8
  %38 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 0
  store i64 %37, i64* %38, align 16
  %39 = load i8*, i8** %6, align 8
  %40 = getelementptr inbounds i8, i8* %39, i32 1
  store i8* %40, i8** %6, align 8
  %41 = load i8, i8* %39, align 1
  %42 = zext i8 %41 to i64
  %43 = shl i64 %42, 24
  store i64 %43, i64* %10, align 8
  %44 = load i8*, i8** %6, align 8
  %45 = getelementptr inbounds i8, i8* %44, i32 1
  store i8* %45, i8** %6, align 8
  %46 = load i8, i8* %44, align 1
  %47 = zext i8 %46 to i64
  %48 = shl i64 %47, 16
  %49 = load i64, i64* %10, align 8
  %50 = or i64 %49, %48
  store i64 %50, i64* %10, align 8
  %51 = load i8*, i8** %6, align 8
  %52 = getelementptr inbounds i8, i8* %51, i32 1
  store i8* %52, i8** %6, align 8
  %53 = load i8, i8* %51, align 1
  %54 = zext i8 %53 to i64
  %55 = shl i64 %54, 8
  %56 = load i64, i64* %10, align 8
  %57 = or i64 %56, %55
  store i64 %57, i64* %10, align 8
  %58 = load i8*, i8** %6, align 8
  %59 = getelementptr inbounds i8, i8* %58, i32 1
  store i8* %59, i8** %6, align 8
  %60 = load i8, i8* %58, align 1
  %61 = zext i8 %60 to i64
  %62 = load i64, i64* %10, align 8
  %63 = or i64 %62, %61
  store i64 %63, i64* %10, align 8
  %64 = load i64, i64* %10, align 8
  %65 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 1
  store i64 %64, i64* %65, align 8
  %66 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i32 0, i32 0
  %67 = load %struct.bf_key_st*, %struct.bf_key_st** %8, align 8
  %68 = load i32, i32* %9, align 4
  call void @BF_encrypt(i64* %66, %struct.bf_key_st* %67, i32 %68)
  %69 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 0
  %70 = load i64, i64* %69, align 16
  store i64 %70, i64* %10, align 8
  %71 = load i64, i64* %10, align 8
  %72 = lshr i64 %71, 24
  %73 = and i64 %72, 255
  %74 = trunc i64 %73 to i8
  %75 = load i8*, i8** %7, align 8
  %76 = getelementptr inbounds i8, i8* %75, i32 1
  store i8* %76, i8** %7, align 8
  store i8 %74, i8* %75, align 1
  %77 = load i64, i64* %10, align 8
  %78 = lshr i64 %77, 16
  %79 = and i64 %78, 255
  %80 = trunc i64 %79 to i8
  %81 = load i8*, i8** %7, align 8
  %82 = getelementptr inbounds i8, i8* %81, i32 1
  store i8* %82, i8** %7, align 8
  store i8 %80, i8* %81, align 1
  %83 = load i64, i64* %10, align 8
  %84 = lshr i64 %83, 8
  %85 = and i64 %84, 255
  %86 = trunc i64 %85 to i8
  %87 = load i8*, i8** %7, align 8
  %88 = getelementptr inbounds i8, i8* %87, i32 1
  store i8* %88, i8** %7, align 8
  store i8 %86, i8* %87, align 1
  %89 = load i64, i64* %10, align 8
  %90 = and i64 %89, 255
  %91 = trunc i64 %90 to i8
  %92 = load i8*, i8** %7, align 8
  %93 = getelementptr inbounds i8, i8* %92, i32 1
  store i8* %93, i8** %7, align 8
  store i8 %91, i8* %92, align 1
  %94 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 1
  %95 = load i64, i64* %94, align 8
  store i64 %95, i64* %10, align 8
  %96 = load i64, i64* %10, align 8
  %97 = lshr i64 %96, 24
  %98 = and i64 %97, 255
  %99 = trunc i64 %98 to i8
  %100 = load i8*, i8** %7, align 8
  %101 = getelementptr inbounds i8, i8* %100, i32 1
  store i8* %101, i8** %7, align 8
  store i8 %99, i8* %100, align 1
  %102 = load i64, i64* %10, align 8
  %103 = lshr i64 %102, 16
  %104 = and i64 %103, 255
  %105 = trunc i64 %104 to i8
  %106 = load i8*, i8** %7, align 8
  %107 = getelementptr inbounds i8, i8* %106, i32 1
  store i8* %107, i8** %7, align 8
  store i8 %105, i8* %106, align 1
  %108 = load i64, i64* %10, align 8
  %109 = lshr i64 %108, 8
  %110 = and i64 %109, 255
  %111 = trunc i64 %110 to i8
  %112 = load i8*, i8** %7, align 8
  %113 = getelementptr inbounds i8, i8* %112, i32 1
  store i8* %113, i8** %7, align 8
  store i8 %111, i8* %112, align 1
  %114 = load i64, i64* %10, align 8
  %115 = and i64 %114, 255
  %116 = trunc i64 %115 to i8
  %117 = load i8*, i8** %7, align 8
  %118 = getelementptr inbounds i8, i8* %117, i32 1
  store i8* %118, i8** %7, align 8
  store i8 %116, i8* %117, align 1
  %119 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 1
  store i64 0, i64* %119, align 8
  %120 = getelementptr inbounds [2 x i64], [2 x i64]* %11, i64 0, i64 0
  store i64 0, i64* %120, align 16
  store i64 0, i64* %10, align 8
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

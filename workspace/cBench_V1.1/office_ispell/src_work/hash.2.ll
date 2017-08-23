; ModuleID = 'tmp1.ll'
source_filename = "hash.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.hashheader = type { i16, i16, i16, i16, i16, i16, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i8], [13 x i8], i8, i8, i8, [228 x i16], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [228 x i8], [128 x i8], [100 x [11 x i8]], [100 x i32], [100 x i32], i16 }

$__llvm_profile_raw_version = comdat any

@hashheader = external global %struct.hashheader, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_hash = private constant [4 x i8] c"hash"
@__profc_hash = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_hash = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5675543174240272392, i64 57161128894, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i32 0, i32 0), i8* bitcast (i32 (i8*, i32)* @hash to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBH,\CE\00\00\04\15\01\A5", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_hash to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @hash(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i8* %0, i8** %3, align 8
  store i32 %1, i32* %4, align 4
  store i64 0, i64* %5, align 8
  store i32 4, i32* %6, align 4
  br label %7

; <label>:7:                                      ; preds = %19, %2
  %8 = load i32, i32* %6, align 4
  %9 = add nsw i32 %8, -1
  store i32 %9, i32* %6, align 4
  %10 = icmp ne i32 %8, 0
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 2)
  %13 = load i8*, i8** %3, align 8
  %14 = load i8, i8* %13, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 0
  br label %17

; <label>:17:                                     ; preds = %11, %7
  %18 = phi i1 [ false, %7 ], [ %16, %11 ]
  br i1 %18, label %19, label %31

; <label>:19:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 0)
  %21 = load i64, i64* %5, align 8
  %22 = shl i64 %21, 8
  %23 = load i8*, i8** %3, align 8
  %24 = getelementptr inbounds i8, i8* %23, i32 1
  store i8* %24, i8** %3, align 8
  %25 = load i8, i8* %23, align 1
  %26 = zext i8 %25 to i64
  %27 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = or i64 %22, %29
  store i64 %30, i64* %5, align 8
  br label %7

; <label>:31:                                     ; preds = %17
  br label %32

; <label>:32:                                     ; preds = %37, %31
  %33 = load i8*, i8** %3, align 8
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i32
  %36 = icmp ne i32 %35, 0
  br i1 %36, label %37, label %54

; <label>:37:                                     ; preds = %32
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 1)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 1)
  %39 = load i64, i64* %5, align 8
  %40 = shl i64 %39, 5
  %41 = load i64, i64* %5, align 8
  %42 = ashr i64 %41, 27
  %43 = and i64 %42, 31
  %44 = or i64 %40, %43
  store i64 %44, i64* %5, align 8
  %45 = load i8*, i8** %3, align 8
  %46 = getelementptr inbounds i8, i8* %45, i32 1
  store i8* %46, i8** %3, align 8
  %47 = load i8, i8* %45, align 1
  %48 = zext i8 %47 to i64
  %49 = getelementptr inbounds [228 x i8], [228 x i8]* getelementptr inbounds (%struct.hashheader, %struct.hashheader* @hashheader, i32 0, i32 22), i64 0, i64 %48
  %50 = load i8, i8* %49, align 1
  %51 = zext i8 %50 to i64
  %52 = load i64, i64* %5, align 8
  %53 = xor i64 %52, %51
  store i64 %53, i64* %5, align 8
  br label %32

; <label>:54:                                     ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 3)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_hash, i64 0, i64 3)
  %56 = load i64, i64* %5, align 8
  %57 = load i32, i32* %4, align 4
  %58 = sext i32 %57 to i64
  %59 = urem i64 %56, %58
  %60 = trunc i64 %59 to i32
  ret i32 %60
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

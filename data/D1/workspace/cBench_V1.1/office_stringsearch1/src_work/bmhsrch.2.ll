; ModuleID = 'tmp1.ll'
source_filename = "bmhsrch.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@pat = internal global i8* null, align 8
@patlen = internal global i32 0, align 4
@skip = internal global [256 x i32] zeroinitializer, align 16
@skip2 = internal global i32 0, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bmh_init = private constant [8 x i8] c"bmh_init"
@__profn_bmh_search = private constant [10 x i8] c"bmh_search"
@__profc_bmh_init = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmh_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5177966188985943576, i64 89302196859, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i32 0, i32 0), i8* bitcast (void (i8*)* @bmh_init to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bmh_search = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bmh_search = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4630097327666190995, i64 118582203326, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i32 0, i32 0), i8* bitcast (i8* (i8*, i32)* @bmh_search to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [21 x i8] c"\13\00bmh_init\01bmh_search", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmh_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bmh_search to i8*), i8* getelementptr inbounds ([21 x i8], [21 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @bmh_init(i8*) #0 {
  %2 = alloca i8*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  store i8* %0, i8** %2, align 8
  %5 = load i8*, i8** %2, align 8
  store i8* %5, i8** @pat, align 8
  %6 = load i8*, i8** %2, align 8
  %7 = call i64 @strlen(i8* %6) #3
  %8 = trunc i64 %7 to i32
  store i32 %8, i32* @patlen, align 4
  store i32 0, i32* %3, align 4
  br label %9

; <label>:9:                                      ; preds = %17, %1
  %10 = load i32, i32* %3, align 4
  %11 = icmp sle i32 %10, 255
  br i1 %11, label %12, label %21

; <label>:12:                                     ; preds = %9
  %13 = load i32, i32* @patlen, align 4
  %14 = load i32, i32* %3, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %15
  store i32 %13, i32* %16, align 4
  br label %17

; <label>:17:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 0)
  %19 = load i32, i32* %3, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %3, align 4
  br label %9

; <label>:21:                                     ; preds = %9
  store i32 0, i32* %3, align 4
  br label %22

; <label>:22:                                     ; preds = %38, %21
  %23 = load i32, i32* %3, align 4
  %24 = load i32, i32* @patlen, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %26, label %42

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* @patlen, align 4
  %28 = load i32, i32* %3, align 4
  %29 = sub nsw i32 %27, %28
  %30 = sub nsw i32 %29, 1
  %31 = load i8*, i8** @pat, align 8
  %32 = load i32, i32* %3, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8* %31, i64 %33
  %35 = load i8, i8* %34, align 1
  %36 = zext i8 %35 to i64
  %37 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %36
  store i32 %30, i32* %37, align 4
  br label %38

; <label>:38:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 1)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 1)
  %40 = load i32, i32* %3, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %3, align 4
  br label %22

; <label>:42:                                     ; preds = %22
  %43 = load i8*, i8** @pat, align 8
  %44 = load i32, i32* @patlen, align 4
  %45 = sub nsw i32 %44, 1
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i8, i8* %43, i64 %46
  %48 = load i8, i8* %47, align 1
  %49 = zext i8 %48 to i32
  store i32 %49, i32* %4, align 4
  %50 = load i32, i32* %4, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %51
  store i32 32767, i32* %52, align 4
  %53 = load i32, i32* @patlen, align 4
  store i32 %53, i32* @skip2, align 4
  store i32 0, i32* %3, align 4
  br label %54

; <label>:54:                                     ; preds = %75, %42
  %55 = load i32, i32* %3, align 4
  %56 = load i32, i32* @patlen, align 4
  %57 = sub nsw i32 %56, 1
  %58 = icmp slt i32 %55, %57
  br i1 %58, label %59, label %79

; <label>:59:                                     ; preds = %54
  %60 = load i8*, i8** @pat, align 8
  %61 = load i32, i32* %3, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds i8, i8* %60, i64 %62
  %64 = load i8, i8* %63, align 1
  %65 = zext i8 %64 to i32
  %66 = load i32, i32* %4, align 4
  %67 = icmp eq i32 %65, %66
  br i1 %67, label %68, label %74

; <label>:68:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 3)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 3)
  %70 = load i32, i32* @patlen, align 4
  %71 = load i32, i32* %3, align 4
  %72 = sub nsw i32 %70, %71
  %73 = sub nsw i32 %72, 1
  store i32 %73, i32* @skip2, align 4
  br label %74

; <label>:74:                                     ; preds = %68, %59
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 2)
  %76 = add i64 %pgocount3, 1
  store i64 %76, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 2)
  %77 = load i32, i32* %3, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %3, align 4
  br label %54

; <label>:79:                                     ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 4)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_bmh_init, i64 0, i64 4)
  ret void
}

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i8* @bmh_search(i8*, i32) #0 {
  %3 = alloca i8*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %9 = load i32, i32* @patlen, align 4
  %10 = sub nsw i32 %9, 1
  %11 = load i32, i32* %5, align 4
  %12 = sub nsw i32 %10, %11
  store i32 %12, i32* %6, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp sge i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 4)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 4)
  store i8* null, i8** %3, align 8
  br label %93

; <label>:17:                                     ; preds = %2
  %18 = load i32, i32* %5, align 4
  %19 = load i8*, i8** %4, align 8
  %20 = sext i32 %18 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %4, align 8
  br label %22

; <label>:22:                                     ; preds = %91, %17
  br label %23

; <label>:23:                                     ; preds = %35, %22
  %24 = load i8*, i8** %4, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8* %24, i64 %26
  %28 = load i8, i8* %27, align 1
  %29 = zext i8 %28 to i64
  %30 = getelementptr inbounds [256 x i32], [256 x i32]* @skip, i64 0, i64 %29
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, %31
  store i32 %33, i32* %6, align 4
  %34 = icmp slt i32 %33, 0
  br i1 %34, label %35, label %37

; <label>:35:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 0)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 0)
  br label %23

; <label>:37:                                     ; preds = %23
  %38 = load i32, i32* %6, align 4
  %39 = load i32, i32* %5, align 4
  %40 = sub nsw i32 32767, %39
  %41 = icmp slt i32 %38, %40
  br i1 %41, label %42, label %44

; <label>:42:                                     ; preds = %37
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 5)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 5)
  store i8* null, i8** %3, align 8
  br label %93

; <label>:44:                                     ; preds = %37
  %45 = load i32, i32* %6, align 4
  %46 = sub nsw i32 %45, 32767
  store i32 %46, i32* %6, align 4
  %47 = load i32, i32* @patlen, align 4
  %48 = sub nsw i32 %47, 1
  store i32 %48, i32* %7, align 4
  %49 = load i8*, i8** %4, align 8
  %50 = load i32, i32* %6, align 4
  %51 = load i32, i32* %7, align 4
  %52 = sub nsw i32 %50, %51
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i8, i8* %49, i64 %53
  store i8* %54, i8** %8, align 8
  br label %55

; <label>:55:                                     ; preds = %76, %44
  %56 = load i32, i32* %7, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %7, align 4
  %58 = icmp sge i32 %57, 0
  br i1 %58, label %59, label %74

; <label>:59:                                     ; preds = %55
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 2)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 2)
  %61 = load i8*, i8** %8, align 8
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i8, i8* %61, i64 %63
  %65 = load i8, i8* %64, align 1
  %66 = sext i8 %65 to i32
  %67 = load i8*, i8** @pat, align 8
  %68 = load i32, i32* %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds i8, i8* %67, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = icmp eq i32 %66, %72
  br label %74

; <label>:74:                                     ; preds = %59, %55
  %75 = phi i1 [ false, %55 ], [ %73, %59 ]
  br i1 %75, label %76, label %78

; <label>:76:                                     ; preds = %74
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 1)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 1)
  br label %55

; <label>:78:                                     ; preds = %74
  %79 = load i32, i32* %7, align 4
  %80 = icmp slt i32 %79, 0
  br i1 %80, label %81, label %84

; <label>:81:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 6)
  %82 = add i64 %pgocount5, 1
  store i64 %82, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 6)
  %83 = load i8*, i8** %8, align 8
  store i8* %83, i8** %3, align 8
  br label %93

; <label>:84:                                     ; preds = %78
  %85 = load i32, i32* @skip2, align 4
  %86 = load i32, i32* %6, align 4
  %87 = add nsw i32 %86, %85
  store i32 %87, i32* %6, align 4
  %88 = icmp sge i32 %87, 0
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 7)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 7)
  store i8* null, i8** %3, align 8
  br label %93

; <label>:91:                                     ; preds = %84
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 3)
  %92 = add i64 %pgocount7, 1
  store i64 %92, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_bmh_search, i64 0, i64 3)
  br label %22

; <label>:93:                                     ; preds = %89, %81, %42, %15
  %94 = load i8*, i8** %3, align 8
  ret i8* %94
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }
attributes #3 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

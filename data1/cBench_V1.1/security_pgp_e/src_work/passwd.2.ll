; ModuleID = 'tmp1.ll'
source_filename = "passwd.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.MD5Context = type { [4 x i64], [2 x i64], [64 x i8] }

$__llvm_profile_raw_version = comdat any

@showpass = global i8 0, align 1
@pgpout = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [21 x i8] c"\0AEnter pass phrase: \00", align 1
@.str.1 = private unnamed_addr constant [32 x i8] c"\0AEnter same pass phrase again: \00", align 1
@.str.2 = private unnamed_addr constant [50 x i8] c"\0A\07Error: Pass phrases were different.  Try again.\00", align 1
@filter_mode = external global i8, align 1
@quietmode = external global i8, align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_hashpass = private constant [8 x i8] c"hashpass"
@__profn_GetHashedPassPhrase = private constant [19 x i8] c"GetHashedPassPhrase"
@__profc_hashpass = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_hashpass = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 83416321531723081, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_hashpass, i32 0, i32 0), i8* bitcast (void (i8*, i32, i8*)* @hashpass to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_GetHashedPassPhrase = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_GetHashedPassPhrase = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8261126582397236072, i64 105655615973, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i32 0, i32 0), i8* bitcast (i32 (i8*, i8)* @GetHashedPassPhrase to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [30 x i8] c"\1C\00hashpass\01GetHashedPassPhrase", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_hashpass to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_GetHashedPassPhrase to i8*), i8* getelementptr inbounds ([30 x i8], [30 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @hashpass(i8*, i32, i8*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_hashpass, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_hashpass, i64 0, i64 0)
  %5 = alloca i8*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca %struct.MD5Context, align 8
  store i8* %0, i8** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  call void @MD5Init(%struct.MD5Context* %8)
  %9 = load i8*, i8** %5, align 8
  %10 = load i32, i32* %6, align 4
  call void @MD5Update(%struct.MD5Context* %8, i8* %9, i32 %10)
  %11 = load i8*, i8** %7, align 8
  call void @MD5Final(i8* %11, %struct.MD5Context* %8)
  ret void
}

declare void @MD5Init(%struct.MD5Context*) #1

declare void @MD5Update(%struct.MD5Context*, i8*, i32) #1

declare void @MD5Final(i8*, %struct.MD5Context*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @GetHashedPassPhrase(i8*, i8 zeroext) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i8, align 1
  %6 = alloca [256 x i8], align 16
  %7 = alloca [256 x i8], align 16
  %8 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i8 %1, i8* %5, align 1
  %9 = load i8, i8* @showpass, align 1
  %10 = icmp ne i8 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 1)
  store i8 0, i8* %5, align 1
  br label %13

; <label>:13:                                     ; preds = %11, %2
  br label %14

; <label>:14:                                     ; preds = %47, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %16 = call i8* @LANG(i8* getelementptr inbounds ([21 x i8], [21 x i8]* @.str, i32 0, i32 0))
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* %16)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %19 = call i32 @fflush(%struct._IO_FILE* %18)
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %21 = load i8, i8* %5, align 1
  %22 = icmp ne i8 %21, 0
  %23 = xor i1 %22, true
  %24 = zext i1 %23 to i32
  %25 = call i32 @getstring(i8* %20, i32 253, i32 %24)
  %26 = load i8, i8* %5, align 1
  %27 = zext i8 %26 to i32
  %28 = icmp slt i32 %27, 2
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 4)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 4)
  br label %53

; <label>:31:                                     ; preds = %14
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %33 = call i8* @LANG(i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str.1, i32 0, i32 0))
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* %33)
  %35 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %36 = load i8, i8* %5, align 1
  %37 = icmp ne i8 %36, 0
  %38 = xor i1 %37, true
  %39 = zext i1 %38 to i32
  %40 = call i32 @getstring(i8* %35, i32 253, i32 %39)
  %41 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %42 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  %43 = call i32 @strcmp(i8* %41, i8* %42) #5
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 5)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 5)
  br label %53

; <label>:47:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 0)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 0)
  %49 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %50 = call i8* @LANG(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.2, i32 0, i32 0))
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %49, i8* %50)
  %52 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %52, i8 0, i64 256, i32 16, i1 false)
  br label %14

; <label>:53:                                     ; preds = %45, %29
  %54 = load i8, i8* %5, align 1
  %55 = zext i8 %54 to i32
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %71

; <label>:57:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 2)
  %58 = add i64 %pgocount4, 1
  store i64 %58, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 2)
  %59 = load i8, i8* @filter_mode, align 1
  %60 = zext i8 %59 to i32
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %67, label %62

; <label>:62:                                     ; preds = %57
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 7)
  %63 = add i64 %pgocount5, 1
  store i64 %63, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 7)
  %64 = load i8, i8* @quietmode, align 1
  %65 = zext i8 %64 to i32
  %66 = icmp ne i32 %65, 0
  br i1 %66, label %67, label %71

; <label>:67:                                     ; preds = %62, %57
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 3)
  %68 = add i64 %pgocount6, 1
  store i64 %68, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 3)
  %69 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %70 = call i32 @_IO_putc(i32 10, %struct._IO_FILE* %69)
  br label %71

; <label>:71:                                     ; preds = %67, %62, %53
  %72 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %73 = call i64 @strlen(i8* %72) #5
  %74 = trunc i64 %73 to i32
  store i32 %74, i32* %8, align 4
  %75 = load i32, i32* %8, align 4
  %76 = icmp eq i32 %75, 0
  br i1 %76, label %77, label %79

; <label>:77:                                     ; preds = %71
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 6)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_GetHashedPassPhrase, i64 0, i64 6)
  store i32 0, i32* %3, align 4
  br label %87

; <label>:79:                                     ; preds = %71
  %80 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %81 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  %82 = call i64 @strlen(i8* %81) #5
  %83 = trunc i64 %82 to i32
  %84 = load i8*, i8** %4, align 8
  call void @hashpass(i8* %80, i32 %83, i8* %84)
  %85 = getelementptr inbounds [256 x i8], [256 x i8]* %6, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %85, i8 0, i64 256, i32 16, i1 false)
  %86 = getelementptr inbounds [256 x i8], [256 x i8]* %7, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %86, i8 0, i64 256, i32 16, i1 false)
  store i32 1, i32* %3, align 4
  br label %87

; <label>:87:                                     ; preds = %79, %77
  %88 = load i32, i32* %3, align 4
  ret i32 %88
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

declare i32 @fflush(%struct._IO_FILE*) #1

declare i32 @getstring(i8*, i32, i32) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

declare i32 @_IO_putc(i32, %struct._IO_FILE*) #1

; Function Attrs: nounwind readonly
declare i64 @strlen(i8*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { nounwind readonly }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

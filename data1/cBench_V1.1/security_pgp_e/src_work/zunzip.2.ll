; ModuleID = 'tmp1.ll'
source_filename = "zunzip.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@mask_bits = global [33 x i64] [i64 0, i64 1, i64 3, i64 7, i64 15, i64 31, i64 63, i64 127, i64 255, i64 511, i64 1023, i64 2047, i64 4095, i64 8191, i64 16383, i64 32767, i64 65535, i64 131071, i64 262143, i64 524287, i64 1048575, i64 2097151, i64 4194303, i64 8388607, i64 16777215, i64 33554431, i64 67108863, i64 134217727, i64 268435455, i64 536870911, i64 1073741823, i64 2147483647, i64 4294967295], align 16
@inbuf = global i8* null, align 8
@outfd = common global i32 0, align 4
@zipfd = common global i32 0, align 4
@outbuf = common global i8* null, align 8
@outout = common global i8* null, align 8
@stderr = external global %struct._IO_FILE*, align 8
@.str = private unnamed_addr constant [38 x i8] c"error:  can't allocate unzip buffers\0A\00", align 1
@hold = internal global i8* null, align 8
@bits_left = common global i32 0, align 4
@bitbuf = common global i64 0, align 8
@outpos = common global i64 0, align 8
@outcnt = common global i32 0, align 4
@outptr = common global i8* null, align 8
@zipeof = common global i8 0, align 1
@incnt = common global i32 0, align 4
@.str.1 = private unnamed_addr constant [50 x i8] c"\0AERROR: unexpected end of compressed data input.\0A\00", align 1
@inptr = common global i8* null, align 8
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_unzip = private constant [5 x i8] c"unzip"
@__profc_unzip = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_unzip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2238890532066872310, i64 93274860650, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*)* @unzip to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [7 x i8] c"\05\00unzip", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_unzip to i8*), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @unzip(%struct._IO_FILE*, %struct._IO_FILE*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i32, align 4
  store %struct._IO_FILE* %0, %struct._IO_FILE** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i32 0, i32* %6, align 4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %8 = call i32 @fileno(%struct._IO_FILE* %7) #4
  store i32 %8, i32* @outfd, align 4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %10 = call i32 @fileno(%struct._IO_FILE* %9) #4
  store i32 %10, i32* @zipfd, align 4
  %11 = call i8* (i32, ...) bitcast (i8* (...)* @malloc to i8* (i32, ...)*)(i32 8196)
  store i8* %11, i8** @inbuf, align 8
  %12 = call i8* (i32, ...) bitcast (i8* (...)* @malloc to i8* (i32, ...)*)(i32 8193)
  store i8* %12, i8** @outbuf, align 8
  %13 = load i8*, i8** @outbuf, align 8
  store i8* %13, i8** @outout, align 8
  %14 = load i8*, i8** @inbuf, align 8
  %15 = icmp eq i8* %14, null
  br i1 %15, label %24, label %16

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 1)
  %18 = load i8*, i8** @outbuf, align 8
  %19 = icmp eq i8* %18, null
  br i1 %19, label %24, label %20

; <label>:20:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 2)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 2)
  %22 = load i8*, i8** @outout, align 8
  %23 = icmp eq i8* %22, null
  br i1 %23, label %24, label %28

; <label>:24:                                     ; preds = %20, %16, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 0)
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str, i32 0, i32 0))
  store i32 4, i32* %3, align 4
  br label %70

; <label>:28:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 3)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 3)
  %30 = load i8*, i8** @inbuf, align 8
  %31 = getelementptr inbounds i8, i8* %30, i64 8192
  store i8* %31, i8** @hold, align 8
  store i32 0, i32* @bits_left, align 4
  store i64 0, i64* @bitbuf, align 8
  store i64 0, i64* @outpos, align 8
  store i32 0, i32* @outcnt, align 4
  %32 = load i8*, i8** @outbuf, align 8
  store i8* %32, i8** @outptr, align 8
  store i8 0, i8* @zipeof, align 1
  %33 = load i8*, i8** @outbuf, align 8
  call void @llvm.memset.p0i8.i64(i8* %33, i8 0, i64 8192, i32 1, i1 false)
  %34 = load i32, i32* @zipfd, align 4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %36 = call i64 @ftell(%struct._IO_FILE* %35)
  %37 = call i64 @lseek(i32 %34, i64 %36, i32 0) #4
  %38 = load i32, i32* @zipfd, align 4
  %39 = load i8*, i8** @inbuf, align 8
  %40 = call i64 @read(i32 %38, i8* %39, i64 8192)
  %41 = trunc i64 %40 to i32
  store i32 %41, i32* @incnt, align 4
  %42 = icmp sle i32 %41, 0
  br i1 %42, label %43, label %48

; <label>:43:                                     ; preds = %28
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 4)
  %44 = add i64 %pgocount4, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 4)
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i8* @LANG(i8* getelementptr inbounds ([50 x i8], [50 x i8]* @.str.1, i32 0, i32 0))
  %47 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %45, i8* %46)
  store i32 -1, i32* %6, align 4
  br label %48

; <label>:48:                                     ; preds = %43, %28
  %49 = load i8*, i8** @inbuf, align 8
  store i8* %49, i8** @inptr, align 8
  %50 = load i32, i32* %6, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %55

; <label>:52:                                     ; preds = %48
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 5)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 5)
  %54 = call i32 @inflate()
  store i32 %54, i32* %6, align 4
  br label %55

; <label>:55:                                     ; preds = %52, %48
  %56 = load i32, i32* %6, align 4
  %57 = icmp eq i32 %56, 0
  br i1 %57, label %58, label %64

; <label>:58:                                     ; preds = %55
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 6)
  %59 = add i64 %pgocount6, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 6)
  %60 = call i32 @FlushOutput()
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %64

; <label>:62:                                     ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 7)
  %63 = add i64 %pgocount7, 1
  store i64 %63, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_unzip, i64 0, i64 7)
  store i32 -1, i32* %6, align 4
  br label %64

; <label>:64:                                     ; preds = %62, %58, %55
  %65 = load i8*, i8** @inbuf, align 8
  %66 = call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %65)
  %67 = load i8*, i8** @outbuf, align 8
  %68 = call i32 (i8*, ...) bitcast (i32 (...)* @free to i32 (i8*, ...)*)(i8* %67)
  store i8* null, i8** @outout, align 8
  store i8* null, i8** @outbuf, align 8
  store i8* null, i8** @inbuf, align 8
  %69 = load i32, i32* %6, align 4
  store i32 %69, i32* %3, align 4
  br label %70

; <label>:70:                                     ; preds = %64, %24
  %71 = load i32, i32* %3, align 4
  ret i32 %71
}

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #1

declare i8* @malloc(...) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #1

declare i64 @ftell(%struct._IO_FILE*) #2

declare i64 @read(i32, i8*, i64) #2

declare i8* @LANG(i8*) #2

declare i32 @inflate() #2

declare i32 @FlushOutput() #2

declare i32 @free(...) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'tmp1.ll'
source_filename = "mdfile.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.MD5Context = type { [4 x i64], [2 x i64], [64 x i8] }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [2 x i8] c"r\00", align 1
@pgpout = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [24 x i8] c"\0A\07Can't open file '%s'\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_MDfile0_len = private constant [11 x i8] c"MDfile0_len"
@__profn_MDfile = private constant [6 x i8] c"MDfile"
@__profn_tmp1.ll_MDfile0 = private constant [15 x i8] c"tmp1.ll:MDfile0"
@__profn_MD_addbuffer = private constant [12 x i8] c"MD_addbuffer"
@__profc_MDfile0_len = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_MDfile0_len = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1285030781703944689, i64 56521663854, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i32 0, i32 0), i8* bitcast (i32 (%struct.MD5Context*, %struct._IO_FILE*, i64)* @MDfile0_len to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_MDfile = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_MDfile = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3181821962499187297, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MDfile, i32 0, i32 0), i8* bitcast (i32 (%struct.MD5Context*, i8*)* @MDfile to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_MDfile0 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_MDfile0 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3096963076059306318, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_MDfile0, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_MD_addbuffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_MD_addbuffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5711454159379726720, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MD_addbuffer, i32 0, i32 0), i8* bitcast (void (%struct.MD5Context*, i8*, i32, i8*)* @MD_addbuffer to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [49 x i8] c"/\00MDfile0_len\01MDfile\01tmp1.ll:MDfile0\01MD_addbuffer", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_MDfile0_len to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_MDfile to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_MDfile0 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_MD_addbuffer to i8*), i8* getelementptr inbounds ([49 x i8], [49 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @MDfile0_len(%struct.MD5Context*, %struct._IO_FILE*, i64) #0 {
  %4 = alloca %struct.MD5Context*, align 8
  %5 = alloca %struct._IO_FILE*, align 8
  %6 = alloca i64, align 8
  %7 = alloca i32, align 4
  %8 = alloca [1024 x i8], align 16
  store %struct.MD5Context* %0, %struct.MD5Context** %4, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %5, align 8
  store i64 %2, i64* %6, align 8
  %9 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  call void @MD5Init(%struct.MD5Context* %9)
  br label %10

; <label>:10:                                     ; preds = %38, %3
  %11 = load i64, i64* %6, align 8
  %12 = icmp ult i64 %11, 1024
  br i1 %12, label %13, label %17

; <label>:13:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 1)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 1)
  %15 = load i64, i64* %6, align 8
  %16 = trunc i64 %15 to i32
  store i32 %16, i32* %7, align 4
  br label %19

; <label>:17:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 2)
  store i32 1024, i32* %7, align 4
  br label %19

; <label>:19:                                     ; preds = %17, %13
  %20 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  %21 = load i32, i32* %7, align 4
  %22 = sext i32 %21 to i64
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %24 = call i64 @fread(i8* %20, i64 1, i64 %22, %struct._IO_FILE* %23)
  %25 = trunc i64 %24 to i32
  store i32 %25, i32* %7, align 4
  %26 = load i32, i32* %7, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %28, label %37

; <label>:28:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 0)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 0)
  %30 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  %31 = getelementptr inbounds [1024 x i8], [1024 x i8]* %8, i32 0, i32 0
  %32 = load i32, i32* %7, align 4
  call void @MD5Update(%struct.MD5Context* %30, i8* %31, i32 %32)
  %33 = load i32, i32* %7, align 4
  %34 = sext i32 %33 to i64
  %35 = load i64, i64* %6, align 8
  %36 = sub i64 %35, %34
  store i64 %36, i64* %6, align 8
  br label %37

; <label>:37:                                     ; preds = %28, %19
  br label %38

; <label>:38:                                     ; preds = %37
  %39 = load i32, i32* %7, align 4
  %40 = icmp eq i32 %39, 1024
  br i1 %40, label %10, label %41

; <label>:41:                                     ; preds = %38
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 3)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_MDfile0_len, i64 0, i64 3)
  ret i32 0
}

declare void @MD5Init(%struct.MD5Context*) #1

declare i64 @fread(i8*, i64, i64, %struct._IO_FILE*) #1

declare void @MD5Update(%struct.MD5Context*, i8*, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @MDfile(%struct.MD5Context*, i8*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.MD5Context*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct._IO_FILE*, align 8
  store %struct.MD5Context* %0, %struct.MD5Context** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = load i8*, i8** %5, align 8
  %8 = call %struct._IO_FILE* @fopen(i8* %7, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  store %struct._IO_FILE* %8, %struct._IO_FILE** %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %10 = icmp eq %struct._IO_FILE* %9, null
  br i1 %10, label %11, label %17

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MDfile, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MDfile, i64 0, i64 1)
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @pgpout, align 8
  %14 = call i8* @LANG(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @.str.1, i32 0, i32 0))
  %15 = load i8*, i8** %5, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* %14, i8* %15)
  store i32 -1, i32* %3, align 4
  br label %24

; <label>:17:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MDfile, i64 0, i64 0)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MDfile, i64 0, i64 0)
  %19 = load %struct.MD5Context*, %struct.MD5Context** %4, align 8
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %21 = call i32 @MDfile0(%struct.MD5Context* %19, %struct._IO_FILE* %20)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** %6, align 8
  %23 = call i32 @fclose(%struct._IO_FILE* %22)
  store i32 0, i32* %3, align 4
  br label %24

; <label>:24:                                     ; preds = %17, %11
  %25 = load i32, i32* %3, align 4
  ret i32 %25
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

declare i8* @LANG(i8*) #1

; Function Attrs: noinline nounwind uwtable
define internal i32 @MDfile0(%struct.MD5Context*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct.MD5Context*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca [1024 x i8], align 16
  store %struct.MD5Context* %0, %struct.MD5Context** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  %7 = load %struct.MD5Context*, %struct.MD5Context** %3, align 8
  call void @MD5Init(%struct.MD5Context* %7)
  br label %8

; <label>:8:                                      ; preds = %14, %2
  %9 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  %11 = call i64 @fread(i8* %9, i64 1, i64 1024, %struct._IO_FILE* %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %5, align 4
  %13 = icmp ne i32 %12, 0
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_MDfile0, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_MDfile0, i64 0, i64 0)
  %16 = load %struct.MD5Context*, %struct.MD5Context** %3, align 8
  %17 = getelementptr inbounds [1024 x i8], [1024 x i8]* %6, i32 0, i32 0
  %18 = load i32, i32* %5, align 4
  call void @MD5Update(%struct.MD5Context* %16, i8* %17, i32 %18)
  br label %8

; <label>:19:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_MDfile0, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_MDfile0, i64 0, i64 1)
  ret i32 0
}

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: noinline nounwind uwtable
define void @MD_addbuffer(%struct.MD5Context*, i8*, i32, i8*) #0 {
  %5 = alloca %struct.MD5Context*, align 8
  %6 = alloca i8*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i8*, align 8
  store %struct.MD5Context* %0, %struct.MD5Context** %5, align 8
  store i8* %1, i8** %6, align 8
  store i32 %2, i32* %7, align 4
  store i8* %3, i8** %8, align 8
  %9 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  %10 = load i8*, i8** %6, align 8
  %11 = load i32, i32* %7, align 4
  call void @MD5Update(%struct.MD5Context* %9, i8* %10, i32 %11)
  %12 = load i8*, i8** %8, align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MD_addbuffer, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MD_addbuffer, i64 0, i64 1)
  %16 = load i8*, i8** %8, align 8
  %17 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  call void @MD5Final(i8* %16, %struct.MD5Context* %17)
  %18 = load %struct.MD5Context*, %struct.MD5Context** %5, align 8
  %19 = bitcast %struct.MD5Context* %18 to i8*
  call void @llvm.memset.p0i8.i64(i8* %19, i8 0, i64 112, i32 1, i1 false)
  br label %20

; <label>:20:                                     ; preds = %14, %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MD_addbuffer, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_MD_addbuffer, i64 0, i64 0)
  ret void
}

declare void @MD5Final(i8*, %struct.MD5Context*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

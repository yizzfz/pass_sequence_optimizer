; ModuleID = 'bitfiles.2.ll'
source_filename = "bitfiles.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bfile = type { %struct._IO_FILE*, i8, i8, i8, i8 }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_bfopen = private constant [6 x i8] c"bfopen"
@__profn_bfread = private constant [6 x i8] c"bfread"
@__profn_bfwrite = private constant [7 x i8] c"bfwrite"
@__profn_bfclose = private constant [7 x i8] c"bfclose"
@__profc_bfopen = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bfopen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1332369740865987884, i64 42754363654, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i32 0, i32 0), i8* bitcast (%struct.bfile* (i8*, i8*)* @bfopen to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bfread = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bfread = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4109297680557960864, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfread, i32 0, i32 0), i8* bitcast (i32 (%struct.bfile*)* @bfread to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bfwrite = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bfwrite = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7271676091199105361, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfwrite, i32 0, i32 0), i8* bitcast (void (i32, %struct.bfile*)* @bfwrite to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bfclose = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bfclose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4179791848509864938, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bfclose, i32 0, i32 0), i8* bitcast (void (%struct.bfile*)* @bfclose to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [31 x i8] c"\1D\00bfopen\01bfread\01bfwrite\01bfclose", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bfopen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bfread to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bfwrite to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bfclose to i8*), i8* getelementptr inbounds ([31 x i8], [31 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define %struct.bfile* @bfopen(i8*, i8*) #0 {
  %3 = alloca %struct.bfile*, align 8
  %4 = alloca i8*, align 8
  %5 = alloca i8*, align 8
  %6 = alloca %struct.bfile*, align 8
  store i8* %0, i8** %4, align 8
  store i8* %1, i8** %5, align 8
  %7 = call noalias i8* @malloc(i64 16) #3
  %8 = bitcast i8* %7 to %struct.bfile*
  store %struct.bfile* %8, %struct.bfile** %6, align 8
  %9 = load %struct.bfile*, %struct.bfile** %6, align 8
  %10 = icmp eq %struct.bfile* null, %9
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 1)
  store %struct.bfile* null, %struct.bfile** %3, align 8
  br label %34

; <label>:13:                                     ; preds = %2
  %14 = load i8*, i8** %4, align 8
  %15 = load i8*, i8** %5, align 8
  %16 = call %struct._IO_FILE* @fopen(i8* %14, i8* %15)
  %17 = load %struct.bfile*, %struct.bfile** %6, align 8
  %18 = getelementptr inbounds %struct.bfile, %struct.bfile* %17, i32 0, i32 0
  store %struct._IO_FILE* %16, %struct._IO_FILE** %18, align 8
  %19 = load %struct.bfile*, %struct.bfile** %6, align 8
  %20 = getelementptr inbounds %struct.bfile, %struct.bfile* %19, i32 0, i32 0
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** %20, align 8
  %22 = icmp eq %struct._IO_FILE* null, %21
  br i1 %22, label %23, label %27

; <label>:23:                                     ; preds = %13
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 2)
  %25 = load %struct.bfile*, %struct.bfile** %6, align 8
  %26 = bitcast %struct.bfile* %25 to i8*
  call void @free(i8* %26) #3
  store %struct.bfile* null, %struct.bfile** %3, align 8
  br label %34

; <label>:27:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_bfopen, i64 0, i64 0)
  %29 = load %struct.bfile*, %struct.bfile** %6, align 8
  %30 = getelementptr inbounds %struct.bfile, %struct.bfile* %29, i32 0, i32 2
  store i8 0, i8* %30, align 1
  %31 = load %struct.bfile*, %struct.bfile** %6, align 8
  %32 = getelementptr inbounds %struct.bfile, %struct.bfile* %31, i32 0, i32 4
  store i8 0, i8* %32, align 1
  %33 = load %struct.bfile*, %struct.bfile** %6, align 8
  store %struct.bfile* %33, %struct.bfile** %3, align 8
  br label %34

; <label>:34:                                     ; preds = %27, %23, %11
  %35 = load %struct.bfile*, %struct.bfile** %3, align 8
  ret %struct.bfile* %35
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

declare %struct._IO_FILE* @fopen(i8*, i8*) #2

; Function Attrs: nounwind
declare void @free(i8*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @bfread(%struct.bfile*) #0 {
  %2 = alloca %struct.bfile*, align 8
  store %struct.bfile* %0, %struct.bfile** %2, align 8
  %3 = load %struct.bfile*, %struct.bfile** %2, align 8
  %4 = getelementptr inbounds %struct.bfile, %struct.bfile* %3, i32 0, i32 2
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp eq i32 0, %6
  br i1 %7, label %8, label %19

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfread, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfread, i64 0, i64 1)
  %10 = load %struct.bfile*, %struct.bfile** %2, align 8
  %11 = getelementptr inbounds %struct.bfile, %struct.bfile* %10, i32 0, i32 0
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** %11, align 8
  %13 = call i32 @fgetc(%struct._IO_FILE* %12)
  %14 = trunc i32 %13 to i8
  %15 = load %struct.bfile*, %struct.bfile** %2, align 8
  %16 = getelementptr inbounds %struct.bfile, %struct.bfile* %15, i32 0, i32 1
  store i8 %14, i8* %16, align 8
  %17 = load %struct.bfile*, %struct.bfile** %2, align 8
  %18 = getelementptr inbounds %struct.bfile, %struct.bfile* %17, i32 0, i32 2
  store i8 8, i8* %18, align 1
  br label %19

; <label>:19:                                     ; preds = %8, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfread, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfread, i64 0, i64 0)
  %21 = load %struct.bfile*, %struct.bfile** %2, align 8
  %22 = getelementptr inbounds %struct.bfile, %struct.bfile* %21, i32 0, i32 2
  %23 = load i8, i8* %22, align 1
  %24 = add i8 %23, -1
  store i8 %24, i8* %22, align 1
  %25 = load %struct.bfile*, %struct.bfile** %2, align 8
  %26 = getelementptr inbounds %struct.bfile, %struct.bfile* %25, i32 0, i32 1
  %27 = load i8, i8* %26, align 8
  %28 = sext i8 %27 to i32
  %29 = load %struct.bfile*, %struct.bfile** %2, align 8
  %30 = getelementptr inbounds %struct.bfile, %struct.bfile* %29, i32 0, i32 2
  %31 = load i8, i8* %30, align 1
  %32 = sext i8 %31 to i32
  %33 = shl i32 1, %32
  %34 = and i32 %28, %33
  %35 = icmp ne i32 %34, 0
  %36 = zext i1 %35 to i32
  ret i32 %36
}

declare i32 @fgetc(%struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define void @bfwrite(i32, %struct.bfile*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.bfile*, align 8
  store i32 %0, i32* %3, align 4
  store %struct.bfile* %1, %struct.bfile** %4, align 8
  %5 = load %struct.bfile*, %struct.bfile** %4, align 8
  %6 = getelementptr inbounds %struct.bfile, %struct.bfile* %5, i32 0, i32 4
  %7 = load i8, i8* %6, align 1
  %8 = sext i8 %7 to i32
  %9 = icmp eq i32 8, %8
  br i1 %9, label %10, label %22

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfwrite, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfwrite, i64 0, i64 1)
  %12 = load %struct.bfile*, %struct.bfile** %4, align 8
  %13 = getelementptr inbounds %struct.bfile, %struct.bfile* %12, i32 0, i32 3
  %14 = load i8, i8* %13, align 2
  %15 = sext i8 %14 to i32
  %16 = load %struct.bfile*, %struct.bfile** %4, align 8
  %17 = getelementptr inbounds %struct.bfile, %struct.bfile* %16, i32 0, i32 0
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** %17, align 8
  %19 = call i32 @fputc(i32 %15, %struct._IO_FILE* %18)
  %20 = load %struct.bfile*, %struct.bfile** %4, align 8
  %21 = getelementptr inbounds %struct.bfile, %struct.bfile* %20, i32 0, i32 4
  store i8 0, i8* %21, align 1
  br label %22

; <label>:22:                                     ; preds = %10, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfwrite, i64 0, i64 0)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_bfwrite, i64 0, i64 0)
  %24 = load %struct.bfile*, %struct.bfile** %4, align 8
  %25 = getelementptr inbounds %struct.bfile, %struct.bfile* %24, i32 0, i32 4
  %26 = load i8, i8* %25, align 1
  %27 = add i8 %26, 1
  store i8 %27, i8* %25, align 1
  %28 = load %struct.bfile*, %struct.bfile** %4, align 8
  %29 = getelementptr inbounds %struct.bfile, %struct.bfile* %28, i32 0, i32 3
  %30 = load i8, i8* %29, align 2
  %31 = sext i8 %30 to i32
  %32 = shl i32 %31, 1
  %33 = trunc i32 %32 to i8
  store i8 %33, i8* %29, align 2
  %34 = load i32, i32* %3, align 4
  %35 = and i32 %34, 1
  %36 = load %struct.bfile*, %struct.bfile** %4, align 8
  %37 = getelementptr inbounds %struct.bfile, %struct.bfile* %36, i32 0, i32 3
  %38 = load i8, i8* %37, align 2
  %39 = sext i8 %38 to i32
  %40 = or i32 %39, %35
  %41 = trunc i32 %40 to i8
  store i8 %41, i8* %37, align 2
  ret void
}

declare i32 @fputc(i32, %struct._IO_FILE*) #2

; Function Attrs: noinline nounwind uwtable
define void @bfclose(%struct.bfile*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bfclose, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_bfclose, i64 0, i64 0)
  %3 = alloca %struct.bfile*, align 8
  store %struct.bfile* %0, %struct.bfile** %3, align 8
  %4 = load %struct.bfile*, %struct.bfile** %3, align 8
  %5 = getelementptr inbounds %struct.bfile, %struct.bfile* %4, i32 0, i32 0
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** %5, align 8
  %7 = call i32 @fclose(%struct._IO_FILE* %6)
  %8 = load %struct.bfile*, %struct.bfile** %3, align 8
  %9 = bitcast %struct.bfile* %8 to i8*
  call void @free(i8* %9) #3
  ret void
}

declare i32 @fclose(%struct._IO_FILE*) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'tmp1.ll'
source_filename = "zipup.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@ifile = internal global i32 0, align 4
@level = external global i32, align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_zipup = private constant [5 x i8] c"zipup"
@__profn_read_buf = private constant [8 x i8] c"read_buf"
@__profc_zipup = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_zipup = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6586839961568905153, i64 72057619609227010, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i32 0, i32 0), i8* bitcast (i32 (%struct._IO_FILE*, %struct._IO_FILE*)* @zipup to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_read_buf = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_read_buf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3091948261166222732, i64 37869605968, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i32 0, i32 0), i8* bitcast (i32 (i8*, i32)* @read_buf to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [16 x i8] c"\0E\00zipup\01read_buf", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_zipup to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_read_buf to i8*), i8* getelementptr inbounds ([16 x i8], [16 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @zipup(%struct._IO_FILE*, %struct._IO_FILE*) #0 {
  %3 = alloca %struct._IO_FILE*, align 8
  %4 = alloca %struct._IO_FILE*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  store %struct._IO_FILE* %0, %struct._IO_FILE** %3, align 8
  store %struct._IO_FILE* %1, %struct._IO_FILE** %4, align 8
  store i64 -1, i64* %6, align 8
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** %3, align 8
  %10 = call i32 @fileno(%struct._IO_FILE* %9) #3
  store i32 %10, i32* @ifile, align 4
  %11 = load i32, i32* @ifile, align 4
  %12 = call i64 @lseek(i32 %11, i64 0, i32 2) #3
  store i64 %12, i64* %6, align 8
  %13 = load i32, i32* @ifile, align 4
  %14 = call i64 @lseek(i32 %13, i64 0, i32 0) #3
  %15 = load i64, i64* %6, align 8
  %16 = icmp eq i64 %15, 0
  %17 = zext i1 %16 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 2)
  %18 = add i64 %pgocount, %17
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 2)
  %19 = select i1 %16, i32 0, i32 8
  store i32 %19, i32* %5, align 4
  %20 = load i32, i32* %5, align 4
  %21 = icmp eq i32 %20, 8
  br i1 %21, label %22, label %27

; <label>:22:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 1)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 1)
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** %4, align 8
  call void @bi_init(%struct._IO_FILE* %24)
  store i16 -1, i16* %7, align 2
  call void @ct_init(i16* %7, i32* %5)
  %25 = load i32, i32* @level, align 4
  call void @lm_init(i32 %25, i16* %8)
  %26 = call i64 @deflate()
  br label %27

; <label>:27:                                     ; preds = %22, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_zipup, i64 0, i64 0)
  call void (...) @lm_free()
  call void (...) @ct_free()
  ret i32 0
}

; Function Attrs: nounwind
declare i32 @fileno(%struct._IO_FILE*) #1

; Function Attrs: nounwind
declare i64 @lseek(i32, i64, i32) #1

declare void @bi_init(%struct._IO_FILE*) #2

declare void @ct_init(i16*, i32*) #2

declare void @lm_init(i32, i16*) #2

declare i64 @deflate() #2

declare void @lm_free(...) #2

declare void @ct_free(...) #2

; Function Attrs: noinline nounwind uwtable
define i32 @read_buf(i8*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i8* %0, i8** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load i32, i32* @ifile, align 4
  %8 = load i8*, i8** %4, align 8
  %9 = load i32, i32* %5, align 4
  %10 = zext i32 %9 to i64
  %11 = call i64 @read(i32 %7, i8* %8, i64 %10)
  %12 = trunc i64 %11 to i32
  store i32 %12, i32* %6, align 4
  %13 = load i32, i32* %6, align 4
  %14 = icmp eq i32 %13, -1
  br i1 %14, label %19, label %15

; <label>:15:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 0)
  %17 = load i32, i32* %6, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %22

; <label>:19:                                     ; preds = %15, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 1)
  %21 = load i32, i32* %6, align 4
  store i32 %21, i32* %3, align 4
  br label %25

; <label>:22:                                     ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_read_buf, i64 0, i64 2)
  %24 = load i32, i32* %6, align 4
  store i32 %24, i32* %3, align 4
  br label %25

; <label>:25:                                     ; preds = %22, %19
  %26 = load i32, i32* %3, align 4
  ret i32 %26
}

declare i64 @read(i32, i8*, i64) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

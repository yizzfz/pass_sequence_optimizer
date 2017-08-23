; ModuleID = 'rawdaudio.2.ll'
source_filename = "rawdaudio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.adpcm_state = type { i16, i8 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [15 x i8] c"_finfo_dataset\00", align 1
@.str.1 = private unnamed_addr constant [3 x i8] c"rt\00", align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [29 x i8] c"\0AError: Can't find dataset!\0A\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"%ld\00", align 1
@state = common global %struct.adpcm_state zeroinitializer, align 2
@abuf = common global [500 x i8] zeroinitializer, align 16
@.str.4 = private unnamed_addr constant [11 x i8] c"input file\00", align 1
@sbuf = common global [1000 x i16] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profc_main = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 77874283069, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 ()* @main to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [14 x i8] c"\04\0Cx\DA\CBM\CC\CC\03\00\04\1B\01\A6", section "__llvm_prf_names"
@llvm.used = appending global [2 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %2 = alloca %struct._IO_FILE*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i32, align 4
  %6 = alloca %struct.adpcm_state, align 2
  store i32 0, i32* %1, align 4
  store %struct._IO_FILE* null, %struct._IO_FILE** %2, align 8
  %7 = call %struct._IO_FILE* @fopen(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.1, i32 0, i32 0))
  store %struct._IO_FILE* %7, %struct._IO_FILE** %2, align 8
  %8 = icmp eq %struct._IO_FILE* %7, null
  br i1 %8, label %9, label %13

; <label>:9:                                      ; preds = %0
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 4)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 4)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([29 x i8], [29 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:13:                                     ; preds = %0
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @__isoc99_fscanf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i32 0, i32 0), i64* %4)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** %2, align 8
  %17 = call i32 @fclose(%struct._IO_FILE* %16)
  br label %18

; <label>:18:                                     ; preds = %43, %13
  %19 = bitcast %struct.adpcm_state* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* bitcast (%struct.adpcm_state* @state to i8*), i64 4, i32 2, i1 false)
  %20 = call i64 @read(i32 0, i8* getelementptr inbounds ([500 x i8], [500 x i8]* @abuf, i32 0, i32 0), i64 500)
  %21 = trunc i64 %20 to i32
  store i32 %21, i32* %5, align 4
  %22 = load i32, i32* %5, align 4
  %23 = icmp slt i32 %22, 0
  br i1 %23, label %24, label %26

; <label>:24:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 3)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 3)
  call void @perror(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.4, i32 0, i32 0))
  call void @exit(i32 1) #5
  unreachable

; <label>:26:                                     ; preds = %18
  %27 = load i32, i32* %5, align 4
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %30

; <label>:29:                                     ; preds = %26
  br label %49

; <label>:30:                                     ; preds = %26
  store i64 0, i64* %3, align 8
  br label %31

; <label>:31:                                     ; preds = %40, %30
  %32 = load i64, i64* %3, align 8
  %33 = load i64, i64* %4, align 8
  %34 = icmp slt i64 %32, %33
  br i1 %34, label %35, label %43

; <label>:35:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 0)
  %36 = add i64 %pgocount2, 1
  store i64 %36, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 0)
  %37 = bitcast %struct.adpcm_state* %6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.adpcm_state* @state to i8*), i8* %37, i64 4, i32 2, i1 false)
  %38 = load i32, i32* %5, align 4
  %39 = mul nsw i32 %38, 2
  call void @adpcm_decoder(i8* getelementptr inbounds ([500 x i8], [500 x i8]* @abuf, i32 0, i32 0), i16* getelementptr inbounds ([1000 x i16], [1000 x i16]* @sbuf, i32 0, i32 0), i32 %39, %struct.adpcm_state* @state)
  br label %40

; <label>:40:                                     ; preds = %35
  %41 = load i64, i64* %3, align 8
  %42 = add nsw i64 %41, 1
  store i64 %42, i64* %3, align 8
  br label %31

; <label>:43:                                     ; preds = %31
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 1)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 1)
  %45 = load i32, i32* %5, align 4
  %46 = mul nsw i32 %45, 4
  %47 = sext i32 %46 to i64
  %48 = call i64 @write(i32 1, i8* bitcast ([1000 x i16]* @sbuf to i8*), i64 %47)
  br label %18

; <label>:49:                                     ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 2)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_main, i64 0, i64 2)
  ret i32 0
}

declare %struct._IO_FILE* @fopen(i8*, i8*) #1

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

declare i32 @__isoc99_fscanf(%struct._IO_FILE*, i8*, ...) #1

declare i32 @fclose(%struct._IO_FILE*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

declare i64 @read(i32, i8*, i64) #1

declare void @perror(i8*) #1

declare void @adpcm_decoder(i8*, i16*, i32, %struct.adpcm_state*) #1

declare i64 @write(i32, i8*, i64) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
attributes #5 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

; ModuleID = 'tmp1.ll'
source_filename = "tif_flush.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i16)*, {}*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFFlush = private constant [9 x i8] c"TIFFFlush"
@__profn_TIFFFlushData = private constant [13 x i8] c"TIFFFlushData"
@__profc_TIFFFlush = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_TIFFFlush = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6254159494042785535, i64 64139292616, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFFlush to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_TIFFFlushData = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFFlushData = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFFlushData = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 661470143886795930, i64 281530433947167, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i32 0, i32 0), i8* bitcast (i32 (%struct.tiff*)* @TIFFFlushData to i8*), i8* bitcast ([1 x i64]* @__profvp_TIFFFlushData to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [26 x i8] c"\17\18x\DA\0B\F1tss\CB)-\CE`\0C\81\B1\5C\12K\12\01Y\B1\07\D2", section "__llvm_prf_names"
@llvm.used = appending global [4 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFlush to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFlushData to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([26 x i8], [26 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @TIFFFlush(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 2
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %29

; <label>:8:                                      ; preds = %1
  %9 = load %struct.tiff*, %struct.tiff** %3, align 8
  %10 = call i32 @TIFFFlushData(%struct.tiff* %9)
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 2)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:14:                                     ; preds = %8
  %15 = load %struct.tiff*, %struct.tiff** %3, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %15, i32 0, i32 3
  %17 = load i32, i32* %16, align 8
  %18 = and i32 %17, 8
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %27

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 3)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 3)
  %22 = load %struct.tiff*, %struct.tiff** %3, align 8
  %23 = call i32 @TIFFWriteDirectory(%struct.tiff* %22)
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %27, label %25

; <label>:25:                                     ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 4)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 4)
  store i32 0, i32* %2, align 4
  br label %31

; <label>:27:                                     ; preds = %20, %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 1)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 1)
  br label %29

; <label>:29:                                     ; preds = %27, %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 0)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_TIFFFlush, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %31

; <label>:31:                                     ; preds = %29, %25, %12
  %32 = load i32, i32* %2, align 4
  ret i32 %32
}

; Function Attrs: nounwind uwtable
define i32 @TIFFFlushData(%struct.tiff*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  %4 = load %struct.tiff*, %struct.tiff** %3, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %4, i32 0, i32 3
  %6 = load i32, i32* %5, align 8
  %7 = and i32 %6, 64
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 0)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 0)
  store i32 0, i32* %2, align 4
  br label %38

; <label>:11:                                     ; preds = %1
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 3
  %14 = load i32, i32* %13, align 8
  %15 = and i32 %14, 4096
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %34

; <label>:17:                                     ; preds = %11
  %18 = load %struct.tiff*, %struct.tiff** %3, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 3
  %20 = load i32, i32* %19, align 8
  %21 = and i32 %20, -4097
  store i32 %21, i32* %19, align 8
  %22 = load %struct.tiff*, %struct.tiff** %3, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 25
  %24 = bitcast {}** %23 to i32 (%struct.tiff*)**
  %25 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %24, align 8
  %26 = load %struct.tiff*, %struct.tiff** %3, align 8
  %27 = ptrtoint i32 (%struct.tiff*)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %27, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFFlushData to i8*), i32 0)
  %28 = call i32 %25(%struct.tiff* %26)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %32, label %30

; <label>:30:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 3)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 3)
  store i32 0, i32* %2, align 4
  br label %38

; <label>:32:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 2)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 2)
  br label %34

; <label>:34:                                     ; preds = %32, %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 1)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_TIFFFlushData, i64 0, i64 1)
  %36 = load %struct.tiff*, %struct.tiff** %3, align 8
  %37 = call i32 @TIFFFlushData1(%struct.tiff* %36)
  store i32 %37, i32* %2, align 4
  br label %38

; <label>:38:                                     ; preds = %34, %30, %9
  %39 = load i32, i32* %2, align 4
  ret i32 %39
}

declare i32 @TIFFWriteDirectory(%struct.tiff*) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #2

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}

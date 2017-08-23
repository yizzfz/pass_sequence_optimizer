; ModuleID = 'tmp1.ll'
source_filename = "tif_close.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, {}*, i32 (%struct.tiff*, i32)*, {}*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_TIFFClose = private constant [9 x i8] c"TIFFClose"
@__profc_TIFFClose = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_TIFFClose = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_TIFFClose = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1937617081743691950, i64 844497106314713, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i32 0, i32 0), i8* bitcast (void (%struct.tiff*)* @TIFFClose to i8*), i8* bitcast ([3 x i64]* @__profvp_TIFFClose to i8*), i32 6, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [19 x i8] c"\09\11x\DA\0B\F1tss\CE\C9/N\05\00\0Ej\03 ", section "__llvm_prf_names"
@llvm.used = appending global [3 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClose to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([19 x i8], [19 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @TIFFClose(%struct.tiff*) #0 {
  %2 = alloca %struct.tiff*, align 8
  store %struct.tiff* %0, %struct.tiff** %2, align 8
  %3 = load %struct.tiff*, %struct.tiff** %2, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %3, i32 0, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %11

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 1)
  %9 = load %struct.tiff*, %struct.tiff** %2, align 8
  %10 = call i32 @TIFFFlush(%struct.tiff* %9)
  br label %11

; <label>:11:                                     ; preds = %7, %1
  %12 = load %struct.tiff*, %struct.tiff** %2, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 34
  %14 = bitcast {}** %13 to void (%struct.tiff*)**
  %15 = load void (%struct.tiff*)*, void (%struct.tiff*)** %14, align 8
  %16 = load %struct.tiff*, %struct.tiff** %2, align 8
  %17 = ptrtoint void (%struct.tiff*)* %15 to i64
  call void @__llvm_profile_instrument_target(i64 %17, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClose to i8*), i32 0)
  call void %15(%struct.tiff* %16)
  %18 = load %struct.tiff*, %struct.tiff** %2, align 8
  call void @TIFFFreeDirectory(%struct.tiff* %18)
  %19 = load %struct.tiff*, %struct.tiff** %2, align 8
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %19, i32 0, i32 40
  %21 = load i8*, i8** %20, align 8
  %22 = icmp ne i8* %21, null
  br i1 %22, label %23, label %35

; <label>:23:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 2)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 2)
  %25 = load %struct.tiff*, %struct.tiff** %2, align 8
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 8
  %28 = and i32 %27, 512
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 5)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 5)
  %32 = load %struct.tiff*, %struct.tiff** %2, align 8
  %33 = getelementptr inbounds %struct.tiff, %struct.tiff* %32, i32 0, i32 40
  %34 = load i8*, i8** %33, align 8
  call void @_TIFFfree(i8* %34)
  br label %35

; <label>:35:                                     ; preds = %30, %23, %11
  %36 = load %struct.tiff*, %struct.tiff** %2, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %36, i32 0, i32 3
  %38 = load i32, i32* %37, align 8
  %39 = and i32 %38, 2048
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %56

; <label>:41:                                     ; preds = %35
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 4)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 4)
  %43 = load %struct.tiff*, %struct.tiff** %2, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 47
  %45 = load void (i8*, i8*, i32)*, void (i8*, i8*, i32)** %44, align 8
  %46 = load %struct.tiff*, %struct.tiff** %2, align 8
  %47 = getelementptr inbounds %struct.tiff, %struct.tiff* %46, i32 0, i32 48
  %48 = load i8*, i8** %47, align 8
  %49 = load %struct.tiff*, %struct.tiff** %2, align 8
  %50 = getelementptr inbounds %struct.tiff, %struct.tiff* %49, i32 0, i32 44
  %51 = load i8*, i8** %50, align 8
  %52 = load %struct.tiff*, %struct.tiff** %2, align 8
  %53 = getelementptr inbounds %struct.tiff, %struct.tiff* %52, i32 0, i32 45
  %54 = load i32, i32* %53, align 8
  %55 = ptrtoint void (i8*, i8*, i32)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %55, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClose to i8*), i32 1)
  call void %45(i8* %48, i8* %51, i32 %54)
  br label %56

; <label>:56:                                     ; preds = %41, %35
  %57 = load %struct.tiff*, %struct.tiff** %2, align 8
  %58 = getelementptr inbounds %struct.tiff, %struct.tiff* %57, i32 0, i32 52
  %59 = load i32 (i8*)*, i32 (i8*)** %58, align 8
  %60 = load %struct.tiff*, %struct.tiff** %2, align 8
  %61 = getelementptr inbounds %struct.tiff, %struct.tiff* %60, i32 0, i32 48
  %62 = load i8*, i8** %61, align 8
  %63 = ptrtoint i32 (i8*)* %59 to i64
  call void @__llvm_profile_instrument_target(i64 %63, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_TIFFClose to i8*), i32 2)
  %64 = call i32 %59(i8* %62)
  %65 = load %struct.tiff*, %struct.tiff** %2, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 55
  %67 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %66, align 8
  %68 = icmp ne %struct.TIFFFieldInfo** %67, null
  br i1 %68, label %69, label %75

; <label>:69:                                     ; preds = %56
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 3)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 3)
  %71 = load %struct.tiff*, %struct.tiff** %2, align 8
  %72 = getelementptr inbounds %struct.tiff, %struct.tiff* %71, i32 0, i32 55
  %73 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %72, align 8
  %74 = bitcast %struct.TIFFFieldInfo** %73 to i8*
  call void @_TIFFfree(i8* %74)
  br label %75

; <label>:75:                                     ; preds = %69, %56
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 0)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_TIFFClose, i64 0, i64 0)
  %77 = load %struct.tiff*, %struct.tiff** %2, align 8
  %78 = bitcast %struct.tiff* %77 to i8*
  call void @_TIFFfree(i8* %78)
  ret void
}

declare i32 @TIFFFlush(%struct.tiff*) #1

declare void @TIFFFreeDirectory(%struct.tiff*) #1

declare void @_TIFFfree(i8*) #1

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

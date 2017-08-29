; ModuleID = 'tif_dumpmode.ll'
source_filename = "tif_dumpmode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [48 x i8] c"DumpModeDecode: Not enough data for scanline %d\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFInitDumpMode(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = load %struct.tiff*, %struct.tiff** %3, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %8, i32 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %9, align 8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %11, align 8
  %12 = load %struct.tiff*, %struct.tiff** %3, align 8
  %13 = getelementptr inbounds %struct.tiff, %struct.tiff* %12, i32 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %13, align 8
  %14 = load %struct.tiff*, %struct.tiff** %3, align 8
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %14, i32 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %15, align 8
  %16 = load %struct.tiff*, %struct.tiff** %3, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %17, align 8
  %18 = load %struct.tiff*, %struct.tiff** %3, align 8
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %18, i32 0, i32 33
  store i32 (%struct.tiff*, i32)* @DumpModeSeek, i32 (%struct.tiff*, i32)** %19, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeDecode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %10 = load i16, i16* %9, align 2
  %11 = load %struct.tiff*, %struct.tiff** %6, align 8
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %11, i32 0, i32 43
  %13 = load i32, i32* %12, align 8
  %14 = load i32, i32* %8, align 4
  %15 = icmp slt i32 %13, %14
  br i1 %15, label %16, label %23

; <label>:16:                                     ; preds = %4
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = load %struct.tiff*, %struct.tiff** %6, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 11
  %22 = load i32, i32* %21, align 8
  call void (i8*, i8*, ...) @TIFFError(i8* %19, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i32 0, i32 0), i32 %22)
  store i32 0, i32* %5, align 4
  br label %47

; <label>:23:                                     ; preds = %4
  %24 = load %struct.tiff*, %struct.tiff** %6, align 8
  %25 = getelementptr inbounds %struct.tiff, %struct.tiff* %24, i32 0, i32 42
  %26 = load i8*, i8** %25, align 8
  %27 = load i8*, i8** %7, align 8
  %28 = icmp ne i8* %26, %27
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %23
  %30 = load i8*, i8** %7, align 8
  %31 = load %struct.tiff*, %struct.tiff** %6, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %31, i32 0, i32 42
  %33 = load i8*, i8** %32, align 8
  %34 = load i32, i32* %8, align 4
  call void @_TIFFmemcpy(i8* %30, i8* %33, i32 %34)
  br label %35

; <label>:35:                                     ; preds = %29, %23
  %36 = load i32, i32* %8, align 4
  %37 = load %struct.tiff*, %struct.tiff** %6, align 8
  %38 = getelementptr inbounds %struct.tiff, %struct.tiff* %37, i32 0, i32 42
  %39 = load i8*, i8** %38, align 8
  %40 = sext i32 %36 to i64
  %41 = getelementptr inbounds i8, i8* %39, i64 %40
  store i8* %41, i8** %38, align 8
  %42 = load i32, i32* %8, align 4
  %43 = load %struct.tiff*, %struct.tiff** %6, align 8
  %44 = getelementptr inbounds %struct.tiff, %struct.tiff* %43, i32 0, i32 43
  %45 = load i32, i32* %44, align 8
  %46 = sub nsw i32 %45, %42
  store i32 %46, i32* %44, align 8
  store i32 1, i32* %5, align 4
  br label %47

; <label>:47:                                     ; preds = %35, %16
  %48 = load i32, i32* %5, align 4
  ret i32 %48
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeEncode(%struct.tiff*, i8*, i32, i16 zeroext) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.tiff*, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %6, align 8
  store i8* %1, i8** %7, align 8
  store i32 %2, i32* %8, align 4
  store i16 %3, i16* %9, align 2
  %11 = load i16, i16* %9, align 2
  br label %12

; <label>:12:                                     ; preds = %77, %4
  %13 = load i32, i32* %8, align 4
  %14 = icmp sgt i32 %13, 0
  br i1 %14, label %15, label %78

; <label>:15:                                     ; preds = %12
  %16 = load i32, i32* %8, align 4
  store i32 %16, i32* %10, align 4
  %17 = load %struct.tiff*, %struct.tiff** %6, align 8
  %18 = getelementptr inbounds %struct.tiff, %struct.tiff* %17, i32 0, i32 43
  %19 = load i32, i32* %18, align 8
  %20 = load i32, i32* %10, align 4
  %21 = add nsw i32 %19, %20
  %22 = load %struct.tiff*, %struct.tiff** %6, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %22, i32 0, i32 41
  %24 = load i32, i32* %23, align 8
  %25 = icmp sgt i32 %21, %24
  br i1 %25, label %26, label %34

; <label>:26:                                     ; preds = %15
  %27 = load %struct.tiff*, %struct.tiff** %6, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %27, i32 0, i32 41
  %29 = load i32, i32* %28, align 8
  %30 = load %struct.tiff*, %struct.tiff** %6, align 8
  %31 = getelementptr inbounds %struct.tiff, %struct.tiff* %30, i32 0, i32 43
  %32 = load i32, i32* %31, align 8
  %33 = sub nsw i32 %29, %32
  store i32 %33, i32* %10, align 4
  br label %34

; <label>:34:                                     ; preds = %26, %15
  %35 = load %struct.tiff*, %struct.tiff** %6, align 8
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %35, i32 0, i32 42
  %37 = load i8*, i8** %36, align 8
  %38 = load i8*, i8** %7, align 8
  %39 = icmp ne i8* %37, %38
  br i1 %39, label %40, label %46

; <label>:40:                                     ; preds = %34
  %41 = load %struct.tiff*, %struct.tiff** %6, align 8
  %42 = getelementptr inbounds %struct.tiff, %struct.tiff* %41, i32 0, i32 42
  %43 = load i8*, i8** %42, align 8
  %44 = load i8*, i8** %7, align 8
  %45 = load i32, i32* %10, align 4
  call void @_TIFFmemcpy(i8* %43, i8* %44, i32 %45)
  br label %46

; <label>:46:                                     ; preds = %40, %34
  %47 = load i32, i32* %10, align 4
  %48 = load %struct.tiff*, %struct.tiff** %6, align 8
  %49 = getelementptr inbounds %struct.tiff, %struct.tiff* %48, i32 0, i32 42
  %50 = load i8*, i8** %49, align 8
  %51 = sext i32 %47 to i64
  %52 = getelementptr inbounds i8, i8* %50, i64 %51
  store i8* %52, i8** %49, align 8
  %53 = load i32, i32* %10, align 4
  %54 = load %struct.tiff*, %struct.tiff** %6, align 8
  %55 = getelementptr inbounds %struct.tiff, %struct.tiff* %54, i32 0, i32 43
  %56 = load i32, i32* %55, align 8
  %57 = add nsw i32 %56, %53
  store i32 %57, i32* %55, align 8
  %58 = load i32, i32* %10, align 4
  %59 = load i8*, i8** %7, align 8
  %60 = sext i32 %58 to i64
  %61 = getelementptr inbounds i8, i8* %59, i64 %60
  store i8* %61, i8** %7, align 8
  %62 = load i32, i32* %10, align 4
  %63 = load i32, i32* %8, align 4
  %64 = sub nsw i32 %63, %62
  store i32 %64, i32* %8, align 4
  %65 = load %struct.tiff*, %struct.tiff** %6, align 8
  %66 = getelementptr inbounds %struct.tiff, %struct.tiff* %65, i32 0, i32 43
  %67 = load i32, i32* %66, align 8
  %68 = load %struct.tiff*, %struct.tiff** %6, align 8
  %69 = getelementptr inbounds %struct.tiff, %struct.tiff* %68, i32 0, i32 41
  %70 = load i32, i32* %69, align 8
  %71 = icmp sge i32 %67, %70
  br i1 %71, label %72, label %77

; <label>:72:                                     ; preds = %46
  %73 = load %struct.tiff*, %struct.tiff** %6, align 8
  %74 = call i32 @TIFFFlushData1(%struct.tiff* %73)
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %77, label %76

; <label>:76:                                     ; preds = %72
  store i32 -1, i32* %5, align 4
  br label %79

; <label>:77:                                     ; preds = %72, %46
  br label %12

; <label>:78:                                     ; preds = %12
  store i32 1, i32* %5, align 4
  br label %79

; <label>:79:                                     ; preds = %78, %76
  %80 = load i32, i32* %5, align 4
  ret i32 %80
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeSeek(%struct.tiff*, i32) #0 {
  %3 = alloca %struct.tiff*, align 8
  %4 = alloca i32, align 4
  store %struct.tiff* %0, %struct.tiff** %3, align 8
  store i32 %1, i32* %4, align 4
  %5 = load i32, i32* %4, align 4
  %6 = load %struct.tiff*, %struct.tiff** %3, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %6, i32 0, i32 38
  %8 = load i32, i32* %7, align 8
  %9 = mul i32 %5, %8
  %10 = load %struct.tiff*, %struct.tiff** %3, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %10, i32 0, i32 42
  %12 = load i8*, i8** %11, align 8
  %13 = zext i32 %9 to i64
  %14 = getelementptr inbounds i8, i8* %12, i64 %13
  store i8* %14, i8** %11, align 8
  %15 = load i32, i32* %4, align 4
  %16 = load %struct.tiff*, %struct.tiff** %3, align 8
  %17 = getelementptr inbounds %struct.tiff, %struct.tiff* %16, i32 0, i32 38
  %18 = load i32, i32* %17, align 8
  %19 = mul i32 %15, %18
  %20 = load %struct.tiff*, %struct.tiff** %3, align 8
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %20, i32 0, i32 43
  %22 = load i32, i32* %21, align 8
  %23 = sub i32 %22, %19
  store i32 %23, i32* %21, align 8
  ret i32 1
}

declare void @TIFFError(i8*, i8*, ...) #1

declare void @_TIFFmemcpy(i8*, i8*, i32) #1

declare i32 @TIFFFlushData1(%struct.tiff*) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

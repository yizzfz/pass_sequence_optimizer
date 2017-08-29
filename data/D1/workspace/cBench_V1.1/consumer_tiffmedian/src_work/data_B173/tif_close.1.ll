; ModuleID = 'tif_close.ll'
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

; Function Attrs: noinline nounwind uwtable
define void @TIFFClose(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %7, label %5

; <label>:5:                                      ; preds = %1
  %6 = tail call i32 @TIFFFlush(%struct.tiff* nonnull %0) #2
  br label %7

; <label>:7:                                      ; preds = %1, %5
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 34
  %9 = bitcast {}** %8 to void (%struct.tiff*)**
  %10 = load void (%struct.tiff*)*, void (%struct.tiff*)** %9, align 8
  tail call void %10(%struct.tiff* nonnull %0) #2
  tail call void @TIFFFreeDirectory(%struct.tiff* nonnull %0) #2
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 40
  %12 = load i8*, i8** %11, align 8
  %13 = icmp eq i8* %12, null
  br i1 %13, label %20, label %14

; <label>:14:                                     ; preds = %7
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %16 = load i32, i32* %15, align 8
  %17 = and i32 %16, 512
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %20, label %19

; <label>:19:                                     ; preds = %14
  tail call void @_TIFFfree(i8* nonnull %12) #2
  br label %20

; <label>:20:                                     ; preds = %14, %7, %19
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %22 = load i32, i32* %21, align 8
  %23 = and i32 %22, 2048
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %34, label %25

; <label>:25:                                     ; preds = %20
  %26 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 47
  %27 = load void (i8*, i8*, i32)*, void (i8*, i8*, i32)** %26, align 8
  %28 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %29 = load i8*, i8** %28, align 8
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 44
  %31 = load i8*, i8** %30, align 8
  %32 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 45
  %33 = load i32, i32* %32, align 8
  tail call void %27(i8* %29, i8* %31, i32 %33) #2
  br label %34

; <label>:34:                                     ; preds = %20, %25
  %35 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 52
  %36 = load i32 (i8*)*, i32 (i8*)** %35, align 8
  %37 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 48
  %38 = load i8*, i8** %37, align 8
  %39 = tail call i32 %36(i8* %38) #2
  %40 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 55
  %41 = load %struct.TIFFFieldInfo**, %struct.TIFFFieldInfo*** %40, align 8
  %42 = icmp eq %struct.TIFFFieldInfo** %41, null
  br i1 %42, label %46, label %43

; <label>:43:                                     ; preds = %34
  %44 = bitcast %struct.TIFFFieldInfo*** %40 to i8**
  %45 = load i8*, i8** %44, align 8
  tail call void @_TIFFfree(i8* %45) #2
  br label %46

; <label>:46:                                     ; preds = %34, %43
  %47 = bitcast %struct.tiff* %0 to i8*
  tail call void @_TIFFfree(i8* %47) #2
  ret void
}

declare i32 @TIFFFlush(%struct.tiff*) local_unnamed_addr #1

declare void @TIFFFreeDirectory(%struct.tiff*) local_unnamed_addr #1

declare void @_TIFFfree(i8*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'tif_flush.ll'
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

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFFlush(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 2
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, 0
  br i1 %4, label %16, label %5

; <label>:5:                                      ; preds = %1
  %6 = tail call i32 @TIFFFlushData(%struct.tiff* nonnull %0)
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %17, label %8

; <label>:8:                                      ; preds = %5
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %10 = load i32, i32* %9, align 8
  %11 = and i32 %10, 8
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %16, label %13

; <label>:13:                                     ; preds = %8
  %14 = tail call i32 @TIFFWriteDirectory(%struct.tiff* nonnull %0) #2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %17, label %16

; <label>:16:                                     ; preds = %8, %13, %1
  br label %17

; <label>:17:                                     ; preds = %13, %5, %16
  %.0 = phi i32 [ 1, %16 ], [ 0, %5 ], [ 0, %13 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFFlushData(%struct.tiff*) local_unnamed_addr #0 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %3 = load i32, i32* %2, align 8
  %4 = and i32 %3, 64
  %5 = icmp eq i32 %4, 0
  br i1 %5, label %18, label %6

; <label>:6:                                      ; preds = %1
  %7 = and i32 %3, 4096
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %16, label %9

; <label>:9:                                      ; preds = %6
  %10 = and i32 %3, -4097
  store i32 %10, i32* %2, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 25
  %12 = bitcast {}** %11 to i32 (%struct.tiff*)**
  %13 = load i32 (%struct.tiff*)*, i32 (%struct.tiff*)** %12, align 8
  %14 = tail call i32 %13(%struct.tiff* nonnull %0) #2
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %18, label %16

; <label>:16:                                     ; preds = %9, %6
  %17 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #2
  br label %18

; <label>:18:                                     ; preds = %9, %1, %16
  %.0 = phi i32 [ %17, %16 ], [ 0, %1 ], [ 0, %9 ]
  ret i32 %.0
}

declare i32 @TIFFWriteDirectory(%struct.tiff*) local_unnamed_addr #1

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

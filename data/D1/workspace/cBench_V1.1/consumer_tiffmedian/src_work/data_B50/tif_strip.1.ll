; ModuleID = 'tif_strip.ll'
source_filename = "tif_strip.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [32 x i8] c"%u: Sample out of range, max %u\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFComputeStrip(%struct.tiff* nocapture readonly, i32, i16 zeroext) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %5 = load i32, i32* %4, align 4
  %6 = udiv i32 %1, %5
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %8 = load i16, i16* %7, align 2
  %9 = icmp eq i16 %8, 2
  br i1 %9, label %10, label %25

; <label>:10:                                     ; preds = %3
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %12 = load i16, i16* %11, align 2
  %13 = icmp ugt i16 %12, %2
  br i1 %13, label %19, label %14

; <label>:14:                                     ; preds = %10
  %15 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %16 = load i8*, i8** %15, align 8
  %17 = zext i16 %2 to i32
  %18 = zext i16 %12 to i32
  tail call void (i8*, i8*, ...) @TIFFError(i8* %16, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @.str, i64 0, i64 0), i32 %17, i32 %18) #3
  br label %25

; <label>:19:                                     ; preds = %10
  %20 = zext i16 %2 to i32
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 42
  %22 = load i32, i32* %21, align 8
  %23 = mul i32 %22, %20
  %24 = add i32 %23, %6
  br label %25

; <label>:25:                                     ; preds = %3, %19, %14
  %.0 = phi i32 [ 0, %14 ], [ %24, %19 ], [ %6, %3 ]
  ret i32 %.0
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFNumberOfStrips(%struct.tiff* nocapture readonly) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %3 = load i32, i32* %2, align 4
  %4 = icmp eq i32 %3, -1
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %6 = load i32, i32* %5, align 4
  br i1 %4, label %7, label %10

; <label>:7:                                      ; preds = %1
  %8 = icmp ne i32 %6, 0
  %9 = zext i1 %8 to i32
  br label %14

; <label>:10:                                     ; preds = %1
  %11 = add i32 %3, -1
  %12 = add i32 %11, %6
  %13 = udiv i32 %12, %3
  br label %14

; <label>:14:                                     ; preds = %10, %7
  %15 = phi i32 [ %9, %7 ], [ %13, %10 ]
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %17 = load i16, i16* %16, align 2
  %18 = icmp eq i16 %17, 2
  br i1 %18, label %19, label %24

; <label>:19:                                     ; preds = %14
  %20 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %21 = load i16, i16* %20, align 2
  %22 = zext i16 %21 to i32
  %23 = mul i32 %22, %15
  br label %24

; <label>:24:                                     ; preds = %19, %14
  %.0 = phi i32 [ %23, %19 ], [ %15, %14 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFVStripSize(%struct.tiff* nocapture readonly, i32) local_unnamed_addr #2 {
  %3 = icmp eq i32 %1, -1
  br i1 %3, label %4, label %7

; <label>:4:                                      ; preds = %2
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %6 = load i32, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %4, %2
  %.01 = phi i32 [ %6, %4 ], [ %1, %2 ]
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %9 = load i16, i16* %8, align 2
  %10 = icmp eq i16 %9, 1
  br i1 %10, label %11, label %48

; <label>:11:                                     ; preds = %7
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 11
  %13 = load i16, i16* %12, align 2
  %14 = icmp eq i16 %13, 6
  br i1 %14, label %15, label %48

; <label>:15:                                     ; preds = %11
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 3
  %17 = load i32, i32* %16, align 8
  %18 = and i32 %17, 16384
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %48

; <label>:20:                                     ; preds = %15
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %22 = load i32, i32* %21, align 8
  %23 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 0
  %24 = load i16, i16* %23, align 8
  %25 = zext i16 %24 to i32
  %26 = add i32 %22, -1
  %27 = add i32 %26, %25
  %28 = urem i32 %27, %25
  %29 = sub i32 %27, %28
  %30 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %31 = load i16, i16* %30, align 4
  %32 = zext i16 %31 to i32
  %33 = mul nsw i32 %29, %32
  %34 = add i32 %33, 7
  %35 = lshr i32 %34, 3
  %36 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 49, i64 1
  %37 = load i16, i16* %36, align 2
  %38 = zext i16 %37 to i32
  %39 = mul nuw nsw i32 %38, %25
  %40 = add i32 %.01, -1
  %41 = add i32 %40, %38
  %42 = urem i32 %41, %38
  %43 = sub i32 %41, %42
  %44 = mul i32 %43, %35
  %45 = udiv i32 %44, %39
  %46 = shl i32 %45, 1
  %47 = add i32 %44, %46
  br label %51

; <label>:48:                                     ; preds = %15, %11, %7
  %49 = tail call i32 @TIFFScanlineSize(%struct.tiff* nonnull %0)
  %50 = mul i32 %49, %.01
  br label %51

; <label>:51:                                     ; preds = %48, %20
  %.0 = phi i32 [ %50, %48 ], [ %47, %20 ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFScanlineSize(%struct.tiff* nocapture readonly) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = mul i32 %4, %6
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %9 = load i16, i16* %8, align 2
  %10 = icmp eq i16 %9, 1
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %13 = load i16, i16* %12, align 2
  %14 = zext i16 %13 to i32
  %15 = mul nsw i32 %14, %7
  br label %16

; <label>:16:                                     ; preds = %11, %1
  %.0 = phi i32 [ %15, %11 ], [ %7, %1 ]
  %17 = add i32 %.0, 7
  %18 = lshr i32 %17, 3
  ret i32 %18
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFStripSize(%struct.tiff* nocapture readonly) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 16
  %3 = load i32, i32* %2, align 4
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 2
  %5 = load i32, i32* %4, align 4
  %6 = icmp ugt i32 %3, %5
  %. = select i1 %6, i32 %5, i32 %3
  %7 = tail call i32 @TIFFVStripSize(%struct.tiff* nonnull %0, i32 %.)
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define i32 @TIFFDefaultStripSize(%struct.tiff*, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 35
  %4 = load i32 (%struct.tiff*, i32)*, i32 (%struct.tiff*, i32)** %3, align 8
  %5 = tail call i32 %4(%struct.tiff* %0, i32 %1) #3
  ret i32 %5
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @_TIFFDefaultStripSize(%struct.tiff* nocapture readonly, i32) local_unnamed_addr #2 {
  %3 = icmp slt i32 %1, 1
  br i1 %3, label %4, label %9

; <label>:4:                                      ; preds = %2
  %5 = tail call i32 @TIFFScanlineSize(%struct.tiff* %0)
  %6 = icmp eq i32 %5, 0
  %. = select i1 %6, i32 1, i32 %5
  %7 = udiv i32 8192, %.
  %8 = icmp ugt i32 %., 8192
  %.0 = select i1 %8, i32 1, i32 %7
  br label %9

; <label>:9:                                      ; preds = %4, %2
  %.1 = phi i32 [ %1, %2 ], [ %.0, %4 ]
  ret i32 %.1
}

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @TIFFRasterScanlineSize(%struct.tiff* nocapture readonly) local_unnamed_addr #2 {
  %2 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 8
  %3 = load i16, i16* %2, align 4
  %4 = zext i16 %3 to i32
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %6 = load i32, i32* %5, align 8
  %7 = mul i32 %4, %6
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 24
  %9 = load i16, i16* %8, align 2
  %10 = icmp eq i16 %9, 1
  br i1 %10, label %11, label %18

; <label>:11:                                     ; preds = %1
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %13 = load i16, i16* %12, align 2
  %14 = zext i16 %13 to i32
  %15 = mul nsw i32 %14, %7
  %16 = add i32 %15, 7
  %17 = lshr i32 %16, 3
  br label %25

; <label>:18:                                     ; preds = %1
  %19 = add i32 %7, 7
  %20 = lshr i32 %19, 3
  %21 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 15
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = mul nsw i32 %23, %20
  br label %25

; <label>:25:                                     ; preds = %18, %11
  %.0 = phi i32 [ %17, %11 ], [ %24, %18 ]
  ret i32 %.0
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

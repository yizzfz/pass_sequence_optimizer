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

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @TIFFInitDumpMode(%struct.tiff* nocapture, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %4, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeDecode, i32 (%struct.tiff*, i8*, i32, i16)** %5, align 8
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 27
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %6, align 8
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 29
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %7, align 8
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 31
  store i32 (%struct.tiff*, i8*, i32, i16)* @DumpModeEncode, i32 (%struct.tiff*, i8*, i32, i16)** %8, align 8
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 33
  store i32 (%struct.tiff*, i32)* @DumpModeSeek, i32 (%struct.tiff*, i32)** %9, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeDecode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #1 {
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %6 = load i32, i32* %5, align 8
  %7 = icmp slt i32 %6, %2
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %4
  %9 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %10 = load i8*, i8** %9, align 8
  %11 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %12 = load i32, i32* %11, align 8
  tail call void (i8*, i8*, ...) @TIFFError(i8* %10, i8* getelementptr inbounds ([48 x i8], [48 x i8]* @.str, i64 0, i64 0), i32 %12) #3
  br label %24

; <label>:13:                                     ; preds = %4
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %15 = load i8*, i8** %14, align 8
  %16 = icmp eq i8* %15, %1
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %13
  tail call void @_TIFFmemcpy(i8* %1, i8* %15, i32 %2) #3
  br label %18

; <label>:18:                                     ; preds = %13, %17
  %19 = load i8*, i8** %14, align 8
  %20 = sext i32 %2 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %14, align 8
  %22 = load i32, i32* %5, align 8
  %23 = sub nsw i32 %22, %2
  store i32 %23, i32* %5, align 8
  br label %24

; <label>:24:                                     ; preds = %18, %8
  %.0 = phi i32 [ 0, %8 ], [ 1, %18 ]
  ret i32 %.0
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @DumpModeEncode(%struct.tiff*, i8*, i32, i16 zeroext) #1 {
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %4
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %7 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 41
  %8 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  br label %9

; <label>:9:                                      ; preds = %.lr.ph, %.backedge
  %.025 = phi i8* [ %1, %.lr.ph ], [ %24, %.backedge ]
  %.034 = phi i32 [ %2, %.lr.ph ], [ %25, %.backedge ]
  %10 = load i32, i32* %6, align 8
  %11 = add nsw i32 %10, %.034
  %12 = load i32, i32* %7, align 8
  %13 = icmp sgt i32 %11, %12
  %14 = sub nsw i32 %12, %10
  %..03 = select i1 %13, i32 %14, i32 %.034
  %15 = load i8*, i8** %8, align 8
  %16 = icmp eq i8* %15, %.025
  br i1 %16, label %18, label %17

; <label>:17:                                     ; preds = %9
  tail call void @_TIFFmemcpy(i8* %15, i8* %.025, i32 %..03) #3
  br label %18

; <label>:18:                                     ; preds = %9, %17
  %19 = load i8*, i8** %8, align 8
  %20 = sext i32 %..03 to i64
  %21 = getelementptr inbounds i8, i8* %19, i64 %20
  store i8* %21, i8** %8, align 8
  %22 = load i32, i32* %6, align 8
  %23 = add nsw i32 %22, %..03
  store i32 %23, i32* %6, align 8
  %24 = getelementptr inbounds i8, i8* %.025, i64 %20
  %25 = sub nsw i32 %.034, %..03
  %26 = load i32, i32* %7, align 8
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %.backedge, label %28

; <label>:28:                                     ; preds = %18
  %29 = tail call i32 @TIFFFlushData1(%struct.tiff* nonnull %0) #3
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %._crit_edge.loopexit, label %.backedge

.backedge:                                        ; preds = %28, %18
  %31 = icmp sgt i32 %25, 0
  br i1 %31, label %9, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.backedge, %28
  %.0.ph = phi i32 [ 1, %.backedge ], [ -1, %28 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.0 = phi i32 [ 1, %4 ], [ %.0.ph, %._crit_edge.loopexit ]
  ret i32 %.0
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal i32 @DumpModeSeek(%struct.tiff* nocapture, i32) #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  %4 = load i32, i32* %3, align 8
  %5 = mul i32 %4, %1
  %6 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %7 = load i8*, i8** %6, align 8
  %8 = zext i32 %5 to i64
  %9 = getelementptr inbounds i8, i8* %7, i64 %8
  store i8* %9, i8** %6, align 8
  %10 = load i32, i32* %3, align 8
  %11 = mul i32 %10, %1
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %13 = load i32, i32* %12, align 8
  %14 = sub i32 %13, %11
  store i32 %14, i32* %12, align 8
  ret i32 1
}

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #2

declare i32 @TIFFFlushData1(%struct.tiff*) local_unnamed_addr #2

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

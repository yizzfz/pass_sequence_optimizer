; ModuleID = 'tif_next.ll'
source_filename = "tif_next.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiff = type { i8*, i32, i32, i32, i32, i32, %struct.TIFFDirectory, %struct.TIFFHeader, i8*, i32*, i64*, i32, i16, i32, i32, i32, i16, i32, i32, i32, i32, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i16)*, i32 (%struct.tiff*)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, i32 (%struct.tiff*, i8*, i32, i16)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*)*, i32 (%struct.tiff*, i32)*, void (%struct.tiff*, i32*, i32*)*, i8*, i32, i32, i8*, i32, i8*, i32, i8*, i32, i32 (i8*, i8**, i32*)*, void (i8*, i8*, i32)*, i8*, i32 (i8*, i8*, i32)*, i32 (i8*, i8*, i32)*, i32 (i8*, i32, i32)*, i32 (i8*)*, i32 (i8*)*, void (%struct.tiff*, i8*, i32)*, %struct.TIFFFieldInfo**, i32, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, i32 (%struct.tiff*, i32, %struct.__va_list_tag*)*, void (%struct.tiff*, %struct._IO_FILE*, i64)* }
%struct.TIFFDirectory = type { [3 x i64], i32, i32, i32, i32, i32, i32, i32, i16, i16, i16, i16, i16, i16, i16, i16, i32, i16, i16, double, double, float, float, i16, i16, float, float, [2 x i16], [3 x i16*], [2 x i16], i16, i16*, double, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i32, i32, i32*, i32*, i16, i32*, float*, [2 x i16], i16, float*, float*, float*, [3 x i16*], i16, i16, [2 x i16], i32, i8*, i8*, i32, i8*, i32, i8*, i32, i8*, i32, i32, i8*, i8*, float, float*, float* }
%struct.TIFFHeader = type { i16, i16, i32 }
%struct.TIFFFieldInfo = type { i32, i16, i16, i32, i16, i8, i8, i8* }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [45 x i8] c"NeXTDecode: Not enough data for scanline %ld\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @TIFFInitNeXT(%struct.tiff* nocapture, i32) local_unnamed_addr #0 {
  %3 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 26
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %3, align 8
  %4 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 28
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %4, align 8
  %5 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 30
  store i32 (%struct.tiff*, i8*, i32, i16)* @NeXTDecode, i32 (%struct.tiff*, i8*, i32, i16)** %5, align 8
  ret i32 1
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @NeXTDecode(%struct.tiff* nocapture, i8*, i32, i16 zeroext) #1 {
  %5 = icmp sgt i32 %2, 0
  br i1 %5, label %._crit_edge55.loopexit, label %._crit_edge55

._crit_edge55.loopexit:                           ; preds = %4
  %6 = xor i32 %2, -1
  %7 = icmp sgt i32 %6, -2
  %smax = select i1 %7, i32 %6, i32 -2
  %8 = add i32 %smax, %2
  %9 = add i32 %8, 1
  %10 = zext i32 %9 to i64
  %11 = add nuw nsw i64 %10, 1
  call void @llvm.memset.p0i8.i64(i8* %1, i8 -1, i64 %11, i32 1, i1 false)
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55.loopexit, %4
  %12 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 42
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 43
  %15 = load i32, i32* %14, align 8
  %16 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 38
  %17 = load i32, i32* %16, align 8
  %18 = icmp sgt i32 %2, 0
  br i1 %18, label %.lr.ph47, label %._crit_edge48

.lr.ph47:                                         ; preds = %._crit_edge55
  %19 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 6, i32 1
  %20 = sext i32 %17 to i64
  %21 = sext i32 %17 to i64
  br label %22

; <label>:22:                                     ; preds = %.lr.ph47, %.loopexit
  %.0245 = phi i8* [ %1, %.lr.ph47 ], [ %87, %.loopexit ]
  %.0344 = phi i32 [ %2, %.lr.ph47 ], [ %86, %.loopexit ]
  %.0643 = phi i8* [ %13, %.lr.ph47 ], [ %.2, %.loopexit ]
  %.11242 = phi i32 [ %15, %.lr.ph47 ], [ %.314, %.loopexit ]
  %23 = getelementptr inbounds i8, i8* %.0643, i64 1
  %24 = load i8, i8* %.0643, align 1
  %25 = add nsw i32 %.11242, -1
  switch i8 %24, label %55 [
    i8 0, label %26
    i8 64, label %31
  ]

; <label>:26:                                     ; preds = %22
  %27 = icmp sgt i32 %.11242, %17
  br i1 %27, label %28, label %.loopexit15.loopexit107

; <label>:28:                                     ; preds = %26
  tail call void @_TIFFmemcpy(i8* %.0245, i8* %23, i32 %17) #4
  %29 = getelementptr inbounds i8, i8* %23, i64 %21
  %30 = sub nsw i32 %25, %17
  br label %.loopexit

; <label>:31:                                     ; preds = %22
  %32 = getelementptr inbounds i8, i8* %.0643, i64 3
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i32
  %35 = shl nuw nsw i32 %34, 8
  %36 = getelementptr inbounds i8, i8* %.0643, i64 4
  %37 = load i8, i8* %36, align 1
  %38 = zext i8 %37 to i32
  %39 = or i32 %35, %38
  %40 = add nuw nsw i32 %39, 4
  %41 = icmp sgt i32 %.11242, %40
  br i1 %41, label %42, label %.loopexit15.loopexit107

; <label>:42:                                     ; preds = %31
  %43 = load i8, i8* %23, align 1
  %44 = zext i8 %43 to i64
  %45 = shl nuw nsw i64 %44, 8
  %46 = getelementptr inbounds i8, i8* %.0643, i64 2
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i64
  %49 = or i64 %45, %48
  %50 = getelementptr inbounds i8, i8* %.0245, i64 %49
  %51 = getelementptr inbounds i8, i8* %.0643, i64 5
  tail call void @_TIFFmemcpy(i8* %50, i8* %51, i32 %39) #4
  %52 = zext i32 %40 to i64
  %53 = getelementptr inbounds i8, i8* %23, i64 %52
  %54 = sub nsw i32 %25, %40
  br label %.loopexit

; <label>:55:                                     ; preds = %22
  %56 = load i32, i32* %19, align 8
  br label %57

; <label>:57:                                     ; preds = %82, %55
  %.213 = phi i32 [ %25, %55 ], [ %85, %82 ]
  %.19 = phi i8* [ %.0245, %55 ], [ %.210.ph.lcssa23, %82 ]
  %.17 = phi i8* [ %23, %55 ], [ %83, %82 ]
  %.04.in = phi i8 [ %24, %55 ], [ %84, %82 ]
  %.01 = phi i32 [ 0, %55 ], [ %.1.lcssa, %82 ]
  %.04 = zext i8 %.04.in to i32
  %58 = lshr i32 %.04, 6
  %59 = and i32 %.04, 63
  %60 = icmp eq i32 %59, 0
  br i1 %60, label %.outer._crit_edge, label %.lr.ph.lr.ph

.lr.ph.lr.ph:                                     ; preds = %57
  %61 = shl nuw nsw i32 %58, 6
  %62 = shl nuw nsw i32 %58, 4
  %63 = shl nuw nsw i32 %58, 2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.lr.ph, %.outer
  %.in = phi i32 [ %59, %.lr.ph.lr.ph ], [ %65, %.outer ]
  %.1.ph39 = phi i32 [ %.01, %.lr.ph.lr.ph ], [ %66, %.outer ]
  %.210.ph38 = phi i8* [ %.19, %.lr.ph.lr.ph ], [ %72, %.outer ]
  br label %64

; <label>:64:                                     ; preds = %.lr.ph, %.backedge
  %.in60 = phi i32 [ %.in, %.lr.ph ], [ %65, %.backedge ]
  %.134 = phi i32 [ %.1.ph39, %.lr.ph ], [ %66, %.backedge ]
  %65 = add nsw i32 %.in60, -1
  %66 = add nsw i32 %.134, 1
  %trunc = trunc i32 %.134 to i2
  switch i2 %trunc, label %78 [
    i2 0, label %.backedge
    i2 1, label %67
    i2 -2, label %.backedge.sink.split
    i2 -1, label %.outer
  ]

; <label>:67:                                     ; preds = %64
  br label %.backedge.sink.split

.backedge.sink.split:                             ; preds = %64, %67
  %.sink58 = phi i32 [ %62, %67 ], [ %63, %64 ]
  %68 = load i8, i8* %.210.ph38, align 1
  %69 = zext i8 %68 to i32
  %70 = or i32 %69, %.sink58
  br label %.backedge

.backedge:                                        ; preds = %.backedge.sink.split, %64
  %.sink.in = phi i32 [ %61, %64 ], [ %70, %.backedge.sink.split ]
  %.sink = trunc i32 %.sink.in to i8
  store i8 %.sink, i8* %.210.ph38, align 1
  %71 = icmp sgt i32 %.in60, 1
  br i1 %71, label %64, label %.outer._crit_edge.loopexit

.outer:                                           ; preds = %64
  %72 = getelementptr inbounds i8, i8* %.210.ph38, i64 1
  %73 = load i8, i8* %.210.ph38, align 1
  %74 = zext i8 %73 to i32
  %75 = or i32 %74, %58
  %76 = trunc i32 %75 to i8
  store i8 %76, i8* %.210.ph38, align 1
  %77 = icmp sgt i32 %.in60, 1
  br i1 %77, label %.lr.ph, label %.outer._crit_edge.loopexit106

; <label>:78:                                     ; preds = %64
  unreachable

.outer._crit_edge.loopexit:                       ; preds = %.backedge
  br label %.outer._crit_edge

.outer._crit_edge.loopexit106:                    ; preds = %.outer
  br label %.outer._crit_edge

.outer._crit_edge:                                ; preds = %.outer._crit_edge.loopexit106, %.outer._crit_edge.loopexit, %57
  %.210.ph.lcssa23 = phi i8* [ %.19, %57 ], [ %.210.ph38, %.outer._crit_edge.loopexit ], [ %72, %.outer._crit_edge.loopexit106 ]
  %.1.lcssa = phi i32 [ %.01, %57 ], [ %66, %.outer._crit_edge.loopexit ], [ %66, %.outer._crit_edge.loopexit106 ]
  %79 = icmp slt i32 %.1.lcssa, %56
  br i1 %79, label %80, label %.loopexit.loopexit

; <label>:80:                                     ; preds = %.outer._crit_edge
  %81 = icmp eq i32 %.213, 0
  br i1 %81, label %.loopexit15.loopexit, label %82

; <label>:82:                                     ; preds = %80
  %83 = getelementptr inbounds i8, i8* %.17, i64 1
  %84 = load i8, i8* %.17, align 1
  %85 = add nsw i32 %.213, -1
  br label %57

.loopexit.loopexit:                               ; preds = %.outer._crit_edge
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %28, %42
  %.314 = phi i32 [ %54, %42 ], [ %30, %28 ], [ %.213, %.loopexit.loopexit ]
  %.2 = phi i8* [ %53, %42 ], [ %29, %28 ], [ %.17, %.loopexit.loopexit ]
  %86 = sub nsw i32 %.0344, %17
  %87 = getelementptr inbounds i8, i8* %.0245, i64 %20
  %88 = icmp sgt i32 %86, 0
  br i1 %88, label %22, label %._crit_edge48.loopexit

._crit_edge48.loopexit:                           ; preds = %.loopexit
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.loopexit, %._crit_edge55
  %.112.lcssa = phi i32 [ %15, %._crit_edge55 ], [ %.314, %._crit_edge48.loopexit ]
  %.06.lcssa = phi i8* [ %13, %._crit_edge55 ], [ %.2, %._crit_edge48.loopexit ]
  store i8* %.06.lcssa, i8** %12, align 8
  store i32 %.112.lcssa, i32* %14, align 8
  br label %94

.loopexit15.loopexit:                             ; preds = %80
  br label %.loopexit15

.loopexit15.loopexit107:                          ; preds = %26, %31
  br label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit15.loopexit107, %.loopexit15.loopexit
  %89 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 0
  %90 = load i8*, i8** %89, align 8
  %91 = getelementptr inbounds %struct.tiff, %struct.tiff* %0, i64 0, i32 11
  %92 = load i32, i32* %91, align 8
  %93 = zext i32 %92 to i64
  tail call void (i8*, i8*, ...) @TIFFError(i8* %90, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @.str, i64 0, i64 0), i64 %93) #4
  br label %94

; <label>:94:                                     ; preds = %.loopexit15, %._crit_edge48
  %.0 = phi i32 [ 0, %.loopexit15 ], [ 1, %._crit_edge48 ]
  ret i32 %.0
}

declare void @_TIFFmemcpy(i8*, i8*, i32) local_unnamed_addr #2

declare void @TIFFError(i8*, i8*, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

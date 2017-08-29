; ModuleID = 'portableio.ll'
source_filename = "portableio.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

; Function Attrs: noinline nounwind uwtable
define i32 @ReadByte(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = and i32 %2, 255
  %4 = trunc i32 %2 to i8
  %5 = icmp slt i8 %4, 0
  %6 = or i32 %2, -256
  %. = select i1 %5, i32 %6, i32 %3
  ret i32 %.
}

; Function Attrs: nounwind
declare i32 @_IO_getc(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define i32 @Read16BitsLowHigh(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = and i32 %2, 255
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %5 = shl i32 %4, 8
  %6 = and i32 %5, 65280
  %7 = or i32 %6, %3
  %8 = trunc i32 %5 to i16
  %9 = icmp slt i16 %8, 0
  %10 = or i32 %7, -65536
  %. = select i1 %9, i32 %10, i32 %7
  ret i32 %.
}

; Function Attrs: noinline nounwind uwtable
define i32 @Read16BitsHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %4 = and i32 %3, 255
  %5 = shl i32 %2, 8
  %6 = and i32 %5, 65280
  %7 = or i32 %6, %4
  %8 = trunc i32 %5 to i16
  %9 = icmp slt i16 %8, 0
  %10 = or i32 %7, -65536
  %. = select i1 %9, i32 %10, i32 %7
  ret i32 %.
}

; Function Attrs: noinline nounwind uwtable
define void @Write8Bits(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = and i32 %1, 255
  %4 = tail call i32 @_IO_putc(i32 %3, %struct._IO_FILE* %0)
  ret void
}

; Function Attrs: nounwind
declare i32 @_IO_putc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @Write16BitsLowHigh(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = and i32 %1, 255
  %4 = tail call i32 @_IO_putc(i32 %3, %struct._IO_FILE* %0)
  %5 = lshr i32 %1, 8
  %6 = and i32 %5, 255
  %7 = tail call i32 @_IO_putc(i32 %6, %struct._IO_FILE* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Write16BitsHighLow(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = lshr i32 %1, 8
  %4 = and i32 %3, 255
  %5 = tail call i32 @_IO_putc(i32 %4, %struct._IO_FILE* %0)
  %6 = and i32 %1, 255
  %7 = tail call i32 @_IO_putc(i32 %6, %struct._IO_FILE* %0)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @Read24BitsHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %3 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %4 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %5 = and i32 %4, 255
  %6 = shl i32 %2, 16
  %7 = and i32 %6, 16711680
  %8 = shl i32 %3, 8
  %9 = and i32 %8, 65280
  %10 = or i32 %9, %7
  %11 = or i32 %10, %5
  %12 = and i32 %6, 8388608
  %13 = icmp eq i32 %12, 0
  %14 = or i32 %11, -16777216
  %. = select i1 %13, i32 %11, i32 %14
  ret i32 %.
}

; Function Attrs: noinline nounwind uwtable
define i32 @Read32Bits(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0)
  %3 = and i32 %2, 65535
  %4 = tail call i32 @Read16BitsLowHigh(%struct._IO_FILE* %0)
  %5 = shl i32 %4, 16
  %6 = or i32 %5, %3
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define i32 @Read32BitsHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = tail call i32 @Read16BitsHighLow(%struct._IO_FILE* %0)
  %3 = tail call i32 @Read16BitsHighLow(%struct._IO_FILE* %0)
  %4 = and i32 %3, 65535
  %5 = shl i32 %2, 16
  %6 = or i32 %4, %5
  ret i32 %6
}

; Function Attrs: noinline nounwind uwtable
define void @Write32Bits(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = and i32 %1, 65535
  tail call void @Write16BitsLowHigh(%struct._IO_FILE* %0, i32 %3)
  %4 = lshr i32 %1, 16
  tail call void @Write16BitsLowHigh(%struct._IO_FILE* %0, i32 %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Write32BitsLowHigh(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = and i32 %1, 65535
  tail call void @Write16BitsLowHigh(%struct._IO_FILE* %0, i32 %3)
  %4 = lshr i32 %1, 16
  tail call void @Write16BitsLowHigh(%struct._IO_FILE* %0, i32 %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @Write32BitsHighLow(%struct._IO_FILE* nocapture, i32) local_unnamed_addr #0 {
  %3 = lshr i32 %1, 16
  tail call void @Write16BitsHighLow(%struct._IO_FILE* %0, i32 %3)
  %4 = and i32 %1, 65535
  tail call void @Write16BitsHighLow(%struct._IO_FILE* %0, i32 %4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @ReadBytes(%struct._IO_FILE* nocapture, i8* nocapture, i32) local_unnamed_addr #0 {
  %4 = tail call i32 @feof(%struct._IO_FILE* %0) #3
  %5 = icmp eq i32 %4, 0
  %6 = icmp sgt i32 %2, 0
  %7 = and i1 %6, %5
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %8, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %.012 = phi i8* [ %11, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %8 = add nsw i32 %.03, -1
  %9 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %10 = trunc i32 %9 to i8
  %11 = getelementptr inbounds i8, i8* %.012, i64 1
  store i8 %10, i8* %.012, align 1
  %12 = tail call i32 @feof(%struct._IO_FILE* %0) #3
  %13 = icmp eq i32 %12, 0
  %14 = icmp sgt i32 %.03, 1
  %15 = and i1 %14, %13
  br i1 %15, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: nounwind
declare i32 @feof(%struct._IO_FILE* nocapture) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @ReadBytesSwapped(%struct._IO_FILE* nocapture, i8*, i32) local_unnamed_addr #0 {
  %4 = tail call i32 @feof(%struct._IO_FILE* %0) #3
  %5 = icmp eq i32 %4, 0
  %6 = icmp sgt i32 %2, 0
  %7 = and i1 %6, %5
  br i1 %7, label %.lr.ph9.preheader, label %.preheader

.lr.ph9.preheader:                                ; preds = %3
  br label %.lr.ph9

.preheader.loopexit:                              ; preds = %.lr.ph9
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %3
  %.0.lcssa = phi i8* [ %1, %3 ], [ %12, %.preheader.loopexit ]
  %.13 = getelementptr inbounds i8, i8* %.0.lcssa, i64 -1
  %8 = icmp ugt i8* %.13, %1
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br label %.lr.ph

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %.lr.ph9
  %.07 = phi i8* [ %12, %.lr.ph9 ], [ %1, %.lr.ph9.preheader ]
  %.026 = phi i32 [ %9, %.lr.ph9 ], [ %2, %.lr.ph9.preheader ]
  %9 = add nsw i32 %.026, -1
  %10 = tail call i32 @_IO_getc(%struct._IO_FILE* %0)
  %11 = trunc i32 %10 to i8
  %12 = getelementptr inbounds i8, i8* %.07, i64 1
  store i8 %11, i8* %.07, align 1
  %13 = tail call i32 @feof(%struct._IO_FILE* %0) #3
  %14 = icmp eq i32 %13, 0
  %15 = icmp sgt i32 %.026, 1
  %16 = and i1 %15, %14
  br i1 %16, label %.lr.ph9, label %.preheader.loopexit

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.15 = phi i8* [ %.1, %.lr.ph ], [ %.13, %.lr.ph.preheader ]
  %.014 = phi i8* [ %19, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %17 = load i8, i8* %.014, align 1
  %18 = load i8, i8* %.15, align 1
  store i8 %18, i8* %.014, align 1
  store i8 %17, i8* %.15, align 1
  %19 = getelementptr inbounds i8, i8* %.014, i64 1
  %.1 = getelementptr inbounds i8, i8* %.15, i64 -1
  %20 = icmp ult i8* %19, %.1
  br i1 %20, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @WriteBytes(%struct._IO_FILE* nocapture, i8* nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %5, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %.012 = phi i8* [ %6, %.lr.ph ], [ %1, %.lr.ph.preheader ]
  %5 = add nsw i32 %.03, -1
  %6 = getelementptr inbounds i8, i8* %.012, i64 1
  %7 = load i8, i8* %.012, align 1
  %8 = sext i8 %7 to i32
  %9 = tail call i32 @_IO_putc(i32 %8, %struct._IO_FILE* %0)
  %10 = icmp sgt i32 %.03, 1
  br i1 %10, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @WriteBytesSwapped(%struct._IO_FILE* nocapture, i8* nocapture readonly, i32) local_unnamed_addr #0 {
  %4 = icmp sgt i32 %2, 0
  br i1 %4, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %3
  %5 = add nsw i32 %2, -1
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* %1, i64 %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %.03 = phi i32 [ %8, %.lr.ph ], [ %2, %.lr.ph.preheader ]
  %.012 = phi i8* [ %9, %.lr.ph ], [ %7, %.lr.ph.preheader ]
  %8 = add nsw i32 %.03, -1
  %9 = getelementptr inbounds i8, i8* %.012, i64 -1
  %10 = load i8, i8* %.012, align 1
  %11 = sext i8 %10 to i32
  %12 = tail call i32 @_IO_putc(i32 %11, %struct._IO_FILE* %0)
  %13 = icmp sgt i32 %.03, 1
  br i1 %13, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeFloatHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [4 x i8], align 1
  %3 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i64 0, i64 0
  call void @ReadBytes(%struct._IO_FILE* %0, i8* nonnull %3, i32 4)
  %4 = call double @ConvertFromIeeeSingle(i8* nonnull %3) #3
  ret double %4
}

declare double @ConvertFromIeeeSingle(i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeFloatLowHigh(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [4 x i8], align 1
  %3 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i64 0, i64 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %3, i32 4)
  %4 = call double @ConvertFromIeeeSingle(i8* nonnull %3) #3
  ret double %4
}

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeDoubleHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [8 x i8], align 1
  %3 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 0
  call void @ReadBytes(%struct._IO_FILE* %0, i8* nonnull %3, i32 8)
  %4 = call double @ConvertFromIeeeDouble(i8* nonnull %3) #3
  ret double %4
}

declare double @ConvertFromIeeeDouble(i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeDoubleLowHigh(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [8 x i8], align 1
  %3 = getelementptr inbounds [8 x i8], [8 x i8]* %2, i64 0, i64 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %3, i32 8)
  %4 = call double @ConvertFromIeeeDouble(i8* nonnull %3) #3
  ret double %4
}

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeExtendedHighLow(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [10 x i8], align 1
  %3 = getelementptr inbounds [10 x i8], [10 x i8]* %2, i64 0, i64 0
  call void @ReadBytes(%struct._IO_FILE* %0, i8* nonnull %3, i32 10)
  %4 = call double @ConvertFromIeeeExtended(i8* nonnull %3) #3
  ret double %4
}

declare double @ConvertFromIeeeExtended(i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define double @ReadIeeeExtendedLowHigh(%struct._IO_FILE* nocapture) local_unnamed_addr #0 {
  %2 = alloca [10 x i8], align 1
  %3 = getelementptr inbounds [10 x i8], [10 x i8]* %2, i64 0, i64 0
  call void @ReadBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %3, i32 10)
  %4 = call double @ConvertFromIeeeExtended(i8* nonnull %3) #3
  ret double %4
}

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeFloatLowHigh(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [4 x i8], align 1
  %4 = getelementptr inbounds [4 x i8], [4 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeSingle(double %1, i8* nonnull %4) #3
  call void @WriteBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %4, i32 4)
  ret void
}

declare void @ConvertToIeeeSingle(double, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeFloatHighLow(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [4 x i8], align 1
  %4 = getelementptr inbounds [4 x i8], [4 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeSingle(double %1, i8* nonnull %4) #3
  call void @WriteBytes(%struct._IO_FILE* %0, i8* nonnull %4, i32 4)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeDoubleLowHigh(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [8 x i8], align 1
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeDouble(double %1, i8* nonnull %4) #3
  call void @WriteBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %4, i32 8)
  ret void
}

declare void @ConvertToIeeeDouble(double, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeDoubleHighLow(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [8 x i8], align 1
  %4 = getelementptr inbounds [8 x i8], [8 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeDouble(double %1, i8* nonnull %4) #3
  call void @WriteBytes(%struct._IO_FILE* %0, i8* nonnull %4, i32 8)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeExtendedLowHigh(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [10 x i8], align 1
  %4 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeExtended(double %1, i8* nonnull %4) #3
  call void @WriteBytesSwapped(%struct._IO_FILE* %0, i8* nonnull %4, i32 10)
  ret void
}

declare void @ConvertToIeeeExtended(double, i8*) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define void @WriteIeeeExtendedHighLow(%struct._IO_FILE* nocapture, double) local_unnamed_addr #0 {
  %3 = alloca [10 x i8], align 1
  %4 = getelementptr inbounds [10 x i8], [10 x i8]* %3, i64 0, i64 0
  call void @ConvertToIeeeExtended(double %1, i8* nonnull %4) #3
  call void @WriteBytes(%struct._IO_FILE* %0, i8* nonnull %4, i32 10)
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

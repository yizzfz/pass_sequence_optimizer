; ModuleID = 'jutils.ll'
source_filename = "jutils.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@jpeg_natural_order = constant [80 x i32] [i32 0, i32 1, i32 8, i32 16, i32 9, i32 2, i32 3, i32 10, i32 17, i32 24, i32 32, i32 25, i32 18, i32 11, i32 4, i32 5, i32 12, i32 19, i32 26, i32 33, i32 40, i32 48, i32 41, i32 34, i32 27, i32 20, i32 13, i32 6, i32 7, i32 14, i32 21, i32 28, i32 35, i32 42, i32 49, i32 56, i32 57, i32 50, i32 43, i32 36, i32 29, i32 22, i32 15, i32 23, i32 30, i32 37, i32 44, i32 51, i32 58, i32 59, i32 52, i32 45, i32 38, i32 31, i32 39, i32 46, i32 53, i32 60, i32 61, i32 54, i32 47, i32 55, i32 62, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63, i32 63], align 16

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @jdiv_round_up(i64, i64) #0 {
  %3 = add i64 %0, -1
  %4 = add i64 %3, %1
  %5 = sdiv i64 %4, %1
  ret i64 %5
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @jround_up(i64, i64) #0 {
  %3 = add i64 %0, -1
  %4 = add i64 %3, %1
  %5 = srem i64 %4, %1
  %6 = sub nsw i64 %4, %5
  ret i64 %6
}

; Function Attrs: noinline nounwind uwtable
define void @jcopy_sample_rows(i8**, i32, i8**, i32, i32, i32) #1 {
  %7 = zext i32 %5 to i64
  %8 = icmp sgt i32 %4, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %6
  %9 = sext i32 %3 to i64
  %10 = getelementptr inbounds i8*, i8** %2, i64 %9
  %11 = sext i32 %1 to i64
  %12 = getelementptr inbounds i8*, i8** %0, i64 %11
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.lr.ph
  %storemerge9 = phi i32 [ %17, %.lr.ph ], [ %4, %.lr.ph.preheader ]
  %.08 = phi i8** [ %13, %.lr.ph ], [ %12, %.lr.ph.preheader ]
  %.067 = phi i8** [ %15, %.lr.ph ], [ %10, %.lr.ph.preheader ]
  %13 = getelementptr inbounds i8*, i8** %.08, i64 1
  %14 = load i8*, i8** %.08, align 8
  %15 = getelementptr inbounds i8*, i8** %.067, i64 1
  %16 = load i8*, i8** %.067, align 8
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %16, i8* %14, i64 %7, i32 1, i1 false)
  %17 = add nsw i32 %storemerge9, -1
  %18 = icmp sgt i32 %storemerge9, 1
  br i1 %18, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noinline nounwind uwtable
define void @jcopy_block_row([64 x i16]* nocapture readonly, [64 x i16]* nocapture, i32) #1 {
  %.cast = bitcast [64 x i16]* %1 to i8*
  %.cast1 = bitcast [64 x i16]* %0 to i8*
  %4 = zext i32 %2 to i64
  %5 = shl nuw nsw i64 %4, 7
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %.cast, i8* %.cast1, i64 %5, i32 1, i1 false)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @jzero_far(i8* nocapture, i64) #1 {
  tail call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %1, i32 1, i1 false)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

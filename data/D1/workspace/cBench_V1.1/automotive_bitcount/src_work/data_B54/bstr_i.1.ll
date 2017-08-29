; ModuleID = 'bstr_i.ll'
source_filename = "bstr_i.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"01\00", align 1

; Function Attrs: noinline norecurse nounwind readonly uwtable
define i32 @bstr_i(i8* readonly) local_unnamed_addr #0 {
  %2 = icmp eq i8* %0, null
  br i1 %2, label %.critedge, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %1
  %3 = load i8, i8* %0, align 1
  %4 = icmp eq i8 %3, 0
  br i1 %4, label %.critedge, label %.lr.ph12.preheader

.lr.ph12.preheader:                               ; preds = %.lr.ph.preheader
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %.lr.ph
  %5 = phi i8 [ %15, %.lr.ph ], [ %3, %.lr.ph12.preheader ]
  %.01411 = phi i32 [ %14, %.lr.ph ], [ 0, %.lr.ph12.preheader ]
  %.0510 = phi i8* [ %10, %.lr.ph ], [ %0, %.lr.ph12.preheader ]
  %6 = sext i8 %5 to i64
  %7 = and i64 %6, 4294967295
  %memchr.bounds = icmp ult i64 %7, 64
  %8 = shl i64 1, %7
  %9 = and i64 %8, 844424930131969
  %memchr.bits = icmp ne i64 %9, 0
  %memchr2 = and i1 %memchr.bounds, %memchr.bits
  br i1 %memchr2, label %.lr.ph, label %.critedge.loopexit

.lr.ph:                                           ; preds = %.lr.ph12
  %10 = getelementptr inbounds i8, i8* %.0510, i64 1
  %11 = shl i32 %.01411, 1
  %12 = and i8 %5, 1
  %13 = zext i8 %12 to i32
  %14 = or i32 %13, %11
  %15 = load i8, i8* %10, align 1
  %16 = icmp eq i8 %15, 0
  br i1 %16, label %.critedge.loopexit, label %.lr.ph12

.critedge.loopexit:                               ; preds = %.lr.ph12, %.lr.ph
  %.01.lcssa.ph = phi i32 [ %.01411, %.lr.ph12 ], [ %14, %.lr.ph ]
  br label %.critedge

.critedge:                                        ; preds = %.critedge.loopexit, %.lr.ph.preheader, %1
  %.01.lcssa = phi i32 [ 0, %1 ], [ 0, %.lr.ph.preheader ], [ %.01.lcssa.ph, %.critedge.loopexit ]
  ret i32 %.01.lcssa
}

attributes #0 = { noinline norecurse nounwind readonly uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

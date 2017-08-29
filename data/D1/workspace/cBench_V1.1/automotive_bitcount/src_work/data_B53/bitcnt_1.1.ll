; ModuleID = 'bitcnt_1.ll'
source_filename = "bitcnt_1.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @bit_count(i64) local_unnamed_addr #0 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %.loopexit, label %.preheader.preheader

.preheader.preheader:                             ; preds = %1
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.01 = phi i32 [ %3, %.preheader ], [ 0, %.preheader.preheader ]
  %.0 = phi i64 [ %5, %.preheader ], [ %0, %.preheader.preheader ]
  %3 = add nuw nsw i32 %.01, 1
  %4 = add nsw i64 %.0, -1
  %5 = and i64 %4, %.0
  %6 = icmp eq i64 %5, 0
  br i1 %6, label %.loopexit.loopexit, label %.preheader

.loopexit.loopexit:                               ; preds = %.preheader
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %1
  %.1 = phi i32 [ 0, %1 ], [ %3, %.loopexit.loopexit ]
  ret i32 %.1
}

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

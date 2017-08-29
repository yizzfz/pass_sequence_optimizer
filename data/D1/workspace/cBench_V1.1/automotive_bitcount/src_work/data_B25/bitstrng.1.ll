; ModuleID = 'bitstrng.ll'
source_filename = "bitstrng.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define void @bitstring(i8* nocapture, i64, i32, i32) local_unnamed_addr #0 {
  %5 = ashr i32 %2, 2
  %6 = and i32 %2, 3
  %not. = icmp eq i32 %6, 0
  %7 = zext i1 %not. to i32
  %sum = add i32 %5, %2
  %8 = sub i32 %3, %sum
  %9 = add i32 %8, %7
  %10 = icmp sgt i32 %9, 0
  br i1 %10, label %.preheader.loopexit, label %.preheader

.preheader.loopexit:                              ; preds = %4
  %11 = add i32 %7, %3
  %12 = add i32 %11, -1
  %13 = sub i32 %12, %sum
  %14 = zext i32 %13 to i64
  %15 = add nuw nsw i64 %14, 1
  call void @llvm.memset.p0i8.i64(i8* %0, i8 32, i64 %15, i32 1, i1 false)
  %16 = zext i32 %13 to i64
  %17 = add nuw nsw i64 %16, 1
  %scevgep = getelementptr i8, i8* %0, i64 %17
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %4
  %.0.lcssa = phi i8* [ %0, %4 ], [ %scevgep, %.preheader.loopexit ]
  %18 = icmp sgt i32 %2, 0
  br i1 %18, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %19 = zext i32 %2 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %indvars.iv = phi i64 [ %19, %.lr.ph.preheader ], [ %indvars.iv.next, %.backedge ]
  %.in = phi i32 [ %2, %.lr.ph.preheader ], [ %20, %.backedge ]
  %.15 = phi i8* [ %.0.lcssa, %.lr.ph.preheader ], [ %.1.be, %.backedge ]
  %20 = add nsw i32 %.in, -1
  %21 = zext i32 %20 to i64
  %22 = lshr i64 %1, %21
  %23 = trunc i64 %22 to i8
  %24 = and i8 %23, 1
  %25 = or i8 %24, 48
  %26 = getelementptr inbounds i8, i8* %.15, i64 1
  store i8 %25, i8* %.15, align 1
  %27 = and i32 %20, 3
  %28 = icmp ne i32 %27, 0
  %29 = icmp eq i32 %20, 0
  %or.cond = or i1 %29, %28
  br i1 %or.cond, label %.backedge, label %31

.backedge:                                        ; preds = %.lr.ph, %31
  %.1.be = phi i8* [ %26, %.lr.ph ], [ %32, %31 ]
  %30 = icmp sgt i64 %indvars.iv, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  br i1 %30, label %.lr.ph, label %._crit_edge.loopexit

; <label>:31:                                     ; preds = %.lr.ph
  %32 = getelementptr inbounds i8, i8* %.15, i64 2
  store i8 32, i8* %26, align 1
  br label %.backedge

._crit_edge.loopexit:                             ; preds = %.backedge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %.1.lcssa = phi i8* [ %.0.lcssa, %.preheader ], [ %.1.be, %._crit_edge.loopexit ]
  store i8 0, i8* %.1.lcssa, align 1
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

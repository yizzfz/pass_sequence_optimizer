; ModuleID = 'adpcm.ll'
source_filename = "adpcm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.adpcm_state = type { i16, i8 }

@stepsizeTable = internal unnamed_addr constant [89 x i32] [i32 7, i32 8, i32 9, i32 10, i32 11, i32 12, i32 13, i32 14, i32 16, i32 17, i32 19, i32 21, i32 23, i32 25, i32 28, i32 31, i32 34, i32 37, i32 41, i32 45, i32 50, i32 55, i32 60, i32 66, i32 73, i32 80, i32 88, i32 97, i32 107, i32 118, i32 130, i32 143, i32 157, i32 173, i32 190, i32 209, i32 230, i32 253, i32 279, i32 307, i32 337, i32 371, i32 408, i32 449, i32 494, i32 544, i32 598, i32 658, i32 724, i32 796, i32 876, i32 963, i32 1060, i32 1166, i32 1282, i32 1411, i32 1552, i32 1707, i32 1878, i32 2066, i32 2272, i32 2499, i32 2749, i32 3024, i32 3327, i32 3660, i32 4026, i32 4428, i32 4871, i32 5358, i32 5894, i32 6484, i32 7132, i32 7845, i32 8630, i32 9493, i32 10442, i32 11487, i32 12635, i32 13899, i32 15289, i32 16818, i32 18500, i32 20350, i32 22385, i32 24623, i32 27086, i32 29794, i32 32767], align 16
@indexTable = internal unnamed_addr constant [16 x i32] [i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8, i32 -1, i32 -1, i32 -1, i32 -1, i32 2, i32 4, i32 6, i32 8], align 16

; Function Attrs: noinline norecurse nounwind uwtable
define void @adpcm_coder(i16* nocapture readonly, i8* nocapture, i32, %struct.adpcm_state* nocapture) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %3, i64 0, i32 0
  %6 = load i16, i16* %5, align 2
  %7 = sext i16 %6 to i32
  %8 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %3, i64 0, i32 1
  %9 = load i8, i8* %8, align 2
  %10 = sext i8 %9 to i32
  %11 = icmp sgt i32 %2, 0
  br i1 %11, label %.lr.ph.preheader, label %._crit_edge.thread

.lr.ph.preheader:                                 ; preds = %4
  %12 = sext i8 %9 to i64
  %13 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %57
  %.029 = phi i32 [ %58, %57 ], [ 1, %.lr.ph.preheader ]
  %.0128 = phi i32 [ %.1, %57 ], [ 0, %.lr.ph.preheader ]
  %.0227 = phi i32 [ %59, %57 ], [ %2, %.lr.ph.preheader ]
  %.0326 = phi i32 [ %.2, %57 ], [ %10, %.lr.ph.preheader ]
  %.0525 = phi i16* [ %15, %57 ], [ %0, %.lr.ph.preheader ]
  %.0624 = phi i8* [ %.17, %57 ], [ %1, %.lr.ph.preheader ]
  %.01123 = phi i32 [ %.3, %57 ], [ %7, %.lr.ph.preheader ]
  %.02022 = phi i32 [ %48, %57 ], [ %14, %.lr.ph.preheader ]
  %15 = getelementptr inbounds i16, i16* %.0525, i64 1
  %16 = load i16, i16* %.0525, align 2
  %17 = sext i16 %16 to i32
  %18 = sub nsw i32 %17, %.01123
  %19 = ashr i32 %18, 31
  %20 = and i32 %19, 8
  %21 = icmp eq i32 %20, 0
  %22 = sub nsw i32 0, %18
  %. = select i1 %21, i32 %18, i32 %22
  %23 = ashr i32 %.02022, 3
  %24 = icmp slt i32 %., %.02022
  %25 = select i1 %24, i32 0, i32 %.02022
  %.118 = sub nsw i32 %., %25
  %.014 = select i1 %24, i32 0, i32 4
  %26 = select i1 %24, i32 0, i32 %.02022
  %.08 = add nsw i32 %26, %23
  %27 = ashr i32 %.02022, 1
  %28 = icmp slt i32 %.118, %27
  %29 = or i32 %.014, 2
  %30 = select i1 %28, i32 0, i32 %27
  %.118. = sub nsw i32 %.118, %30
  %.014. = select i1 %28, i32 %.014, i32 %29
  %31 = select i1 %28, i32 0, i32 %27
  %.08. = add nsw i32 %.08, %31
  %32 = ashr i32 %.02022, 2
  %33 = icmp slt i32 %.118., %32
  %not. = xor i1 %33, true
  %34 = zext i1 %not. to i32
  %35 = select i1 %33, i32 0, i32 %32
  %.210 = add nsw i32 %.08., %35
  %36 = sub i32 0, %.210
  %.112.p = select i1 %21, i32 %.210, i32 %36
  %.112 = add i32 %.112.p, %.01123
  %37 = icmp sgt i32 %.112, 32767
  %38 = icmp sgt i32 %.112, -32768
  %..112 = select i1 %38, i32 %.112, i32 -32768
  %.3 = select i1 %37, i32 32767, i32 %..112
  %.216 = or i32 %.014., %20
  %39 = or i32 %.216, %34
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %40
  %42 = load i32, i32* %41, align 4
  %43 = add nsw i32 %42, %.0326
  %44 = icmp sgt i32 %43, 0
  %.21 = select i1 %44, i32 %43, i32 0
  %45 = icmp slt i32 %.21, 88
  %.2 = select i1 %45, i32 %.21, i32 88
  %46 = zext i32 %.2 to i64
  %47 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = icmp eq i32 %.029, 0
  br i1 %49, label %53, label %50

; <label>:50:                                     ; preds = %.lr.ph
  %51 = shl nuw nsw i32 %39, 4
  %52 = and i32 %51, 240
  br label %57

; <label>:53:                                     ; preds = %.lr.ph
  %54 = or i32 %39, %.0128
  %55 = trunc i32 %54 to i8
  %56 = getelementptr inbounds i8, i8* %.0624, i64 1
  store i8 %55, i8* %.0624, align 1
  br label %57

; <label>:57:                                     ; preds = %50, %53
  %.17 = phi i8* [ %.0624, %50 ], [ %56, %53 ]
  %.1 = phi i32 [ %52, %50 ], [ %.0128, %53 ]
  %58 = xor i32 %.029, 1
  %59 = add nsw i32 %.0227, -1
  %60 = icmp sgt i32 %.0227, 1
  br i1 %60, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %57
  %phitmp = icmp eq i32 %58, 0
  br i1 %phitmp, label %61, label %._crit_edge.thread

; <label>:61:                                     ; preds = %._crit_edge
  %62 = trunc i32 %.1 to i8
  store i8 %62, i8* %.17, align 1
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %4, %._crit_edge, %61
  %.03.lcssa35 = phi i32 [ %.2, %._crit_edge ], [ %.2, %61 ], [ %10, %4 ]
  %.011.lcssa34 = phi i32 [ %.3, %._crit_edge ], [ %.3, %61 ], [ %7, %4 ]
  %63 = trunc i32 %.011.lcssa34 to i16
  store i16 %63, i16* %5, align 2
  %64 = trunc i32 %.03.lcssa35 to i8
  store i8 %64, i8* %8, align 2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @adpcm_decoder(i8* nocapture readonly, i16* nocapture, i32, %struct.adpcm_state* nocapture) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %3, i64 0, i32 0
  %6 = load i16, i16* %5, align 2
  %7 = sext i16 %6 to i32
  %8 = getelementptr inbounds %struct.adpcm_state, %struct.adpcm_state* %3, i64 0, i32 1
  %9 = load i8, i8* %8, align 2
  %10 = sext i8 %9 to i32
  %11 = icmp sgt i32 %2, 0
  br i1 %11, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %4
  %12 = sext i8 %9 to i64
  %13 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %12
  %14 = load i32, i32* %13, align 4
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %21
  %.025 = phi i32 [ %22, %21 ], [ 0, %.lr.ph.preheader ]
  %.0124 = phi i32 [ %.1, %21 ], [ 0, %.lr.ph.preheader ]
  %.0223 = phi i32 [ %51, %21 ], [ %2, %.lr.ph.preheader ]
  %.0322 = phi i32 [ %.2, %21 ], [ %10, %.lr.ph.preheader ]
  %.0521 = phi i8* [ %.16, %21 ], [ %0, %.lr.ph.preheader ]
  %.0720 = phi i16* [ %50, %21 ], [ %1, %.lr.ph.preheader ]
  %.01219 = phi i32 [ %48, %21 ], [ %14, %.lr.ph.preheader ]
  %.01318 = phi i32 [ %.3, %21 ], [ %7, %.lr.ph.preheader ]
  %15 = icmp eq i32 %.025, 0
  br i1 %15, label %16, label %21

; <label>:16:                                     ; preds = %.lr.ph
  %17 = getelementptr inbounds i8, i8* %.0521, i64 1
  %18 = load i8, i8* %.0521, align 1
  %19 = sext i8 %18 to i32
  %20 = lshr i32 %19, 4
  br label %21

; <label>:21:                                     ; preds = %.lr.ph, %16
  %.011.in = phi i32 [ %20, %16 ], [ %.0124, %.lr.ph ]
  %.16 = phi i8* [ %17, %16 ], [ %.0521, %.lr.ph ]
  %.1 = phi i32 [ %19, %16 ], [ %.0124, %.lr.ph ]
  %.011 = and i32 %.011.in, 15
  %22 = xor i32 %.025, 1
  %23 = zext i32 %.011 to i64
  %24 = getelementptr inbounds [16 x i32], [16 x i32]* @indexTable, i64 0, i64 %23
  %25 = load i32, i32* %24, align 4
  %26 = add nsw i32 %25, %.0322
  %27 = icmp sgt i32 %26, 0
  %. = select i1 %27, i32 %26, i32 0
  %28 = icmp slt i32 %., 88
  %.2 = select i1 %28, i32 %., i32 88
  %29 = and i32 %.011.in, 8
  %30 = ashr i32 %.01219, 3
  %31 = and i32 %.011.in, 4
  %32 = icmp eq i32 %31, 0
  %33 = select i1 %32, i32 0, i32 %.01219
  %.17 = add nsw i32 %33, %30
  %34 = and i32 %.011.in, 2
  %35 = icmp eq i32 %34, 0
  %36 = ashr i32 %.01219, 1
  %37 = select i1 %35, i32 0, i32 %36
  %.19 = add nsw i32 %.17, %37
  %38 = and i32 %.011.in, 1
  %39 = icmp eq i32 %38, 0
  %40 = ashr i32 %.01219, 2
  %41 = select i1 %39, i32 0, i32 %40
  %.210 = add nsw i32 %.19, %41
  %42 = icmp eq i32 %29, 0
  %43 = sub i32 0, %.210
  %.114.p = select i1 %42, i32 %.210, i32 %43
  %.114 = add i32 %.114.p, %.01318
  %44 = icmp sgt i32 %.114, 32767
  %45 = icmp sgt i32 %.114, -32768
  %..114 = select i1 %45, i32 %.114, i32 -32768
  %.3 = select i1 %44, i32 32767, i32 %..114
  %46 = zext i32 %.2 to i64
  %47 = getelementptr inbounds [89 x i32], [89 x i32]* @stepsizeTable, i64 0, i64 %46
  %48 = load i32, i32* %47, align 4
  %49 = trunc i32 %.3 to i16
  store i16 %49, i16* %.0720, align 2
  %50 = getelementptr inbounds i16, i16* %.0720, i64 1
  %51 = add nsw i32 %.0223, -1
  %52 = icmp sgt i32 %.0223, 1
  br i1 %52, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %21
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %4
  %.013.lcssa = phi i32 [ %7, %4 ], [ %.3, %._crit_edge.loopexit ]
  %.03.lcssa = phi i32 [ %10, %4 ], [ %.2, %._crit_edge.loopexit ]
  %53 = trunc i32 %.013.lcssa to i16
  store i16 %53, i16* %5, align 2
  %54 = trunc i32 %.03.lcssa to i8
  store i8 %54, i8* %8, align 2
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

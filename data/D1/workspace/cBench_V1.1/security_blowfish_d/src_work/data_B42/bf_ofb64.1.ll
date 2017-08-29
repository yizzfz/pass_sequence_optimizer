; ModuleID = 'bf_ofb64.ll'
source_filename = "bf_ofb64.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

; Function Attrs: noinline nounwind uwtable
define void @BF_ofb64_encrypt(i8* nocapture readonly, i8* nocapture, i64, %struct.bf_key_st*, i8* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %7 = alloca [8 x i8], align 1
  %8 = alloca [2 x i64], align 16
  %9 = load i32, i32* %5, align 4
  %10 = getelementptr inbounds i8, i8* %4, i64 1
  %11 = load i8, i8* %4, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 24
  %14 = getelementptr inbounds i8, i8* %4, i64 2
  %15 = load i8, i8* %10, align 1
  %16 = zext i8 %15 to i64
  %17 = shl nuw nsw i64 %16, 16
  %18 = or i64 %17, %13
  %19 = getelementptr inbounds i8, i8* %4, i64 3
  %20 = load i8, i8* %14, align 1
  %21 = zext i8 %20 to i64
  %22 = shl nuw nsw i64 %21, 8
  %23 = or i64 %18, %22
  %24 = getelementptr inbounds i8, i8* %4, i64 4
  %25 = load i8, i8* %19, align 1
  %26 = zext i8 %25 to i64
  %27 = or i64 %23, %26
  %28 = getelementptr inbounds i8, i8* %4, i64 5
  %29 = load i8, i8* %24, align 1
  %30 = zext i8 %29 to i64
  %31 = shl nuw nsw i64 %30, 24
  %32 = getelementptr inbounds i8, i8* %4, i64 6
  %33 = load i8, i8* %28, align 1
  %34 = zext i8 %33 to i64
  %35 = shl nuw nsw i64 %34, 16
  %36 = or i64 %35, %31
  %37 = getelementptr inbounds i8, i8* %4, i64 7
  %38 = load i8, i8* %32, align 1
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 8
  %41 = or i64 %36, %40
  %42 = load i8, i8* %37, align 1
  %43 = zext i8 %42 to i64
  %44 = or i64 %41, %43
  %45 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 0
  store i64 %27, i64* %45, align 16
  %46 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 1
  store i64 %44, i64* %46, align 8
  %47 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 0
  %48 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 1
  store i8 %11, i8* %47, align 1
  %49 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 2
  store i8 %15, i8* %48, align 1
  %50 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 3
  store i8 %20, i8* %49, align 1
  %51 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 4
  store i8 %25, i8* %50, align 1
  %52 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 5
  store i8 %29, i8* %51, align 1
  %53 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 6
  store i8 %33, i8* %52, align 1
  %54 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 7
  store i8 %38, i8* %53, align 1
  store i8 %42, i8* %54, align 1
  %55 = icmp eq i64 %2, 0
  br i1 %55, label %._crit_edge.thread, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %76
  %.in = phi i64 [ %56, %76 ], [ %2, %.lr.ph.preheader ]
  %.08 = phi i8* [ %77, %76 ], [ %0, %.lr.ph.preheader ]
  %.017 = phi i8* [ %83, %76 ], [ %1, %.lr.ph.preheader ]
  %.026 = phi i32 [ %.1, %76 ], [ 0, %.lr.ph.preheader ]
  %.045 = phi i32 [ %85, %76 ], [ %9, %.lr.ph.preheader ]
  %56 = add nsw i64 %.in, -1
  %57 = icmp eq i32 %.045, 0
  br i1 %57, label %58, label %76

; <label>:58:                                     ; preds = %.lr.ph
  call void @BF_encrypt(i64* nonnull %45, %struct.bf_key_st* %3, i32 1) #2
  %59 = load i64, i64* %45, align 16
  %60 = lshr i64 %59, 24
  %61 = trunc i64 %60 to i8
  store i8 %61, i8* %47, align 1
  %62 = lshr i64 %59, 16
  %63 = trunc i64 %62 to i8
  store i8 %63, i8* %48, align 1
  %64 = lshr i64 %59, 8
  %65 = trunc i64 %64 to i8
  store i8 %65, i8* %49, align 1
  %66 = trunc i64 %59 to i8
  store i8 %66, i8* %50, align 1
  %67 = load i64, i64* %46, align 8
  %68 = lshr i64 %67, 24
  %69 = trunc i64 %68 to i8
  store i8 %69, i8* %51, align 1
  %70 = lshr i64 %67, 16
  %71 = trunc i64 %70 to i8
  store i8 %71, i8* %52, align 1
  %72 = lshr i64 %67, 8
  %73 = trunc i64 %72 to i8
  store i8 %73, i8* %53, align 1
  %74 = trunc i64 %67 to i8
  store i8 %74, i8* %54, align 1
  %75 = add nsw i32 %.026, 1
  br label %76

; <label>:76:                                     ; preds = %58, %.lr.ph
  %.1 = phi i32 [ %75, %58 ], [ %.026, %.lr.ph ]
  %77 = getelementptr inbounds i8, i8* %.08, i64 1
  %78 = load i8, i8* %.08, align 1
  %79 = sext i32 %.045 to i64
  %80 = getelementptr inbounds [8 x i8], [8 x i8]* %7, i64 0, i64 %79
  %81 = load i8, i8* %80, align 1
  %82 = xor i8 %81, %78
  %83 = getelementptr inbounds i8, i8* %.017, i64 1
  store i8 %82, i8* %.017, align 1
  %84 = add nsw i32 %.045, 1
  %85 = and i32 %84, 7
  %86 = icmp eq i64 %56, 0
  br i1 %86, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %76
  %87 = icmp eq i32 %.1, 0
  br i1 %87, label %._crit_edge.thread, label %88

; <label>:88:                                     ; preds = %._crit_edge
  %89 = load i64, i64* %45, align 16
  %90 = load i64, i64* %46, align 8
  %91 = lshr i64 %89, 24
  %92 = trunc i64 %91 to i8
  store i8 %92, i8* %4, align 1
  %93 = lshr i64 %89, 16
  %94 = trunc i64 %93 to i8
  store i8 %94, i8* %10, align 1
  %95 = lshr i64 %89, 8
  %96 = trunc i64 %95 to i8
  store i8 %96, i8* %14, align 1
  %97 = trunc i64 %89 to i8
  store i8 %97, i8* %19, align 1
  %98 = lshr i64 %90, 24
  %99 = trunc i64 %98 to i8
  store i8 %99, i8* %24, align 1
  %100 = lshr i64 %90, 16
  %101 = trunc i64 %100 to i8
  store i8 %101, i8* %28, align 1
  %102 = lshr i64 %90, 8
  %103 = trunc i64 %102 to i8
  store i8 %103, i8* %32, align 1
  %104 = trunc i64 %90 to i8
  store i8 %104, i8* %37, align 1
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %6, %._crit_edge, %88
  %.04.lcssa10 = phi i32 [ %85, %._crit_edge ], [ %85, %88 ], [ %9, %6 ]
  store i32 %.04.lcssa10, i32* %5, align 4
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

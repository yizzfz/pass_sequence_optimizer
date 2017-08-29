; ModuleID = 'bf_cfb64.ll'
source_filename = "bf_cfb64.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

; Function Attrs: noinline nounwind uwtable
define void @BF_cfb64_encrypt(i8* nocapture readonly, i8* nocapture, i64, %struct.bf_key_st*, i8*, i32* nocapture, i32) local_unnamed_addr #0 {
  %8 = alloca [2 x i64], align 16
  %9 = load i32, i32* %5, align 4
  %10 = icmp eq i32 %6, 0
  %11 = add nsw i64 %2, -1
  %12 = icmp eq i64 %2, 0
  br i1 %10, label %.preheader, label %.preheader10

.preheader10:                                     ; preds = %7
  br i1 %12, label %.loopexit, label %.lr.ph18

.lr.ph18:                                         ; preds = %.preheader10
  %13 = getelementptr inbounds i8, i8* %4, i64 1
  %14 = getelementptr inbounds i8, i8* %4, i64 2
  %15 = getelementptr inbounds i8, i8* %4, i64 3
  %16 = getelementptr inbounds i8, i8* %4, i64 4
  %17 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 0
  %18 = getelementptr inbounds i8, i8* %4, i64 5
  %19 = getelementptr inbounds i8, i8* %4, i64 6
  %20 = getelementptr inbounds i8, i8* %4, i64 7
  %21 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 1
  br label %31

.preheader:                                       ; preds = %7
  br i1 %12, label %.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.preheader
  %22 = getelementptr inbounds i8, i8* %4, i64 1
  %23 = getelementptr inbounds i8, i8* %4, i64 2
  %24 = getelementptr inbounds i8, i8* %4, i64 3
  %25 = getelementptr inbounds i8, i8* %4, i64 4
  %26 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 0
  %27 = getelementptr inbounds i8, i8* %4, i64 5
  %28 = getelementptr inbounds i8, i8* %4, i64 6
  %29 = getelementptr inbounds i8, i8* %4, i64 7
  %30 = getelementptr inbounds [2 x i64], [2 x i64]* %8, i64 0, i64 1
  br label %91

; <label>:31:                                     ; preds = %.lr.ph18, %79
  %32 = phi i64 [ %11, %.lr.ph18 ], [ %89, %79 ]
  %.017 = phi i8* [ %0, %.lr.ph18 ], [ %80, %79 ]
  %.0116 = phi i8* [ %1, %.lr.ph18 ], [ %86, %79 ]
  %.0715 = phi i32 [ %9, %.lr.ph18 ], [ %88, %79 ]
  %33 = icmp eq i32 %.0715, 0
  br i1 %33, label %34, label %79

; <label>:34:                                     ; preds = %31
  %35 = load i8, i8* %4, align 1
  %36 = zext i8 %35 to i64
  %37 = shl nuw nsw i64 %36, 24
  %38 = load i8, i8* %13, align 1
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 16
  %41 = or i64 %40, %37
  %42 = load i8, i8* %14, align 1
  %43 = zext i8 %42 to i64
  %44 = shl nuw nsw i64 %43, 8
  %45 = or i64 %41, %44
  %46 = load i8, i8* %15, align 1
  %47 = zext i8 %46 to i64
  %48 = or i64 %45, %47
  store i64 %48, i64* %17, align 16
  %49 = load i8, i8* %16, align 1
  %50 = zext i8 %49 to i64
  %51 = shl nuw nsw i64 %50, 24
  %52 = load i8, i8* %18, align 1
  %53 = zext i8 %52 to i64
  %54 = shl nuw nsw i64 %53, 16
  %55 = or i64 %54, %51
  %56 = load i8, i8* %19, align 1
  %57 = zext i8 %56 to i64
  %58 = shl nuw nsw i64 %57, 8
  %59 = or i64 %55, %58
  %60 = load i8, i8* %20, align 1
  %61 = zext i8 %60 to i64
  %62 = or i64 %59, %61
  store i64 %62, i64* %21, align 8
  call void @BF_encrypt(i64* nonnull %17, %struct.bf_key_st* %3, i32 1) #2
  %63 = load i64, i64* %17, align 16
  %64 = lshr i64 %63, 24
  %65 = trunc i64 %64 to i8
  store i8 %65, i8* %4, align 1
  %66 = lshr i64 %63, 16
  %67 = trunc i64 %66 to i8
  store i8 %67, i8* %13, align 1
  %68 = lshr i64 %63, 8
  %69 = trunc i64 %68 to i8
  store i8 %69, i8* %14, align 1
  %70 = trunc i64 %63 to i8
  store i8 %70, i8* %15, align 1
  %71 = load i64, i64* %21, align 8
  %72 = lshr i64 %71, 24
  %73 = trunc i64 %72 to i8
  store i8 %73, i8* %16, align 1
  %74 = lshr i64 %71, 16
  %75 = trunc i64 %74 to i8
  store i8 %75, i8* %18, align 1
  %76 = lshr i64 %71, 8
  %77 = trunc i64 %76 to i8
  store i8 %77, i8* %19, align 1
  %78 = trunc i64 %71 to i8
  store i8 %78, i8* %20, align 1
  br label %79

; <label>:79:                                     ; preds = %34, %31
  %80 = getelementptr inbounds i8, i8* %.017, i64 1
  %81 = load i8, i8* %.017, align 1
  %82 = sext i32 %.0715 to i64
  %83 = getelementptr inbounds i8, i8* %4, i64 %82
  %84 = load i8, i8* %83, align 1
  %85 = xor i8 %84, %81
  %86 = getelementptr inbounds i8, i8* %.0116, i64 1
  store i8 %85, i8* %.0116, align 1
  store i8 %85, i8* %83, align 1
  %87 = add nsw i32 %.0715, 1
  %88 = and i32 %87, 7
  %89 = add nsw i64 %32, -1
  %90 = icmp eq i64 %32, 0
  br i1 %90, label %.loopexit.loopexit26, label %31

; <label>:91:                                     ; preds = %.lr.ph, %139
  %92 = phi i64 [ %11, %.lr.ph ], [ %149, %139 ]
  %.114 = phi i8* [ %0, %.lr.ph ], [ %140, %139 ]
  %.1213 = phi i8* [ %1, %.lr.ph ], [ %146, %139 ]
  %.1812 = phi i32 [ %9, %.lr.ph ], [ %148, %139 ]
  %93 = icmp eq i32 %.1812, 0
  br i1 %93, label %94, label %139

; <label>:94:                                     ; preds = %91
  %95 = load i8, i8* %4, align 1
  %96 = zext i8 %95 to i64
  %97 = shl nuw nsw i64 %96, 24
  %98 = load i8, i8* %22, align 1
  %99 = zext i8 %98 to i64
  %100 = shl nuw nsw i64 %99, 16
  %101 = or i64 %100, %97
  %102 = load i8, i8* %23, align 1
  %103 = zext i8 %102 to i64
  %104 = shl nuw nsw i64 %103, 8
  %105 = or i64 %101, %104
  %106 = load i8, i8* %24, align 1
  %107 = zext i8 %106 to i64
  %108 = or i64 %105, %107
  store i64 %108, i64* %26, align 16
  %109 = load i8, i8* %25, align 1
  %110 = zext i8 %109 to i64
  %111 = shl nuw nsw i64 %110, 24
  %112 = load i8, i8* %27, align 1
  %113 = zext i8 %112 to i64
  %114 = shl nuw nsw i64 %113, 16
  %115 = or i64 %114, %111
  %116 = load i8, i8* %28, align 1
  %117 = zext i8 %116 to i64
  %118 = shl nuw nsw i64 %117, 8
  %119 = or i64 %115, %118
  %120 = load i8, i8* %29, align 1
  %121 = zext i8 %120 to i64
  %122 = or i64 %119, %121
  store i64 %122, i64* %30, align 8
  call void @BF_encrypt(i64* nonnull %26, %struct.bf_key_st* %3, i32 1) #2
  %123 = load i64, i64* %26, align 16
  %124 = lshr i64 %123, 24
  %125 = trunc i64 %124 to i8
  store i8 %125, i8* %4, align 1
  %126 = lshr i64 %123, 16
  %127 = trunc i64 %126 to i8
  store i8 %127, i8* %22, align 1
  %128 = lshr i64 %123, 8
  %129 = trunc i64 %128 to i8
  store i8 %129, i8* %23, align 1
  %130 = trunc i64 %123 to i8
  store i8 %130, i8* %24, align 1
  %131 = load i64, i64* %30, align 8
  %132 = lshr i64 %131, 24
  %133 = trunc i64 %132 to i8
  store i8 %133, i8* %25, align 1
  %134 = lshr i64 %131, 16
  %135 = trunc i64 %134 to i8
  store i8 %135, i8* %27, align 1
  %136 = lshr i64 %131, 8
  %137 = trunc i64 %136 to i8
  store i8 %137, i8* %28, align 1
  %138 = trunc i64 %131 to i8
  store i8 %138, i8* %29, align 1
  br label %139

; <label>:139:                                    ; preds = %94, %91
  %140 = getelementptr inbounds i8, i8* %.114, i64 1
  %141 = load i8, i8* %.114, align 1
  %142 = sext i32 %.1812 to i64
  %143 = getelementptr inbounds i8, i8* %4, i64 %142
  %144 = load i8, i8* %143, align 1
  store i8 %141, i8* %143, align 1
  %145 = xor i8 %144, %141
  %146 = getelementptr inbounds i8, i8* %.1213, i64 1
  store i8 %145, i8* %.1213, align 1
  %147 = add nsw i32 %.1812, 1
  %148 = and i32 %147, 7
  %149 = add nsw i64 %92, -1
  %150 = icmp eq i64 %92, 0
  br i1 %150, label %.loopexit.loopexit, label %91

.loopexit.loopexit:                               ; preds = %139
  br label %.loopexit

.loopexit.loopexit26:                             ; preds = %79
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit26, %.loopexit.loopexit, %.preheader10, %.preheader
  %.29 = phi i32 [ %9, %.preheader ], [ %9, %.preheader10 ], [ %148, %.loopexit.loopexit ], [ %88, %.loopexit.loopexit26 ]
  store i32 %.29, i32* %5, align 4
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

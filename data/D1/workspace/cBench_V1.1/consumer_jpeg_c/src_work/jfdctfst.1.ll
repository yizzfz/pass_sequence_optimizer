; ModuleID = 'jfdctfst.ll'
source_filename = "jfdctfst.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_fdct_ifast(i32* nocapture) local_unnamed_addr #0 {
  br label %2

; <label>:2:                                      ; preds = %2, %1
  %.07 = phi i32 [ 7, %1 ], [ %68, %2 ]
  %.016 = phi i32* [ %0, %1 ], [ %67, %2 ]
  %3 = load i32, i32* %.016, align 4
  %4 = getelementptr inbounds i32, i32* %.016, i64 7
  %5 = load i32, i32* %4, align 4
  %6 = add nsw i32 %5, %3
  %7 = sub nsw i32 %3, %5
  %8 = getelementptr inbounds i32, i32* %.016, i64 1
  %9 = load i32, i32* %8, align 4
  %10 = getelementptr inbounds i32, i32* %.016, i64 6
  %11 = load i32, i32* %10, align 4
  %12 = add nsw i32 %11, %9
  %13 = sub nsw i32 %9, %11
  %14 = getelementptr inbounds i32, i32* %.016, i64 2
  %15 = load i32, i32* %14, align 4
  %16 = getelementptr inbounds i32, i32* %.016, i64 5
  %17 = load i32, i32* %16, align 4
  %18 = add nsw i32 %17, %15
  %19 = sub nsw i32 %15, %17
  %20 = getelementptr inbounds i32, i32* %.016, i64 3
  %21 = load i32, i32* %20, align 4
  %22 = getelementptr inbounds i32, i32* %.016, i64 4
  %23 = load i32, i32* %22, align 4
  %24 = add nsw i32 %23, %21
  %25 = sub nsw i32 %21, %23
  %26 = add nsw i32 %24, %6
  %27 = sub nsw i32 %6, %24
  %28 = add nsw i32 %18, %12
  %29 = sub i32 %12, %18
  %30 = add nsw i32 %26, %28
  store i32 %30, i32* %.016, align 4
  %31 = sub nsw i32 %26, %28
  store i32 %31, i32* %22, align 4
  %32 = add nsw i32 %29, %27
  %33 = sext i32 %32 to i64
  %34 = mul nsw i64 %33, 181
  %35 = lshr i64 %34, 8
  %36 = trunc i64 %35 to i32
  %37 = add nsw i32 %36, %27
  store i32 %37, i32* %14, align 4
  %38 = sub nsw i32 %27, %36
  store i32 %38, i32* %10, align 4
  %39 = add nsw i32 %25, %19
  %40 = add nsw i32 %19, %13
  %41 = add nsw i32 %13, %7
  %42 = sub nsw i32 %39, %41
  %43 = sext i32 %42 to i64
  %44 = mul nsw i64 %43, 98
  %45 = lshr i64 %44, 8
  %46 = trunc i64 %45 to i32
  %47 = sext i32 %39 to i64
  %48 = mul nsw i64 %47, 139
  %49 = lshr i64 %48, 8
  %50 = trunc i64 %49 to i32
  %51 = add nsw i32 %46, %50
  %52 = sext i32 %41 to i64
  %53 = mul nsw i64 %52, 334
  %54 = lshr i64 %53, 8
  %55 = trunc i64 %54 to i32
  %56 = add nsw i32 %46, %55
  %57 = sext i32 %40 to i64
  %58 = mul nsw i64 %57, 181
  %59 = lshr i64 %58, 8
  %60 = trunc i64 %59 to i32
  %61 = add nsw i32 %60, %7
  %62 = sub nsw i32 %7, %60
  %63 = add nsw i32 %51, %62
  store i32 %63, i32* %16, align 4
  %64 = sub nsw i32 %62, %51
  store i32 %64, i32* %20, align 4
  %65 = add nsw i32 %56, %61
  store i32 %65, i32* %8, align 4
  %66 = sub nsw i32 %61, %56
  store i32 %66, i32* %4, align 4
  %67 = getelementptr inbounds i32, i32* %.016, i64 8
  %68 = add nsw i32 %.07, -1
  %69 = icmp sgt i32 %.07, 0
  br i1 %69, label %2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.15 = phi i32 [ %135, %.preheader ], [ 7, %.preheader.preheader ]
  %.124 = phi i32* [ %134, %.preheader ], [ %0, %.preheader.preheader ]
  %70 = load i32, i32* %.124, align 4
  %71 = getelementptr inbounds i32, i32* %.124, i64 56
  %72 = load i32, i32* %71, align 4
  %73 = add nsw i32 %72, %70
  %74 = sub nsw i32 %70, %72
  %75 = getelementptr inbounds i32, i32* %.124, i64 8
  %76 = load i32, i32* %75, align 4
  %77 = getelementptr inbounds i32, i32* %.124, i64 48
  %78 = load i32, i32* %77, align 4
  %79 = add nsw i32 %78, %76
  %80 = sub nsw i32 %76, %78
  %81 = getelementptr inbounds i32, i32* %.124, i64 16
  %82 = load i32, i32* %81, align 4
  %83 = getelementptr inbounds i32, i32* %.124, i64 40
  %84 = load i32, i32* %83, align 4
  %85 = add nsw i32 %84, %82
  %86 = sub nsw i32 %82, %84
  %87 = getelementptr inbounds i32, i32* %.124, i64 24
  %88 = load i32, i32* %87, align 4
  %89 = getelementptr inbounds i32, i32* %.124, i64 32
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %90, %88
  %92 = sub nsw i32 %88, %90
  %93 = add nsw i32 %91, %73
  %94 = sub nsw i32 %73, %91
  %95 = add nsw i32 %85, %79
  %96 = sub i32 %79, %85
  %97 = add nsw i32 %93, %95
  store i32 %97, i32* %.124, align 4
  %98 = sub nsw i32 %93, %95
  store i32 %98, i32* %89, align 4
  %99 = add nsw i32 %96, %94
  %100 = sext i32 %99 to i64
  %101 = mul nsw i64 %100, 181
  %102 = lshr i64 %101, 8
  %103 = trunc i64 %102 to i32
  %104 = add nsw i32 %103, %94
  store i32 %104, i32* %81, align 4
  %105 = sub nsw i32 %94, %103
  store i32 %105, i32* %77, align 4
  %106 = add nsw i32 %92, %86
  %107 = add nsw i32 %86, %80
  %108 = add nsw i32 %80, %74
  %109 = sub nsw i32 %106, %108
  %110 = sext i32 %109 to i64
  %111 = mul nsw i64 %110, 98
  %112 = lshr i64 %111, 8
  %113 = trunc i64 %112 to i32
  %114 = sext i32 %106 to i64
  %115 = mul nsw i64 %114, 139
  %116 = lshr i64 %115, 8
  %117 = trunc i64 %116 to i32
  %118 = add nsw i32 %113, %117
  %119 = sext i32 %108 to i64
  %120 = mul nsw i64 %119, 334
  %121 = lshr i64 %120, 8
  %122 = trunc i64 %121 to i32
  %123 = add nsw i32 %113, %122
  %124 = sext i32 %107 to i64
  %125 = mul nsw i64 %124, 181
  %126 = lshr i64 %125, 8
  %127 = trunc i64 %126 to i32
  %128 = add nsw i32 %127, %74
  %129 = sub nsw i32 %74, %127
  %130 = add nsw i32 %118, %129
  store i32 %130, i32* %83, align 4
  %131 = sub nsw i32 %129, %118
  store i32 %131, i32* %87, align 4
  %132 = add nsw i32 %123, %128
  store i32 %132, i32* %75, align 4
  %133 = sub nsw i32 %128, %123
  store i32 %133, i32* %71, align 4
  %134 = getelementptr inbounds i32, i32* %.124, i64 1
  %135 = add nsw i32 %.15, -1
  %136 = icmp sgt i32 %.15, 0
  br i1 %136, label %.preheader, label %137

; <label>:137:                                    ; preds = %.preheader
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

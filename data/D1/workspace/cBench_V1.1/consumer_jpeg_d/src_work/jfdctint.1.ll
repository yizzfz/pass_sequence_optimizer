; ModuleID = 'jfdctint.ll'
source_filename = "jfdctint.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline norecurse nounwind uwtable
define void @jpeg_fdct_islow(i32* nocapture) #0 {
  br label %2

; <label>:2:                                      ; preds = %1, %2
  %.07 = phi i32 [ 7, %1 ], [ %91, %2 ]
  %.016 = phi i32* [ %0, %1 ], [ %90, %2 ]
  %3 = load i32, i32* %.016, align 4
  %4 = getelementptr inbounds i32, i32* %.016, i64 7
  %5 = load i32, i32* %4, align 4
  %6 = add nsw i32 %5, %3
  %7 = sext i32 %6 to i64
  %8 = sub nsw i32 %3, %5
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i32, i32* %.016, i64 1
  %11 = load i32, i32* %10, align 4
  %12 = getelementptr inbounds i32, i32* %.016, i64 6
  %13 = load i32, i32* %12, align 4
  %14 = add nsw i32 %13, %11
  %15 = sext i32 %14 to i64
  %16 = sub nsw i32 %11, %13
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i32, i32* %.016, i64 2
  %19 = load i32, i32* %18, align 4
  %20 = getelementptr inbounds i32, i32* %.016, i64 5
  %21 = load i32, i32* %20, align 4
  %22 = add nsw i32 %21, %19
  %23 = sext i32 %22 to i64
  %24 = sub nsw i32 %19, %21
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds i32, i32* %.016, i64 3
  %27 = load i32, i32* %26, align 4
  %28 = getelementptr inbounds i32, i32* %.016, i64 4
  %29 = load i32, i32* %28, align 4
  %30 = add nsw i32 %29, %27
  %31 = sext i32 %30 to i64
  %32 = sub nsw i32 %27, %29
  %33 = sext i32 %32 to i64
  %34 = add nsw i64 %31, %7
  %35 = sub nsw i64 %7, %31
  %36 = add nsw i64 %23, %15
  %37 = sub nsw i64 %15, %23
  %38 = add nsw i64 %34, %36
  %.tr = trunc i64 %38 to i32
  %39 = shl i32 %.tr, 2
  store i32 %39, i32* %.016, align 4
  %40 = sub nsw i64 %34, %36
  %.tr3 = trunc i64 %40 to i32
  %41 = shl i32 %.tr3, 2
  store i32 %41, i32* %28, align 4
  %42 = add nsw i64 %35, %37
  %43 = mul nsw i64 %42, 4433
  %44 = mul nsw i64 %35, 6270
  %45 = add i64 %44, 1024
  %46 = add i64 %45, %43
  %47 = lshr i64 %46, 11
  %48 = trunc i64 %47 to i32
  store i32 %48, i32* %18, align 4
  %49 = mul nsw i64 %37, -15137
  %50 = add i64 %49, 1024
  %51 = add i64 %50, %43
  %52 = lshr i64 %51, 11
  %53 = trunc i64 %52 to i32
  store i32 %53, i32* %12, align 4
  %54 = add nsw i64 %33, %9
  %55 = add nsw i64 %25, %17
  %56 = add nsw i64 %33, %17
  %57 = add nsw i64 %25, %9
  %58 = add nsw i64 %56, %57
  %59 = mul nsw i64 %58, 9633
  %60 = mul nsw i64 %33, 2446
  %61 = mul nsw i64 %25, 16819
  %62 = mul nsw i64 %17, 25172
  %63 = mul nsw i64 %9, 12299
  %64 = mul nsw i64 %54, -7373
  %65 = mul nsw i64 %55, -20995
  %66 = mul nsw i64 %56, -16069
  %67 = mul nsw i64 %57, -3196
  %68 = add nsw i64 %59, %66
  %69 = add nsw i64 %59, %67
  %70 = add i64 %60, 1024
  %71 = add i64 %70, %64
  %72 = add i64 %71, %68
  %73 = lshr i64 %72, 11
  %74 = trunc i64 %73 to i32
  store i32 %74, i32* %4, align 4
  %75 = add i64 %61, 1024
  %76 = add i64 %75, %65
  %77 = add i64 %76, %69
  %78 = lshr i64 %77, 11
  %79 = trunc i64 %78 to i32
  store i32 %79, i32* %20, align 4
  %80 = add i64 %62, 1024
  %81 = add i64 %80, %65
  %82 = add i64 %81, %68
  %83 = lshr i64 %82, 11
  %84 = trunc i64 %83 to i32
  store i32 %84, i32* %26, align 4
  %85 = add i64 %63, 1024
  %86 = add i64 %85, %64
  %87 = add i64 %86, %69
  %88 = lshr i64 %87, 11
  %89 = trunc i64 %88 to i32
  store i32 %89, i32* %10, align 4
  %90 = getelementptr inbounds i32, i32* %.016, i64 8
  %91 = add nsw i32 %.07, -1
  %92 = icmp sgt i32 %.07, 0
  br i1 %92, label %2, label %.preheader.preheader

.preheader.preheader:                             ; preds = %2
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %.15 = phi i32 [ %185, %.preheader ], [ 7, %.preheader.preheader ]
  %.124 = phi i32* [ %184, %.preheader ], [ %0, %.preheader.preheader ]
  %93 = load i32, i32* %.124, align 4
  %94 = getelementptr inbounds i32, i32* %.124, i64 56
  %95 = load i32, i32* %94, align 4
  %96 = add nsw i32 %95, %93
  %97 = sext i32 %96 to i64
  %98 = sub nsw i32 %93, %95
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds i32, i32* %.124, i64 8
  %101 = load i32, i32* %100, align 4
  %102 = getelementptr inbounds i32, i32* %.124, i64 48
  %103 = load i32, i32* %102, align 4
  %104 = add nsw i32 %103, %101
  %105 = sext i32 %104 to i64
  %106 = sub nsw i32 %101, %103
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32* %.124, i64 16
  %109 = load i32, i32* %108, align 4
  %110 = getelementptr inbounds i32, i32* %.124, i64 40
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, %109
  %113 = sext i32 %112 to i64
  %114 = sub nsw i32 %109, %111
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32* %.124, i64 24
  %117 = load i32, i32* %116, align 4
  %118 = getelementptr inbounds i32, i32* %.124, i64 32
  %119 = load i32, i32* %118, align 4
  %120 = add nsw i32 %119, %117
  %121 = sext i32 %120 to i64
  %122 = sub nsw i32 %117, %119
  %123 = sext i32 %122 to i64
  %124 = add nsw i64 %121, %97
  %125 = sub nsw i64 %97, %121
  %126 = add nsw i64 %113, %105
  %127 = sub nsw i64 %105, %113
  %128 = add nsw i64 %126, 2
  %129 = add nsw i64 %128, %124
  %130 = lshr i64 %129, 2
  %131 = trunc i64 %130 to i32
  store i32 %131, i32* %.124, align 4
  %132 = sub nsw i64 2, %126
  %133 = add nsw i64 %132, %124
  %134 = lshr i64 %133, 2
  %135 = trunc i64 %134 to i32
  store i32 %135, i32* %118, align 4
  %136 = add nsw i64 %125, %127
  %137 = mul nsw i64 %136, 4433
  %138 = mul nsw i64 %125, 6270
  %139 = add i64 %138, 16384
  %140 = add i64 %139, %137
  %141 = lshr i64 %140, 15
  %142 = trunc i64 %141 to i32
  store i32 %142, i32* %108, align 4
  %143 = mul nsw i64 %127, -15137
  %144 = add i64 %143, 16384
  %145 = add i64 %144, %137
  %146 = lshr i64 %145, 15
  %147 = trunc i64 %146 to i32
  store i32 %147, i32* %102, align 4
  %148 = add nsw i64 %123, %99
  %149 = add nsw i64 %115, %107
  %150 = add nsw i64 %123, %107
  %151 = add nsw i64 %115, %99
  %152 = add nsw i64 %150, %151
  %153 = mul nsw i64 %152, 9633
  %154 = mul nsw i64 %123, 2446
  %155 = mul nsw i64 %115, 16819
  %156 = mul nsw i64 %107, 25172
  %157 = mul nsw i64 %99, 12299
  %158 = mul nsw i64 %148, -7373
  %159 = mul nsw i64 %149, -20995
  %160 = mul nsw i64 %150, -16069
  %161 = mul nsw i64 %151, -3196
  %162 = add nsw i64 %153, %160
  %163 = add nsw i64 %153, %161
  %164 = add i64 %154, 16384
  %165 = add i64 %164, %158
  %166 = add i64 %165, %162
  %167 = lshr i64 %166, 15
  %168 = trunc i64 %167 to i32
  store i32 %168, i32* %94, align 4
  %169 = add i64 %155, 16384
  %170 = add i64 %169, %159
  %171 = add i64 %170, %163
  %172 = lshr i64 %171, 15
  %173 = trunc i64 %172 to i32
  store i32 %173, i32* %110, align 4
  %174 = add i64 %156, 16384
  %175 = add i64 %174, %159
  %176 = add i64 %175, %162
  %177 = lshr i64 %176, 15
  %178 = trunc i64 %177 to i32
  store i32 %178, i32* %116, align 4
  %179 = add i64 %157, 16384
  %180 = add i64 %179, %158
  %181 = add i64 %180, %163
  %182 = lshr i64 %181, 15
  %183 = trunc i64 %182 to i32
  store i32 %183, i32* %100, align 4
  %184 = getelementptr inbounds i32, i32* %.124, i64 1
  %185 = add nsw i32 %.15, -1
  %186 = icmp sgt i32 %.15, 0
  br i1 %186, label %.preheader, label %187

; <label>:187:                                    ; preds = %.preheader
  ret void
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

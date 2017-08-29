; ModuleID = 'gsm_option.ll'
source_filename = "gsm_option.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

; Function Attrs: noinline norecurse nounwind uwtable
define i32 @gsm_option(%struct.gsm_state* nocapture, i32, i32* readonly) local_unnamed_addr #0 {
  %cond = icmp eq i32 %1, 1
  br i1 %cond, label %4, label %12

; <label>:4:                                      ; preds = %3
  %5 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 10
  %6 = load i8, i8* %5, align 4
  %7 = sext i8 %6 to i32
  %8 = icmp eq i32* %2, null
  br i1 %8, label %12, label %9

; <label>:9:                                      ; preds = %4
  %10 = load i32, i32* %2, align 4
  %11 = trunc i32 %10 to i8
  store i8 %11, i8* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %3, %9, %4
  %.0 = phi i32 [ %7, %4 ], [ %7, %9 ], [ -1, %3 ]
  ret i32 %.0
}

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

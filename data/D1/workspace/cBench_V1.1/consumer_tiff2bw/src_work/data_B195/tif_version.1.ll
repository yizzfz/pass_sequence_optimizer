; ModuleID = 'tif_version.ll'
source_filename = "tif_version.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@TIFFVersion = internal constant [106 x i8] c"LIBTIFF, Version 3.5.4\0ACopyright (c) 1988-1996 Sam Leffler\0ACopyright (c) 1991-1996 Silicon Graphics, Inc.\00", align 16

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i8* @TIFFGetVersion() local_unnamed_addr #0 {
  ret i8* getelementptr inbounds ([106 x i8], [106 x i8]* @TIFFVersion, i64 0, i64 0)
}

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

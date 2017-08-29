; ModuleID = 'bf_ecb.ll'
source_filename = "bf_ecb.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.bf_key_st = type { [18 x i64], [1024 x i64] }

@.str = private unnamed_addr constant [42 x i8] c"BlowFish part of SSLeay 0.7.0 30-Jan-1997\00", align 1
@BF_version = local_unnamed_addr global i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str, i64 0, i64 0), align 8
@.str.1 = private unnamed_addr constant [14 x i8] c"blowfish(idx)\00", align 1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i8* @BF_options() local_unnamed_addr #0 {
  ret i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0)
}

; Function Attrs: noinline nounwind uwtable
define void @BF_ecb_encrypt(i8* nocapture readonly, i8* nocapture, %struct.bf_key_st*, i32) local_unnamed_addr #1 {
  %5 = alloca [2 x i64], align 16
  %6 = getelementptr inbounds i8, i8* %0, i64 1
  %7 = load i8, i8* %0, align 1
  %8 = zext i8 %7 to i64
  %9 = shl nuw nsw i64 %8, 24
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %6, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 16
  %14 = or i64 %13, %9
  %15 = getelementptr inbounds i8, i8* %0, i64 3
  %16 = load i8, i8* %10, align 1
  %17 = zext i8 %16 to i64
  %18 = shl nuw nsw i64 %17, 8
  %19 = or i64 %14, %18
  %20 = getelementptr inbounds i8, i8* %0, i64 4
  %21 = load i8, i8* %15, align 1
  %22 = zext i8 %21 to i64
  %23 = or i64 %19, %22
  %24 = getelementptr inbounds [2 x i64], [2 x i64]* %5, i64 0, i64 0
  store i64 %23, i64* %24, align 16
  %25 = getelementptr inbounds i8, i8* %0, i64 5
  %26 = load i8, i8* %20, align 1
  %27 = zext i8 %26 to i64
  %28 = shl nuw nsw i64 %27, 24
  %29 = getelementptr inbounds i8, i8* %0, i64 6
  %30 = load i8, i8* %25, align 1
  %31 = zext i8 %30 to i64
  %32 = shl nuw nsw i64 %31, 16
  %33 = or i64 %32, %28
  %34 = getelementptr inbounds i8, i8* %0, i64 7
  %35 = load i8, i8* %29, align 1
  %36 = zext i8 %35 to i64
  %37 = shl nuw nsw i64 %36, 8
  %38 = or i64 %33, %37
  %39 = load i8, i8* %34, align 1
  %40 = zext i8 %39 to i64
  %41 = or i64 %38, %40
  %42 = getelementptr inbounds [2 x i64], [2 x i64]* %5, i64 0, i64 1
  store i64 %41, i64* %42, align 8
  call void @BF_encrypt(i64* nonnull %24, %struct.bf_key_st* %2, i32 %3) #3
  %43 = load i64, i64* %24, align 16
  %44 = lshr i64 %43, 24
  %45 = trunc i64 %44 to i8
  %46 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %45, i8* %1, align 1
  %47 = lshr i64 %43, 16
  %48 = trunc i64 %47 to i8
  %49 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %48, i8* %46, align 1
  %50 = lshr i64 %43, 8
  %51 = trunc i64 %50 to i8
  %52 = getelementptr inbounds i8, i8* %1, i64 3
  store i8 %51, i8* %49, align 1
  %53 = trunc i64 %43 to i8
  %54 = getelementptr inbounds i8, i8* %1, i64 4
  store i8 %53, i8* %52, align 1
  %55 = load i64, i64* %42, align 8
  %56 = lshr i64 %55, 24
  %57 = trunc i64 %56 to i8
  %58 = getelementptr inbounds i8, i8* %1, i64 5
  store i8 %57, i8* %54, align 1
  %59 = lshr i64 %55, 16
  %60 = trunc i64 %59 to i8
  %61 = getelementptr inbounds i8, i8* %1, i64 6
  store i8 %60, i8* %58, align 1
  %62 = lshr i64 %55, 8
  %63 = trunc i64 %62 to i8
  %64 = getelementptr inbounds i8, i8* %1, i64 7
  store i8 %63, i8* %61, align 1
  %65 = trunc i64 %55 to i8
  store i8 %65, i8* %64, align 1
  ret void
}

declare void @BF_encrypt(i64*, %struct.bf_key_st*, i32) local_unnamed_addr #2

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

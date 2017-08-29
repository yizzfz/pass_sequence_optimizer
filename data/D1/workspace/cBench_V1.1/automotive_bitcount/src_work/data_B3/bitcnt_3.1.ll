; ModuleID = 'bitcnt_3.ll'
source_filename = "bitcnt_3.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bits = internal unnamed_addr constant [256 x i8] c"\00\01\01\02\01\02\02\03\01\02\02\03\02\03\03\04\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\01\02\02\03\02\03\03\04\02\03\03\04\03\04\04\05\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\02\03\03\04\03\04\04\05\03\04\04\05\04\05\05\06\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\03\04\04\05\04\05\05\06\04\05\05\06\05\06\06\07\04\05\05\06\05\06\06\07\05\06\06\07\06\07\07\08", align 16

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @ntbl_bitcount(i64) local_unnamed_addr #0 {
  %2 = and i64 %0, 15
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %2
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = lshr i64 %0, 4
  %7 = and i64 %6, 15
  %8 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %7
  %9 = load i8, i8* %8, align 1
  %10 = sext i8 %9 to i32
  %11 = add nsw i32 %10, %5
  %12 = lshr i64 %0, 8
  %13 = and i64 %12, 15
  %14 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %13
  %15 = load i8, i8* %14, align 1
  %16 = sext i8 %15 to i32
  %17 = add nsw i32 %11, %16
  %18 = lshr i64 %0, 12
  %19 = and i64 %18, 15
  %20 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %19
  %21 = load i8, i8* %20, align 1
  %22 = sext i8 %21 to i32
  %23 = add nsw i32 %17, %22
  %24 = lshr i64 %0, 16
  %25 = and i64 %24, 15
  %26 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %25
  %27 = load i8, i8* %26, align 1
  %28 = sext i8 %27 to i32
  %29 = add nsw i32 %23, %28
  %30 = lshr i64 %0, 20
  %31 = and i64 %30, 15
  %32 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %31
  %33 = load i8, i8* %32, align 1
  %34 = sext i8 %33 to i32
  %35 = add nsw i32 %29, %34
  %36 = lshr i64 %0, 24
  %37 = and i64 %36, 15
  %38 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %37
  %39 = load i8, i8* %38, align 1
  %40 = sext i8 %39 to i32
  %41 = add nsw i32 %35, %40
  %42 = lshr i64 %0, 28
  %43 = and i64 %42, 15
  %44 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %43
  %45 = load i8, i8* %44, align 1
  %46 = sext i8 %45 to i32
  %47 = add nsw i32 %41, %46
  ret i32 %47
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @BW_btbl_bitcount(i64) local_unnamed_addr #0 {
  %.sroa.2.0.extract.shift = lshr i64 %0, 8
  %.sroa.3.0.extract.shift = lshr i64 %0, 16
  %.sroa.4.0.extract.shift = lshr i64 %0, 24
  %2 = and i64 %0, 255
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %2
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = and i64 %.sroa.2.0.extract.shift, 255
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = add nsw i32 %9, %5
  %11 = and i64 %.sroa.4.0.extract.shift, 255
  %12 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %10, %14
  %16 = and i64 %.sroa.3.0.extract.shift, 255
  %17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = add nsw i32 %15, %19
  ret i32 %20
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i32 @AR_btbl_bitcount(i64) local_unnamed_addr #0 {
  %.sroa.2.0.extract.shift = lshr i64 %0, 8
  %.sroa.3.0.extract.shift = lshr i64 %0, 16
  %.sroa.4.0.extract.shift = lshr i64 %0, 24
  %2 = and i64 %0, 255
  %3 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %2
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = and i64 %.sroa.2.0.extract.shift, 255
  %7 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %6
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = add nsw i32 %9, %5
  %11 = and i64 %.sroa.3.0.extract.shift, 255
  %12 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %11
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = add nsw i32 %10, %14
  %16 = and i64 %.sroa.4.0.extract.shift, 255
  %17 = getelementptr inbounds [256 x i8], [256 x i8]* @bits, i64 0, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = add nsw i32 %15, %19
  ret i32 %20
}

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

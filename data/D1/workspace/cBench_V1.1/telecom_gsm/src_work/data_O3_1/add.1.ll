; ModuleID = 'add.ll'
source_filename = "add.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [31 x i8] c"a != MIN_WORD || b != MIN_WORD\00", align 1
@.str.1 = private unnamed_addr constant [6 x i8] c"add.c\00", align 1
@__PRETTY_FUNCTION__.gsm_L_mult = private unnamed_addr constant [32 x i8] c"longword gsm_L_mult(word, word)\00", align 1
@.str.2 = private unnamed_addr constant [7 x i8] c"a != 0\00", align 1
@__PRETTY_FUNCTION__.gsm_norm = private unnamed_addr constant [24 x i8] c"word gsm_norm(longword)\00", align 1
@bitoff = internal unnamed_addr constant [256 x i8] c"\08\07\06\06\05\05\05\05\04\04\04\04\04\04\04\04\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\03\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\02\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\01\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00\00", align 16
@.str.3 = private unnamed_addr constant [25 x i8] c"num >= 0 && denum >= num\00", align 1
@__PRETTY_FUNCTION__.gsm_div = private unnamed_addr constant [25 x i8] c"word gsm_div(word, word)\00", align 1

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_add(i16 signext, i16 signext) local_unnamed_addr #0 {
  %3 = sext i16 %0 to i64
  %4 = sext i16 %1 to i64
  %5 = add nsw i64 %4, %3
  %6 = icmp slt i64 %5, -32768
  %7 = icmp slt i64 %5, 32767
  %. = select i1 %7, i64 %5, i64 32767
  %8 = trunc i64 %. to i16
  %9 = select i1 %6, i16 -32768, i16 %8
  ret i16 %9
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_sub(i16 signext, i16 signext) local_unnamed_addr #0 {
  %3 = sext i16 %0 to i64
  %4 = sext i16 %1 to i64
  %5 = sub nsw i64 %3, %4
  %6 = icmp slt i64 %5, -32768
  %7 = icmp slt i64 %5, 32767
  %. = select i1 %7, i64 %5, i64 32767
  %8 = trunc i64 %. to i16
  %9 = select i1 %6, i16 -32768, i16 %8
  ret i16 %9
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_mult(i16 signext, i16 signext) local_unnamed_addr #0 {
  %3 = icmp eq i16 %0, -32768
  %4 = icmp eq i16 %1, -32768
  %or.cond = and i1 %3, %4
  %5 = sext i16 %0 to i64
  %6 = sext i16 %1 to i64
  %7 = mul nsw i64 %6, %5
  %8 = lshr i64 %7, 15
  %9 = trunc i64 %8 to i16
  %.0 = select i1 %or.cond, i16 32767, i16 %9
  ret i16 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_mult_r(i16 signext, i16 signext) local_unnamed_addr #0 {
  %3 = icmp eq i16 %1, -32768
  %4 = icmp eq i16 %0, -32768
  %or.cond = and i1 %4, %3
  %5 = sext i16 %0 to i64
  %6 = sext i16 %1 to i64
  %7 = mul nsw i64 %6, %5
  %8 = add nsw i64 %7, 16384
  %9 = lshr i64 %8, 15
  %10 = trunc i64 %9 to i16
  %.0 = select i1 %or.cond, i16 32767, i16 %10
  ret i16 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_abs(i16 signext) local_unnamed_addr #0 {
  %2 = icmp slt i16 %0, 0
  %3 = icmp eq i16 %0, -32768
  %4 = sub i16 0, %0
  %5 = select i1 %3, i16 32767, i16 %4
  %. = select i1 %2, i16 %5, i16 %0
  ret i16 %.
}

; Function Attrs: noinline nounwind uwtable
define i64 @gsm_L_mult(i16 signext, i16 signext) local_unnamed_addr #1 {
  %3 = icmp eq i16 %0, -32768
  %4 = icmp eq i16 %1, -32768
  %or.cond = and i1 %3, %4
  br i1 %or.cond, label %5, label %6

; <label>:5:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([31 x i8], [31 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 58, i8* getelementptr inbounds ([32 x i8], [32 x i8]* @__PRETTY_FUNCTION__.gsm_L_mult, i64 0, i64 0)) #3
  unreachable

; <label>:6:                                      ; preds = %2
  %7 = sext i16 %0 to i64
  %8 = sext i16 %1 to i64
  %9 = shl nsw i64 %7, 1
  %10 = mul nsw i64 %9, %8
  ret i64 %10
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @gsm_L_add(i64, i64) local_unnamed_addr #0 {
  %3 = icmp slt i64 %0, 0
  br i1 %3, label %4, label %15

; <label>:4:                                      ; preds = %2
  %5 = icmp sgt i64 %1, -1
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = add nsw i64 %1, %0
  br label %20

; <label>:8:                                      ; preds = %4
  %9 = xor i64 %0, -1
  %10 = xor i64 %1, -1
  %11 = add i64 %10, %9
  %12 = icmp ugt i64 %11, 2147483646
  %13 = sub i64 -2, %11
  %14 = select i1 %12, i64 -2147483648, i64 %13
  br label %20

; <label>:15:                                     ; preds = %2
  %16 = icmp slt i64 %1, 1
  %17 = add i64 %1, %0
  %18 = icmp ult i64 %17, 2147483647
  %19 = or i1 %16, %18
  %.. = select i1 %19, i64 %17, i64 2147483647
  ret i64 %..

; <label>:20:                                     ; preds = %8, %6
  %.0 = phi i64 [ %7, %6 ], [ %14, %8 ]
  ret i64 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @gsm_L_sub(i64, i64) local_unnamed_addr #0 {
  %3 = icmp sgt i64 %0, -1
  br i1 %3, label %4, label %14

; <label>:4:                                      ; preds = %2
  %5 = icmp sgt i64 %1, -1
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = sub nsw i64 %0, %1
  br label %24

; <label>:8:                                      ; preds = %4
  %9 = xor i64 %1, -1
  %10 = add i64 %9, %0
  %11 = icmp ugt i64 %10, 2147483646
  %12 = add i64 %10, 1
  %13 = select i1 %11, i64 2147483647, i64 %12
  br label %24

; <label>:14:                                     ; preds = %2
  %15 = icmp slt i64 %1, 1
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %14
  %17 = sub nsw i64 %0, %1
  br label %24

; <label>:18:                                     ; preds = %14
  %19 = xor i64 %0, -1
  %20 = add i64 %1, %19
  %21 = icmp ugt i64 %20, 2147483646
  %22 = xor i64 %20, -1
  %23 = select i1 %21, i64 -2147483648, i64 %22
  br label %24

; <label>:24:                                     ; preds = %18, %8, %16, %6
  %.0 = phi i64 [ %7, %6 ], [ %17, %16 ], [ %13, %8 ], [ %23, %18 ]
  ret i64 %.0
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_norm(i64) local_unnamed_addr #1 {
  %2 = icmp eq i64 %0, 0
  br i1 %2, label %3, label %4

; <label>:3:                                      ; preds = %1
  tail call void @__assert_fail(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 137, i8* getelementptr inbounds ([24 x i8], [24 x i8]* @__PRETTY_FUNCTION__.gsm_norm, i64 0, i64 0)) #3
  unreachable

; <label>:4:                                      ; preds = %1
  %5 = icmp slt i64 %0, 0
  br i1 %5, label %6, label %10

; <label>:6:                                      ; preds = %4
  %7 = icmp slt i64 %0, -1073741823
  br i1 %7, label %27, label %8

; <label>:8:                                      ; preds = %6
  %9 = xor i64 %0, -1
  br label %10

; <label>:10:                                     ; preds = %8, %4
  %.01 = phi i64 [ %9, %8 ], [ %0, %4 ]
  %11 = and i64 %.01, 4294901760
  %12 = icmp eq i64 %11, 0
  br i1 %12, label %17, label %13

; <label>:13:                                     ; preds = %10
  %14 = and i64 %.01, 4278190080
  %15 = icmp eq i64 %14, 0
  %.sink5 = select i1 %15, i64 16, i64 24
  %.sink2 = select i1 %15, i16 7, i16 -1
  %16 = lshr i64 %.01, %.sink5
  br label %21

; <label>:17:                                     ; preds = %10
  %18 = and i64 %.01, 65280
  %19 = icmp eq i64 %18, 0
  %20 = lshr i64 %.01, 8
  %.01.sink = select i1 %19, i64 %.01, i64 %20
  %.sink6 = select i1 %19, i16 23, i16 15
  br label %21

; <label>:21:                                     ; preds = %17, %13
  %.01.sink.sink = phi i64 [ %.01.sink, %17 ], [ %16, %13 ]
  %.sink6.sink = phi i16 [ %.sink6, %17 ], [ %.sink2, %13 ]
  %22 = and i64 %.01.sink.sink, 255
  %23 = getelementptr inbounds [256 x i8], [256 x i8]* @bitoff, i64 0, i64 %22
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i16
  %26 = add nsw i16 %25, %.sink6.sink
  br label %27

; <label>:27:                                     ; preds = %6, %21
  %.0 = phi i16 [ %26, %21 ], [ 0, %6 ]
  ret i16 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @gsm_L_asl(i64, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 31
  br i1 %3, label %16, label %4

; <label>:4:                                      ; preds = %2
  %5 = icmp slt i32 %1, -31
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = ashr i64 %0, 63
  br label %16

; <label>:8:                                      ; preds = %4
  %9 = icmp slt i32 %1, 0
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %8
  %11 = sub nsw i32 0, %1
  %12 = tail call i64 @gsm_L_asr(i64 %0, i32 %11)
  br label %16

; <label>:13:                                     ; preds = %8
  %14 = zext i32 %1 to i64
  %15 = shl i64 %0, %14
  br label %16

; <label>:16:                                     ; preds = %2, %13, %10, %6
  %.0 = phi i64 [ %7, %6 ], [ %12, %10 ], [ %15, %13 ], [ 0, %2 ]
  ret i64 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define i64 @gsm_L_asr(i64, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 31
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = ashr i64 %0, 63
  br label %17

; <label>:6:                                      ; preds = %2
  %7 = icmp slt i32 %1, -31
  br i1 %7, label %17, label %8

; <label>:8:                                      ; preds = %6
  %9 = icmp slt i32 %1, 0
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %8
  %11 = sub nsw i32 0, %1
  %12 = zext i32 %11 to i64
  %13 = shl i64 %0, %12
  br label %17

; <label>:14:                                     ; preds = %8
  %15 = zext i32 %1 to i64
  %16 = ashr i64 %0, %15
  br label %17

; <label>:17:                                     ; preds = %6, %14, %10, %4
  %.0 = phi i64 [ %5, %4 ], [ %13, %10 ], [ %16, %14 ], [ 0, %6 ]
  ret i64 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_asl(i16 signext, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 15
  br i1 %3, label %17, label %4

; <label>:4:                                      ; preds = %2
  %5 = icmp slt i32 %1, -15
  br i1 %5, label %6, label %8

; <label>:6:                                      ; preds = %4
  %7 = ashr i16 %0, 15
  br label %17

; <label>:8:                                      ; preds = %4
  %9 = icmp slt i32 %1, 0
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %8
  %11 = sub nsw i32 0, %1
  %12 = tail call signext i16 @gsm_asr(i16 signext %0, i32 %11)
  br label %17

; <label>:13:                                     ; preds = %8
  %14 = sext i16 %0 to i32
  %15 = shl i32 %14, %1
  %16 = trunc i32 %15 to i16
  br label %17

; <label>:17:                                     ; preds = %2, %13, %10, %6
  %.0 = phi i16 [ %7, %6 ], [ %12, %10 ], [ %16, %13 ], [ 0, %2 ]
  ret i16 %.0
}

; Function Attrs: noinline norecurse nounwind readnone uwtable
define signext i16 @gsm_asr(i16 signext, i32) local_unnamed_addr #0 {
  %3 = icmp sgt i32 %1, 15
  br i1 %3, label %4, label %6

; <label>:4:                                      ; preds = %2
  %5 = ashr i16 %0, 15
  br label %18

; <label>:6:                                      ; preds = %2
  %7 = icmp slt i32 %1, -15
  br i1 %7, label %18, label %8

; <label>:8:                                      ; preds = %6
  %9 = icmp slt i32 %1, 0
  %10 = sext i16 %0 to i32
  br i1 %9, label %11, label %15

; <label>:11:                                     ; preds = %8
  %12 = sub nsw i32 0, %1
  %13 = shl i32 %10, %12
  %14 = trunc i32 %13 to i16
  br label %18

; <label>:15:                                     ; preds = %8
  %16 = ashr i32 %10, %1
  %17 = trunc i32 %16 to i16
  br label %18

; <label>:18:                                     ; preds = %6, %15, %11, %4
  %.0 = phi i16 [ %5, %4 ], [ %14, %11 ], [ %17, %15 ], [ 0, %6 ]
  ret i16 %.0
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @gsm_div(i16 signext, i16 signext) local_unnamed_addr #1 {
  %3 = sext i16 %1 to i64
  %4 = icmp slt i16 %0, 0
  %5 = icmp slt i16 %1, %0
  %or.cond = or i1 %4, %5
  br i1 %or.cond, label %6, label %7

; <label>:6:                                      ; preds = %2
  tail call void @__assert_fail(i8* getelementptr inbounds ([25 x i8], [25 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([6 x i8], [6 x i8]* @.str.1, i64 0, i64 0), i32 220, i8* getelementptr inbounds ([25 x i8], [25 x i8]* @__PRETTY_FUNCTION__.gsm_div, i64 0, i64 0)) #3
  unreachable

; <label>:7:                                      ; preds = %2
  %8 = icmp eq i16 %0, 0
  br i1 %8, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %7
  %9 = sext i16 %0 to i64
  %10 = shl nsw i64 %9, 1
  %11 = icmp slt i64 %10, %3
  %12 = select i1 %11, i64 0, i64 %3
  %.14 = sub nsw i64 %10, %12
  %not. = xor i1 %11, true
  %13 = zext i1 %not. to i16
  %14 = shl nuw nsw i16 %13, 1
  %15 = shl nsw i64 %.14, 1
  %16 = icmp slt i64 %15, %3
  %17 = select i1 %16, i64 0, i64 %3
  %.14.1 = sub nsw i64 %15, %17
  %not..1 = xor i1 %16, true
  %18 = zext i1 %not..1 to i16
  %.1.1 = or i16 %18, %14
  %19 = shl nuw nsw i16 %.1.1, 1
  %20 = shl nsw i64 %.14.1, 1
  %21 = icmp slt i64 %20, %3
  %22 = select i1 %21, i64 0, i64 %3
  %.14.2 = sub nsw i64 %20, %22
  %not..2 = xor i1 %21, true
  %23 = zext i1 %not..2 to i16
  %.1.2 = or i16 %23, %19
  %24 = shl nuw nsw i16 %.1.2, 1
  %25 = shl i64 %.14.2, 1
  %26 = icmp slt i64 %25, %3
  %27 = select i1 %26, i64 0, i64 %3
  %.14.3 = sub nsw i64 %25, %27
  %not..3 = xor i1 %26, true
  %28 = zext i1 %not..3 to i16
  %.1.3 = or i16 %28, %24
  %29 = shl i16 %.1.3, 1
  %30 = shl i64 %.14.3, 1
  %31 = icmp slt i64 %30, %3
  %32 = select i1 %31, i64 0, i64 %3
  %.14.4 = sub nsw i64 %30, %32
  %not..4 = xor i1 %31, true
  %33 = zext i1 %not..4 to i16
  %.1.4 = or i16 %33, %29
  %34 = shl i16 %.1.4, 1
  %35 = shl i64 %.14.4, 1
  %36 = icmp slt i64 %35, %3
  %37 = select i1 %36, i64 0, i64 %3
  %.14.5 = sub nsw i64 %35, %37
  %not..5 = xor i1 %36, true
  %38 = zext i1 %not..5 to i16
  %.1.5 = or i16 %38, %34
  %39 = shl i16 %.1.5, 1
  %40 = shl i64 %.14.5, 1
  %41 = icmp slt i64 %40, %3
  %42 = select i1 %41, i64 0, i64 %3
  %.14.6 = sub nsw i64 %40, %42
  %not..6 = xor i1 %41, true
  %43 = zext i1 %not..6 to i16
  %.1.6 = or i16 %43, %39
  %44 = shl i16 %.1.6, 1
  %45 = shl i64 %.14.6, 1
  %46 = icmp slt i64 %45, %3
  %47 = select i1 %46, i64 0, i64 %3
  %.14.7 = sub nsw i64 %45, %47
  %not..7 = xor i1 %46, true
  %48 = zext i1 %not..7 to i16
  %.1.7 = or i16 %48, %44
  %49 = shl i16 %.1.7, 1
  %50 = shl i64 %.14.7, 1
  %51 = icmp slt i64 %50, %3
  %52 = select i1 %51, i64 0, i64 %3
  %.14.8 = sub nsw i64 %50, %52
  %not..8 = xor i1 %51, true
  %53 = zext i1 %not..8 to i16
  %.1.8 = or i16 %53, %49
  %54 = shl i16 %.1.8, 1
  %55 = shl i64 %.14.8, 1
  %56 = icmp slt i64 %55, %3
  %57 = select i1 %56, i64 0, i64 %3
  %.14.9 = sub nsw i64 %55, %57
  %not..9 = xor i1 %56, true
  %58 = zext i1 %not..9 to i16
  %.1.9 = or i16 %58, %54
  %59 = shl i16 %.1.9, 1
  %60 = shl i64 %.14.9, 1
  %61 = icmp slt i64 %60, %3
  %62 = select i1 %61, i64 0, i64 %3
  %.14.10 = sub nsw i64 %60, %62
  %not..10 = xor i1 %61, true
  %63 = zext i1 %not..10 to i16
  %.1.10 = or i16 %63, %59
  %64 = shl i16 %.1.10, 1
  %65 = shl i64 %.14.10, 1
  %66 = icmp slt i64 %65, %3
  %67 = select i1 %66, i64 0, i64 %3
  %.14.11 = sub nsw i64 %65, %67
  %not..11 = xor i1 %66, true
  %68 = zext i1 %not..11 to i16
  %.1.11 = or i16 %68, %64
  %69 = shl i16 %.1.11, 1
  %70 = shl i64 %.14.11, 1
  %71 = icmp slt i64 %70, %3
  %72 = select i1 %71, i64 0, i64 %3
  %.14.12 = sub nsw i64 %70, %72
  %not..12 = xor i1 %71, true
  %73 = zext i1 %not..12 to i16
  %.1.12 = or i16 %73, %69
  %74 = shl i16 %.1.12, 1
  %75 = shl i64 %.14.12, 1
  %76 = icmp slt i64 %75, %3
  %77 = select i1 %76, i64 0, i64 %3
  %.14.13 = sub nsw i64 %75, %77
  %not..13 = xor i1 %76, true
  %78 = zext i1 %not..13 to i16
  %.1.13 = or i16 %78, %74
  %79 = shl i16 %.1.13, 1
  %80 = shl i64 %.14.13, 1
  %not..14 = icmp sge i64 %80, %3
  %81 = zext i1 %not..14 to i16
  %.1.14 = or i16 %81, %79
  br label %.loopexit

.loopexit:                                        ; preds = %.preheader, %7
  %.0 = phi i16 [ 0, %7 ], [ %.1.14, %.preheader ]
  ret i16 %.0
}

attributes #0 = { noinline norecurse nounwind readnone uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

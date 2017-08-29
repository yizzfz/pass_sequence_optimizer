; ModuleID = 'ieeefloat.ll'
source_filename = "ieeefloat.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

; Function Attrs: noinline nounwind uwtable
define double @ConvertFromIeeeSingle(i8* nocapture readonly) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1
  %3 = zext i8 %2 to i64
  %4 = shl nuw nsw i64 %3, 24
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = zext i8 %6 to i64
  %8 = shl nuw nsw i64 %7, 16
  %9 = or i64 %8, %4
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 8
  %14 = or i64 %9, %13
  %15 = getelementptr inbounds i8, i8* %0, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i64
  %18 = or i64 %14, %17
  %19 = and i64 %18, 2147483647
  %20 = icmp eq i64 %19, 0
  br i1 %20, label %34, label %21

; <label>:21:                                     ; preds = %1
  %22 = lshr i64 %9, 23
  %23 = and i64 %22, 255
  %trunc = trunc i64 %22 to i8
  switch i8 %trunc, label %26 [
    i8 -1, label %34
    i8 0, label %24
  ]

; <label>:24:                                     ; preds = %21
  %25 = and i64 %18, 8388607
  br label %29

; <label>:26:                                     ; preds = %21
  %27 = and i64 %18, 8388607
  %28 = or i64 %27, 8388608
  br label %29

; <label>:29:                                     ; preds = %26, %24
  %.sink5 = phi i64 [ %28, %26 ], [ %25, %24 ]
  %.sink4 = phi i64 [ 4294967146, %26 ], [ 4294967147, %24 ]
  %30 = sitofp i64 %.sink5 to double
  %31 = add nuw nsw i64 %.sink4, %23
  %32 = trunc i64 %31 to i32
  %33 = tail call double @ldexp(double %30, i32 %32) #3
  br label %34

; <label>:34:                                     ; preds = %29, %21, %1
  %.2 = phi double [ 0.000000e+00, %1 ], [ %33, %29 ], [ 0x7FF0000000000000, %21 ]
  ret double %.2
}

; Function Attrs: nounwind
declare double @ldexp(double, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define void @ConvertToIeeeSingle(double, i8* nocapture) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = fcmp olt double %0, 0.000000e+00
  %5 = fsub double -0.000000e+00, %0
  %.01 = select i1 %4, i64 -9223372036854775808, i64 0
  %.0 = select i1 %4, double %5, double %0
  %6 = fcmp oeq double %.0, 0.000000e+00
  br i1 %6, label %35, label %7

; <label>:7:                                      ; preds = %2
  %8 = call double @frexp(double %.0, i32* nonnull %3) #3
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %9, 130
  %11 = fcmp olt double %8, 1.000000e+00
  %or.cond = and i1 %11, %10
  br i1 %or.cond, label %14, label %12

; <label>:12:                                     ; preds = %7
  %13 = or i64 %.01, 2139095040
  br label %35

; <label>:14:                                     ; preds = %7
  %15 = icmp slt i32 %9, -125
  br i1 %15, label %16, label %25

; <label>:16:                                     ; preds = %14
  %17 = icmp slt i32 %9, -149
  %18 = add nsw i32 %9, 149
  %19 = zext i32 %18 to i64
  %20 = shl i64 1, %19
  %21 = sitofp i64 %20 to double
  %22 = fmul double %8, %21
  %23 = fptosi double %22 to i64
  %24 = select i1 %17, i64 0, i64 %23
  %.01. = or i64 %24, %.01
  br label %35

; <label>:25:                                     ; preds = %14
  %26 = fmul double %8, 0x4170000000000000
  %27 = tail call double @floor(double %26) #4
  %28 = fptosi double %27 to i64
  %29 = add nsw i64 %28, -8388608
  %30 = add nsw i32 %9, 126
  %31 = sext i32 %30 to i64
  %32 = shl nsw i64 %31, 23
  %33 = or i64 %32, %.01
  %34 = or i64 %33, %29
  br label %35

; <label>:35:                                     ; preds = %16, %12, %25, %2
  %.3 = phi i64 [ 0, %2 ], [ %13, %12 ], [ %34, %25 ], [ %.01., %16 ]
  %36 = lshr i64 %.3, 24
  %37 = trunc i64 %36 to i8
  store i8 %37, i8* %1, align 1
  %38 = lshr i64 %.3, 16
  %39 = trunc i64 %38 to i8
  %40 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %39, i8* %40, align 1
  %41 = lshr i64 %.3, 8
  %42 = trunc i64 %41 to i8
  %43 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %42, i8* %43, align 1
  %44 = trunc i64 %.3 to i8
  %45 = getelementptr inbounds i8, i8* %1, i64 3
  store i8 %44, i8* %45, align 1
  ret void
}

; Function Attrs: nounwind
declare double @frexp(double, i32* nocapture) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define double @ConvertFromIeeeDouble(i8* nocapture readonly) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1
  %3 = zext i8 %2 to i64
  %4 = shl nuw nsw i64 %3, 24
  %5 = getelementptr inbounds i8, i8* %0, i64 1
  %6 = load i8, i8* %5, align 1
  %7 = zext i8 %6 to i64
  %8 = shl nuw nsw i64 %7, 16
  %9 = or i64 %8, %4
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 8
  %14 = or i64 %9, %13
  %15 = getelementptr inbounds i8, i8* %0, i64 3
  %16 = load i8, i8* %15, align 1
  %17 = zext i8 %16 to i64
  %18 = or i64 %14, %17
  %19 = getelementptr inbounds i8, i8* %0, i64 4
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i64
  %22 = shl nuw nsw i64 %21, 24
  %23 = getelementptr inbounds i8, i8* %0, i64 5
  %24 = load i8, i8* %23, align 1
  %25 = zext i8 %24 to i64
  %26 = shl nuw nsw i64 %25, 16
  %27 = or i64 %26, %22
  %28 = getelementptr inbounds i8, i8* %0, i64 6
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i64
  %31 = shl nuw nsw i64 %30, 8
  %32 = or i64 %27, %31
  %33 = getelementptr inbounds i8, i8* %0, i64 7
  %34 = load i8, i8* %33, align 1
  %35 = zext i8 %34 to i64
  %36 = or i64 %32, %35
  %37 = or i64 %36, %18
  %38 = icmp eq i64 %37, 0
  br i1 %38, label %57, label %39

; <label>:39:                                     ; preds = %1
  %40 = lshr i64 %9, 20
  %41 = and i64 %40, 2047
  %trunc = trunc i64 %40 to i11
  switch i11 %trunc, label %44 [
    i11 -1, label %57
    i11 0, label %42
  ]

; <label>:42:                                     ; preds = %39
  %43 = and i64 %18, 1048575
  br label %47

; <label>:44:                                     ; preds = %39
  %45 = and i64 %18, 1048575
  %46 = or i64 %45, 1048576
  br label %47

; <label>:47:                                     ; preds = %44, %42
  %.sink = phi i64 [ %46, %44 ], [ %43, %42 ]
  %.sink9 = phi i64 [ 4294966253, %44 ], [ 4294966254, %42 ]
  %.sink6 = phi i64 [ 4294966221, %44 ], [ 4294966222, %42 ]
  %48 = sitofp i64 %.sink to double
  %49 = add nuw nsw i64 %.sink9, %41
  %50 = trunc i64 %49 to i32
  %51 = tail call double @ldexp(double %48, i32 %50) #3
  %52 = sitofp i64 %36 to double
  %53 = add nuw nsw i64 %.sink6, %41
  %54 = trunc i64 %53 to i32
  %55 = tail call double @ldexp(double %52, i32 %54) #3
  %56 = fadd double %51, %55
  br label %57

; <label>:57:                                     ; preds = %47, %39, %1
  %.2 = phi double [ 0.000000e+00, %1 ], [ %56, %47 ], [ 0x7FF0000000000000, %39 ]
  %58 = trunc i64 %4 to i32
  %59 = icmp slt i32 %58, 0
  %60 = fsub double -0.000000e+00, %.2
  %.0 = select i1 %59, double %60, double %.2
  ret double %.0
}

; Function Attrs: noinline nounwind uwtable
define void @ConvertToIeeeDouble(double, i8* nocapture) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = fcmp olt double %0, 0.000000e+00
  %5 = fsub double -0.000000e+00, %0
  %.01 = select i1 %4, i64 -9223372036854775808, i64 0
  %.0 = select i1 %4, double %5, double %0
  %6 = fcmp oeq double %.0, 0.000000e+00
  br i1 %6, label %51, label %7

; <label>:7:                                      ; preds = %2
  %8 = call double @frexp(double %.0, i32* nonnull %3) #3
  %9 = load i32, i32* %3, align 4
  %10 = icmp slt i32 %9, 1026
  %11 = fcmp olt double %8, 1.000000e+00
  %or.cond = and i1 %11, %10
  br i1 %or.cond, label %14, label %12

; <label>:12:                                     ; preds = %7
  %13 = or i64 %.01, 2146435072
  br label %51

; <label>:14:                                     ; preds = %7
  %15 = icmp slt i32 %9, -1021
  br i1 %15, label %16, label %32

; <label>:16:                                     ; preds = %14
  %17 = icmp slt i32 %9, -1042
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %16
  %19 = icmp slt i32 %9, -1074
  br i1 %19, label %51, label %20

; <label>:20:                                     ; preds = %18
  %21 = add nsw i32 %9, 1074
  %22 = tail call double @ldexp(double %8, i32 %21) #3
  br label %.sink.split9

; <label>:23:                                     ; preds = %16
  %24 = add nsw i32 %9, 1042
  %25 = tail call double @ldexp(double %8, i32 %24) #3
  %26 = tail call double @floor(double %25) #4
  %27 = fptosi double %26 to i64
  %28 = or i64 %27, %.01
  %29 = sitofp i64 %27 to double
  %30 = fsub double %25, %29
  %31 = tail call double @ldexp(double %30, i32 32) #3
  br label %.sink.split9

; <label>:32:                                     ; preds = %14
  %33 = tail call double @ldexp(double %8, i32 21) #3
  %34 = tail call double @floor(double %33) #4
  %35 = fptosi double %34 to i64
  %36 = add nsw i64 %35, -1048576
  %37 = fadd double %33, -1.048576e+06
  %38 = load i32, i32* %3, align 4
  %39 = add nsw i32 %38, 1022
  %40 = sext i32 %39 to i64
  %41 = shl nsw i64 %40, 20
  %42 = or i64 %36, %.01
  %43 = or i64 %42, %41
  %44 = sitofp i64 %36 to double
  %45 = fsub double %37, %44
  %46 = tail call double @ldexp(double %45, i32 32) #3
  br label %.sink.split9

.sink.split9:                                     ; preds = %20, %23, %32
  %.sink8.sink = phi double [ %46, %32 ], [ %22, %20 ], [ %31, %23 ]
  %.1.ph = phi i64 [ %43, %32 ], [ %.01, %20 ], [ %28, %23 ]
  %47 = tail call double @floor(double %.sink8.sink) #4
  %48 = fadd double %47, 0xC1E0000000000000
  %49 = fptosi double %48 to i64
  %50 = add nsw i64 %49, 2147483648
  br label %51

; <label>:51:                                     ; preds = %12, %.sink.split9, %18, %2
  %.4 = phi i64 [ 0, %2 ], [ 0, %12 ], [ 0, %18 ], [ %50, %.sink.split9 ]
  %.3 = phi i64 [ 0, %2 ], [ %13, %12 ], [ %.01, %18 ], [ %.1.ph, %.sink.split9 ]
  %52 = lshr i64 %.3, 24
  %53 = trunc i64 %52 to i8
  store i8 %53, i8* %1, align 1
  %54 = lshr i64 %.3, 16
  %55 = trunc i64 %54 to i8
  %56 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %55, i8* %56, align 1
  %57 = lshr i64 %.3, 8
  %58 = trunc i64 %57 to i8
  %59 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %58, i8* %59, align 1
  %60 = trunc i64 %.3 to i8
  %61 = getelementptr inbounds i8, i8* %1, i64 3
  store i8 %60, i8* %61, align 1
  %62 = lshr i64 %.4, 24
  %63 = trunc i64 %62 to i8
  %64 = getelementptr inbounds i8, i8* %1, i64 4
  store i8 %63, i8* %64, align 1
  %65 = lshr i64 %.4, 16
  %66 = trunc i64 %65 to i8
  %67 = getelementptr inbounds i8, i8* %1, i64 5
  store i8 %66, i8* %67, align 1
  %68 = lshr i64 %.4, 8
  %69 = trunc i64 %68 to i8
  %70 = getelementptr inbounds i8, i8* %1, i64 6
  store i8 %69, i8* %70, align 1
  %71 = trunc i64 %.4 to i8
  %72 = getelementptr inbounds i8, i8* %1, i64 7
  store i8 %71, i8* %72, align 1
  ret void
}

; Function Attrs: noinline nounwind uwtable
define double @ConvertFromIeeeExtended(i8* nocapture readonly) local_unnamed_addr #0 {
  %2 = load i8, i8* %0, align 1
  %3 = and i8 %2, 127
  %4 = zext i8 %3 to i64
  %5 = shl nuw nsw i64 %4, 8
  %6 = getelementptr inbounds i8, i8* %0, i64 1
  %7 = load i8, i8* %6, align 1
  %8 = zext i8 %7 to i64
  %9 = or i64 %5, %8
  %10 = getelementptr inbounds i8, i8* %0, i64 2
  %11 = load i8, i8* %10, align 1
  %12 = zext i8 %11 to i64
  %13 = shl nuw nsw i64 %12, 24
  %14 = getelementptr inbounds i8, i8* %0, i64 3
  %15 = load i8, i8* %14, align 1
  %16 = zext i8 %15 to i64
  %17 = shl nuw nsw i64 %16, 16
  %18 = or i64 %17, %13
  %19 = getelementptr inbounds i8, i8* %0, i64 4
  %20 = load i8, i8* %19, align 1
  %21 = zext i8 %20 to i64
  %22 = shl nuw nsw i64 %21, 8
  %23 = or i64 %18, %22
  %24 = getelementptr inbounds i8, i8* %0, i64 5
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i64
  %27 = or i64 %23, %26
  %28 = getelementptr inbounds i8, i8* %0, i64 6
  %29 = load i8, i8* %28, align 1
  %30 = zext i8 %29 to i64
  %31 = shl nuw nsw i64 %30, 24
  %32 = getelementptr inbounds i8, i8* %0, i64 7
  %33 = load i8, i8* %32, align 1
  %34 = zext i8 %33 to i64
  %35 = shl nuw nsw i64 %34, 16
  %36 = or i64 %35, %31
  %37 = getelementptr inbounds i8, i8* %0, i64 8
  %38 = load i8, i8* %37, align 1
  %39 = zext i8 %38 to i64
  %40 = shl nuw nsw i64 %39, 8
  %41 = or i64 %36, %40
  %42 = getelementptr inbounds i8, i8* %0, i64 9
  %43 = load i8, i8* %42, align 1
  %44 = zext i8 %43 to i64
  %45 = or i64 %41, %44
  %46 = or i64 %27, %9
  %47 = or i64 %46, %45
  %48 = icmp eq i64 %47, 0
  br i1 %48, label %61, label %49

; <label>:49:                                     ; preds = %1
  %50 = icmp eq i64 %9, 32767
  br i1 %50, label %61, label %51

; <label>:51:                                     ; preds = %49
  %52 = sitofp i64 %27 to double
  %53 = add nuw nsw i64 %9, 4294950882
  %54 = trunc i64 %53 to i32
  %55 = tail call double @ldexp(double %52, i32 %54) #3
  %56 = sitofp i64 %45 to double
  %57 = add nuw nsw i64 %9, 4294950850
  %58 = trunc i64 %57 to i32
  %59 = tail call double @ldexp(double %56, i32 %58) #3
  %60 = fadd double %55, %59
  br label %61

; <label>:61:                                     ; preds = %51, %49, %1
  %.1 = phi double [ 0.000000e+00, %1 ], [ %60, %51 ], [ 0x7FF0000000000000, %49 ]
  %62 = load i8, i8* %0, align 1
  %63 = icmp slt i8 %62, 0
  %64 = fsub double -0.000000e+00, %.1
  %.0 = select i1 %63, double %64, double %.1
  ret double %.0
}

; Function Attrs: noinline nounwind uwtable
define void @ConvertToIeeeExtended(double, i8* nocapture) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = fcmp olt double %0, 0.000000e+00
  %5 = fsub double -0.000000e+00, %0
  %.02 = select i1 %4, i32 32768, i32 0
  %.0 = select i1 %4, double %5, double %0
  %6 = fcmp oeq double %.0, 0.000000e+00
  br i1 %6, label %7, label %8

; <label>:7:                                      ; preds = %2
  store i32 0, i32* %3, align 4
  br label %34

; <label>:8:                                      ; preds = %2
  %9 = call double @frexp(double %.0, i32* nonnull %3) #3
  %10 = load i32, i32* %3, align 4
  %11 = icmp slt i32 %10, 16385
  %12 = fcmp olt double %9, 1.000000e+00
  %or.cond = and i1 %12, %11
  br i1 %or.cond, label %15, label %13

; <label>:13:                                     ; preds = %8
  %14 = or i32 %.02, 32767
  store i32 %14, i32* %3, align 4
  br label %34

; <label>:15:                                     ; preds = %8
  %16 = add nsw i32 %10, 16382
  store i32 %16, i32* %3, align 4
  %17 = icmp slt i32 %10, -16382
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %15
  %19 = tail call double @ldexp(double %9, i32 %16) #3
  store i32 0, i32* %3, align 4
  br label %20

; <label>:20:                                     ; preds = %18, %15
  %.03 = phi double [ %19, %18 ], [ %9, %15 ]
  %21 = load i32, i32* %3, align 4
  %22 = or i32 %21, %.02
  store i32 %22, i32* %3, align 4
  %23 = tail call double @ldexp(double %.03, i32 32) #3
  %24 = tail call double @floor(double %23) #4
  %25 = fadd double %24, 0xC1E0000000000000
  %26 = fptosi double %25 to i64
  %27 = add nsw i64 %26, 2147483648
  %28 = fsub double %23, %24
  %29 = tail call double @ldexp(double %28, i32 32) #3
  %30 = tail call double @floor(double %29) #4
  %31 = fadd double %30, 0xC1E0000000000000
  %32 = fptosi double %31 to i64
  %33 = add nsw i64 %32, 2147483648
  br label %34

; <label>:34:                                     ; preds = %13, %20, %7
  %.15 = phi i64 [ 0, %7 ], [ 0, %13 ], [ %27, %20 ]
  %.1 = phi i64 [ 0, %7 ], [ 0, %13 ], [ %33, %20 ]
  %35 = load i32, i32* %3, align 4
  %36 = lshr i32 %35, 8
  %37 = trunc i32 %36 to i8
  store i8 %37, i8* %1, align 1
  %38 = trunc i32 %35 to i8
  %39 = getelementptr inbounds i8, i8* %1, i64 1
  store i8 %38, i8* %39, align 1
  %40 = lshr i64 %.15, 24
  %41 = trunc i64 %40 to i8
  %42 = getelementptr inbounds i8, i8* %1, i64 2
  store i8 %41, i8* %42, align 1
  %43 = lshr i64 %.15, 16
  %44 = trunc i64 %43 to i8
  %45 = getelementptr inbounds i8, i8* %1, i64 3
  store i8 %44, i8* %45, align 1
  %46 = lshr i64 %.15, 8
  %47 = trunc i64 %46 to i8
  %48 = getelementptr inbounds i8, i8* %1, i64 4
  store i8 %47, i8* %48, align 1
  %49 = trunc i64 %.15 to i8
  %50 = getelementptr inbounds i8, i8* %1, i64 5
  store i8 %49, i8* %50, align 1
  %51 = lshr i64 %.1, 24
  %52 = trunc i64 %51 to i8
  %53 = getelementptr inbounds i8, i8* %1, i64 6
  store i8 %52, i8* %53, align 1
  %54 = lshr i64 %.1, 16
  %55 = trunc i64 %54 to i8
  %56 = getelementptr inbounds i8, i8* %1, i64 7
  store i8 %55, i8* %56, align 1
  %57 = lshr i64 %.1, 8
  %58 = trunc i64 %57 to i8
  %59 = getelementptr inbounds i8, i8* %1, i64 8
  store i8 %58, i8* %59, align 1
  %60 = trunc i64 %.1 to i8
  %61 = getelementptr inbounds i8, i8* %1, i64 9
  store i8 %60, i8* %61, align 1
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'preprocess.ll'
source_filename = "preprocess.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

@.str = private unnamed_addr constant [14 x i8] c"SO >= -0x4000\00", align 1
@.str.1 = private unnamed_addr constant [13 x i8] c"preprocess.c\00", align 1
@__PRETTY_FUNCTION__.Gsm_Preprocess = private unnamed_addr constant [56 x i8] c"void Gsm_Preprocess(struct gsm_state *, word *, word *)\00", align 1
@.str.2 = private unnamed_addr constant [13 x i8] c"SO <= 0x3FFC\00", align 1
@.str.3 = private unnamed_addr constant [15 x i8] c"s1 != MIN_WORD\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Preprocess(%struct.gsm_state* nocapture, i16* nocapture readonly, i16* nocapture) local_unnamed_addr #0 {
  %4 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 1
  %5 = load i16, i16* %4, align 8
  %6 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 2
  %7 = load i64, i64* %6, align 8
  %8 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 3
  %9 = load i32, i32* %8, align 8
  %10 = zext i32 %9 to i64
  br label %11

; <label>:11:                                     ; preds = %3, %58
  %12 = phi i32 [ 159, %3 ], [ %78, %58 ]
  %.0124 = phi i16* [ %1, %3 ], [ %18, %58 ]
  %.0223 = phi i16* [ %2, %3 ], [ %77, %58 ]
  %.0322 = phi i16 [ %5, %3 ], [ %17, %58 ]
  %.0421 = phi i64 [ %7, %3 ], [ %59, %58 ]
  %.0520 = phi i64 [ %10, %3 ], [ %65, %58 ]
  %13 = load i16, i16* %.0124, align 2
  %14 = sext i16 %13 to i32
  %15 = ashr i32 %14, 3
  %16 = shl nsw i32 %15, 2
  %17 = trunc i32 %16 to i16
  %18 = getelementptr inbounds i16, i16* %.0124, i64 1
  %19 = icmp sgt i32 %16, -16385
  br i1 %19, label %21, label %20

; <label>:20:                                     ; preds = %11
  tail call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 64, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i64 0, i64 0)) #2
  unreachable

; <label>:21:                                     ; preds = %11
  %22 = icmp slt i32 %16, 16381
  br i1 %22, label %24, label %23

; <label>:23:                                     ; preds = %21
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 65, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i64 0, i64 0)) #2
  unreachable

; <label>:24:                                     ; preds = %21
  %25 = zext i16 %.0322 to i32
  %26 = sub nsw i32 %16, %25
  %sext.mask = and i32 %26, 65535
  %27 = icmp eq i32 %sext.mask, 32768
  br i1 %27, label %28, label %29

; <label>:28:                                     ; preds = %24
  tail call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.3, i64 0, i64 0), i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str.1, i64 0, i64 0), i32 81, i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__PRETTY_FUNCTION__.Gsm_Preprocess, i64 0, i64 0)) #2
  unreachable

; <label>:29:                                     ; preds = %24
  %30 = zext i32 %26 to i64
  %sext = shl i64 %30, 48
  %31 = ashr exact i64 %sext, 33
  %32 = lshr i64 %.0421, 15
  %33 = and i64 %.0421, 32767
  %34 = mul nuw nsw i64 %33, 32735
  %35 = add nuw nsw i64 %34, 16384
  %36 = lshr i64 %35, 15
  %37 = add nsw i64 %31, %36
  %sext7 = shl i64 %32, 48
  %38 = ashr exact i64 %sext7, 48
  %39 = mul nsw i64 %38, 32735
  %40 = icmp slt i64 %sext7, 0
  br i1 %40, label %41, label %52

; <label>:41:                                     ; preds = %29
  %42 = icmp sgt i64 %37, -1
  br i1 %42, label %43, label %45

; <label>:43:                                     ; preds = %41
  %44 = add nsw i64 %37, %39
  br label %58

; <label>:45:                                     ; preds = %41
  %46 = xor i64 %39, -1
  %47 = xor i64 %37, -1
  %48 = add i64 %47, %46
  %49 = icmp ugt i64 %48, 2147483646
  %50 = sub i64 -2, %48
  %51 = select i1 %49, i64 -2147483648, i64 %50
  br label %58

; <label>:52:                                     ; preds = %29
  %53 = icmp slt i64 %37, 1
  %54 = add i64 %37, %39
  %55 = icmp ult i64 %54, 2147483647
  %56 = or i1 %53, %55
  %57 = select i1 %56, i64 %54, i64 2147483647
  br label %58

; <label>:58:                                     ; preds = %52, %43, %45
  %59 = phi i64 [ %44, %43 ], [ %51, %45 ], [ %57, %52 ]
  %60 = icmp slt i64 %59, 0
  %61 = add i64 %59, 16384
  %62 = icmp ult i64 %61, 2147483647
  %63 = or i1 %60, %62
  %sext25 = shl i64 %.0520, 48
  %64 = ashr exact i64 %sext25, 48
  %.op = lshr i64 %61, 15
  %65 = select i1 %63, i64 %.op, i64 65535
  %sext8 = shl i64 %65, 48
  %66 = ashr exact i64 %sext8, 48
  %67 = mul i64 %64, -242064356802560
  %68 = add i64 %67, 140737488355328
  %69 = ashr i64 %68, 48
  %70 = add nsw i64 %66, %69
  %71 = add nsw i64 %70, 32768
  %72 = icmp ugt i64 %71, 65535
  %73 = icmp sgt i64 %70, 0
  %74 = select i1 %73, i64 32767, i64 32768
  %75 = select i1 %72, i64 %74, i64 %70
  %76 = trunc i64 %75 to i16
  %77 = getelementptr inbounds i16, i16* %.0223, i64 1
  store i16 %76, i16* %.0223, align 2
  %78 = add nsw i32 %12, -1
  %79 = icmp eq i32 %12, 0
  br i1 %79, label %80, label %11

; <label>:80:                                     ; preds = %58
  %81 = trunc i64 %65 to i32
  store i16 %17, i16* %4, align 8
  store i64 %59, i64* %6, align 8
  %sext26 = shl i32 %81, 16
  %82 = ashr exact i32 %sext26, 16
  store i32 %82, i32* %8, align 8
  ret void
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

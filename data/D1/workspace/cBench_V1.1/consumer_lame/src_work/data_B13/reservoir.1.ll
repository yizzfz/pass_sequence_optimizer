; ModuleID = 'reservoir.ll'
source_filename = "reservoir.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }

@ResvSize = internal unnamed_addr global i32 0, align 4
@.str = private unnamed_addr constant [43 x i8] c"(l3_side->main_data_begin * 8) == ResvSize\00", align 1
@.str.1 = private unnamed_addr constant [12 x i8] c"reservoir.c\00", align 1
@__PRETTY_FUNCTION__.ResvFrameBegin = private unnamed_addr constant [69 x i8] c"int ResvFrameBegin(lame_global_flags *, III_side_info_t *, int, int)\00", align 1
@ResvMax = internal unnamed_addr global i32 0, align 4

; Function Attrs: noinline nounwind uwtable
define i32 @ResvFrameBegin(%struct.lame_global_flags* nocapture readonly, %struct.III_side_info_t* nocapture readonly, i32, i32) local_unnamed_addr #0 {
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 39
  %6 = load i64, i64* %5, align 8
  %7 = icmp eq i64 %6, 0
  br i1 %7, label %8, label %9

; <label>:8:                                      ; preds = %4
  store i32 0, i32* @ResvSize, align 4
  br label %9

; <label>:9:                                      ; preds = %8, %4
  %10 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 43
  %11 = load i32, i32* %10, align 8
  %12 = icmp eq i32 %11, 1
  %. = select i1 %12, i32 4088, i32 2040
  %13 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 0
  %14 = load i32, i32* %13, align 8
  %15 = shl nsw i32 %14, 3
  %16 = load i32, i32* @ResvSize, align 4
  %17 = icmp eq i32 %15, %16
  br i1 %17, label %19, label %18

; <label>:18:                                     ; preds = %9
  tail call void @__assert_fail(i8* getelementptr inbounds ([43 x i8], [43 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @.str.1, i64 0, i64 0), i32 68, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__.ResvFrameBegin, i64 0, i64 0)) #3
  unreachable

; <label>:19:                                     ; preds = %9
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %21 = load i32, i32* %20, align 8
  %22 = mul nsw i32 %21, %2
  %23 = add nsw i32 %22, %16
  %24 = icmp sgt i32 %3, 7680
  %25 = sub nsw i32 7680, %3
  %storemerge = select i1 %24, i32 0, i32 %25
  %26 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 17
  %27 = load i32, i32* %26, align 8
  %28 = icmp eq i32 %27, 0
  %storemerge. = select i1 %28, i32 %storemerge, i32 0
  %29 = icmp sgt i32 %storemerge., %.
  %..storemerge. = select i1 %29, i32 %., i32 %storemerge.
  store i32 %..storemerge., i32* @ResvMax, align 4
  ret i32 %23
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define void @ResvMaxBits(i32, i32* nocapture, i32* nocapture, i32) local_unnamed_addr #2 {
  store i32 %0, i32* %1, align 4
  %5 = load i32, i32* @ResvSize, align 4
  %6 = load i32, i32* @ResvMax, align 4
  %7 = mul nsw i32 %6, 9
  %8 = sdiv i32 %7, 10
  %9 = icmp sgt i32 %5, %8
  br i1 %9, label %10, label %13

; <label>:10:                                     ; preds = %4
  %11 = sub nsw i32 %5, %8
  %12 = add nsw i32 %11, %0
  br label %18

; <label>:13:                                     ; preds = %4
  %14 = sitofp i32 %0 to double
  %15 = fdiv double %14, 1.520000e+01
  %16 = fptosi double %15 to i32
  %17 = sub nsw i32 %0, %16
  br label %18

; <label>:18:                                     ; preds = %13, %10
  %storemerge = phi i32 [ %17, %13 ], [ %12, %10 ]
  %.0 = phi i32 [ 0, %13 ], [ %11, %10 ]
  store i32 %storemerge, i32* %1, align 4
  %19 = load i32, i32* @ResvSize, align 4
  %20 = load i32, i32* @ResvMax, align 4
  %21 = mul nsw i32 %20, 6
  %22 = sdiv i32 %21, 10
  %23 = icmp slt i32 %19, %22
  %.2 = select i1 %23, i32 %19, i32 %22
  %24 = sub nsw i32 %.2, %.0
  %25 = icmp sgt i32 %24, 0
  %. = select i1 %25, i32 %24, i32 0
  store i32 %., i32* %2, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @ResvAdjust(%struct.lame_global_flags* nocapture readonly, %struct.gr_info* nocapture readonly, %struct.III_side_info_t* nocapture readnone, i32) local_unnamed_addr #2 {
  %5 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %6 = load i32, i32* %5, align 4
  %7 = sdiv i32 %3, %6
  %8 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 0
  %9 = load i32, i32* %8, align 8
  %10 = sub i32 %7, %9
  %11 = load i32, i32* @ResvSize, align 4
  %12 = add i32 %10, %11
  store i32 %12, i32* @ResvSize, align 4
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define void @ResvFrameEnd(%struct.lame_global_flags* nocapture readonly, %struct.III_side_info_t* nocapture, i32) local_unnamed_addr #2 {
  %4 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %5 = load i32, i32* %4, align 4
  %6 = icmp ne i32 %5, 2
  %7 = and i32 %2, 1
  %8 = icmp eq i32 %7, 0
  %or.cond = or i1 %8, %6
  br i1 %or.cond, label %12, label %9

; <label>:9:                                      ; preds = %3
  %10 = load i32, i32* @ResvSize, align 4
  %11 = add nsw i32 %10, 1
  store i32 %11, i32* @ResvSize, align 4
  br label %12

; <label>:12:                                     ; preds = %3, %9
  %13 = load i32, i32* @ResvSize, align 4
  %14 = load i32, i32* @ResvMax, align 4
  %15 = sub nsw i32 %13, %14
  %16 = icmp sgt i32 %15, 0
  %. = select i1 %16, i32 %15, i32 0
  %17 = sub nsw i32 %13, %.
  %18 = srem i32 %17, 8
  %storemerge = sub nsw i32 %17, %18
  %.01 = add nsw i32 %., %18
  store i32 %storemerge, i32* @ResvSize, align 4
  %19 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %1, i64 0, i32 2
  store i32 %.01, i32* %19, align 8
  ret void
}

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

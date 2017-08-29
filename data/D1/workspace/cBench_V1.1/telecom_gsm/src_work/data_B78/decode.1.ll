; ModuleID = 'decode.ll'
source_filename = "decode.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Decoder(%struct.gsm_state*, i16*, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture readonly, i16* nocapture readonly, i16*, i16*) local_unnamed_addr #0 {
  %9 = alloca [40 x i16], align 16
  %10 = alloca [160 x i16], align 16
  %11 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 0, i64 120
  %12 = getelementptr inbounds [40 x i16], [40 x i16]* %9, i64 0, i64 0
  %scevgep15 = getelementptr %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 0, i64 120
  %scevgep1516 = bitcast i16* %scevgep15 to i8*
  %scevgep14 = bitcast [160 x i16]* %10 to i8*
  %13 = load i16, i16* %5, align 2
  %14 = load i16, i16* %4, align 2
  call void @Gsm_RPE_Decoding(%struct.gsm_state* %0, i16 signext %13, i16 signext %14, i16* %6, i16* nonnull %12) #4
  %15 = load i16, i16* %2, align 2
  %16 = load i16, i16* %3, align 2
  call void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* %0, i16 signext %15, i16 signext %16, i16* nonnull %12, i16* %11) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %scevgep14, i8* %scevgep1516, i64 80, i32 2, i1 false)
  %17 = getelementptr inbounds i16, i16* %5, i64 1
  %18 = getelementptr inbounds i16, i16* %3, i64 1
  %19 = getelementptr inbounds i16, i16* %2, i64 1
  %20 = getelementptr inbounds i16, i16* %4, i64 1
  %21 = getelementptr inbounds i16, i16* %6, i64 13
  %scevgep.1 = getelementptr inbounds [160 x i16], [160 x i16]* %10, i64 0, i64 40
  %scevgep14.1 = bitcast i16* %scevgep.1 to i8*
  %22 = load i16, i16* %17, align 2
  %23 = load i16, i16* %20, align 2
  call void @Gsm_RPE_Decoding(%struct.gsm_state* %0, i16 signext %22, i16 signext %23, i16* %21, i16* nonnull %12) #4
  %24 = load i16, i16* %19, align 2
  %25 = load i16, i16* %18, align 2
  call void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* %0, i16 signext %24, i16 signext %25, i16* nonnull %12, i16* %11) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep14.1, i8* %scevgep1516, i64 80, i32 2, i1 false)
  %26 = getelementptr inbounds i16, i16* %5, i64 2
  %27 = getelementptr inbounds i16, i16* %3, i64 2
  %28 = getelementptr inbounds i16, i16* %2, i64 2
  %29 = getelementptr inbounds i16, i16* %4, i64 2
  %30 = getelementptr inbounds i16, i16* %6, i64 26
  %scevgep.2 = getelementptr inbounds [160 x i16], [160 x i16]* %10, i64 0, i64 80
  %scevgep14.2 = bitcast i16* %scevgep.2 to i8*
  %31 = load i16, i16* %26, align 2
  %32 = load i16, i16* %29, align 2
  call void @Gsm_RPE_Decoding(%struct.gsm_state* %0, i16 signext %31, i16 signext %32, i16* %30, i16* nonnull %12) #4
  %33 = load i16, i16* %28, align 2
  %34 = load i16, i16* %27, align 2
  call void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* %0, i16 signext %33, i16 signext %34, i16* nonnull %12, i16* %11) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep14.2, i8* %scevgep1516, i64 80, i32 2, i1 false)
  %35 = getelementptr inbounds i16, i16* %5, i64 3
  %36 = getelementptr inbounds i16, i16* %3, i64 3
  %37 = getelementptr inbounds i16, i16* %2, i64 3
  %38 = getelementptr inbounds i16, i16* %4, i64 3
  %39 = getelementptr inbounds i16, i16* %6, i64 39
  %scevgep.3 = getelementptr inbounds [160 x i16], [160 x i16]* %10, i64 0, i64 120
  %scevgep14.3 = bitcast i16* %scevgep.3 to i8*
  %40 = load i16, i16* %35, align 2
  %41 = load i16, i16* %38, align 2
  call void @Gsm_RPE_Decoding(%struct.gsm_state* %0, i16 signext %40, i16 signext %41, i16* %39, i16* nonnull %12) #4
  %42 = load i16, i16* %37, align 2
  %43 = load i16, i16* %36, align 2
  call void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state* %0, i16 signext %42, i16 signext %43, i16* nonnull %12, i16* %11) #4
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %scevgep14.3, i8* %scevgep1516, i64 80, i32 2, i1 false)
  %44 = getelementptr inbounds [160 x i16], [160 x i16]* %10, i64 0, i64 0
  call void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state* %0, i16* %1, i16* nonnull %44, i16* %7) #4
  call fastcc void @Postprocessing(%struct.gsm_state* %0, i16* %7)
  ret void
}

declare void @Gsm_RPE_Decoding(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_Long_Term_Synthesis_Filtering(%struct.gsm_state*, i16 signext, i16 signext, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_Short_Term_Synthesis_Filter(%struct.gsm_state*, i16*, i16*, i16*) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @Postprocessing(%struct.gsm_state* nocapture, i16* nocapture) unnamed_addr #2 {
  %3 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 9
  %4 = load i16, i16* %3, align 2
  br label %5

; <label>:5:                                      ; preds = %2, %5
  %.06 = phi i16* [ %1, %2 ], [ %28, %5 ]
  %.015 = phi i32 [ 160, %2 ], [ %6, %5 ]
  %.024 = phi i16 [ %4, %2 ], [ %19, %5 ]
  %6 = add nsw i32 %.015, -1
  %7 = sext i16 %.024 to i64
  %8 = load i16, i16* %.06, align 2
  %9 = sext i16 %8 to i64
  %10 = mul nsw i64 %7, 242064356802560
  %11 = add i64 %10, 140737488355328
  %12 = ashr i64 %11, 48
  %13 = add nsw i64 %9, %12
  %14 = add nsw i64 %13, 32768
  %15 = icmp ugt i64 %14, 65535
  %16 = icmp sgt i64 %13, 0
  %17 = select i1 %16, i64 32767, i64 -32768
  %18 = select i1 %15, i64 %17, i64 %13
  %19 = trunc i64 %18 to i16
  %sext = shl i64 %18, 48
  %20 = ashr exact i64 %sext, 47
  %21 = add nsw i64 %20, 32768
  %22 = icmp ugt i64 %21, 65535
  %23 = icmp sgt i64 %sext, 0
  %24 = select i1 %23, i64 32760, i64 32768
  %25 = select i1 %22, i64 %24, i64 %20
  %26 = trunc i64 %25 to i16
  %27 = and i16 %26, -8
  store i16 %27, i16* %.06, align 2
  %28 = getelementptr inbounds i16, i16* %.06, i64 1
  %29 = icmp eq i32 %6, 0
  br i1 %29, label %30, label %5

; <label>:30:                                     ; preds = %5
  store i16 %19, i16* %3, align 2
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'code.ll'
source_filename = "code.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.gsm_state = type { [280 x i16], i16, i64, i32, [8 x i16], [2 x [8 x i16]], i16, i16, [9 x i16], i16, i8, i8 }

@Gsm_Coder.e = internal global [50 x i16] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @Gsm_Coder(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*, i16*) local_unnamed_addr #0 {
  %9 = alloca [160 x i16], align 16
  %10 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 0, i64 120
  %11 = getelementptr inbounds [160 x i16], [160 x i16]* %9, i64 0, i64 0
  call void @Gsm_Preprocess(%struct.gsm_state* %0, i16* %1, i16* nonnull %11) #3
  call void @Gsm_LPC_Analysis(%struct.gsm_state* %0, i16* nonnull %11, i16* %2) #3
  call void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state* %0, i16* %2, i16* nonnull %11) #3
  br label %12

; <label>:12:                                     ; preds = %48, %8
  %indvars.iv18 = phi i64 [ 0, %8 ], [ %indvars.iv.next19, %48 ]
  %.0117 = phi i16* [ %10, %8 ], [ %51, %48 ]
  %.0315 = phi i16* [ %3, %8 ], [ %15, %48 ]
  %.0414 = phi i16* [ %4, %8 ], [ %49, %48 ]
  %.0513 = phi i16* [ %5, %8 ], [ %50, %48 ]
  %.0612 = phi i16* [ %6, %8 ], [ %16, %48 ]
  %.0711 = phi i16* [ %7, %8 ], [ %52, %48 ]
  %13 = mul nuw nsw i64 %indvars.iv18, 40
  %14 = getelementptr inbounds [160 x i16], [160 x i16]* %9, i64 0, i64 %13
  %15 = getelementptr inbounds i16, i16* %.0315, i64 1
  call void @Gsm_Long_Term_Predictor(%struct.gsm_state* %0, i16* %14, i16* %.0117, i16* getelementptr inbounds ([50 x i16], [50 x i16]* @Gsm_Coder.e, i64 0, i64 5), i16* %.0117, i16* %.0315, i16* %.0414) #3
  %16 = getelementptr inbounds i16, i16* %.0612, i64 1
  call void @Gsm_RPE_Encoding(%struct.gsm_state* %0, i16* getelementptr inbounds ([50 x i16], [50 x i16]* @Gsm_Coder.e, i64 0, i64 5), i16* %.0612, i16* %.0513, i16* %.0711) #3
  br label %17

; <label>:17:                                     ; preds = %17, %12
  %indvars.iv = phi i64 [ 0, %12 ], [ %indvars.iv.next.1, %17 ]
  %18 = add nuw nsw i64 %indvars.iv, 5
  %19 = getelementptr inbounds [50 x i16], [50 x i16]* @Gsm_Coder.e, i64 0, i64 %18
  %20 = load i16, i16* %19, align 2
  %21 = sext i16 %20 to i64
  %22 = getelementptr inbounds i16, i16* %.0117, i64 %indvars.iv
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i64
  %25 = add nsw i64 %24, %21
  %26 = add nsw i64 %25, 32768
  %27 = icmp ugt i64 %26, 65535
  %28 = icmp sgt i64 %25, 0
  %29 = select i1 %28, i64 32767, i64 32768
  %30 = select i1 %27, i64 %29, i64 %25
  %31 = trunc i64 %30 to i16
  %32 = getelementptr inbounds i16, i16* %.0117, i64 %indvars.iv
  store i16 %31, i16* %32, align 2
  %indvars.iv.next = or i64 %indvars.iv, 1
  %33 = add nsw i64 %indvars.iv, 6
  %34 = getelementptr inbounds [50 x i16], [50 x i16]* @Gsm_Coder.e, i64 0, i64 %33
  %35 = load i16, i16* %34, align 4
  %36 = sext i16 %35 to i64
  %37 = getelementptr inbounds i16, i16* %.0117, i64 %indvars.iv.next
  %38 = load i16, i16* %37, align 2
  %39 = sext i16 %38 to i64
  %40 = add nsw i64 %39, %36
  %41 = add nsw i64 %40, 32768
  %42 = icmp ugt i64 %41, 65535
  %43 = icmp sgt i64 %40, 0
  %44 = select i1 %43, i64 32767, i64 32768
  %45 = select i1 %42, i64 %44, i64 %40
  %46 = trunc i64 %45 to i16
  %47 = getelementptr inbounds i16, i16* %.0117, i64 %indvars.iv.next
  store i16 %46, i16* %47, align 2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 40
  br i1 %exitcond.1, label %48, label %17

; <label>:48:                                     ; preds = %17
  %49 = getelementptr inbounds i16, i16* %.0414, i64 1
  %50 = getelementptr inbounds i16, i16* %.0513, i64 1
  %51 = getelementptr inbounds i16, i16* %.0117, i64 40
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %52 = getelementptr inbounds i16, i16* %.0711, i64 13
  %exitcond = icmp eq i64 %indvars.iv.next19, 4
  br i1 %exitcond, label %53, label %12

; <label>:53:                                     ; preds = %48
  %54 = bitcast %struct.gsm_state* %0 to i8*
  %55 = getelementptr inbounds %struct.gsm_state, %struct.gsm_state* %0, i64 0, i32 0, i64 160
  %56 = bitcast i16* %55 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %54, i8* %56, i64 240, i32 1, i1 false)
  ret void
}

declare void @Gsm_Preprocess(%struct.gsm_state*, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_LPC_Analysis(%struct.gsm_state*, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_Short_Term_Analysis_Filter(%struct.gsm_state*, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_Long_Term_Predictor(%struct.gsm_state*, i16*, i16*, i16*, i16*, i16*, i16*) local_unnamed_addr #1

declare void @Gsm_RPE_Encoding(%struct.gsm_state*, i16*, i16*, i16*, i16*) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

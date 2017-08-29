; ModuleID = 'A.ll'
source_filename = "floyd-warshall.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %4 = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2800 x i32]*
  tail call void @print_array(i32 2800, [2800 x i32]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2800 x i32]* nocapture) #2 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv17 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next18, %.loopexit.us ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %2 = mul nuw nsw i64 %indvars.iv17, %indvars.iv
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 7
  %5 = add nsw i32 %4, 1
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv17, i64 %indvars.iv
  %7 = add nuw nsw i64 %indvars.iv, %indvars.iv17
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 13
  %10 = icmp eq i32 %9, 0
  %11 = srem i32 %8, 7
  %12 = icmp eq i32 %11, 0
  %or.cond.us = or i1 %10, %12
  %13 = srem i32 %8, 11
  %14 = icmp eq i32 %13, 0
  %or.cond3.us = or i1 %14, %or.cond.us
  %. = select i1 %or.cond3.us, i32 999, i32 %5
  store i32 %., i32* %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge15

.loopexit.us:                                     ; preds = %._crit_edge15
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2800
  br i1 %exitcond19, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]* nocapture) #2 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit7.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv35 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %indvars.iv.next36, %.loopexit7.us ]
  %scevgep41 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv35, i64 0
  %2 = add nuw nsw i64 %indvars.iv35, 1
  %scevgep43 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %2, i64 0
  br label %.preheader.us.us

.loopexit7.us:                                    ; preds = %.loopexit.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 2800
  br i1 %exitcond37, label %._crit_edge, label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv33 = phi i64 [ 0, %.preheader3.us..preheader.us.us_crit_edge ], [ %indvars.iv.next34, %.loopexit.us.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv33, i64 0
  %3 = add nuw nsw i64 %indvars.iv33, 1
  %scevgep39 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %3, i64 0
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv33, i64 %indvars.iv35
  %bound0 = icmp ult i32* %scevgep, %4
  %bound1 = icmp ult i32* %4, %scevgep39
  %found.conflict = and i1 %bound0, %bound1
  %bound046 = icmp ult i32* %scevgep, %scevgep43
  %bound147 = icmp ult i32* %scevgep41, %scevgep39
  %found.conflict48 = and i1 %bound046, %bound147
  %conflict.rdx = or i1 %found.conflict, %found.conflict48
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv33, i64 %index
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %6, align 4, !alias.scope !1, !noalias !4
  %7 = getelementptr i32, i32* %5, i64 4
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load50 = load <4 x i32>, <4 x i32>* %8, align 4, !alias.scope !1, !noalias !4
  %9 = load i32, i32* %4, align 4, !alias.scope !7
  %10 = insertelement <4 x i32> undef, i32 %9, i32 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> undef, <4 x i32> zeroinitializer
  %12 = insertelement <4 x i32> undef, i32 %9, i32 0
  %13 = shufflevector <4 x i32> %12, <4 x i32> undef, <4 x i32> zeroinitializer
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv35, i64 %index
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load51 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !8
  %16 = getelementptr i32, i32* %14, i64 4
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load52 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !8
  %18 = add nsw <4 x i32> %wide.load51, %11
  %19 = add nsw <4 x i32> %wide.load52, %13
  %20 = icmp slt <4 x i32> %wide.load, %18
  %21 = icmp slt <4 x i32> %wide.load50, %19
  %22 = select <4 x i1> %20, <4 x i32> %wide.load, <4 x i32> %18
  %23 = select <4 x i1> %21, <4 x i32> %wide.load50, <4 x i32> %19
  %24 = bitcast i32* %5 to <4 x i32>*
  store <4 x i32> %22, <4 x i32>* %24, align 4, !alias.scope !1, !noalias !4
  %25 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> %23, <4 x i32>* %25, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %26 = icmp eq i64 %index.next, 2800
  br i1 %26, label %.loopexit.us.us.loopexit53, label %vector.body, !llvm.loop !9

.loopexit.us.us.loopexit:                         ; preds = %scalar.ph
  br label %.loopexit.us.us

.loopexit.us.us.loopexit53:                       ; preds = %vector.body
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit53, %.loopexit.us.us.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, 2800
  br i1 %exitcond, label %.loopexit7.us, label %.preheader.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.1, %scalar.ph ]
  %27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv33, i64 %indvars.iv
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %4, align 4
  %30 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv35, i64 %indvars.iv
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %31, %29
  %33 = icmp slt i32 %28, %32
  %..us.us = select i1 %33, i32 %28, i32 %32
  store i32 %..us.us, i32* %27, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %34 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv33, i64 %indvars.iv.next
  %35 = load i32, i32* %34, align 4
  %36 = load i32, i32* %4, align 4
  %37 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv35, i64 %indvars.iv.next
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %38, %36
  %40 = icmp slt i32 %35, %39
  %..us.us.1 = select i1 %40, i32 %35, i32 %39
  store i32 %..us.us.1, i32* %34, align 4
  %exitcond32.1 = icmp eq i64 %indvars.iv.next, 2799
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond32.1, label %.loopexit.us.us.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge:                                      ; preds = %.loopexit7.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]* nocapture readonly) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %6 = mul nuw nsw i64 %indvars.iv14, 2800
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge11

; <label>:11:                                     ; preds = %._crit_edge12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge12, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load i32, i32* %14, align 4
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 2800
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = !{!5}
!8 = !{!6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}

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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %.cast = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array([2800 x i32]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_floyd_warshall([2800 x i32]* %.cast)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %4 = icmp sgt i32 %0, 42
  br i1 %4, label %5, label %._crit_edge

; <label>:5:                                      ; preds = %2
  %6 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %6, align 1
  %7 = icmp eq i8 %strcmpload, 0
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %5
  tail call void @print_array([2800 x i32]* %.cast)
  br label %._crit_edge

._crit_edge:                                      ; preds = %5, %2, %8
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2800 x i32]*) #2 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv19 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next20, %.loopexit.us ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge17 ]
  %1 = mul nuw nsw i64 %indvars.iv, %indvars.iv19
  %2 = trunc i64 %1 to i32
  %3 = srem i32 %2, 7
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %6 = add nuw nsw i64 %indvars.iv, %indvars.iv19
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 13
  %9 = icmp eq i32 %8, 0
  %10 = srem i32 %7, 7
  %11 = icmp eq i32 %10, 0
  %or.cond = or i1 %9, %11
  %12 = srem i32 %7, 11
  %13 = icmp eq i32 %12, 0
  %or.cond24 = or i1 %or.cond, %13
  %. = select i1 %or.cond24, i32 999, i32 %4
  store i32 %., i32* %5, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge17

.loopexit.us:                                     ; preds = %._crit_edge17
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2800
  br i1 %exitcond21, label %.loopexit7, label %.preheader.us

.loopexit7:                                       ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall([2800 x i32]*) #2 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit6.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv31 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %1, %.loopexit6.us ]
  %scevgep4 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv31, i64 0
  %1 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep6 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %1, i64 0
  br label %.preheader.us.us

.loopexit6.us:                                    ; preds = %.loopexit.us.us
  %exitcond34 = icmp eq i64 %1, 2800
  br i1 %exitcond34, label %.loopexit7, label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv29 = phi i64 [ 0, %.preheader3.us..preheader.us.us_crit_edge ], [ %2, %.loopexit.us.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv29, i64 0
  %2 = add nuw nsw i64 %indvars.iv29, 1
  %scevgep2 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %2, i64 0
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv29, i64 %indvars.iv31
  %bound0 = icmp ult i32* %scevgep, %3
  %bound1 = icmp ult i32* %3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult i32* %scevgep, %scevgep6
  %bound110 = icmp ult i32* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %._crit_edge26.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us.us
  br label %vector.body

._crit_edge26.preheader:                          ; preds = %.preheader.us.us
  br label %._crit_edge26

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv29, i64 %index
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load13 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !1, !noalias !4
  %8 = load i32, i32* %3, align 4, !alias.scope !7
  %9 = insertelement <4 x i32> undef, i32 %8, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv31, i64 %index
  %12 = bitcast i32* %11 to <4 x i32>*
  %wide.load14 = load <4 x i32>, <4 x i32>* %12, align 4, !alias.scope !8
  %13 = getelementptr i32, i32* %11, i64 4
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load15 = load <4 x i32>, <4 x i32>* %14, align 4, !alias.scope !8
  %15 = add nsw <4 x i32> %wide.load14, %10
  %16 = add nsw <4 x i32> %wide.load15, %10
  %17 = icmp slt <4 x i32> %wide.load, %15
  %18 = icmp slt <4 x i32> %wide.load13, %16
  %19 = select <4 x i1> %17, <4 x i32> %wide.load, <4 x i32> %15
  %20 = select <4 x i1> %18, <4 x i32> %wide.load13, <4 x i32> %16
  store <4 x i32> %19, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  store <4 x i32> %20, <4 x i32>* %7, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %21 = icmp eq i64 %index.next, 2800
  br i1 %21, label %.loopexit.us.us.loopexit16, label %vector.body, !llvm.loop !9

.loopexit.us.us.loopexit:                         ; preds = %._crit_edge26
  br label %.loopexit.us.us

.loopexit.us.us.loopexit16:                       ; preds = %vector.body
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit16, %.loopexit.us.us.loopexit
  %exitcond33 = icmp eq i64 %2, 2800
  br i1 %exitcond33, label %.loopexit6.us, label %.preheader.us.us

._crit_edge26:                                    ; preds = %._crit_edge26, %._crit_edge26.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge26.preheader ], [ %indvars.iv.next.1, %._crit_edge26 ]
  %22 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv29, i64 %indvars.iv
  %23 = load i32, i32* %22, align 4
  %24 = load i32, i32* %3, align 4
  %25 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv31, i64 %indvars.iv
  %26 = load i32, i32* %25, align 4
  %27 = add nsw i32 %26, %24
  %28 = icmp slt i32 %23, %27
  %. = select i1 %28, i32 %23, i32 %27
  store i32 %., i32* %22, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv29, i64 %indvars.iv.next
  %30 = load i32, i32* %29, align 4
  %31 = load i32, i32* %3, align 4
  %32 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv31, i64 %indvars.iv.next
  %33 = load i32, i32* %32, align 4
  %34 = add nsw i32 %33, %31
  %35 = icmp slt i32 %30, %34
  %..1 = select i1 %35, i32 %30, i32 %34
  store i32 %..1, i32* %29, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %.loopexit.us.us.loopexit, label %._crit_edge26, !llvm.loop !12

.loopexit7:                                       ; preds = %.loopexit6.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2800 x i32]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next14, %.loopexit.us ]
  %5 = mul nuw nsw i64 %indvars.iv13, 2800
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge10 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge10

; <label>:10:                                     ; preds = %._crit_edge11
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge11, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %14 = load i32, i32* %13, align 4
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge11

.loopexit.us:                                     ; preds = %._crit_edge10
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2800
  br i1 %exitcond15, label %.loopexit4, label %.preheader.us

.loopexit4:                                       ; preds = %.loopexit.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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

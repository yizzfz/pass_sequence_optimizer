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
  %3 = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #3
  %4 = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %6
  br label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call void @print_array(i32 2800, [2800 x i32]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, [2800 x i32]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next16, %.loopexit.us..preheader.us_crit_edge ]
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.._crit_edge13_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge13.._crit_edge13_crit_edge ]
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %3 = trunc i64 %2 to i32
  %4 = srem i32 %3, 7
  %5 = add nsw i32 %4, 1
  %6 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv15, i64 %indvars.iv
  %7 = add nuw nsw i64 %indvars.iv, %indvars.iv15
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 13
  %10 = icmp eq i32 %9, 0
  %11 = srem i32 %8, 7
  %12 = icmp eq i32 %11, 0
  %or.cond = or i1 %10, %12
  %13 = srem i32 %8, 11
  %14 = icmp eq i32 %13, 0
  %or.cond19 = or i1 %or.cond, %14
  %. = select i1 %or.cond19, i32 999, i32 %5
  store i32 %., i32* %6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge13.._crit_edge13_crit_edge

._crit_edge13.._crit_edge13_crit_edge:            ; preds = %._crit_edge13
  br label %._crit_edge13

.loopexit.us:                                     ; preds = %._crit_edge13
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16, 2800
  br i1 %exitcond20, label %._crit_edge, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_floyd_warshall(i32, [2800 x i32]*) #0 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit6.us..preheader3.us..preheader.us.us_crit_edge_crit_edge, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv31 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %2, %.loopexit6.us..preheader3.us..preheader.us.us_crit_edge_crit_edge ]
  %scevgep38 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 0
  %2 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep40 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %2, i64 0
  br label %.preheader.us.us

.loopexit6.us:                                    ; preds = %.loopexit.us.us
  %exitcond34 = icmp eq i64 %2, 2800
  br i1 %exitcond34, label %._crit_edge, label %.loopexit6.us..preheader3.us..preheader.us.us_crit_edge_crit_edge

.loopexit6.us..preheader3.us..preheader.us.us_crit_edge_crit_edge: ; preds = %.loopexit6.us
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us..preheader.us.us_crit_edge, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv29 = phi i64 [ 0, %.preheader3.us..preheader.us.us_crit_edge ], [ %3, %.loopexit.us.us..preheader.us.us_crit_edge ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 0
  %3 = add nuw nsw i64 %indvars.iv29, 1
  %scevgep36 = getelementptr [2800 x i32], [2800 x i32]* %1, i64 %3, i64 0
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %indvars.iv31
  %bound0 = icmp ult i32* %scevgep, %4
  %bound1 = icmp ult i32* %4, %scevgep36
  %found.conflict = and i1 %bound0, %bound1
  %bound043 = icmp ult i32* %scevgep, %scevgep40
  %bound144 = icmp ult i32* %scevgep38, %scevgep36
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx = or i1 %found.conflict, %found.conflict45
  br i1 %conflict.rdx, label %._crit_edge26.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us.us
  br label %vector.body

._crit_edge26.preheader:                          ; preds = %.preheader.us.us
  br label %._crit_edge26

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %index
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %6, align 4, !alias.scope !1, !noalias !4
  %7 = getelementptr i32, i32* %5, i64 4
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load47 = load <4 x i32>, <4 x i32>* %8, align 4, !alias.scope !1, !noalias !4
  %9 = load i32, i32* %4, align 4, !alias.scope !7
  %10 = insertelement <4 x i32> undef, i32 %9, i32 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> undef, <4 x i32> zeroinitializer
  %12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %index
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load48 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !8
  %14 = getelementptr i32, i32* %12, i64 4
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load49 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !8
  %16 = add nsw <4 x i32> %wide.load48, %11
  %17 = add nsw <4 x i32> %wide.load49, %11
  %18 = icmp slt <4 x i32> %wide.load, %16
  %19 = icmp slt <4 x i32> %wide.load47, %17
  %20 = select <4 x i1> %18, <4 x i32> %wide.load, <4 x i32> %16
  %21 = select <4 x i1> %19, <4 x i32> %wide.load47, <4 x i32> %17
  store <4 x i32> %20, <4 x i32>* %6, align 4, !alias.scope !1, !noalias !4
  store <4 x i32> %21, <4 x i32>* %8, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %22 = icmp eq i64 %index.next, 2800
  br i1 %22, label %.loopexit.us.us.loopexit50, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.loopexit.us.us.loopexit:                         ; preds = %._crit_edge26
  br label %.loopexit.us.us

.loopexit.us.us.loopexit50:                       ; preds = %vector.body
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit50, %.loopexit.us.us.loopexit
  %exitcond33 = icmp eq i64 %3, 2800
  br i1 %exitcond33, label %.loopexit6.us, label %.loopexit.us.us..preheader.us.us_crit_edge

.loopexit.us.us..preheader.us.us_crit_edge:       ; preds = %.loopexit.us.us
  br label %.preheader.us.us

._crit_edge26:                                    ; preds = %._crit_edge26.._crit_edge26_crit_edge, %._crit_edge26.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge26.preheader ], [ %indvars.iv.next.1, %._crit_edge26.._crit_edge26_crit_edge ]
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %indvars.iv
  %24 = load i32, i32* %23, align 4
  %25 = load i32, i32* %4, align 4
  %26 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %indvars.iv
  %27 = load i32, i32* %26, align 4
  %28 = add nsw i32 %27, %25
  %29 = icmp slt i32 %24, %28
  %. = select i1 %29, i32 %24, i32 %28
  store i32 %., i32* %23, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv29, i64 %indvars.iv.next
  %31 = load i32, i32* %30, align 4
  %32 = load i32, i32* %4, align 4
  %33 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv31, i64 %indvars.iv.next
  %34 = load i32, i32* %33, align 4
  %35 = add nsw i32 %34, %32
  %36 = icmp slt i32 %31, %35
  %..1 = select i1 %36, i32 %31, i32 %35
  store i32 %..1, i32* %30, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %.loopexit.us.us.loopexit, label %._crit_edge26.._crit_edge26_crit_edge, !llvm.loop !12

._crit_edge26.._crit_edge26_crit_edge:            ; preds = %._crit_edge26
  br label %._crit_edge26

._crit_edge:                                      ; preds = %.loopexit6.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2800 x i32]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv12 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next13, %.loopexit.us..preheader.us_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv12, 2800
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9.._crit_edge10_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge9.._crit_edge10_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10.._crit_edge9_crit_edge

._crit_edge10.._crit_edge9_crit_edge:             ; preds = %._crit_edge10
  br label %._crit_edge9

; <label>:11:                                     ; preds = %._crit_edge10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge10.._crit_edge9_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %1, i64 %indvars.iv12, i64 %indvars.iv
  %15 = load i32, i32* %14, align 4
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge9.._crit_edge10_crit_edge

._crit_edge9.._crit_edge10_crit_edge:             ; preds = %._crit_edge9
  br label %._crit_edge10

.loopexit.us:                                     ; preds = %._crit_edge9
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 2800
  br i1 %exitcond14, label %._crit_edge, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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

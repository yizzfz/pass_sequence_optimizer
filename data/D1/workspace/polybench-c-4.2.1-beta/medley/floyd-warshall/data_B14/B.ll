; ModuleID = 'A.ll'
source_filename = "floyd-warshall.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"path\00", align 1
@.str.5 = private unnamed_addr constant [4 x i8] c"%d \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %4 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @init_array([2800 x i32]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_floyd_warshall([2800 x i32]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %11

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @print_array([2800 x i32]* %10)
  br label %11

; <label>:11:                                     ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture) unnamed_addr #2 {
.lr.ph5.split.us.preheader:
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  br label %1

; <label>:1:                                      ; preds = %15, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %15 ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %3 = add nuw nsw i64 %indvars.iv8, %indvars.iv
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 13
  %6 = icmp eq i32 %5, 0
  %7 = srem i32 %4, 7
  %8 = icmp eq i32 %7, 0
  %or.cond = or i1 %6, %8
  %9 = srem i32 %4, 11
  %10 = icmp eq i32 %9, 0
  %or.cond3 = or i1 %or.cond, %10
  br i1 %or.cond3, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %1
  %11 = mul nuw nsw i64 %indvars.iv8, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 7
  %14 = add nsw i32 %13, 1
  br label %15

; <label>:15:                                     ; preds = %1, %._crit_edge
  %storemerge = phi i32 [ %14, %._crit_edge ], [ 999, %1 ]
  store i32 %storemerge, i32* %2, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond7, label %._crit_edge.us, label %1

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2800
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture) unnamed_addr #2 {
.lr.ph10:
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge7.us, %.lr.ph10
  %indvars.iv22 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next23, %._crit_edge7.us ]
  %scevgep30 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 0
  %1 = add nuw nsw i64 %indvars.iv22, 1
  %scevgep32 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %1, i64 0
  br label %vector.memcheck

._crit_edge7.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 2800
  br i1 %exitcond, label %._crit_edge11, label %.lr.ph.us.us.preheader

vector.memcheck:                                  ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv20 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next21, %._crit_edge.us.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv20, i64 0
  %2 = add nuw nsw i64 %indvars.iv20, 1
  %scevgep28 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %2, i64 0
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv20, i64 %indvars.iv22
  %bound0 = icmp ult i32* %scevgep, %3
  %bound1 = icmp ult i32* %3, %scevgep28
  %found.conflict = and i1 %bound0, %bound1
  %bound035 = icmp ult i32* %scevgep, %scevgep32
  %bound136 = icmp ult i32* %scevgep30, %scevgep28
  %found.conflict37 = and i1 %bound035, %bound136
  %conflict.rdx = or i1 %found.conflict, %found.conflict37
  br i1 %conflict.rdx, label %vector.memcheck.scalar.ph_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.scalar.ph_crit_edge:              ; preds = %vector.memcheck
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ 0, %vector.memcheck.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv20, i64 %index
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load39 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !1, !noalias !4
  %8 = load i32, i32* %3, align 4, !alias.scope !7
  %9 = insertelement <4 x i32> undef, i32 %8, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = insertelement <4 x i32> undef, i32 %8, i32 0
  %12 = shufflevector <4 x i32> %11, <4 x i32> undef, <4 x i32> zeroinitializer
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %index
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load40 = load <4 x i32>, <4 x i32>* %14, align 4, !alias.scope !8
  %15 = getelementptr i32, i32* %13, i64 4
  %16 = bitcast i32* %15 to <4 x i32>*
  %wide.load41 = load <4 x i32>, <4 x i32>* %16, align 4, !alias.scope !8
  %17 = add nsw <4 x i32> %10, %wide.load40
  %18 = add nsw <4 x i32> %12, %wide.load41
  %19 = icmp slt <4 x i32> %wide.load, %17
  %20 = icmp slt <4 x i32> %wide.load39, %18
  %predphi = select <4 x i1> %19, <4 x i32> %wide.load, <4 x i32> %17
  %predphi42 = select <4 x i1> %20, <4 x i32> %wide.load39, <4 x i32> %18
  %21 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> %predphi, <4 x i32>* %21, align 4, !alias.scope !1, !noalias !4
  %22 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> %predphi42, <4 x i32>* %22, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %23 = icmp eq i64 %index.next, 2800
  br i1 %23, label %._crit_edge.us.us.loopexit1, label %vector.body, !llvm.loop !9

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge.us.us

._crit_edge.us.us.loopexit1:                      ; preds = %vector.body
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit1, %._crit_edge.us.us.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next21, 2800
  br i1 %exitcond26, label %._crit_edge7.us, label %vector.memcheck

scalar.ph:                                        ; preds = %scalar.ph, %vector.memcheck.scalar.ph_crit_edge
  %indvars.iv = phi i64 [ 0, %vector.memcheck.scalar.ph_crit_edge ], [ %indvars.iv.next, %scalar.ph ]
  %24 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv20, i64 %indvars.iv
  %25 = load i32, i32* %24, align 4
  %26 = load i32, i32* %3, align 4
  %27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %28 = load i32, i32* %27, align 4
  %29 = add nsw i32 %26, %28
  %30 = icmp slt i32 %25, %29
  %. = select i1 %30, i32 %25, i32 %29
  store i32 %., i32* %24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond19, label %._crit_edge.us.us.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge11:                                    ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly) unnamed_addr #0 {
.lr.ph5.split.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv8 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next9, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv8, 2800
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %5, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %16 = load i32, i32* %15, align 4
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond7, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 2800
  br i1 %exitcond10, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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

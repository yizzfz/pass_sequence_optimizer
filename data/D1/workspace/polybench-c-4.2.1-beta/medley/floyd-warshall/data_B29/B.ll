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
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  call fastcc void @print_array([2800 x i32]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.lr.ph, %.loopexit
  %indvars.iv415 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next5, %.loopexit ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.preheader, %._crit_edge9
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge9 ]
  %1 = mul nuw nsw i64 %indvars.iv415, %indvars.iv14
  %2 = trunc i64 %1 to i32
  %3 = srem i32 %2, 7
  %4 = add nsw i32 %3, 1
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv415, i64 %indvars.iv14
  %6 = add nuw nsw i64 %indvars.iv415, %indvars.iv14
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 13
  %9 = icmp eq i32 %8, 0
  %10 = srem i32 %7, 7
  %11 = icmp eq i32 %10, 0
  %or.cond = or i1 %9, %11
  %12 = srem i32 %7, 11
  %13 = icmp eq i32 %12, 0
  %or.cond12 = or i1 %or.cond, %13
  %. = select i1 %or.cond12, i32 999, i32 %4
  store i32 %., i32* %5, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit, label %._crit_edge9

.loopexit:                                        ; preds = %._crit_edge9
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv415, 1
  %exitcond18 = icmp ne i64 %indvars.iv.next5, 2800
  br i1 %exitcond18, label %._crit_edge.preheader, label %.loopexit17

.loopexit17:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture) unnamed_addr #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.lr.ph, %.loopexit
  %indvars.iv1425 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next15, %.loopexit ]
  %scevgep31 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1425, i64 0
  %scevgep33 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1425, i64 2800
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv1022 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next11, %._crit_edge ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 0
  %scevgep29 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 2800
  %1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 %indvars.iv1425
  %bound0 = icmp ult i32* %scevgep, %1
  %bound1 = icmp ult i32* %1, %scevgep29
  %found.conflict = and i1 %bound0, %bound1
  %bound036 = icmp ult i32* %scevgep, %scevgep33
  %bound137 = icmp ult i32* %scevgep31, %scevgep29
  %found.conflict38 = and i1 %bound036, %bound137
  %conflict.rdx = or i1 %found.conflict, %found.conflict38
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.lr.ph
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 %index
  %3 = bitcast i32* %2 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !1, !noalias !4
  %4 = getelementptr i32, i32* %2, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load40 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = load i32, i32* %1, align 4, !alias.scope !7
  %7 = insertelement <4 x i32> undef, i32 %6, i32 0
  %8 = shufflevector <4 x i32> %7, <4 x i32> undef, <4 x i32> zeroinitializer
  %9 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1425, i64 %index
  %10 = bitcast i32* %9 to <4 x i32>*
  %wide.load41 = load <4 x i32>, <4 x i32>* %10, align 4, !alias.scope !8
  %11 = getelementptr i32, i32* %9, i64 4
  %12 = bitcast i32* %11 to <4 x i32>*
  %wide.load42 = load <4 x i32>, <4 x i32>* %12, align 4, !alias.scope !8
  %13 = add nsw <4 x i32> %8, %wide.load41
  %14 = add nsw <4 x i32> %8, %wide.load42
  %15 = icmp slt <4 x i32> %wide.load, %13
  %16 = icmp slt <4 x i32> %wide.load40, %14
  %17 = select <4 x i1> %15, <4 x i32> %wide.load, <4 x i32> %13
  %18 = select <4 x i1> %16, <4 x i32> %wide.load40, <4 x i32> %14
  store <4 x i32> %17, <4 x i32>* %3, align 4, !alias.scope !1, !noalias !4
  store <4 x i32> %18, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %19 = icmp eq i64 %index.next, 2800
  br i1 %19, label %._crit_edge.loopexit44, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv18 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.1, %scalar.ph ]
  %20 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 %indvars.iv18
  %21 = load i32, i32* %20, align 4
  %22 = load i32, i32* %1, align 4
  %23 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1425, i64 %indvars.iv18
  %24 = load i32, i32* %23, align 4
  %25 = add nsw i32 %22, %24
  %26 = icmp slt i32 %21, %25
  %. = select i1 %26, i32 %21, i32 %25
  store i32 %., i32* %20, align 4
  %indvars.iv.next = or i64 %indvars.iv18, 1
  %27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1022, i64 %indvars.iv.next
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %1, align 4
  %30 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv1425, i64 %indvars.iv.next
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %29, %31
  %33 = icmp slt i32 %28, %32
  %..1 = select i1 %33, i32 %28, i32 %32
  store i32 %..1, i32* %27, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit44:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit44, %._crit_edge.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1022, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 2800
  br i1 %exitcond13, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1425, 1
  %exitcond = icmp ne i64 %indvars.iv.next15, 2800
  br i1 %exitcond, label %._crit_edge.preheader, label %.loopexit43

.loopexit43:                                      ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly) unnamed_addr #0 {
.lr.ph13:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph13, %.loopexit
  %indvars.iv410 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next5, %.loopexit ]
  %5 = mul nuw nsw i64 %indvars.iv410, 2800
  br label %6

; <label>:6:                                      ; preds = %.lr.ph, %._crit_edge
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv410, i64 %indvars.iv7
  %15 = load i32, i32* %14, align 4
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit, label %6

.loopexit:                                        ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv410, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next5, 2800
  br i1 %exitcond16, label %.lr.ph, label %.loopexit15

.loopexit15:                                      ; preds = %.loopexit
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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

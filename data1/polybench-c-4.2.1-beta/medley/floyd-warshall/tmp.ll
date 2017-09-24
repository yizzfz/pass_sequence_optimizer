; ModuleID = 'B.ll'
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
  %10 = bitcast i8* %3 to [2800 x i32]*
  call fastcc void @print_array([2800 x i32]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %6, %2
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %1
  %indvars.iv15 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  br label %2

; <label>:2:                                      ; preds = %._crit_edge14, %._crit_edge
  %indvars.iv4 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge14 ]
  %3 = mul nuw nsw i64 %indvars.iv15, %indvars.iv4
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv15, i64 %indvars.iv4
  %8 = add nuw nsw i64 %indvars.iv15, %indvars.iv4
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 13
  %11 = icmp eq i32 %10, 0
  %12 = trunc i64 %8 to i32
  %13 = srem i32 %12, 7
  %14 = icmp eq i32 %13, 0
  %or.cond = or i1 %11, %14
  %15 = trunc i64 %8 to i32
  %16 = srem i32 %15, 11
  %17 = icmp eq i32 %16, 0
  %or.cond13 = or i1 %or.cond, %17
  br i1 %or.cond13, label %18, label %._crit_edge14

; <label>:18:                                     ; preds = %2
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %18, %2
  %storemerge = phi i32 [ 999, %18 ], [ %6, %2 ]
  store i32 %storemerge, i32* %7, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %19, label %2

; <label>:19:                                     ; preds = %._crit_edge14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2800
  br i1 %exitcond3, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %41, %1
  %indvars.iv17 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %41 ]
  %scevgep11 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv17, i64 0
  %2 = add nuw i64 %indvars.iv17, 1
  %scevgep13 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %2, i64 0
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv6 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next, %._crit_edge ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 0
  %3 = add nuw i64 %indvars.iv6, 1
  %scevgep9 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %3, i64 0
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv17
  %bound0 = icmp ult i32* %scevgep, %4
  %bound1 = icmp ult i32* %4, %scevgep9
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult i32* %scevgep, %scevgep13
  %bound117 = icmp ult i32* %scevgep11, %scevgep9
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %._crit_edge4.scalar.ph_crit_edge, label %._crit_edge4.vector.body_crit_edge

._crit_edge4.vector.body_crit_edge:               ; preds = %._crit_edge4
  br label %vector.body

._crit_edge4.scalar.ph_crit_edge:                 ; preds = %._crit_edge4
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %._crit_edge4.vector.body_crit_edge
  %index = phi i64 [ 0, %._crit_edge4.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %index
  %6 = bitcast i32* %5 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %6, align 4, !alias.scope !1, !noalias !4
  %7 = getelementptr i32, i32* %5, i64 4
  %8 = bitcast i32* %7 to <4 x i32>*
  %wide.load20 = load <4 x i32>, <4 x i32>* %8, align 4, !alias.scope !1, !noalias !4
  %9 = load i32, i32* %4, align 4, !alias.scope !7
  %10 = insertelement <4 x i32> undef, i32 %9, i32 0
  %11 = shufflevector <4 x i32> %10, <4 x i32> undef, <4 x i32> zeroinitializer
  %12 = insertelement <4 x i32> undef, i32 %9, i32 0
  %13 = shufflevector <4 x i32> %12, <4 x i32> undef, <4 x i32> zeroinitializer
  %14 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv17, i64 %index
  %15 = bitcast i32* %14 to <4 x i32>*
  %wide.load21 = load <4 x i32>, <4 x i32>* %15, align 4, !alias.scope !8
  %16 = getelementptr i32, i32* %14, i64 4
  %17 = bitcast i32* %16 to <4 x i32>*
  %wide.load22 = load <4 x i32>, <4 x i32>* %17, align 4, !alias.scope !8
  %18 = add nsw <4 x i32> %11, %wide.load21
  %19 = add nsw <4 x i32> %13, %wide.load22
  %20 = icmp slt <4 x i32> %wide.load, %18
  %21 = icmp slt <4 x i32> %wide.load20, %19
  %22 = select <4 x i1> %20, <4 x i32> %wide.load, <4 x i32> %18
  %23 = select <4 x i1> %21, <4 x i32> %wide.load20, <4 x i32> %19
  %24 = bitcast i32* %5 to <4 x i32>*
  store <4 x i32> %22, <4 x i32>* %24, align 4, !alias.scope !1, !noalias !4
  %25 = bitcast i32* %7 to <4 x i32>*
  store <4 x i32> %23, <4 x i32>* %25, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %26 = icmp eq i64 %index.next, 2800
  br i1 %26, label %._crit_edge.loopexit23, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %._crit_edge4.scalar.ph_crit_edge
  %indvars.iv25 = phi i64 [ 0, %._crit_edge4.scalar.ph_crit_edge ], [ %indvars.iv.next3.1, %scalar.ph ]
  %27 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv25
  %28 = load i32, i32* %27, align 4
  %29 = load i32, i32* %4, align 4
  %30 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv17, i64 %indvars.iv25
  %31 = load i32, i32* %30, align 4
  %32 = add nsw i32 %29, %31
  %33 = icmp slt i32 %28, %32
  %. = select i1 %33, i32 %28, i32 %32
  store i32 %., i32* %27, align 4
  %indvars.iv.next3 = or i64 %indvars.iv25, 1
  %34 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv6, i64 %indvars.iv.next3
  %35 = load i32, i32* %34, align 4
  %36 = load i32, i32* %4, align 4
  %37 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv17, i64 %indvars.iv.next3
  %38 = load i32, i32* %37, align 4
  %39 = add nsw i32 %36, %38
  %40 = icmp slt i32 %35, %39
  %..1 = select i1 %40, i32 %35, i32 %39
  store i32 %..1, i32* %34, align 4
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next3.1, 2800
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge.loopexit:                             ; preds = %scalar.ph
  br label %._crit_edge

._crit_edge.loopexit23:                           ; preds = %vector.body
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit23, %._crit_edge.loopexit
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond3, label %41, label %._crit_edge4

; <label>:41:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2800
  br i1 %exitcond4, label %42, label %.._crit_edge_crit_edge

; <label>:42:                                     ; preds = %41
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2800
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load i32, i32* %15, align 4
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond3, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2800
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

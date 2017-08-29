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
  %4 = bitcast i8* %3 to [2800 x i32]*
  tail call void @init_array([2800 x i32]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_floyd_warshall([2800 x i32]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  %10 = bitcast i8* %3 to [2800 x i32]*
  tail call void @print_array([2800 x i32]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2800 x i32]*) #2 {
.preheader.lr.ph.split.us:
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %.preheader.lr.ph.split.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph.split.us ]
  %storemerge6.us = phi i32 [ %19, %.loopexit.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph.split.us ]
  %1 = trunc i64 %indvars.iv17 to i32
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15.._crit_edge16_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15.._crit_edge16_crit_edge ]
  %2 = phi i32 [ %storemerge6.us, %.preheader.us ], [ %1, %._crit_edge15.._crit_edge16_crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %4 = mul nsw i32 %2, %3
  %5 = srem i32 %4, 7
  %6 = add nsw i32 %5, 1
  %7 = sext i32 %2 to i64
  %8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %7, i64 %indvars.iv
  store i32 %6, i32* %8, align 4
  %9 = add nuw nsw i64 %indvars.iv, %indvars.iv17
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 13
  %12 = icmp eq i32 %11, 0
  %13 = srem i32 %10, 7
  %14 = icmp eq i32 %13, 0
  %or.cond.us = or i1 %12, %14
  %15 = srem i32 %10, 11
  %16 = icmp eq i32 %15, 0
  %or.cond3.us = or i1 %16, %or.cond.us
  br i1 %or.cond3.us, label %17, label %._crit_edge16.._crit_edge15_crit_edge

._crit_edge16.._crit_edge15_crit_edge:            ; preds = %._crit_edge16
  br label %._crit_edge15

; <label>:17:                                     ; preds = %._crit_edge16
  %18 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv17, i64 %indvars.iv
  store i32 999, i32* %18, align 4
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge16.._crit_edge15_crit_edge, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge15.._crit_edge16_crit_edge

._crit_edge15.._crit_edge16_crit_edge:            ; preds = %._crit_edge15
  br label %._crit_edge16

.loopexit.us:                                     ; preds = %._crit_edge15
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 2800
  br i1 %exitcond19, label %._crit_edge, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  %19 = trunc i64 %indvars.iv.next18 to i32
  br label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall([2800 x i32]*) #2 {
.preheader1.lr.ph:
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.loopexit5.us-lcssa.us.us..preheader1.us_crit_edge, %.preheader1.lr.ph
  %indvars.iv24 = phi i64 [ 0, %.preheader1.lr.ph ], [ %indvars.iv.next25, %.loopexit5.us-lcssa.us.us..preheader1.us_crit_edge ]
  %scevgep4 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 0
  %1 = add nuw nsw i64 %indvars.iv24, 1
  %scevgep6 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %1, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.loopexit.us.us..preheader.us.us_crit_edge, %.preheader1.us
  %indvars.iv22 = phi i64 [ 0, %.preheader1.us ], [ %indvars.iv.next23, %.loopexit.us.us..preheader.us.us_crit_edge ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 0
  %2 = add nuw nsw i64 %indvars.iv22, 1
  %scevgep2 = getelementptr [2800 x i32], [2800 x i32]* %0, i64 %2, i64 0
  %3 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %indvars.iv24
  %bound0 = icmp ult i32* %scevgep, %3
  %bound1 = icmp ult i32* %3, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult i32* %scevgep, %scevgep6
  %bound110 = icmp ult i32* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %4 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %index
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = getelementptr i32, i32* %4, i64 4
  %7 = bitcast i32* %6 to <4 x i32>*
  %wide.load13 = load <4 x i32>, <4 x i32>* %7, align 4, !alias.scope !1, !noalias !4
  %8 = load i32, i32* %3, align 4, !alias.scope !7
  %9 = insertelement <4 x i32> undef, i32 %8, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = insertelement <4 x i32> undef, i32 %8, i32 0
  %12 = shufflevector <4 x i32> %11, <4 x i32> undef, <4 x i32> zeroinitializer
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 %index
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load14 = load <4 x i32>, <4 x i32>* %14, align 4, !alias.scope !8
  %15 = getelementptr i32, i32* %13, i64 4
  %16 = bitcast i32* %15 to <4 x i32>*
  %wide.load15 = load <4 x i32>, <4 x i32>* %16, align 4, !alias.scope !8
  %17 = add nsw <4 x i32> %wide.load14, %10
  %18 = add nsw <4 x i32> %wide.load15, %12
  %19 = icmp slt <4 x i32> %wide.load, %17
  %20 = icmp slt <4 x i32> %wide.load13, %18
  %21 = select <4 x i1> %19, <4 x i32> %wide.load, <4 x i32> %17
  %22 = select <4 x i1> %20, <4 x i32> %wide.load13, <4 x i32> %18
  %23 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> %21, <4 x i32>* %23, align 4, !alias.scope !1, !noalias !4
  %24 = bitcast i32* %6 to <4 x i32>*
  store <4 x i32> %22, <4 x i32>* %24, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %25 = icmp eq i64 %index.next, 2800
  br i1 %25, label %.loopexit.us.us.loopexit16, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

.loopexit.us.us.loopexit:                         ; preds = %scalar.ph
  br label %.loopexit.us.us

.loopexit.us.us.loopexit16:                       ; preds = %vector.body
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit16, %.loopexit.us.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 2800
  br i1 %exitcond26, label %.loopexit5.us-lcssa.us.us, label %.loopexit.us.us..preheader.us.us_crit_edge

.loopexit.us.us..preheader.us.us_crit_edge:       ; preds = %.loopexit.us.us
  br label %.preheader.us.us

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next.1, %scalar.ph.scalar.ph_crit_edge ]
  %26 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %27 = load i32, i32* %26, align 4
  %28 = load i32, i32* %3, align 4
  %29 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 %indvars.iv
  %30 = load i32, i32* %29, align 4
  %31 = add nsw i32 %30, %28
  %32 = icmp slt i32 %27, %31
  %..us.us = select i1 %32, i32 %27, i32 %31
  store i32 %..us.us, i32* %26, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %33 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv22, i64 %indvars.iv.next
  %34 = load i32, i32* %33, align 4
  %35 = load i32, i32* %3, align 4
  %36 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv24, i64 %indvars.iv.next
  %37 = load i32, i32* %36, align 4
  %38 = add nsw i32 %37, %35
  %39 = icmp slt i32 %34, %38
  %..us.us.1 = select i1 %39, i32 %34, i32 %38
  store i32 %..us.us.1, i32* %33, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2799
  br i1 %exitcond.1, label %.loopexit.us.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !12

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br label %scalar.ph

.loopexit5.us-lcssa.us.us:                        ; preds = %.loopexit.us.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 2800
  br i1 %exitcond27, label %._crit_edge, label %.loopexit5.us-lcssa.us.us..preheader1.us_crit_edge

.loopexit5.us-lcssa.us.us..preheader1.us_crit_edge: ; preds = %.loopexit5.us-lcssa.us.us
  br label %.preheader1.us

._crit_edge:                                      ; preds = %.loopexit5.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2800 x i32]*) #0 {
..preheader.us_crit_edge:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us..preheader.us_crit_edge, %..preheader.us_crit_edge
  %indvars.iv4 = phi i64 [ 0, %..preheader.us_crit_edge ], [ %indvars.iv.next5, %.loopexit.us..preheader.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 2800
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge.._crit_edge3_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.._crit_edge3_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge3.._crit_edge_crit_edge

._crit_edge3.._crit_edge_crit_edge:               ; preds = %._crit_edge3
  br label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3.._crit_edge_crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2800 x i32], [2800 x i32]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load i32, i32* %13, align 4
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge.._crit_edge3_crit_edge

._crit_edge.._crit_edge3_crit_edge:               ; preds = %._crit_edge
  br label %._crit_edge3

.loopexit.us:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 2800
  br i1 %exitcond6, label %.loopexit2, label %.loopexit.us..preheader.us_crit_edge

.loopexit.us..preheader.us_crit_edge:             ; preds = %.loopexit.us
  br label %.preheader.us

.loopexit2:                                       ; preds = %.loopexit.us
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

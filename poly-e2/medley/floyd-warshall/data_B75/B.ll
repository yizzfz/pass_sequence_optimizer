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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %arraydecay = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @init_array([2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_floyd_warshall([2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([2800 x i32]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end.for.cond1.preheader_crit_edge, %entry
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.end.for.cond1.preheader_crit_edge ], [ 0, %entry ]
  %inc216 = phi i32 [ %inc21, %for.end.for.cond1.preheader_crit_edge ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv9 to i32
  br label %for.body3

for.body3:                                        ; preds = %if.end.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %if.end.for.body3_crit_edge ]
  %1 = phi i32 [ %inc216, %for.cond1.preheader ], [ %0, %if.end.for.body3_crit_edge ]
  %2 = trunc i64 %indvars.iv to i32
  %mul = mul nsw i32 %1, %2
  %rem = srem i32 %mul, 7
  %add = add nsw i32 %rem, 1
  %idxprom = sext i32 %1 to i64
  %arrayidx5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %idxprom, i64 %indvars.iv
  store i32 %add, i32* %arrayidx5, align 4
  %3 = add nsw i64 %indvars.iv, %indvars.iv9
  %4 = trunc i64 %3 to i32
  %rem7 = srem i32 %4, 13
  %cmp8 = icmp eq i32 %rem7, 0
  %rem10 = srem i32 %4, 7
  %cmp11 = icmp eq i32 %rem10, 0
  %or.cond = or i1 %cmp8, %cmp11
  %rem14 = srem i32 %4, 11
  %cmp15 = icmp eq i32 %rem14, 0
  %or.cond1 = or i1 %cmp15, %or.cond
  br i1 %or.cond1, label %if.then, label %for.body3.if.end_crit_edge

for.body3.if.end_crit_edge:                       ; preds = %for.body3
  br label %if.end

if.then:                                          ; preds = %for.body3
  %arrayidx19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv9, i64 %indvars.iv
  store i32 999, i32* %arrayidx19, align 4
  br label %if.end

if.end:                                           ; preds = %for.body3.if.end_crit_edge, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.end, label %if.end.for.body3_crit_edge

if.end.for.body3_crit_edge:                       ; preds = %if.end
  br label %for.body3

for.end:                                          ; preds = %if.end
  %indvars.iv.next10 = add nuw i64 %indvars.iv9, 1
  %cmp = icmp slt i64 %indvars.iv.next10, 2800
  br i1 %cmp, label %for.end.for.cond1.preheader_crit_edge, label %for.end22

for.end.for.cond1.preheader_crit_edge:            ; preds = %for.end
  %inc21 = add nuw nsw i32 %inc216, 1
  br label %for.cond1.preheader

for.end22:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end37.for.cond1.preheader_crit_edge, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end37.for.cond1.preheader_crit_edge ]
  %scevgep4 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv6, i64 0
  %0 = add nuw nsw i64 %indvars.iv6, 1
  %scevgep6 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %0, i64 0
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.end.for.cond4.preheader_crit_edge ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv4, i64 0
  %1 = add nuw nsw i64 %indvars.iv4, 1
  %scevgep2 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %1, i64 0
  %arrayidx12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv4, i64 %indvars.iv6
  %bound0 = icmp ult i32* %scevgep, %arrayidx12
  %bound1 = icmp ult i32* %arrayidx12, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult i32* %scevgep, %scevgep6
  %bound110 = icmp ult i32* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body6.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond4.preheader
  br label %vector.body

for.body6.preheader:                              ; preds = %for.cond4.preheader
  br label %for.body6

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv4, i64 %index
  %3 = bitcast i32* %2 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !1, !noalias !4
  %4 = getelementptr i32, i32* %2, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load13 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = load i32, i32* %arrayidx12, align 4, !alias.scope !7
  %7 = insertelement <4 x i32> undef, i32 %6, i32 0
  %8 = shufflevector <4 x i32> %7, <4 x i32> undef, <4 x i32> zeroinitializer
  %9 = insertelement <4 x i32> undef, i32 %6, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv6, i64 %index
  %12 = bitcast i32* %11 to <4 x i32>*
  %wide.load14 = load <4 x i32>, <4 x i32>* %12, align 4, !alias.scope !8
  %13 = getelementptr i32, i32* %11, i64 4
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load15 = load <4 x i32>, <4 x i32>* %14, align 4, !alias.scope !8
  %15 = add nsw <4 x i32> %wide.load14, %8
  %16 = add nsw <4 x i32> %wide.load15, %10
  %17 = icmp slt <4 x i32> %wide.load, %15
  %18 = icmp slt <4 x i32> %wide.load13, %16
  %19 = select <4 x i1> %17, <4 x i32> %wide.load, <4 x i32> %15
  %20 = select <4 x i1> %18, <4 x i32> %wide.load13, <4 x i32> %16
  %21 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> %19, <4 x i32>* %21, align 4, !alias.scope !1, !noalias !4
  %22 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> %20, <4 x i32>* %22, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %23 = icmp eq i64 %index.next, 2800
  br i1 %23, label %for.end.loopexit16, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.body6:                                        ; preds = %for.body6.preheader, %for.body6.for.body6_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.for.body6_crit_edge ], [ 0, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv4, i64 %indvars.iv
  %24 = load i32, i32* %arrayidx8, align 4
  %25 = load i32, i32* %arrayidx12, align 4
  %arrayidx16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv6, i64 %indvars.iv
  %26 = load i32, i32* %arrayidx16, align 4
  %add = add nsw i32 %26, %25
  %cmp17 = icmp slt i32 %24, %add
  %.add = select i1 %cmp17, i32 %24, i32 %add
  store i32 %.add, i32* %arrayidx8, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2799
  br i1 %exitcond, label %for.end.loopexit, label %for.body6.for.body6_crit_edge, !llvm.loop !12

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end.loopexit16:                               ; preds = %vector.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit16, %for.end.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next5, 2800
  br i1 %exitcond17, label %for.end37, label %for.end.for.cond4.preheader_crit_edge

for.end.for.cond4.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond4.preheader

for.end37:                                        ; preds = %for.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next7, 2800
  br i1 %exitcond18, label %for.end40, label %for.end37.for.cond1.preheader_crit_edge

for.end37.for.cond1.preheader_crit_edge:          ; preds = %for.end37
  br label %for.cond1.preheader

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2800 x i32]* nocapture readonly %path) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end.for.cond2.preheader_crit_edge, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv2, 2800
  br label %for.body4

for.body4:                                        ; preds = %if.end.for.body4_crit_edge, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end.for.body4_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.body4.if.end_crit_edge

for.body4.if.end_crit_edge:                       ; preds = %for.body4
  br label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx8, align 4
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.end, label %if.end.for.body4_crit_edge

if.end.for.body4_crit_edge:                       ; preds = %if.end
  br label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2800
  br i1 %exitcond1, label %for.end12, label %for.end.for.cond2.preheader_crit_edge

for.end.for.cond2.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

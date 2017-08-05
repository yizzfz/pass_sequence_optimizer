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
  tail call fastcc void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture %path) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc20.us, %for.cond1.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next13, %for.inc20.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv12, i64 %indvars.iv
  %0 = add nuw nsw i64 %indvars.iv, %indvars.iv12
  %1 = trunc i64 %0 to i32
  %rem7.us = srem i32 %1, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %rem10.us = srem i32 %1, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond = or i1 %cmp8.us, %cmp11.us
  %rem14.us = srem i32 %1, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond14 = or i1 %or.cond, %cmp15.us
  br i1 %or.cond14, label %for.inc.us, label %for.body3.us.for.inc.us_crit_edge

for.body3.us.for.inc.us_crit_edge:                ; preds = %for.body3.us
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 7
  %add.us = add nsw i32 %rem.us, 1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body3.us, %for.body3.us.for.inc.us_crit_edge
  %storemerge = phi i32 [ %add.us, %for.body3.us.for.inc.us_crit_edge ], [ 999, %for.body3.us ]
  store i32 %storemerge, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc20.us, label %for.body3.us

for.inc20.us:                                     ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 2800
  br i1 %exitcond15, label %for.end22, label %for.cond1.preheader.us

for.end22:                                        ; preds = %for.inc20.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32 %n, [2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc35.us.us.for.inc38.us_crit_edge, %entry
  %indvars.iv59 = phi i64 [ 0, %entry ], [ %indvars.iv.next60, %for.inc35.us.us.for.inc38.us_crit_edge ]
  %scevgep66 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 0
  %0 = add nuw nsw i64 %indvars.iv59, 1
  %scevgep68 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %0, i64 0
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us.us:                        ; preds = %for.inc35.us.us, %for.cond1.preheader.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc35.us.us ], [ 0, %for.cond1.preheader.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 0
  %1 = add nuw nsw i64 %indvars.iv57, 1
  %scevgep64 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %1, i64 0
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv59
  %bound0 = icmp ult i32* %scevgep, %arrayidx12.us.us
  %bound1 = icmp ult i32* %arrayidx12.us.us, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  %bound071 = icmp ult i32* %scevgep, %scevgep68
  %bound172 = icmp ult i32* %scevgep66, %scevgep64
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx = or i1 %found.conflict, %found.conflict73
  br i1 %conflict.rdx, label %for.body6.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond4.preheader.us.us
  br label %vector.body

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us.us
  br label %for.body6.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %2 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %index
  %3 = bitcast i32* %2 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %3, align 4, !alias.scope !1, !noalias !4
  %4 = getelementptr i32, i32* %2, i64 4
  %5 = bitcast i32* %4 to <4 x i32>*
  %wide.load75 = load <4 x i32>, <4 x i32>* %5, align 4, !alias.scope !1, !noalias !4
  %6 = load i32, i32* %arrayidx12.us.us, align 4, !alias.scope !7
  %7 = insertelement <4 x i32> undef, i32 %6, i32 0
  %8 = shufflevector <4 x i32> %7, <4 x i32> undef, <4 x i32> zeroinitializer
  %9 = insertelement <4 x i32> undef, i32 %6, i32 0
  %10 = shufflevector <4 x i32> %9, <4 x i32> undef, <4 x i32> zeroinitializer
  %11 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %index
  %12 = bitcast i32* %11 to <4 x i32>*
  %wide.load76 = load <4 x i32>, <4 x i32>* %12, align 4, !alias.scope !8
  %13 = getelementptr i32, i32* %11, i64 4
  %14 = bitcast i32* %13 to <4 x i32>*
  %wide.load77 = load <4 x i32>, <4 x i32>* %14, align 4, !alias.scope !8
  %15 = add nsw <4 x i32> %wide.load76, %8
  %16 = add nsw <4 x i32> %wide.load77, %10
  %17 = icmp slt <4 x i32> %wide.load, %15
  %18 = icmp slt <4 x i32> %wide.load75, %16
  %19 = select <4 x i1> %17, <4 x i32> %wide.load, <4 x i32> %15
  %20 = select <4 x i1> %18, <4 x i32> %wide.load75, <4 x i32> %16
  %21 = bitcast i32* %2 to <4 x i32>*
  store <4 x i32> %19, <4 x i32>* %21, align 4, !alias.scope !1, !noalias !4
  %22 = bitcast i32* %4 to <4 x i32>*
  store <4 x i32> %20, <4 x i32>* %22, align 4, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 8
  %23 = icmp eq i64 %index.next, 2800
  br i1 %23, label %for.inc35.us.us.loopexit78, label %vector.body, !llvm.loop !9

for.inc35.us.us.loopexit:                         ; preds = %for.body6.us.us
  br label %for.inc35.us.us

for.inc35.us.us.loopexit78:                       ; preds = %vector.body
  br label %for.inc35.us.us

for.inc35.us.us:                                  ; preds = %for.inc35.us.us.loopexit78, %for.inc35.us.us.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next58, 2800
  br i1 %exitcond61, label %for.inc35.us.us.for.inc38.us_crit_edge, label %for.cond4.preheader.us.us

for.inc35.us.us.for.inc38.us_crit_edge:           ; preds = %for.inc35.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 2800
  br i1 %exitcond62, label %for.end40, label %for.cond1.preheader.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body6.us.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next.1, %for.body6.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv
  %24 = load i32, i32* %arrayidx8.us.us, align 4
  %25 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %indvars.iv
  %26 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %26, %25
  %cmp17.us.us = icmp slt i32 %24, %add.us.us
  %.add.us.us = select i1 %cmp17.us.us, i32 %24, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv.next
  %27 = load i32, i32* %arrayidx8.us.us.1, align 4
  %28 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %indvars.iv.next
  %29 = load i32, i32* %arrayidx16.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %29, %28
  %cmp17.us.us.1 = icmp slt i32 %27, %add.us.us.1
  %.add.us.us.1 = select i1 %cmp17.us.us.1, i32 %27, i32 %add.us.us.1
  store i32 %.add.us.us.1, i32* %arrayidx8.us.us.1, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %for.inc35.us.us.loopexit, label %for.body6.us.us, !llvm.loop !12

for.end40:                                        ; preds = %for.inc35.us.us.for.inc38.us_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2800 x i32]* nocapture readonly %path) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2800
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 2800
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

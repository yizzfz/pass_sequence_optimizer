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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
  %arraydecay3 = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @print_array(i32 2800, [2800 x i32]* %arraydecay3)
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
  %0 = mul nuw nsw i64 %indvars.iv, %indvars.iv12
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 7
  %add.us = add nsw i32 %rem.us, 1
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv12, i64 %indvars.iv
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv12
  %3 = trunc i64 %2 to i32
  %rem7.us = srem i32 %3, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %rem10.us = srem i32 %3, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond = or i1 %cmp8.us, %cmp11.us
  %rem14.us = srem i32 %3, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond2 = or i1 %or.cond, %cmp15.us
  br i1 %or.cond2, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body3.us
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body3.us, %if.then.us
  %storemerge = phi i32 [ 999, %if.then.us ], [ %add.us, %for.body3.us ]
  store i32 %storemerge, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc20.us, label %for.body3.us

for.inc20.us:                                     ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next13, 2800
  br i1 %exitcond1, label %for.end22, label %for.cond1.preheader.us

for.end22:                                        ; preds = %for.inc20.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall(i32 %n, [2800 x i32]* %path) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.end40

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %entry
  %0 = sext i32 %n to i64
  %min.iters.check = icmp ult i32 %n, 8
  %n.vec = and i64 %0, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc35.us.us.for.inc38.us_crit_edge, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv59 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next60, %for.inc35.us.us.for.inc38.us_crit_edge ]
  %scevgep64 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 0
  %scevgep66 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %0
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us.us:                        ; preds = %for.inc35.us.us, %for.cond1.preheader.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc35.us.us ], [ 0, %for.cond1.preheader.us ]
  %scevgep = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 0
  %scevgep62 = getelementptr [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %0
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv59
  br i1 %min.iters.check, label %for.body6.us.us.preheader, label %min.iters.checked

for.body6.us.us.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us.us ], [ %n.vec, %middle.block ]
  br label %for.body6.us.us

min.iters.checked:                                ; preds = %for.cond4.preheader.us.us
  br i1 %cmp.zero, label %for.body6.us.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult i32* %scevgep, %arrayidx12.us.us
  %bound1 = icmp ult i32* %arrayidx12.us.us, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound069 = icmp ult i32* %scevgep, %scevgep66
  %bound170 = icmp ult i32* %scevgep64, %scevgep62
  %found.conflict71 = and i1 %bound069, %bound170
  %conflict.rdx = or i1 %found.conflict, %found.conflict71
  br i1 %conflict.rdx, label %for.body6.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %index
  %2 = bitcast i32* %1 to <4 x i32>*
  %wide.load = load <4 x i32>, <4 x i32>* %2, align 4, !alias.scope !1, !noalias !4
  %3 = getelementptr i32, i32* %1, i64 4
  %4 = bitcast i32* %3 to <4 x i32>*
  %wide.load73 = load <4 x i32>, <4 x i32>* %4, align 4, !alias.scope !1, !noalias !4
  %5 = load i32, i32* %arrayidx12.us.us, align 4, !alias.scope !7
  %6 = insertelement <4 x i32> undef, i32 %5, i32 0
  %7 = shufflevector <4 x i32> %6, <4 x i32> undef, <4 x i32> zeroinitializer
  %8 = insertelement <4 x i32> undef, i32 %5, i32 0
  %9 = shufflevector <4 x i32> %8, <4 x i32> undef, <4 x i32> zeroinitializer
  %10 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %index
  %11 = bitcast i32* %10 to <4 x i32>*
  %wide.load74 = load <4 x i32>, <4 x i32>* %11, align 4, !alias.scope !8
  %12 = getelementptr i32, i32* %10, i64 4
  %13 = bitcast i32* %12 to <4 x i32>*
  %wide.load75 = load <4 x i32>, <4 x i32>* %13, align 4, !alias.scope !8
  %14 = add nsw <4 x i32> %wide.load74, %7
  %15 = add nsw <4 x i32> %wide.load75, %9
  %16 = icmp slt <4 x i32> %wide.load, %14
  %17 = icmp slt <4 x i32> %wide.load73, %15
  %predphi = select <4 x i1> %16, <4 x i32> %wide.load, <4 x i32> %14
  %predphi76 = select <4 x i1> %17, <4 x i32> %wide.load73, <4 x i32> %15
  %18 = bitcast i32* %1 to <4 x i32>*
  store <4 x i32> %predphi, <4 x i32>* %18, align 4, !alias.scope !1, !noalias !4
  %19 = bitcast i32* %3 to <4 x i32>*
  store <4 x i32> %predphi76, <4 x i32>* %19, align 4, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 8
  %20 = icmp eq i64 %index.next, %n.vec
  br i1 %20, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc35.us.us, label %for.body6.us.us.preheader

for.inc35.us.us.loopexit:                         ; preds = %for.body6.us.us
  br label %for.inc35.us.us

for.inc35.us.us:                                  ; preds = %for.inc35.us.us.loopexit, %middle.block
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %0
  br i1 %exitcond, label %for.inc35.us.us.for.inc38.us_crit_edge, label %for.cond4.preheader.us.us

for.inc35.us.us.for.inc38.us_crit_edge:           ; preds = %for.inc35.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next60, %0
  br i1 %exitcond79, label %for.end40.loopexit, label %for.cond1.preheader.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.us.us ], [ %indvars.iv.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv
  %21 = load i32, i32* %arrayidx8.us.us, align 4
  %22 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv59, i64 %indvars.iv
  %23 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %23, %22
  %cmp17.us.us = icmp slt i32 %21, %add.us.us
  %.add.us.us = select i1 %cmp17.us.us, i32 %21, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp5.us.us = icmp slt i64 %indvars.iv.next, %0
  br i1 %cmp5.us.us, label %for.body6.us.us, label %for.inc35.us.us.loopexit, !llvm.loop !12

for.end40.loopexit:                               ; preds = %for.inc35.us.us.for.inc38.us_crit_edge
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2800 x i32]* %path) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge, label %for.end12

for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge: ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next11, %for.inc10.us ]
  %4 = mul nsw i64 %3, %indvars.iv10
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv10, i64 %indvars.iv
  %9 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %3
  br i1 %exitcond13, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

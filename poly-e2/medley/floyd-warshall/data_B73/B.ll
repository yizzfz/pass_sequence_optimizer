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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #4
  %arraydecay = bitcast i8* %call to [2800 x i32]*
  tail call void @init_array([2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_floyd_warshall([2800 x i32]* %arraydecay)
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
  tail call void @print_array([2800 x i32]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2800 x i32]* nocapture %path) #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc20.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv9 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next10, %for.inc20.us.for.cond1.preheader.us_crit_edge ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.inc.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.inc.us.for.body3.us_crit_edge ]
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv9, i64 %indvars.iv
  %0 = add nuw nsw i64 %indvars.iv, %indvars.iv9
  %1 = trunc i64 %0 to i32
  %rem7.us = srem i32 %1, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %rem10.us = srem i32 %1, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond = or i1 %cmp8.us, %cmp11.us
  %rem14.us = srem i32 %1, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond11 = or i1 %or.cond, %cmp15.us
  br i1 %or.cond11, label %for.body3.us.for.inc.us_crit_edge2, label %for.body3.us.for.inc.us_crit_edge

for.body3.us.for.inc.us_crit_edge2:               ; preds = %for.body3.us
  br label %for.inc.us

for.body3.us.for.inc.us_crit_edge:                ; preds = %for.body3.us
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv9
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 7
  %add.us = add nsw i32 %rem.us, 1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body3.us.for.inc.us_crit_edge2, %for.body3.us.for.inc.us_crit_edge
  %storemerge = phi i32 [ %add.us, %for.body3.us.for.inc.us_crit_edge ], [ 999, %for.body3.us.for.inc.us_crit_edge2 ]
  store i32 %storemerge, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc20.us, label %for.inc.us.for.body3.us_crit_edge

for.inc.us.for.body3.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body3.us

for.inc20.us:                                     ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next10, 2800
  br i1 %exitcond1, label %for.end22, label %for.inc20.us.for.cond1.preheader.us_crit_edge

for.inc20.us.for.cond1.preheader.us_crit_edge:    ; preds = %for.inc20.us
  br label %for.cond1.preheader.us

for.end22:                                        ; preds = %for.inc20.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_floyd_warshall([2800 x i32]* nocapture %path) #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  br label %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge

for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge: ; preds = %for.inc38.us.for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge_crit_edge, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv58 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next59, %for.inc38.us.for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge_crit_edge ]
  br label %for.cond4.preheader.us.us

for.inc38.us:                                     ; preds = %for.inc35.us.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next59, 2800
  br i1 %exitcond2, label %for.end40, label %for.inc38.us.for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge_crit_edge

for.inc38.us.for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge_crit_edge: ; preds = %for.inc38.us
  br label %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge

for.cond4.preheader.us.us:                        ; preds = %for.inc35.us.us.for.cond4.preheader.us.us_crit_edge, %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge
  %indvars.iv56 = phi i64 [ 0, %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge ], [ %indvars.iv.next57, %for.inc35.us.us.for.cond4.preheader.us.us_crit_edge ]
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv56, i64 %indvars.iv58
  br label %for.body6.us.us

for.inc35.us.us:                                  ; preds = %for.body6.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next57, 2800
  br i1 %exitcond1, label %for.inc38.us, label %for.inc35.us.us.for.cond4.preheader.us.us_crit_edge

for.inc35.us.us.for.cond4.preheader.us.us_crit_edge: ; preds = %for.inc35.us.us
  br label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next, %for.body6.us.us.for.body6.us.us_crit_edge ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv56, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx8.us.us, align 4
  %1 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv58, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %2, %1
  %cmp17.us.us = icmp slt i32 %0, %add.us.us
  %.add.us.us = select i1 %cmp17.us.us, i32 %0, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2799
  br i1 %exitcond, label %for.inc35.us.us, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6.us.us

for.end40:                                        ; preds = %for.inc38.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2800 x i32]* nocapture readonly %path) #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next10, %for.inc10.us.for.cond2.preheader.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv9, 2800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us.for.body4.us_crit_edge ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.inc10.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next10, 2800
  br i1 %exitcond1, label %for.end12, label %for.inc10.us.for.cond2.preheader.us_crit_edge

for.inc10.us.for.cond2.preheader.us_crit_edge:    ; preds = %for.inc10.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

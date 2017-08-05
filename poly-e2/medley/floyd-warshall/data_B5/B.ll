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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 7840000, i32 4) #3
  %arraydecay = bitcast i8* %call to [2800 x i32]*
  tail call void @init_array(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_floyd_warshall(i32 2800, [2800 x i32]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 2800, [2800 x i32]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, [2800 x i32]* %path) #0 {
entry:
  br i1 true, label %for.body.us.preheader, label %for.end22

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc20_crit_edge.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 7
  %add.us = add nsw i32 %rem.us, 1
  %arrayidx5.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv8, i64 %indvars.iv
  %2 = add nuw nsw i64 %indvars.iv, %indvars.iv8
  %3 = trunc i64 %2 to i32
  %rem7.us = srem i32 %3, 13
  %cmp8.us = icmp eq i32 %rem7.us, 0
  %rem10.us = srem i32 %3, 7
  %cmp11.us = icmp eq i32 %rem10.us, 0
  %or.cond = or i1 %cmp8.us, %cmp11.us
  %rem14.us = srem i32 %3, 11
  %cmp15.us = icmp eq i32 %rem14.us, 0
  %or.cond13 = or i1 %or.cond, %cmp15.us
  %.add.us = select i1 %or.cond13, i32 999, i32 %add.us
  store i32 %.add.us, i32* %arrayidx5.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 2800
  br i1 %exitcond11, label %for.end22.loopexit, label %for.body.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_floyd_warshall(i32 %n, [2800 x i32]* %path) #0 {
entry:
  br i1 true, label %for.body3.us.us.preheader.preheader, label %for.end40

for.body3.us.us.preheader.preheader:              ; preds = %entry
  br label %for.body3.us.us.preheader

for.body3.us.us.preheader:                        ; preds = %for.body3.us.us.preheader.preheader, %for.cond1.for.inc38_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.inc38_crit_edge.us ], [ 0, %for.body3.us.us.preheader.preheader ]
  %arrayidx16.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv60, i64 0
  br label %for.body3.us.us

for.cond1.for.inc38_crit_edge.us:                 ; preds = %for.cond4.for.inc35_crit_edge.us.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count59.pre-phi
  br i1 %exitcond63, label %for.end40.loopexit, label %for.body3.us.us.preheader

for.body3.us.us:                                  ; preds = %for.cond4.for.inc35_crit_edge.us.us, %for.body3.us.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next58, %for.cond4.for.inc35_crit_edge.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv60
  br i1 true, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  %arrayidx8.us.us.prol = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 0
  %0 = load i32, i32* %arrayidx8.us.us.prol, align 4
  %1 = load i32, i32* %arrayidx12.us.us, align 4
  %2 = load i32, i32* %arrayidx16.us.us.prol, align 4
  %add.us.us.prol = add nsw i32 %2, %1
  %cmp17.us.us.prol = icmp slt i32 %0, %add.us.us.prol
  %.add.us.us.prol = select i1 %cmp17.us.us.prol, i32 %0, i32 %add.us.us.prol
  store i32 %.add.us.us.prol, i32* %arrayidx8.us.us.prol, align 4
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body6.us.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol.preheader ], [ 0, %for.body3.us.us ]
  br i1 false, label %for.cond4.for.inc35_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br label %for.body6.us.us

for.cond4.for.inc35_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc35_crit_edge.us.us

for.cond4.for.inc35_crit_edge.us.us:              ; preds = %for.cond4.for.inc35_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count59.pre-phi = phi i64 [ 1, %for.body6.us.us.prol.loopexit.unr-lcssa ], [ 2800, %for.cond4.for.inc35_crit_edge.us.us.loopexit ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, %wide.trip.count59.pre-phi
  br i1 %exitcond, label %for.cond1.for.inc38_crit_edge.us, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv
  %3 = load i32, i32* %arrayidx8.us.us, align 4
  %4 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv60, i64 %indvars.iv
  %5 = load i32, i32* %arrayidx16.us.us, align 4
  %add.us.us = add nsw i32 %5, %4
  %cmp17.us.us = icmp slt i32 %3, %add.us.us
  %.add.us.us = select i1 %cmp17.us.us, i32 %3, i32 %add.us.us
  store i32 %.add.us.us, i32* %arrayidx8.us.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv57, i64 %indvars.iv.next
  %6 = load i32, i32* %arrayidx8.us.us.1, align 4
  %7 = load i32, i32* %arrayidx12.us.us, align 4
  %arrayidx16.us.us.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv60, i64 %indvars.iv.next
  %8 = load i32, i32* %arrayidx16.us.us.1, align 4
  %add.us.us.1 = add nsw i32 %8, %7
  %cmp17.us.us.1 = icmp slt i32 %6, %add.us.us.1
  %cond.us.us.1 = select i1 %cmp17.us.us.1, i32 %6, i32 %add.us.us.1
  store i32 %cond.us.us.1, i32* %arrayidx8.us.us.1, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2800
  br i1 %exitcond.1, label %for.cond4.for.inc35_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end40.loopexit:                               ; preds = %for.cond1.for.inc38_crit_edge.us
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [2800 x i32]* %path) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 2800, %indvars.iv8
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load i32, i32* %arrayidx8.us, align 4
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2800
  br i1 %exitcond12, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
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

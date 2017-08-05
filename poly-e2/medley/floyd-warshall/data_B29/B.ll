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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2800 x i32]*
  tail call fastcc void @print_array([2800 x i32]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end.for.cond1.preheader_crit_edge, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.end.for.cond1.preheader_crit_edge ]
  %inc213 = phi i32 [ 0, %entry ], [ %inc21, %for.end.for.cond1.preheader_crit_edge ]
  %0 = trunc i64 %indvars.iv to i32
  br label %for.body3

for.body3:                                        ; preds = %if.end, %for.cond1.preheader
  %1 = phi i32 [ %inc213, %for.cond1.preheader ], [ %0, %if.end ]
  %indvars.iv1 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %if.end ]
  %2 = trunc i64 %indvars.iv1 to i32
  %mul = mul nsw i32 %2, %1
  %rem = srem i32 %mul, 7
  %add = add nsw i32 %rem, 1
  %idxprom = sext i32 %1 to i64
  %arrayidx5 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %idxprom, i64 %indvars.iv1
  store i32 %add, i32* %arrayidx5, align 4
  %add6 = add nuw nsw i32 %0, %2
  %rem7 = srem i32 %add6, 13
  %cmp8 = icmp eq i32 %rem7, 0
  %rem10 = srem i32 %add6, 7
  %cmp11 = icmp eq i32 %rem10, 0
  %or.cond = or i1 %cmp8, %cmp11
  %rem14 = srem i32 %add6, 11
  %cmp15 = icmp eq i32 %rem14, 0
  %or.cond3 = or i1 %cmp15, %or.cond
  br i1 %or.cond3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body3
  %arrayidx19 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv, i64 %indvars.iv1
  store i32 999, i32* %arrayidx19, align 4
  br label %if.end

if.end:                                           ; preds = %for.body3, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2800
  br i1 %exitcond5, label %for.end22, label %for.end.for.cond1.preheader_crit_edge

for.end.for.cond1.preheader_crit_edge:            ; preds = %for.end
  %inc21 = add nuw nsw i32 %inc213, 1
  br label %for.cond1.preheader

for.end22:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_floyd_warshall([2800 x i32]* nocapture %path) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end37, %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next2, %for.end37 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.end ]
  %arrayidx12 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv5, i64 %indvars.iv17
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next8.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv5, i64 %indvars.iv
  %0 = load i32, i32* %arrayidx8, align 4
  %1 = load i32, i32* %arrayidx12, align 4
  %arrayidx16 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv17, i64 %indvars.iv
  %2 = load i32, i32* %arrayidx16, align 4
  %add = add nsw i32 %2, %1
  %cmp17 = icmp slt i32 %0, %add
  %.add = select i1 %cmp17, i32 %0, i32 %add
  store i32 %.add, i32* %arrayidx8, align 4
  %indvars.iv.next8 = or i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv5, i64 %indvars.iv.next8
  %3 = load i32, i32* %arrayidx8.1, align 4
  %4 = load i32, i32* %arrayidx12, align 4
  %arrayidx16.1 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv17, i64 %indvars.iv.next8
  %5 = load i32, i32* %arrayidx16.1, align 4
  %add.1 = add nsw i32 %5, %4
  %cmp17.1 = icmp slt i32 %3, %add.1
  %.add.1 = select i1 %cmp17.1, i32 %3, i32 %add.1
  store i32 %.add.1, i32* %arrayidx8.1, align 4
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2800
  br i1 %exitcond9.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.end37, label %for.cond4.preheader

for.end37:                                        ; preds = %for.end
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2800
  br i1 %exitcond3, label %for.end40, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv27, 2800
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2800 x i32], [2800 x i32]* %path, i64 %indvars.iv27, i64 %indvars.iv6
  %8 = load i32, i32* %arrayidx8, align 4
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.5, i64 0, i64 0), i32 %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2800
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2800
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

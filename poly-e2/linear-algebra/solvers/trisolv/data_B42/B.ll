; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay3 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay7)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %entry.for.end16_crit_edge

entry.for.end16_crit_edge:                        ; preds = %entry
  br label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %conv9 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %1 = sext i32 %n to i64
  br label %for.body6.lr.ph

for.body6.lr.ph:                                  ; preds = %for.inc14.for.body6.lr.ph_crit_edge, %for.body.lr.ph
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next10, %for.inc14.for.body6.lr.ph_crit_edge ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv9
  store double -9.990000e+02, double* %arrayidx, align 8
  %2 = trunc i64 %indvars.iv9 to i32
  %conv = sitofp i32 %2 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv9
  store double %conv, double* %arrayidx2, align 8
  %3 = add nuw nsw i64 %indvars.iv9, %0
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.for.body6_crit_edge ], [ 0, %for.body6.lr.ph ]
  %4 = sub nsw i64 %3, %indvars.iv
  %5 = add nsw i64 %4, 1
  %6 = trunc i64 %5 to i32
  %conv8 = sitofp i32 %6 to double
  %mul = fmul double %conv8, 2.000000e+00
  %div = fdiv double %mul, %conv9
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv
  store double %div, double* %arrayidx13, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv9
  br i1 %exitcond, label %for.inc14, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6

for.inc14:                                        ; preds = %for.body6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %1
  br i1 %exitcond12, label %for.inc14.for.end16_crit_edge, label %for.inc14.for.body6.lr.ph_crit_edge

for.inc14.for.body6.lr.ph_crit_edge:              ; preds = %for.inc14
  br label %for.body6.lr.ph

for.inc14.for.end16_crit_edge:                    ; preds = %for.inc14
  br label %for.end16

for.end16:                                        ; preds = %for.inc14.for.end16_crit_edge, %entry.for.end16_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.preheader, label %entry.for.end24_crit_edge

entry.for.end24_crit_edge:                        ; preds = %entry
  br label %for.end24

for.body.preheader:                               ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %indvars.iv5 = phi i32 [ %indvars.iv.next6, %for.end.for.body_crit_edge ], [ -1, %for.body.preheader ]
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv7
  %1 = bitcast double* %arrayidx to i64*
  %2 = load i64, i64* %1, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv7
  %3 = bitcast double* %arrayidx2 to i64*
  store i64 %2, i64* %3, align 8
  %4 = bitcast i64 %2 to double
  %cmp42 = icmp sgt i64 %indvars.iv7, 0
  br i1 %cmp42, label %for.body5.preheader, label %for.body.for.end_crit_edge

for.body.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.body5.preheader:                              ; preds = %for.body
  %wide.trip.count = zext i32 %indvars.iv5 to i64
  br label %for.body5

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5.for.body5_crit_edge ], [ 0, %for.body5.preheader ]
  %5 = phi double [ %sub, %for.body5.for.body5_crit_edge ], [ %4, %for.body5.preheader ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv7, i64 %indvars.iv
  %6 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx11, align 8
  %mul = fmul double %6, %7
  %sub = fsub double %5, %mul
  store double %sub, double* %arrayidx2, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.body5.for.end_crit_edge, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body5

for.body5.for.end_crit_edge:                      ; preds = %for.body5
  br label %for.end

for.end:                                          ; preds = %for.body5.for.end_crit_edge, %for.body.for.end_crit_edge
  %.lcssa = phi double [ %4, %for.body.for.end_crit_edge ], [ %sub, %for.body5.for.end_crit_edge ]
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv7, i64 %indvars.iv7
  %8 = load double, double* %arrayidx19, align 8
  %div = fdiv double %.lcssa, %8
  store double %div, double* %arrayidx2, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, %0
  br i1 %exitcond9, label %for.end.for.end24_crit_edge, label %for.end.for.body_crit_edge

for.end.for.body_crit_edge:                       ; preds = %for.end
  %indvars.iv.next6 = add nsw i32 %indvars.iv5, 1
  br label %for.body

for.end.for.end24_crit_edge:                      ; preds = %for.end
  br label %for.end24

for.end24:                                        ; preds = %for.end.for.end24_crit_edge, %entry.for.end24_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp1, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %4 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %5 = phi %struct._IO_FILE* [ %3, %for.body.preheader ], [ %9, %for.inc.for.body_crit_edge ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call2 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %6) #6
  %7 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %7, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  br label %for.inc

if.then:                                          ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond, label %for.inc.for.end_crit_edge, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  br label %for.body

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.inc.for.end_crit_edge, %entry.for.end_crit_edge
  %.lcssa = phi %struct._IO_FILE* [ %3, %entry.for.end_crit_edge ], [ %9, %for.inc.for.end_crit_edge ]
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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

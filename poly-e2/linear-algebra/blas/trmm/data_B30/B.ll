; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond11.for.inc27_crit_edge.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.cond11.for.inc27_crit_edge.us ], [ 0, %entry ]
  %cmp23.us = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp23.us, label %for.inc.us.preheader, label %for.end.us

for.inc.us.preheader:                             ; preds = %for.cond1.preheader.us
  %xtraiter = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.preheader
  %0 = trunc i64 %indvars.iv20 to i32
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.us.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.us.preheader ]
  %1 = icmp eq i64 %indvars.iv20, 1
  br i1 %1, label %for.end.us, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %2 = trunc i64 %indvars.iv20 to i32
  %sub.us = add i32 %2, 1200
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.end.us
  %indvars.iv16 = phi i64 [ 0, %for.end.us ], [ %indvars.iv.next17.1, %for.inc24.us ]
  %3 = trunc i64 %indvars.iv16 to i32
  %add15.us = sub nuw nsw i32 %sub.us, %3
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv16
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next17 = or i64 %indvars.iv16, 1
  %4 = trunc i64 %indvars.iv.next17 to i32
  %add15.us.1 = sub nuw nsw i32 %sub.us, %4
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, 1.200000e+03
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv.next17
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond19.1, label %for.cond11.for.inc27_crit_edge.us, label %for.inc24.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv20
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv20
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.inc24.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond23, label %for.end29, label %for.cond1.preheader.us

for.end29:                                        ; preds = %for.cond11.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc30_crit_edge.us
  %0 = phi i32 [ %2, %for.cond1.for.inc30_crit_edge.us ], [ 0, %entry ]
  %1 = sub i32 999, %0
  %idxprom18.us = sext i32 %0 to i64
  %2 = add i32 %0, 1
  %3 = sext i32 %2 to i64
  %4 = icmp slt i32 %2, 1000
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %0, 998
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %3, i64 %idxprom18.us
  %indvars.iv.next.prol = add nsw i64 %3, 1
  br label %for.cond4.preheader.us

for.inc27.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc27.us

for.inc27.us:                                     ; preds = %for.inc27.us.loopexit, %for.inc.us.prol.loopexit, %for.cond4.preheader.us
  %6 = phi double [ %.pre, %for.cond4.preheader.us ], [ %add17.us.lcssa.unr.ph, %for.inc.us.prol.loopexit ], [ %add17.us.1, %for.inc27.us.loopexit ]
  %mul22.us = fmul double %6, %alpha
  store double %mul22.us, double* %arrayidx16.us, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1200
  br i1 %exitcond19, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %7 = phi double [ %.unr.ph, %for.inc.us.preheader.new ], [ %add17.us.1, %for.inc.us ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %idxprom18.us
  %8 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv17
  %9 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %8, %9
  %add17.us = fadd double %mul.us, %7
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next, i64 %idxprom18.us
  %10 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next, i64 %indvars.iv17
  %11 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %10, %11
  %add17.us.1 = fadd double %mul.us.1, %add17.us
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.inc27.us.loopexit, label %for.inc.us

for.cond4.preheader.us:                           ; preds = %for.inc27.us, %for.cond1.preheader.us
  %indvars.iv17 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next18, %for.inc27.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %idxprom18.us, i64 %indvars.iv17
  %.pre = load double, double* %arrayidx16.us, align 8
  br i1 %4, label %for.inc.us.preheader, label %for.inc27.us

for.inc.us.preheader:                             ; preds = %for.cond4.preheader.us
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.preheader
  %12 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %3, i64 %indvars.iv17
  %13 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %12, %13
  %add17.us.prol = fadd double %mul.us.prol, %.pre
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.us.preheader
  %add17.us.lcssa.unr.ph = phi double [ %add17.us.prol, %for.inc.us.prol ], [ undef, %for.inc.us.preheader ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ %3, %for.inc.us.preheader ]
  %.unr.ph = phi double [ %add17.us.prol, %for.inc.us.prol ], [ %.pre, %for.inc.us.preheader ]
  br i1 %5, label %for.inc27.us, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.inc27.us
  %14 = icmp slt i32 %2, 1000
  br i1 %14, label %for.cond1.preheader.us, label %for.end32

for.end32:                                        ; preds = %for.cond1.for.inc30_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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

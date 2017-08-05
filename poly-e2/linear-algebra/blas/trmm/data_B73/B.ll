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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond11.for.inc27_crit_edge.us, %for.body.us.preheader
  %indvars.iv21 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next22, %for.cond11.for.inc27_crit_edge.us ]
  %0 = trunc i64 %indvars.iv21 to i32
  %1 = add nuw nsw i64 %indvars.iv21, 4294967295
  %2 = trunc i64 %1 to i32
  %cmp21.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit.unr-lcssa, %for.body.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us
  %indvars.iv15 = phi i64 [ 0, %for.end.us ], [ %indvars.iv.next16, %for.body14.us ]
  %3 = sub nsw i64 %indvars.iv21, %indvars.iv15
  %4 = add nsw i64 %3, 1200
  %5 = trunc i64 %4 to i32
  %rem16.us = srem i32 %5, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv15
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond20, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %6 = add nuw nsw i64 %indvars.iv21, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = add nuw nsw i64 %indvars.iv21, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %rem.us.1 = srem i32 %9, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %10 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.body.us
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.lr.ph.us, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol.preheader ], [ 0, %for.body3.lr.ph.us ]
  %11 = icmp eq i32 %2, 0
  br i1 %11, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.body14.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond24, label %for.end29, label %for.body.us

for.end29:                                        ; preds = %for.cond11.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #2 {
for.body.us.preheader:
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc30_crit_edge.us, %for.body.us.preheader
  %indvars.iv = phi i64 [ 1, %for.body.us.preheader ], [ %3, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv25 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next26, %for.cond1.for.inc30_crit_edge.us ]
  %0 = sub nuw nsw i64 999, %indvars.iv25
  %1 = sub nsw i64 998, %indvars.iv25
  %2 = trunc i64 %1 to i32
  %3 = add nuw nsw i64 %indvars.iv, 1
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %xtraiter28 = and i64 %0, 1
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv25
  %4 = icmp slt i64 %indvars.iv.next26, 1000
  %5 = icmp eq i64 %xtraiter28, 0
  %6 = icmp eq i32 %2, 0
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.end.us, %for.body.us
  %indvars.iv20 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next21, %for.end.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16.us, align 8
  br i1 %4, label %for.body6.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body6.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body6.us.prol.loopexit.unr-lcssa, %for.body3.us
  %7 = phi double [ %.pre, %for.body3.us ], [ %add17.us.lcssa.unr.ph, %for.body6.us.prol.loopexit.unr-lcssa ], [ %add17.us.1, %for.end.us.loopexit ]
  %mul22.us = fmul double %7, %alpha
  store double %mul22.us, double* %arrayidx16.us, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond24, label %for.cond1.for.inc30_crit_edge.us, label %for.body3.us

for.body6.us:                                     ; preds = %for.body6.us.preheader, %for.body6.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.body6.us ], [ %indvars.iv16.unr.ph, %for.body6.us.preheader ]
  %8 = phi double [ %add17.us.1, %for.body6.us ], [ %.unr.ph, %for.body6.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv25
  %9 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv20
  %10 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %9, %10
  %add17.us = fadd double %8, %mul.us
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next17, i64 %indvars.iv25
  %11 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next17, i64 %indvars.iv20
  %12 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %11, %12
  %add17.us.1 = fadd double %add17.us, %mul.us.1
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next17.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body6.us

for.body6.lr.ph.us:                               ; preds = %for.body3.us
  br i1 %5, label %for.body6.us.prol.loopexit.unr-lcssa, label %for.body6.us.prol.preheader

for.body6.us.prol.preheader:                      ; preds = %for.body6.lr.ph.us
  %13 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv20
  %14 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %13, %14
  %add17.us.prol = fadd double %.pre, %mul.us.prol
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit.unr-lcssa

for.body6.us.prol.loopexit.unr-lcssa:             ; preds = %for.body6.lr.ph.us, %for.body6.us.prol.preheader
  %indvars.iv16.unr.ph = phi i64 [ %3, %for.body6.us.prol.preheader ], [ %indvars.iv, %for.body6.lr.ph.us ]
  %.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol.preheader ], [ %.pre, %for.body6.lr.ph.us ]
  %add17.us.lcssa.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol.preheader ], [ undef, %for.body6.lr.ph.us ]
  br i1 %6, label %for.end.us, label %for.body6.us.preheader

for.body6.us.preheader:                           ; preds = %for.body6.us.prol.loopexit.unr-lcssa
  br label %for.body6.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.end.us
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond, label %for.end32, label %for.body.us

for.end32:                                        ; preds = %for.cond1.for.inc30_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond14, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

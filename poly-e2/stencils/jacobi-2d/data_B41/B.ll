; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [1300 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay3, [1300 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count18 = zext i32 %n to i64
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv6, i32 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next17, %for.cond1.for.inc20_crit_edge.us ]
  %0 = trunc i64 %indvars.iv16 to i32
  %conv.us = sitofp i32 %0 to double
  %mul.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = insertelement <2 x double> %mul.us.v.i0.1, double %conv.us, i32 1
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11.us = sitofp i32 %4 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv11.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 3.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx8.us, align 8
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  br i1 %exitcond19, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  %cmp52 = icmp sgt i32 %tsteps, 0
  br i1 %cmp52, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp246 = icmp sgt i32 %sub, 1
  %wide.trip.count58 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %cmp4250 = icmp sgt i32 %sub, 1
  %wide.trip.count68 = zext i32 %sub to i64
  %wide.trip.count63 = zext i32 %sub to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %storemerge53 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp246, label %for.cond4.preheader.us.preheader, label %for.inc87

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %0 = add nsw i64 %indvars.iv55, -1
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us, %for.cond4.preheader.us
  %indvars.iv = phi i64 [ 1, %for.cond4.preheader.us ], [ %indvars.iv.next, %for.body7.us ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv
  %1 = load double, double* %arrayidx9.us, align 8
  %2 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %2
  %3 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %1, %3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv.next
  %4 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %4
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv
  %5 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %5
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %0, i64 %indvars.iv
  %6 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %6
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.body7.us
  %exitcond59 = icmp eq i64 %indvars.iv.next56, %wide.trip.count58
  br i1 %exitcond59, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 %cmp4250, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %7 = add nsw i64 %indvars.iv65, -1
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us, %for.cond44.preheader.us
  %indvars.iv60 = phi i64 [ 1, %for.cond44.preheader.us ], [ %indvars.iv.next61, %for.body47.us ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv60
  %8 = load double, double* %arrayidx51.us, align 8
  %9 = add nsw i64 %indvars.iv60, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %9
  %10 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %8, %10
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv65, i64 %indvars.iv.next61
  %11 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %11
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next66, i64 %indvars.iv60
  %12 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %12
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %7, i64 %indvars.iv60
  %13 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %13
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv60
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond64 = icmp eq i64 %indvars.iv.next61, %wide.trip.count63
  br i1 %exitcond64, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.body47.us
  %exitcond69 = icmp eq i64 %indvars.iv.next66, %wide.trip.count68
  br i1 %exitcond69, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond40.preheader, %for.cond1.preheader
  %inc88 = add nuw nsw i32 %storemerge53, 1
  %exitcond70 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond70, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1300 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count15 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv12, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
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
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  br i1 %exitcond16, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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

; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %arraydecay)
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
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %entry.for.end11_crit_edge

entry.for.end11_crit_edge:                        ; preds = %entry
  br label %for.end11

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %xtraiter = and i32 %n, 1
  %wide.trip.count14 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %0 = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %2 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.us.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc9.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc9.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %3 = trunc i64 %indvars.iv12 to i32
  %conv.us = sitofp i32 %3 to double
  br i1 %0, label %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, label %for.body3.us.prol

for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol.loopexit

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %mul.us.prol = fmul double %conv.us, 2.000000e+00
  %add5.us.prol = fadd double %mul.us.prol, 2.000000e+00
  %div.us.prol = fdiv double %add5.us.prol, %conv6
  %arrayidx8.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 0
  store double %div.us.prol, double* %arrayidx8.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge ]
  br i1 %1, label %for.body3.us.prol.loopexit.for.inc9.us_crit_edge, label %for.body3.us.preheader

for.body3.us.prol.loopexit.for.inc9.us_crit_edge: ; preds = %for.body3.us.prol.loopexit
  br label %for.inc9.us

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %4 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, 2
  %6 = trunc i64 %5 to i32
  %conv4.us = sitofp i32 %6 to double
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %7 = add nsw i64 %indvars.iv, 3
  %8 = trunc i64 %7 to i32
  %conv4.us.1 = sitofp i32 %8 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv4.us.1, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 2.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, %div.us.v.i1.2
  %9 = bitcast double* %arrayidx8.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc9.us.loopexit, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.inc9.us.loopexit:                             ; preds = %for.body3.us
  br label %for.inc9.us

for.inc9.us:                                      ; preds = %for.body3.us.prol.loopexit.for.inc9.us_crit_edge, %for.inc9.us.loopexit
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  br i1 %exitcond, label %for.end11.loopexit, label %for.inc9.us.for.cond1.preheader.us_crit_edge

for.inc9.us.for.cond1.preheader.us_crit_edge:     ; preds = %for.inc9.us
  br label %for.cond1.preheader.us

for.end11.loopexit:                               ; preds = %for.inc9.us
  br label %for.end11

for.end11:                                        ; preds = %entry.for.end11_crit_edge, %for.end11.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32 %tsteps, i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %cmp37 = icmp sgt i32 %tsteps, 0
  br i1 %cmp37, label %for.cond1.preheader.lr.ph, label %entry.for.end71_crit_edge

entry.for.end71_crit_edge:                        ; preds = %entry
  br label %for.end71

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub2 = add nsw i32 %n, -2
  %0 = add i32 %n, -1
  %wide.trip.count43 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %1 = icmp slt i32 %sub2, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc69.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %storemerge38 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc70, %for.inc69.for.cond1.preheader_crit_edge ]
  br i1 %1, label %for.cond1.preheader.for.inc69_crit_edge, label %for.cond5.preheader.preheader

for.cond1.preheader.for.inc69_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc69

for.cond5.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc66.for.cond5.preheader_crit_edge, %for.cond5.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc66.for.cond5.preheader_crit_edge ], [ 0, %for.cond5.preheader.preheader ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.inc66.for.cond5.preheader_crit_edge ], [ 1, %for.cond5.preheader.preheader ]
  %2 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %2, i64 0
  %3 = add nsw i64 %indvars.iv40, -1
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.cond5.preheader
  %store_forwarded = phi double [ %load_initial, %for.cond5.preheader ], [ %div, %for.body8.for.body8_crit_edge ]
  %indvars.iv = phi i64 [ 1, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8.for.body8_crit_edge ]
  %4 = add nsw i64 %indvars.iv, -1
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %4
  %5 = load double, double* %arrayidx12, align 8
  %arrayidx17 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %indvars.iv
  %6 = load double, double* %arrayidx17, align 8
  %add = fadd double %5, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %3, i64 %indvars.iv.next
  %7 = load double, double* %arrayidx23, align 8
  %add24 = fadd double %add, %7
  %add30 = fadd double %add24, %store_forwarded
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv
  %8 = load double, double* %arrayidx34, align 8
  %add35 = fadd double %add30, %8
  %arrayidx40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx40, align 8
  %add41 = fadd double %add35, %9
  %arrayidx47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next41, i64 %4
  %10 = load double, double* %arrayidx47, align 8
  %add48 = fadd double %add41, %10
  %arrayidx53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next41, i64 %indvars.iv
  %11 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %add48, %11
  %arrayidx60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next41, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx60, align 8
  %add61 = fadd double %add54, %12
  %div = fdiv double %add61, 9.000000e+00
  store double %div, double* %arrayidx34, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc66, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  br label %for.body8

for.inc66:                                        ; preds = %for.body8
  %exitcond44 = icmp eq i64 %indvars.iv.next41, %wide.trip.count43
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond44, label %for.inc69.loopexit, label %for.inc66.for.cond5.preheader_crit_edge

for.inc66.for.cond5.preheader_crit_edge:          ; preds = %for.inc66
  br label %for.cond5.preheader

for.inc69.loopexit:                               ; preds = %for.inc66
  br label %for.inc69

for.inc69:                                        ; preds = %for.cond1.preheader.for.inc69_crit_edge, %for.inc69.loopexit
  %inc70 = add nuw nsw i32 %storemerge38, 1
  %exitcond45 = icmp eq i32 %inc70, %tsteps
  br i1 %exitcond45, label %for.end71.loopexit, label %for.inc69.for.cond1.preheader_crit_edge

for.inc69.for.cond1.preheader_crit_edge:          ; preds = %for.inc69
  br label %for.cond1.preheader

for.end71.loopexit:                               ; preds = %for.inc69
  br label %for.end71

for.end71:                                        ; preds = %entry.for.end71_crit_edge, %for.end71.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count15 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next13, %for.inc10.us.for.cond2.preheader.us_crit_edge ]
  %4 = mul nsw i64 %indvars.iv12, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ], [ 0, %for.cond2.preheader.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  br i1 %exitcond16, label %for.end12.loopexit, label %for.inc10.us.for.cond2.preheader.us_crit_edge

for.inc10.us.for.cond2.preheader.us_crit_edge:    ; preds = %for.inc10.us
  br label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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

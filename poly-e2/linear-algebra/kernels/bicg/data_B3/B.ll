; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %arraydecay = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay8, double* %arraydecay9, double* %arraydecay6, double* %arraydecay5)
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
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %arraydecay8, double* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %m, 0
  br i1 %cmp6, label %for.inc.lr.ph, label %entry.for.cond2.preheader_crit_edge

entry.for.cond2.preheader_crit_edge:              ; preds = %entry
  br label %for.cond2.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %m to double
  %xtraiter23 = and i32 %m, 1
  %lcmp.mod24 = icmp eq i32 %xtraiter23, 0
  br i1 %lcmp.mod24, label %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge, label %for.inc.prol

for.inc.lr.ph.for.inc.prol.loopexit_crit_edge:    ; preds = %for.inc.lr.ph
  br label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge, %for.inc.prol
  %indvars.iv19.unr = phi i64 [ 0, %for.inc.lr.ph.for.inc.prol.loopexit_crit_edge ], [ 1, %for.inc.prol ]
  %0 = icmp eq i32 %m, 1
  br i1 %0, label %for.inc.prol.loopexit.for.cond2.preheader_crit_edge, label %for.inc.preheader

for.inc.prol.loopexit.for.cond2.preheader_crit_edge: ; preds = %for.inc.prol.loopexit
  br label %for.cond2.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count21.1 = zext i32 %m to i64
  br label %for.inc

for.cond2.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc.prol.loopexit.for.cond2.preheader_crit_edge, %entry.for.cond2.preheader_crit_edge, %for.cond2.preheader.loopexit
  %cmp33 = icmp sgt i32 %n, 0
  br i1 %cmp33, label %for.body5.lr.ph, label %for.cond2.preheader.for.end29_crit_edge

for.cond2.preheader.for.end29_crit_edge:          ; preds = %for.cond2.preheader
  br label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %conv8 = sitofp i32 %n to double
  %cmp131 = icmp sgt i32 %m, 0
  br i1 %cmp131, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i32 %m, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %m, 1
  %wide.trip.count12 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %m to i64
  br label %for.body5.us

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %xtraiter17 = and i32 %n, 1
  %lcmp.mod18 = icmp eq i32 %xtraiter17, 0
  br i1 %lcmp.mod18, label %for.body5.preheader.for.body5.prol.loopexit_crit_edge, label %for.body5.prol

for.body5.preheader.for.body5.prol.loopexit_crit_edge: ; preds = %for.body5.preheader
  br label %for.body5.prol.loopexit

for.body5.prol:                                   ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv8
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader.for.body5.prol.loopexit_crit_edge, %for.body5.prol
  %indvars.iv13.unr = phi i64 [ 0, %for.body5.preheader.for.body5.prol.loopexit_crit_edge ], [ 1, %for.body5.prol ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.body5.prol.loopexit.for.end29_crit_edge, label %for.body5.preheader25

for.body5.prol.loopexit.for.end29_crit_edge:      ; preds = %for.body5.prol.loopexit
  br label %for.end29

for.body5.preheader25:                            ; preds = %for.body5.prol.loopexit
  %wide.trip.count15.1 = zext i32 %n to i64
  br label %for.body5

for.body5.us:                                     ; preds = %for.cond12.for.inc27_crit_edge.us.for.body5.us_crit_edge, %for.body5.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond12.for.inc27_crit_edge.us.for.body5.us_crit_edge ], [ 0, %for.body5.us.preheader ]
  %3 = trunc i64 %indvars.iv10 to i32
  %conv7.us = sitofp i32 %3 to double
  %div9.us = fdiv double %conv7.us, %conv8
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv10
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %lcmp.mod, label %for.body5.us.for.inc24.us.prol.loopexit_crit_edge, label %for.inc24.us.prol

for.body5.us.for.inc24.us.prol.loopexit_crit_edge: ; preds = %for.body5.us
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol:                                ; preds = %for.body5.us
  %4 = trunc i64 %indvars.iv10 to i32
  %rem16.us.prol = srem i32 %4, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv8
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.body5.us.for.inc24.us.prol.loopexit_crit_edge, %for.inc24.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us.for.inc24.us.prol.loopexit_crit_edge ]
  br i1 %1, label %for.inc24.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge, label %for.inc24.us.preheader

for.inc24.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge: ; preds = %for.inc24.us.prol.loopexit
  br label %for.cond12.for.inc27_crit_edge.us

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.for.inc24.us_crit_edge, %for.inc24.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc24.us.for.inc24.us_crit_edge ], [ %indvars.iv.unr.ph, %for.inc24.us.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %6 = trunc i64 %5 to i32
  %rem16.us = srem i32 %6, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv8
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %7 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv10
  %8 = trunc i64 %7 to i32
  %rem16.us.1 = srem i32 %8, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv8
  %arrayidx23.us.1 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us.for.inc24.us_crit_edge

for.inc24.us.for.inc24.us_crit_edge:              ; preds = %for.inc24.us
  br label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.inc24.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge, %for.cond12.for.inc27_crit_edge.us.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond, label %for.end29.loopexit, label %for.cond12.for.inc27_crit_edge.us.for.body5.us_crit_edge

for.cond12.for.inc27_crit_edge.us.for.body5.us_crit_edge: ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.body5.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %for.inc.for.inc_crit_edge ], [ %indvars.iv19.unr, %for.inc.preheader ]
  %9 = trunc i64 %indvars.iv19 to i32
  %conv = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv1
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv19
  store double %div, double* %arrayidx, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %10 = trunc i64 %indvars.iv.next20 to i32
  %conv.1 = sitofp i32 %10 to double
  %div.1 = fdiv double %conv.1, %conv1
  %arrayidx.1 = getelementptr inbounds double, double* %p, i64 %indvars.iv.next20
  store double %div.1, double* %arrayidx.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, %wide.trip.count21.1
  br i1 %exitcond22.1, label %for.cond2.preheader.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.preheader25
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %for.body5.for.body5_crit_edge ], [ %indvars.iv13.unr, %for.body5.preheader25 ]
  %11 = trunc i64 %indvars.iv13 to i32
  %conv7 = sitofp i32 %11 to double
  %div9 = fdiv double %conv7, %conv8
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv13
  store double %div9, double* %arrayidx11, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %12 = trunc i64 %indvars.iv.next14 to i32
  %conv7.1 = sitofp i32 %12 to double
  %div9.1 = fdiv double %conv7.1, %conv8
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next14
  store double %div9.1, double* %arrayidx11.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15.1
  br i1 %exitcond16.1, label %for.end29.loopexit28, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  br label %for.body5

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit28:                             ; preds = %for.body5
  br label %for.end29

for.end29:                                        ; preds = %for.body5.prol.loopexit.for.end29_crit_edge, %for.cond2.preheader.for.end29_crit_edge, %for.end29.loopexit28, %for.end29.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) unnamed_addr #2 {
entry:
  %q17 = bitcast double* %q to i8*
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.loopexit, label %entry.for.cond1.preheader_crit_edge

entry.for.cond1.preheader_crit_edge:              ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader.loopexit:                     ; preds = %entry
  %s22 = bitcast double* %s to i8*
  %0 = add i32 %m, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  call void @llvm.memset.p0i8.i64(i8* %s22, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry.for.cond1.preheader_crit_edge, %for.cond1.preheader.loopexit
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.body3.lr.ph, label %for.cond1.preheader.for.end36_crit_edge

for.cond1.preheader.for.end36_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %cmp71 = icmp sgt i32 %m, 0
  br i1 %cmp71, label %for.body3.us.preheader, label %for.end36.loopexit7

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %wide.trip.count = zext i32 %m to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond6.for.inc34_crit_edge.us.for.body3.us_crit_edge ], [ 0, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv8
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %r, i64 %indvars.iv8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us.for.inc31.us_crit_edge, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us.for.inc31.us_crit_edge ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %4 = load double, double* %arrayidx10.us, align 8
  %5 = load double, double* %arrayidx12.us, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %6 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %5, %6
  %add.us = fadd double %4, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %7 = load double, double* %arrayidx5.us, align 8
  %8 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %9 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %8, %9
  %add28.us = fadd double %7, %mul27.us
  store double %add28.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.inc31.us.for.inc31.us_crit_edge

for.inc31.us.for.inc31.us_crit_edge:              ; preds = %for.inc31.us
  br label %for.inc31.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end36.loopexit, label %for.cond6.for.inc34_crit_edge.us.for.body3.us_crit_edge

for.cond6.for.inc34_crit_edge.us.for.body3.us_crit_edge: ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.body3.us

for.end36.loopexit7:                              ; preds = %for.body3.lr.ph
  %10 = add i32 %n, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %q17, i8 0, i64 %13, i32 8, i1 false)
  br label %for.end36

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.cond1.preheader.for.end36_crit_edge, %for.end36.loopexit, %for.end36.loopexit7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* nocapture readonly %s, double* nocapture readonly %q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp6 = icmp sgt i32 %m, 0
  br i1 %cmp6, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count10 = zext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv8 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  br label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv8
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end.loopexit, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  br label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp84 = icmp sgt i32 %n, 0
  br i1 %cmp84, label %for.body9.preheader, label %for.end.for.end20_crit_edge

for.end.for.end20_crit_edge:                      ; preds = %for.end
  br label %for.end20

for.body9.preheader:                              ; preds = %for.end
  %wide.trip.count = zext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %for.inc18.for.body9_crit_edge, %for.body9.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18.for.body9_crit_edge ], [ 0, %for.body9.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.body9.for.inc18_crit_edge

for.body9.for.inc18_crit_edge:                    ; preds = %for.body9
  br label %for.inc18

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9.for.inc18_crit_edge, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end20.loopexit, label %for.inc18.for.body9_crit_edge

for.inc18.for.body9_crit_edge:                    ; preds = %for.inc18
  br label %for.body9

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end.for.end20_crit_edge, %for.end20.loopexit
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

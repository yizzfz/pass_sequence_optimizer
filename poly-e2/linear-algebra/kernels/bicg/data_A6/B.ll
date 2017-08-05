; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %arraydecay8, double* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  br i1 %cmp6, label %for.inc.lr.ph, label %for.cond2.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %m to double
  %xtraiter23 = and i32 %m, 1
  %lcmp.mod24 = icmp eq i32 %xtraiter23, 0
  br i1 %lcmp.mod24, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv19.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol ]
  %0 = icmp eq i32 %m, 1
  br i1 %0, label %for.cond2.preheader, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count21.1 = zext i32 %m to i64
  %1 = add nsw i64 %wide.trip.count21.1, -2
  %2 = sub nsw i64 %1, %indvars.iv19.unr
  %3 = lshr i64 %2, 1
  %4 = and i64 %3, 1
  %lcmp.mod39 = icmp eq i64 %4, 0
  br i1 %lcmp.mod39, label %for.inc.prol.preheader, label %for.inc.prol.loopexit37

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol40

for.inc.prol40:                                   ; preds = %for.inc.prol.preheader
  %5 = trunc i64 %indvars.iv19.unr to i32
  %conv.prol = sitofp i32 %5 to double
  %arrayidx.prol = getelementptr inbounds double, double* %p, i64 %indvars.iv19.unr
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.unr, 1
  %6 = trunc i64 %indvars.iv.next20.prol to i32
  %conv.1.prol = sitofp i32 %6 to double
  %7 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2.prol = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %div.v.i0.1.prol = insertelement <2 x double> undef, double %conv.prol, i32 0
  %div.v.i0.2.prol = insertelement <2 x double> %div.v.i0.1.prol, double %conv.1.prol, i32 1
  %div.prol41 = fdiv <2 x double> %div.v.i0.2.prol, %div.v.i1.2.prol
  %8 = bitcast double* %arrayidx.prol to <2 x double>*
  store <2 x double> %div.prol41, <2 x double>* %8, align 8
  %indvars.iv.next20.1.prol = or i64 %indvars.iv19.unr, 2
  br label %for.inc.prol.loopexit37

for.inc.prol.loopexit37:                          ; preds = %for.inc.prol40, %for.inc.preheader
  %indvars.iv19.unr42 = phi i64 [ %indvars.iv19.unr, %for.inc.preheader ], [ %indvars.iv.next20.1.prol, %for.inc.prol40 ]
  %9 = icmp eq i64 %3, 0
  br i1 %9, label %for.cond2.preheader.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit37
  %10 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2.1 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc

for.cond2.preheader.loopexit.unr-lcssa:           ; preds = %for.inc
  br label %for.cond2.preheader.loopexit

for.cond2.preheader.loopexit:                     ; preds = %for.inc.prol.loopexit37, %for.cond2.preheader.loopexit.unr-lcssa
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %for.inc.prol.loopexit, %entry
  %cmp33 = icmp sgt i32 %n, 0
  br i1 %cmp33, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %conv8 = sitofp i32 %n to double
  %cmp131 = icmp sgt i32 %m, 0
  br i1 %cmp131, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i32 %m, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp eq i32 %m, 1
  %wide.trip.count12 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %m to i64
  %13 = insertelement <2 x double> undef, double %conv8, i32 0
  %div19.us.v.i1.2 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body5.us

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %xtraiter17 = and i32 %n, 1
  %lcmp.mod18 = icmp eq i32 %xtraiter17, 0
  br i1 %lcmp.mod18, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv8
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol
  %indvars.iv13.unr = phi i64 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol ]
  %14 = icmp eq i32 %n, 1
  br i1 %14, label %for.end29, label %for.body5.preheader25

for.body5.preheader25:                            ; preds = %for.body5.prol.loopexit
  %wide.trip.count15.1 = zext i32 %n to i64
  %15 = add nsw i64 %wide.trip.count15.1, -2
  %16 = sub nsw i64 %15, %indvars.iv13.unr
  %17 = lshr i64 %16, 1
  %18 = and i64 %17, 1
  %lcmp.mod31 = icmp eq i64 %18, 0
  br i1 %lcmp.mod31, label %for.body5.prol.preheader, label %for.body5.prol.loopexit29

for.body5.prol.preheader:                         ; preds = %for.body5.preheader25
  br label %for.body5.prol32

for.body5.prol32:                                 ; preds = %for.body5.prol.preheader
  %19 = trunc i64 %indvars.iv13.unr to i32
  %conv7.prol = sitofp i32 %19 to double
  %arrayidx11.prol = getelementptr inbounds double, double* %r, i64 %indvars.iv13.unr
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.unr, 1
  %20 = trunc i64 %indvars.iv.next14.prol to i32
  %conv7.1.prol = sitofp i32 %20 to double
  %21 = insertelement <2 x double> undef, double %conv8, i32 0
  %div9.v.i1.2.prol = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %div9.v.i0.1.prol = insertelement <2 x double> undef, double %conv7.prol, i32 0
  %div9.v.i0.2.prol = insertelement <2 x double> %div9.v.i0.1.prol, double %conv7.1.prol, i32 1
  %div9.prol33 = fdiv <2 x double> %div9.v.i0.2.prol, %div9.v.i1.2.prol
  %22 = bitcast double* %arrayidx11.prol to <2 x double>*
  store <2 x double> %div9.prol33, <2 x double>* %22, align 8
  %indvars.iv.next14.1.prol = or i64 %indvars.iv13.unr, 2
  br label %for.body5.prol.loopexit29

for.body5.prol.loopexit29:                        ; preds = %for.body5.prol32, %for.body5.preheader25
  %indvars.iv13.unr34 = phi i64 [ %indvars.iv13.unr, %for.body5.preheader25 ], [ %indvars.iv.next14.1.prol, %for.body5.prol32 ]
  %23 = icmp eq i64 %17, 0
  br i1 %23, label %for.end29.loopexit28, label %for.body5.preheader25.new

for.body5.preheader25.new:                        ; preds = %for.body5.prol.loopexit29
  %24 = insertelement <2 x double> undef, double %conv8, i32 0
  %div9.v.i1.2 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %conv8, i32 0
  %div9.v.i1.2.1 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body5

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %26 = trunc i64 %indvars.iv10 to i32
  %conv7.us = sitofp i32 %26 to double
  %div9.us = fdiv double %conv7.us, %conv8
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv10
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %lcmp.mod, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.body5.us
  %27 = trunc i64 %indvars.iv10 to i32
  %rem16.us.prol = srem i32 %27, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv8
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us ]
  br i1 %12, label %for.cond12.for.inc27_crit_edge.us, label %for.inc24.us.preheader

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc24.us ], [ %indvars.iv.unr.ph, %for.inc24.us.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %29 = trunc i64 %28 to i32
  %rem16.us = srem i32 %29, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv10
  %31 = trunc i64 %30 to i32
  %rem16.us.1 = srem i32 %31, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, %div19.us.v.i1.2
  %32 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %32, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond, label %for.end29.loopexit, label %for.body5.us

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr42, %for.inc.preheader.new ], [ %indvars.iv.next20.1.1, %for.inc ]
  %33 = trunc i64 %indvars.iv19 to i32
  %conv = sitofp i32 %33 to double
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv19
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %34 = trunc i64 %indvars.iv.next20 to i32
  %conv.1 = sitofp i32 %34 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %35 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %35, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %36 = trunc i64 %indvars.iv.next20.1 to i32
  %conv.143 = sitofp i32 %36 to double
  %arrayidx.1 = getelementptr inbounds double, double* %p, i64 %indvars.iv.next20.1
  %indvars.iv.next20.144 = add nsw i64 %indvars.iv19, 3
  %37 = trunc i64 %indvars.iv.next20.144 to i32
  %conv.1.1 = sitofp i32 %37 to double
  %div.v.i0.1.1 = insertelement <2 x double> undef, double %conv.143, i32 0
  %div.v.i0.2.1 = insertelement <2 x double> %div.v.i0.1.1, double %conv.1.1, i32 1
  %div.1 = fdiv <2 x double> %div.v.i0.2.1, %div.v.i1.2.1
  %38 = bitcast double* %arrayidx.1 to <2 x double>*
  store <2 x double> %div.1, <2 x double>* %38, align 8
  %indvars.iv.next20.1.1 = add nsw i64 %indvars.iv19, 4
  %exitcond22.1.1 = icmp eq i64 %indvars.iv.next20.1.1, %wide.trip.count21.1
  br i1 %exitcond22.1.1, label %for.cond2.preheader.loopexit.unr-lcssa, label %for.inc

for.body5:                                        ; preds = %for.body5, %for.body5.preheader25.new
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr34, %for.body5.preheader25.new ], [ %indvars.iv.next14.1.1, %for.body5 ]
  %39 = trunc i64 %indvars.iv13 to i32
  %conv7 = sitofp i32 %39 to double
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv13
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %40 = trunc i64 %indvars.iv.next14 to i32
  %conv7.1 = sitofp i32 %40 to double
  %div9.v.i0.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div9.v.i0.2 = insertelement <2 x double> %div9.v.i0.1, double %conv7.1, i32 1
  %div9 = fdiv <2 x double> %div9.v.i0.2, %div9.v.i1.2
  %41 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div9, <2 x double>* %41, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %42 = trunc i64 %indvars.iv.next14.1 to i32
  %conv7.135 = sitofp i32 %42 to double
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next14.1
  %indvars.iv.next14.136 = add nsw i64 %indvars.iv13, 3
  %43 = trunc i64 %indvars.iv.next14.136 to i32
  %conv7.1.1 = sitofp i32 %43 to double
  %div9.v.i0.1.1 = insertelement <2 x double> undef, double %conv7.135, i32 0
  %div9.v.i0.2.1 = insertelement <2 x double> %div9.v.i0.1.1, double %conv7.1.1, i32 1
  %div9.1 = fdiv <2 x double> %div9.v.i0.2.1, %div9.v.i1.2.1
  %44 = bitcast double* %arrayidx11.1 to <2 x double>*
  store <2 x double> %div9.1, <2 x double>* %44, align 8
  %indvars.iv.next14.1.1 = add nsw i64 %indvars.iv13, 4
  %exitcond16.1.1 = icmp eq i64 %indvars.iv.next14.1.1, %wide.trip.count15.1
  br i1 %exitcond16.1.1, label %for.end29.loopexit28.unr-lcssa, label %for.body5

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit28.unr-lcssa:                   ; preds = %for.body5
  br label %for.end29.loopexit28

for.end29.loopexit28:                             ; preds = %for.body5.prol.loopexit29, %for.end29.loopexit28.unr-lcssa
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit28, %for.end29.loopexit, %for.body5.prol.loopexit, %for.cond2.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) unnamed_addr #2 {
entry:
  %q17 = bitcast double* %q to i8*
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.loopexit, label %for.cond1.preheader

for.cond1.preheader.loopexit:                     ; preds = %entry
  %s22 = bitcast double* %s to i8*
  %0 = add i32 %m, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  call void @llvm.memset.p0i8.i64(i8* %s22, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %entry
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %cmp71 = icmp sgt i32 %m, 0
  br i1 %cmp71, label %for.body3.us.preheader, label %for.end36.loopexit7

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %wide.trip.count = zext i32 %m to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc34_crit_edge.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv8
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %r, i64 %indvars.iv8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
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
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.inc31.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end36.loopexit, label %for.body3.us

for.end36.loopexit7:                              ; preds = %for.body3.lr.ph
  %10 = add i32 %n, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %q17, i8 0, i64 %13, i32 8, i1 false)
  br label %for.end36

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.end36.loopexit7, %for.cond1.preheader
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp6 = icmp sgt i32 %m, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count10 = zext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv8 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv8
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp84 = icmp sgt i32 %n, 0
  br i1 %cmp84, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  %wide.trip.count = zext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %for.body9.preheader, %for.inc18
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18 ], [ 0, %for.body9.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
entry:
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.for.inc.prol_crit_edge, %entry
  %indvars.iv513.prol = phi i64 [ %indvars.iv.next6.prol, %for.inc.prol.for.inc.prol_crit_edge ], [ 0, %entry ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol.for.inc.prol_crit_edge ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv513.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv513.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.preheader, label %for.inc.prol.for.inc.prol_crit_edge, !llvm.loop !1

for.inc.prol.for.inc.prol_crit_edge:              ; preds = %for.inc.prol
  br label %for.inc.prol

for.inc.preheader:                                ; preds = %for.inc.prol
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge, %for.cond5.preheader.us.preheader
  %indvars.iv310.us = phi i64 [ %indvars.iv.next4.us, %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv310.us to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us.for.inc36.us_crit_edge, %for.cond5.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.inc36.us.for.inc36.us_crit_edge ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %3 = trunc i64 %indvars.iv.next.us to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  %4 = add nuw nsw i64 %indvars.iv8.us, 2
  %5 = trunc i64 %4 to i32
  %conv18.us = sitofp i32 %5 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv8.us, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.inc36.us.for.inc36.us_crit_edge

for.inc36.us.for.inc36.us_crit_edge:              ; preds = %for.inc36.us
  br label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv310.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond15, label %for.end41, label %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge

for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge: ; preds = %for.cond5.for.inc39_crit_edge.us
  br label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv513 = phi i64 [ %indvars.iv.next6.7, %for.inc.for.inc_crit_edge ], [ 4, %for.inc.preheader ]
  %8 = trunc i64 %indvars.iv513 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513
  %9 = bitcast double* %arrayidx to <2 x double>*
  %10 = or i32 %8, 1
  %conv.1 = sitofp i32 %10 to double
  %11 = insertelement <2 x double> undef, double %conv, i32 0
  %12 = insertelement <2 x double> %11, double %conv.1, i32 1
  store <2 x double> %12, <2 x double>* %9, align 8
  %indvars.iv.next6.1 = or i64 %indvars.iv513, 2
  %13 = trunc i64 %indvars.iv.next6.1 to i32
  %conv.2 = sitofp i32 %13 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.1
  %14 = bitcast double* %arrayidx.2 to <2 x double>*
  %15 = or i32 %8, 3
  %conv.3 = sitofp i32 %15 to double
  %16 = insertelement <2 x double> undef, double %conv.2, i32 0
  %17 = insertelement <2 x double> %16, double %conv.3, i32 1
  store <2 x double> %17, <2 x double>* %14, align 8
  %indvars.iv.next6.3 = add nuw nsw i64 %indvars.iv513, 4
  %18 = trunc i64 %indvars.iv.next6.3 to i32
  %conv.4 = sitofp i32 %18 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.3
  %19 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next6.4 = add nuw nsw i64 %indvars.iv513, 5
  %20 = trunc i64 %indvars.iv.next6.4 to i32
  %conv.5 = sitofp i32 %20 to double
  %21 = insertelement <2 x double> undef, double %conv.4, i32 0
  %22 = insertelement <2 x double> %21, double %conv.5, i32 1
  store <2 x double> %22, <2 x double>* %19, align 8
  %indvars.iv.next6.5 = add nuw nsw i64 %indvars.iv513, 6
  %23 = trunc i64 %indvars.iv.next6.5 to i32
  %conv.6 = sitofp i32 %23 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.5
  %24 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next6.6 = add nuw nsw i64 %indvars.iv513, 7
  %25 = trunc i64 %indvars.iv.next6.6 to i32
  %conv.7 = sitofp i32 %25 to double
  %26 = insertelement <2 x double> undef, double %conv.6, i32 0
  %27 = insertelement <2 x double> %26, double %conv.7, i32 1
  store <2 x double> %27, <2 x double>* %24, align 8
  %indvars.iv.next6.7 = add nuw nsw i64 %indvars.iv513, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next6.7, 500
  br i1 %exitcond17.7, label %for.cond5.preheader.us.preheader, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113.for.cond1.preheader_crit_edge, %entry
  %indvars.iv1636 = phi i64 [ 0, %entry ], [ %indvars.iv.next17, %for.inc113.for.cond1.preheader_crit_edge ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge, %for.cond10.preheader.us.preheader
  %indvar = phi i64 [ %0, %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv323.us = phi i64 [ %indvars.iv.next4.us, %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add nuw nsw i64 %indvar, 1
  %1 = add nsw i64 %indvars.iv323.us, -1
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %scevgep125 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 1200
  %scevgep128 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep131 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %0, i64 1200
  %bound0133 = icmp ult double* %scevgep122, %scevgep131
  %bound1134 = icmp ult double* %scevgep128, %scevgep125
  %memcheck.conflict136 = and i1 %bound0133, %bound1134
  br i1 %memcheck.conflict136, label %for.inc31.us.preheader, label %vector.body112.preheader

vector.body112.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body112

vector.body112:                                   ; preds = %vector.body112.vector.body112_crit_edge, %vector.body112.preheader
  %index139 = phi i64 [ %index.next140, %vector.body112.vector.body112_crit_edge ], [ 0, %vector.body112.preheader ]
  %2 = shl i64 %index139, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %2
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec148 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec149 = shufflevector <4 x double> %wide.vec148, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec150 = shufflevector <4 x double> %wide.vec148, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %2
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec151 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %2
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec154 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec151, %wide.vec154
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec149, %11
  %13 = or i64 %2, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %13
  %15 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %17 = fsub <2 x double> %strided.vec150, %16
  %18 = getelementptr double, double* %14, i64 -1
  %19 = bitcast double* %18 to <4 x double>*
  %interleaved.vec157 = shufflevector <2 x double> %12, <2 x double> %17, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec157, <4 x double>* %19, align 8, !alias.scope !3, !noalias !6
  %index.next140 = add i64 %index139, 2
  %20 = icmp eq i64 %index.next140, 600
  br i1 %20, label %middle.block113, label %vector.body112.vector.body112_crit_edge, !llvm.loop !8

vector.body112.vector.body112_crit_edge:          ; preds = %vector.body112
  br label %vector.body112

middle.block113:                                  ; preds = %vector.body112
  br label %for.cond10.for.inc34_crit_edge.us

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us.for.inc31.us_crit_edge, %for.inc31.us.preheader
  %indvars.iv121.us = phi i64 [ %indvars.iv.next2.us.1, %for.inc31.us.for.inc31.us_crit_edge ], [ 0, %for.inc31.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %21 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %22 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv121.us
  %23 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %22, %23
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %21, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us = or i64 %indvars.iv121.us, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %24 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %25 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv.next2.us
  %26 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %25, %26
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %24, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next2.us.1 = add nsw i64 %indvars.iv121.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next2.us.1, 1200
  br i1 %exitcond.1, label %for.inc31.us.for.cond10.for.inc34_crit_edge.us_crit_edge, label %for.inc31.us.for.inc31.us_crit_edge, !llvm.loop !11

for.inc31.us.for.inc31.us_crit_edge:              ; preds = %for.inc31.us
  br label %for.inc31.us

for.inc31.us.for.cond10.for.inc34_crit_edge.us_crit_edge: ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.inc31.us.for.cond10.for.inc34_crit_edge.us_crit_edge, %middle.block113
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv323.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond, label %for.cond40.preheader.us.preheader, label %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge

for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge: ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next.7, %for.inc.for.inc_crit_edge ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr188 = mul i64 %indvars.iv1636, 8
  %sunkaddr189 = add i64 %sunkaddr, %sunkaddr188
  %sunkaddr190 = inttoptr i64 %sunkaddr189 to i64*
  %27 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv19
  %28 = bitcast double* %arrayidx6 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next = or i64 %indvars.iv19, 1
  %29 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %30 = bitcast double* %arrayidx6.1 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv19, 2
  %31 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx6.2 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv19, 3
  %33 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %34 = bitcast double* %arrayidx6.3 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv19, 4
  %35 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %36 = bitcast double* %arrayidx6.4 to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv19, 5
  %37 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %38 = bitcast double* %arrayidx6.5 to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv19, 6
  %39 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %40 = bitcast double* %arrayidx6.6 to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv19, 7
  %41 = load i64, i64* %sunkaddr190, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %42 = bitcast double* %arrayidx6.7 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv19, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge, %for.cond40.preheader.us.preheader
  %indvars.iv928.us = phi i64 [ %indvars.iv.next10.us, %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1
  %43 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1
  %44 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 0
  %45 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %44, %45
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %43, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 2
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1200
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1200
  %bound092 = icmp ult double* %scevgep81, %scevgep90
  %bound193 = icmp ult double* %arrayidx50.us.prol, %scevgep84
  %memcheck.conflict95 = and i1 %bound092, %bound193
  br i1 %memcheck.conflict95, label %for.cond40.preheader.us.for.inc63.us.preheader_crit_edge, label %vector.body75.preheader

for.cond40.preheader.us.for.inc63.us.preheader_crit_edge: ; preds = %for.cond40.preheader.us
  br label %for.inc63.us.preheader

vector.body75.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body75

vector.body75:                                    ; preds = %vector.body75.vector.body75_crit_edge, %vector.body75.preheader
  %index98 = phi i64 [ %index.next99, %vector.body75.vector.body75_crit_edge ], [ 0, %vector.body75.preheader ]
  %46 = shl i64 %index98, 1
  %offset.idx = or i64 %46, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %offset.idx
  %48 = bitcast double* %47 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec105 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %offset.idx
  %50 = getelementptr double, double* %49, i64 -1
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec106 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !15
  %strided.vec107 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec108 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fsub <2 x double> %strided.vec108, %strided.vec107
  %53 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %strided.vec, %53
  %55 = or i64 %46, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %55
  %58 = getelementptr double, double* %57, i64 -1
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec109 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !15
  %strided.vec110 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec111 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = fsub <2 x double> %strided.vec111, %strided.vec110
  %61 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>
  %62 = fsub <2 x double> %strided.vec105, %61
  %63 = getelementptr double, double* %56, i64 -1
  %64 = bitcast double* %63 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %54, <2 x double> %62, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %64, align 8, !alias.scope !12, !noalias !15
  %index.next99 = add i64 %index98, 2
  %65 = icmp eq i64 %index.next99, 598
  br i1 %65, label %middle.block76, label %vector.body75.vector.body75_crit_edge, !llvm.loop !17

vector.body75.vector.body75_crit_edge:            ; preds = %vector.body75
  br label %vector.body75

middle.block76:                                   ; preds = %vector.body75
  br label %for.inc63.us.preheader

for.inc63.us.preheader:                           ; preds = %for.cond40.preheader.us.for.inc63.us.preheader_crit_edge, %middle.block76
  %indvars.iv626.us.ph = phi i64 [ 2, %for.cond40.preheader.us.for.inc63.us.preheader_crit_edge ], [ 1198, %middle.block76 ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.for.inc63.us_crit_edge, %for.inc63.us.preheader
  %indvars.iv626.us = phi i64 [ %indvars.iv.next7.us.1, %for.inc63.us.for.inc63.us_crit_edge ], [ %indvars.iv626.us.ph, %for.inc63.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %66 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %67 = load double, double* %arrayidx50.us, align 8
  %68 = add nsw i64 %indvars.iv626.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %68
  %69 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %67, %69
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %66, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next7.us = or i64 %indvars.iv626.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %70 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %71 = load double, double* %arrayidx50.us.1, align 8
  %72 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %71, %72
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %70, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv626.us, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next7.us.1, 1200
  br i1 %exitcond44.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.for.inc63.us_crit_edge, !llvm.loop !18

for.inc63.us.for.inc63.us_crit_edge:              ; preds = %for.inc63.us
  br label %for.inc63.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv928.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond47, label %for.cond73.preheader.us.preheader, label %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge

for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge: ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge, %for.cond73.preheader.us.preheader
  %indvars.iv1333.us = phi i64 [ %73, %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 0
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 1199
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 0
  %73 = add nuw nsw i64 %indvars.iv1333.us, 1
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %73, i64 0
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %73, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep56
  %bound1 = icmp ult double* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult double* %scevgep, %scevgep60
  %bound163 = icmp ult double* %scevgep58, %scevgep52
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  br i1 %conflict.rdx, label %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge, label %vector.body.preheader

for.cond73.preheader.us.for.inc107.us.preheader_crit_edge: ; preds = %for.cond73.preheader.us
  br label %for.inc107.us.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !19, !noalias !22
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %78 = or i64 %index, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !25
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !25
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !25
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !25
  %87 = fsub <2 x double> %wide.load67, %wide.load69
  %88 = fsub <2 x double> %wide.load68, %wide.load70
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %73, i64 %index
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !26
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !26
  %93 = fadd <2 x double> %87, %wide.load71
  %94 = fadd <2 x double> %88, %wide.load72
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %index
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !26
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !26
  %99 = fsub <2 x double> %93, %wide.load73
  %100 = fsub <2 x double> %94, %wide.load74
  %101 = fmul <2 x double> %99, <double 7.000000e-01, double 7.000000e-01>
  %102 = fmul <2 x double> %100, <double 7.000000e-01, double 7.000000e-01>
  %103 = fsub <2 x double> %wide.load, %101
  %104 = fsub <2 x double> %wide.load66, %102
  store <2 x double> %103, <2 x double>* %75, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %104, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %index.next = add nuw nsw i64 %index, 4
  %105 = icmp eq i64 %index.next, 1196
  br i1 %105, label %vector.body.for.inc107.us.preheader_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !27

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.for.inc107.us.preheader_crit_edge:    ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %vector.body.for.inc107.us.preheader_crit_edge, %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge
  %indvars.iv1131.us.ph = phi i64 [ 0, %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge ], [ 1196, %vector.body.for.inc107.us.preheader_crit_edge ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.for.inc107.us_crit_edge, %for.inc107.us.preheader
  %indvars.iv1131.us = phi i64 [ %indvars.iv.next12.us, %for.inc107.us.for.inc107.us_crit_edge ], [ %indvars.iv1131.us.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %106 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1131.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv.next12.us
  %107 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %108 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %107, %108
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %73, i64 %indvars.iv1131.us
  %109 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %109
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %110 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %110
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %106, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next12.us, 1199
  br i1 %cmp75.us, label %for.inc107.us.for.inc107.us_crit_edge, label %for.cond73.for.inc110_crit_edge.us, !llvm.loop !28

for.inc107.us.for.inc107.us_crit_edge:            ; preds = %for.inc107.us
  br label %for.inc107.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond187 = icmp eq i64 %73, 999
  br i1 %exitcond187, label %for.inc113, label %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge

for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge: ; preds = %for.cond73.for.inc110_crit_edge.us
  br label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1636, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next17, 500
  br i1 %exitcond48, label %for.end115, label %for.inc113.for.cond1.preheader_crit_edge

for.inc113.for.cond1.preheader_crit_edge:         ; preds = %for.inc113
  br label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %entry
  %indvars.iv2036.us = phi i64 [ %indvars.iv.next21.us, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ], [ 0, %entry ]
  %3 = mul nuw nsw i64 %indvars.iv2036.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv1734.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next18.us, %for.inc.us.for.body4.us_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv1734.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2036.us, i64 %indvars.iv1734.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1734.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next18.us, 1200
  br i1 %exitcond46, label %for.cond2.for.inc10_crit_edge.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2036.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond47, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge, %for.end12
  %indvars.iv1431.us = phi i64 [ %indvars.iv.next15.us, %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge ], [ 0, %for.end12 ]
  %13 = mul nuw nsw i64 %indvars.iv1431.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us.for.body21.us_crit_edge, %for.cond19.preheader.us
  %indvars.iv1129.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next12.us, %for.inc34.us.for.body21.us_crit_edge ]
  %14 = add nuw nsw i64 %indvars.iv1129.us, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.body21.us.for.inc34.us_crit_edge

for.body21.us.for.inc34.us_crit_edge:             ; preds = %for.body21.us
  br label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.body21.us.for.inc34.us_crit_edge, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1431.us, i64 %indvars.iv1129.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1129.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond43, label %for.cond19.for.inc37_crit_edge.us, label %for.inc34.us.for.body21.us_crit_edge

for.inc34.us.for.body21.us_crit_edge:             ; preds = %for.inc34.us
  br label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1431.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond44, label %for.end39, label %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge

for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge: ; preds = %for.cond19.for.inc37_crit_edge.us
  br label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge, %for.end39
  %indvars.iv826.us = phi i64 [ %indvars.iv.next9.us, %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge ], [ 0, %for.end39 ]
  %21 = mul nuw nsw i64 %indvars.iv826.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us.for.body47.us_crit_edge, %for.cond45.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %for.inc60.us.for.body47.us_crit_edge ]
  %22 = add nuw nsw i64 %indvars.iv24.us, %21
  %23 = trunc i64 %22 to i32
  %rem50.us = srem i32 %23, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %for.body47.us.for.inc60.us_crit_edge

for.body47.us.for.inc60.us_crit_edge:             ; preds = %for.body47.us
  br label %for.inc60.us

if.then52.us:                                     ; preds = %for.body47.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %for.inc60.us

for.inc60.us:                                     ; preds = %for.body47.us.for.inc60.us_crit_edge, %if.then52.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv826.us, i64 %indvars.iv24.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.inc60.us.for.body47.us_crit_edge

for.inc60.us.for.body47.us_crit_edge:             ; preds = %for.inc60.us
  br label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv826.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond41, label %for.end65, label %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge

for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge: ; preds = %for.cond45.for.inc63_crit_edge.us
  br label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}

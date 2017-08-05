; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) unnamed_addr #2 {
entry:
  br label %for.body.prol

for.body.prol:                                    ; preds = %entry, %for.body.prol
  %indvars.iv11.prol = phi i64 [ %indvars.iv.next9.prol, %for.body.prol ], [ 0, %entry ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv11.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv11.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next9.prol = add nuw nsw i64 %indvars.iv11.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.preheader, label %for.body.prol, !llvm.loop !1

for.body.preheader:                               ; preds = %for.body.prol
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv7.us = phi i64 [ %indvars.iv.next5.us, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv7.us to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.body8.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %3 = trunc i64 %indvars.iv.next.us to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv7.us, i64 %indvars.iv4.us
  %4 = add nuw nsw i64 %indvars.iv4.us, 2
  %5 = trunc i64 %4 to i32
  %conv18.us = sitofp i32 %5 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv7.us, i64 %indvars.iv4.us
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv4.us, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv7.us, i64 %indvars.iv4.us
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv7.us, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond12, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv11 = phi i64 [ %indvars.iv.next9.7, %for.body ], [ %indvars.iv.next9.prol, %for.body.preheader ]
  %8 = trunc i64 %indvars.iv11 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv11
  %9 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv11, 1
  %10 = trunc i64 %indvars.iv.next9 to i32
  %conv.1 = sitofp i32 %10 to double
  %11 = insertelement <2 x double> undef, double %conv, i32 0
  %12 = insertelement <2 x double> %11, double %conv.1, i32 1
  store <2 x double> %12, <2 x double>* %9, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv11, 2
  %13 = trunc i64 %indvars.iv.next9.1 to i32
  %conv.2 = sitofp i32 %13 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.1
  %14 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv11, 3
  %15 = trunc i64 %indvars.iv.next9.2 to i32
  %conv.3 = sitofp i32 %15 to double
  %16 = insertelement <2 x double> undef, double %conv.2, i32 0
  %17 = insertelement <2 x double> %16, double %conv.3, i32 1
  store <2 x double> %17, <2 x double>* %14, align 8
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv11, 4
  %18 = trunc i64 %indvars.iv.next9.3 to i32
  %conv.4 = sitofp i32 %18 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.3
  %19 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next9.4 = add nsw i64 %indvars.iv11, 5
  %20 = trunc i64 %indvars.iv.next9.4 to i32
  %conv.5 = sitofp i32 %20 to double
  %21 = insertelement <2 x double> undef, double %conv.4, i32 0
  %22 = insertelement <2 x double> %21, double %conv.5, i32 1
  store <2 x double> %22, <2 x double>* %19, align 8
  %indvars.iv.next9.5 = add nsw i64 %indvars.iv11, 6
  %23 = trunc i64 %indvars.iv.next9.5 to i32
  %conv.6 = sitofp i32 %23 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next9.5
  %24 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next9.6 = add nsw i64 %indvars.iv11, 7
  %25 = trunc i64 %indvars.iv.next9.6 to i32
  %conv.7 = sitofp i32 %25 to double
  %26 = insertelement <2 x double> undef, double %conv.6, i32 0
  %27 = insertelement <2 x double> %26, double %conv.7, i32 1
  store <2 x double> %27, <2 x double>* %24, align 8
  %indvars.iv.next9.7 = add nsw i64 %indvars.iv11, 8
  %exitcond15.7 = icmp eq i64 %indvars.iv.next9.7, 500
  br i1 %exitcond15.7, label %for.cond5.preheader.us.preheader, label %for.body

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv34 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv9.us = phi i64 [ %indvars.iv.next6.us, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep121 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep123 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv9.us, -1
  %bound0125 = icmp ult double* %scevgep117, %scevgep123
  %bound1126 = icmp ult double* %scevgep121, %scevgep119
  %memcheck.conflict128 = and i1 %bound0125, %bound1126
  br i1 %memcheck.conflict128, label %for.body12.us.preheader, label %vector.body112.preheader

vector.body112.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body112

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

vector.body112:                                   ; preds = %vector.body112.preheader, %vector.body112
  %index131 = phi i64 [ %index.next132, %vector.body112 ], [ 0, %vector.body112.preheader ]
  %offset.idx135 = shl i64 %index131, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv9.us, i64 %offset.idx135
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec139 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec140 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec141 = shufflevector <4 x double> %wide.vec139, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv9.us, i64 %offset.idx135
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec142 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %offset.idx135
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec145 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec142, %wide.vec145
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec140, %11
  %13 = or i64 %offset.idx135, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv9.us, i64 %13
  %15 = fsub <4 x double> %wide.vec142, %wide.vec145
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec141, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec148 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec148, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next132 = add i64 %index131, 2
  %21 = icmp eq i64 %index.next132, 600
  br i1 %21, label %for.cond10.for.inc34_crit_edge.us.loopexit5, label %vector.body112, !llvm.loop !8

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv5.us = phi i64 [ %indvars.iv.next3.us.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv9.us, i64 %indvars.iv5.us
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv9.us, i64 %indvars.iv5.us
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv5.us
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next3.us = or i64 %indvars.iv5.us, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv9.us, i64 %indvars.iv.next3.us
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv9.us, i64 %indvars.iv.next3.us
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next3.us
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next3.us.1 = add nsw i64 %indvars.iv5.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next3.us.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !11

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit5:      ; preds = %vector.body112
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit5, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv9.us, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next6.us, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond27, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.cond1.preheader, %for.body3
  %indvars.iv2 = phi i64 [ %indvars.iv.next.7, %for.body3 ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr2 = mul i64 %indvars.iv34, 8
  %sunkaddr3 = add i64 %sunkaddr, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to i64*
  %28 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv2
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %30 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv2, 2
  %32 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv2, 3
  %34 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv2, 4
  %36 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv2, 5
  %38 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %39 = bitcast double* %arrayidx6.5 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv2, 6
  %40 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %41 = bitcast double* %arrayidx6.6 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv2, 7
  %42 = load i64, i64* %sunkaddr4, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %43 = bitcast double* %arrayidx6.7 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv2, 8
  %exitcond38.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond38.7, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv17.us = phi i64 [ %indvars.iv.next15.us, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 2
  %44 = add i64 %indvars.iv17.us, 1
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %44, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %44, i64 0
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 1
  %45 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 1
  %46 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 0
  %47 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %46, %47
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %45, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %bound092 = icmp ult double* %scevgep84, %scevgep90
  %bound193 = icmp ult double* %scevgep88, %scevgep86
  %memcheck.conflict95 = and i1 %bound092, %bound193
  br i1 %memcheck.conflict95, label %for.body42.us.preheader, label %vector.body79.preheader

vector.body79.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79.preheader, %vector.body79
  %index98 = phi i64 [ %index.next99, %vector.body79 ], [ 0, %vector.body79.preheader ]
  %48 = shl i64 %index98, 1
  %offset.idx = or i64 %48, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 %offset.idx
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec105 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 %offset.idx
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec106 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !15
  %strided.vec107 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec108 = shufflevector <4 x double> %wide.vec106, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = fsub <2 x double> %strided.vec108, %strided.vec107
  %55 = fmul <2 x double> %54, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %strided.vec, %55
  %57 = or i64 %48, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 %57
  %60 = getelementptr double, double* %59, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec109 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !15
  %strided.vec110 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec111 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fsub <2 x double> %strided.vec111, %strided.vec110
  %63 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %strided.vec105, %63
  %65 = getelementptr double, double* %58, i64 -1
  %66 = bitcast double* %65 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %56, <2 x double> %64, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %66, align 8, !alias.scope !12, !noalias !15
  %index.next99 = add i64 %index98, 2
  %67 = icmp eq i64 %index.next99, 598
  br i1 %67, label %for.body42.us.preheader.loopexit, label %vector.body79, !llvm.loop !17

for.body42.us.preheader.loopexit:                 ; preds = %vector.body79
  br label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv14.us.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %for.body42.us.preheader.loopexit ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv14.us = phi i64 [ %indvars.iv.next11.us.1, %for.body42.us ], [ %indvars.iv14.us.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 %indvars.iv14.us
  %68 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 %indvars.iv14.us
  %69 = load double, double* %arrayidx50.us, align 8
  %70 = add nsw i64 %indvars.iv14.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 %70
  %71 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %69, %71
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %68, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next11.us = or i64 %indvars.iv14.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17.us, i64 %indvars.iv.next11.us
  %72 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17.us, i64 %indvars.iv.next11.us
  %73 = load double, double* %arrayidx50.us.1, align 8
  %74 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %73, %74
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %72, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next11.us.1 = add nsw i64 %indvars.iv14.us, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next11.us.1, 1200
  br i1 %exitcond28.1, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us, !llvm.loop !18

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond29, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv25.us = phi i64 [ %76, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25.us, i64 0
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25.us, i64 1199
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv25.us, i64 0
  %75 = add i64 %indvars.iv25.us, 1
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %75, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25.us, i64 0
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %75, i64 1199
  %76 = add nuw nsw i64 %indvars.iv25.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep60
  %bound1 = icmp ult double* %scevgep58, %scevgep56
  %found.conflict = and i1 %bound0, %bound1
  %bound066 = icmp ult double* %scevgep, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep56
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25.us, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !19, !noalias !22
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !19, !noalias !22
  %81 = or i64 %index, 1
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv25.us, i64 %81
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !25
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !25
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv25.us, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !25
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !25
  %90 = fsub <2 x double> %wide.load71, %wide.load73
  %91 = fsub <2 x double> %wide.load72, %wide.load74
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %76, i64 %index
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !26
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !26
  %96 = fadd <2 x double> %90, %wide.load75
  %97 = fadd <2 x double> %91, %wide.load76
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25.us, i64 %index
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !26
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %101, align 8, !alias.scope !26
  %102 = fsub <2 x double> %96, %wide.load77
  %103 = fsub <2 x double> %97, %wide.load78
  %104 = fmul <2 x double> %102, <double 7.000000e-01, double 7.000000e-01>
  %105 = fmul <2 x double> %103, <double 7.000000e-01, double 7.000000e-01>
  %106 = fsub <2 x double> %wide.load, %104
  %107 = fsub <2 x double> %wide.load70, %105
  %108 = bitcast double* %77 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !alias.scope !19, !noalias !22
  %109 = bitcast double* %79 to <2 x double>*
  store <2 x double> %107, <2 x double>* %109, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %110 = icmp eq i64 %index.next, 1196
  br i1 %110, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv21.us.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv21.us = phi i64 [ %indvars.iv.next19.us, %for.body76.us ], [ %indvars.iv21.us.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25.us, i64 %indvars.iv21.us
  %111 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv21.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv25.us, i64 %indvars.iv.next19.us
  %112 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv25.us, i64 %indvars.iv21.us
  %113 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %112, %113
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %76, i64 %indvars.iv21.us
  %114 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %114
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25.us, i64 %indvars.iv21.us
  %115 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %115
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %111, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond30 = icmp eq i64 %indvars.iv.next19.us, 1199
  br i1 %exitcond30, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us, !llvm.loop !28

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %exitcond31 = icmp eq i64 %76, 999
  br i1 %exitcond31, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next32, 500
  br i1 %exitcond41, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %entry, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv31.us = phi i64 [ %indvars.iv.next28.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv31.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv27.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next24.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv27.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv31.us, i64 %indvars.iv27.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv27.us, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next24.us, 1200
  br i1 %exitcond36, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv31.us, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next28.us, 1000
  br i1 %exitcond37, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.end12, %for.cond19.for.inc37_crit_edge.us
  %indvars.iv22.us = phi i64 [ %indvars.iv.next19.us, %for.cond19.for.inc37_crit_edge.us ], [ 0, %for.end12 ]
  %13 = mul nsw i64 %indvars.iv22.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv18.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next15.us, %if.end28.us ]
  %14 = add nsw i64 %indvars.iv18.us, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22.us, i64 %indvars.iv18.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv18.us, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next15.us, 1200
  br i1 %exitcond34, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv22.us, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next19.us, 1000
  br i1 %exitcond35, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.end39, %for.cond45.for.inc63_crit_edge.us
  %indvars.iv13.us = phi i64 [ %indvars.iv.next10.us, %for.cond45.for.inc63_crit_edge.us ], [ 0, %for.end39 ]
  %21 = mul nsw i64 %indvars.iv13.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv9.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %if.end54.us ]
  %22 = add nsw i64 %indvars.iv9.us, %21
  %23 = trunc i64 %22 to i32
  %rem50.us = srem i32 %23, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.end54.us

if.then52.us:                                     ; preds = %for.body47.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %if.end54.us

if.end54.us:                                      ; preds = %for.body47.us, %if.then52.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv13.us, i64 %indvars.iv9.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv9.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond33, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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

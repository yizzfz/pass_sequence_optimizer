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
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
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
define internal fastcc void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) unnamed_addr #2 {
entry:
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol, %entry
  %indvars.iv513.prol = phi i64 [ %indvars.iv.next6.prol, %for.body.prol ], [ 0, %entry ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv513.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv513.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.preheader, label %for.body.prol, !llvm.loop !1

for.body.preheader:                               ; preds = %for.body.prol
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv310.us = phi i64 [ %indvars.iv.next4.us, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv310.us to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.body8.us ]
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
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv310.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond15, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv513 = phi i64 [ %indvars.iv.next6.7, %for.body ], [ %indvars.iv.next6.prol, %for.body.preheader ]
  %8 = trunc i64 %indvars.iv513 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513
  %9 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %10 = trunc i64 %indvars.iv.next6 to i32
  %conv.1 = sitofp i32 %10 to double
  %11 = insertelement <2 x double> undef, double %conv, i32 0
  %12 = insertelement <2 x double> %11, double %conv.1, i32 1
  store <2 x double> %12, <2 x double>* %9, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  %13 = trunc i64 %indvars.iv.next6.1 to i32
  %conv.2 = sitofp i32 %13 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.1
  %14 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv513, 3
  %15 = trunc i64 %indvars.iv.next6.2 to i32
  %conv.3 = sitofp i32 %15 to double
  %16 = insertelement <2 x double> undef, double %conv.2, i32 0
  %17 = insertelement <2 x double> %16, double %conv.3, i32 1
  store <2 x double> %17, <2 x double>* %14, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv513, 4
  %18 = trunc i64 %indvars.iv.next6.3 to i32
  %conv.4 = sitofp i32 %18 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.3
  %19 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv513, 5
  %20 = trunc i64 %indvars.iv.next6.4 to i32
  %conv.5 = sitofp i32 %20 to double
  %21 = insertelement <2 x double> undef, double %conv.4, i32 0
  %22 = insertelement <2 x double> %21, double %conv.5, i32 1
  store <2 x double> %22, <2 x double>* %19, align 8
  %indvars.iv.next6.5 = add nsw i64 %indvars.iv513, 6
  %23 = trunc i64 %indvars.iv.next6.5 to i32
  %conv.6 = sitofp i32 %23 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.5
  %24 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next6.6 = add nsw i64 %indvars.iv513, 7
  %25 = trunc i64 %indvars.iv.next6.6 to i32
  %conv.7 = sitofp i32 %25 to double
  %26 = insertelement <2 x double> undef, double %conv.6, i32 0
  %27 = insertelement <2 x double> %26, double %conv.7, i32 1
  store <2 x double> %27, <2 x double>* %24, align 8
  %indvars.iv.next6.7 = add nsw i64 %indvars.iv513, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next6.7, 500
  br i1 %exitcond17.7, label %for.cond5.preheader.us.preheader, label %for.body

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv1636 = phi i64 [ 0, %entry ], [ %indvars.iv.next17, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv323.us = phi i64 [ %indvars.iv.next4.us, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add nsw i64 %indvars.iv323.us, -1
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %scevgep127 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 1200
  %scevgep130 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %0, i64 1200
  %bound0135 = icmp ult double* %scevgep124, %scevgep133
  %bound1136 = icmp ult double* %scevgep130, %scevgep127
  %memcheck.conflict138 = and i1 %bound0135, %bound1136
  br i1 %memcheck.conflict138, label %for.body12.us.preheader, label %vector.body114.preheader

vector.body114.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body114

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

vector.body114:                                   ; preds = %vector.body114.preheader, %vector.body114
  %index141 = phi i64 [ %index.next142, %vector.body114 ], [ 0, %vector.body114.preheader ]
  %2 = shl i64 %index141, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %2
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec150 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec151 = shufflevector <4 x double> %wide.vec150, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec152 = shufflevector <4 x double> %wide.vec150, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %2
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec153 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %2
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec156 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec153, %wide.vec156
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec151, %11
  %13 = or i64 %2, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %13
  %15 = fsub <4 x double> %wide.vec153, %wide.vec156
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec152, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec159 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec159, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next142 = add i64 %index141, 2
  %21 = icmp eq i64 %index.next142, 600
  br i1 %21, label %for.cond10.for.inc34_crit_edge.us.loopexit194, label %vector.body114, !llvm.loop !8

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv121.us = phi i64 [ %indvars.iv.next2.us.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv121.us
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us = or i64 %indvars.iv121.us, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv.next2.us
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next2.us.1 = add nsw i64 %indvars.iv121.us, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next2.us.1, 1200
  br i1 %exitcond41.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !11

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit194:    ; preds = %vector.body114
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit194, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv323.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next4.us, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond42, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next.7, %for.body3 ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr191 = mul i64 %indvars.iv1636, 8
  %sunkaddr192 = add i64 %sunkaddr, %sunkaddr191
  %sunkaddr193 = inttoptr i64 %sunkaddr192 to i64*
  %28 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv19
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv19, 1
  %30 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv19, 2
  %32 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv19, 3
  %34 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv19, 4
  %36 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv19, 5
  %38 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %39 = bitcast double* %arrayidx6.5 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv19, 6
  %40 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %41 = bitcast double* %arrayidx6.6 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv19, 7
  %42 = load i64, i64* %sunkaddr193, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %43 = bitcast double* %arrayidx6.7 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv19, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv928.us = phi i64 [ %indvars.iv.next10.us, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1
  %44 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1
  %45 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 0
  %46 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %45, %46
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %44, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 2
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1200
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1200
  %bound094 = icmp ult double* %scevgep83, %scevgep92
  %bound195 = icmp ult double* %scevgep89, %scevgep86
  %memcheck.conflict97 = and i1 %bound094, %bound195
  br i1 %memcheck.conflict97, label %for.body42.us.preheader, label %vector.body77.preheader

vector.body77.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77.preheader, %vector.body77
  %index100 = phi i64 [ %index.next101, %vector.body77 ], [ 0, %vector.body77.preheader ]
  %47 = shl i64 %index100, 1
  %offset.idx = or i64 %47, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %offset.idx
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec107 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %offset.idx
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec108 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !15
  %strided.vec109 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec110 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fsub <2 x double> %strided.vec110, %strided.vec109
  %54 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %strided.vec, %54
  %56 = or i64 %47, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %56
  %59 = getelementptr double, double* %58, i64 -1
  %60 = bitcast double* %59 to <4 x double>*
  %wide.vec111 = load <4 x double>, <4 x double>* %60, align 8, !alias.scope !15
  %strided.vec112 = shufflevector <4 x double> %wide.vec111, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec113 = shufflevector <4 x double> %wide.vec111, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %61 = fsub <2 x double> %strided.vec113, %strided.vec112
  %62 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %63 = fsub <2 x double> %strided.vec107, %62
  %64 = getelementptr double, double* %57, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %55, <2 x double> %63, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %65, align 8, !alias.scope !12, !noalias !15
  %index.next101 = add i64 %index100, 2
  %66 = icmp eq i64 %index.next101, 598
  br i1 %66, label %for.body42.us.preheader.loopexit, label %vector.body77, !llvm.loop !17

for.body42.us.preheader.loopexit:                 ; preds = %vector.body77
  br label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv626.us.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %for.body42.us.preheader.loopexit ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv626.us = phi i64 [ %indvars.iv.next7.us.1, %for.body42.us ], [ %indvars.iv626.us.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %67 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %68 = load double, double* %arrayidx50.us, align 8
  %69 = add nsw i64 %indvars.iv626.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %69
  %70 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %68, %70
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %67, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next7.us = or i64 %indvars.iv626.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %71 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %72 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %73 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %72, %73
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %71, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv626.us, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next7.us.1, 1200
  br i1 %exitcond44.1, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us, !llvm.loop !18

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv928.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond45, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv1333.us = phi i64 [ %indvars.iv.next14.us, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 0
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 1199
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 0
  %74 = add i64 %indvars.iv1333.us, 1
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %74, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %74, i64 1199
  %75 = add nuw nsw i64 %indvars.iv1333.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep58
  %bound1 = icmp ult double* %scevgep56, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %bound064 = icmp ult double* %scevgep, %scevgep62
  %bound165 = icmp ult double* %scevgep60, %scevgep54
  %found.conflict66 = and i1 %bound064, %bound165
  %conflict.rdx = or i1 %found.conflict, %found.conflict66
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !19, !noalias !22
  %80 = or i64 %index, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !25
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !25
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !25
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !25
  %89 = fsub <2 x double> %wide.load69, %wide.load71
  %90 = fsub <2 x double> %wide.load70, %wide.load72
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %75, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !26
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !26
  %95 = fadd <2 x double> %89, %wide.load73
  %96 = fadd <2 x double> %90, %wide.load74
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %index
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !26
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !26
  %101 = fsub <2 x double> %95, %wide.load75
  %102 = fsub <2 x double> %96, %wide.load76
  %103 = fmul <2 x double> %101, <double 7.000000e-01, double 7.000000e-01>
  %104 = fmul <2 x double> %102, <double 7.000000e-01, double 7.000000e-01>
  %105 = fsub <2 x double> %wide.load, %103
  %106 = fsub <2 x double> %wide.load68, %104
  %107 = bitcast double* %76 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !19, !noalias !22
  %108 = bitcast double* %78 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %109 = icmp eq i64 %index.next, 1196
  br i1 %109, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv1131.us.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv1131.us = phi i64 [ %indvars.iv.next12.us, %for.body76.us ], [ %indvars.iv1131.us.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %110 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1131.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv.next12.us
  %111 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %112 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %111, %112
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %75, i64 %indvars.iv1131.us
  %113 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %113
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %114 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %114
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %110, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next12.us, 1199
  br i1 %cmp75.us, label %for.body76.us, label %for.cond73.for.inc110_crit_edge.us, !llvm.loop !28

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1333.us, 1
  %cmp71.us = icmp slt i64 %indvars.iv.next14.us, 999
  br i1 %cmp71.us, label %for.cond73.preheader.us, label %for.inc113

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1636, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next17, 500
  br i1 %exitcond46, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv2036.us = phi i64 [ %indvars.iv.next21.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv2036.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv1734.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next18.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv1734.us, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2036.us, i64 %indvars.iv1734.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1734.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next18.us, 1200
  br i1 %exitcond46, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2036.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond47, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.end12
  %indvars.iv1431.us = phi i64 [ %indvars.iv.next15.us, %for.cond19.for.inc37_crit_edge.us ], [ 0, %for.end12 ]
  %13 = mul nsw i64 %indvars.iv1431.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv1129.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next12.us, %if.end28.us ]
  %14 = add nsw i64 %indvars.iv1129.us, %13
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1431.us, i64 %indvars.iv1129.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1129.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond43, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1431.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond44, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv826.us = phi i64 [ %indvars.iv.next9.us, %for.cond45.for.inc63_crit_edge.us ], [ 0, %for.end39 ]
  %21 = mul nsw i64 %indvars.iv826.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %if.end54.us ]
  %22 = add nsw i64 %indvars.iv24.us, %21
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv826.us, i64 %indvars.iv24.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv826.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond41, label %for.end65, label %for.cond45.preheader.us

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

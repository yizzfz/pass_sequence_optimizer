; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
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
for.body.preheader:
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv10 to i32
  %conv9.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv18.us = sitofp i32 %4 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond12, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv13 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next14.4, %for.body ]
  %7 = trunc i64 %indvars.iv13 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv13
  %8 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %9 = trunc i64 %indvars.iv.next14 to i32
  %conv.1 = sitofp i32 %9 to double
  %10 = insertelement <2 x double> undef, double %conv, i32 0
  %11 = insertelement <2 x double> %10, double %conv.1, i32 1
  store <2 x double> %11, <2 x double>* %8, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %12 = trunc i64 %indvars.iv.next14.1 to i32
  %conv.2 = sitofp i32 %12 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next14.1
  %13 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next14.2 = add nsw i64 %indvars.iv13, 3
  %14 = trunc i64 %indvars.iv.next14.2 to i32
  %conv.3 = sitofp i32 %14 to double
  %15 = insertelement <2 x double> undef, double %conv.2, i32 0
  %16 = insertelement <2 x double> %15, double %conv.3, i32 1
  store <2 x double> %16, <2 x double>* %13, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv13, 4
  %17 = trunc i64 %indvars.iv.next14.3 to i32
  %conv.4 = sitofp i32 %17 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next14.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next14.4 = add nsw i64 %indvars.iv13, 5
  %exitcond15.4 = icmp eq i64 %indvars.iv.next14.4, 500
  br i1 %exitcond15.4, label %for.cond5.preheader.us.preheader, label %for.body

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.inc113, %for.cond1.preheader.lr.ph
  %indvars.iv38 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next39, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %0, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv22, -1
  %bound0124 = icmp ult double* %scevgep116, %scevgep122
  %bound1125 = icmp ult double* %scevgep120, %scevgep118
  %memcheck.conflict127 = and i1 %bound0124, %bound1125
  br i1 %memcheck.conflict127, label %for.body12.us.preheader, label %vector.body111.preheader

vector.body111.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body111

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

vector.body111:                                   ; preds = %vector.body111.preheader, %vector.body111
  %index130 = phi i64 [ %index.next131, %vector.body111 ], [ 0, %vector.body111.preheader ]
  %offset.idx134 = shl i64 %index130, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %offset.idx134
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec138 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %strided.vec139 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec140 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %offset.idx134
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec141 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %offset.idx134
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec144 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !4
  %9 = fsub <4 x double> %wide.vec141, %wide.vec144
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec139, %11
  %13 = or i64 %offset.idx134, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %13
  %15 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %17 = fsub <2 x double> %strided.vec140, %16
  %18 = getelementptr double, double* %14, i64 -1
  %19 = bitcast double* %18 to <4 x double>*
  %interleaved.vec147 = shufflevector <2 x double> %12, <2 x double> %17, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec147, <4 x double>* %19, align 8, !alias.scope !1, !noalias !4
  %index.next131 = add i64 %index130, 2
  %20 = icmp eq i64 %index.next131, 600
  br i1 %20, label %for.cond10.for.inc34_crit_edge.us.loopexit152, label %vector.body111, !llvm.loop !6

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %indvars.iv20
  %21 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %indvars.iv20
  %22 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv20
  %23 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %22, %23
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %21, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv22, i64 %indvars.iv.next21
  %24 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv22, i64 %indvars.iv.next21
  %25 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next21
  %26 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %25, %26
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %24, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next21.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !9

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit152:    ; preds = %vector.body111
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit152, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.7, %for.body3 ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr149 = mul i64 %indvars.iv38, 8
  %sunkaddr150 = add i64 %sunkaddr, %sunkaddr149
  %sunkaddr151 = inttoptr i64 %sunkaddr150 to i64*
  %27 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %28 = bitcast double* %arrayidx6 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %30 = bitcast double* %arrayidx6.1 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %31 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx6.2 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %33 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %34 = bitcast double* %arrayidx6.3 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %35 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %36 = bitcast double* %arrayidx6.4 to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %37 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %38 = bitcast double* %arrayidx6.5 to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %39 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %40 = bitcast double* %arrayidx6.6 to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %41 = load i64, i64* %sunkaddr151, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %42 = bitcast double* %arrayidx6.7 to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv29 = phi i64 [ %43, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 2
  %43 = add i64 %indvars.iv29, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %43, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %43, i64 0
  %arrayidx46.us41 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 1
  %44 = load double, double* %arrayidx46.us41, align 8
  %45 = load double, double* %scevgep82, align 8
  %arrayidx55.us43 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 0
  %46 = load double, double* %arrayidx55.us43, align 8
  %sub56.us44 = fsub double %45, %46
  %mul57.us45 = fmul double %sub56.us44, 5.000000e-01
  %sub58.us46 = fsub double %44, %mul57.us45
  store double %sub58.us46, double* %arrayidx46.us41, align 8
  %bound086 = icmp ult double* %scevgep78, %scevgep84
  %bound187 = icmp ult double* %scevgep82, %scevgep80
  %memcheck.conflict89 = and i1 %bound086, %bound187
  br i1 %memcheck.conflict89, label %for.body42.us.1.preheader, label %vector.body73.preheader

vector.body73.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body73

for.body42.us.1.preheader.loopexit:               ; preds = %vector.body73
  br label %for.body42.us.1.preheader

for.body42.us.1.preheader:                        ; preds = %for.body42.us.1.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv.next2648.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %for.body42.us.1.preheader.loopexit ]
  %indvars.iv2547.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %for.body42.us.1.preheader.loopexit ]
  br label %for.body42.us.1

vector.body73:                                    ; preds = %vector.body73.preheader, %vector.body73
  %index92 = phi i64 [ %index.next93, %vector.body73 ], [ 0, %vector.body73.preheader ]
  %47 = shl i64 %index92, 1
  %offset.idx = or i64 %47, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 %offset.idx
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec104 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %offset.idx
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec105 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !13
  %strided.vec106 = shufflevector <4 x double> %wide.vec105, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec107 = shufflevector <4 x double> %wide.vec105, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fsub <2 x double> %strided.vec107, %strided.vec106
  %54 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %strided.vec, %54
  %56 = or i64 %47, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %56
  %59 = getelementptr double, double* %58, i64 -1
  %60 = bitcast double* %59 to <4 x double>*
  %wide.vec108 = load <4 x double>, <4 x double>* %60, align 8, !alias.scope !13
  %strided.vec109 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec110 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %61 = fsub <2 x double> %strided.vec110, %strided.vec109
  %62 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %63 = fsub <2 x double> %strided.vec104, %62
  %64 = getelementptr double, double* %57, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %55, <2 x double> %63, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %65, align 8, !alias.scope !10, !noalias !13
  %index.next93 = add i64 %index92, 2
  %66 = icmp eq i64 %index.next93, 598
  br i1 %66, label %for.body42.us.1.preheader.loopexit, label %vector.body73, !llvm.loop !15

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us.1
  %exitcond31 = icmp eq i64 %43, 1000
  br i1 %exitcond31, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv35 = phi i64 [ %67, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv35, i64 0
  %scevgep50 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv35, i64 1199
  %scevgep52 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv35, i64 0
  %67 = add i64 %indvars.iv35, 1
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %67, i64 0
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv35, i64 0
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %67, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ult double* %scevgep52, %scevgep50
  %found.conflict = and i1 %bound0, %bound1
  %bound060 = icmp ult double* %scevgep, %scevgep58
  %bound161 = icmp ult double* %scevgep56, %scevgep50
  %found.conflict62 = and i1 %bound060, %bound161
  %conflict.rdx = or i1 %found.conflict, %found.conflict62
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv35, i64 %index
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !16, !noalias !19
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !16, !noalias !19
  %72 = or i64 %index, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv35, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !22
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !22
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv35, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !22
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !22
  %81 = fsub <2 x double> %wide.load65, %wide.load67
  %82 = fsub <2 x double> %wide.load66, %wide.load68
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %67, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !23
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !23
  %87 = fadd <2 x double> %81, %wide.load69
  %88 = fadd <2 x double> %82, %wide.load70
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv35, i64 %index
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !23
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !23
  %93 = fsub <2 x double> %87, %wide.load71
  %94 = fsub <2 x double> %88, %wide.load72
  %95 = fmul <2 x double> %93, <double 7.000000e-01, double 7.000000e-01>
  %96 = fmul <2 x double> %94, <double 7.000000e-01, double 7.000000e-01>
  %97 = fsub <2 x double> %wide.load, %95
  %98 = fsub <2 x double> %wide.load64, %96
  store <2 x double> %97, <2 x double>* %69, align 8, !alias.scope !16, !noalias !19
  store <2 x double> %98, <2 x double>* %71, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %99 = icmp eq i64 %index.next, 1196
  br i1 %99, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !24

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv32.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.body76.us ], [ %indvars.iv32.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv35, i64 %indvars.iv32
  %100 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv35, i64 %indvars.iv.next33
  %101 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv35, i64 %indvars.iv32
  %102 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %101, %102
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %67, i64 %indvars.iv32
  %103 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %103
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv35, i64 %indvars.iv32
  %104 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %104
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %100, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 1199
  br i1 %exitcond34, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us, !llvm.loop !25

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %exitcond37 = icmp eq i64 %67, 999
  br i1 %exitcond37, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 500
  br i1 %exitcond40, label %for.end115, label %for.body3.lr.ph

for.end115:                                       ; preds = %for.inc113
  ret void

for.body42.us.1:                                  ; preds = %for.body42.us.1.preheader, %for.body42.us.1
  %indvars.iv.next2648 = phi i64 [ %indvars.iv.next26, %for.body42.us.1 ], [ %indvars.iv.next2648.ph, %for.body42.us.1.preheader ]
  %indvars.iv2547 = phi i64 [ %indvars.iv.next26.1, %for.body42.us.1 ], [ %indvars.iv2547.ph, %for.body42.us.1.preheader ]
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 %indvars.iv.next2648
  %105 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %indvars.iv.next2648
  %106 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %indvars.iv2547
  %107 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %106, %107
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %105, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv2547, 2
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv29, i64 %indvars.iv.next26.1
  %108 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %indvars.iv.next26.1
  %109 = load double, double* %arrayidx50.us, align 8
  %110 = add nsw i64 %indvars.iv2547, 1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv29, i64 %110
  %111 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %109, %111
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %108, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv2547, 3
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us.1, !llvm.loop !26
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv40 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next41, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv40, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv36 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next37, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv36, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv40, i64 %indvars.iv36
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond39, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond43, label %for.cond19.preheader.us.preheader, label %for.cond2.preheader.us

for.cond19.preheader.us.preheader:                ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.cond19.preheader.us.preheader
  %indvars.iv32 = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next33, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nuw nsw i64 %indvars.iv32, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv28 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next29, %if.end28.us ]
  %14 = add nuw nsw i64 %indvars.iv28, %13
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv32, i64 %indvars.iv28
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond31, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond35, label %for.cond45.preheader.us.preheader, label %for.cond19.preheader.us

for.cond45.preheader.us.preheader:                ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.cond45.preheader.us.preheader
  %indvars.iv24 = phi i64 [ 0, %for.cond45.preheader.us.preheader ], [ %indvars.iv.next25, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nuw nsw i64 %indvars.iv24, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %if.end54.us ]
  %22 = add nuw nsw i64 %indvars.iv, %21
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv24, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond27, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

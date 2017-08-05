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
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %entry
  %indvars.iv513.prol = phi i64 [ 0, %entry ], [ %indvars.iv.next6.prol, %for.inc.prol ]
  %prol.iter = phi i64 [ 4, %entry ], [ %prol.iter.sub, %for.inc.prol ]
  %0 = trunc i64 %indvars.iv513.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv513.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.preheader, label %for.inc.prol, !llvm.loop !1

for.inc.preheader:                                ; preds = %for.inc.prol
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv513 = phi i64 [ %indvars.iv.next6.7, %for.inc ], [ %indvars.iv.next6.prol, %for.inc.preheader ]
  %1 = trunc i64 %indvars.iv513 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513
  %2 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %3 = trunc i64 %indvars.iv.next6 to i32
  %conv.1 = sitofp i32 %3 to double
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %5 = insertelement <2 x double> %4, double %conv.1, i32 1
  store <2 x double> %5, <2 x double>* %2, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  %6 = trunc i64 %indvars.iv.next6.1 to i32
  %conv.2 = sitofp i32 %6 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.1
  %7 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv513, 3
  %8 = trunc i64 %indvars.iv.next6.2 to i32
  %conv.3 = sitofp i32 %8 to double
  %9 = insertelement <2 x double> undef, double %conv.2, i32 0
  %10 = insertelement <2 x double> %9, double %conv.3, i32 1
  store <2 x double> %10, <2 x double>* %7, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv513, 4
  %11 = trunc i64 %indvars.iv.next6.3 to i32
  %conv.4 = sitofp i32 %11 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.3
  %12 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv513, 5
  %13 = trunc i64 %indvars.iv.next6.4 to i32
  %conv.5 = sitofp i32 %13 to double
  %14 = insertelement <2 x double> undef, double %conv.4, i32 0
  %15 = insertelement <2 x double> %14, double %conv.5, i32 1
  store <2 x double> %15, <2 x double>* %12, align 8
  %indvars.iv.next6.5 = add nsw i64 %indvars.iv513, 6
  %16 = trunc i64 %indvars.iv.next6.5 to i32
  %conv.6 = sitofp i32 %16 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.5
  %17 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next6.6 = add nsw i64 %indvars.iv513, 7
  %18 = trunc i64 %indvars.iv.next6.6 to i32
  %conv.7 = sitofp i32 %18 to double
  %19 = insertelement <2 x double> undef, double %conv.6, i32 0
  %20 = insertelement <2 x double> %19, double %conv.7, i32 1
  store <2 x double> %20, <2 x double>* %17, align 8
  %indvars.iv.next6.7 = add nsw i64 %indvars.iv513, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next6.7, 500
  br i1 %exitcond18.7, label %for.cond5.preheader.us.preheader, label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv310.us = phi i64 [ %indvars.iv.next4.us, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %21 = trunc i64 %indvars.iv310.us to i32
  %conv9.us = sitofp i32 %21 to double
  %22 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.inc36.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %23 = trunc i64 %indvars.iv.next.us to i32
  %conv10.us = sitofp i32 %23 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  %24 = add nuw nsw i64 %indvars.iv8.us, 2
  %25 = trunc i64 %24 to i32
  %conv18.us = sitofp i32 %25 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %26 = add nuw nsw i64 %indvars.iv8.us, 3
  %27 = trunc i64 %26 to i32
  %conv28.us = sitofp i32 %27 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv310.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond16, label %for.end41, label %for.cond5.preheader.us

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
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvars.iv323.us = phi i64 [ %indvars.iv.next4.us, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add nsw i64 %indvars.iv323.us, -1
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond10.preheader.us
  %indvars.iv121.us = phi i64 [ 0, %for.cond10.preheader.us ], [ %indvars.iv.next2.us.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %1 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %2 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %0, i64 %indvars.iv121.us
  %3 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %2, %3
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %1, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us = or i64 %indvars.iv121.us, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %4 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %5 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %0, i64 %indvars.iv.next2.us
  %6 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %5, %6
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %4, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next2.us.1 = add nsw i64 %indvars.iv121.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next2.us.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us, label %for.inc31.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv323.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3.1, %for.inc ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr59 = mul i64 %indvars.iv1636, 8
  %sunkaddr60 = add i64 %sunkaddr, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to i64*
  %7 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv19
  %8 = bitcast double* %arrayidx6 to i64*
  store i64 %7, i64* %8, align 8
  %indvars.iv.next = or i64 %indvars.iv19, 1
  %9 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %10 = bitcast double* %arrayidx6.1 to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv19, 2
  %11 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %12 = bitcast double* %arrayidx6.2 to i64*
  store i64 %11, i64* %12, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv19, 3
  %13 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %14 = bitcast double* %arrayidx6.3 to i64*
  store i64 %13, i64* %14, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv19, 4
  %15 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.157 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %16 = bitcast double* %arrayidx6.157 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next.158 = or i64 %indvars.iv19, 5
  %17 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.1.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.158
  %18 = bitcast double* %arrayidx6.1.1 to i64*
  store i64 %17, i64* %18, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv19, 6
  %19 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1.1
  %20 = bitcast double* %arrayidx6.2.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next.2.1 = or i64 %indvars.iv19, 7
  %21 = load i64, i64* %sunkaddr61, align 8
  %arrayidx6.3.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2.1
  %22 = bitcast double* %arrayidx6.3.1 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv19, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond10.preheader.us.preheader, label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv928.us = phi i64 [ %indvars.iv.next10.us, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1
  %23 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 1
  %24 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 0
  %25 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %24, %25
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %23, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us, %for.cond40.preheader.us
  %indvars.iv626.us = phi i64 [ 2, %for.cond40.preheader.us ], [ %indvars.iv.next7.us.1, %for.inc63.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %26 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %27 = load double, double* %arrayidx50.us, align 8
  %28 = add nsw i64 %indvars.iv626.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %28
  %29 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %27, %29
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %26, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next7.us = or i64 %indvars.iv626.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %30 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %31 = load double, double* %arrayidx50.us.1, align 8
  %32 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %31, %32
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %30, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv626.us, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next7.us.1, 1200
  br i1 %exitcond50.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv928.us, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond53, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv1333.us = phi i64 [ %33, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %33 = add nuw nsw i64 %indvars.iv1333.us, 1
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us, %for.cond73.preheader.us
  %indvars.iv1131.us = phi i64 [ 0, %for.cond73.preheader.us ], [ %indvars.iv.next12.us, %for.inc107.us ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %34 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1131.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv.next12.us
  %35 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %36 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %35, %36
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %33, i64 %indvars.iv1131.us
  %37 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %37
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %38 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %38
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %34, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next12.us, 1199
  br i1 %cmp75.us, label %for.inc107.us, label %for.cond73.for.inc110_crit_edge.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %cmp71.us = icmp slt i64 %33, 999
  br i1 %cmp71.us, label %for.cond73.preheader.us, label %for.inc113

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1636, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next17, 500
  br i1 %exitcond54, label %for.end115, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv1436.us = phi i64 [ 0, %entry ], [ %indvars.iv.next15.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv1436.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv1134.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next12.us, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv1134.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc22.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1436.us, i64 %indvars.iv1134.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1134.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond49, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1436.us, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond50, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.end12
  %indvars.iv831.us = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next9.us, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv831.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv529.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next6.us, %for.inc34.us ]
  %14 = add nsw i64 %indvars.iv529.us, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv831.us, i64 %indvars.iv529.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv529.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next6.us, 1200
  br i1 %exitcond46, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv831.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond47, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv226.us = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next3.us, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nsw i64 %indvars.iv226.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us, %for.cond45.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %for.inc60.us ]
  %22 = add nsw i64 %indvars.iv24.us, %21
  %23 = trunc i64 %22 to i32
  %rem50.us = srem i32 %23, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %for.inc60.us

if.then52.us:                                     ; preds = %for.body47.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %for.inc60.us

for.inc60.us:                                     ; preds = %for.body47.us, %if.then52.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv226.us, i64 %indvars.iv24.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv226.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond44, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

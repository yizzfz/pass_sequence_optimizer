; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %2 = bitcast i8* %call2 to [1200 x double]*
  %3 = bitcast i8* %call3 to double*
  tail call void @init_array([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to [1200 x double]*
  %6 = bitcast i8* %call1 to [1200 x double]*
  %7 = bitcast i8* %call to [1200 x double]*
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %6, [1200 x double]* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) #2 {
entry:
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.for.inc39_crit_edge.us, %for.cond5.preheader.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for.cond5.preheader.us.preheader ], [ %indvars.iv.next18, %for.cond5.for.inc39_crit_edge.us ]
  %0 = trunc i64 %indvars.iv17 to i32
  %conv26.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv26.us, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv17, i64 %indvars.iv
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv18.us = sitofp i32 %4 to double
  %mul.us.v.i0.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i0.2 = insertelement <2 x double> %mul.us.v.i0.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv17, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv26.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv17, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %cmp6.us = icmp slt i64 %indvars.iv.next, 1200
  br i1 %cmp6.us, label %for.inc36.us, label %for.cond5.for.inc39_crit_edge.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next18, 1000
  br i1 %cmp2.us, label %for.cond5.preheader.us, label %for.end41

for.inc:                                          ; preds = %for.inc, %entry
  %inc12 = phi i32 [ 0, %entry ], [ %inc.4, %for.inc ]
  %conv = sitofp i32 %inc12 to double
  %idxprom = sext i32 %inc12 to i64
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %idxprom
  store double %conv, double* %arrayidx, align 8
  %inc = add nuw nsw i32 %inc12, 1
  %conv.1 = sitofp i32 %inc to double
  %idxprom.1 = sext i32 %inc to i64
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %idxprom.1
  store double %conv.1, double* %arrayidx.1, align 8
  %inc.1 = add nsw i32 %inc12, 2
  %conv.2 = sitofp i32 %inc.1 to double
  %idxprom.2 = sext i32 %inc.1 to i64
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %idxprom.2
  store double %conv.2, double* %arrayidx.2, align 8
  %inc.2 = add nsw i32 %inc12, 3
  %conv.3 = sitofp i32 %inc.2 to double
  %idxprom.3 = sext i32 %inc.2 to i64
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %idxprom.3
  store double %conv.3, double* %arrayidx.3, align 8
  %inc.3 = add nsw i32 %inc12, 4
  %conv.4 = sitofp i32 %inc.3 to double
  %idxprom.4 = sext i32 %inc.3 to i64
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %idxprom.4
  store double %conv.4, double* %arrayidx.4, align 8
  %inc.4 = add nsw i32 %inc12, 5
  %cmp.4 = icmp slt i32 %inc.4, 500
  br i1 %cmp.4, label %for.inc, label %for.cond5.preheader.us.preheader

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv73 = phi i64 [ 0, %entry ], [ %indvars.iv.next74, %for.inc113 ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.for.inc34_crit_edge.us, %for.cond10.preheader.us.preheader
  %indvars.iv54 = phi i64 [ 1, %for.cond10.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond10.for.inc34_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv54, -1
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond10.preheader.us
  %indvars.iv52 = phi i64 [ 0, %for.cond10.preheader.us ], [ %indvars.iv.next53.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv54, i64 %indvars.iv52
  %1 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv54, i64 %indvars.iv52
  %2 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %0, i64 %indvars.iv52
  %3 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %2, %3
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %1, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv54, i64 %indvars.iv.next53
  %4 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv54, i64 %indvars.iv.next53
  %5 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %0, i64 %indvars.iv.next53
  %6 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %5, %6
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %4, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %cmp11.us.1 = icmp slt i64 %indvars.iv.next53.1, 1200
  br i1 %cmp11.us.1, label %for.inc31.us, label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next55, 1000
  br i1 %exitcond58, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.inc ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr1 = mul i64 %indvars.iv73, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  %7 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %8 = bitcast double* %arrayidx6 to i64*
  store i64 %7, i64* %8, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %sunkaddr4 = ptrtoint double* %_fict_ to i64
  %sunkaddr5 = mul i64 %indvars.iv73, 8
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to i64*
  %9 = load i64, i64* %sunkaddr7, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %10 = bitcast double* %arrayidx6.1 to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %sunkaddr8 = ptrtoint double* %_fict_ to i64
  %sunkaddr9 = mul i64 %indvars.iv73, 8
  %sunkaddr10 = add i64 %sunkaddr8, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to i64*
  %11 = load i64, i64* %sunkaddr11, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %12 = bitcast double* %arrayidx6.2 to i64*
  store i64 %11, i64* %12, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %sunkaddr12 = ptrtoint double* %_fict_ to i64
  %sunkaddr13 = mul i64 %indvars.iv73, 8
  %sunkaddr14 = add i64 %sunkaddr12, %sunkaddr13
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to i64*
  %13 = load i64, i64* %sunkaddr15, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %14 = bitcast double* %arrayidx6.3 to i64*
  store i64 %13, i64* %14, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %sunkaddr16 = ptrtoint double* %_fict_ to i64
  %sunkaddr17 = mul i64 %indvars.iv73, 8
  %sunkaddr18 = add i64 %sunkaddr16, %sunkaddr17
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to i64*
  %15 = load i64, i64* %sunkaddr19, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %16 = bitcast double* %arrayidx6.4 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %for.cond10.preheader.us.preheader, label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.for.inc66_crit_edge.us, %for.cond40.preheader.us.preheader
  %indvars.iv64 = phi i64 [ 0, %for.cond40.preheader.us.preheader ], [ %indvars.iv.next65, %for.cond40.for.inc66_crit_edge.us ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.1, %for.cond40.preheader.us
  %indvars.iv59 = phi i64 [ 1, %for.cond40.preheader.us ], [ %indvars.iv.next60.1, %for.inc63.us.1 ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv64, i64 %indvars.iv59
  %17 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv64, i64 %indvars.iv59
  %18 = load double, double* %arrayidx50.us, align 8
  %19 = add nsw i64 %indvars.iv59, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv64, i64 %19
  %20 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %18, %20
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %17, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next60, 1200
  br i1 %exitcond63, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.1

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next65, 1000
  br i1 %cmp38.us, label %for.cond40.preheader.us, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.for.inc110_crit_edge.us, %for.cond73.preheader.us.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond73.preheader.us.preheader ], [ %indvars.iv.next70, %for.cond73.for.inc110_crit_edge.us ]
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us, %for.cond73.preheader.us
  %indvars.iv67 = phi i64 [ 0, %for.cond73.preheader.us ], [ %indvars.iv.next68, %for.inc107.us ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv69, i64 %indvars.iv67
  %21 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv69, i64 %indvars.iv.next68
  %22 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv69, i64 %indvars.iv67
  %23 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %22, %23
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next70, i64 %indvars.iv67
  %24 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %24
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv69, i64 %indvars.iv67
  %25 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %25
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %21, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next68, 1199
  br i1 %cmp75.us, label %for.inc107.us, label %for.cond73.for.inc110_crit_edge.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 999
  br i1 %exitcond72, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %cmp = icmp slt i64 %indvars.iv.next74, 500
  br i1 %cmp, label %for.cond1.preheader, label %for.end115

for.end115:                                       ; preds = %for.inc113
  ret void

for.inc63.us.1:                                   ; preds = %for.inc63.us
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv64, i64 %indvars.iv.next60
  %26 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv64, i64 %indvars.iv.next60
  %27 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv64, i64 %indvars.iv59
  %28 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %27, %28
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %26, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br label %for.inc63.us
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv63 = phi i64 [ 0, %entry ], [ %indvars.iv.next64, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv63, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv58 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next59, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv58
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 %indvars.iv58
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next59, 1200
  br i1 %exitcond62, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next64 = add nsw i64 %indvars.iv63, 1
  %cmp.us = icmp slt i64 %indvars.iv.next64, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.cond.for.end12_crit_edge
  %indvars.iv53 = phi i64 [ 0, %for.cond.for.end12_crit_edge ], [ %indvars.iv.next54, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv53, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv48 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next49, %for.inc34.us ]
  %14 = add nsw i64 %13, %indvars.iv48
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv53, i64 %indvars.iv48
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond52, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %cmp17.us = icmp slt i64 %indvars.iv.next54, 1000
  br i1 %cmp17.us, label %for.cond19.preheader.us, label %for.end39

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv45 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next46, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nsw i64 %indvars.iv45, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %for.inc60.us ]
  %22 = add nsw i64 %21, %indvars.iv
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv45, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1
  %cmp43.us = icmp slt i64 %indvars.iv.next46, 1000
  br i1 %cmp43.us, label %for.cond45.preheader.us, label %for.end65

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

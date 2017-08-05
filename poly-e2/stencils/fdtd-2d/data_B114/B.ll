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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
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
define internal void @init_array([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
entry:
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv15 to i32
  %conv16.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv16.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv15, i64 %indvars.iv
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv18.us = sitofp i32 %4 to double
  %mul.v.i1.1.us = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.v.i1.2.us = insertelement <2 x double> %mul.v.i1.1.us, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.v.i0.2.us, %mul.v.i1.2.us
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.v.r1.us = extractelement <2 x double> %div.us, i32 0
  %div.v.r2.us = extractelement <2 x double> %div.us, i32 1
  store double %div.v.r1.us, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv15, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv16.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv15, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %cmp6.us = icmp slt i64 %indvars.iv.next, 1200
  br i1 %cmp6.us, label %for.inc36.us, label %for.cond5.for.inc39_crit_edge.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next16, 1000
  br i1 %cmp2.us, label %for.cond5.preheader.us, label %for.end41

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv17 = phi i64 [ 0, %entry ], [ %indvars.iv.next18.4, %for.inc ]
  %7 = trunc i64 %indvars.iv17 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv17
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %8 = trunc i64 %indvars.iv.next18 to i32
  %conv.1 = sitofp i32 %8 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %9 = trunc i64 %indvars.iv.next18.1 to i32
  %conv.2 = sitofp i32 %9 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next18.2 = add nsw i64 %indvars.iv17, 3
  %10 = trunc i64 %indvars.iv.next18.2 to i32
  %conv.3 = sitofp i32 %10 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next18.3 = add nsw i64 %indvars.iv17, 4
  %11 = trunc i64 %indvars.iv.next18.3 to i32
  %conv.4 = sitofp i32 %11 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next18.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next18.4 = add nsw i64 %indvars.iv17, 5
  %cmp.4 = icmp slt i64 %indvars.iv.next18.4, 500
  br i1 %cmp.4, label %for.inc, label %for.cond5.preheader.us.preheader

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* %_fict_) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv69 = phi i64 [ 0, %entry ], [ %indvars.iv.next70, %for.inc113 ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %0, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv50, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %for.inc31.us.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %for.cond10.preheader.us
  br label %vector.body58

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %index78
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %index78
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !4
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %index78
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !4
  %15 = fsub <2 x double> %wide.load88, %wide.load90
  %16 = fsub <2 x double> %wide.load89, %wide.load91
  %17 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %18 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %19 = fsub <2 x double> %wide.load86, %17
  %20 = fsub <2 x double> %wide.load87, %18
  store <2 x double> %19, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %20, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %index.next79 = add i64 %index78, 4
  %21 = icmp eq i64 %index.next79, 1200
  br i1 %21, label %for.cond10.for.inc34_crit_edge.us.loopexit113, label %vector.body58, !llvm.loop !6

for.inc31.us:                                     ; preds = %for.inc31.us, %for.inc31.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.inc31.us.preheader ], [ %indvars.iv.next49.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv48
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %indvars.iv48
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv48
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv.next49
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv50, i64 %indvars.iv.next49
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next49
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %cmp11.us.1 = icmp slt i64 %indvars.iv.next49.1, 1200
  br i1 %cmp11.us.1, label %for.inc31.us, label %for.cond10.for.inc34_crit_edge.us.loopexit, !llvm.loop !9

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit113:    ; preds = %vector.body58
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit113, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond54, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.inc ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr94 = mul i64 %indvars.iv69, 8
  %sunkaddr95 = add i64 %sunkaddr, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to i64*
  %28 = load i64, i64* %sunkaddr96, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %sunkaddr97 = ptrtoint double* %_fict_ to i64
  %sunkaddr98 = mul i64 %indvars.iv69, 8
  %sunkaddr99 = add i64 %sunkaddr97, %sunkaddr98
  %sunkaddr100 = inttoptr i64 %sunkaddr99 to i64*
  %30 = load i64, i64* %sunkaddr100, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %sunkaddr101 = ptrtoint double* %_fict_ to i64
  %sunkaddr102 = mul i64 %indvars.iv69, 8
  %sunkaddr103 = add i64 %sunkaddr101, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to i64*
  %32 = load i64, i64* %sunkaddr104, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %sunkaddr105 = ptrtoint double* %_fict_ to i64
  %sunkaddr106 = mul i64 %indvars.iv69, 8
  %sunkaddr107 = add i64 %sunkaddr105, %sunkaddr106
  %sunkaddr108 = inttoptr i64 %sunkaddr107 to i64*
  %34 = load i64, i64* %sunkaddr108, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %sunkaddr109 = ptrtoint double* %_fict_ to i64
  %sunkaddr110 = mul i64 %indvars.iv69, 8
  %sunkaddr111 = add i64 %sunkaddr109, %sunkaddr110
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to i64*
  %36 = load i64, i64* %sunkaddr112, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %for.cond10.preheader.us.preheader, label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv60 = phi i64 [ %38, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 1
  %38 = add i64 %indvars.iv60, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %38, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %38, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %for.inc63.us.preheader.new, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %offset.idx
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %offset.idx
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !13
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !13
  %47 = add nsw i64 %offset.idx, -1
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %47
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !13
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !13
  %52 = fsub <2 x double> %wide.load54, %wide.load56
  %53 = fsub <2 x double> %wide.load55, %wide.load57
  %54 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %55 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %wide.load52, %54
  %57 = fsub <2 x double> %wide.load53, %55
  store <2 x double> %56, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %57, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %index.next45 = add i64 %index44, 4
  %58 = icmp eq i64 %index.next45, 1196
  br i1 %58, label %for.inc63.us.preheader.new.loopexit, label %vector.body25, !llvm.loop !15

for.inc63.us.preheader.new.loopexit:              ; preds = %vector.body25
  br label %for.inc63.us.preheader.new

for.inc63.us.preheader.new:                       ; preds = %for.inc63.us.preheader.new.loopexit, %for.cond40.preheader.us
  %indvars.iv55.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %for.inc63.us.preheader.new.loopexit ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv55.ph
  %59 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv55.ph
  %60 = load double, double* %arrayidx50.us.prol, align 8
  %61 = add nsw i64 %indvars.iv55.ph, -1
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %61
  %62 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %60, %62
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %59, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.ph, 1
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us, %for.inc63.us.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.prol, %for.inc63.us.preheader.new ], [ %indvars.iv.next56.1, %for.inc63.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv55
  %63 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv55
  %64 = load double, double* %arrayidx50.us, align 8
  %65 = add nsw i64 %indvars.iv55, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %65
  %66 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %64, %66
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %63, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv.next56
  %67 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv.next56
  %68 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv60, i64 %indvars.iv55
  %69 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %68, %69
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %67, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next56.1, 1200
  br i1 %exitcond59.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us, !llvm.loop !16

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %cmp38.us = icmp slt i64 %38, 1000
  br i1 %cmp38.us, label %for.cond40.preheader.us, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv65 = phi i64 [ %70, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 0
  %70 = add i64 %indvars.iv65, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %70, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %70, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !17, !noalias !20
  %75 = or i64 %index, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %75
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !23
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !23
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %index
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !23
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !23
  %84 = fsub <2 x double> %wide.load17, %wide.load19
  %85 = fsub <2 x double> %wide.load18, %wide.load20
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %70, i64 %index
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !24
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !24
  %90 = fadd <2 x double> %84, %wide.load21
  %91 = fadd <2 x double> %85, %wide.load22
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 %index
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !24
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %95, align 8, !alias.scope !24
  %96 = fsub <2 x double> %90, %wide.load23
  %97 = fsub <2 x double> %91, %wide.load24
  %98 = fmul <2 x double> %96, <double 7.000000e-01, double 7.000000e-01>
  %99 = fmul <2 x double> %97, <double 7.000000e-01, double 7.000000e-01>
  %100 = fsub <2 x double> %wide.load, %98
  %101 = fsub <2 x double> %wide.load16, %99
  store <2 x double> %100, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %101, <2 x double>* %74, align 8, !alias.scope !17, !noalias !20
  %index.next = add i64 %index, 4
  %102 = icmp eq i64 %index.next, 1196
  br i1 %102, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !25

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv63.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc107.us ], [ %indvars.iv63.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv65, i64 %indvars.iv63
  %103 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %indvars.iv.next64
  %104 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv65, i64 %indvars.iv63
  %105 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %104, %105
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %70, i64 %indvars.iv63
  %106 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %106
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 %indvars.iv63
  %107 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %107
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %103, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next64, 1199
  br i1 %cmp75.us, label %for.inc107.us, label %for.cond73.for.inc110_crit_edge.us, !llvm.loop !26

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond68 = icmp eq i64 %70, 999
  br i1 %exitcond68, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %cmp = icmp slt i64 %indvars.iv.next70, 500
  br i1 %cmp, label %for.cond1.preheader, label %for.end115

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv60, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv55 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next56, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv55
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv60, i64 %indvars.iv55
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond59, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp.us = icmp slt i64 %indvars.iv.next61, 1000
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
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond19.for.inc37_crit_edge.us ], [ 0, %for.cond.for.end12_crit_edge ]
  %13 = mul nsw i64 %indvars.iv50, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv45 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next46, %for.inc34.us ]
  %14 = add nsw i64 %13, %indvars.iv45
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv50, i64 %indvars.iv45
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond49, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %cmp17.us = icmp slt i64 %indvars.iv.next51, 1000
  br i1 %cmp17.us, label %for.cond19.preheader.us, label %for.end39

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond45.for.inc63_crit_edge.us ], [ 0, %for.end39 ]
  %21 = mul nsw i64 %indvars.iv42, 1000
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv42, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %cmp43.us = icmp slt i64 %indvars.iv.next43, 1000
  br i1 %cmp43.us, label %for.cond45.preheader.us, label %for.end65

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

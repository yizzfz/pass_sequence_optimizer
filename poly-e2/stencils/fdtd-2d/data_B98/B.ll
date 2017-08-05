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
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %2 = bitcast i8* %call2 to [1200 x double]*
  %3 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %0, [1200 x double]* %1, [1200 x double]* %2, double* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to [1200 x double]*
  %6 = bitcast i8* %call1 to [1200 x double]*
  %7 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %6, [1200 x double]* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge, %for.cond5.preheader.us.preheader
  %0 = phi i32 [ %inc40.us, %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge ], [ 0, %for.cond5.preheader.us.preheader ]
  %idxprom22.us = sext i32 %0 to i64
  %conv26.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv26.us, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us.for.inc36.us_crit_edge, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us.for.inc36.us_crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom22.us, i64 %indvars.iv
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
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom22.us, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv26.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom22.us, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %cmp6.us = icmp slt i64 %indvars.iv.next, 1200
  br i1 %cmp6.us, label %for.inc36.us.for.inc36.us_crit_edge, label %for.cond5.for.inc39_crit_edge.us

for.inc36.us.for.inc36.us_crit_edge:              ; preds = %for.inc36.us
  br label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %inc40.us = add nsw i32 %0, 1
  %cmp2.us = icmp slt i32 %inc40.us, 1000
  br i1 %cmp2.us, label %for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge, label %for.end41

for.cond5.for.inc39_crit_edge.us.for.cond5.preheader.us_crit_edge: ; preds = %for.cond5.for.inc39_crit_edge.us
  br label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %entry
  %inc12 = phi i32 [ 0, %entry ], [ %inc.4, %for.inc.for.inc_crit_edge ]
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
  br i1 %cmp.4, label %for.inc.for.inc_crit_edge, label %for.cond5.preheader.us.preheader

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113.for.cond1.preheader_crit_edge, %entry
  %indvars.iv65 = phi i64 [ 0, %entry ], [ %indvars.iv.next66, %for.inc113.for.cond1.preheader_crit_edge ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge, %for.cond10.preheader.us.preheader
  %indvar65 = phi i64 [ %0, %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge ], [ 0, %for.cond10.preheader.us.preheader ]
  %inc3516.us = phi i32 [ %inc35.us, %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar65, 1
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar65, 2
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar65, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %idxprom13.us = sext i32 %inc3516.us to i64
  %sub.us = add nsw i32 %inc3516.us, -1
  %idxprom21.us = sext i32 %sub.us to i64
  %bound076 = icmp ult double* %scevgep68, %scevgep74
  %bound177 = icmp ult double* %scevgep72, %scevgep70
  %memcheck.conflict79 = and i1 %bound076, %bound177
  br i1 %memcheck.conflict79, label %for.inc31.us.preheader, label %vector.body60.preheader

vector.body60.preheader:                          ; preds = %for.cond10.preheader.us
  br label %vector.body60

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

vector.body60:                                    ; preds = %vector.body60.vector.body60_crit_edge, %vector.body60.preheader
  %index82 = phi i64 [ %index.next83, %vector.body60.vector.body60_crit_edge ], [ 0, %vector.body60.preheader ]
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %index82
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1, !noalias !4
  %4 = getelementptr double, double* %2, i64 2
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1, !noalias !4
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %index82
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !4
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !4
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %index82
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !4
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !4
  %14 = fsub <2 x double> %wide.load92, %wide.load94
  %15 = fsub <2 x double> %wide.load93, %wide.load95
  %16 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %17 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %wide.load90, %16
  %19 = fsub <2 x double> %wide.load91, %17
  store <2 x double> %18, <2 x double>* %3, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %19, <2 x double>* %5, align 8, !alias.scope !1, !noalias !4
  %index.next83 = add i64 %index82, 4
  %20 = icmp eq i64 %index.next83, 1200
  br i1 %20, label %for.cond10.for.inc34_crit_edge.us.loopexit116, label %vector.body60.vector.body60_crit_edge, !llvm.loop !6

vector.body60.vector.body60_crit_edge:            ; preds = %vector.body60
  br label %vector.body60

for.inc31.us:                                     ; preds = %for.inc31.us.for.inc31.us_crit_edge, %for.inc31.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.inc31.us.preheader ], [ %indvars.iv.next56.1, %for.inc31.us.for.inc31.us_crit_edge ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %indvars.iv55
  %21 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %indvars.iv55
  %22 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %indvars.iv55
  %23 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %22, %23
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %21, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %indvars.iv.next56
  %24 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %indvars.iv.next56
  %25 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %indvars.iv.next56
  %26 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %25, %26
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %24, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %cmp11.us.1 = icmp slt i64 %indvars.iv.next56.1, 1200
  br i1 %cmp11.us.1, label %for.inc31.us.for.inc31.us_crit_edge, label %for.cond10.for.inc34_crit_edge.us.loopexit, !llvm.loop !9

for.inc31.us.for.inc31.us_crit_edge:              ; preds = %for.inc31.us
  br label %for.inc31.us

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit116:    ; preds = %vector.body60
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit116, %for.cond10.for.inc34_crit_edge.us.loopexit
  %inc35.us = add nsw i32 %inc3516.us, 1
  %cmp8.us = icmp slt i32 %inc35.us, 1000
  br i1 %cmp8.us, label %for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge, label %for.cond40.preheader.us.preheader

for.cond10.for.inc34_crit_edge.us.for.cond10.preheader.us_crit_edge: ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.inc.for.inc_crit_edge ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr97 = mul i64 %indvars.iv65, 8
  %sunkaddr98 = add i64 %sunkaddr, %sunkaddr97
  %sunkaddr99 = inttoptr i64 %sunkaddr98 to i64*
  %27 = load i64, i64* %sunkaddr99, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %28 = bitcast double* %arrayidx6 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %sunkaddr100 = ptrtoint double* %_fict_ to i64
  %sunkaddr101 = mul i64 %indvars.iv65, 8
  %sunkaddr102 = add i64 %sunkaddr100, %sunkaddr101
  %sunkaddr103 = inttoptr i64 %sunkaddr102 to i64*
  %29 = load i64, i64* %sunkaddr103, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %30 = bitcast double* %arrayidx6.1 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %sunkaddr104 = ptrtoint double* %_fict_ to i64
  %sunkaddr105 = mul i64 %indvars.iv65, 8
  %sunkaddr106 = add i64 %sunkaddr104, %sunkaddr105
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to i64*
  %31 = load i64, i64* %sunkaddr107, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %32 = bitcast double* %arrayidx6.2 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %sunkaddr108 = ptrtoint double* %_fict_ to i64
  %sunkaddr109 = mul i64 %indvars.iv65, 8
  %sunkaddr110 = add i64 %sunkaddr108, %sunkaddr109
  %sunkaddr111 = inttoptr i64 %sunkaddr110 to i64*
  %33 = load i64, i64* %sunkaddr111, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %34 = bitcast double* %arrayidx6.3 to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %sunkaddr112 = ptrtoint double* %_fict_ to i64
  %sunkaddr113 = mul i64 %indvars.iv65, 8
  %sunkaddr114 = add i64 %sunkaddr112, %sunkaddr113
  %sunkaddr115 = inttoptr i64 %sunkaddr114 to i64*
  %35 = load i64, i64* %sunkaddr115, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %36 = bitcast double* %arrayidx6.4 to i64*
  store i64 %35, i64* %36, align 8
  %exitcond67.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond67.4, label %for.cond10.preheader.us.preheader, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge, %for.cond40.preheader.us.preheader
  %indvar30 = phi i64 [ %37, %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge ], [ 0, %for.cond40.preheader.us.preheader ]
  %inc6725.us = phi i32 [ %inc67.us, %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvar30, i64 1
  %37 = add i64 %indvar30, 1
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %37, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar30, i64 0
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %37, i64 0
  %idxprom43.us = sext i32 %inc6725.us to i64
  %bound040 = icmp ult double* %scevgep32, %scevgep38
  %bound141 = icmp ult double* %scevgep36, %scevgep34
  %memcheck.conflict43 = and i1 %bound040, %bound141
  br i1 %memcheck.conflict43, label %for.cond40.preheader.us.for.inc63.us.preheader.new_crit_edge, label %vector.body25.preheader

for.cond40.preheader.us.for.inc63.us.preheader.new_crit_edge: ; preds = %for.cond40.preheader.us
  br label %for.inc63.us.preheader.new

vector.body25.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.vector.body25_crit_edge, %vector.body25.preheader
  %index46 = phi i64 [ %index.next47, %vector.body25.vector.body25_crit_edge ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index46, 1
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %offset.idx
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !10, !noalias !13
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !10, !noalias !13
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %offset.idx
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !13
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !13
  %46 = add nsw i64 %offset.idx, -1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !13
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !13
  %51 = fsub <2 x double> %wide.load56, %wide.load58
  %52 = fsub <2 x double> %wide.load57, %wide.load59
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %wide.load54, %53
  %56 = fsub <2 x double> %wide.load55, %54
  store <2 x double> %55, <2 x double>* %39, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %56, <2 x double>* %41, align 8, !alias.scope !10, !noalias !13
  %index.next47 = add i64 %index46, 4
  %57 = icmp eq i64 %index.next47, 1196
  br i1 %57, label %for.inc63.us.preheader.new.loopexit, label %vector.body25.vector.body25_crit_edge, !llvm.loop !15

vector.body25.vector.body25_crit_edge:            ; preds = %vector.body25
  br label %vector.body25

for.inc63.us.preheader.new.loopexit:              ; preds = %vector.body25
  br label %for.inc63.us.preheader.new

for.inc63.us.preheader.new:                       ; preds = %for.cond40.preheader.us.for.inc63.us.preheader.new_crit_edge, %for.inc63.us.preheader.new.loopexit
  %indvars.iv57.ph = phi i64 [ 1, %for.cond40.preheader.us.for.inc63.us.preheader.new_crit_edge ], [ 1197, %for.inc63.us.preheader.new.loopexit ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %indvars.iv57.ph
  %58 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv57.ph
  %59 = load double, double* %arrayidx50.us.prol, align 8
  %60 = add nsw i64 %indvars.iv57.ph, -1
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %60
  %61 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %59, %61
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %58, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.ph, 1
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.for.inc63.us_crit_edge, %for.inc63.us.preheader.new
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.prol, %for.inc63.us.preheader.new ], [ %indvars.iv.next58.1, %for.inc63.us.for.inc63.us_crit_edge ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %indvars.iv57
  %62 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv57
  %63 = load double, double* %arrayidx50.us, align 8
  %64 = add nsw i64 %indvars.iv57, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %64
  %65 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %63, %65
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %62, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %indvars.iv.next58
  %66 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv.next58
  %67 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv57
  %68 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %67, %68
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %66, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next58, 1199
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  br i1 %exitcond.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.for.inc63.us_crit_edge, !llvm.loop !16

for.inc63.us.for.inc63.us_crit_edge:              ; preds = %for.inc63.us
  br label %for.inc63.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %inc67.us = add nsw i32 %inc6725.us, 1
  %cmp38.us = icmp slt i32 %inc67.us, 1000
  br i1 %cmp38.us, label %for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge, label %for.cond73.preheader.us.preheader

for.cond40.for.inc66_crit_edge.us.for.cond40.preheader.us_crit_edge: ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge, %for.cond73.preheader.us.preheader
  %indvar = phi i64 [ %69, %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge ], [ 0, %for.cond73.preheader.us.preheader ]
  %inc11136.us = phi i32 [ %add90.us, %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvar, i64 0
  %69 = add i64 %indvar, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %69, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvar, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %69, i64 1199
  %idxprom77.us = sext i32 %inc11136.us to i64
  %add90.us = add nsw i32 %inc11136.us, 1
  %idxprom91.us = sext i32 %add90.us to i64
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge, label %vector.body.preheader

for.cond73.preheader.us.for.inc107.us.preheader_crit_edge: ; preds = %for.cond73.preheader.us
  br label %for.inc107.us.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom77.us, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !17, !noalias !20
  %74 = or i64 %index, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !23
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !23
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !23
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !23
  %83 = fsub <2 x double> %wide.load17, %wide.load19
  %84 = fsub <2 x double> %wide.load18, %wide.load20
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom91.us, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !24
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !24
  %89 = fadd <2 x double> %83, %wide.load21
  %90 = fadd <2 x double> %84, %wide.load22
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom77.us, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !24
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !24
  %95 = fsub <2 x double> %89, %wide.load23
  %96 = fsub <2 x double> %90, %wide.load24
  %97 = fmul <2 x double> %95, <double 7.000000e-01, double 7.000000e-01>
  %98 = fmul <2 x double> %96, <double 7.000000e-01, double 7.000000e-01>
  %99 = fsub <2 x double> %wide.load, %97
  %100 = fsub <2 x double> %wide.load16, %98
  store <2 x double> %99, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %100, <2 x double>* %73, align 8, !alias.scope !17, !noalias !20
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, 1196
  br i1 %101, label %for.inc107.us.preheader.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !25

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge, %for.inc107.us.preheader.loopexit
  %indvars.iv63.ph = phi i64 [ 0, %for.cond73.preheader.us.for.inc107.us.preheader_crit_edge ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.for.inc107.us_crit_edge, %for.inc107.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc107.us.for.inc107.us_crit_edge ], [ %indvars.iv63.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom77.us, i64 %indvars.iv63
  %102 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %indvars.iv.next64
  %103 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %indvars.iv63
  %104 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %103, %104
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom91.us, i64 %indvars.iv63
  %105 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %105
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom77.us, i64 %indvars.iv63
  %106 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %106
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %102, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next64, 1199
  br i1 %cmp75.us, label %for.inc107.us.for.inc107.us_crit_edge, label %for.cond73.for.inc110_crit_edge.us, !llvm.loop !26

for.inc107.us.for.inc107.us_crit_edge:            ; preds = %for.inc107.us
  br label %for.inc107.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %cmp71.us = icmp slt i32 %add90.us, 999
  br i1 %cmp71.us, label %for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge, label %for.inc113

for.cond73.for.inc110_crit_edge.us.for.cond73.preheader.us_crit_edge: ; preds = %for.cond73.for.inc110_crit_edge.us
  br label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next66 = add nsw i64 %indvars.iv65, 1
  %cmp = icmp slt i64 %indvars.iv.next66, 500
  br i1 %cmp, label %for.inc113.for.cond1.preheader_crit_edge, label %for.end115

for.inc113.for.cond1.preheader_crit_edge:         ; preds = %for.inc113
  br label %for.cond1.preheader

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

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %entry
  %3 = phi i32 [ %inc11.us, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ], [ 0, %entry ]
  %idxprom.us = sext i32 %3 to i64
  %mul.us = mul nsw i32 %3, 1000
  %4 = zext i32 %mul.us to i64
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv52 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next53, %for.inc.us.for.body4.us_crit_edge ]
  %5 = add i64 %4, %indvars.iv52
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom.us, i64 %indvars.iv52
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond56, label %for.cond2.for.inc10_crit_edge.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %inc11.us = add nsw i32 %3, 1
  %cmp.us = icmp slt i32 %inc11.us, 1000
  br i1 %cmp.us, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, label %for.cond.for.end12_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.cond.for.end12_crit_edge:                     ; preds = %for.cond2.for.inc10_crit_edge.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge, %for.cond.for.end12_crit_edge
  %14 = phi i32 [ %inc38.us, %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge ], [ 0, %for.cond.for.end12_crit_edge ]
  %idxprom29.us = sext i32 %14 to i64
  %mul22.us = mul nsw i32 %14, 1000
  %15 = zext i32 %mul22.us to i64
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us.for.body21.us_crit_edge, %for.cond19.preheader.us
  %indvars.iv45 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next46, %for.inc34.us.for.body21.us_crit_edge ]
  %16 = add i64 %15, %indvars.iv45
  %17 = trunc i64 %16 to i32
  %rem24.us = srem i32 %17, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.body21.us.for.inc34.us_crit_edge

for.body21.us.for.inc34.us_crit_edge:             ; preds = %for.body21.us
  br label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.body21.us.for.inc34.us_crit_edge, %if.then26.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom29.us, i64 %indvars.iv45
  %20 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, 1200
  br i1 %exitcond49, label %for.cond19.for.inc37_crit_edge.us, label %for.inc34.us.for.body21.us_crit_edge

for.inc34.us.for.body21.us_crit_edge:             ; preds = %for.inc34.us
  br label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %inc38.us = add nsw i32 %14, 1
  %cmp17.us = icmp slt i32 %inc38.us, 1000
  br i1 %cmp17.us, label %for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge, label %for.end39

for.cond19.for.inc37_crit_edge.us.for.cond19.preheader.us_crit_edge: ; preds = %for.cond19.for.inc37_crit_edge.us
  br label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge, %for.end39
  %23 = phi i32 [ %inc64.us, %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge ], [ 0, %for.end39 ]
  %idxprom55.us = sext i32 %23 to i64
  %mul48.us = mul nsw i32 %23, 1000
  %24 = zext i32 %mul48.us to i64
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us.for.body47.us_crit_edge, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %for.inc60.us.for.body47.us_crit_edge ]
  %25 = add i64 %24, %indvars.iv
  %26 = trunc i64 %25 to i32
  %rem50.us = srem i32 %26, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %for.body47.us.for.inc60.us_crit_edge

for.body47.us.for.inc60.us_crit_edge:             ; preds = %for.body47.us
  br label %for.inc60.us

if.then52.us:                                     ; preds = %for.body47.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %for.inc60.us

for.inc60.us:                                     ; preds = %for.body47.us.for.inc60.us_crit_edge, %if.then52.us
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom55.us, i64 %indvars.iv
  %29 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.inc60.us.for.body47.us_crit_edge

for.inc60.us.for.body47.us_crit_edge:             ; preds = %for.inc60.us
  br label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %inc64.us = add nsw i32 %23, 1
  %cmp43.us = icmp slt i32 %inc64.us, 1000
  br i1 %cmp43.us, label %for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge, label %for.end65

for.cond45.for.inc63_crit_edge.us.for.cond45.preheader.us_crit_edge: ; preds = %for.cond45.for.inc63_crit_edge.us
  br label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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

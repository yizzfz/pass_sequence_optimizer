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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %6, [1200 x double]* %5)
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
define internal fastcc void @init_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #2 {
entry:
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
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
  %indvars.iv.next18 = add i64 %indvars.iv17, 1
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

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv69 = phi i64 [ 0, %entry ], [ %indvars.iv.next70, %for.inc113 ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.for.inc34_crit_edge.us, %for.cond10.preheader.us.preheader
  %indvar = phi i64 [ 0, %for.cond10.preheader.us.preheader ], [ %0, %for.cond10.for.inc34_crit_edge.us ]
  %indvars.iv54 = phi i64 [ 1, %for.cond10.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond10.for.inc34_crit_edge.us ]
  %0 = add i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv54, -1
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
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv54, i64 %index78
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv54, i64 %index78
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
  br i1 %21, label %for.cond10.for.inc34_crit_edge.us.loopexit96, label %vector.body58, !llvm.loop !6

for.inc31.us:                                     ; preds = %for.inc31.us, %for.inc31.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.inc31.us.preheader ], [ %indvars.iv.next53.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv54, i64 %indvars.iv52
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv54, i64 %indvars.iv52
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv52
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next53 = or i64 %indvars.iv52, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv54, i64 %indvars.iv.next53
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv54, i64 %indvars.iv.next53
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next53
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %cmp11.us.1 = icmp slt i64 %indvars.iv.next53.1, 1200
  br i1 %cmp11.us.1, label %for.inc31.us, label %for.cond10.for.inc34_crit_edge.us.loopexit, !llvm.loop !9

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit96:     ; preds = %vector.body58
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit96, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next55 = add nuw i64 %indvars.iv54, 1
  %cmp8.us = icmp slt i64 %indvars.iv.next55, 1000
  br i1 %cmp8.us, label %for.cond10.preheader.us, label %for.cond40.preheader.us.preheader

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.for.inc_crit_edge ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr93 = mul i64 %indvars.iv69, 8
  %sunkaddr94 = add i64 %sunkaddr, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to i64*
  %28 = load i64, i64* %sunkaddr95, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %for.cond10.preheader.us.preheader, label %for.inc.for.inc_crit_edge

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv62 = phi i64 [ %30, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv62, i64 1
  %30 = add i64 %indvars.iv62, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %30, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv62, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %30, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %for.inc63.us.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv62, i64 %offset.idx
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10, !noalias !13
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !10, !noalias !13
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv62, i64 %offset.idx
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !13
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !13
  %39 = add nsw i64 %offset.idx, -1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv62, i64 %39
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !13
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !13
  %44 = fsub <2 x double> %wide.load54, %wide.load56
  %45 = fsub <2 x double> %wide.load55, %wide.load57
  %46 = fmul <2 x double> %44, <double 5.000000e-01, double 5.000000e-01>
  %47 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %48 = fsub <2 x double> %wide.load52, %46
  %49 = fsub <2 x double> %wide.load53, %47
  store <2 x double> %48, <2 x double>* %32, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %49, <2 x double>* %34, align 8, !alias.scope !10, !noalias !13
  %index.next45 = add i64 %index44, 4
  %50 = icmp eq i64 %index.next45, 1196
  br i1 %50, label %for.inc63.us.preheader.loopexit, label %vector.body25, !llvm.loop !15

for.inc63.us.preheader.loopexit:                  ; preds = %vector.body25
  br label %for.inc63.us.preheader

for.inc63.us.preheader:                           ; preds = %for.inc63.us.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv57.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %for.inc63.us.preheader.loopexit ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.preheader, %for.inc63.us.for.inc63.us_crit_edge
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc63.us.for.inc63.us_crit_edge ], [ %indvars.iv57.ph, %for.inc63.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv62, i64 %indvars.iv57
  %51 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv62, i64 %indvars.iv57
  %52 = load double, double* %arrayidx50.us, align 8
  %53 = add nsw i64 %indvars.iv57, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv62, i64 %53
  %54 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %52, %54
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %51, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %exitcond61 = icmp eq i64 %indvars.iv57, 1199
  br i1 %exitcond61, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.for.inc63.us_crit_edge, !llvm.loop !16

for.inc63.us.for.inc63.us_crit_edge:              ; preds = %for.inc63.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br label %for.inc63.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %cmp38.us = icmp slt i64 %30, 1000
  br i1 %cmp38.us, label %for.cond40.preheader.us, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv67 = phi i64 [ %55, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv67, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv67, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv67, i64 0
  %55 = add i64 %indvars.iv67, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %55, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv67, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %55, i64 1199
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
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv67, i64 %index
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !17, !noalias !20
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !20
  %60 = or i64 %index, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv67, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !23
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !23
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv67, i64 %index
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !23
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !23
  %69 = fsub <2 x double> %wide.load17, %wide.load19
  %70 = fsub <2 x double> %wide.load18, %wide.load20
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %55, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !24
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !24
  %75 = fadd <2 x double> %69, %wide.load21
  %76 = fadd <2 x double> %70, %wide.load22
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv67, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !24
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !24
  %81 = fsub <2 x double> %75, %wide.load23
  %82 = fsub <2 x double> %76, %wide.load24
  %83 = fmul <2 x double> %81, <double 7.000000e-01, double 7.000000e-01>
  %84 = fmul <2 x double> %82, <double 7.000000e-01, double 7.000000e-01>
  %85 = fsub <2 x double> %wide.load, %83
  %86 = fsub <2 x double> %wide.load16, %84
  store <2 x double> %85, <2 x double>* %57, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %86, <2 x double>* %59, align 8, !alias.scope !17, !noalias !20
  %index.next = add i64 %index, 4
  %87 = icmp eq i64 %index.next, 1196
  br i1 %87, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !25

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv65.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc107.us ], [ %indvars.iv65.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv67, i64 %indvars.iv65
  %88 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv67, i64 %indvars.iv.next66
  %89 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv67, i64 %indvars.iv65
  %90 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %89, %90
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %55, i64 %indvars.iv65
  %91 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %91
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv67, i64 %indvars.iv65
  %92 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %92
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %88, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next66, 1199
  br i1 %cmp75.us, label %for.inc107.us, label %for.cond73.for.inc110_crit_edge.us, !llvm.loop !26

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %cmp71.us = icmp slt i64 %55, 999
  br i1 %cmp71.us, label %for.cond73.preheader.us, label %for.inc113

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next70 = add i64 %indvars.iv69, 1
  %cmp = icmp slt i64 %indvars.iv.next70, 500
  br i1 %cmp, label %for.cond1.preheader, label %for.end115

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv58, 1000
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv58, i64 %indvars.iv55
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next56, 1200
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next59 = add i64 %indvars.iv58, 1
  %cmp.us = icmp slt i64 %indvars.iv.next59, 1000
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
  %indvars.iv51 = phi i64 [ 0, %for.cond.for.end12_crit_edge ], [ %indvars.iv.next52, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv51, 1000
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv51, i64 %indvars.iv48
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next49 = add nuw i64 %indvars.iv48, 1
  %cmp20.us = icmp slt i64 %indvars.iv.next49, 1200
  br i1 %cmp20.us, label %for.body21.us, label %for.cond19.for.inc37_crit_edge.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next52 = add i64 %indvars.iv51, 1
  %cmp17.us = icmp slt i64 %indvars.iv.next52, 1000
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
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp46.us = icmp slt i64 %indvars.iv.next, 1200
  br i1 %cmp46.us, label %for.body47.us, label %for.cond45.for.inc63_crit_edge.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  %cmp43.us = icmp slt i64 %indvars.iv.next46, 1000
  br i1 %cmp43.us, label %for.cond45.preheader.us, label %for.end65

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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

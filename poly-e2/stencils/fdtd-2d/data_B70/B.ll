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
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv14 to i32
  %conv16.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv16.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv14, i64 %indvars.iv
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
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv14, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv16.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv14, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond17, label %for.end41, label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv19 = phi i64 [ 0, %entry ], [ %indvars.iv.next20.4, %for.inc ]
  %7 = trunc i64 %indvars.iv19 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv19
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %8 = trunc i64 %indvars.iv.next20 to i32
  %conv.1 = sitofp i32 %8 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next20
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %9 = trunc i64 %indvars.iv.next20.1 to i32
  %conv.2 = sitofp i32 %9 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next20.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %10 = trunc i64 %indvars.iv.next20.2 to i32
  %conv.3 = sitofp i32 %10 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next20.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %11 = trunc i64 %indvars.iv.next20.3 to i32
  %conv.4 = sitofp i32 %11 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next20.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next20.4 = add nsw i64 %indvars.iv19, 5
  %exitcond22.4 = icmp eq i64 %indvars.iv.next20.4, 500
  br i1 %exitcond22.4, label %for.cond5.preheader.us.preheader, label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  %scevgep180 = getelementptr [1200 x double], [1200 x double]* %ey, i64 1, i64 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv76 = phi i64 [ 0, %entry ], [ %indvars.iv.next77, %for.inc113 ]
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv76
  %0 = bitcast double* %arrayidx to [1200 x double]*
  %bound0183 = icmp ugt [1200 x double]* %0, %ey
  %bound1184 = icmp ult double* %arrayidx, %scevgep180
  %memcheck.conflict186 = and i1 %bound0183, %bound1184
  br i1 %memcheck.conflict186, label %for.inc.preheader, label %vector.body174.preheader

vector.body174.preheader:                         ; preds = %for.cond1.preheader
  %1 = bitcast double* %arrayidx to i64*
  br label %vector.body174

for.inc.preheader:                                ; preds = %for.cond1.preheader
  %2 = bitcast double* %arrayidx to i64*
  br label %for.inc

vector.body174:                                   ; preds = %vector.body174, %vector.body174.preheader
  %index189 = phi i64 [ 0, %vector.body174.preheader ], [ %index.next190.2, %vector.body174 ]
  %3 = load i64, i64* %1, align 8, !alias.scope !1
  %4 = insertelement <2 x i64> undef, i64 %3, i32 0
  %5 = shufflevector <2 x i64> %4, <2 x i64> undef, <2 x i32> zeroinitializer
  %6 = insertelement <2 x i64> undef, i64 %3, i32 0
  %7 = shufflevector <2 x i64> %6, <2 x i64> undef, <2 x i32> zeroinitializer
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index189
  %9 = bitcast double* %8 to <2 x i64>*
  store <2 x i64> %5, <2 x i64>* %9, align 8, !alias.scope !4, !noalias !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x i64>*
  store <2 x i64> %7, <2 x i64>* %11, align 8, !alias.scope !4, !noalias !1
  %index.next190 = add nuw nsw i64 %index189, 4
  %12 = load i64, i64* %1, align 8, !alias.scope !1
  %13 = insertelement <2 x i64> undef, i64 %12, i32 0
  %14 = shufflevector <2 x i64> %13, <2 x i64> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x i64> undef, i64 %12, i32 0
  %16 = shufflevector <2 x i64> %15, <2 x i64> undef, <2 x i32> zeroinitializer
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index.next190
  %18 = bitcast double* %17 to <2 x i64>*
  store <2 x i64> %14, <2 x i64>* %18, align 8, !alias.scope !4, !noalias !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %20, align 8, !alias.scope !4, !noalias !1
  %index.next190.1 = add nsw i64 %index189, 8
  %21 = load i64, i64* %1, align 8, !alias.scope !1
  %22 = insertelement <2 x i64> undef, i64 %21, i32 0
  %23 = shufflevector <2 x i64> %22, <2 x i64> undef, <2 x i32> zeroinitializer
  %24 = insertelement <2 x i64> undef, i64 %21, i32 0
  %25 = shufflevector <2 x i64> %24, <2 x i64> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index.next190.1
  %27 = bitcast double* %26 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %27, align 8, !alias.scope !4, !noalias !1
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  store <2 x i64> %25, <2 x i64>* %29, align 8, !alias.scope !4, !noalias !1
  %index.next190.2 = add nsw i64 %index189, 12
  %30 = icmp eq i64 %index.next190.2, 1200
  br i1 %30, label %for.cond10.preheader.us.preheader.loopexit4, label %vector.body174, !llvm.loop !6

for.cond10.preheader.us.preheader.loopexit:       ; preds = %for.inc
  br label %for.cond10.preheader.us.preheader

for.cond10.preheader.us.preheader.loopexit4:      ; preds = %vector.body174
  br label %for.cond10.preheader.us.preheader

for.cond10.preheader.us.preheader:                ; preds = %for.cond10.preheader.us.preheader.loopexit4, %for.cond10.preheader.us.preheader.loopexit
  br label %for.cond10.preheader.us

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %31 = add i64 %indvar, 1
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %31, i64 0
  %32 = add i64 %indvar, 2
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %32, i64 0
  %scevgep150 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %32, i64 0
  %33 = add nsw i64 %indvars.iv52, -1
  %bound0154 = icmp ult double* %scevgep146, %scevgep152
  %bound1155 = icmp ult double* %scevgep150, %scevgep148
  %memcheck.conflict157 = and i1 %bound0154, %bound1155
  br i1 %memcheck.conflict157, label %for.inc31.us.preheader, label %vector.body141.preheader

vector.body141.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body141

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

vector.body141:                                   ; preds = %vector.body141.preheader, %vector.body141
  %index160 = phi i64 [ %index.next161, %vector.body141 ], [ 0, %vector.body141.preheader ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv52, i64 %index160
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !9, !noalias !12
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load169 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !9, !noalias !12
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv52, i64 %index160
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load170 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !12
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load171 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !12
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %33, i64 %index160
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load172 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !12
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load173 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !12
  %46 = fsub <2 x double> %wide.load170, %wide.load172
  %47 = fsub <2 x double> %wide.load171, %wide.load173
  %48 = fmul <2 x double> %46, <double 5.000000e-01, double 5.000000e-01>
  %49 = fmul <2 x double> %47, <double 5.000000e-01, double 5.000000e-01>
  %50 = fsub <2 x double> %wide.load168, %48
  %51 = fsub <2 x double> %wide.load169, %49
  %52 = bitcast double* %34 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !9, !noalias !12
  %53 = bitcast double* %36 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8, !alias.scope !9, !noalias !12
  %index.next161 = add i64 %index160, 4
  %54 = icmp eq i64 %index.next161, 1200
  br i1 %54, label %for.cond10.for.inc34_crit_edge.us.loopexit3, label %vector.body141, !llvm.loop !14

for.inc31.us:                                     ; preds = %for.inc31.us, %for.inc31.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.inc31.us.preheader ], [ %indvars.iv.next49.1, %for.inc31.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv52, i64 %indvars.iv48
  %55 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv52, i64 %indvars.iv48
  %56 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %33, i64 %indvars.iv48
  %57 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %56, %57
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %55, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv52, i64 %indvars.iv.next49
  %58 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv52, i64 %indvars.iv.next49
  %59 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %33, i64 %indvars.iv.next49
  %60 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %59, %60
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %58, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 1200
  br i1 %exitcond51.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.inc31.us, !llvm.loop !15

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit3:      ; preds = %vector.body141
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit3, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next53, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond56, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next.7, %for.inc ]
  %61 = load i64, i64* %2, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %62 = bitcast double* %arrayidx6 to i64*
  store i64 %61, i64* %62, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = load i64, i64* %2, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %64 = bitcast double* %arrayidx6.1 to i64*
  store i64 %63, i64* %64, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %65 = load i64, i64* %2, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %66 = bitcast double* %arrayidx6.2 to i64*
  store i64 %65, i64* %66, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %67 = load i64, i64* %2, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %68 = bitcast double* %arrayidx6.3 to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %69 = load i64, i64* %2, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %70 = bitcast double* %arrayidx6.4 to i64*
  store i64 %69, i64* %70, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %71 = load i64, i64* %2, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %72 = bitcast double* %arrayidx6.5 to i64*
  store i64 %71, i64* %72, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %73 = load i64, i64* %2, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %74 = bitcast double* %arrayidx6.6 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %75 = load i64, i64* %2, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %76 = bitcast double* %arrayidx6.7 to i64*
  store i64 %75, i64* %76, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader.loopexit, label %for.inc, !llvm.loop !16

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 1
  %77 = add i64 %indvars.iv63, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %77, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %77, i64 0
  %bound0121 = icmp ult double* %scevgep113, %scevgep119
  %bound1122 = icmp ult double* %scevgep117, %scevgep115
  %memcheck.conflict124 = and i1 %bound0121, %bound1122
  br i1 %memcheck.conflict124, label %for.inc63.us.preheader.new, label %vector.body108.preheader

vector.body108.preheader:                         ; preds = %for.cond40.preheader.us
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108.preheader, %vector.body108
  %index127 = phi i64 [ %index.next128, %vector.body108 ], [ 0, %vector.body108.preheader ]
  %offset.idx = or i64 %index127, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !17, !noalias !20
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !17, !noalias !20
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !20
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !20
  %86 = add nsw i64 %offset.idx, -1
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %86
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !20
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !20
  %91 = fsub <2 x double> %wide.load137, %wide.load139
  %92 = fsub <2 x double> %wide.load138, %wide.load140
  %93 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %94 = fmul <2 x double> %92, <double 5.000000e-01, double 5.000000e-01>
  %95 = fsub <2 x double> %wide.load135, %93
  %96 = fsub <2 x double> %wide.load136, %94
  %97 = bitcast double* %78 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !alias.scope !17, !noalias !20
  %98 = bitcast double* %80 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next128 = add i64 %index127, 4
  %99 = icmp eq i64 %index.next128, 1196
  br i1 %99, label %for.inc63.us.preheader.new.loopexit, label %vector.body108, !llvm.loop !22

for.inc63.us.preheader.new.loopexit:              ; preds = %vector.body108
  br label %for.inc63.us.preheader.new

for.inc63.us.preheader.new:                       ; preds = %for.inc63.us.preheader.new.loopexit, %for.cond40.preheader.us
  %indvars.iv58.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %for.inc63.us.preheader.new.loopexit ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 %indvars.iv58.ph
  %100 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %indvars.iv58.ph
  %101 = load double, double* %arrayidx50.us.prol, align 8
  %102 = add nsw i64 %indvars.iv58.ph, -1
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %102
  %103 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %101, %103
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %100, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.ph, 1
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us, %for.inc63.us.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.prol, %for.inc63.us.preheader.new ], [ %indvars.iv.next59.1, %for.inc63.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 %indvars.iv58
  %104 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %indvars.iv58
  %105 = load double, double* %arrayidx50.us, align 8
  %106 = add nsw i64 %indvars.iv58, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %106
  %107 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %105, %107
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %104, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv63, i64 %indvars.iv.next59
  %108 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %indvars.iv.next59
  %109 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv63, i64 %indvars.iv58
  %110 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %109, %110
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %108, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next59.1, 1200
  br i1 %exitcond62.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us, !llvm.loop !23

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond66, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 1199
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv72, i64 0
  %111 = add i64 %indvars.iv72, 1
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %111, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 0
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %111, i64 1199
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ult double* %scevgep87, %scevgep85
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep, %scevgep93
  %bound196 = icmp ult double* %scevgep91, %scevgep85
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 %index
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !24, !noalias !27
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !24, !noalias !27
  %116 = or i64 %index, 1
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv72, i64 %116
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !30
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !30
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv72, i64 %index
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !30
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !30
  %125 = fsub <2 x double> %wide.load100, %wide.load102
  %126 = fsub <2 x double> %wide.load101, %wide.load103
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next73, i64 %index
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !31
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !31
  %131 = fadd <2 x double> %125, %wide.load104
  %132 = fadd <2 x double> %126, %wide.load105
  %133 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 %index
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !31
  %135 = getelementptr double, double* %133, i64 2
  %136 = bitcast double* %135 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %136, align 8, !alias.scope !31
  %137 = fsub <2 x double> %131, %wide.load106
  %138 = fsub <2 x double> %132, %wide.load107
  %139 = fmul <2 x double> %137, <double 7.000000e-01, double 7.000000e-01>
  %140 = fmul <2 x double> %138, <double 7.000000e-01, double 7.000000e-01>
  %141 = fsub <2 x double> %wide.load, %139
  %142 = fsub <2 x double> %wide.load99, %140
  %143 = bitcast double* %112 to <2 x double>*
  store <2 x double> %141, <2 x double>* %143, align 8, !alias.scope !24, !noalias !27
  %144 = bitcast double* %114 to <2 x double>*
  store <2 x double> %142, <2 x double>* %144, align 8, !alias.scope !24, !noalias !27
  %index.next = add i64 %index, 4
  %145 = icmp eq i64 %index.next, 1196
  br i1 %145, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !32

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv68.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc107.us ], [ %indvars.iv68.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 %indvars.iv68
  %146 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv72, i64 %indvars.iv.next69
  %147 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv72, i64 %indvars.iv68
  %148 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %147, %148
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next73, i64 %indvars.iv68
  %149 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %149
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 %indvars.iv68
  %150 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %150
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %146, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 1199
  br i1 %exitcond71, label %for.cond73.for.inc110_crit_edge.us, label %for.inc107.us, !llvm.loop !33

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 999
  br i1 %exitcond75, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, 500
  br i1 %exitcond79, label %for.end115, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv59 = phi i64 [ 0, %entry ], [ %indvars.iv.next60, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv59, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv54 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next55, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv54
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv59, i64 %indvars.iv54
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond58, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next60, 1000
  br i1 %exitcond63, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.end12
  %indvars.iv48 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next49, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv48, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv43 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next44, %for.inc34.us ]
  %14 = add nsw i64 %13, %indvars.iv43
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv48, i64 %indvars.iv43
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond47, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond52, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv37 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next38, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nsw i64 %indvars.iv37, 1000
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv37, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond41, label %for.end65, label %for.cond45.preheader.us

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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}

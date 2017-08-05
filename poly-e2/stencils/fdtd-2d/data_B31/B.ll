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

for.inc.prol:                                     ; preds = %entry, %for.inc.prol
  %indvars.iv37.prol = phi i64 [ %indvars.iv.next38.prol, %for.inc.prol ], [ 0, %entry ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv37.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv37.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next38.prol = add nuw nsw i64 %indvars.iv37.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.preheader, label %for.inc.prol, !llvm.loop !1

for.inc.preheader:                                ; preds = %for.inc.prol
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv33 to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv33, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 2
  %5 = trunc i64 %4 to i32
  %conv18.us = sitofp i32 %5 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv33, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv33, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond32 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond32, label %for.cond5.for.inc39_crit_edge.us, label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond36, label %for.end41, label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.7, %for.inc ], [ 4, %for.inc.preheader ]
  %8 = trunc i64 %indvars.iv37 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv37
  %9 = bitcast double* %arrayidx to <2 x double>*
  %10 = trunc i64 %indvars.iv37 to i32
  %11 = or i32 %10, 1
  %conv.1 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv, i32 0
  %13 = insertelement <2 x double> %12, double %conv.1, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next38.1 = or i64 %indvars.iv37, 2
  %14 = trunc i64 %indvars.iv.next38.1 to i32
  %conv.2 = sitofp i32 %14 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next38.1
  %15 = bitcast double* %arrayidx.2 to <2 x double>*
  %16 = trunc i64 %indvars.iv37 to i32
  %17 = or i32 %16, 3
  %conv.3 = sitofp i32 %17 to double
  %18 = insertelement <2 x double> undef, double %conv.2, i32 0
  %19 = insertelement <2 x double> %18, double %conv.3, i32 1
  store <2 x double> %19, <2 x double>* %15, align 8
  %indvars.iv.next38.3 = add nsw i64 %indvars.iv37, 4
  %20 = trunc i64 %indvars.iv.next38.3 to i32
  %conv.4 = sitofp i32 %20 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next38.3
  %21 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next38.4 = add nsw i64 %indvars.iv37, 5
  %22 = trunc i64 %indvars.iv.next38.4 to i32
  %conv.5 = sitofp i32 %22 to double
  %23 = insertelement <2 x double> undef, double %conv.4, i32 0
  %24 = insertelement <2 x double> %23, double %conv.5, i32 1
  store <2 x double> %24, <2 x double>* %21, align 8
  %indvars.iv.next38.5 = add nsw i64 %indvars.iv37, 6
  %25 = trunc i64 %indvars.iv.next38.5 to i32
  %conv.6 = sitofp i32 %25 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next38.5
  %26 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next38.6 = add nsw i64 %indvars.iv37, 7
  %27 = trunc i64 %indvars.iv.next38.6 to i32
  %conv.7 = sitofp i32 %27 to double
  %28 = insertelement <2 x double> undef, double %conv.6, i32 0
  %29 = insertelement <2 x double> %28, double %conv.7, i32 1
  store <2 x double> %29, <2 x double>* %26, align 8
  %indvars.iv.next38.7 = add nsw i64 %indvars.iv37, 8
  %exitcond40.7 = icmp eq i64 %indvars.iv.next38.7, 500
  br i1 %exitcond40.7, label %for.cond5.preheader.us.preheader, label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
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
  %indvars.iv109 = phi i64 [ 0, %entry ], [ %indvars.iv.next110, %for.inc113 ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add nsw i64 %indvars.iv87, -1
  %scevgep211 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %scevgep214 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 1200
  %scevgep217 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep220 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %0, i64 1200
  %bound0222 = icmp ult double* %scevgep211, %scevgep220
  %bound1223 = icmp ult double* %scevgep217, %scevgep214
  %memcheck.conflict225 = and i1 %bound0222, %bound1223
  br i1 %memcheck.conflict225, label %for.inc31.us.preheader, label %vector.body201.preheader

vector.body201.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body201

vector.body201:                                   ; preds = %vector.body201.preheader, %vector.body201
  %index228 = phi i64 [ %index.next229, %vector.body201 ], [ 0, %vector.body201.preheader ]
  %2 = shl i64 %index228, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %2
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec237 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec238 = shufflevector <4 x double> %wide.vec237, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec239 = shufflevector <4 x double> %wide.vec237, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %2
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec240 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %2
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec243 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec240, %wide.vec243
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec238, %11
  %13 = or i64 %2, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %13
  %15 = fsub <4 x double> %wide.vec240, %wide.vec243
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec239, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec246 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec246, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next229 = add i64 %index228, 2
  %21 = icmp eq i64 %index.next229, 600
  br i1 %21, label %middle.block202, label %vector.body201, !llvm.loop !8

middle.block202:                                  ; preds = %vector.body201
  br label %for.cond10.for.inc34_crit_edge.us

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us.preheader, %for.inc31.us
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %for.inc31.us ], [ 0, %for.inc31.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %indvars.iv83
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %indvars.iv83
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv83
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %indvars.iv.next84
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %indvars.iv.next84
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv.next84
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next84.1 = add nuw nsw i64 %indvars.iv83, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, 1200
  br i1 %exitcond86.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.inc31.us, !llvm.loop !11

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit, %middle.block202
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next88, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond91, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.cond1.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr247 = mul i64 %indvars.iv109, 8
  %sunkaddr248 = add i64 %sunkaddr, %sunkaddr247
  %sunkaddr249 = inttoptr i64 %sunkaddr248 to i64*
  %28 = load i64, i64* %sunkaddr249, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr250 = ptrtoint double* %_fict_ to i64
  %sunkaddr251 = mul i64 %indvars.iv109, 8
  %sunkaddr252 = add i64 %sunkaddr250, %sunkaddr251
  %sunkaddr253 = inttoptr i64 %sunkaddr252 to i64*
  %30 = load i64, i64* %sunkaddr253, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %sunkaddr254 = ptrtoint double* %_fict_ to i64
  %sunkaddr255 = mul i64 %indvars.iv109, 8
  %sunkaddr256 = add i64 %sunkaddr254, %sunkaddr255
  %sunkaddr257 = inttoptr i64 %sunkaddr256 to i64*
  %32 = load i64, i64* %sunkaddr257, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %sunkaddr258 = ptrtoint double* %_fict_ to i64
  %sunkaddr259 = mul i64 %indvars.iv109, 8
  %sunkaddr260 = add i64 %sunkaddr258, %sunkaddr259
  %sunkaddr261 = inttoptr i64 %sunkaddr260 to i64*
  %34 = load i64, i64* %sunkaddr261, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond82.3 = icmp eq i64 %indvars.iv.next.3, 1200
  br i1 %exitcond82.3, label %for.cond10.preheader.us.preheader, label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 1
  %36 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 1
  %37 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 0
  %38 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %37, %38
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %36, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %scevgep170 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 2
  %scevgep173 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 1200
  %scevgep176 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 1
  %scevgep179 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 1200
  %bound0181 = icmp ult double* %scevgep170, %scevgep179
  %bound1182 = icmp ult double* %scevgep176, %scevgep173
  %memcheck.conflict184 = and i1 %bound0181, %bound1182
  br i1 %memcheck.conflict184, label %for.inc63.us.preheader, label %vector.body164.preheader

vector.body164.preheader:                         ; preds = %for.cond40.preheader.us
  br label %vector.body164

vector.body164:                                   ; preds = %vector.body164.preheader, %vector.body164
  %index187 = phi i64 [ %index.next188, %vector.body164 ], [ 0, %vector.body164.preheader ]
  %39 = shl i64 %index187, 1
  %offset.idx = or i64 %39, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 %offset.idx
  %41 = bitcast double* %40 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %41, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec194 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %offset.idx
  %43 = getelementptr double, double* %42, i64 -1
  %44 = bitcast double* %43 to <4 x double>*
  %wide.vec195 = load <4 x double>, <4 x double>* %44, align 8, !alias.scope !15
  %strided.vec196 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec197 = shufflevector <4 x double> %wide.vec195, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %45 = fsub <2 x double> %strided.vec197, %strided.vec196
  %46 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %47 = fsub <2 x double> %strided.vec, %46
  %48 = or i64 %39, 3
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %48
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec198 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !15
  %strided.vec199 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec200 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fsub <2 x double> %strided.vec200, %strided.vec199
  %54 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %strided.vec194, %54
  %56 = getelementptr double, double* %49, i64 -1
  %57 = bitcast double* %56 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %47, <2 x double> %55, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %57, align 8, !alias.scope !12, !noalias !15
  %index.next188 = add i64 %index187, 2
  %58 = icmp eq i64 %index.next188, 598
  br i1 %58, label %middle.block165, label %vector.body164, !llvm.loop !17

middle.block165:                                  ; preds = %vector.body164
  br label %for.inc63.us.preheader

for.inc63.us.preheader:                           ; preds = %middle.block165, %for.cond40.preheader.us
  %indvars.iv92.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %middle.block165 ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.preheader, %for.inc63.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %for.inc63.us ], [ %indvars.iv92.ph, %for.inc63.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 %indvars.iv92
  %59 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %indvars.iv92
  %60 = load double, double* %arrayidx50.us, align 8
  %61 = add nsw i64 %indvars.iv92, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %61
  %62 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %60, %62
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %59, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv97, i64 %indvars.iv.next93
  %63 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %indvars.iv.next93
  %64 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv97, i64 %indvars.iv92
  %65 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %64, %65
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %63, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next93.1 = add nuw nsw i64 %indvars.iv92, 2
  %exitcond96.1 = icmp eq i64 %indvars.iv.next93.1, 1200
  br i1 %exitcond96.1, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us, !llvm.loop !18

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 1000
  br i1 %exitcond100, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv105, i64 0
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv105, i64 1199
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv105, i64 0
  %66 = add i64 %indvars.iv105, 1
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %66, i64 0
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv105, i64 0
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %66, i64 1199
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %bound0 = icmp ult double* %scevgep, %scevgep145
  %bound1 = icmp ult double* %scevgep143, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bound0151 = icmp ult double* %scevgep, %scevgep149
  %bound1152 = icmp ult double* %scevgep147, %scevgep141
  %found.conflict153 = and i1 %bound0151, %bound1152
  %conflict.rdx = or i1 %found.conflict, %found.conflict153
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv105, i64 %index
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !19, !noalias !22
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load155 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !19, !noalias !22
  %71 = or i64 %index, 1
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv105, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load156 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !25
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load157 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !25
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv105, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load158 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !25
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !25
  %80 = fsub <2 x double> %wide.load156, %wide.load158
  %81 = fsub <2 x double> %wide.load157, %wide.load159
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next106, i64 %index
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load160 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !26
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !26
  %86 = fadd <2 x double> %80, %wide.load160
  %87 = fadd <2 x double> %81, %wide.load161
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv105, i64 %index
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !26
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !26
  %92 = fsub <2 x double> %86, %wide.load162
  %93 = fsub <2 x double> %87, %wide.load163
  %94 = fmul <2 x double> %92, <double 7.000000e-01, double 7.000000e-01>
  %95 = fmul <2 x double> %93, <double 7.000000e-01, double 7.000000e-01>
  %96 = fsub <2 x double> %wide.load, %94
  %97 = fsub <2 x double> %wide.load155, %95
  %98 = bitcast double* %67 to <2 x double>*
  store <2 x double> %96, <2 x double>* %98, align 8, !alias.scope !19, !noalias !22
  %99 = bitcast double* %69 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %100 = icmp eq i64 %index.next, 1196
  br i1 %100, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv101.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.inc107.us ], [ %indvars.iv101.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv105, i64 %indvars.iv101
  %101 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv105, i64 %indvars.iv.next102
  %102 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv105, i64 %indvars.iv101
  %103 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %102, %103
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next106, i64 %indvars.iv101
  %104 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %104
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv105, i64 %indvars.iv101
  %105 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %105
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %101, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond104 = icmp eq i64 %indvars.iv.next102, 1199
  br i1 %exitcond104, label %for.cond73.for.inc110_crit_edge.us, label %for.inc107.us, !llvm.loop !28

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 999
  br i1 %exitcond108, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, 500
  br i1 %exitcond112, label %for.end115, label %for.cond1.preheader

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
  %indvars.iv75 = phi i64 [ 0, %entry ], [ %indvars.iv.next76, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv75, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv70 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next71, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv70, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc35.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv75, i64 %indvars.iv70
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next71, 1200
  br i1 %exitcond74, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next76, 1000
  br i1 %exitcond79, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.end12
  %indvars.iv65 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next66, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nuw nsw i64 %indvars.iv65, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv60 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next61, %for.inc34.us ]
  %14 = add nuw nsw i64 %indvars.iv60, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc32.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv65, i64 %indvars.iv60
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond64, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next66, 1000
  br i1 %exitcond69, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv55 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next56, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nuw nsw i64 %indvars.iv55, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %for.inc60.us ]
  %22 = add nuw nsw i64 %indvars.iv, %21
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv55, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond54, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond59, label %for.end65, label %for.cond45.preheader.us

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

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
for.inc.prol.preheader:
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv36.prol = phi i64 [ %indvars.iv.next37.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.prol ], [ 4, %for.inc.prol.preheader ]
  %0 = trunc i64 %indvars.iv36.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv36.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next37.prol = add nuw nsw i64 %indvars.iv36.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.preheader, label %for.inc.prol, !llvm.loop !1

for.inc.preheader:                                ; preds = %for.inc.prol
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.inc39.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc39.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv31 to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv31, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 2
  %5 = trunc i64 %4 to i32
  %conv18.us = sitofp i32 %5 to double
  %mul.v.i1.1.us = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.v.i1.2.us = insertelement <2 x double> %mul.v.i1.1.us, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.v.i0.2.us, %mul.v.i1.2.us
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.v.r1.us = extractelement <2 x double> %div.us, i32 0
  %div.v.r2.us = extractelement <2 x double> %div.us, i32 1
  store double %div.v.r1.us, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv31, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv31, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc39.us, label %for.inc36.us

for.inc39.us:                                     ; preds = %for.inc36.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %for.end41, label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv36 = phi i64 [ %indvars.iv.next37.7, %for.inc ], [ %indvars.iv.next37.prol, %for.inc.preheader ]
  %8 = trunc i64 %indvars.iv36 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv36
  %9 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %10 = trunc i64 %indvars.iv.next37 to i32
  %conv.1 = sitofp i32 %10 to double
  %11 = insertelement <2 x double> undef, double %conv, i32 0
  %12 = insertelement <2 x double> %11, double %conv.1, i32 1
  store <2 x double> %12, <2 x double>* %9, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %13 = trunc i64 %indvars.iv.next37.1 to i32
  %conv.2 = sitofp i32 %13 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next37.1
  %14 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next37.2 = add nsw i64 %indvars.iv36, 3
  %15 = trunc i64 %indvars.iv.next37.2 to i32
  %conv.3 = sitofp i32 %15 to double
  %16 = insertelement <2 x double> undef, double %conv.2, i32 0
  %17 = insertelement <2 x double> %16, double %conv.3, i32 1
  store <2 x double> %17, <2 x double>* %14, align 8
  %indvars.iv.next37.3 = add nsw i64 %indvars.iv36, 4
  %18 = trunc i64 %indvars.iv.next37.3 to i32
  %conv.4 = sitofp i32 %18 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next37.3
  %19 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next37.4 = add nsw i64 %indvars.iv36, 5
  %20 = trunc i64 %indvars.iv.next37.4 to i32
  %conv.5 = sitofp i32 %20 to double
  %21 = insertelement <2 x double> undef, double %conv.4, i32 0
  %22 = insertelement <2 x double> %21, double %conv.5, i32 1
  store <2 x double> %22, <2 x double>* %19, align 8
  %indvars.iv.next37.5 = add nsw i64 %indvars.iv36, 6
  %23 = trunc i64 %indvars.iv.next37.5 to i32
  %conv.6 = sitofp i32 %23 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next37.5
  %24 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next37.6 = add nsw i64 %indvars.iv36, 7
  %25 = trunc i64 %indvars.iv.next37.6 to i32
  %conv.7 = sitofp i32 %25 to double
  %26 = insertelement <2 x double> undef, double %conv.6, i32 0
  %27 = insertelement <2 x double> %26, double %conv.7, i32 1
  store <2 x double> %27, <2 x double>* %24, align 8
  %indvars.iv.next37.7 = add nsw i64 %indvars.iv36, 8
  %exitcond39.7 = icmp eq i64 %indvars.iv.next37.7, 500
  br i1 %exitcond39.7, label %for.cond5.preheader.us.preheader, label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.inc39.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.cond1.preheader.lr.ph, %for.inc113
  %indvars.iv112 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next113, %for.inc113 ]
  br label %for.inc

vector.memcheck204:                               ; preds = %vector.memcheck204.preheader, %for.inc34.us
  %indvar = phi i64 [ %indvar.next, %for.inc34.us ], [ 0, %vector.memcheck204.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc34.us ], [ 1, %vector.memcheck204.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep192 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep194 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep196 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep198 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv87, -1
  %bound0200 = icmp ult double* %scevgep192, %scevgep198
  %bound1201 = icmp ult double* %scevgep196, %scevgep194
  %memcheck.conflict203 = and i1 %bound0200, %bound1201
  br i1 %memcheck.conflict203, label %for.inc31.us.preheader, label %vector.body187.preheader

vector.body187.preheader:                         ; preds = %vector.memcheck204
  br label %vector.body187

for.inc31.us.preheader:                           ; preds = %vector.memcheck204
  br label %for.inc31.us

vector.body187:                                   ; preds = %vector.body187.preheader, %vector.body187
  %index206 = phi i64 [ %index.next207, %vector.body187 ], [ 0, %vector.body187.preheader ]
  %offset.idx210 = shl i64 %index206, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %offset.idx210
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec214 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec215 = shufflevector <4 x double> %wide.vec214, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec216 = shufflevector <4 x double> %wide.vec214, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %offset.idx210
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec217 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %offset.idx210
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec220 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec217, %wide.vec220
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec215, %11
  %13 = or i64 %offset.idx210, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %13
  %15 = fsub <4 x double> %wide.vec217, %wide.vec220
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec216, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec223 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec223, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next207 = add i64 %index206, 2
  %21 = icmp eq i64 %index.next207, 600
  br i1 %21, label %for.inc34.us.loopexit231, label %vector.body187, !llvm.loop !8

for.inc31.us:                                     ; preds = %for.inc31.us.preheader, %for.inc31.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82.1, %for.inc31.us ], [ 0, %for.inc31.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %indvars.iv81
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %indvars.iv81
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv81
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv87, i64 %indvars.iv.next82
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv87, i64 %indvars.iv.next82
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next82
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next82.1, 1200
  br i1 %exitcond.1, label %for.inc34.us.loopexit, label %for.inc31.us, !llvm.loop !11

for.inc34.us.loopexit:                            ; preds = %for.inc31.us
  br label %for.inc34.us

for.inc34.us.loopexit231:                         ; preds = %vector.body187
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %for.inc34.us.loopexit231, %for.inc34.us.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond = icmp eq i64 %indvars.iv.next88, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %vector.memcheck171.preheader, label %vector.memcheck204

vector.memcheck171.preheader:                     ; preds = %for.inc34.us
  br label %vector.memcheck171

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %for.inc ], [ 0, %for.inc.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr228 = mul i64 %indvars.iv112, 8
  %sunkaddr229 = add i64 %sunkaddr, %sunkaddr228
  %sunkaddr230 = inttoptr i64 %sunkaddr229 to i64*
  %28 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %32 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %34 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %36 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %38 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %39 = bitcast double* %arrayidx6.5 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %40 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %41 = bitcast double* %arrayidx6.6 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %42 = load i64, i64* %sunkaddr230, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %43 = bitcast double* %arrayidx6.7 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %vector.memcheck204.preheader, label %for.inc

vector.memcheck204.preheader:                     ; preds = %for.inc
  br label %vector.memcheck204

vector.memcheck171:                               ; preds = %vector.memcheck171.preheader, %for.inc66.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.inc66.us ], [ 0, %vector.memcheck171.preheader ]
  %scevgep159 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 2
  %44 = add i64 %indvars.iv99, 1
  %scevgep161 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %44, i64 0
  %scevgep163 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 1
  %scevgep165 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %44, i64 0
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 1
  %45 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 1
  %46 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 0
  %47 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %46, %47
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %45, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %bound0167 = icmp ult double* %scevgep159, %scevgep165
  %bound1168 = icmp ult double* %scevgep163, %scevgep161
  %memcheck.conflict170 = and i1 %bound0167, %bound1168
  br i1 %memcheck.conflict170, label %for.inc63.us.preheader, label %vector.body154.preheader

vector.body154.preheader:                         ; preds = %vector.memcheck171
  br label %vector.body154

vector.body154:                                   ; preds = %vector.body154.preheader, %vector.body154
  %index173 = phi i64 [ %index.next174, %vector.body154 ], [ 0, %vector.body154.preheader ]
  %48 = shl i64 %index173, 1
  %offset.idx = or i64 %48, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 %offset.idx
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec180 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %offset.idx
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec181 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !15
  %strided.vec182 = shufflevector <4 x double> %wide.vec181, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec183 = shufflevector <4 x double> %wide.vec181, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = fsub <2 x double> %strided.vec183, %strided.vec182
  %55 = fmul <2 x double> %54, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %strided.vec, %55
  %57 = or i64 %48, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %57
  %60 = getelementptr double, double* %59, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec184 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !15
  %strided.vec185 = shufflevector <4 x double> %wide.vec184, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec186 = shufflevector <4 x double> %wide.vec184, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fsub <2 x double> %strided.vec186, %strided.vec185
  %63 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %strided.vec180, %63
  %65 = getelementptr double, double* %58, i64 -1
  %66 = bitcast double* %65 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %56, <2 x double> %64, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %66, align 8, !alias.scope !12, !noalias !15
  %index.next174 = add i64 %index173, 2
  %67 = icmp eq i64 %index.next174, 598
  br i1 %67, label %for.inc63.us.preheader.loopexit, label %vector.body154, !llvm.loop !17

for.inc63.us.preheader.loopexit:                  ; preds = %vector.body154
  br label %for.inc63.us.preheader

for.inc63.us.preheader:                           ; preds = %for.inc63.us.preheader.loopexit, %vector.memcheck171
  %indvars.iv92.ph = phi i64 [ 2, %vector.memcheck171 ], [ 1198, %for.inc63.us.preheader.loopexit ]
  br label %for.inc63.us

for.inc63.us:                                     ; preds = %for.inc63.us.preheader, %for.inc63.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93.1, %for.inc63.us ], [ %indvars.iv92.ph, %for.inc63.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 %indvars.iv92
  %68 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %indvars.iv92
  %69 = load double, double* %arrayidx50.us, align 8
  %70 = add nsw i64 %indvars.iv92, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %70
  %71 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %69, %71
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %68, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next93 = or i64 %indvars.iv92, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv99, i64 %indvars.iv.next93
  %72 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %indvars.iv.next93
  %73 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv99, i64 %indvars.iv92
  %74 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %73, %74
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %72, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next93.1 = add nsw i64 %indvars.iv92, 2
  %exitcond96.1 = icmp eq i64 %indvars.iv.next93.1, 1200
  br i1 %exitcond96.1, label %for.inc66.us, label %for.inc63.us, !llvm.loop !18

for.inc66.us:                                     ; preds = %for.inc63.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, 1000
  br i1 %exitcond102, label %vector.memcheck.preheader, label %vector.memcheck171

vector.memcheck.preheader:                        ; preds = %for.inc66.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %for.inc110.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc110.us ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv108, i64 0
  %scevgep131 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv108, i64 1199
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv108, i64 0
  %75 = add i64 %indvars.iv108, 1
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %75, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv108, i64 0
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %75, i64 1199
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %bound0 = icmp ult double* %scevgep, %scevgep135
  %bound1 = icmp ult double* %scevgep133, %scevgep131
  %found.conflict = and i1 %bound0, %bound1
  %bound0141 = icmp ult double* %scevgep, %scevgep139
  %bound1142 = icmp ult double* %scevgep137, %scevgep131
  %found.conflict143 = and i1 %bound0141, %bound1142
  %conflict.rdx = or i1 %found.conflict, %found.conflict143
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv108, i64 %index
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !19, !noalias !22
  %80 = or i64 %index, 1
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv108, i64 %80
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !25
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !25
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv108, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !25
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !25
  %89 = fsub <2 x double> %wide.load146, %wide.load148
  %90 = fsub <2 x double> %wide.load147, %wide.load149
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next109, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !26
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load151 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !26
  %95 = fadd <2 x double> %89, %wide.load150
  %96 = fadd <2 x double> %90, %wide.load151
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv108, i64 %index
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !26
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load153 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !26
  %101 = fsub <2 x double> %95, %wide.load152
  %102 = fsub <2 x double> %96, %wide.load153
  %103 = fmul <2 x double> %101, <double 7.000000e-01, double 7.000000e-01>
  %104 = fmul <2 x double> %102, <double 7.000000e-01, double 7.000000e-01>
  %105 = fsub <2 x double> %wide.load, %103
  %106 = fsub <2 x double> %wide.load145, %104
  %107 = bitcast double* %76 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !19, !noalias !22
  %108 = bitcast double* %78 to <2 x double>*
  store <2 x double> %106, <2 x double>* %108, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %109 = icmp eq i64 %index.next, 1196
  br i1 %109, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %vector.memcheck
  %indvars.iv104.ph = phi i64 [ 0, %vector.memcheck ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %for.inc107.us ], [ %indvars.iv104.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv108, i64 %indvars.iv104
  %110 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv108, i64 %indvars.iv.next105
  %111 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv108, i64 %indvars.iv104
  %112 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %111, %112
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next109, i64 %indvars.iv104
  %113 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %113
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv108, i64 %indvars.iv104
  %114 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %114
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %110, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 1199
  br i1 %exitcond107, label %for.inc110.us, label %for.inc107.us, !llvm.loop !28

for.inc110.us:                                    ; preds = %for.inc107.us
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 999
  br i1 %exitcond111, label %for.inc113, label %vector.memcheck

for.inc113:                                       ; preds = %for.inc110.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 500
  br i1 %exitcond115, label %for.end115, label %for.inc.preheader

for.end115:                                       ; preds = %for.inc113
  ret void
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

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next78, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv77, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv72 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next73, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv72, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv77, i64 %indvars.iv72
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond76, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next78, 1000
  br i1 %exitcond81, label %for.cond19.preheader.us.preheader, label %for.cond2.preheader.us

for.cond19.preheader.us.preheader:                ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.inc37.us, %for.cond19.preheader.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next67, %for.inc37.us ]
  %13 = mul nsw i64 %indvars.iv66, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv61 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next62, %for.inc34.us ]
  %14 = add nsw i64 %indvars.iv61, %13
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv66, i64 %indvars.iv61
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond65, label %for.inc37.us, label %for.body21.us

for.inc37.us:                                     ; preds = %for.inc34.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond70, label %for.cond45.preheader.us.preheader, label %for.cond19.preheader.us

for.cond45.preheader.us.preheader:                ; preds = %for.inc37.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.inc63.us, %for.cond45.preheader.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond45.preheader.us.preheader ], [ %indvars.iv.next56, %for.inc63.us ]
  %21 = mul nsw i64 %indvars.iv55, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.inc60.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %for.inc60.us ]
  %22 = add nsw i64 %indvars.iv, %21
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
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc63.us, label %for.body47.us

for.inc63.us:                                     ; preds = %for.inc60.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond59, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.inc63.us
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

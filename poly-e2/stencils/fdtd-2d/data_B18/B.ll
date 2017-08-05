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
  %arraydecay17 = bitcast i8* %call to [1200 x double]*
  %arraydecay418 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay519 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay620 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay17, [1200 x double]* %arraydecay418, [1200 x double]* %arraydecay519, double* %arraydecay620)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay17, [1200 x double]* %arraydecay418, [1200 x double]* %arraydecay519, double* %arraydecay620)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay17, [1200 x double]* %arraydecay418, [1200 x double]* %arraydecay519)
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

for.body.prol:                                    ; preds = %entry, %for.body.prol
  %indvars.iv32.prol = phi i64 [ %indvars.iv.next33.prol, %for.body.prol ], [ 0, %entry ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv32.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv32.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next33.prol = add nuw nsw i64 %indvars.iv32.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.preheader, label %for.body.prol, !llvm.loop !1

for.body.preheader:                               ; preds = %for.body.prol
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %i.124.us = phi i32 [ %inc40.us, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %conv9.us = sitofp i32 %i.124.us to double
  %idxprom12.us = sext i32 %i.124.us to i64
  %1 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom12.us, i64 %indvars.iv
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
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom12.us, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom12.us, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %inc40.us = add nsw i32 %i.124.us, 1
  %cmp2.us = icmp slt i32 %inc40.us, 1000
  br i1 %cmp2.us, label %for.cond5.preheader.us, label %for.end41

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.7, %for.body ], [ %indvars.iv.next33.prol, %for.body.preheader ]
  %7 = trunc i64 %indvars.iv32 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv32
  %8 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %9 = trunc i64 %indvars.iv.next33 to i32
  %conv.1 = sitofp i32 %9 to double
  %10 = insertelement <2 x double> undef, double %conv, i32 0
  %11 = insertelement <2 x double> %10, double %conv.1, i32 1
  store <2 x double> %11, <2 x double>* %8, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %12 = trunc i64 %indvars.iv.next33.1 to i32
  %conv.2 = sitofp i32 %12 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next33.1
  %13 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next33.2 = add nsw i64 %indvars.iv32, 3
  %14 = trunc i64 %indvars.iv.next33.2 to i32
  %conv.3 = sitofp i32 %14 to double
  %15 = insertelement <2 x double> undef, double %conv.2, i32 0
  %16 = insertelement <2 x double> %15, double %conv.3, i32 1
  store <2 x double> %16, <2 x double>* %13, align 8
  %indvars.iv.next33.3 = add nsw i64 %indvars.iv32, 4
  %17 = trunc i64 %indvars.iv.next33.3 to i32
  %conv.4 = sitofp i32 %17 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next33.3
  %18 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next33.4 = add nsw i64 %indvars.iv32, 5
  %19 = trunc i64 %indvars.iv.next33.4 to i32
  %conv.5 = sitofp i32 %19 to double
  %20 = insertelement <2 x double> undef, double %conv.4, i32 0
  %21 = insertelement <2 x double> %20, double %conv.5, i32 1
  store <2 x double> %21, <2 x double>* %18, align 8
  %indvars.iv.next33.5 = add nsw i64 %indvars.iv32, 6
  %22 = trunc i64 %indvars.iv.next33.5 to i32
  %conv.6 = sitofp i32 %22 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next33.5
  %23 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next33.6 = add nsw i64 %indvars.iv32, 7
  %24 = trunc i64 %indvars.iv.next33.6 to i32
  %conv.7 = sitofp i32 %24 to double
  %25 = insertelement <2 x double> undef, double %conv.6, i32 0
  %26 = insertelement <2 x double> %25, double %conv.7, i32 1
  store <2 x double> %26, <2 x double>* %23, align 8
  %indvars.iv.next33.7 = add nsw i64 %indvars.iv32, 8
  %exitcond35.7 = icmp eq i64 %indvars.iv.next33.7, 500
  br i1 %exitcond35.7, label %for.cond5.preheader.us.preheader, label %for.body

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
  %indvars.iv104 = phi i64 [ 0, %entry ], [ %indvars.iv.next105, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar174 = phi i64 [ %0, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %i.066.us = phi i32 [ %inc35.us, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar174, 1
  %scevgep176 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar174, 2
  %scevgep178 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep180 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar174, i64 0
  %scevgep182 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %idxprom13.us = sext i32 %i.066.us to i64
  %sub.us = add nsw i32 %i.066.us, -1
  %idxprom21.us = sext i32 %sub.us to i64
  %bound0184 = icmp ult double* %scevgep176, %scevgep182
  %bound1185 = icmp ult double* %scevgep180, %scevgep178
  %memcheck.conflict187 = and i1 %bound0184, %bound1185
  br i1 %memcheck.conflict187, label %for.body12.us.preheader, label %vector.body169.preheader

vector.body169.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body169

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

vector.body169:                                   ; preds = %vector.body169.preheader, %vector.body169
  %index190 = phi i64 [ %index.next191, %vector.body169 ], [ 0, %vector.body169.preheader ]
  %offset.idx194 = shl i64 %index190, 1
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %offset.idx194
  %3 = bitcast double* %2 to <4 x double>*
  %wide.vec198 = load <4 x double>, <4 x double>* %3, align 8, !alias.scope !3, !noalias !6
  %strided.vec199 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec200 = shufflevector <4 x double> %wide.vec198, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %4 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %offset.idx194
  %5 = bitcast double* %4 to <4 x double>*
  %wide.vec201 = load <4 x double>, <4 x double>* %5, align 8, !alias.scope !6
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %offset.idx194
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec204 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !6
  %8 = fsub <4 x double> %wide.vec201, %wide.vec204
  %9 = shufflevector <4 x double> %8, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %10 = fmul <2 x double> %9, <double 5.000000e-01, double 5.000000e-01>
  %11 = fsub <2 x double> %strided.vec199, %10
  %12 = or i64 %offset.idx194, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %12
  %14 = shufflevector <4 x double> %8, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fmul <2 x double> %14, <double 5.000000e-01, double 5.000000e-01>
  %16 = fsub <2 x double> %strided.vec200, %15
  %17 = getelementptr double, double* %13, i64 -1
  %18 = bitcast double* %17 to <4 x double>*
  %interleaved.vec207 = shufflevector <2 x double> %11, <2 x double> %16, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec207, <4 x double>* %18, align 8, !alias.scope !3, !noalias !6
  %index.next191 = add i64 %index190, 2
  %19 = icmp eq i64 %index.next191, 600
  br i1 %19, label %for.cond10.for.inc34_crit_edge.us.loopexit243, label %vector.body169, !llvm.loop !8

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %indvars.iv87
  %20 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %indvars.iv87
  %21 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %indvars.iv87
  %22 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %21, %22
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %20, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom13.us, i64 %indvars.iv.next88
  %23 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom13.us, i64 %indvars.iv.next88
  %24 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom21.us, i64 %indvars.iv.next88
  %25 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %24, %25
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %23, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next88.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !11

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit243:    ; preds = %vector.body169
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit243, %for.cond10.for.inc34_crit_edge.us.loopexit
  %inc35.us = add nsw i32 %i.066.us, 1
  %cmp8.us = icmp slt i32 %inc35.us, 1000
  br i1 %cmp8.us, label %for.cond10.preheader.us, label %for.cond40.preheader.us.preheader

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.3.1, %for.body3 ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr240 = mul i64 %indvars.iv104, 8
  %sunkaddr241 = add i64 %sunkaddr, %sunkaddr240
  %sunkaddr242 = inttoptr i64 %sunkaddr241 to i64*
  %26 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %27 = bitcast double* %arrayidx6 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %29 = bitcast double* %arrayidx6.1 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %30 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %31 = bitcast double* %arrayidx6.2 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %32 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %33 = bitcast double* %arrayidx6.3 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %34 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.1238 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %35 = bitcast double* %arrayidx6.1238 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.1239 = or i64 %indvars.iv, 5
  %36 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.1.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1239
  %37 = bitcast double* %arrayidx6.1.1 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %38 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1.1
  %39 = bitcast double* %arrayidx6.2.1 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.2.1 = or i64 %indvars.iv, 7
  %40 = load i64, i64* %sunkaddr242, align 8
  %arrayidx6.3.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2.1
  %41 = bitcast double* %arrayidx6.3.1 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvar139 = phi i64 [ %42, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %i.170.us = phi i32 [ %inc67.us, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvar139, i64 2
  %42 = add i64 %indvar139, 1
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %42, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar139, i64 1
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %42, i64 0
  %idxprom43.us = sext i32 %i.170.us to i64
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 1
  %43 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 1
  %44 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 0
  %45 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %44, %45
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %43, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %bound0149 = icmp ult double* %scevgep141, %scevgep147
  %bound1150 = icmp ult double* %scevgep145, %scevgep143
  %memcheck.conflict152 = and i1 %bound0149, %bound1150
  br i1 %memcheck.conflict152, label %for.body42.us.preheader, label %vector.body134.preheader

vector.body134.preheader:                         ; preds = %for.cond40.preheader.us
  br label %vector.body134

vector.body134:                                   ; preds = %vector.body134.preheader, %vector.body134
  %index155 = phi i64 [ %index.next156, %vector.body134 ], [ 0, %vector.body134.preheader ]
  %46 = shl i64 %index155, 1
  %offset.idx = or i64 %46, 2
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %offset.idx
  %48 = bitcast double* %47 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %48, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec162 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %offset.idx
  %50 = getelementptr double, double* %49, i64 -1
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec163 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !15
  %strided.vec164 = shufflevector <4 x double> %wide.vec163, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec165 = shufflevector <4 x double> %wide.vec163, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fsub <2 x double> %strided.vec165, %strided.vec164
  %53 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %strided.vec, %53
  %55 = or i64 %46, 3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %55
  %58 = getelementptr double, double* %57, i64 -1
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec166 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !15
  %strided.vec167 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec168 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = fsub <2 x double> %strided.vec168, %strided.vec167
  %61 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>
  %62 = fsub <2 x double> %strided.vec162, %61
  %63 = getelementptr double, double* %56, i64 -1
  %64 = bitcast double* %63 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %54, <2 x double> %62, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %64, align 8, !alias.scope !12, !noalias !15
  %index.next156 = add i64 %index155, 2
  %65 = icmp eq i64 %index.next156, 598
  br i1 %65, label %for.body42.us.preheader.loopexit, label %vector.body134, !llvm.loop !17

for.body42.us.preheader.loopexit:                 ; preds = %vector.body134
  br label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %for.body42.us.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv93.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %for.body42.us.preheader.loopexit ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94.1, %for.body42.us ], [ %indvars.iv93.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %indvars.iv93
  %66 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv93
  %67 = load double, double* %arrayidx50.us, align 8
  %68 = add nsw i64 %indvars.iv93, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %68
  %69 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %67, %69
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %66, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom43.us, i64 %indvars.iv.next94
  %70 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom43.us, i64 %indvars.iv.next94
  %71 = load double, double* %arrayidx50.us.1, align 8
  %72 = load double, double* %arrayidx50.us, align 8
  %sub56.us.1 = fsub double %71, %72
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %70, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond.1100 = icmp eq i64 %indvars.iv.next94.1, 1200
  br i1 %exitcond.1100, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us, !llvm.loop !18

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us
  %inc67.us = add nsw i32 %i.170.us, 1
  %cmp38.us = icmp slt i32 %inc67.us, 1000
  br i1 %cmp38.us, label %for.cond40.preheader.us, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvar = phi i64 [ %73, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %i.274.us = phi i32 [ %add90.us, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 1199
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvar, i64 0
  %73 = add i64 %indvar, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %73, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvar, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %73, i64 1199
  %idxprom77.us = sext i32 %i.274.us to i64
  %add90.us = add nsw i32 %i.274.us, 1
  %idxprom91.us = sext i32 %add90.us to i64
  %bound0 = icmp ult double* %scevgep, %scevgep115
  %bound1 = icmp ult double* %scevgep113, %scevgep111
  %found.conflict = and i1 %bound0, %bound1
  %bound0121 = icmp ult double* %scevgep, %scevgep119
  %bound1122 = icmp ult double* %scevgep117, %scevgep111
  %found.conflict123 = and i1 %bound0121, %bound1122
  %conflict.rdx = or i1 %found.conflict, %found.conflict123
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom77.us, i64 %index
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !19, !noalias !22
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %78 = or i64 %index, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !25
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !25
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !25
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !25
  %87 = fsub <2 x double> %wide.load126, %wide.load128
  %88 = fsub <2 x double> %wide.load127, %wide.load129
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom91.us, i64 %index
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !26
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !26
  %93 = fadd <2 x double> %87, %wide.load130
  %94 = fadd <2 x double> %88, %wide.load131
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom77.us, i64 %index
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !26
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !26
  %99 = fsub <2 x double> %93, %wide.load132
  %100 = fsub <2 x double> %94, %wide.load133
  %101 = fmul <2 x double> %99, <double 7.000000e-01, double 7.000000e-01>
  %102 = fmul <2 x double> %100, <double 7.000000e-01, double 7.000000e-01>
  %103 = fsub <2 x double> %wide.load, %101
  %104 = fsub <2 x double> %wide.load125, %102
  store <2 x double> %103, <2 x double>* %75, align 8, !alias.scope !19, !noalias !22
  store <2 x double> %104, <2 x double>* %77, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %105 = icmp eq i64 %index.next, 1196
  br i1 %105, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv101.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.body76.us ], [ %indvars.iv101.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom77.us, i64 %indvars.iv101
  %106 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %indvars.iv.next102
  %107 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom77.us, i64 %indvars.iv101
  %108 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %107, %108
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom91.us, i64 %indvars.iv101
  %109 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %109
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom77.us, i64 %indvars.iv101
  %110 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %110
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %106, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next102, 1199
  br i1 %exitcond, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us, !llvm.loop !28

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %cmp71.us = icmp slt i32 %add90.us, 999
  br i1 %cmp71.us, label %for.cond73.preheader.us, label %for.inc113

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 500
  br i1 %exitcond107, label %for.end115, label %for.cond1.preheader

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

for.cond2.preheader.us:                           ; preds = %entry, %for.cond2.for.inc10_crit_edge.us
  %i.045.us = phi i32 [ %inc11.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %mul.us = mul nsw i32 %i.045.us, 1000
  %idxprom.us = sext i32 %i.045.us to i64
  %3 = zext i32 %mul.us to i64
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv60 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next61, %if.end.us ]
  %4 = add i64 %indvars.iv60, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc32.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %idxprom.us, i64 %indvars.iv60
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond64, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %inc11.us = add nsw i32 %i.045.us, 1
  %cmp.us = icmp slt i32 %inc11.us, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.end12, %for.cond19.for.inc37_crit_edge.us
  %i.140.us = phi i32 [ %inc38.us, %for.cond19.for.inc37_crit_edge.us ], [ 0, %for.end12 ]
  %mul22.us = mul nsw i32 %i.140.us, 1000
  %idxprom29.us = sext i32 %i.140.us to i64
  %13 = zext i32 %mul22.us to i64
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv54 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next55, %if.end28.us ]
  %14 = add i64 %indvars.iv54, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc29.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %idxprom29.us, i64 %indvars.iv54
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond58, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %inc38.us = add nsw i32 %i.140.us, 1
  %cmp17.us = icmp slt i32 %inc38.us, 1000
  br i1 %cmp17.us, label %for.cond19.preheader.us, label %for.end39

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.end39, %for.cond45.for.inc63_crit_edge.us
  %i.236.us = phi i32 [ %inc64.us, %for.cond45.for.inc63_crit_edge.us ], [ 0, %for.end39 ]
  %mul48.us = mul nsw i32 %i.236.us, 1000
  %idxprom55.us = sext i32 %i.236.us to i64
  %21 = zext i32 %mul48.us to i64
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next, %if.end54.us ]
  %22 = add i64 %indvars.iv, %21
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %idxprom55.us, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %inc64.us = add nsw i32 %i.236.us, 1
  %cmp43.us = icmp slt i32 %inc64.us, 1000
  br i1 %cmp43.us, label %for.cond45.preheader.us, label %for.end65

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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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

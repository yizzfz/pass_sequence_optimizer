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
  br label %for.body.prol

for.body.prol:                                    ; preds = %for.body.prol, %entry
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %for.body.prol ], [ 0, %entry ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body.prol ], [ 4, %entry ]
  %0 = trunc i64 %indvars.iv15.prol to i32
  %conv.prol = sitofp i32 %0 to double
  %arrayidx.prol = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv15.prol
  store double %conv.prol, double* %arrayidx.prol, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body.preheader, label %for.body.prol, !llvm.loop !1

for.body.preheader:                               ; preds = %for.body.prol
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %1 = trunc i64 %indvars.iv10 to i32
  %conv9.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.body8.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %3 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv
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
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %6 = add nuw nsw i64 %indvars.iv, 3
  %7 = trunc i64 %6 to i32
  %conv28.us = sitofp i32 %7 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.7, %for.body ], [ 4, %for.body.preheader ]
  %8 = trunc i64 %indvars.iv15 to i32
  %conv = sitofp i32 %8 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv15
  %9 = bitcast double* %arrayidx to <2 x double>*
  %10 = trunc i64 %indvars.iv15 to i32
  %11 = or i32 %10, 1
  %conv.1 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv, i32 0
  %13 = insertelement <2 x double> %12, double %conv.1, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next16.1 = or i64 %indvars.iv15, 2
  %14 = trunc i64 %indvars.iv.next16.1 to i32
  %conv.2 = sitofp i32 %14 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.1
  %15 = bitcast double* %arrayidx.2 to <2 x double>*
  %16 = trunc i64 %indvars.iv15 to i32
  %17 = or i32 %16, 3
  %conv.3 = sitofp i32 %17 to double
  %18 = insertelement <2 x double> undef, double %conv.2, i32 0
  %19 = insertelement <2 x double> %18, double %conv.3, i32 1
  store <2 x double> %19, <2 x double>* %15, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %20 = trunc i64 %indvars.iv.next16.3 to i32
  %conv.4 = sitofp i32 %20 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.3
  %21 = bitcast double* %arrayidx.4 to <2 x double>*
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %22 = trunc i64 %indvars.iv.next16.4 to i32
  %conv.5 = sitofp i32 %22 to double
  %23 = insertelement <2 x double> undef, double %conv.4, i32 0
  %24 = insertelement <2 x double> %23, double %conv.5, i32 1
  store <2 x double> %24, <2 x double>* %21, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %25 = trunc i64 %indvars.iv.next16.5 to i32
  %conv.6 = sitofp i32 %25 to double
  %arrayidx.6 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next16.5
  %26 = bitcast double* %arrayidx.6 to <2 x double>*
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %27 = trunc i64 %indvars.iv.next16.6 to i32
  %conv.7 = sitofp i32 %27 to double
  %28 = insertelement <2 x double> undef, double %conv.6, i32 0
  %29 = insertelement <2 x double> %28, double %conv.7, i32 1
  store <2 x double> %29, <2 x double>* %26, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, 500
  br i1 %exitcond18.7, label %for.cond5.preheader.us.preheader, label %for.body

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
  %indvars.iv49 = phi i64 [ 0, %entry ], [ %indvars.iv.next50, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add nsw i64 %indvars.iv25, -1
  %scevgep130 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 1200
  %scevgep136 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %0, i64 1200
  %bound0141 = icmp ult double* %scevgep130, %scevgep139
  %bound1142 = icmp ult double* %scevgep136, %scevgep133
  %memcheck.conflict144 = and i1 %bound0141, %bound1142
  br i1 %memcheck.conflict144, label %for.body12.us.preheader, label %vector.body120.preheader

vector.body120.preheader:                         ; preds = %for.cond10.preheader.us
  br label %vector.body120

vector.body120:                                   ; preds = %vector.body120.preheader, %vector.body120
  %index147 = phi i64 [ %index.next148, %vector.body120 ], [ 0, %vector.body120.preheader ]
  %2 = shl i64 %index147, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25, i64 %2
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec156 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !3, !noalias !6
  %strided.vec157 = shufflevector <4 x double> %wide.vec156, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec158 = shufflevector <4 x double> %wide.vec156, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25, i64 %2
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec159 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %2
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec162 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6
  %9 = fsub <4 x double> %wide.vec159, %wide.vec162
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec157, %11
  %13 = or i64 %2, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25, i64 %13
  %15 = fsub <4 x double> %wide.vec159, %wide.vec162
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec158, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec165 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec165, <4 x double>* %20, align 8, !alias.scope !3, !noalias !6
  %index.next148 = add i64 %index147, 2
  %21 = icmp eq i64 %index.next148, 600
  br i1 %21, label %middle.block121, label %vector.body120, !llvm.loop !8

middle.block121:                                  ; preds = %vector.body120
  br label %for.cond10.for.inc34_crit_edge.us

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us.preheader, %for.body12.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %for.body12.us ], [ 0, %for.body12.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25, i64 %indvars.iv21
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25, i64 %indvars.iv21
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv21
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv25, i64 %indvars.iv.next22
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv25, i64 %indvars.iv.next22
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %1, i64 %indvars.iv.next22
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22.1, 1200
  br i1 %exitcond24.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.body12.us, !llvm.loop !11

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.body12.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit, %middle.block121
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond29, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %for.body3 ], [ 0, %for.cond1.preheader ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr194 = mul i64 %indvars.iv49, 8
  %sunkaddr195 = add i64 %sunkaddr, %sunkaddr194
  %sunkaddr196 = inttoptr i64 %sunkaddr195 to i64*
  %28 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %32 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %34 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %36 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %38 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %39 = bitcast double* %arrayidx6.5 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %40 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %41 = bitcast double* %arrayidx6.6 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %42 = load i64, i64* %sunkaddr196, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %43 = bitcast double* %arrayidx6.7 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 1
  %44 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 1
  %45 = load double, double* %arrayidx50.us.prol, align 8
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 0
  %46 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %45, %46
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %44, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 2
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 1200
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 1
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 1200
  %bound0100 = icmp ult double* %scevgep89, %scevgep98
  %bound1101 = icmp ult double* %scevgep95, %scevgep92
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  br i1 %memcheck.conflict103, label %for.body42.us.preheader, label %vector.body83.preheader

vector.body83.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body83

vector.body83:                                    ; preds = %vector.body83.preheader, %vector.body83
  %index106 = phi i64 [ %index.next107, %vector.body83 ], [ 0, %vector.body83.preheader ]
  %47 = shl i64 %index106, 1
  %offset.idx = or i64 %47, 2
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 %offset.idx
  %49 = bitcast double* %48 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %49, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec113 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %offset.idx
  %51 = getelementptr double, double* %50, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %wide.vec114 = load <4 x double>, <4 x double>* %52, align 8, !alias.scope !15
  %strided.vec115 = shufflevector <4 x double> %wide.vec114, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec116 = shufflevector <4 x double> %wide.vec114, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %53 = fsub <2 x double> %strided.vec116, %strided.vec115
  %54 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %strided.vec, %54
  %56 = or i64 %47, 3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %56
  %59 = getelementptr double, double* %58, i64 -1
  %60 = bitcast double* %59 to <4 x double>*
  %wide.vec117 = load <4 x double>, <4 x double>* %60, align 8, !alias.scope !15
  %strided.vec118 = shufflevector <4 x double> %wide.vec117, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec119 = shufflevector <4 x double> %wide.vec117, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %61 = fsub <2 x double> %strided.vec119, %strided.vec118
  %62 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %63 = fsub <2 x double> %strided.vec113, %62
  %64 = getelementptr double, double* %57, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %55, <2 x double> %63, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %65, align 8, !alias.scope !12, !noalias !15
  %index.next107 = add i64 %index106, 2
  %66 = icmp eq i64 %index.next107, 598
  br i1 %66, label %middle.block84, label %vector.body83, !llvm.loop !17

middle.block84:                                   ; preds = %vector.body83
  br label %for.body42.us.preheader

for.body42.us.preheader:                          ; preds = %middle.block84, %for.cond40.preheader.us
  %indvars.iv31.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %middle.block84 ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.preheader, %for.body42.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %for.body42.us ], [ %indvars.iv31.ph, %for.body42.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 %indvars.iv31
  %67 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %indvars.iv31
  %68 = load double, double* %arrayidx50.us, align 8
  %69 = add nsw i64 %indvars.iv31, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %69
  %70 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %68, %70
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %67, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv36, i64 %indvars.iv.next32
  %71 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %indvars.iv.next32
  %72 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv36, i64 %indvars.iv31
  %73 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %72, %73
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %71, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next32.1, 1200
  br i1 %exitcond35.1, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us, !llvm.loop !18

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond39, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv45, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv45, i64 1199
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv45, i64 0
  %74 = add i64 %indvars.iv45, 1
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %74, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv45, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %74, i64 1199
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %bound0 = icmp ult double* %scevgep, %scevgep64
  %bound1 = icmp ult double* %scevgep62, %scevgep60
  %found.conflict = and i1 %bound0, %bound1
  %bound070 = icmp ult double* %scevgep, %scevgep68
  %bound171 = icmp ult double* %scevgep66, %scevgep60
  %found.conflict72 = and i1 %bound070, %bound171
  %conflict.rdx = or i1 %found.conflict, %found.conflict72
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv45, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !19, !noalias !22
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !19, !noalias !22
  %79 = or i64 %index, 1
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv45, i64 %79
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !25
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !25
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv45, i64 %index
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !25
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !25
  %88 = fsub <2 x double> %wide.load75, %wide.load77
  %89 = fsub <2 x double> %wide.load76, %wide.load78
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next46, i64 %index
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !26
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !26
  %94 = fadd <2 x double> %88, %wide.load79
  %95 = fadd <2 x double> %89, %wide.load80
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv45, i64 %index
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %97, align 8, !alias.scope !26
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !26
  %100 = fsub <2 x double> %94, %wide.load81
  %101 = fsub <2 x double> %95, %wide.load82
  %102 = fmul <2 x double> %100, <double 7.000000e-01, double 7.000000e-01>
  %103 = fmul <2 x double> %101, <double 7.000000e-01, double 7.000000e-01>
  %104 = fsub <2 x double> %wide.load, %102
  %105 = fsub <2 x double> %wide.load74, %103
  %106 = bitcast double* %75 to <2 x double>*
  store <2 x double> %104, <2 x double>* %106, align 8, !alias.scope !19, !noalias !22
  %107 = bitcast double* %77 to <2 x double>*
  store <2 x double> %105, <2 x double>* %107, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %108 = icmp eq i64 %index.next, 1196
  br i1 %108, label %for.body76.us.preheader.loopexit, label %vector.body, !llvm.loop !27

for.body76.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.body76.us.preheader

for.body76.us.preheader:                          ; preds = %for.body76.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv41.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.body76.us.preheader.loopexit ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.body76.us ], [ %indvars.iv41.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv45, i64 %indvars.iv41
  %109 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv45, i64 %indvars.iv.next42
  %110 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv45, i64 %indvars.iv41
  %111 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %110, %111
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next46, i64 %indvars.iv41
  %112 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %112
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv45, i64 %indvars.iv41
  %113 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %113
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %109, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1199
  br i1 %exitcond44, label %for.cond73.for.inc110_crit_edge.us, label %for.body76.us, !llvm.loop !28

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 999
  br i1 %exitcond48, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 500
  br i1 %exitcond52, label %for.end115, label %for.cond1.preheader

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
  %indvars.iv46 = phi i64 [ 0, %entry ], [ %indvars.iv.next47, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv46, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv41 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next42, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv41, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv46, i64 %indvars.iv41
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond45, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next47, 1000
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
  %indvars.iv35 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next36, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nuw nsw i64 %indvars.iv35, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv30 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next31, %if.end28.us ]
  %14 = add nuw nsw i64 %indvars.iv30, %13
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
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv35, i64 %indvars.iv30
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond34, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, 1000
  br i1 %exitcond39, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv24 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next25, %for.cond45.for.inc63_crit_edge.us ]
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
  %exitcond28 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond28, label %for.end65, label %for.cond45.preheader.us

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

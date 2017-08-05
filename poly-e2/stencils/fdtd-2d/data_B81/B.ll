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
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  tail call void @print_array([1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
for.inc.preheader:
  br label %for.inc

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv3 to i32
  %conv9.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc36.us

for.inc36.us:                                     ; preds = %for.inc36.us, %for.cond5.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next, %for.inc36.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv3, i64 %indvars.iv
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
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3, i64 %indvars.iv
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.inc36.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc36.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond5, label %for.end41, label %for.cond5.preheader.us

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv6 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next7.4, %for.inc ]
  %7 = trunc i64 %indvars.iv6 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv6
  %8 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %9 = trunc i64 %indvars.iv.next7 to i32
  %conv.1 = sitofp i32 %9 to double
  %10 = insertelement <2 x double> undef, double %conv, i32 0
  %11 = insertelement <2 x double> %10, double %conv.1, i32 1
  store <2 x double> %11, <2 x double>* %8, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  %12 = trunc i64 %indvars.iv.next7.1 to i32
  %conv.2 = sitofp i32 %12 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next7.1
  %13 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next7.2 = add nsw i64 %indvars.iv6, 3
  %14 = trunc i64 %indvars.iv.next7.2 to i32
  %conv.3 = sitofp i32 %14 to double
  %15 = insertelement <2 x double> undef, double %conv.2, i32 0
  %16 = insertelement <2 x double> %15, double %conv.3, i32 1
  store <2 x double> %16, <2 x double>* %13, align 8
  %indvars.iv.next7.3 = add nsw i64 %indvars.iv6, 4
  %17 = trunc i64 %indvars.iv.next7.3 to i32
  %conv.4 = sitofp i32 %17 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next7.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next7.4 = add nsw i64 %indvars.iv6, 5
  %exitcond8.4 = icmp eq i64 %indvars.iv.next7.4, 500
  br i1 %exitcond8.4, label %for.cond5.preheader.us.preheader, label %for.inc

for.cond5.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* %_fict_) #2 {
for.cond1.preheader.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader.lr.ph, %for.inc113
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next20, %for.inc113 ]
  br label %for.inc

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond10.for.inc34_crit_edge.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep104 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv3, -1
  %bound0108 = icmp ult double* %scevgep100, %scevgep106
  %bound1109 = icmp ult double* %scevgep104, %scevgep102
  %memcheck.conflict111 = and i1 %bound0108, %bound1109
  br i1 %memcheck.conflict111, label %for.inc31.us.preheader, label %vector.body95.preheader

vector.body95.preheader:                          ; preds = %for.cond10.preheader.us
  br label %vector.body95

for.inc31.us.preheader:                           ; preds = %for.cond10.preheader.us
  br label %for.inc31.us

vector.body95:                                    ; preds = %vector.body95.preheader, %vector.body95
  %index114 = phi i64 [ %index.next115, %vector.body95 ], [ 0, %vector.body95.preheader ]
  %offset.idx118 = shl i64 %index114, 1
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3, i64 %offset.idx118
  %4 = bitcast double* %3 to <4 x double>*
  %wide.vec122 = load <4 x double>, <4 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %strided.vec123 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec124 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %5 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3, i64 %offset.idx118
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %offset.idx118
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !4
  %9 = fsub <4 x double> %wide.vec125, %wide.vec128
  %10 = shufflevector <4 x double> %9, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %11 = fmul <2 x double> %10, <double 5.000000e-01, double 5.000000e-01>
  %12 = fsub <2 x double> %strided.vec123, %11
  %13 = or i64 %offset.idx118, 1
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3, i64 %13
  %15 = fsub <4 x double> %wide.vec125, %wide.vec128
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec124, %17
  %19 = getelementptr double, double* %14, i64 -1
  %20 = bitcast double* %19 to <4 x double>*
  %interleaved.vec131 = shufflevector <2 x double> %12, <2 x double> %18, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec131, <4 x double>* %20, align 8, !alias.scope !1, !noalias !4
  %index.next115 = add i64 %index114, 2
  %21 = icmp eq i64 %index.next115, 600
  br i1 %21, label %for.cond10.for.inc34_crit_edge.us.loopexit136, label %vector.body95, !llvm.loop !6

for.inc31.us:                                     ; preds = %for.inc31.us.preheader, %for.inc31.us
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.1, %for.inc31.us ], [ 0, %for.inc31.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3, i64 %indvars.iv1
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3, i64 %indvars.iv1
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv1
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2 = or i64 %indvars.iv1, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv3, i64 %indvars.iv.next2
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv3, i64 %indvars.iv.next2
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next2
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next2.1, 1200
  br i1 %exitcond.1, label %for.cond10.for.inc34_crit_edge.us.loopexit, label %for.inc31.us, !llvm.loop !9

for.cond10.for.inc34_crit_edge.us.loopexit:       ; preds = %for.inc31.us
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us.loopexit136:    ; preds = %vector.body95
  br label %for.cond10.for.inc34_crit_edge.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.cond10.for.inc34_crit_edge.us.loopexit136, %for.cond10.for.inc34_crit_edge.us.loopexit
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next.7, %for.inc ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr133 = mul i64 %indvars.iv19, 8
  %sunkaddr134 = add i64 %sunkaddr, %sunkaddr133
  %sunkaddr135 = inttoptr i64 %sunkaddr134 to i64*
  %28 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %32 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %34 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %36 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %38 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %39 = bitcast double* %arrayidx6.5 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %40 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %41 = bitcast double* %arrayidx6.6 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %42 = load i64, i64* %sunkaddr135, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %43 = bitcast double* %arrayidx6.7 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.us.preheader, label %for.inc

for.cond10.preheader.us.preheader:                ; preds = %for.inc
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 2
  %44 = add i64 %indvars.iv10, 1
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %44, i64 0
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 1
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %44, i64 0
  %arrayidx46.us25 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 1
  %45 = load double, double* %arrayidx46.us25, align 8
  %arrayidx50.us26 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 1
  %46 = load double, double* %arrayidx50.us26, align 8
  %arrayidx55.us27 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 0
  %47 = load double, double* %arrayidx55.us27, align 8
  %sub56.us28 = fsub double %46, %47
  %mul57.us29 = fmul double %sub56.us28, 5.000000e-01
  %sub58.us30 = fsub double %45, %mul57.us29
  store double %sub58.us30, double* %arrayidx46.us25, align 8
  %bound070 = icmp ult double* %scevgep62, %scevgep68
  %bound171 = icmp ult double* %scevgep66, %scevgep64
  %memcheck.conflict73 = and i1 %bound070, %bound171
  br i1 %memcheck.conflict73, label %for.inc63.us.1.preheader, label %vector.body57.preheader

vector.body57.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body57

for.inc63.us.1.preheader.loopexit:                ; preds = %vector.body57
  br label %for.inc63.us.1.preheader

for.inc63.us.1.preheader:                         ; preds = %for.inc63.us.1.preheader.loopexit, %for.cond40.preheader.us
  %indvars.iv.next732.ph = phi i64 [ 2, %for.cond40.preheader.us ], [ 1198, %for.inc63.us.1.preheader.loopexit ]
  %indvars.iv631.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %for.inc63.us.1.preheader.loopexit ]
  br label %for.inc63.us.1

vector.body57:                                    ; preds = %vector.body57.preheader, %vector.body57
  %index76 = phi i64 [ %index.next77, %vector.body57 ], [ 0, %vector.body57.preheader ]
  %48 = shl i64 %index76, 1
  %offset.idx = or i64 %48, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %offset.idx
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec88 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %offset.idx
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !13
  %strided.vec90 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = fsub <2 x double> %strided.vec91, %strided.vec90
  %55 = fmul <2 x double> %54, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %strided.vec, %55
  %57 = or i64 %48, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %57
  %60 = getelementptr double, double* %59, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec92 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !13
  %strided.vec93 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec94 = shufflevector <4 x double> %wide.vec92, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fsub <2 x double> %strided.vec94, %strided.vec93
  %63 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %strided.vec88, %63
  %65 = getelementptr double, double* %58, i64 -1
  %66 = bitcast double* %65 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %56, <2 x double> %64, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %66, align 8, !alias.scope !10, !noalias !13
  %index.next77 = add i64 %index76, 2
  %67 = icmp eq i64 %index.next77, 598
  br i1 %67, label %for.inc63.us.1.preheader.loopexit, label %vector.body57, !llvm.loop !15

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.inc63.us.1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond12, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv16, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv16, i64 1199
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv16, i64 0
  %68 = add i64 %indvars.iv16, 1
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %68, i64 0
  %scevgep40 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv16, i64 0
  %scevgep42 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %68, i64 1199
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ult double* %scevgep36, %scevgep34
  %found.conflict = and i1 %bound0, %bound1
  %bound044 = icmp ult double* %scevgep, %scevgep42
  %bound145 = icmp ult double* %scevgep40, %scevgep34
  %found.conflict46 = and i1 %bound044, %bound145
  %conflict.rdx = or i1 %found.conflict, %found.conflict46
  br i1 %conflict.rdx, label %for.inc107.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv16, i64 %index
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !16, !noalias !19
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !16, !noalias !19
  %73 = or i64 %index, 1
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv16, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !22
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !22
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv16, i64 %index
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !22
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !22
  %82 = fsub <2 x double> %wide.load49, %wide.load51
  %83 = fsub <2 x double> %wide.load50, %wide.load52
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next17, i64 %index
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %85, align 8, !alias.scope !23
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !23
  %88 = fadd <2 x double> %82, %wide.load53
  %89 = fadd <2 x double> %83, %wide.load54
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv16, i64 %index
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %91, align 8, !alias.scope !23
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !23
  %94 = fsub <2 x double> %88, %wide.load55
  %95 = fsub <2 x double> %89, %wide.load56
  %96 = fmul <2 x double> %94, <double 7.000000e-01, double 7.000000e-01>
  %97 = fmul <2 x double> %95, <double 7.000000e-01, double 7.000000e-01>
  %98 = fsub <2 x double> %wide.load, %96
  %99 = fsub <2 x double> %wide.load48, %97
  %100 = bitcast double* %69 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8, !alias.scope !16, !noalias !19
  %101 = bitcast double* %71 to <2 x double>*
  store <2 x double> %99, <2 x double>* %101, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %102 = icmp eq i64 %index.next, 1196
  br i1 %102, label %for.inc107.us.preheader.loopexit, label %vector.body, !llvm.loop !24

for.inc107.us.preheader.loopexit:                 ; preds = %vector.body
  br label %for.inc107.us.preheader

for.inc107.us.preheader:                          ; preds = %for.inc107.us.preheader.loopexit, %for.cond73.preheader.us
  %indvars.iv13.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %for.inc107.us.preheader.loopexit ]
  br label %for.inc107.us

for.inc107.us:                                    ; preds = %for.inc107.us.preheader, %for.inc107.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.inc107.us ], [ %indvars.iv13.ph, %for.inc107.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv16, i64 %indvars.iv13
  %103 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv16, i64 %indvars.iv.next14
  %104 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv16, i64 %indvars.iv13
  %105 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %104, %105
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next17, i64 %indvars.iv13
  %106 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %106
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv16, i64 %indvars.iv13
  %107 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %107
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %103, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1199
  br i1 %exitcond15, label %for.cond73.for.inc110_crit_edge.us, label %for.inc107.us, !llvm.loop !25

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.inc107.us
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond18, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 500
  br i1 %exitcond21, label %for.end115, label %for.inc.lr.ph

for.end115:                                       ; preds = %for.inc113
  ret void

for.inc63.us.1:                                   ; preds = %for.inc63.us.1.preheader, %for.inc63.us.1
  %indvars.iv.next732 = phi i64 [ %indvars.iv.next7, %for.inc63.us.1 ], [ %indvars.iv.next732.ph, %for.inc63.us.1.preheader ]
  %indvars.iv631 = phi i64 [ %indvars.iv.next7.1, %for.inc63.us.1 ], [ %indvars.iv631.ph, %for.inc63.us.1.preheader ]
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv.next732
  %108 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv.next732
  %109 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv631
  %110 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %109, %110
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %108, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv631, 2
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv10, i64 %indvars.iv.next7.1
  %111 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %indvars.iv.next7.1
  %112 = load double, double* %arrayidx50.us, align 8
  %113 = add nsw i64 %indvars.iv631, 1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv10, i64 %113
  %114 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %112, %114
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %111, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next7 = add nsw i64 %indvars.iv631, 3
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond9, label %for.cond40.for.inc66_crit_edge.us, label %for.inc63.us.1, !llvm.loop !26
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next19, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv18, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next15, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv14, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc35.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv18, i64 %indvars.iv14
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond21, label %for.cond19.preheader.us.preheader, label %for.cond2.preheader.us

for.cond19.preheader.us.preheader:                ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.cond19.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond19.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nuw nsw i64 %indvars.iv10, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %for.inc34.us, %for.cond19.preheader.us
  %indvars.iv6 = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next7, %for.inc34.us ]
  %14 = add nuw nsw i64 %indvars.iv6, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %for.inc34.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc32.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %for.inc34.us

for.inc34.us:                                     ; preds = %if.then26.us, %for.body21.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv10, i64 %indvars.iv6
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond9, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %for.inc34.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.cond45.preheader.us.preheader, label %for.cond19.preheader.us

for.cond45.preheader.us.preheader:                ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.cond45.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond45.preheader.us.preheader ], [ %indvars.iv.next3, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nuw nsw i64 %indvars.iv2, 1000
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

for.inc60.us:                                     ; preds = %if.then52.us, %for.body47.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2, i64 %indvars.iv
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %for.inc60.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond5, label %for.end65, label %for.cond45.preheader.us

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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

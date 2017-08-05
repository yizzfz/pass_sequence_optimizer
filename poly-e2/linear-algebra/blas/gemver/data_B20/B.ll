; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay92 = bitcast i8* %call1 to double*
  %arraydecay103 = bitcast i8* %call2 to double*
  %arraydecay114 = bitcast i8* %call3 to double*
  %arraydecay125 = bitcast i8* %call4 to double*
  %arraydecay136 = bitcast i8* %call5 to double*
  %arraydecay147 = bitcast i8* %call6 to double*
  %arraydecay158 = bitcast i8* %call7 to double*
  %arraydecay169 = bitcast i8* %call8 to double*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(double* %arraydecay136)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call7) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us.new

for.body.us.new:                                  ; preds = %for.body.us.preheader, %for.cond35.for.cond.loopexit_crit_edge.us
  %indvars.iv6 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next7, %for.cond35.for.cond.loopexit_crit_edge.us ]
  %0 = trunc i64 %indvars.iv6 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv6
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %1 = trunc i64 %indvars.iv.next7 to i32
  %conv3.us = sitofp i32 %1 to double
  %div.us = fdiv double %conv3.us, 2.000000e+03
  %div4.us = fmul double %div.us, 5.000000e-01
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv6
  store double %div4.us, double* %arrayidx6.us, align 8
  %div10.us = fmul double %div.us, 2.500000e-01
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv6
  store double %div10.us, double* %arrayidx12.us, align 8
  %div16.us = fdiv double %div.us, 6.000000e+00
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv6
  store double %div16.us, double* %arrayidx18.us, align 8
  %div22.us = fmul double %div.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv6
  store double %div22.us, double* %arrayidx24.us, align 8
  %div28.us = fdiv double %div.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv6
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us.new
  %indvars.iv = phi i64 [ 0, %for.body.us.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, 2.000000e+03
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %5 = trunc i64 %4 to i32
  %rem.us.1 = srem i32 %5, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, 2.000000e+03
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.cond.loopexit_crit_edge.us, label %for.inc.us

for.cond35.for.cond.loopexit_crit_edge.us:        ; preds = %for.inc.us
  %exitcond = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond, label %for.end48, label %for.body.us.new

for.end48:                                        ; preds = %for.cond35.for.cond.loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) #2 {
for.cond1.preheader.us.preheader:
  %scevgep6 = getelementptr double, double* %v1, i64 2000
  %scevgep9 = getelementptr double, double* %v2, i64 2000
  br label %for.cond1.preheader.us.new

for.cond1.preheader.us.new:                       ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc20_crit_edge.us
  %indvars.iv40 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next41, %for.cond1.for.inc20_crit_edge.us ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 0
  %0 = add i64 %indvars.iv40, 1
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv40
  %arrayidx11.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv40
  %bound0 = icmp ult double* %scevgep, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep6
  %bound113 = icmp ugt double* %scevgep3, %v1
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  %bound017 = icmp ult double* %scevgep, %arrayidx11.us
  %bound118 = icmp ult double* %arrayidx11.us, %scevgep3
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx20 = or i1 %conflict.rdx, %found.conflict19
  %bound021 = icmp ult double* %scevgep, %scevgep9
  %bound122 = icmp ugt double* %scevgep3, %v2
  %found.conflict23 = and i1 %bound021, %bound122
  %conflict.rdx24 = or i1 %conflict.rdx20, %found.conflict23
  br i1 %conflict.rdx24, label %for.inc.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond1.preheader.us.new
  %1 = load double, double* %arrayidx7.us, align 8, !alias.scope !1
  %2 = insertelement <2 x double> undef, double %1, i32 0
  %3 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %4 = load double, double* %arrayidx11.us, align 8, !alias.scope !4
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  %7 = load double, double* %arrayidx7.us, align 8, !alias.scope !1
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = load double, double* %arrayidx11.us, align 8, !alias.scope !4
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

for.inc.us.preheader:                             ; preds = %for.cond1.preheader.us.new
  br label %for.inc.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %offset.idx
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec25 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec26 = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !11
  %strided.vec27 = shufflevector <4 x double> %wide.vec26, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec28 = shufflevector <4 x double> %wide.vec26, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %3, %strided.vec27
  %18 = fadd <2 x double> %strided.vec, %17
  %19 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %20 = bitcast double* %19 to <4 x double>*
  %wide.vec29 = load <4 x double>, <4 x double>* %20, align 8, !alias.scope !12
  %strided.vec30 = shufflevector <4 x double> %wide.vec29, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec31 = shufflevector <4 x double> %wide.vec29, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = fmul <2 x double> %6, %strided.vec30
  %22 = fadd <2 x double> %18, %21
  %23 = or i64 %offset.idx, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %23
  %25 = fmul <2 x double> %9, %strided.vec28
  %26 = fadd <2 x double> %strided.vec25, %25
  %27 = fmul <2 x double> %12, %strided.vec31
  %28 = fadd <2 x double> %26, %27
  %29 = getelementptr double, double* %24, i64 -1
  %30 = bitcast double* %29 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %22, <2 x double> %28, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %30, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %31 = icmp eq i64 %index.next, 1000
  br i1 %31, label %for.cond1.for.inc20_crit_edge.us.loopexit69, label %vector.body, !llvm.loop !13

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.inc.us ], [ 0, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv34
  %32 = load double, double* %arrayidx5.us, align 8
  %33 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv34
  %34 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %33, %34
  %add.us = fadd double %32, %mul.us
  %35 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv34
  %36 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %35, %36
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next35 = or i64 %indvars.iv34, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv.next35
  %37 = load double, double* %arrayidx5.us.1, align 8
  %38 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next35
  %39 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %38, %39
  %add.us.1 = fadd double %37, %mul.us.1
  %40 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next35
  %41 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %40, %41
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, 2000
  br i1 %exitcond37.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us.loopexit69:      ; preds = %vector.body
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit69, %for.cond1.for.inc20_crit_edge.us.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 2000
  br i1 %exitcond43, label %for.cond26.preheader.us.new.preheader, label %for.cond1.preheader.us.new

for.cond26.preheader.us.new.preheader:            ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.cond26.preheader.us.new

for.cond26.preheader.us.new:                      ; preds = %for.cond26.preheader.us.new.preheader, %for.cond26.for.inc45_crit_edge.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.new.preheader ]
  %arrayidx30.us = getelementptr inbounds double, double* %x, i64 %indvars.iv30
  %.pre = load double, double* %arrayidx30.us, align 8
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us, %for.cond26.preheader.us.new
  %42 = phi double [ %.pre, %for.cond26.preheader.us.new ], [ %add39.us.1, %for.inc42.us ]
  %indvars.iv24 = phi i64 [ 0, %for.cond26.preheader.us.new ], [ %indvars.iv.next25.1, %for.inc42.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv30
  %43 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %43, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv24
  %44 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %44
  %add39.us = fadd double %42, %mul38.us
  store double %add39.us, double* %arrayidx30.us, align 8
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv30
  %45 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %45, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next25
  %46 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %46
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %arrayidx30.us, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, 2000
  br i1 %exitcond27.1, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.inc42.us
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond33, label %vector.memcheck47, label %for.cond26.preheader.us.new

vector.memcheck47:                                ; preds = %for.cond26.for.inc45_crit_edge.us
  %scevgep38 = getelementptr double, double* %x, i64 2000
  %scevgep41 = getelementptr double, double* %z, i64 2000
  %bound043 = icmp ugt double* %scevgep41, %x
  %bound144 = icmp ugt double* %scevgep38, %z
  %memcheck.conflict46 = and i1 %bound043, %bound144
  br i1 %memcheck.conflict46, label %for.inc58.preheader, label %vector.body32.preheader

vector.body32.preheader:                          ; preds = %vector.memcheck47
  br label %vector.body32

for.inc58.preheader:                              ; preds = %vector.memcheck47
  br label %for.inc58

vector.body32:                                    ; preds = %vector.body32.preheader, %vector.body32
  %index49 = phi i64 [ %index.next50, %vector.body32 ], [ 0, %vector.body32.preheader ]
  %offset.idx53 = shl i64 %index49, 2
  %47 = getelementptr inbounds double, double* %x, i64 %offset.idx53
  %48 = bitcast double* %47 to <8 x double>*
  %wide.vec57 = load <8 x double>, <8 x double>* %48, align 8, !alias.scope !17, !noalias !20
  %49 = getelementptr inbounds double, double* %z, i64 %offset.idx53
  %50 = bitcast double* %49 to <8 x double>*
  %wide.vec62 = load <8 x double>, <8 x double>* %50, align 8, !alias.scope !20
  %51 = fadd <8 x double> %wide.vec57, %wide.vec62
  %52 = shufflevector <8 x double> %51, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %53 = fadd <8 x double> %wide.vec57, %wide.vec62
  %54 = shufflevector <8 x double> %53, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %55 = fadd <8 x double> %wide.vec57, %wide.vec62
  %56 = shufflevector <8 x double> %55, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %57 = or i64 %offset.idx53, 3
  %58 = getelementptr inbounds double, double* %x, i64 %57
  %59 = fadd <8 x double> %wide.vec57, %wide.vec62
  %60 = shufflevector <8 x double> %59, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = getelementptr double, double* %58, i64 -3
  %62 = bitcast double* %61 to <8 x double>*
  %63 = shufflevector <2 x double> %52, <2 x double> %54, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %64 = shufflevector <2 x double> %56, <2 x double> %60, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec67 = shufflevector <4 x double> %63, <4 x double> %64, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec67, <8 x double>* %62, align 8, !alias.scope !17, !noalias !20
  %index.next50 = add i64 %index49, 2
  %65 = icmp eq i64 %index.next50, 500
  br i1 %65, label %for.cond64.preheader.us.new.preheader.loopexit68, label %vector.body32, !llvm.loop !22

for.cond64.preheader.us.new.preheader.loopexit:   ; preds = %for.inc58
  br label %for.cond64.preheader.us.new.preheader

for.cond64.preheader.us.new.preheader.loopexit68: ; preds = %vector.body32
  br label %for.cond64.preheader.us.new.preheader

for.cond64.preheader.us.new.preheader:            ; preds = %for.cond64.preheader.us.new.preheader.loopexit68, %for.cond64.preheader.us.new.preheader.loopexit
  br label %for.cond64.preheader.us.new

for.cond64.preheader.us.new:                      ; preds = %for.cond64.preheader.us.new.preheader, %for.cond64.for.inc83_crit_edge.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.new.preheader ]
  %arrayidx68.us = getelementptr inbounds double, double* %w, i64 %indvars.iv15
  %.pre1 = load double, double* %arrayidx68.us, align 8
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us, %for.cond64.preheader.us.new
  %66 = phi double [ %.pre1, %for.cond64.preheader.us.new ], [ %add77.us.1, %for.inc80.us ]
  %indvars.iv = phi i64 [ 0, %for.cond64.preheader.us.new ], [ %indvars.iv.next.1, %for.inc80.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %67 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %67, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %68 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %68
  %add77.us = fadd double %66, %mul76.us
  store double %add77.us, double* %arrayidx68.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %69 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %69, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %70 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %70
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %arrayidx68.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.inc80.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.preheader.us.new

for.inc58:                                        ; preds = %for.inc58.preheader, %for.inc58
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.3, %for.inc58 ], [ 0, %for.inc58.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv18
  %71 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv18
  %72 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %71, %72
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19
  %73 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19
  %74 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %73, %74
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next19.1 = or i64 %indvars.iv18, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.1
  %75 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.1
  %76 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %75, %76
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next19.2 = or i64 %indvars.iv18, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.2
  %77 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.2
  %78 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %77, %78
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next19.3, 2000
  br i1 %exitcond21.3, label %for.cond64.preheader.us.new.preheader.loopexit, label %for.inc58, !llvm.loop !23

for.end85:                                        ; preds = %for.cond64.for.inc83_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %w) #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}

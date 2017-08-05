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
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay9 = bitcast i8* %call1 to double*
  %arraydecay10 = bitcast i8* %call2 to double*
  %arraydecay11 = bitcast i8* %call3 to double*
  %arraydecay12 = bitcast i8* %call4 to double*
  %arraydecay13 = bitcast i8* %call5 to double*
  %arraydecay14 = bitcast i8* %call6 to double*
  %arraydecay15 = bitcast i8* %call7 to double*
  %arraydecay16 = bitcast i8* %call8 to double*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call5) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call7) #4
  call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.end_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond35.for.end_crit_edge.us ]
  %0 = trunc i64 %indvars.iv11 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv11
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %1 = trunc i64 %indvars.iv.next12 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv11
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %3 = fdiv <2 x double> %2, <double 2.000000e+03, double undef>
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fdiv <2 x double> %4, <double 2.000000e+00, double 4.000000e+00>
  %div4.v.r1.us = extractelement <2 x double> %div4.us, i32 0
  %div4.v.r2.us = extractelement <2 x double> %div4.us, i32 1
  store double %div4.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv11
  store double %div4.v.r2.us, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv11
  %div16.us = fdiv <2 x double> %4, <double 6.000000e+00, double 8.000000e+00>
  %div16.v.r1.us = extractelement <2 x double> %div16.us, i32 0
  %div16.v.r2.us = extractelement <2 x double> %div16.us, i32 1
  store double %div16.v.r1.us, double* %arrayidx18.us, align 8
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv11
  store double %div16.v.r2.us, double* %arrayidx24.us, align 8
  %div27.us = fdiv double %conv3.us, 2.000000e+03
  %div28.us = fdiv double %div27.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv11
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv11
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body.us, %for.body38.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body38.us ], [ 0, %for.body.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv11
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.v.i0.1 = insertelement <2 x double> undef, double %conv39.us, i32 0
  %div41.us.v.i0.2 = insertelement <2 x double> %div41.us.v.i0.1, double %conv39.us.1, i32 1
  %div41.us = fdiv <2 x double> %div41.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %9 = bitcast double* %arrayidx45.us to <2 x double>*
  store <2 x double> %div41.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.end_crit_edge.us, label %for.body38.us

for.cond35.for.end_crit_edge.us:                  ; preds = %for.body38.us
  %exitcond = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond, label %for.end48, label %for.body.us

for.end48:                                        ; preds = %for.cond35.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) #2 {
entry:
  %scevgep5 = getelementptr double, double* %v1, i64 2000
  %scevgep8 = getelementptr double, double* %v2, i64 2000
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.end_crit_edge.us, %entry
  %indvars.iv59 = phi i64 [ 0, %entry ], [ %0, %for.cond1.for.end_crit_edge.us ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 0
  %0 = add i64 %indvars.iv59, 1
  %scevgep2 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv59
  %arrayidx11.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv59
  %bound0 = icmp ult double* %scevgep, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound011 = icmp ult double* %scevgep, %scevgep5
  %bound112 = icmp ugt double* %scevgep2, %v1
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx = or i1 %found.conflict, %found.conflict13
  %bound016 = icmp ult double* %scevgep, %arrayidx11.us
  %bound117 = icmp ult double* %arrayidx11.us, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound020 = icmp ult double* %scevgep, %scevgep8
  %bound121 = icmp ugt double* %scevgep2, %v2
  %found.conflict22 = and i1 %bound020, %bound121
  %conflict.rdx23 = or i1 %conflict.rdx19, %found.conflict22
  br i1 %conflict.rdx23, label %for.body3.us.preheader, label %vector.ph

for.body3.us.preheader:                           ; preds = %for.body.us
  br label %for.body3.us

vector.ph:                                        ; preds = %for.body.us
  %.pre67 = load double, double* %arrayidx7.us, align 8, !alias.scope !1
  %.pre68 = load double, double* %arrayidx11.us, align 8, !alias.scope !4
  %1 = insertelement <2 x double> undef, double %.pre67, i32 0
  %2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = insertelement <2 x double> undef, double %.pre68, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %offset.idx
  %6 = bitcast double* %5 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %6, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec24 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %7 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec25 = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !11
  %strided.vec26 = shufflevector <4 x double> %wide.vec25, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec27 = shufflevector <4 x double> %wide.vec25, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = fmul <2 x double> %2, %strided.vec26
  %10 = fadd <2 x double> %strided.vec, %9
  %11 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec28 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !12
  %strided.vec29 = shufflevector <4 x double> %wide.vec28, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec30 = shufflevector <4 x double> %wide.vec28, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %13 = fmul <2 x double> %4, %strided.vec29
  %14 = fadd <2 x double> %10, %13
  %15 = or i64 %offset.idx, 1
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %15
  %17 = fmul <2 x double> %2, %strided.vec27
  %18 = fadd <2 x double> %strided.vec24, %17
  %19 = fmul <2 x double> %4, %strided.vec30
  %20 = fadd <2 x double> %18, %19
  %21 = getelementptr double, double* %16, i64 -1
  %22 = bitcast double* %21 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %14, <2 x double> %20, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %22, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %23 = icmp eq i64 %index.next, 1000
  br i1 %23, label %for.cond1.for.end_crit_edge.us.loopexit70, label %vector.body, !llvm.loop !13

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %for.body3.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv55
  %24 = load double, double* %arrayidx5.us, align 8
  %25 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv55
  %26 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %25, %26
  %add.us = fadd double %24, %mul.us
  %27 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv55
  %28 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %27, %28
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv.next56
  %29 = load double, double* %arrayidx5.us.1, align 8
  %30 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next56
  %31 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %30, %31
  %add.us.1 = fadd double %29, %mul.us.1
  %32 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next56
  %33 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %32, %33
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 2000
  br i1 %exitcond58.1, label %for.cond1.for.end_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !16

for.cond1.for.end_crit_edge.us.loopexit:          ; preds = %for.body3.us
  br label %for.cond1.for.end_crit_edge.us

for.cond1.for.end_crit_edge.us.loopexit70:        ; preds = %vector.body
  br label %for.cond1.for.end_crit_edge.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.cond1.for.end_crit_edge.us.loopexit70, %for.cond1.for.end_crit_edge.us.loopexit
  %exitcond78 = icmp eq i64 %0, 2000
  br i1 %exitcond78, label %for.body25.us.preheader, label %for.body.us

for.body25.us.preheader:                          ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.preheader, %for.cond26.for.end44_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond26.for.end44_crit_edge.us ], [ 0, %for.body25.us.preheader ]
  %arrayidx30.us = getelementptr inbounds double, double* %x, i64 %indvars.iv50
  %.pre = load double, double* %arrayidx30.us, align 8
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body25.us, %for.body28.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.1, %for.body28.us ], [ 0, %for.body25.us ]
  %34 = phi double [ %add39.us.1, %for.body28.us ], [ %.pre, %for.body25.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv50
  %35 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %35, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv46
  %36 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %36
  %add39.us = fadd double %34, %mul38.us
  store double %add39.us, double* %arrayidx30.us, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv50
  %37 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %37, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next47
  %38 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %38
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %arrayidx30.us, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, 2000
  br i1 %exitcond49.1, label %for.cond26.for.end44_crit_edge.us, label %for.body28.us

for.cond26.for.end44_crit_edge.us:                ; preds = %for.body28.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond72, label %vector.memcheck46, label %for.body25.us

vector.memcheck46:                                ; preds = %for.cond26.for.end44_crit_edge.us
  %scevgep37 = getelementptr double, double* %x, i64 2000
  %scevgep40 = getelementptr double, double* %z, i64 2000
  %bound042 = icmp ugt double* %scevgep40, %x
  %bound143 = icmp ugt double* %scevgep37, %z
  %found.conflict44 = and i1 %bound042, %bound143
  br i1 %found.conflict44, label %for.body50.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %vector.memcheck46
  br label %vector.body31

for.body50.preheader:                             ; preds = %vector.memcheck46
  br label %for.body50

vector.body31:                                    ; preds = %vector.body31.preheader, %vector.body31
  %index48 = phi i64 [ %index.next49, %vector.body31 ], [ 0, %vector.body31.preheader ]
  %offset.idx52 = shl i64 %index48, 2
  %39 = getelementptr inbounds double, double* %x, i64 %offset.idx52
  %40 = bitcast double* %39 to <8 x double>*
  %wide.vec56 = load <8 x double>, <8 x double>* %40, align 8, !alias.scope !17, !noalias !20
  %41 = getelementptr inbounds double, double* %z, i64 %offset.idx52
  %42 = bitcast double* %41 to <8 x double>*
  %wide.vec61 = load <8 x double>, <8 x double>* %42, align 8, !alias.scope !20
  %43 = fadd <8 x double> %wide.vec56, %wide.vec61
  %44 = shufflevector <8 x double> %43, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %45 = shufflevector <8 x double> %43, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %46 = shufflevector <8 x double> %43, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %47 = or i64 %offset.idx52, 3
  %48 = getelementptr inbounds double, double* %x, i64 %47
  %49 = shufflevector <8 x double> %43, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %50 = getelementptr double, double* %48, i64 -3
  %51 = bitcast double* %50 to <8 x double>*
  %52 = shufflevector <2 x double> %44, <2 x double> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %53 = shufflevector <2 x double> %46, <2 x double> %49, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec66 = shufflevector <4 x double> %52, <4 x double> %53, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec66, <8 x double>* %51, align 8, !alias.scope !17, !noalias !20
  %index.next49 = add i64 %index48, 2
  %54 = icmp eq i64 %index.next49, 500
  br i1 %54, label %for.body63.us.preheader.loopexit69, label %vector.body31, !llvm.loop !22

for.body50:                                       ; preds = %for.body50.preheader, %for.body50
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.3, %for.body50 ], [ 0, %for.body50.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv42
  %55 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv42
  %56 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %55, %56
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next43 = or i64 %indvars.iv42, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43
  %57 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43
  %58 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %57, %58
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next43.1 = or i64 %indvars.iv42, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.1
  %59 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43.1
  %60 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %59, %60
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next43.2 = or i64 %indvars.iv42, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.2
  %61 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43.2
  %62 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %61, %62
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next43.3 = add nuw nsw i64 %indvars.iv42, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next43.3, 2000
  br i1 %exitcond45.3, label %for.body63.us.preheader.loopexit, label %for.body50, !llvm.loop !23

for.body63.us.preheader.loopexit:                 ; preds = %for.body50
  br label %for.body63.us.preheader

for.body63.us.preheader.loopexit69:               ; preds = %vector.body31
  br label %for.body63.us.preheader

for.body63.us.preheader:                          ; preds = %for.body63.us.preheader.loopexit69, %for.body63.us.preheader.loopexit
  br label %for.body63.us

for.body63.us:                                    ; preds = %for.body63.us.preheader, %for.cond64.for.end82_crit_edge.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.cond64.for.end82_crit_edge.us ], [ 0, %for.body63.us.preheader ]
  %arrayidx68.us = getelementptr inbounds double, double* %w, i64 %indvars.iv37
  %.pre36 = load double, double* %arrayidx68.us, align 8
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body63.us, %for.body66.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body66.us ], [ 0, %for.body63.us ]
  %63 = phi double [ %add77.us.1, %for.body66.us ], [ %.pre36, %for.body63.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %64 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %64, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %65 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %65
  %add77.us = fadd double %63, %mul76.us
  store double %add77.us, double* %arrayidx68.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %66 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %66, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %67 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %67
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %arrayidx68.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.end82_crit_edge.us, label %for.body66.us

for.cond64.for.end82_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond, label %for.end85, label %for.body63.us

for.end85:                                        ; preds = %for.cond64.for.end82_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %w) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond4, label %for.end, label %for.body

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

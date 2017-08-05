; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  %0 = bitcast i8* %call to [2000 x double]*
  %1 = bitcast i8* %call1 to double*
  %2 = bitcast i8* %call2 to double*
  %3 = bitcast i8* %call3 to double*
  %4 = bitcast i8* %call4 to double*
  %5 = bitcast i8* %call5 to double*
  %6 = bitcast i8* %call6 to double*
  %7 = bitcast i8* %call7 to double*
  %8 = bitcast i8* %call8 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %0, double* %1, double* %2, double* %3, double* %4, double* %5, double* %6, double* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %alpha, align 8
  %10 = load double, double* %beta, align 8
  call fastcc void @kernel_gemver(i32 2000, double %9, double %10, [2000 x double]* %0, double* %1, double* %2, double* %3, double* %4, double* %5, double* %6, double* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %11 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %11, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.inc46_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond35.for.inc46_crit_edge.us ]
  %0 = trunc i64 %indvars.iv10 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv10
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %1 = trunc i64 %indvars.iv.next11 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv10
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %3 = fdiv <2 x double> %2, <double 2.000000e+03, double undef>
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fmul <2 x double> %4, <double 5.000000e-01, double 2.500000e-01>
  %div4.us.v.r1 = extractelement <2 x double> %div4.us, i32 0
  %div4.us.v.r2 = extractelement <2 x double> %div4.us, i32 1
  store double %div4.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv10
  store double %div4.us.v.r2, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv10
  %div21.us = fdiv double %conv3.us, 2.000000e+03
  %div22.us = fmul double %div21.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv10
  store double %div22.us, double* %arrayidx24.us, align 8
  %div16.us = fdiv <2 x double> %4, <double 6.000000e+00, double 9.000000e+00>
  %div16.us.v.r1 = extractelement <2 x double> %div16.us, i32 0
  %div16.us.v.r2 = extractelement <2 x double> %div16.us, i32 1
  store double %div16.us.v.r1, double* %arrayidx18.us, align 8
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv10
  store double %div16.us.v.r2, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body.us, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ 0, %for.body.us ]
  %5 = mul nsw i64 %indvars.iv, %indvars.iv10
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nsw i64 %indvars.iv.next, %indvars.iv10
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
  br i1 %exitcond.1, label %for.cond35.for.inc46_crit_edge.us, label %for.inc.us

for.cond35.for.inc46_crit_edge.us:                ; preds = %for.inc.us
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end48, label %for.body.us

for.end48:                                        ; preds = %for.cond35.for.inc46_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32 %n, double %alpha, double %beta, [2000 x double]* %A, double* readonly %u1, double* readonly %v1, double* readonly %u2, double* readonly %v2, double* nocapture %w, double* %x, double* nocapture readonly %y, double* readonly %z) unnamed_addr #2 {
entry:
  %scevgep71 = getelementptr double, double* %v1, i64 2000
  %scevgep74 = getelementptr double, double* %v2, i64 2000
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %entry
  %indvars.iv51 = phi i64 [ 0, %entry ], [ %indvars.iv.next52, %for.cond1.for.inc20_crit_edge.us ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 0
  %0 = add i64 %indvars.iv51, 1
  %scevgep68 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv51
  %arrayidx11.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv51
  %bound0 = icmp ult double* %scevgep, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound077 = icmp ult double* %scevgep, %scevgep71
  %bound178 = icmp ugt double* %scevgep68, %v1
  %found.conflict79 = and i1 %bound077, %bound178
  %conflict.rdx = or i1 %found.conflict, %found.conflict79
  %bound082 = icmp ult double* %scevgep, %arrayidx11.us
  %bound183 = icmp ult double* %arrayidx11.us, %scevgep68
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx85 = or i1 %conflict.rdx, %found.conflict84
  %bound086 = icmp ult double* %scevgep, %scevgep74
  %bound187 = icmp ugt double* %scevgep68, %v2
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx89 = or i1 %conflict.rdx85, %found.conflict88
  br i1 %conflict.rdx89, label %for.inc.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond1.preheader.us
  %1 = load double, double* %arrayidx7.us, align 8, !alias.scope !1
  %2 = insertelement <2 x double> undef, double %1, i32 0
  %3 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %4 = insertelement <2 x double> undef, double %1, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %6 = load double, double* %arrayidx11.us, align 8, !alias.scope !4
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = insertelement <2 x double> undef, double %6, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

for.inc.us.preheader:                             ; preds = %for.cond1.preheader.us
  br label %for.inc.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !6, !noalias !8
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !6, !noalias !8
  %15 = getelementptr inbounds double, double* %v1, i64 %index
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !11
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11
  %19 = fmul <2 x double> %3, %wide.load92
  %20 = fmul <2 x double> %5, %wide.load93
  %21 = fadd <2 x double> %wide.load, %19
  %22 = fadd <2 x double> %wide.load91, %20
  %23 = getelementptr inbounds double, double* %v2, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !12
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !12
  %27 = fmul <2 x double> %8, %wide.load94
  %28 = fmul <2 x double> %10, %wide.load95
  %29 = fadd <2 x double> %21, %27
  %30 = fadd <2 x double> %22, %28
  %31 = bitcast double* %11 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !6, !noalias !8
  %32 = bitcast double* %13 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %33 = icmp eq i64 %index.next, 2000
  br i1 %33, label %for.cond1.for.inc20_crit_edge.us.loopexit126, label %vector.body, !llvm.loop !13

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader
  %indvars.iv49 = phi i64 [ 0, %for.inc.us.preheader ], [ %indvars.iv.next50.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49
  %34 = load double, double* %arrayidx5.us, align 8
  %35 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv49
  %36 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %35, %36
  %add.us = fadd double %34, %mul.us
  %37 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv49
  %38 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %37, %38
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv.next50
  %39 = load double, double* %arrayidx5.us.1, align 8
  %40 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next50
  %41 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %40, %41
  %add.us.1 = fadd double %39, %mul.us.1
  %42 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next50
  %43 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %42, %43
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond65.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us.loopexit126:     ; preds = %vector.body
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit126, %for.cond1.for.inc20_crit_edge.us.loopexit
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond66, label %for.cond26.preheader.us.preheader, label %for.cond1.preheader.us

for.cond26.preheader.us.preheader:                ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.preheader.us.preheader, %for.cond26.for.inc45_crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.preheader ]
  %arrayidx30.us = getelementptr inbounds double, double* %x, i64 %indvars.iv45
  %.pre = load double, double* %arrayidx30.us, align 8
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.cond26.preheader.us, %for.inc42.us
  %44 = phi double [ %add39.us.1, %for.inc42.us ], [ %.pre, %for.cond26.preheader.us ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %for.inc42.us ], [ 0, %for.cond26.preheader.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv45
  %45 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %45, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  %46 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %46
  %add39.us = fadd double %44, %mul38.us
  store double %add39.us, double* %arrayidx30.us, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv45
  %47 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %47, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next42
  %48 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %48
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %arrayidx30.us, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next42.1, 2000
  br i1 %exitcond44.1, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.inc42.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond64, label %vector.memcheck111, label %for.cond26.preheader.us

vector.memcheck111:                               ; preds = %for.cond26.for.inc45_crit_edge.us
  %scevgep102 = getelementptr double, double* %x, i64 2000
  %scevgep105 = getelementptr double, double* %z, i64 2000
  %bound0107 = icmp ugt double* %scevgep105, %x
  %bound1108 = icmp ugt double* %scevgep102, %z
  %memcheck.conflict110 = and i1 %bound0107, %bound1108
  br i1 %memcheck.conflict110, label %for.inc58.preheader, label %vector.body96.preheader

vector.body96.preheader:                          ; preds = %vector.memcheck111
  br label %vector.body96

for.inc58.preheader:                              ; preds = %vector.memcheck111
  br label %for.inc58

vector.body96:                                    ; preds = %vector.body96, %vector.body96.preheader
  %index113 = phi i64 [ 0, %vector.body96.preheader ], [ %index.next114.1, %vector.body96 ]
  %49 = getelementptr inbounds double, double* %x, i64 %index113
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !17, !noalias !20
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !17, !noalias !20
  %53 = getelementptr inbounds double, double* %z, i64 %index113
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !20
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !20
  %57 = fadd <2 x double> %wide.load121, %wide.load123
  %58 = fadd <2 x double> %wide.load122, %wide.load124
  %59 = bitcast double* %49 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !17, !noalias !20
  %60 = bitcast double* %51 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !17, !noalias !20
  %index.next114 = or i64 %index113, 4
  %61 = getelementptr inbounds double, double* %x, i64 %index.next114
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load121.1 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !17, !noalias !20
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load122.1 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !17, !noalias !20
  %65 = getelementptr inbounds double, double* %z, i64 %index.next114
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load123.1 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !20
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load124.1 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !20
  %69 = fadd <2 x double> %wide.load121.1, %wide.load123.1
  %70 = fadd <2 x double> %wide.load122.1, %wide.load124.1
  %71 = bitcast double* %61 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  %72 = bitcast double* %63 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  %index.next114.1 = add nsw i64 %index113, 8
  %73 = icmp eq i64 %index.next114.1, 2000
  br i1 %73, label %for.cond64.preheader.us.preheader.loopexit125, label %vector.body96, !llvm.loop !22

for.cond64.preheader.us.preheader.loopexit:       ; preds = %for.inc58
  br label %for.cond64.preheader.us.preheader

for.cond64.preheader.us.preheader.loopexit125:    ; preds = %vector.body96
  br label %for.cond64.preheader.us.preheader

for.cond64.preheader.us.preheader:                ; preds = %for.cond64.preheader.us.preheader.loopexit125, %for.cond64.preheader.us.preheader.loopexit
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc83_crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.preheader ]
  %arrayidx68.us = getelementptr inbounds double, double* %w, i64 %indvars.iv36
  %.pre62 = load double, double* %arrayidx68.us, align 8
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.cond64.preheader.us, %for.inc80.us
  %74 = phi double [ %add77.us.1, %for.inc80.us ], [ %.pre62, %for.cond64.preheader.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc80.us ], [ 0, %for.cond64.preheader.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  %75 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %75, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %76 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %76
  %add77.us = fadd double %74, %mul76.us
  store double %add77.us, double* %arrayidx68.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next
  %77 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %77, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %78 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %78
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %arrayidx68.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.inc80.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.preheader.us

for.inc58:                                        ; preds = %for.inc58, %for.inc58.preheader
  %indvars.iv38 = phi i64 [ 0, %for.inc58.preheader ], [ %indvars.iv.next39.4, %for.inc58 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv38
  %79 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv38
  %80 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %79, %80
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next39
  %81 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next39
  %82 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %81, %82
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next39.1
  %83 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next39.1
  %84 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %83, %84
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next39.2 = add nsw i64 %indvars.iv38, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next39.2
  %85 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next39.2
  %86 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %85, %86
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next39.3 = add nsw i64 %indvars.iv38, 4
  %arrayidx52.4 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next39.3
  %87 = load double, double* %arrayidx52.4, align 8
  %arrayidx54.4 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next39.3
  %88 = load double, double* %arrayidx54.4, align 8
  %add55.4 = fadd double %87, %88
  store double %add55.4, double* %arrayidx52.4, align 8
  %indvars.iv.next39.4 = add nsw i64 %indvars.iv38, 5
  %exitcond63.4 = icmp eq i64 %indvars.iv.next39.4, 2000
  br i1 %exitcond63.4, label %for.cond64.preheader.us.preheader.loopexit, label %for.inc58, !llvm.loop !23

for.end85:                                        ; preds = %for.cond64.for.inc83_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %w) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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

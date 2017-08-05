; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %conv11 = sitofp i32 %m to double
  %conv4 = sitofp i32 %n to double
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv11, i32 1
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count27 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %cmp213 = icmp sgt i32 %n, 0
  br i1 %cmp213, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry, %for.cond20.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.inc.lr.ph.us.preheader, label %for.inc.lr.ph.preheader

for.inc.lr.ph.preheader:                          ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count70 = zext i32 %n to i64
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count56 = zext i32 %n to i64
  %2 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr110.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.3.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul.us = fmul <2 x double> %5, %mul.us.v.i1.2
  %6 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul.us.2 = fmul <2 x double> %8, %mul.us.2.v.i1.2
  %9 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.3
  %10 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul.us.1 = fmul <2 x double> %11, %mul.us.v.i1.2
  %12 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  store <2 x double> %mul.us.1, <2 x double>* %12, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1.1
  %13 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul.us.2.1 = fmul <2 x double> %14, %mul.us.2.v.i1.2
  %15 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  store <2 x double> %mul.us.2.1, <2 x double>* %15, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv52
  br i1 %exitcond.3.1, label %for.cond9.preheader.us12.preheader.loopexit.unr-lcssa, label %for.inc.us

for.cond9.preheader.us12.preheader.loopexit.unr-lcssa: ; preds = %for.inc.us
  br label %for.cond9.preheader.us12.preheader.loopexit

for.cond9.preheader.us12.preheader.loopexit:      ; preds = %for.inc.us.prol.loopexit103, %for.cond9.preheader.us12.preheader.loopexit.unr-lcssa
  br label %for.cond9.preheader.us12.preheader

for.cond9.preheader.us12.preheader:               ; preds = %for.cond9.preheader.us12.preheader.loopexit, %for.inc.us.prol.loopexit
  %min.iters.check = icmp ult i64 %54, 2
  %n.vec = and i64 %54, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %54, %n.vec
  br label %for.cond9.preheader.us12

for.cond9.preheader.us12:                         ; preds = %for.cond9.preheader.us12.preheader, %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond9.for.inc40_crit_edge.us35 ], [ 0, %for.cond9.preheader.us12.preheader ]
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv47
  %16 = add i64 %indvars.iv47, 1
  %scevgep79 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %16
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv47
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %16
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv47
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv47
  br i1 %min.iters.check, label %for.inc37.us14.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us12
  br i1 %cmp.zero, label %for.inc37.us14.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep75
  %found.conflict = and i1 %bound0, %bound1
  %bound086 = icmp ult double* %scevgep, %scevgep79
  %bound187 = icmp ult double* %scevgep77, %scevgep75
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx = or i1 %found.conflict, %found.conflict88
  %bound089 = icmp ult double* %scevgep, %scevgep83
  %bound190 = icmp ult double* %scevgep81, %scevgep75
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx92 = or i1 %conflict.rdx, %found.conflict91
  %bound095 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound196 = icmp ult double* %arrayidx20.us33, %scevgep75
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx98 = or i1 %conflict.rdx92, %found.conflict97
  br i1 %conflict.rdx98, label %for.inc37.us14.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %17 = load double, double* %arrayidx20.us33, align 8, !alias.scope !1
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = load double, double* %arrayidx30.us34, align 8, !alias.scope !4
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = or i64 %index, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv47
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %23, i64 %indvars.iv47
  %26 = load double, double* %24, align 8, !alias.scope !6
  %27 = load double, double* %25, align 8, !alias.scope !6
  %28 = insertelement <2 x double> undef, double %26, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, %broadcast.splat100
  %31 = fmul <2 x double> %30, %19
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv47
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %23, i64 %indvars.iv47
  %34 = load double, double* %32, align 8, !alias.scope !8
  %35 = load double, double* %33, align 8, !alias.scope !8
  %36 = insertelement <2 x double> undef, double %34, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %37, %broadcast.splat100
  %39 = fmul <2 x double> %38, %22
  %40 = fadd <2 x double> %31, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10, !noalias !12
  %43 = fadd <2 x double> %wide.load, %40
  %44 = bitcast double* %41 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8, !alias.scope !10, !noalias !12
  %index.next = add i64 %index, 2
  %45 = icmp eq i64 %index.next, %n.vec
  br i1 %45, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond9.for.inc40_crit_edge.us35, label %for.inc37.us14.preheader

for.inc37.us14.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us12
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us12 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us14

for.inc37.us14:                                   ; preds = %for.inc37.us14.preheader, %for.inc37.us14
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.inc37.us14 ], [ %indvars.iv42.ph, %for.inc37.us14.preheader ]
  %arrayidx15.us17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %46 = load double, double* %arrayidx15.us17, align 8
  %mul16.us18 = fmul double %46, %alpha
  %47 = load double, double* %arrayidx20.us33, align 8
  %mul21.us19 = fmul double %mul16.us18, %47
  %arrayidx25.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv47
  %48 = load double, double* %arrayidx25.us20, align 8
  %mul26.us21 = fmul double %48, %alpha
  %49 = load double, double* %arrayidx30.us34, align 8
  %mul31.us22 = fmul double %mul26.us21, %49
  %add.us23 = fadd double %mul21.us19, %mul31.us22
  %arrayidx35.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv42
  %50 = load double, double* %arrayidx35.us24, align 8
  %add36.us25 = fadd double %50, %add.us23
  store double %add36.us25, double* %arrayidx35.us24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %indvars.iv52
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us35.loopexit, label %for.inc37.us14, !llvm.loop !16

for.inc.lr.ph.us:                                 ; preds = %for.inc.lr.ph.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.inc.lr.ph.us.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.inc.lr.ph.us.preheader ]
  %51 = add i64 %indvars.iv54, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 0
  %52 = mul i64 %indvars.iv54, 1201
  %53 = add i64 %52, 1
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %53
  %54 = add i64 %indvars.iv54, 1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %55 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter = and i32 %55, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.prol
  %56 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %56, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !17

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %57 = icmp ult i64 %indvars.iv54, 3
  br i1 %57, label %for.cond9.preheader.us12.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %58 = sub i64 %51, %indvars.iv.unr
  %59 = lshr i64 %58, 2
  %60 = and i64 %59, 1
  %lcmp.mod105 = icmp eq i64 %60, 0
  br i1 %lcmp.mod105, label %for.inc.us.prol.preheader102, label %for.inc.us.prol.loopexit103.unr-lcssa

for.inc.us.prol.preheader102:                     ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol106

for.inc.us.prol106:                               ; preds = %for.inc.us.prol.preheader102
  %arrayidx5.us.prol108 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.unr
  %61 = bitcast double* %arrayidx5.us.prol108 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %mul.us.prol109 = fmul <2 x double> %62, %mul.us.v.i1.2
  %63 = bitcast double* %arrayidx5.us.prol108 to <2 x double>*
  store <2 x double> %mul.us.prol109, <2 x double>* %63, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1.prol
  %64 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %65 = load <2 x double>, <2 x double>* %64, align 8
  %mul.us.2.prol = fmul <2 x double> %65, %mul.us.2.v.i1.2
  %66 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  store <2 x double> %mul.us.2.prol, <2 x double>* %66, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.inc.us.prol.loopexit103.unr-lcssa

for.inc.us.prol.loopexit103.unr-lcssa:            ; preds = %for.inc.us.preheader, %for.inc.us.prol106
  %indvars.iv.unr110.ph = phi i64 [ %indvars.iv.next.3.prol, %for.inc.us.prol106 ], [ %indvars.iv.unr, %for.inc.us.preheader ]
  br label %for.inc.us.prol.loopexit103

for.inc.us.prol.loopexit103:                      ; preds = %for.inc.us.prol.loopexit103.unr-lcssa
  %67 = icmp eq i64 %59, 0
  br i1 %67, label %for.cond9.preheader.us12.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit103
  br label %for.inc.us

for.cond9.for.inc40_crit_edge.us35.loopexit:      ; preds = %for.inc37.us14
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.for.inc40_crit_edge.us35:               ; preds = %for.cond9.for.inc40_crit_edge.us35.loopexit, %middle.block
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us12

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %for.end45.loopexit, label %for.inc.lr.ph.us

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.preheader, %for.inc43
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc43 ], [ 0, %for.inc.lr.ph.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc43 ], [ 1, %for.inc.lr.ph.preheader ]
  %68 = add i64 %indvars.iv68, -3
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %69 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter63 = and i32 %69, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter65 = phi i32 [ %prol.iter65.sub, %for.inc.prol ], [ %xtraiter63, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58.prol
  %70 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %70, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter65.sub = add i32 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i32 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !19

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv58.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next59.prol, %for.inc.prol.loopexit.loopexit ]
  %71 = icmp ult i64 %indvars.iv68, 3
  br i1 %71, label %for.inc43, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %72 = sub i64 %68, %indvars.iv58.unr
  %73 = lshr i64 %72, 2
  %74 = and i64 %73, 1
  %lcmp.mod114 = icmp eq i64 %74, 0
  br i1 %lcmp.mod114, label %for.inc.prol.preheader111, label %for.inc.prol.loopexit112.unr-lcssa

for.inc.prol.preheader111:                        ; preds = %for.inc.preheader
  br label %for.inc.prol115

for.inc.prol115:                                  ; preds = %for.inc.prol.preheader111
  %arrayidx5.prol117 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58.unr
  %75 = bitcast double* %arrayidx5.prol117 to <2 x double>*
  %76 = load <2 x double>, <2 x double>* %75, align 8
  %mul.prol118 = fmul <2 x double> %76, %mul.v.i1.2
  %77 = bitcast double* %arrayidx5.prol117 to <2 x double>*
  store <2 x double> %mul.prol118, <2 x double>* %77, align 8
  %indvars.iv.next59.1.prol = add nsw i64 %indvars.iv58.unr, 2
  %arrayidx5.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.1.prol
  %78 = bitcast double* %arrayidx5.2.prol to <2 x double>*
  %79 = load <2 x double>, <2 x double>* %78, align 8
  %mul.2.prol = fmul <2 x double> %79, %mul.2.v.i1.2
  %80 = bitcast double* %arrayidx5.2.prol to <2 x double>*
  store <2 x double> %mul.2.prol, <2 x double>* %80, align 8
  %indvars.iv.next59.3.prol = add nsw i64 %indvars.iv58.unr, 4
  br label %for.inc.prol.loopexit112.unr-lcssa

for.inc.prol.loopexit112.unr-lcssa:               ; preds = %for.inc.preheader, %for.inc.prol115
  %indvars.iv58.unr119.ph = phi i64 [ %indvars.iv.next59.3.prol, %for.inc.prol115 ], [ %indvars.iv58.unr, %for.inc.preheader ]
  br label %for.inc.prol.loopexit112

for.inc.prol.loopexit112:                         ; preds = %for.inc.prol.loopexit112.unr-lcssa
  %81 = icmp eq i64 %73, 0
  br i1 %81, label %for.inc43.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit112
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr119.ph, %for.inc.preheader.new ], [ %indvars.iv.next59.3.1, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58
  %82 = bitcast double* %arrayidx5 to <2 x double>*
  %83 = load <2 x double>, <2 x double>* %82, align 8
  %mul = fmul <2 x double> %83, %mul.v.i1.2
  %84 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> %mul, <2 x double>* %84, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.1
  %85 = bitcast double* %arrayidx5.2 to <2 x double>*
  %86 = load <2 x double>, <2 x double>* %85, align 8
  %mul.2 = fmul <2 x double> %86, %mul.2.v.i1.2
  %87 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> %mul.2, <2 x double>* %87, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.3
  %88 = bitcast double* %arrayidx5.1 to <2 x double>*
  %89 = load <2 x double>, <2 x double>* %88, align 8
  %mul.1 = fmul <2 x double> %89, %mul.v.i1.2
  %90 = bitcast double* %arrayidx5.1 to <2 x double>*
  store <2 x double> %mul.1, <2 x double>* %90, align 8
  %indvars.iv.next59.1.1 = add nsw i64 %indvars.iv58, 6
  %arrayidx5.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.1.1
  %91 = bitcast double* %arrayidx5.2.1 to <2 x double>*
  %92 = load <2 x double>, <2 x double>* %91, align 8
  %mul.2.1 = fmul <2 x double> %92, %mul.2.v.i1.2
  %93 = bitcast double* %arrayidx5.2.1 to <2 x double>*
  store <2 x double> %mul.2.1, <2 x double>* %93, align 8
  %indvars.iv.next59.3.1 = add nsw i64 %indvars.iv58, 8
  %exitcond62.3.1 = icmp eq i64 %indvars.iv.next59.3.1, %indvars.iv66
  br i1 %exitcond62.3.1, label %for.inc43.loopexit.unr-lcssa, label %for.inc

for.inc43.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc43.loopexit

for.inc43.loopexit:                               ; preds = %for.inc.prol.loopexit112, %for.inc43.loopexit.unr-lcssa
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %for.inc.prol.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end45.loopexit101, label %for.inc.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit101:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit101, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
!8 = !{!9}
!9 = distinct !{!9, !3}
!10 = !{!11}
!11 = distinct !{!11, !3}
!12 = !{!5, !7, !9, !2}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}

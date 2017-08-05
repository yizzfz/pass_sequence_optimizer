; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
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
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp34 = icmp sgt i32 %n, 0
  br i1 %cmp34, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp232 = icmp sgt i32 %m, 0
  br i1 %cmp232, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %conv11 = sitofp i32 %m to double
  %conv4 = sitofp i32 %n to double
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv11, i32 1
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count53 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next45, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv44, %indvars.iv51
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv44
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
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv44
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next45, %wide.trip.count49
  br i1 %exitcond50, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %cmp2129 = icmp sgt i32 %n, 0
  br i1 %cmp2129, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count42 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv40
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv40, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry, %for.cond20.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %cmp30 = icmp sgt i32 %n, 0
  br i1 %cmp30, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp728 = icmp sgt i32 %m, 0
  br i1 %cmp728, label %for.inc.lr.ph.us.preheader, label %for.inc.lr.ph.preheader

for.inc.lr.ph.preheader:                          ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count90 = zext i32 %n to i64
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count72 = zext i32 %m to i64
  %wide.trip.count79 = zext i32 %n to i64
  %2 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert122 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat123 = shufflevector <2 x double> %broadcast.splatinsert122, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr134.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.3.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul.us = fmul <2 x double> %5, %mul.us.v.i1.2
  %6 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul.us.2 = fmul <2 x double> %8, %mul.us.2.v.i1.2
  %9 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %10 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul.us.1 = fmul <2 x double> %11, %mul.us.v.i1.2
  %12 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  store <2 x double> %mul.us.1, <2 x double>* %12, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.next.1.1
  %13 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul.us.2.1 = fmul <2 x double> %14, %mul.us.2.v.i1.2
  %15 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  store <2 x double> %mul.us.2.1, <2 x double>* %15, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %indvars.iv75
  br i1 %exitcond.3.1, label %for.cond9.preheader.us34.preheader.loopexit.unr-lcssa, label %for.inc.us

for.cond9.preheader.us34.preheader.loopexit.unr-lcssa: ; preds = %for.inc.us
  br label %for.cond9.preheader.us34.preheader.loopexit

for.cond9.preheader.us34.preheader.loopexit:      ; preds = %for.inc.us.prol.loopexit127, %for.cond9.preheader.us34.preheader.loopexit.unr-lcssa
  br label %for.cond9.preheader.us34.preheader

for.cond9.preheader.us34.preheader:               ; preds = %for.cond9.preheader.us34.preheader.loopexit, %for.inc.us.prol.loopexit
  %min.iters.check = icmp ult i64 %55, 2
  %n.vec = and i64 %55, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %55, %n.vec
  br label %for.cond9.preheader.us34

for.cond9.preheader.us34:                         ; preds = %for.cond9.preheader.us34.preheader, %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.cond9.for.inc40_crit_edge.us57 ], [ 0, %for.cond9.preheader.us34.preheader ]
  %scevgep100 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv70
  %16 = add nuw nsw i64 %indvars.iv70, 1
  %scevgep102 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv77, i64 %16
  %scevgep104 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv70
  %scevgep106 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv77, i64 %16
  %arrayidx20.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv77, i64 %indvars.iv70
  %arrayidx30.us56 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv77, i64 %indvars.iv70
  br i1 %min.iters.check, label %for.inc37.us36.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us34
  br i1 %cmp.zero, label %for.inc37.us36.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us56
  %bound1 = icmp ult double* %arrayidx30.us56, %scevgep98
  %found.conflict = and i1 %bound0, %bound1
  %bound0109 = icmp ult double* %scevgep, %scevgep102
  %bound1110 = icmp ult double* %scevgep100, %scevgep98
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx = or i1 %found.conflict, %found.conflict111
  %bound0112 = icmp ult double* %scevgep, %scevgep106
  %bound1113 = icmp ult double* %scevgep104, %scevgep98
  %found.conflict114 = and i1 %bound0112, %bound1113
  %conflict.rdx115 = or i1 %conflict.rdx, %found.conflict114
  %bound0118 = icmp ult double* %scevgep, %arrayidx20.us55
  %bound1119 = icmp ult double* %arrayidx20.us55, %scevgep98
  %found.conflict120 = and i1 %bound0118, %bound1119
  %conflict.rdx121 = or i1 %conflict.rdx115, %found.conflict120
  br i1 %conflict.rdx121, label %for.inc37.us36.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %17 = load double, double* %arrayidx20.us55, align 8, !alias.scope !1
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = load double, double* %arrayidx30.us56, align 8, !alias.scope !4
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %23 = or i64 %index, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv70
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %23, i64 %indvars.iv70
  %26 = load double, double* %24, align 8, !alias.scope !6
  %27 = load double, double* %25, align 8, !alias.scope !6
  %28 = insertelement <2 x double> undef, double %26, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, %broadcast.splat123
  %31 = fmul <2 x double> %30, %19
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv70
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %23, i64 %indvars.iv70
  %34 = load double, double* %32, align 8, !alias.scope !8
  %35 = load double, double* %33, align 8, !alias.scope !8
  %36 = insertelement <2 x double> undef, double %34, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %37, %broadcast.splat123
  %39 = fmul <2 x double> %38, %22
  %40 = fadd <2 x double> %31, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10, !noalias !12
  %43 = fadd <2 x double> %wide.load, %40
  %44 = bitcast double* %41 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8, !alias.scope !10, !noalias !12
  %index.next = add i64 %index, 2
  %45 = icmp eq i64 %index.next, %n.vec
  br i1 %45, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond9.for.inc40_crit_edge.us57, label %for.inc37.us36.preheader

for.inc37.us36.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us34
  %indvars.iv64.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us34 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us36

for.inc37.us36:                                   ; preds = %for.inc37.us36.preheader, %for.inc37.us36
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc37.us36 ], [ %indvars.iv64.ph, %for.inc37.us36.preheader ]
  %arrayidx15.us39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv70
  %46 = load double, double* %arrayidx15.us39, align 8
  %mul16.us40 = fmul double %46, %alpha
  %47 = load double, double* %arrayidx20.us55, align 8
  %mul21.us41 = fmul double %mul16.us40, %47
  %arrayidx25.us42 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv70
  %48 = load double, double* %arrayidx25.us42, align 8
  %mul26.us43 = fmul double %48, %alpha
  %49 = load double, double* %arrayidx30.us56, align 8
  %mul31.us44 = fmul double %mul26.us43, %49
  %add.us45 = fadd double %mul21.us41, %mul31.us44
  %arrayidx35.us46 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv64
  %50 = load double, double* %arrayidx35.us46, align 8
  %add36.us47 = fadd double %50, %add.us45
  store double %add36.us47, double* %arrayidx35.us46, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next65, %indvars.iv75
  br i1 %exitcond69, label %for.cond9.for.inc40_crit_edge.us57.loopexit, label %for.inc37.us36, !llvm.loop !16

for.inc.lr.ph.us:                                 ; preds = %for.inc.lr.ph.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv125 = phi i2 [ 1, %for.inc.lr.ph.us.preheader ], [ %indvars.iv.next, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv77 = phi i64 [ 0, %for.inc.lr.ph.us.preheader ], [ %indvars.iv.next78, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv75 = phi i64 [ 1, %for.inc.lr.ph.us.preheader ], [ %indvars.iv.next76, %for.cond6.for.inc43_crit_edge.us ]
  %51 = add nsw i64 %indvars.iv77, -3
  %52 = zext i2 %indvars.iv125 to i64
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 0
  %53 = mul i64 %indvars.iv77, 1201
  %54 = add i64 %53, 1
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %54
  %55 = add nuw nsw i64 %indvars.iv77, 1
  %56 = add nuw nsw i64 %indvars.iv77, 1
  %xtraiter = and i64 %56, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.prol
  %57 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %57, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !17

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %52, %for.inc.us.prol.loopexit.loopexit ]
  %58 = icmp ult i64 %indvars.iv77, 3
  br i1 %58, label %for.cond9.preheader.us34.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %59 = sub i64 %51, %indvars.iv.unr
  %60 = lshr i64 %59, 2
  %61 = and i64 %60, 1
  %lcmp.mod129 = icmp eq i64 %61, 0
  br i1 %lcmp.mod129, label %for.inc.us.prol.preheader126, label %for.inc.us.prol.loopexit127.unr-lcssa

for.inc.us.prol.preheader126:                     ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol130

for.inc.us.prol130:                               ; preds = %for.inc.us.prol.preheader126
  %arrayidx5.us.prol132 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.unr
  %62 = bitcast double* %arrayidx5.us.prol132 to <2 x double>*
  %63 = load <2 x double>, <2 x double>* %62, align 8
  %mul.us.prol133 = fmul <2 x double> %63, %mul.us.v.i1.2
  %64 = bitcast double* %arrayidx5.us.prol132 to <2 x double>*
  store <2 x double> %mul.us.prol133, <2 x double>* %64, align 8
  %indvars.iv.next.1.prol = add nuw nsw i64 %indvars.iv.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv77, i64 %indvars.iv.next.1.prol
  %65 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %66 = load <2 x double>, <2 x double>* %65, align 8
  %mul.us.2.prol = fmul <2 x double> %66, %mul.us.2.v.i1.2
  %67 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  store <2 x double> %mul.us.2.prol, <2 x double>* %67, align 8
  %indvars.iv.next.3.prol = or i64 %indvars.iv.unr, 4
  br label %for.inc.us.prol.loopexit127.unr-lcssa

for.inc.us.prol.loopexit127.unr-lcssa:            ; preds = %for.inc.us.preheader, %for.inc.us.prol130
  %indvars.iv.unr134.ph = phi i64 [ %indvars.iv.next.3.prol, %for.inc.us.prol130 ], [ %indvars.iv.unr, %for.inc.us.preheader ]
  br label %for.inc.us.prol.loopexit127

for.inc.us.prol.loopexit127:                      ; preds = %for.inc.us.prol.loopexit127.unr-lcssa
  %68 = icmp eq i64 %60, 0
  br i1 %68, label %for.cond9.preheader.us34.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit127
  br label %for.inc.us

for.cond9.for.inc40_crit_edge.us57.loopexit:      ; preds = %for.inc37.us36
  br label %for.cond9.for.inc40_crit_edge.us57

for.cond9.for.inc40_crit_edge.us57:               ; preds = %for.cond9.for.inc40_crit_edge.us57.loopexit, %middle.block
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us34

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  %indvars.iv.next = add i2 %indvars.iv125, 1
  br i1 %exitcond80, label %for.end45.loopexit, label %for.inc.lr.ph.us

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.preheader, %for.inc43
  %indvars.iv135 = phi i2 [ 1, %for.inc.lr.ph.preheader ], [ %indvars.iv.next136, %for.inc43 ]
  %indvars.iv88 = phi i64 [ 0, %for.inc.lr.ph.preheader ], [ %indvars.iv.next89, %for.inc43 ]
  %indvars.iv86 = phi i64 [ 1, %for.inc.lr.ph.preheader ], [ %indvars.iv.next87, %for.inc43 ]
  %69 = add nsw i64 %indvars.iv88, -3
  %70 = zext i2 %indvars.iv135 to i64
  %71 = add nuw nsw i64 %indvars.iv88, 1
  %xtraiter92 = and i64 %71, 3
  %lcmp.mod93 = icmp eq i64 %xtraiter92, 0
  br i1 %lcmp.mod93, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv81.prol = phi i64 [ %indvars.iv.next82.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter94 = phi i64 [ %prol.iter94.sub, %for.inc.prol ], [ %xtraiter92, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv81.prol
  %72 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %72, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next82.prol = add nuw nsw i64 %indvars.iv81.prol, 1
  %prol.iter94.sub = add nsw i64 %prol.iter94, -1
  %prol.iter94.cmp = icmp eq i64 %prol.iter94.sub, 0
  br i1 %prol.iter94.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !19

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv81.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %70, %for.inc.prol.loopexit.loopexit ]
  %73 = icmp ult i64 %indvars.iv88, 3
  br i1 %73, label %for.inc43, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %74 = sub i64 %69, %indvars.iv81.unr
  %75 = lshr i64 %74, 2
  %76 = and i64 %75, 1
  %lcmp.mod140 = icmp eq i64 %76, 0
  br i1 %lcmp.mod140, label %for.inc.prol.preheader137, label %for.inc.prol.loopexit138.unr-lcssa

for.inc.prol.preheader137:                        ; preds = %for.inc.preheader
  br label %for.inc.prol141

for.inc.prol141:                                  ; preds = %for.inc.prol.preheader137
  %arrayidx5.prol143 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv81.unr
  %77 = bitcast double* %arrayidx5.prol143 to <2 x double>*
  %78 = load <2 x double>, <2 x double>* %77, align 8
  %mul.prol144 = fmul <2 x double> %78, %mul.v.i1.2
  %79 = bitcast double* %arrayidx5.prol143 to <2 x double>*
  store <2 x double> %mul.prol144, <2 x double>* %79, align 8
  %indvars.iv.next82.1.prol = add nuw nsw i64 %indvars.iv81.unr, 2
  %arrayidx5.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv.next82.1.prol
  %80 = bitcast double* %arrayidx5.2.prol to <2 x double>*
  %81 = load <2 x double>, <2 x double>* %80, align 8
  %mul.2.prol = fmul <2 x double> %81, %mul.2.v.i1.2
  %82 = bitcast double* %arrayidx5.2.prol to <2 x double>*
  store <2 x double> %mul.2.prol, <2 x double>* %82, align 8
  %indvars.iv.next82.3.prol = or i64 %indvars.iv81.unr, 4
  br label %for.inc.prol.loopexit138.unr-lcssa

for.inc.prol.loopexit138.unr-lcssa:               ; preds = %for.inc.preheader, %for.inc.prol141
  %indvars.iv81.unr145.ph = phi i64 [ %indvars.iv.next82.3.prol, %for.inc.prol141 ], [ %indvars.iv81.unr, %for.inc.preheader ]
  br label %for.inc.prol.loopexit138

for.inc.prol.loopexit138:                         ; preds = %for.inc.prol.loopexit138.unr-lcssa
  %83 = icmp eq i64 %75, 0
  br i1 %83, label %for.inc43.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit138
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv81 = phi i64 [ %indvars.iv81.unr145.ph, %for.inc.preheader.new ], [ %indvars.iv.next82.3.1, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv81
  %84 = bitcast double* %arrayidx5 to <2 x double>*
  %85 = load <2 x double>, <2 x double>* %84, align 8
  %mul = fmul <2 x double> %85, %mul.v.i1.2
  %86 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> %mul, <2 x double>* %86, align 8
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv.next82.1
  %87 = bitcast double* %arrayidx5.2 to <2 x double>*
  %88 = load <2 x double>, <2 x double>* %87, align 8
  %mul.2 = fmul <2 x double> %88, %mul.2.v.i1.2
  %89 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> %mul.2, <2 x double>* %89, align 8
  %indvars.iv.next82.3 = add nuw nsw i64 %indvars.iv81, 4
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv.next82.3
  %90 = bitcast double* %arrayidx5.1 to <2 x double>*
  %91 = load <2 x double>, <2 x double>* %90, align 8
  %mul.1 = fmul <2 x double> %91, %mul.v.i1.2
  %92 = bitcast double* %arrayidx5.1 to <2 x double>*
  store <2 x double> %mul.1, <2 x double>* %92, align 8
  %indvars.iv.next82.1.1 = add nsw i64 %indvars.iv81, 6
  %arrayidx5.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv88, i64 %indvars.iv.next82.1.1
  %93 = bitcast double* %arrayidx5.2.1 to <2 x double>*
  %94 = load <2 x double>, <2 x double>* %93, align 8
  %mul.2.1 = fmul <2 x double> %94, %mul.2.v.i1.2
  %95 = bitcast double* %arrayidx5.2.1 to <2 x double>*
  store <2 x double> %mul.2.1, <2 x double>* %95, align 8
  %indvars.iv.next82.3.1 = add nsw i64 %indvars.iv81, 8
  %exitcond85.3.1 = icmp eq i64 %indvars.iv.next82.3.1, %indvars.iv86
  br i1 %exitcond85.3.1, label %for.inc43.loopexit.unr-lcssa, label %for.inc

for.inc43.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc43.loopexit

for.inc43.loopexit:                               ; preds = %for.inc.prol.loopexit138, %for.inc43.loopexit.unr-lcssa
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %for.inc.prol.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  %indvars.iv.next136 = add i2 %indvars.iv135, 1
  br i1 %exitcond91, label %for.end45.loopexit124, label %for.inc.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit124:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit124, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count17 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv14, %3
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, %wide.trip.count17
  br i1 %exitcond18, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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

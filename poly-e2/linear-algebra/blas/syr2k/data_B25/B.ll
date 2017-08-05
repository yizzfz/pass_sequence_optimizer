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
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  %3 = bitcast i8* %call to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %entry
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge, label %for.cond1.preheader.us

for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge: ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge ], [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %broadcast.splatinsert122 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat123 = shufflevector <2 x double> %broadcast.splatinsert122, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert147 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat148 = shufflevector <2 x double> %broadcast.splatinsert147, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader1
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.inc.us.preheader1 ], [ %indvars.iv.next.3, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv52
  br i1 %exitcond.3, label %for.cond9.preheader.us12.preheader.loopexit, label %for.inc.us, !llvm.loop !1

for.cond9.preheader.us12.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us12.preheader

for.cond9.preheader.us12.preheader:               ; preds = %for.cond9.preheader.us12.preheader.loopexit, %middle.block125, %for.inc.us.prol.loopexit
  %n.vec86 = and i64 %45, -2
  br label %for.cond9.preheader.us12

for.cond9.preheader.us12:                         ; preds = %for.cond9.for.inc40_crit_edge.us35, %for.cond9.preheader.us12.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond9.preheader.us12.preheader ], [ %indvars.iv.next48, %for.cond9.for.inc40_crit_edge.us35 ]
  %4 = icmp ult i64 %45, 2
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv47
  %5 = add i64 %indvars.iv47, 1
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %5
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv47
  %scevgep98 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %5
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv47
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv47
  br i1 %4, label %for.inc37.us14.preheader, label %min.iters.checked84

min.iters.checked84:                              ; preds = %for.cond9.preheader.us12
  %6 = icmp eq i64 %n.vec86, 0
  br i1 %6, label %for.inc37.us14.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked84
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound0101 = icmp ult double* %scevgep, %scevgep94
  %bound1102 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict103 = and i1 %bound0101, %bound1102
  %conflict.rdx = or i1 %found.conflict, %found.conflict103
  %bound0104 = icmp ult double* %scevgep, %scevgep98
  %bound1105 = icmp ult double* %scevgep96, %scevgep90
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx107 = or i1 %conflict.rdx, %found.conflict106
  %bound0110 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound1111 = icmp ult double* %arrayidx20.us33, %scevgep90
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx113 = or i1 %conflict.rdx107, %found.conflict112
  br i1 %conflict.rdx113, label %for.inc37.us14.preheader, label %vector.ph114

vector.ph114:                                     ; preds = %vector.memcheck
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80, %vector.ph114
  %index115 = phi i64 [ 0, %vector.ph114 ], [ %index.next116, %vector.body80 ]
  %7 = or i64 %index115, 1
  %8 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index115, i64 %indvars.iv47
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %7, i64 %indvars.iv47
  %10 = load double, double* %8, align 8, !alias.scope !5
  %11 = load double, double* %9, align 8, !alias.scope !5
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fmul <2 x double> %13, %broadcast.splat123
  %15 = load double, double* %arrayidx20.us33, align 8, !alias.scope !8
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %14, %17
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index115, i64 %indvars.iv47
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %7, i64 %indvars.iv47
  %21 = load double, double* %19, align 8, !alias.scope !10
  %22 = load double, double* %20, align 8, !alias.scope !10
  %23 = insertelement <2 x double> undef, double %21, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fmul <2 x double> %24, %broadcast.splat123
  %26 = load double, double* %arrayidx30.us34, align 8, !alias.scope !12
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = fmul <2 x double> %25, %28
  %30 = fadd <2 x double> %18, %29
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %index115
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !14, !noalias !16
  %33 = fadd <2 x double> %wide.load, %30
  %34 = bitcast double* %31 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8, !alias.scope !14, !noalias !16
  %index.next116 = add i64 %index115, 2
  %35 = icmp eq i64 %index.next116, %n.vec86
  br i1 %35, label %middle.block81, label %vector.body80, !llvm.loop !17

middle.block81:                                   ; preds = %vector.body80
  %36 = icmp eq i64 %45, %n.vec86
  br i1 %36, label %for.cond9.for.inc40_crit_edge.us35, label %for.inc37.us14.preheader

for.inc37.us14.preheader:                         ; preds = %middle.block81, %vector.memcheck, %min.iters.checked84, %for.cond9.preheader.us12
  %indvars.iv42.ph = phi i64 [ 0, %for.cond9.preheader.us12 ], [ 0, %min.iters.checked84 ], [ 0, %vector.memcheck ], [ %n.vec86, %middle.block81 ]
  br label %for.inc37.us14

for.inc37.us14:                                   ; preds = %for.inc37.us14, %for.inc37.us14.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv42.ph, %for.inc37.us14.preheader ], [ %indvars.iv.next43, %for.inc37.us14 ]
  %arrayidx15.us17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %37 = load double, double* %arrayidx15.us17, align 8
  %mul16.us18 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx20.us33, align 8
  %mul21.us19 = fmul double %mul16.us18, %38
  %arrayidx25.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv47
  %39 = load double, double* %arrayidx25.us20, align 8
  %mul26.us21 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx30.us34, align 8
  %mul31.us22 = fmul double %mul26.us21, %40
  %add.us23 = fadd double %mul21.us19, %mul31.us22
  %arrayidx35.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv42
  %41 = load double, double* %arrayidx35.us24, align 8
  %add36.us25 = fadd double %41, %add.us23
  store double %add36.us25, double* %arrayidx35.us24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %indvars.iv52
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us35.loopexit, label %for.inc37.us14, !llvm.loop !18

for.inc.lr.ph.us:                                 ; preds = %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge, %entry
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge ], [ 0, %entry ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge ], [ 1, %entry ]
  %42 = add i64 %indvars.iv54, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 0
  %43 = mul i64 %indvars.iv54, 1201
  %44 = add i64 %43, 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %44
  %45 = add i64 %indvars.iv54, 1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %46 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter = and i32 %46, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.lr.ph.us.for.inc.us.prol_crit_edge

for.inc.lr.ph.us.for.inc.us.prol_crit_edge:       ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ 0, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge ], [ %indvars.iv.next.prol, %for.inc.us.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge ], [ %prol.iter.sub, %for.inc.us.prol ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.prol
  %47 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %47, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !19

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %indvars.iv54, 3
  br i1 %48, label %for.cond9.preheader.us12.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %49 = sub i64 %42, %indvars.iv.unr
  %50 = lshr i64 %49, 2
  %51 = add nuw nsw i64 %50, 1
  %min.iters.check127 = icmp ult i64 %51, 2
  br i1 %min.iters.check127, label %for.inc.us.preheader1, label %min.iters.checked128

min.iters.checked128:                             ; preds = %for.inc.us.preheader
  %n.mod.vf129 = and i64 %51, 1
  %n.vec130 = sub nsw i64 %51, %n.mod.vf129
  %cmp.zero131 = icmp eq i64 %n.vec130, 0
  %52 = add i64 %indvars.iv.unr, 4
  %53 = shl nuw i64 %50, 2
  %54 = add i64 %52, %53
  %55 = shl nuw nsw i64 %n.mod.vf129, 2
  %ind.end136 = sub i64 %54, %55
  br i1 %cmp.zero131, label %for.inc.us.preheader1, label %vector.ph132

vector.ph132:                                     ; preds = %min.iters.checked128
  br label %vector.body124

vector.body124:                                   ; preds = %vector.body124, %vector.ph132
  %index133 = phi i64 [ 0, %vector.ph132 ], [ %index.next134, %vector.body124 ]
  %56 = shl i64 %index133, 2
  %57 = add i64 %indvars.iv.unr, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %57
  %59 = bitcast double* %58 to <8 x double>*
  %wide.vec142 = load <8 x double>, <8 x double>* %59, align 8
  %strided.vec143 = shufflevector <8 x double> %wide.vec142, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec144 = shufflevector <8 x double> %wide.vec142, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec145 = shufflevector <8 x double> %wide.vec142, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec146 = shufflevector <8 x double> %wide.vec142, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %60 = fmul <2 x double> %strided.vec143, %broadcast.splat148
  %61 = fmul <2 x double> %strided.vec144, %broadcast.splat148
  %62 = fmul <2 x double> %strided.vec145, %broadcast.splat148
  %63 = add nsw i64 %57, 3
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %63
  %65 = fmul <2 x double> %strided.vec146, %broadcast.splat148
  %66 = getelementptr double, double* %64, i64 -3
  %67 = bitcast double* %66 to <8 x double>*
  %68 = shufflevector <2 x double> %60, <2 x double> %61, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %69 = shufflevector <2 x double> %62, <2 x double> %65, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec149 = shufflevector <4 x double> %68, <4 x double> %69, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec149, <8 x double>* %67, align 8
  %index.next134 = add i64 %index133, 2
  %70 = icmp eq i64 %index.next134, %n.vec130
  br i1 %70, label %middle.block125, label %vector.body124, !llvm.loop !21

middle.block125:                                  ; preds = %vector.body124
  %cmp.n137 = icmp eq i64 %n.mod.vf129, 0
  br i1 %cmp.n137, label %for.cond9.preheader.us12.preheader, label %for.inc.us.preheader1

for.inc.us.preheader1:                            ; preds = %middle.block125, %min.iters.checked128, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %for.inc.us.preheader ], [ %indvars.iv.unr, %min.iters.checked128 ], [ %ind.end136, %middle.block125 ]
  br label %for.inc.us

for.cond9.for.inc40_crit_edge.us35.loopexit:      ; preds = %for.inc37.us14
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.for.inc40_crit_edge.us35:               ; preds = %for.cond9.for.inc40_crit_edge.us35.loopexit, %middle.block81
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 1000
  br i1 %exitcond50, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us12

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond57, label %for.end45, label %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge

for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge: ; preds = %for.cond6.for.inc43_crit_edge.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br label %for.inc.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv7, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!13, !6, !11, !9}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}

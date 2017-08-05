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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp32 = icmp sgt i32 %n, 0
  br i1 %cmp32, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp230 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp230, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge

for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %.pre = zext i32 %n to i64
  br label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count47 = zext i32 %m to i64
  %wide.trip.count51 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv42 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next43, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv42, %indvars.iv49
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv42
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv42
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next43, %wide.trip.count47
  br i1 %exitcond48, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.cond24.preheader.lr.ph.loopexit, label %for.cond1.preheader.us

for.cond24.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.lr.ph

for.cond24.preheader.lr.ph:                       ; preds = %for.cond24.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge
  %wide.trip.count.pre-phi = phi i64 [ %.pre, %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge ], [ %wide.trip.count51, %for.cond24.preheader.lr.ph.loopexit ]
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv38
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv11
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv38, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count.pre-phi
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count.pre-phi
  br i1 %exitcond41, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  %cmp30 = icmp sgt i32 %n, 0
  br i1 %cmp30, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp728 = icmp sgt i32 %m, 0
  br i1 %cmp728, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count92 = zext i32 %n to i64
  %broadcast.splatinsert103 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat104 = shufflevector <2 x double> %broadcast.splatinsert103, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count71 = zext i32 %m to i64
  %wide.trip.count78 = zext i32 %n to i64
  %broadcast.splatinsert172 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat173 = shufflevector <2 x double> %broadcast.splatinsert172, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert147 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat148 = shufflevector <2 x double> %broadcast.splatinsert147, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader175, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader175 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv74
  br i1 %exitcond.3, label %for.cond9.preheader.us51.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us51.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us51.preheader

for.cond9.preheader.us51.preheader:               ; preds = %for.cond9.preheader.us51.preheader.loopexit, %middle.block150, %for.body3.us.prol.loopexit
  %min.iters.check108 = icmp ult i64 %42, 2
  %n.vec111 = and i64 %42, -2
  %cmp.zero112 = icmp eq i64 %n.vec111, 0
  %cmp.n143 = icmp eq i64 %42, %n.vec111
  br label %for.cond9.preheader.us51

for.body11.us34:                                  ; preds = %for.body11.us34.preheader, %for.body11.us34
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body11.us34 ], [ %indvars.iv64.ph, %for.body11.us34.preheader ]
  %arrayidx15.us37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv69
  %4 = load double, double* %arrayidx15.us37, align 8
  %mul16.us38 = fmul double %4, %alpha
  %5 = load double, double* %arrayidx20.us55, align 8
  %mul21.us39 = fmul double %mul16.us38, %5
  %arrayidx25.us40 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv69
  %6 = load double, double* %arrayidx25.us40, align 8
  %mul26.us41 = fmul double %6, %alpha
  %7 = load double, double* %arrayidx30.us56, align 8
  %mul31.us42 = fmul double %mul26.us41, %7
  %add.us43 = fadd double %mul21.us39, %mul31.us42
  %arrayidx35.us44 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv64
  %8 = load double, double* %arrayidx35.us44, align 8
  %add36.us45 = fadd double %8, %add.us43
  store double %add36.us45, double* %arrayidx35.us44, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, %indvars.iv74
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us57.loopexit, label %for.body11.us34, !llvm.loop !5

for.cond9.preheader.us51:                         ; preds = %for.cond9.preheader.us51.preheader, %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond9.for.inc40_crit_edge.us57 ], [ 0, %for.cond9.preheader.us51.preheader ]
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv69
  %9 = add i64 %indvars.iv69, 1
  %scevgep119 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %9
  %scevgep121 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv69
  %scevgep123 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %9
  %arrayidx20.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %indvars.iv69
  %arrayidx30.us56 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv69
  br i1 %min.iters.check108, label %for.body11.us34.preheader, label %min.iters.checked109

for.body11.us34.preheader:                        ; preds = %middle.block106, %vector.memcheck, %min.iters.checked109, %for.cond9.preheader.us51
  %indvars.iv64.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked109 ], [ 0, %for.cond9.preheader.us51 ], [ %n.vec111, %middle.block106 ]
  br label %for.body11.us34

min.iters.checked109:                             ; preds = %for.cond9.preheader.us51
  br i1 %cmp.zero112, label %for.body11.us34.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked109
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us56
  %bound1 = icmp ult double* %arrayidx30.us56, %scevgep115
  %found.conflict = and i1 %bound0, %bound1
  %bound0126 = icmp ult double* %scevgep, %scevgep119
  %bound1127 = icmp ult double* %scevgep117, %scevgep115
  %found.conflict128 = and i1 %bound0126, %bound1127
  %conflict.rdx = or i1 %found.conflict, %found.conflict128
  %bound0129 = icmp ult double* %scevgep, %scevgep123
  %bound1130 = icmp ult double* %scevgep121, %scevgep115
  %found.conflict131 = and i1 %bound0129, %bound1130
  %conflict.rdx132 = or i1 %conflict.rdx, %found.conflict131
  %bound0135 = icmp ult double* %scevgep, %arrayidx20.us55
  %bound1136 = icmp ult double* %arrayidx20.us55, %scevgep115
  %found.conflict137 = and i1 %bound0135, %bound1136
  %conflict.rdx138 = or i1 %conflict.rdx132, %found.conflict137
  br i1 %conflict.rdx138, label %for.body11.us34.preheader, label %vector.ph139

vector.ph139:                                     ; preds = %vector.memcheck
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105, %vector.ph139
  %index140 = phi i64 [ 0, %vector.ph139 ], [ %index.next141, %vector.body105 ]
  %10 = or i64 %index140, 1
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index140, i64 %indvars.iv69
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %10, i64 %indvars.iv69
  %13 = load double, double* %11, align 8, !alias.scope !6
  %14 = load double, double* %12, align 8, !alias.scope !6
  %15 = insertelement <2 x double> undef, double %13, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %16, %broadcast.splat148
  %18 = load double, double* %arrayidx20.us55, align 8, !alias.scope !9
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = fmul <2 x double> %17, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index140, i64 %indvars.iv69
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %10, i64 %indvars.iv69
  %24 = load double, double* %22, align 8, !alias.scope !11
  %25 = load double, double* %23, align 8, !alias.scope !11
  %26 = insertelement <2 x double> undef, double %24, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, %broadcast.splat148
  %29 = load double, double* %arrayidx30.us56, align 8, !alias.scope !13
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = fmul <2 x double> %28, %31
  %33 = fadd <2 x double> %21, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %index140
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !15, !noalias !17
  %36 = fadd <2 x double> %wide.load, %33
  %37 = bitcast double* %34 to <2 x double>*
  store <2 x double> %36, <2 x double>* %37, align 8, !alias.scope !15, !noalias !17
  %index.next141 = add i64 %index140, 2
  %38 = icmp eq i64 %index.next141, %n.vec111
  br i1 %38, label %middle.block106, label %vector.body105, !llvm.loop !18

middle.block106:                                  ; preds = %vector.body105
  br i1 %cmp.n143, label %for.cond9.for.inc40_crit_edge.us57, label %for.body11.us34.preheader

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv96 = phi i2 [ 1, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next97, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv76 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next77, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv74 = phi i64 [ 1, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next75, %for.cond6.for.inc43_crit_edge.us ]
  %39 = add i64 %indvars.iv76, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 0
  %40 = mul i64 %indvars.iv76, 1201
  %41 = add i64 %40, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %41
  %42 = add i64 %indvars.iv76, 1
  %43 = zext i2 %indvars.iv96 to i64
  %44 = add nuw nsw i64 %43, 4294967295
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %47 = trunc i64 %indvars.iv.next77 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.prol
  %48 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %48, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !19

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %46, %for.body3.us.prol.loopexit.loopexit ]
  %49 = icmp ult i64 %indvars.iv76, 3
  br i1 %49, label %for.cond9.preheader.us51.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %50 = sub i64 %39, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check152 = icmp ult i64 %52, 2
  br i1 %min.iters.check152, label %for.body3.us.preheader175, label %min.iters.checked153

for.body3.us.preheader175:                        ; preds = %middle.block150, %min.iters.checked153, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked153 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end161, %middle.block150 ]
  br label %for.body3.us

min.iters.checked153:                             ; preds = %for.body3.us.preheader
  %n.mod.vf154 = and i64 %52, 1
  %n.vec155 = sub nsw i64 %52, %n.mod.vf154
  %cmp.zero156 = icmp eq i64 %n.vec155, 0
  %53 = add nsw i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf154, 2
  %ind.end161 = sub i64 %55, %56
  br i1 %cmp.zero156, label %for.body3.us.preheader175, label %vector.ph157

vector.ph157:                                     ; preds = %min.iters.checked153
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149, %vector.ph157
  %index158 = phi i64 [ 0, %vector.ph157 ], [ %index.next159, %vector.body149 ]
  %57 = shl i64 %index158, 2
  %58 = add i64 %indvars.iv.unr, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %58
  %60 = bitcast double* %59 to <8 x double>*
  %wide.vec167 = load <8 x double>, <8 x double>* %60, align 8
  %strided.vec168 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec169 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec170 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec171 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = fmul <2 x double> %strided.vec168, %broadcast.splat173
  %62 = fmul <2 x double> %strided.vec169, %broadcast.splat173
  %63 = fmul <2 x double> %strided.vec170, %broadcast.splat173
  %64 = add nsw i64 %58, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %64
  %66 = fmul <2 x double> %strided.vec171, %broadcast.splat173
  %67 = getelementptr double, double* %65, i64 -3
  %68 = bitcast double* %67 to <8 x double>*
  %69 = shufflevector <2 x double> %61, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = shufflevector <2 x double> %63, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec174 = shufflevector <4 x double> %69, <4 x double> %70, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec174, <8 x double>* %68, align 8
  %index.next159 = add i64 %index158, 2
  %71 = icmp eq i64 %index.next159, %n.vec155
  br i1 %71, label %middle.block150, label %vector.body149, !llvm.loop !21

middle.block150:                                  ; preds = %vector.body149
  %cmp.n162 = icmp eq i64 %n.mod.vf154, 0
  br i1 %cmp.n162, label %for.cond9.preheader.us51.preheader, label %for.body3.us.preheader175

for.cond9.for.inc40_crit_edge.us57.loopexit:      ; preds = %for.body11.us34
  br label %for.cond9.for.inc40_crit_edge.us57

for.cond9.for.inc40_crit_edge.us57:               ; preds = %for.cond9.for.inc40_crit_edge.us57.loopexit, %middle.block106
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us51

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  %indvars.iv.next97 = add i2 %indvars.iv96, 1
  br i1 %exitcond79, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.preheader, %for.inc43
  %indvars.iv98 = phi i2 [ 1, %for.body3.lr.ph.preheader ], [ %indvars.iv.next99, %for.inc43 ]
  %indvars.iv90 = phi i64 [ 0, %for.body3.lr.ph.preheader ], [ %indvars.iv.next91, %for.inc43 ]
  %indvars.iv88 = phi i64 [ 1, %for.body3.lr.ph.preheader ], [ %indvars.iv.next89, %for.inc43 ]
  %72 = add i64 %indvars.iv90, -3
  %73 = zext i2 %indvars.iv98 to i64
  %74 = add nuw nsw i64 %73, 4294967295
  %75 = and i64 %74, 4294967295
  %76 = add nuw nsw i64 %75, 1
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %77 = trunc i64 %indvars.iv.next91 to i32
  %xtraiter85 = and i32 %77, 3
  %lcmp.mod86 = icmp eq i32 %xtraiter85, 0
  br i1 %lcmp.mod86, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv80.prol = phi i64 [ %indvars.iv.next81.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter87 = phi i32 [ %prol.iter87.sub, %for.body3.prol ], [ %xtraiter85, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80.prol
  %78 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %78, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next81.prol = add nuw nsw i64 %indvars.iv80.prol, 1
  %prol.iter87.sub = add nsw i32 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i32 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !22

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv80.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %76, %for.body3.prol.loopexit.loopexit ]
  %79 = icmp ult i64 %indvars.iv90, 3
  br i1 %79, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %80 = sub i64 %72, %indvars.iv80.unr
  %81 = lshr i64 %80, 2
  %82 = add nuw nsw i64 %81, 1
  %min.iters.check = icmp ult i64 %82, 2
  br i1 %min.iters.check, label %for.body3.preheader176, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %82, 1
  %n.vec = sub nsw i64 %82, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %83 = add nsw i64 %indvars.iv80.unr, 4
  %84 = shl nuw i64 %81, 2
  %85 = add i64 %83, %84
  %86 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %85, %86
  br i1 %cmp.zero, label %for.body3.preheader176, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %87 = shl i64 %index, 2
  %88 = add i64 %indvars.iv80.unr, %87
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %88
  %90 = bitcast double* %89 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %90, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec100 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec101 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec102 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %91 = fmul <2 x double> %strided.vec, %broadcast.splat104
  %92 = fmul <2 x double> %strided.vec100, %broadcast.splat104
  %93 = fmul <2 x double> %strided.vec101, %broadcast.splat104
  %94 = add nsw i64 %88, 3
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %94
  %96 = fmul <2 x double> %strided.vec102, %broadcast.splat104
  %97 = getelementptr double, double* %95, i64 -3
  %98 = bitcast double* %97 to <8 x double>*
  %99 = shufflevector <2 x double> %91, <2 x double> %92, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %100 = shufflevector <2 x double> %93, <2 x double> %96, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %99, <4 x double> %100, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %98, align 8
  %index.next = add i64 %index, 2
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader176

for.body3.preheader176:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv80.ph = phi i64 [ %indvars.iv80.unr, %min.iters.checked ], [ %indvars.iv80.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader176, %for.body3
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.3, %for.body3 ], [ %indvars.iv80.ph, %for.body3.preheader176 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80
  %102 = load double, double* %arrayidx5, align 8
  %mul = fmul double %102, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81
  %103 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %103, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.1
  %104 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %104, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next81.2 = add nsw i64 %indvars.iv80, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.2
  %105 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %105, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next81.3 = add nsw i64 %indvars.iv80, 4
  %exitcond84.3 = icmp eq i64 %indvars.iv.next81.3, %indvars.iv88
  br i1 %exitcond84.3, label %for.inc43.loopexit, label %for.body3, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, %wide.trip.count92
  %indvars.iv.next99 = add i2 %indvars.iv98, 1
  br i1 %exitcond93, label %for.end45.loopexit177, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit177:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit177, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}

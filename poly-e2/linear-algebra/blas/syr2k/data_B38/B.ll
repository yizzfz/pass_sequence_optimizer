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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %cmp34 = icmp sgt i32 %n, 0
  br i1 %cmp34, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp232 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp232, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
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
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv44
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv44
  store double %div12.us, double* %arrayidx16.us, align 8
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  %cmp30 = icmp sgt i32 %n, 0
  br i1 %cmp30, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp728 = icmp sgt i32 %m, 0
  br i1 %cmp728, label %for.inc.lr.ph.us.preheader, label %for.inc.lr.ph.preheader

for.inc.lr.ph.preheader:                          ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count92 = zext i32 %n to i64
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count71 = zext i32 %m to i64
  %wide.trip.count78 = zext i32 %n to i64
  %broadcast.splatinsert168 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat169 = shufflevector <2 x double> %broadcast.splatinsert168, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert143 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat144 = shufflevector <2 x double> %broadcast.splatinsert143, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader171, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader171 ]
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
  br i1 %exitcond.3, label %for.cond9.preheader.us34.preheader.loopexit, label %for.inc.us, !llvm.loop !1

for.cond9.preheader.us34.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us34.preheader

for.cond9.preheader.us34.preheader:               ; preds = %for.cond9.preheader.us34.preheader.loopexit, %middle.block146, %for.inc.us.prol.loopexit
  %min.iters.check104 = icmp ult i64 %42, 2
  %n.vec107 = and i64 %42, -2
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  %cmp.n139 = icmp eq i64 %42, %n.vec107
  br label %for.cond9.preheader.us34

for.cond9.preheader.us34:                         ; preds = %for.cond9.preheader.us34.preheader, %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond9.for.inc40_crit_edge.us57 ], [ 0, %for.cond9.preheader.us34.preheader ]
  %scevgep113 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv69
  %4 = add i64 %indvars.iv69, 1
  %scevgep115 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %4
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv69
  %scevgep119 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %4
  %arrayidx20.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %indvars.iv69
  %arrayidx30.us56 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv69
  br i1 %min.iters.check104, label %for.inc37.us36.preheader, label %min.iters.checked105

min.iters.checked105:                             ; preds = %for.cond9.preheader.us34
  br i1 %cmp.zero108, label %for.inc37.us36.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked105
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us56
  %bound1 = icmp ult double* %arrayidx30.us56, %scevgep111
  %found.conflict = and i1 %bound0, %bound1
  %bound0122 = icmp ult double* %scevgep, %scevgep115
  %bound1123 = icmp ult double* %scevgep113, %scevgep111
  %found.conflict124 = and i1 %bound0122, %bound1123
  %conflict.rdx = or i1 %found.conflict, %found.conflict124
  %bound0125 = icmp ult double* %scevgep, %scevgep119
  %bound1126 = icmp ult double* %scevgep117, %scevgep111
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx128 = or i1 %conflict.rdx, %found.conflict127
  %bound0131 = icmp ult double* %scevgep, %arrayidx20.us55
  %bound1132 = icmp ult double* %arrayidx20.us55, %scevgep111
  %found.conflict133 = and i1 %bound0131, %bound1132
  %conflict.rdx134 = or i1 %conflict.rdx128, %found.conflict133
  br i1 %conflict.rdx134, label %for.inc37.us36.preheader, label %vector.ph135

vector.ph135:                                     ; preds = %vector.memcheck
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph135
  %index136 = phi i64 [ 0, %vector.ph135 ], [ %index.next137, %vector.body101 ]
  %5 = or i64 %index136, 1
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index136, i64 %indvars.iv69
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %5, i64 %indvars.iv69
  %8 = load double, double* %6, align 8, !alias.scope !5
  %9 = load double, double* %7, align 8, !alias.scope !5
  %10 = insertelement <2 x double> undef, double %8, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fmul <2 x double> %11, %broadcast.splat144
  %13 = load double, double* %arrayidx20.us55, align 8, !alias.scope !8
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %12, %15
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index136, i64 %indvars.iv69
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %5, i64 %indvars.iv69
  %19 = load double, double* %17, align 8, !alias.scope !10
  %20 = load double, double* %18, align 8, !alias.scope !10
  %21 = insertelement <2 x double> undef, double %19, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, %broadcast.splat144
  %24 = load double, double* %arrayidx30.us56, align 8, !alias.scope !12
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fmul <2 x double> %23, %26
  %28 = fadd <2 x double> %16, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %index136
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !14, !noalias !16
  %31 = fadd <2 x double> %wide.load, %28
  %32 = bitcast double* %29 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8, !alias.scope !14, !noalias !16
  %index.next137 = add i64 %index136, 2
  %33 = icmp eq i64 %index.next137, %n.vec107
  br i1 %33, label %middle.block102, label %vector.body101, !llvm.loop !17

middle.block102:                                  ; preds = %vector.body101
  br i1 %cmp.n139, label %for.cond9.for.inc40_crit_edge.us57, label %for.inc37.us36.preheader

for.inc37.us36.preheader:                         ; preds = %middle.block102, %vector.memcheck, %min.iters.checked105, %for.cond9.preheader.us34
  %indvars.iv64.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked105 ], [ 0, %for.cond9.preheader.us34 ], [ %n.vec107, %middle.block102 ]
  br label %for.inc37.us36

for.inc37.us36:                                   ; preds = %for.inc37.us36.preheader, %for.inc37.us36
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc37.us36 ], [ %indvars.iv64.ph, %for.inc37.us36.preheader ]
  %arrayidx15.us39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv69
  %34 = load double, double* %arrayidx15.us39, align 8
  %mul16.us40 = fmul double %34, %alpha
  %35 = load double, double* %arrayidx20.us55, align 8
  %mul21.us41 = fmul double %mul16.us40, %35
  %arrayidx25.us42 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv69
  %36 = load double, double* %arrayidx25.us42, align 8
  %mul26.us43 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx30.us56, align 8
  %mul31.us44 = fmul double %mul26.us43, %37
  %add.us45 = fadd double %mul21.us41, %mul31.us44
  %arrayidx35.us46 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv64
  %38 = load double, double* %arrayidx35.us46, align 8
  %add36.us47 = fadd double %38, %add.us45
  store double %add36.us47, double* %arrayidx35.us46, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, %indvars.iv74
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us57.loopexit, label %for.inc37.us36, !llvm.loop !18

for.inc.lr.ph.us:                                 ; preds = %for.inc.lr.ph.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.inc.lr.ph.us.preheader ]
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.inc.lr.ph.us.preheader ]
  %39 = add i64 %indvars.iv76, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 0
  %40 = mul i64 %indvars.iv76, 1201
  %41 = add i64 %40, 1
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %41
  %42 = add i64 %indvars.iv76, 1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %43 = trunc i64 %indvars.iv.next77 to i32
  %xtraiter = and i32 %43, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.prol
  %44 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %44, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !19

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %45 = icmp ult i64 %indvars.iv76, 3
  br i1 %45, label %for.cond9.preheader.us34.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %46 = sub i64 %39, %indvars.iv.unr
  %47 = lshr i64 %46, 2
  %48 = add nuw nsw i64 %47, 1
  %min.iters.check148 = icmp ult i64 %48, 2
  br i1 %min.iters.check148, label %for.inc.us.preheader171, label %min.iters.checked149

for.inc.us.preheader171:                          ; preds = %middle.block146, %min.iters.checked149, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked149 ], [ %indvars.iv.unr, %for.inc.us.preheader ], [ %ind.end157, %middle.block146 ]
  br label %for.inc.us

min.iters.checked149:                             ; preds = %for.inc.us.preheader
  %n.mod.vf150 = and i64 %48, 1
  %n.vec151 = sub nsw i64 %48, %n.mod.vf150
  %cmp.zero152 = icmp eq i64 %n.vec151, 0
  %49 = add i64 %indvars.iv.unr, 4
  %50 = shl nuw i64 %47, 2
  %51 = add i64 %49, %50
  %52 = shl nuw nsw i64 %n.mod.vf150, 2
  %ind.end157 = sub i64 %51, %52
  br i1 %cmp.zero152, label %for.inc.us.preheader171, label %vector.ph153

vector.ph153:                                     ; preds = %min.iters.checked149
  br label %vector.body145

vector.body145:                                   ; preds = %vector.body145, %vector.ph153
  %index154 = phi i64 [ 0, %vector.ph153 ], [ %index.next155, %vector.body145 ]
  %53 = shl i64 %index154, 2
  %54 = add i64 %indvars.iv.unr, %53
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %54
  %56 = bitcast double* %55 to <8 x double>*
  %wide.vec163 = load <8 x double>, <8 x double>* %56, align 8
  %strided.vec164 = shufflevector <8 x double> %wide.vec163, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec165 = shufflevector <8 x double> %wide.vec163, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec166 = shufflevector <8 x double> %wide.vec163, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec167 = shufflevector <8 x double> %wide.vec163, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %57 = fmul <2 x double> %strided.vec164, %broadcast.splat169
  %58 = fmul <2 x double> %strided.vec165, %broadcast.splat169
  %59 = fmul <2 x double> %strided.vec166, %broadcast.splat169
  %60 = add nsw i64 %54, 3
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %60
  %62 = fmul <2 x double> %strided.vec167, %broadcast.splat169
  %63 = getelementptr double, double* %61, i64 -3
  %64 = bitcast double* %63 to <8 x double>*
  %65 = shufflevector <2 x double> %57, <2 x double> %58, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %66 = shufflevector <2 x double> %59, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec170 = shufflevector <4 x double> %65, <4 x double> %66, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec170, <8 x double>* %64, align 8
  %index.next155 = add i64 %index154, 2
  %67 = icmp eq i64 %index.next155, %n.vec151
  br i1 %67, label %middle.block146, label %vector.body145, !llvm.loop !21

middle.block146:                                  ; preds = %vector.body145
  %cmp.n158 = icmp eq i64 %n.mod.vf150, 0
  br i1 %cmp.n158, label %for.cond9.preheader.us34.preheader, label %for.inc.us.preheader171

for.cond9.for.inc40_crit_edge.us57.loopexit:      ; preds = %for.inc37.us36
  br label %for.cond9.for.inc40_crit_edge.us57

for.cond9.for.inc40_crit_edge.us57:               ; preds = %for.cond9.for.inc40_crit_edge.us57.loopexit, %middle.block102
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us34

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond79, label %for.end45.loopexit, label %for.inc.lr.ph.us

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.preheader, %for.inc43
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %for.inc43 ], [ 0, %for.inc.lr.ph.preheader ]
  %indvars.iv88 = phi i64 [ %indvars.iv.next89, %for.inc43 ], [ 1, %for.inc.lr.ph.preheader ]
  %68 = add i64 %indvars.iv90, -3
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %69 = trunc i64 %indvars.iv.next91 to i32
  %xtraiter85 = and i32 %69, 3
  %lcmp.mod86 = icmp eq i32 %xtraiter85, 0
  br i1 %lcmp.mod86, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv80.prol = phi i64 [ %indvars.iv.next81.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter87 = phi i32 [ %prol.iter87.sub, %for.inc.prol ], [ %xtraiter85, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80.prol
  %70 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %70, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next81.prol = add nuw nsw i64 %indvars.iv80.prol, 1
  %prol.iter87.sub = add i32 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i32 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !22

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv80.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next81.prol, %for.inc.prol.loopexit.loopexit ]
  %71 = icmp ult i64 %indvars.iv90, 3
  br i1 %71, label %for.inc43, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %72 = sub i64 %68, %indvars.iv80.unr
  %73 = lshr i64 %72, 2
  %74 = add nuw nsw i64 %73, 1
  %min.iters.check = icmp ult i64 %74, 2
  br i1 %min.iters.check, label %for.inc.preheader172, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.preheader
  %n.mod.vf = and i64 %74, 1
  %n.vec = sub nsw i64 %74, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %75 = add i64 %indvars.iv80.unr, 4
  %76 = shl nuw i64 %73, 2
  %77 = add i64 %75, %76
  %78 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %77, %78
  br i1 %cmp.zero, label %for.inc.preheader172, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %79 = shl i64 %index, 2
  %80 = add i64 %indvars.iv80.unr, %79
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %80
  %82 = bitcast double* %81 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %82, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec97 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec98 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %83 = fmul <2 x double> %strided.vec, %broadcast.splat100
  %84 = fmul <2 x double> %strided.vec96, %broadcast.splat100
  %85 = fmul <2 x double> %strided.vec97, %broadcast.splat100
  %86 = add nsw i64 %80, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %86
  %88 = fmul <2 x double> %strided.vec98, %broadcast.splat100
  %89 = getelementptr double, double* %87, i64 -3
  %90 = bitcast double* %89 to <8 x double>*
  %91 = shufflevector <2 x double> %83, <2 x double> %84, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %92 = shufflevector <2 x double> %85, <2 x double> %88, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %91, <4 x double> %92, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %90, align 8
  %index.next = add i64 %index, 2
  %93 = icmp eq i64 %index.next, %n.vec
  br i1 %93, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.inc.preheader172

for.inc.preheader172:                             ; preds = %middle.block, %min.iters.checked, %for.inc.preheader
  %indvars.iv80.ph = phi i64 [ %indvars.iv80.unr, %min.iters.checked ], [ %indvars.iv80.unr, %for.inc.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader172, %for.inc
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.3, %for.inc ], [ %indvars.iv80.ph, %for.inc.preheader172 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80
  %94 = load double, double* %arrayidx5, align 8
  %mul = fmul double %94, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81
  %95 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %95, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.1
  %96 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %96, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next81.2 = add nsw i64 %indvars.iv80, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.2
  %97 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %97, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next81.3 = add nsw i64 %indvars.iv80, 4
  %exitcond84.3 = icmp eq i64 %indvars.iv.next81.3, %indvars.iv88
  br i1 %exitcond84.3, label %for.inc43.loopexit, label %for.inc, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.inc
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.inc.prol.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, %wide.trip.count92
  br i1 %exitcond93, label %for.end45.loopexit173, label %for.inc.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit173:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit173, %for.end45.loopexit, %entry
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
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
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}

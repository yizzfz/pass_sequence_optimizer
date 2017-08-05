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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp27 = icmp sgt i32 %n, 0
  br i1 %cmp27, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp225 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp225, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %m to i64
  %1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv37 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next38, %for.body3.us ]
  %2 = mul nuw nsw i64 %indvars.iv37, %indvars.iv44
  %3 = add nuw nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv37
  store double %div.us, double* %arrayidx6.us, align 8
  %5 = add nuw nsw i64 %2, 2
  %6 = trunc i64 %5 to i32
  %rem9.us = srem i32 %6, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv37
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next38, %0
  br i1 %exitcond50, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next45, %1
  br i1 %exitcond51, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %cmp2122 = icmp sgt i32 %n, 0
  br i1 %cmp2122, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %7 = zext i32 %n to i64
  %8 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv33 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next34, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %9 = mul nuw nsw i64 %indvars.iv, %indvars.iv33
  %10 = add nuw nsw i64 %9, 3
  %11 = trunc i64 %10 to i32
  %rem30.us = srem i32 %11, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv33, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond49, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %8
  br i1 %exitcond, label %for.end43.loopexit, label %for.cond24.preheader.us

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
  %cmp727 = icmp sgt i32 %m, 0
  br i1 %cmp727, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %n to i64
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = zext i32 %m to i64
  %2 = zext i32 %n to i64
  %broadcast.splatinsert175 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat176 = shufflevector <2 x double> %broadcast.splatinsert175, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert150 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat151 = shufflevector <2 x double> %broadcast.splatinsert150, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader178, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader178 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv
  %3 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %3, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next
  %4 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %4, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next.1
  %5 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %5, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.next.2
  %6 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %6, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv74
  br i1 %exitcond.3, label %for.cond9.preheader.us33.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us33.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us33.preheader

for.cond9.preheader.us33.preheader:               ; preds = %for.cond9.preheader.us33.preheader.loopexit, %middle.block153, %for.body3.us.prol.loopexit
  %min.iters.check111 = icmp ult i64 %45, 2
  %n.vec114 = and i64 %45, -2
  %cmp.zero115 = icmp eq i64 %n.vec114, 0
  %cmp.n146 = icmp eq i64 %45, %n.vec114
  br label %for.cond9.preheader.us33

for.cond9.preheader.us33:                         ; preds = %for.cond9.preheader.us33.preheader, %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond9.for.inc40_crit_edge.us57 ], [ 0, %for.cond9.preheader.us33.preheader ]
  %scevgep120 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv69
  %7 = add i64 %indvars.iv69, 1
  %scevgep122 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %7
  %scevgep124 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv69
  %scevgep126 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %7
  %arrayidx20.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv76, i64 %indvars.iv69
  %arrayidx30.us56 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv69
  br i1 %min.iters.check111, label %for.body11.us35.preheader, label %min.iters.checked112

min.iters.checked112:                             ; preds = %for.cond9.preheader.us33
  br i1 %cmp.zero115, label %for.body11.us35.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked112
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us56
  %bound1 = icmp ult double* %arrayidx30.us56, %scevgep118
  %found.conflict = and i1 %bound0, %bound1
  %bound0129 = icmp ult double* %scevgep, %scevgep122
  %bound1130 = icmp ult double* %scevgep120, %scevgep118
  %found.conflict131 = and i1 %bound0129, %bound1130
  %conflict.rdx = or i1 %found.conflict, %found.conflict131
  %bound0132 = icmp ult double* %scevgep, %scevgep126
  %bound1133 = icmp ult double* %scevgep124, %scevgep118
  %found.conflict134 = and i1 %bound0132, %bound1133
  %conflict.rdx135 = or i1 %conflict.rdx, %found.conflict134
  %bound0138 = icmp ult double* %scevgep, %arrayidx20.us55
  %bound1139 = icmp ult double* %arrayidx20.us55, %scevgep118
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx141 = or i1 %conflict.rdx135, %found.conflict140
  br i1 %conflict.rdx141, label %for.body11.us35.preheader, label %vector.ph142

vector.ph142:                                     ; preds = %vector.memcheck
  %8 = load double, double* %arrayidx20.us55, align 8, !alias.scope !5
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = load double, double* %arrayidx30.us56, align 8, !alias.scope !8
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108, %vector.ph142
  %index143 = phi i64 [ 0, %vector.ph142 ], [ %index.next144, %vector.body108 ]
  %14 = or i64 %index143, 1
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index143, i64 %indvars.iv69
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %14, i64 %indvars.iv69
  %17 = load double, double* %15, align 8, !alias.scope !10
  %18 = load double, double* %16, align 8, !alias.scope !10
  %19 = insertelement <2 x double> undef, double %17, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fmul <2 x double> %20, %broadcast.splat151
  %22 = fmul <2 x double> %21, %10
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index143, i64 %indvars.iv69
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %14, i64 %indvars.iv69
  %25 = load double, double* %23, align 8, !alias.scope !12
  %26 = load double, double* %24, align 8, !alias.scope !12
  %27 = insertelement <2 x double> undef, double %25, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %28, %broadcast.splat151
  %30 = fmul <2 x double> %29, %13
  %31 = fadd <2 x double> %22, %30
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %index143
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !14, !noalias !16
  %34 = fadd <2 x double> %wide.load, %31
  %35 = bitcast double* %32 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8, !alias.scope !14, !noalias !16
  %index.next144 = add i64 %index143, 2
  %36 = icmp eq i64 %index.next144, %n.vec114
  br i1 %36, label %middle.block109, label %vector.body108, !llvm.loop !17

middle.block109:                                  ; preds = %vector.body108
  br i1 %cmp.n146, label %for.cond9.for.inc40_crit_edge.us57, label %for.body11.us35.preheader

for.body11.us35.preheader:                        ; preds = %middle.block109, %vector.memcheck, %min.iters.checked112, %for.cond9.preheader.us33
  %indvars.iv64.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked112 ], [ 0, %for.cond9.preheader.us33 ], [ %n.vec114, %middle.block109 ]
  br label %for.body11.us35

for.body11.us35:                                  ; preds = %for.body11.us35.preheader, %for.body11.us35
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body11.us35 ], [ %indvars.iv64.ph, %for.body11.us35.preheader ]
  %arrayidx15.us38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv69
  %37 = load double, double* %arrayidx15.us38, align 8
  %mul16.us39 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx20.us55, align 8
  %mul21.us40 = fmul double %mul16.us39, %38
  %arrayidx25.us41 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv69
  %39 = load double, double* %arrayidx25.us41, align 8
  %mul26.us42 = fmul double %39, %alpha
  %40 = load double, double* %arrayidx30.us56, align 8
  %mul31.us43 = fmul double %mul26.us42, %40
  %add.us44 = fadd double %mul21.us40, %mul31.us43
  %arrayidx35.us45 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv64
  %41 = load double, double* %arrayidx35.us45, align 8
  %add36.us46 = fadd double %41, %add.us44
  store double %add36.us46, double* %arrayidx35.us45, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond = icmp eq i64 %indvars.iv.next65, %indvars.iv74
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us57.loopexit, label %for.body11.us35, !llvm.loop !18

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv94 = phi i2 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next95, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv76 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next77, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv74 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next75, %for.cond6.for.inc43_crit_edge.us ]
  %42 = add i64 %indvars.iv76, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 0
  %43 = mul i64 %indvars.iv76, 1201
  %44 = add i64 %43, 1
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %44
  %45 = add i64 %indvars.iv76, 1
  %46 = zext i2 %indvars.iv94 to i64
  %47 = add nuw nsw i64 %46, 4294967295
  %48 = and i64 %47, 4294967295
  %49 = add nuw nsw i64 %48, 1
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %50 = trunc i64 %indvars.iv.next77 to i32
  %xtraiter = and i32 %50, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %indvars.iv.prol
  %51 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %51, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !19

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %49, %for.body3.us.prol.loopexit.loopexit ]
  %52 = icmp ult i64 %indvars.iv76, 3
  br i1 %52, label %for.cond9.preheader.us33.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %53 = sub i64 %42, %indvars.iv.unr
  %54 = lshr i64 %53, 2
  %55 = add nuw nsw i64 %54, 1
  %min.iters.check155 = icmp ult i64 %55, 2
  br i1 %min.iters.check155, label %for.body3.us.preheader178, label %min.iters.checked156

for.body3.us.preheader178:                        ; preds = %middle.block153, %min.iters.checked156, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked156 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end164, %middle.block153 ]
  br label %for.body3.us

min.iters.checked156:                             ; preds = %for.body3.us.preheader
  %n.mod.vf157 = and i64 %55, 1
  %n.vec158 = sub nsw i64 %55, %n.mod.vf157
  %cmp.zero159 = icmp eq i64 %n.vec158, 0
  %56 = add nsw i64 %indvars.iv.unr, 4
  %57 = shl nuw i64 %54, 2
  %58 = add i64 %56, %57
  %59 = shl nuw nsw i64 %n.mod.vf157, 2
  %ind.end164 = sub i64 %58, %59
  br i1 %cmp.zero159, label %for.body3.us.preheader178, label %vector.ph160

vector.ph160:                                     ; preds = %min.iters.checked156
  br label %vector.body152

vector.body152:                                   ; preds = %vector.body152, %vector.ph160
  %index161 = phi i64 [ 0, %vector.ph160 ], [ %index.next162, %vector.body152 ]
  %60 = shl i64 %index161, 2
  %61 = add i64 %indvars.iv.unr, %60
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %61
  %63 = bitcast double* %62 to <8 x double>*
  %wide.vec170 = load <8 x double>, <8 x double>* %63, align 8
  %strided.vec171 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec172 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec173 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec174 = shufflevector <8 x double> %wide.vec170, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %64 = fmul <2 x double> %strided.vec171, %broadcast.splat176
  %65 = fmul <2 x double> %strided.vec172, %broadcast.splat176
  %66 = fmul <2 x double> %strided.vec173, %broadcast.splat176
  %67 = add nsw i64 %61, 3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv76, i64 %67
  %69 = fmul <2 x double> %strided.vec174, %broadcast.splat176
  %70 = getelementptr double, double* %68, i64 -3
  %71 = bitcast double* %70 to <8 x double>*
  %72 = shufflevector <2 x double> %64, <2 x double> %65, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %73 = shufflevector <2 x double> %66, <2 x double> %69, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec177 = shufflevector <4 x double> %72, <4 x double> %73, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec177, <8 x double>* %71, align 8
  %index.next162 = add i64 %index161, 2
  %74 = icmp eq i64 %index.next162, %n.vec158
  br i1 %74, label %middle.block153, label %vector.body152, !llvm.loop !21

middle.block153:                                  ; preds = %vector.body152
  %cmp.n165 = icmp eq i64 %n.mod.vf157, 0
  br i1 %cmp.n165, label %for.cond9.preheader.us33.preheader, label %for.body3.us.preheader178

for.cond9.for.inc40_crit_edge.us57.loopexit:      ; preds = %for.body11.us35
  br label %for.cond9.for.inc40_crit_edge.us57

for.cond9.for.inc40_crit_edge.us57:               ; preds = %for.cond9.for.inc40_crit_edge.us57.loopexit, %middle.block109
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next70, %1
  br i1 %exitcond96, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us33

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %indvars.iv.next95 = add i2 %indvars.iv94, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next77, %2
  br i1 %exitcond97, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.cond1.preheader.preheader
  %indvars.iv98 = phi i2 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next99, %for.inc43 ]
  %indvars.iv90 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next91, %for.inc43 ]
  %indvars.iv88 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next89, %for.inc43 ]
  %75 = add i64 %indvars.iv90, -3
  %76 = zext i2 %indvars.iv98 to i64
  %77 = add nuw nsw i64 %76, 4294967295
  %78 = and i64 %77, 4294967295
  %79 = add nuw nsw i64 %78, 1
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %80 = trunc i64 %indvars.iv.next91 to i32
  %xtraiter85 = and i32 %80, 3
  %lcmp.mod86 = icmp eq i32 %xtraiter85, 0
  br i1 %lcmp.mod86, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv80.prol = phi i64 [ %indvars.iv.next81.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter87 = phi i32 [ %prol.iter87.sub, %for.body3.prol ], [ %xtraiter85, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80.prol
  %81 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %81, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next81.prol = add nuw nsw i64 %indvars.iv80.prol, 1
  %prol.iter87.sub = add nsw i32 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i32 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !22

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv80.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %79, %for.body3.prol.loopexit.loopexit ]
  %82 = icmp ult i64 %indvars.iv90, 3
  br i1 %82, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %83 = sub i64 %75, %indvars.iv80.unr
  %84 = lshr i64 %83, 2
  %85 = add nuw nsw i64 %84, 1
  %min.iters.check = icmp ult i64 %85, 2
  br i1 %min.iters.check, label %for.body3.preheader179, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %85, 1
  %n.vec = sub nsw i64 %85, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %86 = add nsw i64 %indvars.iv80.unr, 4
  %87 = shl nuw i64 %84, 2
  %88 = add i64 %86, %87
  %89 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %88, %89
  br i1 %cmp.zero, label %for.body3.preheader179, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %90 = shl i64 %index, 2
  %91 = add i64 %indvars.iv80.unr, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %91
  %93 = bitcast double* %92 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %93, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec103 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec104 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec105 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %94 = fmul <2 x double> %strided.vec, %broadcast.splat107
  %95 = fmul <2 x double> %strided.vec103, %broadcast.splat107
  %96 = fmul <2 x double> %strided.vec104, %broadcast.splat107
  %97 = add nsw i64 %91, 3
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %97
  %99 = fmul <2 x double> %strided.vec105, %broadcast.splat107
  %100 = getelementptr double, double* %98, i64 -3
  %101 = bitcast double* %100 to <8 x double>*
  %102 = shufflevector <2 x double> %94, <2 x double> %95, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %103 = shufflevector <2 x double> %96, <2 x double> %99, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %102, <4 x double> %103, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %101, align 8
  %index.next = add i64 %index, 2
  %104 = icmp eq i64 %index.next, %n.vec
  br i1 %104, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader179

for.body3.preheader179:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv80.ph = phi i64 [ %indvars.iv80.unr, %min.iters.checked ], [ %indvars.iv80.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader179, %for.body3
  %indvars.iv80 = phi i64 [ %indvars.iv.next81.3, %for.body3 ], [ %indvars.iv80.ph, %for.body3.preheader179 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv80
  %105 = load double, double* %arrayidx5, align 8
  %mul = fmul double %105, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81
  %106 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %106, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next81.1 = add nsw i64 %indvars.iv80, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.1
  %107 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %107, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next81.2 = add nsw i64 %indvars.iv80, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv90, i64 %indvars.iv.next81.2
  %108 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %108, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next81.3 = add nsw i64 %indvars.iv80, 4
  %exitcond84.3 = icmp eq i64 %indvars.iv.next81.3, %indvars.iv88
  br i1 %exitcond84.3, label %for.inc43.loopexit, label %for.body3, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %indvars.iv.next99 = add i2 %indvars.iv98, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next91, %0
  br i1 %exitcond100, label %for.end45.loopexit180, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit180:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit180, %for.end45.loopexit, %entry
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
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  %5 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond18, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #5
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
!16 = !{!9, !11, !13, !6}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}

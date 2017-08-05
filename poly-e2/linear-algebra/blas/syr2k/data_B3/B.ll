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
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp23 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp23, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count17 = zext i32 %m to i64
  %wide.trip.count21 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.end_crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.cond1.for.end_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next13, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv12, %indvars.iv19
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv12
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv19, i64 %indvars.iv12
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next13, %wide.trip.count17
  br i1 %exitcond18, label %for.cond1.for.end_crit_edge.us, label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.end_crit_edge.us
  %cmp212 = icmp sgt i32 %n, 0
  br i1 %cmp212, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.end40_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond24.for.end40_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.end40_crit_edge.us, label %for.body27.us

for.cond24.for.end40_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.end40_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry, %for.cond20.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp73 = icmp sgt i32 %m, 0
  br i1 %cmp73, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count61 = zext i32 %n to i64
  %broadcast.splatinsert68 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat69 = shufflevector <2 x double> %broadcast.splatinsert68, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count40 = zext i32 %m to i64
  %wide.trip.count47 = zext i32 %n to i64
  %broadcast.splatinsert137 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat138 = shufflevector <2 x double> %broadcast.splatinsert137, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert112 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat113 = shufflevector <2 x double> %broadcast.splatinsert112, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader140, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader140 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv43
  br i1 %exitcond.3, label %for.cond9.preheader.us21.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us21.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us21.preheader

for.cond9.preheader.us21.preheader:               ; preds = %for.cond9.preheader.us21.preheader.loopexit, %middle.block115, %for.body3.us.prol.loopexit
  %n.vec76 = and i64 %45, -2
  br label %for.cond9.preheader.us21

for.body11.us5:                                   ; preds = %for.body11.us5.preheader, %for.body11.us5
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.body11.us5 ], [ %indvars.iv33.ph, %for.body11.us5.preheader ]
  %arrayidx15.us7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv38
  %4 = load double, double* %arrayidx15.us7, align 8
  %mul16.us8 = fmul double %4, %alpha
  %5 = load double, double* %arrayidx20.us24, align 8
  %mul21.us9 = fmul double %mul16.us8, %5
  %arrayidx25.us10 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv38
  %6 = load double, double* %arrayidx25.us10, align 8
  %mul26.us11 = fmul double %6, %alpha
  %7 = load double, double* %arrayidx30.us25, align 8
  %mul31.us12 = fmul double %mul26.us11, %7
  %add.us13 = fadd double %mul21.us9, %mul31.us12
  %arrayidx35.us14 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv33
  %8 = load double, double* %arrayidx35.us14, align 8
  %add36.us15 = fadd double %8, %add.us13
  store double %add36.us15, double* %arrayidx35.us14, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond = icmp eq i64 %indvars.iv.next34, %indvars.iv43
  br i1 %exitcond, label %for.cond9.for.end39_crit_edge.us26.loopexit, label %for.body11.us5, !llvm.loop !5

for.cond9.preheader.us21:                         ; preds = %for.cond9.preheader.us21.preheader, %for.cond9.for.end39_crit_edge.us26
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond9.for.end39_crit_edge.us26 ], [ 0, %for.cond9.preheader.us21.preheader ]
  %9 = icmp ult i64 %45, 2
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv38
  %10 = add i64 %indvars.iv38, 1
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv45, i64 %10
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv38
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv45, i64 %10
  %arrayidx20.us24 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv38
  %arrayidx30.us25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv45, i64 %indvars.iv38
  br i1 %9, label %for.body11.us5.preheader, label %min.iters.checked74

for.body11.us5.preheader:                         ; preds = %middle.block71, %vector.memcheck, %min.iters.checked74, %for.cond9.preheader.us21
  %indvars.iv33.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked74 ], [ 0, %for.cond9.preheader.us21 ], [ %n.vec76, %middle.block71 ]
  br label %for.body11.us5

min.iters.checked74:                              ; preds = %for.cond9.preheader.us21
  %11 = icmp eq i64 %n.vec76, 0
  br i1 %11, label %for.body11.us5.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked74
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us25
  %bound1 = icmp ult double* %arrayidx30.us25, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bound091 = icmp ult double* %scevgep, %scevgep84
  %bound192 = icmp ult double* %scevgep82, %scevgep80
  %found.conflict93 = and i1 %bound091, %bound192
  %conflict.rdx = or i1 %found.conflict, %found.conflict93
  %bound094 = icmp ult double* %scevgep, %scevgep88
  %bound195 = icmp ult double* %scevgep86, %scevgep80
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx97 = or i1 %conflict.rdx, %found.conflict96
  %bound0100 = icmp ult double* %scevgep, %arrayidx20.us24
  %bound1101 = icmp ult double* %arrayidx20.us24, %scevgep80
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %conflict.rdx97, %found.conflict102
  br i1 %conflict.rdx103, label %for.body11.us5.preheader, label %vector.ph104

vector.ph104:                                     ; preds = %vector.memcheck
  br label %vector.body70

vector.body70:                                    ; preds = %vector.body70, %vector.ph104
  %index105 = phi i64 [ 0, %vector.ph104 ], [ %index.next106, %vector.body70 ]
  %12 = or i64 %index105, 1
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index105, i64 %indvars.iv38
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %12, i64 %indvars.iv38
  %15 = load double, double* %13, align 8, !alias.scope !6
  %16 = load double, double* %14, align 8, !alias.scope !6
  %17 = insertelement <2 x double> undef, double %15, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %18, %broadcast.splat113
  %20 = load double, double* %arrayidx20.us24, align 8, !alias.scope !9
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = fmul <2 x double> %19, %22
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index105, i64 %indvars.iv38
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %12, i64 %indvars.iv38
  %26 = load double, double* %24, align 8, !alias.scope !11
  %27 = load double, double* %25, align 8, !alias.scope !11
  %28 = insertelement <2 x double> undef, double %26, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fmul <2 x double> %29, %broadcast.splat113
  %31 = load double, double* %arrayidx30.us25, align 8, !alias.scope !13
  %32 = insertelement <2 x double> undef, double %31, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = fmul <2 x double> %30, %33
  %35 = fadd <2 x double> %23, %34
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %index105
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !15, !noalias !17
  %38 = fadd <2 x double> %wide.load, %35
  %39 = bitcast double* %36 to <2 x double>*
  store <2 x double> %38, <2 x double>* %39, align 8, !alias.scope !15, !noalias !17
  %index.next106 = add i64 %index105, 2
  %40 = icmp eq i64 %index.next106, %n.vec76
  br i1 %40, label %middle.block71, label %vector.body70, !llvm.loop !18

middle.block71:                                   ; preds = %vector.body70
  %41 = icmp eq i64 %45, %n.vec76
  br i1 %41, label %for.cond9.for.end39_crit_edge.us26, label %for.body11.us5.preheader

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond6.for.end42_crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond6.for.end42_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond6.for.end42_crit_edge.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %42 = add i64 %indvars.iv45, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 0
  %43 = mul i64 %indvars.iv45, 1201
  %44 = add i64 %43, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %44
  %45 = add i64 %indvars.iv45, 1
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %46 = trunc i64 %indvars.iv.next46 to i32
  %xtraiter = and i32 %46, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv.prol
  %47 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %47, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !19

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %48 = icmp ult i64 %indvars.iv45, 3
  br i1 %48, label %for.cond9.preheader.us21.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %49 = sub i64 %42, %indvars.iv.unr
  %50 = lshr i64 %49, 2
  %51 = add nuw nsw i64 %50, 1
  %min.iters.check117 = icmp ult i64 %51, 2
  br i1 %min.iters.check117, label %for.body3.us.preheader140, label %min.iters.checked118

for.body3.us.preheader140:                        ; preds = %middle.block115, %min.iters.checked118, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked118 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end126, %middle.block115 ]
  br label %for.body3.us

min.iters.checked118:                             ; preds = %for.body3.us.preheader
  %n.mod.vf119 = and i64 %51, 1
  %n.vec120 = sub nsw i64 %51, %n.mod.vf119
  %cmp.zero121 = icmp eq i64 %n.vec120, 0
  %52 = add i64 %indvars.iv.unr, 4
  %53 = shl nuw i64 %50, 2
  %54 = add i64 %52, %53
  %55 = shl nuw nsw i64 %n.mod.vf119, 2
  %ind.end126 = sub i64 %54, %55
  br i1 %cmp.zero121, label %for.body3.us.preheader140, label %vector.ph122

vector.ph122:                                     ; preds = %min.iters.checked118
  br label %vector.body114

vector.body114:                                   ; preds = %vector.body114, %vector.ph122
  %index123 = phi i64 [ 0, %vector.ph122 ], [ %index.next124, %vector.body114 ]
  %56 = shl i64 %index123, 2
  %57 = add i64 %indvars.iv.unr, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %57
  %59 = bitcast double* %58 to <8 x double>*
  %wide.vec132 = load <8 x double>, <8 x double>* %59, align 8
  %strided.vec133 = shufflevector <8 x double> %wide.vec132, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec134 = shufflevector <8 x double> %wide.vec132, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec135 = shufflevector <8 x double> %wide.vec132, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec136 = shufflevector <8 x double> %wide.vec132, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %60 = fmul <2 x double> %strided.vec133, %broadcast.splat138
  %61 = fmul <2 x double> %strided.vec134, %broadcast.splat138
  %62 = fmul <2 x double> %strided.vec135, %broadcast.splat138
  %63 = add nsw i64 %57, 3
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %63
  %65 = fmul <2 x double> %strided.vec136, %broadcast.splat138
  %66 = getelementptr double, double* %64, i64 -3
  %67 = bitcast double* %66 to <8 x double>*
  %68 = shufflevector <2 x double> %60, <2 x double> %61, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %69 = shufflevector <2 x double> %62, <2 x double> %65, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec139 = shufflevector <4 x double> %68, <4 x double> %69, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec139, <8 x double>* %67, align 8
  %index.next124 = add i64 %index123, 2
  %70 = icmp eq i64 %index.next124, %n.vec120
  br i1 %70, label %middle.block115, label %vector.body114, !llvm.loop !21

middle.block115:                                  ; preds = %vector.body114
  %cmp.n127 = icmp eq i64 %n.mod.vf119, 0
  br i1 %cmp.n127, label %for.cond9.preheader.us21.preheader, label %for.body3.us.preheader140

for.cond9.for.end39_crit_edge.us26.loopexit:      ; preds = %for.body11.us5
  br label %for.cond9.for.end39_crit_edge.us26

for.cond9.for.end39_crit_edge.us26:               ; preds = %for.cond9.for.end39_crit_edge.us26.loopexit, %middle.block71
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %for.cond6.for.end42_crit_edge.us, label %for.cond9.preheader.us21

for.cond6.for.end42_crit_edge.us:                 ; preds = %for.cond9.for.end39_crit_edge.us26
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.preheader, %for.end42
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.end42 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.end42 ], [ 1, %for.body3.lr.ph.preheader ]
  %71 = add i64 %indvars.iv59, -3
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %72 = trunc i64 %indvars.iv.next60 to i32
  %xtraiter54 = and i32 %72, 3
  %lcmp.mod55 = icmp eq i32 %xtraiter54, 0
  br i1 %lcmp.mod55, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv49.prol = phi i64 [ %indvars.iv.next50.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter56 = phi i32 [ %prol.iter56.sub, %for.body3.prol ], [ %xtraiter54, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv49.prol
  %73 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %73, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next50.prol = add nuw nsw i64 %indvars.iv49.prol, 1
  %prol.iter56.sub = add i32 %prol.iter56, -1
  %prol.iter56.cmp = icmp eq i32 %prol.iter56.sub, 0
  br i1 %prol.iter56.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !22

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv49.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next50.prol, %for.body3.prol.loopexit.loopexit ]
  %74 = icmp ult i64 %indvars.iv59, 3
  br i1 %74, label %for.end42, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %75 = sub i64 %71, %indvars.iv49.unr
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %76, 1
  %min.iters.check = icmp ult i64 %77, 2
  br i1 %min.iters.check, label %for.body3.preheader141, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %77, 1
  %n.vec = sub nsw i64 %77, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %78 = add i64 %indvars.iv49.unr, 4
  %79 = shl nuw i64 %76, 2
  %80 = add i64 %78, %79
  %81 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %80, %81
  br i1 %cmp.zero, label %for.body3.preheader141, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %82 = shl i64 %index, 2
  %83 = add i64 %indvars.iv49.unr, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %83
  %85 = bitcast double* %84 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %85, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec67 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %86 = fmul <2 x double> %strided.vec, %broadcast.splat69
  %87 = fmul <2 x double> %strided.vec65, %broadcast.splat69
  %88 = fmul <2 x double> %strided.vec66, %broadcast.splat69
  %89 = add nsw i64 %83, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %89
  %91 = fmul <2 x double> %strided.vec67, %broadcast.splat69
  %92 = getelementptr double, double* %90, i64 -3
  %93 = bitcast double* %92 to <8 x double>*
  %94 = shufflevector <2 x double> %86, <2 x double> %87, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %95 = shufflevector <2 x double> %88, <2 x double> %91, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %94, <4 x double> %95, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %93, align 8
  %index.next = add i64 %index, 2
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end42, label %for.body3.preheader141

for.body3.preheader141:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv49.ph = phi i64 [ %indvars.iv49.unr, %min.iters.checked ], [ %indvars.iv49.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader141, %for.body3
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.3, %for.body3 ], [ %indvars.iv49.ph, %for.body3.preheader141 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv49
  %97 = load double, double* %arrayidx5, align 8
  %mul = fmul double %97, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv.next50
  %98 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %98, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv.next50.1
  %99 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %99, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next50.2 = add nsw i64 %indvars.iv49, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv.next50.2
  %100 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %100, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next50.3 = add nsw i64 %indvars.iv49, 4
  %exitcond53.3 = icmp eq i64 %indvars.iv.next50.3, %indvars.iv57
  br i1 %exitcond53.3, label %for.end42.loopexit, label %for.body3, !llvm.loop !24

for.end42.loopexit:                               ; preds = %for.body3
  br label %for.end42

for.end42:                                        ; preds = %for.end42.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %for.end45.loopexit143, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.end42_crit_edge.us
  br label %for.end45

for.end45.loopexit143:                            ; preds = %for.end42
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit143, %for.end45.loopexit, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count7 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next5, %for.cond2.for.end_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv4, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv4, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next5, %wide.trip.count7
  br i1 %exitcond8, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

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
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count27 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
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
  %indvars.iv14 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
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
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
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
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count68 = zext i32 %n to i64
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count50 = zext i32 %m to i64
  %wide.trip.count57 = zext i32 %n to i64
  %broadcast.splatinsert118 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat119 = shufflevector <2 x double> %broadcast.splatinsert118, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert140 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat141 = shufflevector <2 x double> %broadcast.splatinsert140, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv53
  br i1 %exitcond, label %for.cond9.preheader.us12.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us12.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us12.preheader

for.cond9.preheader.us12.preheader:               ; preds = %for.cond9.preheader.us12.preheader.loopexit, %middle.block122
  %min.iters.check79 = icmp ult i64 %41, 2
  %n.vec82 = and i64 %41, -2
  %cmp.zero83 = icmp eq i64 %n.vec82, 0
  %cmp.n114 = icmp eq i64 %41, %n.vec82
  br label %for.cond9.preheader.us12

for.cond9.preheader.us12:                         ; preds = %for.cond9.preheader.us12.preheader, %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond9.for.inc40_crit_edge.us35 ], [ 0, %for.cond9.preheader.us12.preheader ]
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv48
  %1 = add i64 %indvars.iv48, 1
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %1
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv48
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv55, i64 %1
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv48
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv48
  br i1 %min.iters.check79, label %for.body11.us14.preheader, label %min.iters.checked80

min.iters.checked80:                              ; preds = %for.cond9.preheader.us12
  br i1 %cmp.zero83, label %for.body11.us14.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked80
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep86
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %scevgep90
  %bound198 = icmp ult double* %scevgep88, %scevgep86
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  %bound0100 = icmp ult double* %scevgep, %scevgep94
  %bound1101 = icmp ult double* %scevgep92, %scevgep86
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %conflict.rdx, %found.conflict102
  %bound0106 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound1107 = icmp ult double* %arrayidx20.us33, %scevgep86
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx109 = or i1 %conflict.rdx103, %found.conflict108
  br i1 %conflict.rdx109, label %for.body11.us14.preheader, label %vector.ph110

vector.ph110:                                     ; preds = %vector.memcheck
  %2 = load double, double* %arrayidx20.us33, align 8, !alias.scope !5
  %3 = insertelement <2 x double> undef, double %2, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = load double, double* %arrayidx30.us34, align 8, !alias.scope !8
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76, %vector.ph110
  %index111 = phi i64 [ 0, %vector.ph110 ], [ %index.next112, %vector.body76 ]
  %8 = or i64 %index111, 1
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index111, i64 %indvars.iv48
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %8, i64 %indvars.iv48
  %11 = load double, double* %9, align 8, !alias.scope !10
  %12 = load double, double* %10, align 8, !alias.scope !10
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, %broadcast.splat119
  %16 = fmul <2 x double> %15, %4
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index111, i64 %indvars.iv48
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %8, i64 %indvars.iv48
  %19 = load double, double* %17, align 8, !alias.scope !12
  %20 = load double, double* %18, align 8, !alias.scope !12
  %21 = insertelement <2 x double> undef, double %19, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, %broadcast.splat119
  %24 = fmul <2 x double> %23, %7
  %25 = fadd <2 x double> %16, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %index111
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !14, !noalias !16
  %28 = fadd <2 x double> %wide.load120, %25
  %29 = bitcast double* %26 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8, !alias.scope !14, !noalias !16
  %index.next112 = add i64 %index111, 2
  %30 = icmp eq i64 %index.next112, %n.vec82
  br i1 %30, label %middle.block77, label %vector.body76, !llvm.loop !17

middle.block77:                                   ; preds = %vector.body76
  br i1 %cmp.n114, label %for.cond9.for.inc40_crit_edge.us35, label %for.body11.us14.preheader

for.body11.us14.preheader:                        ; preds = %middle.block77, %vector.memcheck, %min.iters.checked80, %for.cond9.preheader.us12
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked80 ], [ 0, %for.cond9.preheader.us12 ], [ %n.vec82, %middle.block77 ]
  br label %for.body11.us14

for.body11.us14:                                  ; preds = %for.body11.us14.preheader, %for.body11.us14
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.body11.us14 ], [ %indvars.iv42.ph, %for.body11.us14.preheader ]
  %arrayidx15.us17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv48
  %31 = load double, double* %arrayidx15.us17, align 8
  %mul16.us18 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx20.us33, align 8
  %mul21.us19 = fmul double %mul16.us18, %32
  %arrayidx25.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv48
  %33 = load double, double* %arrayidx25.us20, align 8
  %mul26.us21 = fmul double %33, %alpha
  %34 = load double, double* %arrayidx30.us34, align 8
  %mul31.us22 = fmul double %mul26.us21, %34
  %add.us23 = fadd double %mul21.us19, %mul31.us22
  %arrayidx35.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv42
  %35 = load double, double* %arrayidx35.us24, align 8
  %add36.us25 = fadd double %35, %add.us23
  store double %add36.us25, double* %arrayidx35.us24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next43, %indvars.iv53
  br i1 %exitcond47, label %for.cond9.for.inc40_crit_edge.us35.loopexit, label %for.body11.us14, !llvm.loop !18

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us, %for.body3.lr.ph.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %36 = add i64 %indvars.iv55, -3
  %37 = lshr i64 %36, 2
  %38 = add i64 %indvars.iv55, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 0
  %39 = mul i64 %indvars.iv55, 1201
  %40 = add i64 %39, 1
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %40
  %41 = add i64 %indvars.iv55, 1
  %min.iters.check124 = icmp ult i64 %38, 4
  br i1 %min.iters.check124, label %for.body3.us.preheader, label %min.iters.checked125

for.body3.us.preheader:                           ; preds = %middle.block122, %min.iters.checked125, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked125 ], [ 0, %for.body3.lr.ph.us ], [ %n.vec127, %middle.block122 ]
  br label %for.body3.us

min.iters.checked125:                             ; preds = %for.body3.lr.ph.us
  %n.vec127 = and i64 %38, -4
  %cmp.zero128 = icmp eq i64 %n.vec127, 0
  br i1 %cmp.zero128, label %for.body3.us.preheader, label %vector.ph129

vector.ph129:                                     ; preds = %min.iters.checked125
  %42 = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %42, 0
  br i1 %lcmp.mod, label %vector.body121.prol.preheader, label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.preheader:                    ; preds = %vector.ph129
  br label %vector.body121.prol

vector.body121.prol:                              ; preds = %vector.body121.prol.preheader
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 0
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load138.prol = load <2 x double>, <2 x double>* %44, align 8
  %45 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load139.prol = load <2 x double>, <2 x double>* %46, align 8
  %47 = fmul <2 x double> %wide.load138.prol, %broadcast.splat141
  %48 = fmul <2 x double> %wide.load139.prol, %broadcast.splat141
  %49 = bitcast double* %43 to <2 x double>*
  store <2 x double> %47, <2 x double>* %49, align 8
  %50 = bitcast double* %45 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8
  br label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.loopexit.unr-lcssa:           ; preds = %vector.ph129, %vector.body121.prol
  %index130.unr.ph = phi i64 [ 4, %vector.body121.prol ], [ 0, %vector.ph129 ]
  br label %vector.body121.prol.loopexit

vector.body121.prol.loopexit:                     ; preds = %vector.body121.prol.loopexit.unr-lcssa
  %51 = icmp eq i64 %37, 0
  br i1 %51, label %middle.block122, label %vector.ph129.new

vector.ph129.new:                                 ; preds = %vector.body121.prol.loopexit
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121, %vector.ph129.new
  %index130 = phi i64 [ %index130.unr.ph, %vector.ph129.new ], [ %index.next131.1, %vector.body121 ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %index130
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %53, align 8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %55, align 8
  %56 = fmul <2 x double> %wide.load138, %broadcast.splat141
  %57 = fmul <2 x double> %wide.load139, %broadcast.splat141
  %58 = bitcast double* %52 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8
  %59 = bitcast double* %54 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8
  %index.next131 = add i64 %index130, 4
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %index.next131
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load138.1 = load <2 x double>, <2 x double>* %61, align 8
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load139.1 = load <2 x double>, <2 x double>* %63, align 8
  %64 = fmul <2 x double> %wide.load138.1, %broadcast.splat141
  %65 = fmul <2 x double> %wide.load139.1, %broadcast.splat141
  %66 = bitcast double* %60 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8
  %67 = bitcast double* %62 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8
  %index.next131.1 = add i64 %index130, 8
  %68 = icmp eq i64 %index.next131.1, %n.vec127
  br i1 %68, label %middle.block122.unr-lcssa, label %vector.body121, !llvm.loop !19

middle.block122.unr-lcssa:                        ; preds = %vector.body121
  br label %middle.block122

middle.block122:                                  ; preds = %vector.body121.prol.loopexit, %middle.block122.unr-lcssa
  %cmp.n133 = icmp eq i64 %38, %n.vec127
  br i1 %cmp.n133, label %for.cond9.preheader.us12.preheader, label %for.body3.us.preheader

for.cond9.for.inc40_crit_edge.us35.loopexit:      ; preds = %for.body11.us14
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.for.inc40_crit_edge.us35:               ; preds = %for.cond9.for.inc40_crit_edge.us35.loopexit, %middle.block77
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond51, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us12

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br i1 %exitcond58, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.body3.lr.ph.preheader
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc43 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc43 ], [ 1, %for.body3.lr.ph.preheader ]
  %69 = add i64 %indvars.iv66, -3
  %70 = lshr i64 %69, 2
  %71 = add i64 %indvars.iv66, 1
  %min.iters.check = icmp ult i64 %71, 4
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.lr.ph
  %n.vec = and i64 %71, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %72 = and i64 %70, 1
  %lcmp.mod144 = icmp eq i64 %72, 0
  br i1 %lcmp.mod144, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 0
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %74, align 8
  %75 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load73.prol = load <2 x double>, <2 x double>* %76, align 8
  %77 = fmul <2 x double> %wide.load.prol, %broadcast.splat75
  %78 = fmul <2 x double> %wide.load73.prol, %broadcast.splat75
  %79 = bitcast double* %73 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8
  %80 = bitcast double* %75 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %81 = icmp eq i64 %70, 0
  br i1 %81, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %index
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %83, align 8
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %85, align 8
  %86 = fmul <2 x double> %wide.load, %broadcast.splat75
  %87 = fmul <2 x double> %wide.load73, %broadcast.splat75
  %88 = bitcast double* %82 to <2 x double>*
  store <2 x double> %86, <2 x double>* %88, align 8
  %89 = bitcast double* %84 to <2 x double>*
  store <2 x double> %87, <2 x double>* %89, align 8
  %index.next = add i64 %index, 4
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %index.next
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %91, align 8
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load73.1 = load <2 x double>, <2 x double>* %93, align 8
  %94 = fmul <2 x double> %wide.load.1, %broadcast.splat75
  %95 = fmul <2 x double> %wide.load73.1, %broadcast.splat75
  %96 = bitcast double* %90 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8
  %97 = bitcast double* %92 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8
  %index.next.1 = add i64 %index, 8
  %98 = icmp eq i64 %index.next.1, %n.vec
  br i1 %98, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %71, %n.vec
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body3.lr.ph
  %indvars.iv59.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body3.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.body3 ], [ %indvars.iv59.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv59
  %99 = load double, double* %arrayidx5, align 8
  %mul = fmul double %99, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next60, %indvars.iv64
  br i1 %exitcond63, label %for.inc43.loopexit, label %for.body3, !llvm.loop !21

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  br i1 %exitcond69, label %for.end45.loopexit142, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit142:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit142, %for.end45.loopexit, %entry
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

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
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
!19 = distinct !{!19, !3, !4}
!20 = distinct !{!20, !3, !4}
!21 = distinct !{!21, !2, !3, !4}

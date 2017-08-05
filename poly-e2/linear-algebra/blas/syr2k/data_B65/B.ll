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
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  tail call fastcc void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv1121.us = phi i64 [ %indvars.iv.next12.us, %for.cond1.for.inc17_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv519.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next6.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv519.us, %indvars.iv1121.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1121.us, i64 %indvars.iv519.us
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1121.us, i64 %indvars.iv519.us
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv519.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond25, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond26, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv316.us = phi i64 [ %indvars.iv.next4.us, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next.us, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv14.us, %indvars.iv316.us
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv316.us, i64 %indvars.iv14.us
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert73 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat74 = shufflevector <2 x double> %broadcast.splatinsert73, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert48 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat49 = shufflevector <2 x double> %broadcast.splatinsert48, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %indvars.iv1320.us = phi i64 [ %indvars.iv.next14.us, %for.cond6.for.inc43_crit_edge.us ], [ 0, %entry ]
  %0 = add i64 %indvars.iv1320.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %1 = mul i64 %indvars.iv1320.us, 1201
  %2 = add i64 %1, 1
  %scevgep16 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %2
  %3 = add i64 %indvars.iv1320.us, 1
  %4 = add i64 %indvars.iv1320.us, 1
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv15.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us.prol
  %5 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %5, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv15.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv15.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.us.prol, %for.body3.us.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %indvars.iv1320.us, 3
  br i1 %6, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %7 = sub i64 %0, %indvars.iv15.us.unr
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check53 = icmp ult i64 %9, 2
  br i1 %min.iters.check53, label %for.body3.us.preheader76, label %min.iters.checked54

min.iters.checked54:                              ; preds = %for.body3.us.preheader
  %n.mod.vf55 = and i64 %9, 1
  %n.vec56 = sub nsw i64 %9, %n.mod.vf55
  %cmp.zero57 = icmp eq i64 %n.vec56, 0
  %10 = add i64 %indvars.iv15.us.unr, 4
  %11 = shl nuw i64 %8, 2
  %12 = add i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf55, 2
  %ind.end62 = sub i64 %12, %13
  br i1 %cmp.zero57, label %for.body3.us.preheader76, label %vector.ph58

vector.ph58:                                      ; preds = %min.iters.checked54
  br label %vector.body50

vector.body50:                                    ; preds = %vector.body50, %vector.ph58
  %index59 = phi i64 [ 0, %vector.ph58 ], [ %index.next60, %vector.body50 ]
  %14 = shl i64 %index59, 2
  %15 = add i64 %indvars.iv15.us.unr, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %15
  %17 = bitcast double* %16 to <8 x double>*
  %wide.vec68 = load <8 x double>, <8 x double>* %17, align 8
  %strided.vec69 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec70 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec71 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec72 = shufflevector <8 x double> %wide.vec68, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %18 = fmul <2 x double> %strided.vec69, %broadcast.splat74
  %19 = fmul <2 x double> %strided.vec70, %broadcast.splat74
  %20 = fmul <2 x double> %strided.vec71, %broadcast.splat74
  %21 = add nsw i64 %15, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %21
  %23 = fmul <2 x double> %strided.vec72, %broadcast.splat74
  %24 = getelementptr double, double* %22, i64 -3
  %25 = bitcast double* %24 to <8 x double>*
  %26 = shufflevector <2 x double> %18, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %20, <2 x double> %23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec75 = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec75, <8 x double>* %25, align 8
  %index.next60 = add i64 %index59, 2
  %28 = icmp eq i64 %index.next60, %n.vec56
  br i1 %28, label %middle.block51, label %vector.body50, !llvm.loop !3

middle.block51:                                   ; preds = %vector.body50
  %cmp.n63 = icmp eq i64 %n.mod.vf55, 0
  br i1 %cmp.n63, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader76

for.body3.us.preheader76:                         ; preds = %middle.block51, %min.iters.checked54, %for.body3.us.preheader
  %indvars.iv15.us.ph = phi i64 [ %indvars.iv15.us.unr, %min.iters.checked54 ], [ %indvars.iv15.us.unr, %for.body3.us.preheader ], [ %ind.end62, %middle.block51 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader76, %for.body3.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next.us.3, %for.body3.us ], [ %indvars.iv15.us.ph, %for.body3.us.preheader76 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us
  %29 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %29, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us
  %30 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %30, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv15.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1
  %31 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %31, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv15.us, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.2
  %32 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %32, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv15.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1122.us
  br i1 %exitcond.us.3, label %for.cond9.preheader.us.preheader.loopexit, label %for.body3.us, !llvm.loop !6

for.cond9.preheader.us.preheader.loopexit:        ; preds = %for.body3.us
  br label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond9.preheader.us.preheader.loopexit, %middle.block51, %for.body3.us.prol.loopexit
  %min.iters.check9 = icmp ult i64 %3, 2
  %n.vec12 = and i64 %3, -2
  %cmp.zero13 = icmp eq i64 %n.vec12, 0
  %cmp.n44 = icmp eq i64 %3, %n.vec12
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc40.us
  %indvars.iv918.us = phi i64 [ %indvars.iv.next10.us, %for.inc40.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv918.us
  %33 = add i64 %indvars.iv918.us, 1
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %33
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv918.us
  %scevgep24 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %33
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  %arrayidx30.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  br i1 %min.iters.check9, label %for.body11.us.preheader, label %min.iters.checked10

min.iters.checked10:                              ; preds = %for.cond9.preheader.us
  br i1 %cmp.zero13, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked10
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us
  %bound1 = icmp ult double* %arrayidx30.us, %scevgep16
  %found.conflict = and i1 %bound0, %bound1
  %bound027 = icmp ult double* %scevgep, %scevgep20
  %bound128 = icmp ult double* %scevgep18, %scevgep16
  %found.conflict29 = and i1 %bound027, %bound128
  %conflict.rdx = or i1 %found.conflict, %found.conflict29
  %bound030 = icmp ult double* %scevgep, %scevgep24
  %bound131 = icmp ult double* %scevgep22, %scevgep16
  %found.conflict32 = and i1 %bound030, %bound131
  %conflict.rdx33 = or i1 %conflict.rdx, %found.conflict32
  %bound036 = icmp ult double* %scevgep, %arrayidx20.us
  %bound137 = icmp ult double* %arrayidx20.us, %scevgep16
  %found.conflict38 = and i1 %bound036, %bound137
  %conflict.rdx39 = or i1 %conflict.rdx33, %found.conflict38
  br i1 %conflict.rdx39, label %for.body11.us.preheader, label %vector.ph40

vector.ph40:                                      ; preds = %vector.memcheck
  %34 = load double, double* %arrayidx20.us, align 8, !alias.scope !8
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = load double, double* %arrayidx30.us, align 8, !alias.scope !11
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body6

vector.body6:                                     ; preds = %vector.body6, %vector.ph40
  %index41 = phi i64 [ 0, %vector.ph40 ], [ %index.next42, %vector.body6 ]
  %40 = or i64 %index41, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index41, i64 %indvars.iv918.us
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %40, i64 %indvars.iv918.us
  %43 = load double, double* %41, align 8, !alias.scope !13
  %44 = load double, double* %42, align 8, !alias.scope !13
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat49
  %48 = fmul <2 x double> %47, %36
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index41, i64 %indvars.iv918.us
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %40, i64 %indvars.iv918.us
  %51 = load double, double* %49, align 8, !alias.scope !15
  %52 = load double, double* %50, align 8, !alias.scope !15
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat49
  %56 = fmul <2 x double> %55, %39
  %57 = fadd <2 x double> %48, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index41
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !19
  %60 = fadd <2 x double> %wide.load, %57
  %61 = bitcast double* %58 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8, !alias.scope !17, !noalias !19
  %index.next42 = add i64 %index41, 2
  %62 = icmp eq i64 %index.next42, %n.vec12
  br i1 %62, label %middle.block7, label %vector.body6, !llvm.loop !20

middle.block7:                                    ; preds = %vector.body6
  br i1 %cmp.n44, label %for.inc40.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block7, %vector.memcheck, %min.iters.checked10, %for.cond9.preheader.us
  %indvars.iv316.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked10 ], [ 0, %for.cond9.preheader.us ], [ %n.vec12, %middle.block7 ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv316.us = phi i64 [ %indvars.iv.next4.us, %for.body11.us ], [ %indvars.iv316.us.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %63 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %63, %alpha
  %64 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %64
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %65 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %65, %alpha
  %66 = load double, double* %arrayidx30.us, align 8
  %mul31.us = fmul double %mul26.us, %66
  %add.us = fadd double %mul21.us, %mul31.us
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us
  %67 = load double, double* %arrayidx35.us, align 8
  %add36.us = fadd double %67, %add.us
  store double %add36.us, double* %arrayidx35.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %exitcond8.us = icmp eq i64 %indvars.iv.next4.us, %indvars.iv1122.us
  br i1 %exitcond8.us, label %for.inc40.us.loopexit, label %for.body11.us, !llvm.loop !21

for.inc40.us.loopexit:                            ; preds = %for.body11.us
  br label %for.inc40.us

for.inc40.us:                                     ; preds = %for.inc40.us.loopexit, %middle.block7
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv918.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond25, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.inc40.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1320.us, 1
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next14.us, 1200
  br i1 %exitcond26, label %for.end45, label %for.cond1.preheader.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv28.us, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv6.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next3.us, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}

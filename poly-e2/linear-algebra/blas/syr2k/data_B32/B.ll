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
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv2939.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next30.us, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv2437.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next25.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv2437.us, %indvars.iv2939.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2939.us, i64 %indvars.iv2437.us
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv2939.us, i64 %indvars.iv2437.us
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2437.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next25.us, 1000
  br i1 %exitcond43, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2939.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next30.us, 1200
  br i1 %exitcond44, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv2234.us = phi i64 [ %indvars.iv.next23.us, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv32.us = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next.us, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv32.us, %indvars.iv2234.us
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2234.us, i64 %indvars.iv32.us
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv32.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv2234.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next23.us, 1200
  br i1 %exitcond, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert78 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat79 = shufflevector <2 x double> %broadcast.splatinsert78, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond6.for.inc43_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv3344.us = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34.us, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv3542.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %3, %for.cond6.for.inc43_crit_edge.us ]
  %0 = add i64 %indvars.iv3542.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 0
  %1 = mul i64 %indvars.iv3542.us, 1201
  %2 = add i64 %1, 1
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %2
  %3 = add i64 %indvars.iv3542.us, 1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv37.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv37.us.prol
  %4 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %4, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv37.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv37.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.us.prol, %for.body3.us.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %indvars.iv3542.us, 3
  br i1 %5, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %6 = sub i64 %0, %indvars.iv37.us.unr
  %7 = lshr i64 %6, 2
  %8 = add nuw nsw i64 %7, 1
  %min.iters.check83 = icmp ult i64 %8, 2
  br i1 %min.iters.check83, label %for.body3.us.preheader101, label %min.iters.checked84

min.iters.checked84:                              ; preds = %for.body3.us.preheader
  %n.mod.vf85 = and i64 %8, 1
  %n.vec86 = sub nsw i64 %8, %n.mod.vf85
  %cmp.zero87 = icmp eq i64 %n.vec86, 0
  %9 = add i64 %indvars.iv37.us.unr, 4
  %10 = shl nuw i64 %7, 2
  %11 = add i64 %9, %10
  %12 = shl nuw nsw i64 %n.mod.vf85, 2
  %ind.end = sub i64 %11, %12
  br i1 %cmp.zero87, label %for.body3.us.preheader101, label %vector.ph88

vector.ph88:                                      ; preds = %min.iters.checked84
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80, %vector.ph88
  %index89 = phi i64 [ 0, %vector.ph88 ], [ %index.next90, %vector.body80 ]
  %13 = shl i64 %index89, 2
  %14 = add i64 %indvars.iv37.us.unr, %13
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %14
  %16 = bitcast double* %15 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %16, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec97 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec98 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %17 = fmul <2 x double> %strided.vec, %broadcast.splat100
  %18 = fmul <2 x double> %strided.vec96, %broadcast.splat100
  %19 = fmul <2 x double> %strided.vec97, %broadcast.splat100
  %20 = add nsw i64 %14, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %20
  %22 = fmul <2 x double> %strided.vec98, %broadcast.splat100
  %23 = getelementptr double, double* %21, i64 -3
  %24 = bitcast double* %23 to <8 x double>*
  %25 = shufflevector <2 x double> %17, <2 x double> %18, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %26 = shufflevector <2 x double> %19, <2 x double> %22, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %25, <4 x double> %26, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %24, align 8
  %index.next90 = add i64 %index89, 2
  %27 = icmp eq i64 %index.next90, %n.vec86
  br i1 %27, label %middle.block81, label %vector.body80, !llvm.loop !3

middle.block81:                                   ; preds = %vector.body80
  %cmp.n92 = icmp eq i64 %n.mod.vf85, 0
  br i1 %cmp.n92, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader101

for.body3.us.preheader101:                        ; preds = %middle.block81, %min.iters.checked84, %for.body3.us.preheader
  %indvars.iv37.us.ph = phi i64 [ %indvars.iv37.us.unr, %min.iters.checked84 ], [ %indvars.iv37.us.unr, %for.body3.us.preheader ], [ %ind.end, %middle.block81 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader101, %for.body3.us
  %indvars.iv37.us = phi i64 [ %indvars.iv.next.us.3, %for.body3.us ], [ %indvars.iv37.us.ph, %for.body3.us.preheader101 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv37.us
  %28 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %28, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv37.us, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv.next.us
  %29 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %29, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv37.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv.next.us.1
  %30 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %30, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv37.us, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv.next.us.2
  %31 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %31, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv37.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv3344.us
  br i1 %exitcond.us.3, label %for.cond9.preheader.us.preheader.loopexit, label %for.body3.us, !llvm.loop !6

for.cond9.preheader.us.preheader.loopexit:        ; preds = %for.body3.us
  br label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond9.preheader.us.preheader.loopexit, %middle.block81, %for.body3.us.prol.loopexit
  %min.iters.check = icmp ult i64 %3, 2
  %n.vec = and i64 %3, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc40.us
  %indvars.iv3140.us = phi i64 [ %32, %for.inc40.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %scevgep56 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv3140.us
  %32 = add i64 %indvars.iv3140.us, 1
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv3542.us, i64 %32
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv3140.us
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv3542.us, i64 %32
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv3542.us, i64 %indvars.iv3140.us
  %arrayidx30.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3542.us, i64 %indvars.iv3140.us
  br i1 %min.iters.check, label %for.body11.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us
  br i1 %cmp.zero, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us
  %bound1 = icmp ult double* %arrayidx30.us, %scevgep54
  %found.conflict = and i1 %bound0, %bound1
  %bound065 = icmp ult double* %scevgep, %scevgep58
  %bound166 = icmp ult double* %scevgep56, %scevgep54
  %found.conflict67 = and i1 %bound065, %bound166
  %conflict.rdx = or i1 %found.conflict, %found.conflict67
  %bound068 = icmp ult double* %scevgep, %scevgep62
  %bound169 = icmp ult double* %scevgep60, %scevgep54
  %found.conflict70 = and i1 %bound068, %bound169
  %conflict.rdx71 = or i1 %conflict.rdx, %found.conflict70
  %bound074 = icmp ult double* %scevgep, %arrayidx20.us
  %bound175 = icmp ult double* %arrayidx20.us, %scevgep54
  %found.conflict76 = and i1 %bound074, %bound175
  %conflict.rdx77 = or i1 %conflict.rdx71, %found.conflict76
  br i1 %conflict.rdx77, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %33 = or i64 %index, 1
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv3140.us
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %33, i64 %indvars.iv3140.us
  %36 = load double, double* %34, align 8, !alias.scope !8
  %37 = load double, double* %35, align 8, !alias.scope !8
  %38 = insertelement <2 x double> undef, double %36, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fmul <2 x double> %39, %broadcast.splat79
  %41 = load double, double* %arrayidx20.us, align 8, !alias.scope !11
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = fmul <2 x double> %40, %43
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv3140.us
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %33, i64 %indvars.iv3140.us
  %47 = load double, double* %45, align 8, !alias.scope !13
  %48 = load double, double* %46, align 8, !alias.scope !13
  %49 = insertelement <2 x double> undef, double %47, i32 0
  %50 = insertelement <2 x double> %49, double %48, i32 1
  %51 = fmul <2 x double> %50, %broadcast.splat79
  %52 = load double, double* %arrayidx30.us, align 8, !alias.scope !15
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = fmul <2 x double> %51, %54
  %56 = fadd <2 x double> %44, %55
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %index
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !17, !noalias !19
  %59 = fadd <2 x double> %wide.load, %56
  store <2 x double> %59, <2 x double>* %58, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %60 = icmp eq i64 %index.next, %n.vec
  br i1 %60, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us
  %indvars.iv2538.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv2538.us = phi i64 [ %indvars.iv.next26.us, %for.body11.us ], [ %indvars.iv2538.us.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2538.us, i64 %indvars.iv3140.us
  %61 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %61, %alpha
  %62 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %62
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv2538.us, i64 %indvars.iv3140.us
  %63 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %63, %alpha
  %64 = load double, double* %arrayidx30.us, align 8
  %mul31.us = fmul double %mul26.us, %64
  %add.us = fadd double %mul21.us, %mul31.us
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3542.us, i64 %indvars.iv2538.us
  %65 = load double, double* %arrayidx35.us, align 8
  %add36.us = fadd double %65, %add.us
  store double %add36.us, double* %arrayidx35.us, align 8
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2538.us, 1
  %exitcond30.us = icmp eq i64 %indvars.iv.next26.us, %indvars.iv3344.us
  br i1 %exitcond30.us, label %for.inc40.us.loopexit, label %for.body11.us, !llvm.loop !21

for.inc40.us.loopexit:                            ; preds = %for.body11.us
  br label %for.inc40.us

for.inc40.us:                                     ; preds = %for.inc40.us.loopexit, %middle.block
  %exitcond47 = icmp eq i64 %32, 1000
  br i1 %exitcond47, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.inc40.us
  %indvars.iv.next34.us = add nuw nsw i64 %indvars.iv3344.us, 1
  %exitcond48 = icmp eq i64 %3, 1200
  br i1 %exitcond48, label %for.end45, label %for.cond1.preheader.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv814.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv814.us, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv12.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv814.us, i64 %indvars.iv12.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv814.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next9.us, 1200
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
!19 = !{!16, !9, !14, !12}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}

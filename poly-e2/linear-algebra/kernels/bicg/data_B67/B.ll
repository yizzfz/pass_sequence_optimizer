; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %arraydecay62 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %arraydecay1, double* %arraydecay5, double* %arraydecay62)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay84 = bitcast i8* %call1 to double*
  %arraydecay95 = bitcast i8* %call2 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %arraydecay1, double* %arraydecay84, double* %arraydecay95, double* %arraydecay62, double* %arraydecay5)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  %2 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %2, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.inc.lr.ph, label %for.cond2.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %m to double
  %xtraiter26 = and i32 %m, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %inc13.unr = phi i32 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %0 = icmp eq i32 %m, 1
  br i1 %0, label %for.cond2.preheader, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond2.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %for.inc.prol.loopexit, %entry
  %cmp36 = icmp sgt i32 %n, 0
  br i1 %cmp36, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %1 = icmp sgt i32 %m, 0
  %wide.trip.count = zext i32 %m to i64
  %2 = sext i32 %n to i64
  %conv18 = sitofp i32 %n to double
  br i1 %1, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %xtraiter24 = and i32 %n, 1
  %lcmp.mod25 = icmp eq i32 %xtraiter24, 0
  br i1 %lcmp.mod25, label %for.body5.prol.loopexit, label %for.body5.prol.preheader

for.body5.prol.preheader:                         ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv18
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol.preheader
  %.unr = phi i32 [ 1, %for.body5.prol.preheader ], [ 0, %for.body5.preheader ]
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %for.end29, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i64 %wide.trip.count, 1
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.cond12.for.inc27_crit_edge.us, %for.body5.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next18, %for.cond12.for.inc27_crit_edge.us ]
  %storemerge17.us = phi i32 [ 0, %for.body5.us.preheader ], [ %12, %for.cond12.for.inc27_crit_edge.us ]
  %4 = icmp eq i64 %xtraiter, 0
  %rem6.us = srem i32 %storemerge17.us, %n
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, %conv18
  %idxprom10.us = sext i32 %storemerge17.us to i64
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %idxprom10.us
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %4, label %for.inc24.us.prol.loopexit.unr-lcssa, label %for.inc24.us.prol.preheader

for.inc24.us.prol.preheader:                      ; preds = %for.body5.us
  %5 = trunc i64 %indvars.iv17 to i32
  %rem16.us.prol = srem i32 %5, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit.unr-lcssa

for.inc24.us.prol.loopexit.unr-lcssa:             ; preds = %for.body5.us, %for.inc24.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol.preheader ], [ 0, %for.body5.us ]
  %6 = icmp eq i32 %m, 1
  br i1 %6, label %for.cond12.for.inc27_crit_edge.us, label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc24.us.prol.loopexit.unr-lcssa
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.body5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.us.new ], [ %indvars.iv.next.1, %for.inc24.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = mul nsw i64 %indvars.iv17, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %rem16.us = srem i32 %8, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %9 = mul nsw i64 %indvars.iv17, %indvars.iv.next.1
  %10 = trunc i64 %9 to i32
  %rem16.us.1 = srem i32 %10, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i1.1 = insertelement <2 x double> undef, double %conv18, i32 0
  %div19.us.v.i1.2 = insertelement <2 x double> %div19.us.v.i1.1, double %conv18, i32 1
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, %div19.us.v.i1.2
  %11 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %11, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit.unr-lcssa
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next18, %2
  %12 = trunc i64 %indvars.iv.next18 to i32
  br i1 %cmp3.us, label %for.body5.us, label %for.end29.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %inc13 = phi i32 [ %inc13.unr, %for.inc.lr.ph.new ], [ %inc.1, %for.inc ]
  %rem = srem i32 %inc13, %m
  %conv = sitofp i32 %rem to double
  %idxprom = sext i32 %inc13 to i64
  %arrayidx = getelementptr inbounds double, double* %p, i64 %idxprom
  %inc = add nsw i32 %inc13, 1
  %rem.1 = srem i32 %inc, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv1, i32 1
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %13 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %13, align 8
  %inc.1 = add nsw i32 %inc13, 2
  %cmp.1 = icmp slt i32 %inc.1, %m
  br i1 %cmp.1, label %for.inc, label %for.cond2.preheader.loopexit

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %14 = phi i32 [ %.unr, %for.body5.preheader.new ], [ %inc28.1, %for.body5 ]
  %rem6 = srem i32 %14, %n
  %conv7 = sitofp i32 %rem6 to double
  %idxprom10 = sext i32 %14 to i64
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %idxprom10
  %inc28 = add nsw i32 %14, 1
  %rem6.1 = srem i32 %inc28, %n
  %conv7.1 = sitofp i32 %rem6.1 to double
  %div9.v.i1.1 = insertelement <2 x double> undef, double %conv18, i32 0
  %div9.v.i1.2 = insertelement <2 x double> %div9.v.i1.1, double %conv18, i32 1
  %div9.v.i0.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div9.v.i0.2 = insertelement <2 x double> %div9.v.i0.1, double %conv7.1, i32 1
  %div9 = fdiv <2 x double> %div9.v.i0.2, %div9.v.i1.2
  %15 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div9, <2 x double>* %15, align 8
  %inc28.1 = add nsw i32 %14, 2
  %cmp3.1 = icmp slt i32 %inc28.1, %n
  br i1 %cmp3.1, label %for.body5, label %for.end29.loopexit28

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit28:                             ; preds = %for.body5
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit28, %for.end29.loopexit, %for.body5.prol.loopexit, %for.cond2.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* %q, double* nocapture readonly %p, double* %r) unnamed_addr #2 {
entry:
  %cmp11 = icmp sgt i32 %m, 0
  br i1 %cmp11, label %for.inc.preheader, label %for.cond1.preheader

for.inc.preheader:                                ; preds = %entry
  %min.iters.check = icmp ult i32 %m, 4
  br i1 %min.iters.check, label %for.inc.preheader50, label %min.iters.checked

for.inc.preheader50:                              ; preds = %middle.block, %min.iters.checked, %for.inc.preheader
  %inc14.ph = phi i32 [ 0, %for.inc.preheader ], [ 0, %min.iters.checked ], [ %n.vec, %middle.block ]
  br label %for.inc

min.iters.checked:                                ; preds = %for.inc.preheader
  %n.vec = and i32 %m, -4
  %cmp.zero = icmp eq i32 %n.vec, 0
  br i1 %cmp.zero, label %for.inc.preheader50, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %0 = add i32 %n.vec, -4
  %1 = lshr exact i32 %0, 2
  %2 = add nuw nsw i32 %1, 1
  %xtraiter51 = and i32 %2, 3
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  br i1 %lcmp.mod52, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i32 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter53 = phi i32 [ %xtraiter51, %vector.body.prol.preheader ], [ %prol.iter53.sub, %vector.body.prol ]
  %3 = sext i32 %index.prol to i64
  %4 = getelementptr inbounds double, double* %s, i64 %3
  %5 = bitcast double* %4 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %index.next.prol = add i32 %index.prol, 4
  %prol.iter53.sub = add i32 %prol.iter53, -1
  %prol.iter53.cmp = icmp eq i32 %prol.iter53.sub, 0
  br i1 %prol.iter53.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i32 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %8 = icmp ult i32 %0, 12
  br i1 %8, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i32 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %9 = sext i32 %index to i64
  %10 = getelementptr inbounds double, double* %s, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %index.next = add i32 %index, 4
  %14 = sext i32 %index.next to i64
  %15 = getelementptr inbounds double, double* %s, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %index.next.1 = add i32 %index, 8
  %19 = sext i32 %index.next.1 to i64
  %20 = getelementptr inbounds double, double* %s, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %index.next.2 = add i32 %index, 12
  %24 = sext i32 %index.next.2 to i64
  %25 = getelementptr inbounds double, double* %s, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %index.next.3 = add i32 %index, 16
  %29 = icmp eq i32 %index.next.3, %n.vec
  br i1 %29, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i32 %n.vec, %m
  br i1 %cmp.n, label %for.cond1.preheader, label %for.inc.preheader50

for.cond1.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %middle.block, %entry
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %30 = icmp sgt i32 %m, 0
  %31 = sext i32 %n to i64
  br i1 %30, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %min.iters.check34 = icmp ult i32 %n, 4
  br i1 %min.iters.check34, label %for.body3.preheader48, label %min.iters.checked35

for.body3.preheader48:                            ; preds = %middle.block32, %min.iters.checked35, %for.body3.preheader
  %inc358.ph = phi i32 [ 0, %for.body3.preheader ], [ 0, %min.iters.checked35 ], [ %n.vec37, %middle.block32 ]
  br label %for.body3

min.iters.checked35:                              ; preds = %for.body3.preheader
  %n.vec37 = and i32 %n, -4
  %cmp.zero38 = icmp eq i32 %n.vec37, 0
  br i1 %cmp.zero38, label %for.body3.preheader48, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %min.iters.checked35
  %32 = add i32 %n.vec37, -4
  %33 = lshr exact i32 %32, 2
  %34 = add nuw nsw i32 %33, 1
  %xtraiter = and i32 %34, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body31.prol.loopexit, label %vector.body31.prol.preheader

vector.body31.prol.preheader:                     ; preds = %vector.body31.preheader
  br label %vector.body31.prol

vector.body31.prol:                               ; preds = %vector.body31.prol, %vector.body31.prol.preheader
  %index40.prol = phi i32 [ 0, %vector.body31.prol.preheader ], [ %index.next41.prol, %vector.body31.prol ]
  %prol.iter = phi i32 [ %xtraiter, %vector.body31.prol.preheader ], [ %prol.iter.sub, %vector.body31.prol ]
  %35 = sext i32 %index40.prol to i64
  %36 = getelementptr inbounds double, double* %q, i64 %35
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %37, align 8
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %39, align 8
  %index.next41.prol = add i32 %index40.prol, 4
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body31.prol.loopexit.loopexit, label %vector.body31.prol, !llvm.loop !6

vector.body31.prol.loopexit.loopexit:             ; preds = %vector.body31.prol
  br label %vector.body31.prol.loopexit

vector.body31.prol.loopexit:                      ; preds = %vector.body31.prol.loopexit.loopexit, %vector.body31.preheader
  %index40.unr = phi i32 [ 0, %vector.body31.preheader ], [ %index.next41.prol, %vector.body31.prol.loopexit.loopexit ]
  %40 = icmp ult i32 %32, 12
  br i1 %40, label %middle.block32, label %vector.body31.preheader.new

vector.body31.preheader.new:                      ; preds = %vector.body31.prol.loopexit
  br label %vector.body31

vector.body31:                                    ; preds = %vector.body31, %vector.body31.preheader.new
  %index40 = phi i32 [ %index40.unr, %vector.body31.preheader.new ], [ %index.next41.3, %vector.body31 ]
  %41 = sext i32 %index40 to i64
  %42 = getelementptr inbounds double, double* %q, i64 %41
  %43 = bitcast double* %42 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %43, align 8
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %45, align 8
  %index.next41 = add i32 %index40, 4
  %46 = sext i32 %index.next41 to i64
  %47 = getelementptr inbounds double, double* %q, i64 %46
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %48, align 8
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %50, align 8
  %index.next41.1 = add i32 %index40, 8
  %51 = sext i32 %index.next41.1 to i64
  %52 = getelementptr inbounds double, double* %q, i64 %51
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %53, align 8
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %55, align 8
  %index.next41.2 = add i32 %index40, 12
  %56 = sext i32 %index.next41.2 to i64
  %57 = getelementptr inbounds double, double* %q, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %58, align 8
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %60, align 8
  %index.next41.3 = add i32 %index40, 16
  %61 = icmp eq i32 %index.next41.3, %n.vec37
  br i1 %61, label %middle.block32.loopexit, label %vector.body31, !llvm.loop !7

middle.block32.loopexit:                          ; preds = %vector.body31
  br label %middle.block32

middle.block32:                                   ; preds = %middle.block32.loopexit, %vector.body31.prol.loopexit
  %cmp.n43 = icmp eq i32 %n.vec37, %n
  br i1 %cmp.n43, label %for.end36, label %for.body3.preheader48

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %62 = sext i32 %m to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.us.preheader
  %indvars.iv17 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next18, %for.cond6.for.inc34_crit_edge.us ]
  %sext = shl i64 %indvars.iv17, 32
  %idxprom4.us = ashr exact i64 %sext, 32
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %idxprom4.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %63 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr54 = mul i64 %indvars.iv17, 8
  %sunkaddr55 = add i64 %sunkaddr, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %64 = load double, double* %sunkaddr56, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %65 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %64, %65
  %add.us = fadd double %63, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr57 = ptrtoint double* %q to i64
  %sunkaddr58 = mul i64 %indvars.iv17, 8
  %sunkaddr59 = add i64 %sunkaddr57, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  %66 = load double, double* %sunkaddr60, align 8
  %67 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %68 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %67, %68
  %add28.us = fadd double %66, %mul27.us
  store double %add28.us, double* %sunkaddr60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7.us = icmp slt i64 %indvars.iv.next, %62
  br i1 %cmp7.us, label %for.inc31.us, label %for.cond6.for.inc34_crit_edge.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next18, %31
  br i1 %cmp2.us, label %for.body3.us, label %for.end36.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.preheader50
  %inc14 = phi i32 [ %inc14.ph, %for.inc.preheader50 ], [ %inc, %for.inc ]
  %idxprom = sext i32 %inc14 to i64
  %arrayidx = getelementptr inbounds double, double* %s, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %inc = add nsw i32 %inc14, 1
  %cmp = icmp slt i32 %inc, %m
  br i1 %cmp, label %for.inc, label %for.cond1.preheader.loopexit, !llvm.loop !8

for.body3:                                        ; preds = %for.body3, %for.body3.preheader48
  %inc358 = phi i32 [ %inc358.ph, %for.body3.preheader48 ], [ %inc35, %for.body3 ]
  %idxprom4 = sext i32 %inc358 to i64
  %arrayidx5 = getelementptr inbounds double, double* %q, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8
  %inc35 = add nsw i32 %inc358, 1
  %cmp2 = icmp slt i32 %inc35, %n
  br i1 %cmp2, label %for.body3, label %for.end36.loopexit61, !llvm.loop !10

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36.loopexit61:                             ; preds = %for.body3
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit61, %for.end36.loopexit, %middle.block32, %for.cond1.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* nocapture readonly %s, double* nocapture readonly %q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp9 = icmp sgt i32 %m, 0
  br i1 %cmp9, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv13 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %storemerge10 = phi i32 [ 0, %for.body.lr.ph ], [ %7, %for.inc ]
  %rem = srem i32 %storemerge10, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv13
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %cmp = icmp slt i64 %indvars.iv.next14, %3
  %7 = trunc i64 %indvars.iv.next14 to i32
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %cmp85 = icmp sgt i32 %n, 0
  br i1 %cmp85, label %for.body9.lr.ph, label %for.end20

for.body9.lr.ph:                                  ; preds = %for.end
  %10 = sext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %for.inc18, %for.body9.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body9.lr.ph ], [ %indvars.iv.next, %for.inc18 ]
  %storemerge16 = phi i32 [ 0, %for.body9.lr.ph ], [ %14, %for.inc18 ]
  %rem10 = srem i32 %storemerge16, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %13 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, %10
  %14 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp8, label %for.body9, label %for.end20.loopexit

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !4, !5}
!8 = distinct !{!8, !9, !4, !5}
!9 = !{!"llvm.loop.unroll.runtime.disable"}
!10 = distinct !{!10, !9, !4, !5}

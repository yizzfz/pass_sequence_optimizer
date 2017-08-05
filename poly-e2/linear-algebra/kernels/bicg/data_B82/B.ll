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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %0 = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %1 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %0, double* %arraydecay5, double* %1)
  tail call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call1 to double*
  %3 = bitcast i8* %call2 to double*
  %4 = bitcast i8* %call4 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %0, double* %2, double* %3, double* %1, double* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call2 to double*
  %7 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %7, double* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* %A, double* %r, double* %p) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.inc.preheader, label %for.cond2.preheader

for.inc.preheader:                                ; preds = %entry
  %xtraiter26 = and i32 %m, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %conv1.prol = sitofp i32 %m to double
  %div.prol = fdiv double 0.000000e+00, %conv1.prol
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol
  %inc13.unr = phi i32 [ 0, %for.inc.preheader ], [ 1, %for.inc.prol ]
  %0 = icmp eq i32 %m, 1
  br i1 %0, label %for.cond2.preheader, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  %conv1 = sitofp i32 %m to double
  %conv1.1 = sitofp i32 %m to double
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
  br i1 %lcmp.mod25, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv18
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol
  %.unr = phi i32 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol ]
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %for.end29, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i64 %wide.trip.count, 1
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %storemerge17.us = phi i32 [ %12, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %4 = icmp eq i64 %xtraiter, 0
  %rem6.us = srem i32 %storemerge17.us, %n
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, %conv18
  %idxprom10.us = sext i32 %storemerge17.us to i64
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %idxprom10.us
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %4, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.body5.us
  %5 = trunc i64 %indvars.iv17 to i32
  %rem16.us.prol = srem i32 %5, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us ]
  %6 = icmp eq i32 %m, 1
  br i1 %6, label %for.cond12.for.inc27_crit_edge.us, label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc24.us.prol.loopexit
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

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next18, %2
  %12 = trunc i64 %indvars.iv.next18 to i32
  br i1 %cmp3.us, label %for.body5.us, label %for.end29.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %inc13 = phi i32 [ %inc13.unr, %for.inc.preheader.new ], [ %inc.1, %for.inc ]
  %rem = srem i32 %inc13, %m
  %conv = sitofp i32 %rem to double
  %idxprom = sext i32 %inc13 to i64
  %arrayidx = getelementptr inbounds double, double* %p, i64 %idxprom
  %inc = add nsw i32 %inc13, 1
  %rem.1 = srem i32 %inc, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv1.1, i32 1
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
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* %A, double* %s, double* %q, double* %p, double* %r) unnamed_addr #2 {
entry:
  %cmp11 = icmp sgt i32 %m, 0
  br i1 %cmp11, label %for.inc.preheader, label %for.cond1.preheader

for.inc.preheader:                                ; preds = %entry
  %0 = add i32 %m, -1
  %xtraiter31 = and i32 %m, 7
  %lcmp.mod32 = icmp eq i32 %xtraiter31, 0
  br i1 %lcmp.mod32, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %inc14.prol = phi i32 [ %inc.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter33 = phi i32 [ %prol.iter33.sub, %for.inc.prol ], [ %xtraiter31, %for.inc.prol.preheader ]
  %idxprom.prol = sext i32 %inc14.prol to i64
  %arrayidx.prol = getelementptr inbounds double, double* %s, i64 %idxprom.prol
  store double 0.000000e+00, double* %arrayidx.prol, align 8
  %inc.prol = add nsw i32 %inc14.prol, 1
  %prol.iter33.sub = add i32 %prol.iter33, -1
  %prol.iter33.cmp = icmp eq i32 %prol.iter33.sub, 0
  br i1 %prol.iter33.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.preheader
  %inc14.unr = phi i32 [ 0, %for.inc.preheader ], [ %inc.prol, %for.inc.prol.loopexit.loopexit ]
  %1 = icmp ult i32 %0, 7
  br i1 %1, label %for.cond1.preheader, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond1.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %for.inc.prol.loopexit, %entry
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %2 = icmp sgt i32 %m, 0
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
  br i1 %2, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %5 = add i32 %n, -1
  %xtraiter = and i32 %n, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol, %for.body3.prol.preheader
  %inc358.prol = phi i32 [ %inc35.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %idxprom4.prol = sext i32 %inc358.prol to i64
  %arrayidx5.prol = getelementptr inbounds double, double* %q, i64 %idxprom4.prol
  store double 0.000000e+00, double* %arrayidx5.prol, align 8
  %inc35.prol = add nsw i32 %inc358.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.preheader
  %inc358.unr = phi i32 [ 0, %for.body3.preheader ], [ %inc35.prol, %for.body3.prol.loopexit.loopexit ]
  %6 = icmp ult i32 %5, 7
  br i1 %6, label %for.end36, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc34_crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %sext = shl i64 %indvars.iv17, 32
  %idxprom4.us = ashr exact i64 %sext, 32
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %idxprom4.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.body3.us, %for.inc31.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %7 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr34 = mul i64 %indvars.iv17, 8
  %sunkaddr35 = add i64 %sunkaddr, %sunkaddr34
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  %8 = load double, double* %sunkaddr36, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %9 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %8, %9
  %add.us = fadd double %7, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr37 = ptrtoint double* %q to i64
  %sunkaddr38 = mul i64 %indvars.iv17, 8
  %sunkaddr39 = add i64 %sunkaddr37, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %10 = load double, double* %sunkaddr40, align 8
  %11 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %12 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %11, %12
  %add28.us = fadd double %10, %mul27.us
  store double %add28.us, double* %sunkaddr40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7.us = icmp slt i64 %indvars.iv.next, %4
  br i1 %cmp7.us, label %for.inc31.us, label %for.cond6.for.inc34_crit_edge.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next18, %3
  br i1 %cmp2.us, label %for.body3.us, label %for.end36.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %inc14 = phi i32 [ %inc14.unr, %for.inc.preheader.new ], [ %inc.7, %for.inc ]
  %idxprom = sext i32 %inc14 to i64
  %arrayidx = getelementptr inbounds double, double* %s, i64 %idxprom
  %13 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %inc.1 = add nsw i32 %inc14, 2
  %idxprom.2 = sext i32 %inc.1 to i64
  %arrayidx.2 = getelementptr inbounds double, double* %s, i64 %idxprom.2
  %14 = bitcast double* %arrayidx.2 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %14, align 8
  %inc.3 = add nsw i32 %inc14, 4
  %idxprom.4 = sext i32 %inc.3 to i64
  %arrayidx.4 = getelementptr inbounds double, double* %s, i64 %idxprom.4
  %15 = bitcast double* %arrayidx.4 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %inc.5 = add nsw i32 %inc14, 6
  %idxprom.6 = sext i32 %inc.5 to i64
  %arrayidx.6 = getelementptr inbounds double, double* %s, i64 %idxprom.6
  %16 = bitcast double* %arrayidx.6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %inc.7 = add nsw i32 %inc14, 8
  %cmp.7 = icmp slt i32 %inc.7, %m
  br i1 %cmp.7, label %for.inc, label %for.cond1.preheader.loopexit

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %inc358 = phi i32 [ %inc358.unr, %for.body3.preheader.new ], [ %inc35.7, %for.body3 ]
  %idxprom4 = sext i32 %inc358 to i64
  %arrayidx5 = getelementptr inbounds double, double* %q, i64 %idxprom4
  %17 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %inc35.1 = add nsw i32 %inc358, 2
  %idxprom4.2 = sext i32 %inc35.1 to i64
  %arrayidx5.2 = getelementptr inbounds double, double* %q, i64 %idxprom4.2
  %18 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %inc35.3 = add nsw i32 %inc358, 4
  %idxprom4.4 = sext i32 %inc35.3 to i64
  %arrayidx5.4 = getelementptr inbounds double, double* %q, i64 %idxprom4.4
  %19 = bitcast double* %arrayidx5.4 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %inc35.5 = add nsw i32 %inc358, 6
  %idxprom4.6 = sext i32 %inc35.5 to i64
  %arrayidx5.6 = getelementptr inbounds double, double* %q, i64 %idxprom4.6
  %20 = bitcast double* %arrayidx5.6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %inc35.7 = add nsw i32 %inc358, 8
  %cmp2.7 = icmp slt i32 %inc35.7, %n
  br i1 %cmp2.7, label %for.body3, label %for.end36.loopexit41

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36.loopexit41:                             ; preds = %for.body3
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit41, %for.end36.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* %s, double* %q) unnamed_addr #0 {
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

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
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

for.body9:                                        ; preds = %for.body9.lr.ph, %for.inc18
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
!3 = distinct !{!3, !2}

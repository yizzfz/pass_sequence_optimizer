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
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %m = alloca i32, align 4
  %A = alloca [2100 x [1900 x double]]*, align 8
  %s = alloca [1900 x double]*, align 8
  %q = alloca [2100 x double]*, align 8
  %p = alloca [1900 x double]*, align 8
  %r = alloca [2100 x double]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2100, i32* %n, align 4
  store i32 1900, i32* %m, align 4
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %0 = bitcast [2100 x [1900 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %1 = bitcast [1900 x double]** %s to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %2 = bitcast [2100 x double]** %q to i8**
  store i8* %call2, i8** %2, align 8
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %3 = bitcast [1900 x double]** %p to i8**
  store i8* %call3, i8** %3, align 8
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %4 = bitcast [2100 x double]** %r to i8**
  store i8* %call4, i8** %4, align 8
  %5 = load i32, i32* %m, align 4
  %6 = load i32, i32* %n, align 4
  %7 = bitcast [2100 x [1900 x double]]** %A to [1900 x double]**
  %8 = load [1900 x double]*, [1900 x double]** %7, align 8
  %arraydecay5 = bitcast i8* %call4 to double*
  %9 = bitcast [1900 x double]** %p to double**
  %10 = load double*, double** %9, align 8
  tail call fastcc void @init_array(i32 %5, i32 %6, [1900 x double]* %8, double* %arraydecay5, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load i32, i32* %m, align 4
  %12 = load i32, i32* %n, align 4
  %13 = bitcast [2100 x [1900 x double]]** %A to [1900 x double]**
  %14 = load [1900 x double]*, [1900 x double]** %13, align 8
  %15 = bitcast [1900 x double]** %s to double**
  %16 = load double*, double** %15, align 8
  %17 = bitcast [2100 x double]** %q to double**
  %18 = load double*, double** %17, align 8
  %19 = bitcast [1900 x double]** %p to double**
  %20 = load double*, double** %19, align 8
  %21 = bitcast [2100 x double]** %r to double**
  %22 = load double*, double** %21, align 8
  tail call fastcc void @kernel_bicg(i32 %11, i32 %12, [1900 x double]* %14, double* %16, double* %18, double* %20, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %23 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %23, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %24 = load i8**, i8*** %argv.addr, align 8
  %25 = load i8*, i8** %24, align 8
  %strcmpload = load i8, i8* %25, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %26 = load i32, i32* %m, align 4
  %27 = load i32, i32* %n, align 4
  %28 = bitcast [1900 x double]** %s to double**
  %29 = load double*, double** %28, align 8
  %30 = bitcast [2100 x double]** %q to double**
  %31 = load double*, double** %30, align 8
  tail call fastcc void @print_array(i32 %26, i32 %27, double* %29, double* %31)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %32 = bitcast [2100 x double]** %r to i8**
  %33 = bitcast [1900 x double]** %p to i8**
  %34 = bitcast [2100 x double]** %q to i8**
  %35 = bitcast [1900 x double]** %s to i8**
  %36 = bitcast [2100 x [1900 x double]]** %A to i8**
  %37 = load i8*, i8** %36, align 8
  tail call void @free(i8* %37) #4
  %38 = load i8*, i8** %35, align 8
  tail call void @free(i8* %38) #4
  %39 = load i8*, i8** %34, align 8
  tail call void @free(i8* %39) #4
  %40 = load i8*, i8** %33, align 8
  tail call void @free(i8* %40) #4
  %41 = load i8*, i8** %32, align 8
  tail call void @free(i8* %41) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* %A, double* %r, double* %p) unnamed_addr #2 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1900 x double]*, align 8
  %r.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1900 x double]* %A, [1900 x double]** %A.addr, align 8
  store double* %r, double** %r.addr, align 8
  store double* %p, double** %p.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.inc.lr.ph, label %for.cond2.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %0 = load double*, double** %p.addr, align 8
  %1 = load i32, i32* %m.addr, align 4
  %i.promoted12 = load i32, i32* %i, align 4
  br label %for.inc

for.cond.for.cond2.preheader_crit_edge:           ; preds = %for.inc
  store i32 %inc, i32* %i, align 4
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry, %for.cond.for.cond2.preheader_crit_edge
  store i32 0, i32* %i, align 4
  %2 = load i32, i32* %n.addr, align 4
  %cmp36 = icmp sgt i32 %2, 0
  br i1 %cmp36, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %3 = load double*, double** %r.addr, align 8
  %4 = load i32, i32* %m.addr, align 4
  %wide.trip.count = zext i32 %4 to i64
  %cmp133 = icmp sgt i32 %4, 0
  %5 = load i32, i32* %n.addr, align 4
  %6 = sext i32 %5 to i64
  %conv18 = sitofp i32 %5 to double
  %7 = load [1900 x double]*, [1900 x double]** %A.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %8 = sext i32 %i.promoted to i64
  br i1 %cmp133, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i64 %wide.trip.count, 1
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.cond12.for.inc27_crit_edge.us, %for.body5.us.preheader
  %indvars.iv17 = phi i64 [ %8, %for.body5.us.preheader ], [ %indvars.iv.next18, %for.cond12.for.inc27_crit_edge.us ]
  %9 = phi i32 [ %2, %for.body5.us.preheader ], [ %5, %for.cond12.for.inc27_crit_edge.us ]
  %storemerge17.us = phi i32 [ 0, %for.body5.us.preheader ], [ %18, %for.cond12.for.inc27_crit_edge.us ]
  %10 = icmp eq i64 %xtraiter, 0
  %rem6.us = srem i32 %storemerge17.us, %9
  %conv7.us = sitofp i32 %rem6.us to double
  %conv8.us = sitofp i32 %9 to double
  %div9.us = fdiv double %conv7.us, %conv8.us
  %idxprom10.us = sext i32 %storemerge17.us to i64
  %arrayidx11.us = getelementptr inbounds double, double* %3, i64 %idxprom10.us
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %10, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.body5.us
  %11 = trunc i64 %indvars.iv17 to i32
  %rem16.us.prol = srem i32 %11, %5
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %7, i64 %indvars.iv17, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us ]
  %12 = icmp eq i32 %4, 1
  br i1 %12, label %for.cond12.for.inc27_crit_edge.us, label %for.body5.us.new

for.body5.us.new:                                 ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.body5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body5.us.new ], [ %indvars.iv.next.1, %for.inc24.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = mul nsw i64 %indvars.iv17, %indvars.iv.next
  %14 = trunc i64 %13 to i32
  %rem16.us = srem i32 %14, %5
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %7, i64 %indvars.iv17, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = mul nsw i64 %indvars.iv17, %indvars.iv.next.1
  %16 = trunc i64 %15 to i32
  %rem16.us.1 = srem i32 %16, %5
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i1.1 = insertelement <2 x double> undef, double %conv18, i32 0
  %div19.us.v.i1.2 = insertelement <2 x double> %div19.us.v.i1.1, double %conv18, i32 1
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, %div19.us.v.i1.2
  %17 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next18, %6
  %18 = trunc i64 %indvars.iv.next18 to i32
  br i1 %cmp3.us, label %for.body5.us, label %for.cond2.for.end29_crit_edge.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %inc13 = phi i32 [ %i.promoted12, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %19 = phi i32 [ %m, %for.inc.lr.ph ], [ %1, %for.inc ]
  %storemerge11 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %rem = srem i32 %storemerge11, %19
  %conv = sitofp i32 %rem to double
  %conv1 = sitofp i32 %19 to double
  %div = fdiv double %conv, %conv1
  %idxprom = sext i32 %storemerge11 to i64
  %arrayidx = getelementptr inbounds double, double* %0, i64 %idxprom
  store double %div, double* %arrayidx, align 8
  %inc = add nsw i32 %inc13, 1
  %cmp = icmp slt i32 %inc, %1
  br i1 %cmp, label %for.inc, label %for.cond.for.cond2.preheader_crit_edge

for.body5:                                        ; preds = %for.body5.preheader, %for.body5
  %20 = phi i32 [ %inc28, %for.body5 ], [ %i.promoted, %for.body5.preheader ]
  %21 = phi i32 [ %5, %for.body5 ], [ %2, %for.body5.preheader ]
  %storemerge17 = phi i32 [ %inc28, %for.body5 ], [ 0, %for.body5.preheader ]
  %rem6 = srem i32 %storemerge17, %21
  %conv7 = sitofp i32 %rem6 to double
  %conv8 = sitofp i32 %21 to double
  %div9 = fdiv double %conv7, %conv8
  %idxprom10 = sext i32 %storemerge17 to i64
  %arrayidx11 = getelementptr inbounds double, double* %3, i64 %idxprom10
  store double %div9, double* %arrayidx11, align 8
  %inc28 = add nsw i32 %20, 1
  %cmp3 = icmp slt i32 %inc28, %5
  br i1 %cmp3, label %for.body5, label %for.cond2.for.end29_crit_edge.loopexit26

for.cond2.for.end29_crit_edge.loopexit:           ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.cond2.for.end29_crit_edge

for.cond2.for.end29_crit_edge.loopexit26:         ; preds = %for.body5
  br label %for.cond2.for.end29_crit_edge

for.cond2.for.end29_crit_edge:                    ; preds = %for.cond2.for.end29_crit_edge.loopexit26, %for.cond2.for.end29_crit_edge.loopexit
  %inc28.lcssa = phi i32 [ %18, %for.cond2.for.end29_crit_edge.loopexit ], [ %inc28, %for.cond2.for.end29_crit_edge.loopexit26 ]
  store i32 %inc28.lcssa, i32* %i, align 4
  br label %for.end29

for.end29:                                        ; preds = %for.cond2.preheader, %for.cond2.for.end29_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* %A, double* %s, double* %q, double* %p, double* %r) unnamed_addr #2 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1900 x double]*, align 8
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %p.addr = alloca double*, align 8
  %r.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1900 x double]* %A, [1900 x double]** %A.addr, align 8
  store double* %s, double** %s.addr, align 8
  store double* %q, double** %q.addr, align 8
  store double* %p, double** %p.addr, align 8
  store double* %r, double** %r.addr, align 8
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %m.addr, align 4
  %cmp11 = icmp sgt i32 %0, 0
  br i1 %cmp11, label %for.inc.lr.ph, label %for.cond1.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %1 = load double*, double** %s.addr, align 8
  %2 = load i32, i32* %m.addr, align 4
  %i.promoted13 = load i32, i32* %i, align 4
  br label %for.inc

for.cond.for.cond1.preheader_crit_edge:           ; preds = %for.inc
  store i32 %inc, i32* %i, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.cond.for.cond1.preheader_crit_edge
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp26 = icmp sgt i32 %3, 0
  br i1 %cmp26, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %4 = load double*, double** %q.addr, align 8
  %5 = load i32, i32* %m.addr, align 4
  %cmp73 = icmp sgt i32 %5, 0
  %6 = load i32, i32* %n.addr, align 4
  %7 = sext i32 %6 to i64
  %8 = load double*, double** %s.addr, align 8
  %9 = load [1900 x double]*, [1900 x double]** %A.addr, align 8
  %10 = load double*, double** %p.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %11 = sext i32 %i.promoted to i64
  br i1 %cmp73, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %12 = bitcast double** %q.addr to i64*
  %13 = load i64, i64* %12, align 8
  %14 = bitcast double** %r.addr to i64*
  %15 = load i64, i64* %14, align 8
  %16 = load i32, i32* %m.addr, align 4
  %17 = sext i32 %16 to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.us.preheader
  %indvars.iv17 = phi i64 [ %11, %for.body3.us.preheader ], [ %indvars.iv.next18, %for.cond6.for.inc34_crit_edge.us ]
  %storemerge17.us = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next18, %for.cond6.for.inc34_crit_edge.us ]
  %sext = shl i64 %storemerge17.us, 32
  %idxprom4.us = ashr exact i64 %sext, 32
  %arrayidx5.us = getelementptr inbounds double, double* %4, i64 %idxprom4.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %18 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = mul i64 %indvars.iv17, 8
  %sunkaddr33 = add i64 %15, %sunkaddr
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %19 = load double, double* %sunkaddr34, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %9, i64 %indvars.iv17, i64 %indvars.iv
  %20 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %19, %20
  %add.us = fadd double %18, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr35 = mul i64 %indvars.iv17, 8
  %sunkaddr36 = add i64 %13, %sunkaddr35
  %sunkaddr37 = inttoptr i64 %sunkaddr36 to double*
  %21 = load double, double* %sunkaddr37, align 8
  %arrayidx24.us = getelementptr inbounds [1900 x double], [1900 x double]* %9, i64 %indvars.iv17, i64 %indvars.iv
  %22 = load double, double* %arrayidx24.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %10, i64 %indvars.iv
  %23 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %22, %23
  %add28.us = fadd double %21, %mul27.us
  store double %add28.us, double* %sunkaddr37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7.us = icmp slt i64 %indvars.iv.next, %17
  br i1 %cmp7.us, label %for.inc31.us, label %for.cond6.for.inc34_crit_edge.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next18, %7
  br i1 %cmp2.us, label %for.body3.us, label %for.cond1.for.end36_crit_edge.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %inc14 = phi i32 [ %i.promoted13, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %storemerge12 = phi i32 [ 0, %for.inc.lr.ph ], [ %inc, %for.inc ]
  %idxprom = sext i32 %storemerge12 to i64
  %arrayidx = getelementptr inbounds double, double* %1, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %inc = add nsw i32 %inc14, 1
  %cmp = icmp slt i32 %inc, %2
  br i1 %cmp, label %for.inc, label %for.cond.for.cond1.preheader_crit_edge

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %inc358 = phi i32 [ %inc35, %for.body3 ], [ %i.promoted, %for.body3.preheader ]
  %storemerge17 = phi i32 [ %inc35, %for.body3 ], [ 0, %for.body3.preheader ]
  %idxprom4 = sext i32 %storemerge17 to i64
  %arrayidx5 = getelementptr inbounds double, double* %4, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8
  %inc35 = add nsw i32 %inc358, 1
  %cmp2 = icmp slt i32 %inc35, %6
  br i1 %cmp2, label %for.body3, label %for.cond1.for.end36_crit_edge.loopexit38

for.cond1.for.end36_crit_edge.loopexit:           ; preds = %for.cond6.for.inc34_crit_edge.us
  %24 = trunc i64 %indvars.iv.next18 to i32
  br label %for.cond1.for.end36_crit_edge

for.cond1.for.end36_crit_edge.loopexit38:         ; preds = %for.body3
  br label %for.cond1.for.end36_crit_edge

for.cond1.for.end36_crit_edge:                    ; preds = %for.cond1.for.end36_crit_edge.loopexit38, %for.cond1.for.end36_crit_edge.loopexit
  %inc35.lcssa = phi i32 [ %24, %for.cond1.for.end36_crit_edge.loopexit ], [ %inc35, %for.cond1.for.end36_crit_edge.loopexit38 ]
  store i32 %inc35.lcssa, i32* %i, align 4
  br label %for.end36

for.end36:                                        ; preds = %for.cond1.preheader, %for.cond1.for.end36_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* %s, double* %q) unnamed_addr #0 {
entry:
  %m.addr = alloca i32, align 4
  %n.addr = alloca i32, align 4
  %s.addr = alloca double*, align 8
  %q.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %s, double** %s.addr, align 8
  store double* %q, double** %q.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %m.addr, align 4
  %cmp9 = icmp sgt i32 %3, 0
  br i1 %cmp9, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %4 = load double*, double** %s.addr, align 8
  %5 = load i32, i32* %m.addr, align 4
  %i.promoted11 = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted11 to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv13 = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next14, %for.inc ]
  %storemerge10 = phi i32 [ 0, %for.body.lr.ph ], [ %11, %for.inc ]
  %rem = srem i32 %storemerge10, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %10 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %cmp = icmp slt i64 %indvars.iv.next14, %7
  %11 = trunc i64 %indvars.iv.next14 to i32
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  store i32 %11, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %14 = load i32, i32* %n.addr, align 4
  %cmp85 = icmp sgt i32 %14, 0
  br i1 %cmp85, label %for.body9.lr.ph, label %for.end20

for.body9.lr.ph:                                  ; preds = %for.end
  %15 = load double*, double** %q.addr, align 8
  %16 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %17 = sext i32 %i.promoted to i64
  %18 = sext i32 %16 to i64
  br label %for.body9

for.body9:                                        ; preds = %for.inc18, %for.body9.lr.ph
  %indvars.iv = phi i64 [ %17, %for.body9.lr.ph ], [ %indvars.iv.next, %for.inc18 ]
  %storemerge16 = phi i32 [ 0, %for.body9.lr.ph ], [ %22, %for.inc18 ]
  %rem10 = srem i32 %storemerge16, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %15, i64 %indvars.iv
  %21 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, %18
  %22 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp8, label %for.body9, label %for.cond7.for.end20_crit_edge

for.cond7.for.end20_crit_edge:                    ; preds = %for.inc18
  store i32 %22, i32* %i, align 4
  br label %for.end20

for.end20:                                        ; preds = %for.end, %for.cond7.for.end20_crit_edge
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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

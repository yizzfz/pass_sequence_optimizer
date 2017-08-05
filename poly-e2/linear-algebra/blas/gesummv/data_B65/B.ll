; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %A = alloca [1300 x [1300 x double]]*, align 8
  %B = alloca [1300 x [1300 x double]]*, align 8
  %tmp = alloca [1300 x double]*, align 8
  %x = alloca [1300 x double]*, align 8
  %y = alloca [1300 x double]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 1300, i32* %n, align 4
  %call = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %0 = bitcast [1300 x [1300 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %1 = bitcast [1300 x [1300 x double]]** %B to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %2 = bitcast [1300 x double]** %tmp to i8**
  store i8* %call2, i8** %2, align 8
  %call4 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %3 = bitcast [1300 x double]** %x to i8**
  store i8* %call4, i8** %3, align 8
  %call6 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %4 = bitcast [1300 x double]** %y to i8**
  store i8* %call6, i8** %4, align 8
  %5 = load i32, i32* %n, align 4
  %6 = bitcast [1300 x [1300 x double]]** %A to [1300 x double]**
  %7 = load [1300 x double]*, [1300 x double]** %6, align 8
  %8 = bitcast [1300 x [1300 x double]]** %B to [1300 x double]**
  %9 = load [1300 x double]*, [1300 x double]** %8, align 8
  %10 = bitcast [1300 x double]** %x to double**
  %11 = load double*, double** %10, align 8
  call fastcc void @init_array(i32 %5, double* nonnull %alpha, double* nonnull %beta, [1300 x double]* %7, [1300 x double]* %9, double* %11)
  call void (...) @polybench_timer_start() #4
  %12 = load i32, i32* %n, align 4
  %13 = load double, double* %alpha, align 8
  %14 = load double, double* %beta, align 8
  %15 = bitcast [1300 x [1300 x double]]** %A to [1300 x double]**
  %16 = load [1300 x double]*, [1300 x double]** %15, align 8
  %17 = bitcast [1300 x [1300 x double]]** %B to [1300 x double]**
  %18 = load [1300 x double]*, [1300 x double]** %17, align 8
  %19 = bitcast [1300 x double]** %tmp to double**
  %20 = load double*, double** %19, align 8
  %21 = bitcast [1300 x double]** %x to double**
  %22 = load double*, double** %21, align 8
  %23 = bitcast [1300 x double]** %y to double**
  %24 = load double*, double** %23, align 8
  call fastcc void @kernel_gesummv(i32 %12, double %13, double %14, [1300 x double]* %16, [1300 x double]* %18, double* %20, double* %22, double* %24)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %25, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %26 = load i8**, i8*** %argv.addr, align 8
  %27 = load i8*, i8** %26, align 8
  %strcmpload = load i8, i8* %27, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %28 = load i32, i32* %n, align 4
  %29 = bitcast [1300 x double]** %y to double**
  %30 = load double*, double** %29, align 8
  call fastcc void @print_array(i32 %28, double* %30)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %31 = bitcast [1300 x [1300 x double]]** %A to i8**
  %32 = load i8*, i8** %31, align 8
  call void @free(i8* %32) #4
  %33 = bitcast [1300 x [1300 x double]]** %B to i8**
  %34 = load i8*, i8** %33, align 8
  call void @free(i8* %34) #4
  %35 = bitcast [1300 x double]** %tmp to i8**
  %36 = load i8*, i8** %35, align 8
  call void @free(i8* %36) #4
  %37 = bitcast [1300 x double]** %x to i8**
  %38 = load i8*, i8** %37, align 8
  call void @free(i8* %38) #4
  %39 = bitcast [1300 x double]** %y to i8**
  %40 = load i8*, i8** %39, align 8
  call void @free(i8* %40) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [1300 x double]* %A, [1300 x double]* %B, double* %x) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %A.addr = alloca [1300 x double]*, align 8
  %B.addr = alloca [1300 x double]*, align 8
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [1300 x double]* %A, [1300 x double]** %A.addr, align 8
  store [1300 x double]* %B, [1300 x double]** %B.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp4 = icmp sgt i32 %0, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end26

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %x.addr, align 8
  %2 = load i32, i32* %n.addr, align 4
  %wide.trip.count = zext i32 %2 to i64
  %3 = sext i32 %2 to i64
  %4 = load [1300 x double]*, [1300 x double]** %A.addr, align 8
  %conv18 = sitofp i32 %2 to double
  %5 = load [1300 x double]*, [1300 x double]** %B.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %cmp31 = icmp sgt i32 %2, 0
  br i1 %cmp31, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %6 = sext i32 %i.promoted to i64
  %conv8.us = sitofp i32 %2 to double
  %div9.us.v.i1.1 = insertelement <2 x double> undef, double %conv8.us, i32 0
  %div9.us.v.i1.2 = insertelement <2 x double> %div9.us.v.i1.1, double %conv18, i32 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc24_crit_edge.us, %for.body.us.preheader
  %indvars.iv13 = phi i64 [ %6, %for.body.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc24_crit_edge.us ]
  %7 = phi i32 [ %0, %for.body.us.preheader ], [ %2, %for.cond2.for.inc24_crit_edge.us ]
  %8 = phi i32 [ 0, %for.body.us.preheader ], [ %15, %for.cond2.for.inc24_crit_edge.us ]
  %rem.us = srem i32 %8, %7
  %conv.us = sitofp i32 %rem.us to double
  %conv1.us = sitofp i32 %7 to double
  %div.us = fdiv double %conv.us, %conv1.us
  %idxprom.us = sext i32 %8 to i64
  %arrayidx.us = getelementptr inbounds double, double* %1, i64 %idxprom.us
  store double %div.us, double* %arrayidx.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %9 = mul nsw i64 %indvars.iv13, %indvars.iv
  %10 = add nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %rem6.us = srem i32 %11, %2
  %conv7.us = sitofp i32 %rem6.us to double
  %arrayidx13.us = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv13, i64 %indvars.iv
  %12 = mul nsw i64 %indvars.iv, %indvars.iv13
  %13 = add nsw i64 %12, 2
  %14 = trunc i64 %13 to i32
  %rem16.us = srem i32 %14, %2
  %conv17.us = sitofp i32 %rem16.us to double
  %div9.us.v.i0.1 = insertelement <2 x double> undef, double %conv7.us, i32 0
  %div9.us.v.i0.2 = insertelement <2 x double> %div9.us.v.i0.1, double %conv17.us, i32 1
  %div9.us = fdiv <2 x double> %div9.us.v.i0.2, %div9.us.v.i1.2
  %div9.us.v.r1 = extractelement <2 x double> %div9.us, i32 0
  %div9.us.v.r2 = extractelement <2 x double> %div9.us, i32 1
  store double %div9.us.v.r1, double* %arrayidx13.us, align 8
  %arrayidx23.us = getelementptr inbounds [1300 x double], [1300 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv
  store double %div9.us.v.r2, double* %arrayidx23.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc24_crit_edge.us, label %for.inc.us

for.cond2.for.inc24_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %cmp.us = icmp slt i64 %indvars.iv.next14, %3
  %15 = trunc i64 %indvars.iv.next14 to i32
  br i1 %cmp.us, label %for.body.us, label %for.cond.for.end26_crit_edge.loopexit

for.body:                                         ; preds = %for.body.preheader, %for.body
  %16 = phi i32 [ %inc25, %for.body ], [ %i.promoted, %for.body.preheader ]
  %17 = phi i32 [ %2, %for.body ], [ %0, %for.body.preheader ]
  %18 = phi i32 [ %inc25, %for.body ], [ 0, %for.body.preheader ]
  %rem = srem i32 %18, %17
  %conv = sitofp i32 %rem to double
  %conv1 = sitofp i32 %17 to double
  %div = fdiv double %conv, %conv1
  %idxprom = sext i32 %18 to i64
  %arrayidx = getelementptr inbounds double, double* %1, i64 %idxprom
  store double %div, double* %arrayidx, align 8
  %inc25 = add nsw i32 %16, 1
  %cmp = icmp slt i32 %inc25, %2
  br i1 %cmp, label %for.body, label %for.cond.for.end26_crit_edge.loopexit20

for.cond.for.end26_crit_edge.loopexit:            ; preds = %for.cond2.for.inc24_crit_edge.us
  %19 = trunc i64 %indvars.iv.next14 to i32
  br label %for.cond.for.end26_crit_edge

for.cond.for.end26_crit_edge.loopexit20:          ; preds = %for.body
  br label %for.cond.for.end26_crit_edge

for.cond.for.end26_crit_edge:                     ; preds = %for.cond.for.end26_crit_edge.loopexit20, %for.cond.for.end26_crit_edge.loopexit
  %inc25.lcssa = phi i32 [ %19, %for.cond.for.end26_crit_edge.loopexit ], [ %inc25, %for.cond.for.end26_crit_edge.loopexit20 ]
  store i32 %inc25.lcssa, i32* %i, align 4
  br label %for.end26

for.end26:                                        ; preds = %entry, %for.cond.for.end26_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32 %n, double %alpha, double %beta, [1300 x double]* %A, [1300 x double]* %B, double* %tmp, double* %x, double* %y) unnamed_addr #2 {
entry:
  %n.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %A.addr = alloca [1300 x double]*, align 8
  %B.addr = alloca [1300 x double]*, align 8
  %tmp.addr = alloca double*, align 8
  %x.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [1300 x double]* %A, [1300 x double]** %A.addr, align 8
  store [1300 x double]* %B, [1300 x double]** %B.addr, align 8
  store double* %tmp, double** %tmp.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %y, double** %y.addr, align 8
  store i32 0, i32* %i, align 4
  %0 = load i32, i32* %n.addr, align 4
  %cmp3 = icmp sgt i32 %0, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end41

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %tmp.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %4 = sext i32 %3 to i64
  %5 = load double, double* %alpha.addr, align 8
  %6 = load double, double* %beta.addr, align 8
  %7 = load [1300 x double]*, [1300 x double]** %A.addr, align 8
  %8 = load double*, double** %x.addr, align 8
  %9 = bitcast double** %tmp.addr to i64*
  %10 = load i64, i64* %9, align 8
  %11 = load [1300 x double]*, [1300 x double]** %B.addr, align 8
  %12 = bitcast double** %y.addr to i64*
  %13 = load i64, i64* %12, align 8
  %14 = load i32, i32* %n.addr, align 4
  %15 = sext i32 %14 to i64
  %i.promoted = load i32, i32* %i, align 4
  %cmp61 = icmp sgt i32 %3, 0
  %16 = sext i32 %i.promoted to i64
  br i1 %cmp61, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %mul35 = fmul double %6, 0.000000e+00
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %17 = sext i32 %3 to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond5.for.inc39_crit_edge.us, %for.body.us.preheader
  %indvars.iv9 = phi i64 [ %16, %for.body.us.preheader ], [ %indvars.iv.next10, %for.cond5.for.inc39_crit_edge.us ]
  %18 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next10, %for.cond5.for.inc39_crit_edge.us ]
  %sext22 = shl i64 %18, 32
  %idxprom.us = ashr exact i64 %sext22, 32
  %arrayidx.us = getelementptr inbounds double, double* %1, i64 %idxprom.us
  store double 0.000000e+00, double* %arrayidx.us, align 8
  %arrayidx4.us = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  store double 0.000000e+00, double* %arrayidx4.us, align 8
  %sunkaddr = shl i64 %indvars.iv9, 3
  %sunkaddr25 = add i64 %10, %sunkaddr
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %sunkaddr27 = shl i64 %indvars.iv9, 3
  %sunkaddr28 = add i64 %13, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx11.us = getelementptr inbounds [1300 x double], [1300 x double]* %7, i64 %indvars.iv9, i64 %indvars.iv
  %19 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %20 = load double, double* %arrayidx13.us, align 8
  %mul.us = fmul double %19, %20
  %21 = load double, double* %sunkaddr26, align 8
  %add.us = fadd double %mul.us, %21
  store double %add.us, double* %sunkaddr26, align 8
  %arrayidx21.us = getelementptr inbounds [1300 x double], [1300 x double]* %11, i64 %indvars.iv9, i64 %indvars.iv
  %22 = load double, double* %arrayidx21.us, align 8
  %arrayidx23.us = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %23 = load double, double* %arrayidx23.us, align 8
  %mul24.us = fmul double %22, %23
  %24 = load double, double* %sunkaddr29, align 8
  %add27.us = fadd double %mul24.us, %24
  store double %add27.us, double* %sunkaddr29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp6.us = icmp slt i64 %indvars.iv.next, %15
  br i1 %cmp6.us, label %for.inc.us, label %for.cond5.for.inc39_crit_edge.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %25 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %5, %25
  %arrayidx34.us = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  %26 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %6, %26
  %add36.us = fadd double %mul32.us, %mul35.us
  store double %add36.us, double* %arrayidx34.us, align 8
  %indvars.iv.next10 = add nsw i64 %indvars.iv9, 1
  %cmp.us = icmp slt i64 %indvars.iv.next10, %17
  br i1 %cmp.us, label %for.body.us, label %for.cond.for.end41_crit_edge.loopexit

for.body:                                         ; preds = %for.body, %for.body.preheader
  %indvars.iv12 = phi i64 [ %16, %for.body.preheader ], [ %indvars.iv.next13, %for.body ]
  %27 = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next13, %for.body ]
  %sext = shl i64 %27, 32
  %idxprom = ashr exact i64 %sext, 32
  %arrayidx = getelementptr inbounds double, double* %1, i64 %idxprom
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx4 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  store double 0.000000e+00, double* %arrayidx4, align 8
  %arrayidx31 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  %28 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %5, %28
  %arrayidx34 = getelementptr inbounds double, double* %2, i64 %indvars.iv12
  %add36 = fadd double %mul32, %mul35
  store double %add36, double* %arrayidx34, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp = icmp slt i64 %indvars.iv.next13, %4
  br i1 %cmp, label %for.body, label %for.cond.for.end41_crit_edge.loopexit30

for.cond.for.end41_crit_edge.loopexit:            ; preds = %for.cond5.for.inc39_crit_edge.us
  br label %for.cond.for.end41_crit_edge

for.cond.for.end41_crit_edge.loopexit30:          ; preds = %for.body
  br label %for.cond.for.end41_crit_edge

for.cond.for.end41_crit_edge:                     ; preds = %for.cond.for.end41_crit_edge.loopexit30, %for.cond.for.end41_crit_edge.loopexit
  %inc40.lcssa.in = phi i64 [ %indvars.iv.next10, %for.cond.for.end41_crit_edge.loopexit ], [ %indvars.iv.next13, %for.cond.for.end41_crit_edge.loopexit30 ]
  %inc40.lcssa = trunc i64 %inc40.lcssa.in to i32
  store i32 %inc40.lcssa, i32* %i, align 4
  br label %for.end41

for.end41:                                        ; preds = %entry, %for.cond.for.end41_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %y) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %y, double** %y.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %4 = load double*, double** %y.addr, align 8
  %5 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %6 = sext i32 %i.promoted to i64
  %7 = sext i32 %5 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %8 = phi i32 [ 0, %for.body.lr.ph ], [ %12, %for.inc ]
  %rem = srem i32 %8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  %12 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %13 = trunc i64 %indvars.iv.next to i32
  store i32 %13, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #5
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

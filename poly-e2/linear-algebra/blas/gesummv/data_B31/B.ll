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
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %0 = bitcast [1300 x [1300 x double]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %1 = bitcast [1300 x [1300 x double]]** %B to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %2 = bitcast [1300 x double]** %tmp to i8**
  store i8* %call2, i8** %2, align 8
  %call4 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %3 = bitcast [1300 x double]** %x to i8**
  store i8* %call4, i8** %3, align 8
  %call6 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
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
  %1 = load i32, i32* %n.addr, align 4
  %2 = sext i32 %1 to i64
  %3 = sext i32 %1 to i64
  %conv1 = sitofp i32 %1 to double
  %4 = load double*, double** %x.addr, align 8
  %cmp32 = icmp sgt i32 %1, 0
  %conv8 = sitofp i32 %1 to double
  %5 = load [1300 x double]*, [1300 x double]** %A.addr, align 8
  %conv18 = sitofp i32 %1 to double
  %6 = load [1300 x double]*, [1300 x double]** %B.addr, align 8
  %7 = load i32, i32* %n.addr, align 4
  %8 = sext i32 %7 to i64
  %i.promoted = load i32, i32* %i, align 4
  %9 = sext i32 %i.promoted to i64
  br i1 %cmp32, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %div9.us.v.i1.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %div9.us.v.i1.2 = insertelement <2 x double> %div9.us.v.i1.1, double %conv18, i32 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc24_crit_edge.us, %for.body.us.preheader
  %indvars.iv13 = phi i64 [ %9, %for.body.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc24_crit_edge.us ]
  %10 = trunc i64 %indvars.iv13 to i32
  %rem.us = srem i32 %10, %1
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv1
  %arrayidx.us = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double %div.us, double* %arrayidx.us, align 8
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.body5.us ]
  %11 = mul nsw i64 %indvars.iv, %indvars.iv13
  %12 = add nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %rem6.us = srem i32 %13, %1
  %conv7.us = sitofp i32 %rem6.us to double
  %arrayidx13.us = getelementptr inbounds [1300 x double], [1300 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv
  %14 = mul nsw i64 %indvars.iv, %indvars.iv13
  %15 = add nsw i64 %14, 2
  %16 = trunc i64 %15 to i32
  %rem16.us = srem i32 %16, %1
  %conv17.us = sitofp i32 %rem16.us to double
  %div9.us.v.i0.1 = insertelement <2 x double> undef, double %conv7.us, i32 0
  %div9.us.v.i0.2 = insertelement <2 x double> %div9.us.v.i0.1, double %conv17.us, i32 1
  %div9.us = fdiv <2 x double> %div9.us.v.i0.2, %div9.us.v.i1.2
  %div9.us.v.r1 = extractelement <2 x double> %div9.us, i32 0
  %div9.us.v.r2 = extractelement <2 x double> %div9.us, i32 1
  store double %div9.us.v.r1, double* %arrayidx13.us, align 8
  %arrayidx23.us = getelementptr inbounds [1300 x double], [1300 x double]* %6, i64 %indvars.iv13, i64 %indvars.iv
  store double %div9.us.v.r2, double* %arrayidx23.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %8
  br i1 %cmp3.us, label %for.body5.us, label %for.cond2.for.inc24_crit_edge.us

for.cond2.for.inc24_crit_edge.us:                 ; preds = %for.body5.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %cmp.us = icmp slt i64 %indvars.iv.next14, %2
  br i1 %cmp.us, label %for.body.us, label %for.cond.for.end26_crit_edge.loopexit

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.body ], [ %9, %for.body.preheader ]
  %17 = trunc i64 %indvars.iv15 to i32
  %rem = srem i32 %17, %1
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv1
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv15
  store double %div, double* %arrayidx, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %cmp = icmp slt i64 %indvars.iv.next16, %3
  br i1 %cmp, label %for.body, label %for.cond.for.end26_crit_edge.loopexit19

for.cond.for.end26_crit_edge.loopexit:            ; preds = %for.cond2.for.inc24_crit_edge.us
  br label %for.cond.for.end26_crit_edge

for.cond.for.end26_crit_edge.loopexit19:          ; preds = %for.body
  br label %for.cond.for.end26_crit_edge

for.cond.for.end26_crit_edge:                     ; preds = %for.cond.for.end26_crit_edge.loopexit19, %for.cond.for.end26_crit_edge.loopexit
  %inc25.lcssa.in = phi i64 [ %indvars.iv.next14, %for.cond.for.end26_crit_edge.loopexit ], [ %indvars.iv.next16, %for.cond.for.end26_crit_edge.loopexit19 ]
  %inc25.lcssa = trunc i64 %inc25.lcssa.in to i32
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
  %cmp4 = icmp sgt i32 %0, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end41

for.body.lr.ph:                                   ; preds = %entry
  %1 = load double*, double** %tmp.addr, align 8
  %2 = load double*, double** %y.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %4 = sext i32 %3 to i64
  %cmp62 = icmp sgt i32 %3, 0
  %5 = load double, double* %alpha.addr, align 8
  %6 = load double, double* %beta.addr, align 8
  %7 = load [1300 x double]*, [1300 x double]** %A.addr, align 8
  %8 = load double*, double** %x.addr, align 8
  %9 = load double*, double** %tmp.addr, align 8
  %10 = load [1300 x double]*, [1300 x double]** %B.addr, align 8
  %11 = load double*, double** %y.addr, align 8
  %12 = load i32, i32* %n.addr, align 4
  %13 = sext i32 %12 to i64
  %i.promoted = load i32, i32* %i, align 4
  %14 = sext i32 %i.promoted to i64
  br i1 %cmp62, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %mul35 = fmul double %6, 0.000000e+00
  %15 = add nsw i64 %14, 1
  %16 = icmp sgt i64 %15, %4
  %smax = select i1 %16, i64 %15, i64 %4
  %17 = sub nsw i64 %smax, %14
  %min.iters.check = icmp ult i64 %17, 4
  br i1 %min.iters.check, label %for.body.preheader48, label %min.iters.checked

for.body.preheader48:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body.preheader
  %indvars.iv14.ph = phi i64 [ %14, %vector.memcheck ], [ %14, %min.iters.checked ], [ %14, %for.body.preheader ], [ %ind.end, %middle.block ]
  br label %for.body

min.iters.checked:                                ; preds = %for.body.preheader
  %n.vec = and i64 %17, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body.preheader48, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %1, i64 %14
  %18 = add nsw i64 %14, 1
  %19 = icmp sgt i64 %18, %4
  %smax35 = select i1 %19, i64 %18, i64 %4
  %scevgep36 = getelementptr double, double* %1, i64 %smax35
  %scevgep38 = getelementptr double, double* %2, i64 %14
  %scevgep40 = getelementptr double, double* %2, i64 %smax35
  %bound0 = icmp ult double* %scevgep, %scevgep40
  %bound1 = icmp ult double* %scevgep38, %scevgep36
  %memcheck.conflict = and i1 %bound0, %bound1
  %ind.end = add nsw i64 %14, %n.vec
  br i1 %memcheck.conflict, label %for.body.preheader48, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert44 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat45 = shufflevector <2 x double> %broadcast.splatinsert44, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert46 = insertelement <2 x double> undef, double %mul35, i32 0
  %broadcast.splat47 = shufflevector <2 x double> %broadcast.splatinsert46, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = add i64 %14, %index
  %21 = getelementptr inbounds double, double* %1, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8, !alias.scope !1, !noalias !4
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %24, align 8, !alias.scope !1, !noalias !4
  %25 = getelementptr inbounds double, double* %2, i64 %20
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8, !alias.scope !4
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8, !alias.scope !4
  %29 = bitcast double* %21 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1, !noalias !4
  %30 = bitcast double* %23 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1, !noalias !4
  %31 = fmul <2 x double> %broadcast.splat45, %wide.load
  %32 = fmul <2 x double> %broadcast.splat45, %wide.load43
  %33 = fadd <2 x double> %31, %broadcast.splat47
  %34 = fadd <2 x double> %32, %broadcast.splat47
  %35 = bitcast double* %25 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4
  %36 = bitcast double* %27 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, %n.vec
  br i1 %37, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %17, %n.vec
  br i1 %cmp.n, label %for.cond.for.end41_crit_edge, label %for.body.preheader48

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %38 = sext i32 %3 to i64
  %sunkaddr = ptrtoint double* %9 to i64
  %sunkaddr53 = ptrtoint double* %9 to i64
  %sunkaddr57 = ptrtoint double* %11 to i64
  %sunkaddr61 = ptrtoint double* %11 to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond5.for.end_crit_edge.us, %for.body.us.preheader
  %indvars.iv10 = phi i64 [ %14, %for.body.us.preheader ], [ %indvars.iv.next11, %for.cond5.for.end_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx.us, align 8
  %arrayidx4.us = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx4.us, align 8
  %sunkaddr50 = shl i64 %indvars.iv10, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %sunkaddr54 = shl i64 %indvars.iv10, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %sunkaddr58 = shl i64 %indvars.iv10, 3
  %sunkaddr59 = add i64 %sunkaddr57, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  %sunkaddr62 = shl i64 %indvars.iv10, 3
  %sunkaddr63 = add i64 %sunkaddr61, %sunkaddr62
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to double*
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.body7.us ]
  %arrayidx11.us = getelementptr inbounds [1300 x double], [1300 x double]* %7, i64 %indvars.iv10, i64 %indvars.iv
  %39 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %40 = load double, double* %arrayidx13.us, align 8
  %mul.us = fmul double %39, %40
  %41 = load double, double* %sunkaddr52, align 8
  %add.us = fadd double %mul.us, %41
  store double %add.us, double* %sunkaddr56, align 8
  %arrayidx21.us = getelementptr inbounds [1300 x double], [1300 x double]* %10, i64 %indvars.iv10, i64 %indvars.iv
  %42 = load double, double* %arrayidx21.us, align 8
  %arrayidx23.us = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %43 = load double, double* %arrayidx23.us, align 8
  %mul24.us = fmul double %42, %43
  %44 = load double, double* %sunkaddr60, align 8
  %add27.us = fadd double %mul24.us, %44
  store double %add27.us, double* %sunkaddr64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp6.us = icmp slt i64 %indvars.iv.next, %13
  br i1 %cmp6.us, label %for.body7.us, label %for.cond5.for.end_crit_edge.us

for.cond5.for.end_crit_edge.us:                   ; preds = %for.body7.us
  %arrayidx31.us = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %45 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %5, %45
  %arrayidx34.us = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  %46 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %6, %46
  %add36.us = fadd double %mul32.us, %mul35.us
  %arrayidx38.us = getelementptr inbounds double, double* %2, i64 %indvars.iv10
  store double %add36.us, double* %arrayidx38.us, align 8
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %38
  br i1 %cmp.us, label %for.body.us, label %for.cond.for.end41_crit_edge.loopexit

for.body:                                         ; preds = %for.body.preheader48, %for.body
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.body ], [ %indvars.iv14.ph, %for.body.preheader48 ]
  %arrayidx = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx4 = getelementptr inbounds double, double* %2, i64 %indvars.iv14
  store double 0.000000e+00, double* %arrayidx4, align 8
  %arrayidx31 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %47 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %5, %47
  %add36 = fadd double %mul32, %mul35
  %arrayidx38 = getelementptr inbounds double, double* %2, i64 %indvars.iv14
  store double %add36, double* %arrayidx38, align 8
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %cmp = icmp slt i64 %indvars.iv.next15, %4
  br i1 %cmp, label %for.body, label %for.cond.for.end41_crit_edge.loopexit65, !llvm.loop !9

for.cond.for.end41_crit_edge.loopexit:            ; preds = %for.cond5.for.end_crit_edge.us
  br label %for.cond.for.end41_crit_edge

for.cond.for.end41_crit_edge.loopexit65:          ; preds = %for.body
  br label %for.cond.for.end41_crit_edge

for.cond.for.end41_crit_edge:                     ; preds = %for.cond.for.end41_crit_edge.loopexit65, %for.cond.for.end41_crit_edge.loopexit, %middle.block
  %inc40.lcssa.in = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv.next11, %for.cond.for.end41_crit_edge.loopexit ], [ %indvars.iv.next15, %for.cond.for.end41_crit_edge.loopexit65 ]
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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

for.body:                                         ; preds = %if.end, %for.body.lr.ph
  %indvars.iv = phi i64 [ %6, %for.body.lr.ph ], [ %indvars.iv.next, %if.end ]
  %8 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %8, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %11 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %7
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %if.end
  %12 = trunc i64 %indvars.iv.next to i32
  store i32 %12, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}

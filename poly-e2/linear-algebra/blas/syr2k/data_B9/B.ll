; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  tail call void @print_array(i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc17
  %i.04 = phi i32 [ 0, %entry ], [ %inc18, %for.inc17 ]
  %idxprom = sext i32 %i.04 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv7, %idxprom
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom, i64 %indvars.iv7
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9 = srem i32 %4, 1000
  %conv10 = sitofp i32 %rem9 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv10, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx6, align 8
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %idxprom, i64 %indvars.iv7
  store double %div.v.r2, double* %arrayidx16, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond12, label %for.inc17, label %for.body3

for.inc17:                                        ; preds = %for.body3
  %inc18 = add nsw i32 %i.04, 1
  %cmp = icmp slt i32 %inc18, 1200
  br i1 %cmp, label %for.cond1.preheader, label %for.cond24.preheader.preheader

for.cond24.preheader.preheader:                   ; preds = %for.inc17
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %i.12 = phi i32 [ %inc42, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  %idxprom34 = sext i32 %i.12 to i64
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv, %idxprom34
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom34, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %inc42 = add nsw i32 %i.12, 1
  %cmp21 = icmp slt i32 %inc42, 1200
  br i1 %cmp21, label %for.cond24.preheader, label %for.end43

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) #2 {
entry:
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %entry, %for.inc43
  %indvars.iv19 = phi i64 [ 0, %entry ], [ %indvars.iv.next20, %for.inc43 ]
  %indvars.iv17 = phi i64 [ 1, %entry ], [ %indvars.iv.next18, %for.inc43 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 0
  %2 = mul i64 %indvars.iv19, 1201
  %3 = add i64 %2, 1
  %scevgep23 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %3
  %4 = add i64 %indvars.iv19, 1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %5 = trunc i64 %indvars.iv.next20 to i32
  %xtraiter = and i32 %5, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv.prol
  %6 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %6, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !1

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.prol, %for.body3.prol.loopexit.loopexit ]
  %7 = icmp ult i64 %indvars.iv19, 3
  br i1 %7, label %for.body11.lr.ph.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.unr, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv
  %8 = bitcast double* %arrayidx5 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %mul = fmul <2 x double> %9, %mul.v.i1.2
  %10 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> %mul, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv.next.1
  %11 = bitcast double* %arrayidx5.2 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul.2 = fmul <2 x double> %12, %mul.2.v.i1.2
  %13 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> %mul.2, <2 x double>* %13, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv17
  br i1 %exitcond.3, label %for.body11.lr.ph.preheader.loopexit, label %for.body3

for.body11.lr.ph.preheader.loopexit:              ; preds = %for.body3
  br label %for.body11.lr.ph.preheader

for.body11.lr.ph.preheader:                       ; preds = %for.body11.lr.ph.preheader.loopexit, %for.body3.prol.loopexit
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.body11.lr.ph

for.body11.lr.ph:                                 ; preds = %for.body11.lr.ph.preheader, %for.inc40
  %indvar = phi i64 [ %indvar.next, %for.inc40 ], [ 0, %for.body11.lr.ph.preheader ]
  %k.05 = phi i32 [ %inc41, %for.inc40 ], [ 0, %for.body11.lr.ph.preheader ]
  %scevgep25 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvar
  %14 = add i64 %indvar, 1
  %scevgep27 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 %14
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvar
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv19, i64 %14
  %idxprom14 = sext i32 %k.05 to i64
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv19, i64 %idxprom14
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv19, i64 %idxprom14
  br i1 %min.iters.check, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body11.lr.ph
  br i1 %cmp.zero, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30
  %bound1 = icmp ult double* %arrayidx30, %scevgep23
  %found.conflict = and i1 %bound0, %bound1
  %bound034 = icmp ult double* %scevgep, %scevgep27
  %bound135 = icmp ult double* %scevgep25, %scevgep23
  %found.conflict36 = and i1 %bound034, %bound135
  %conflict.rdx = or i1 %found.conflict, %found.conflict36
  %bound037 = icmp ult double* %scevgep, %scevgep31
  %bound138 = icmp ult double* %scevgep29, %scevgep23
  %found.conflict39 = and i1 %bound037, %bound138
  %conflict.rdx40 = or i1 %conflict.rdx, %found.conflict39
  %bound043 = icmp ult double* %scevgep, %arrayidx20
  %bound144 = icmp ult double* %arrayidx20, %scevgep23
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx46 = or i1 %conflict.rdx40, %found.conflict45
  br i1 %conflict.rdx46, label %for.body11.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %15 = load double, double* %arrayidx20, align 8, !alias.scope !3
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = load double, double* %arrayidx30, align 8, !alias.scope !6
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %21 = or i64 %index, 1
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %idxprom14
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %21, i64 %idxprom14
  %24 = load double, double* %22, align 8, !alias.scope !8
  %25 = load double, double* %23, align 8, !alias.scope !8
  %26 = insertelement <2 x double> undef, double %24, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, %broadcast.splat48
  %29 = fmul <2 x double> %28, %17
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %idxprom14
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %21, i64 %idxprom14
  %32 = load double, double* %30, align 8, !alias.scope !10
  %33 = load double, double* %31, align 8, !alias.scope !10
  %34 = insertelement <2 x double> undef, double %32, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  %36 = fmul <2 x double> %35, %broadcast.splat48
  %37 = fmul <2 x double> %36, %20
  %38 = fadd <2 x double> %29, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !12, !noalias !14
  %41 = fadd <2 x double> %wide.load, %38
  %42 = bitcast double* %39 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body11.lr.ph
  %indvars.iv11.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body11.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body11

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.body11 ], [ %indvars.iv11.ph, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv11, i64 %idxprom14
  %44 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %44, %alpha
  %45 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %45
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv11, i64 %idxprom14
  %46 = load double, double* %arrayidx25, align 8
  %mul26 = fmul double %46, %alpha
  %47 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %47
  %add = fadd double %mul21, %mul31
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv11
  %48 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %48, %add
  store double %add36, double* %arrayidx35, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %indvars.iv17
  br i1 %exitcond, label %for.inc40.loopexit, label %for.body11, !llvm.loop !18

for.inc40.loopexit:                               ; preds = %for.body11
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %middle.block
  %inc41 = add nsw i32 %k.05, 1
  %cmp7 = icmp slt i32 %inc41, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp7, label %for.body11.lr.ph, label %for.inc43

for.inc43:                                        ; preds = %for.inc40
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond21, label %for.end45, label %for.body3.lr.ph

for.end45:                                        ; preds = %for.inc43
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %entry, %for.inc10
  %i.02 = phi i32 [ 0, %entry ], [ %inc11, %for.inc10 ]
  %mul = mul nuw nsw i32 %i.02, 1200
  %idxprom = sext i32 %i.02 to i64
  %3 = zext i32 %mul to i64
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %inc11 = add nsw i32 %i.02, 1
  %cmp = icmp slt i32 %inc11, 1200
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!7, !9, !11, !4}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}

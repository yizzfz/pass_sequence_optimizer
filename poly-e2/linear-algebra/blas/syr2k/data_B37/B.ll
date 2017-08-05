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
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_syr2k(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next13, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next7, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv6, %indvars.iv12
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv6
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv12, i64 %indvars.iv6
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond11, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %for.cond24.preheader.us.preheader, label %for.cond1.preheader.us

for.cond24.preheader.us.preheader:                ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.preheader.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.us.preheader ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond5, label %for.end43, label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) #2 {
for.cond1.preheader.us.preheader:
  %broadcast.splatinsert42 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat43 = shufflevector <2 x double> %broadcast.splatinsert42, <2 x double> undef, <2 x i32> zeroinitializer
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.unr, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5.us to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul.us = fmul <2 x double> %3, %mul.us.v.i1.2
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul.us.2 = fmul <2 x double> %6, %mul.us.2.v.i1.2
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %7, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv12
  br i1 %exitcond.3, label %for.cond9.preheader.us51.preheader.loopexit, label %for.inc.us

for.inc37.us34:                                   ; preds = %for.inc37.us34.preheader, %for.inc37.us34
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc37.us34 ], [ %indvars.iv3.ph, %for.inc37.us34.preheader ]
  %arrayidx15.us37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv8
  %8 = load double, double* %arrayidx15.us37, align 8
  %mul16.us38 = fmul double %8, %alpha
  %9 = load double, double* %arrayidx20.us55, align 8
  %mul21.us39 = fmul double %mul16.us38, %9
  %arrayidx25.us40 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv8
  %10 = load double, double* %arrayidx25.us40, align 8
  %mul26.us41 = fmul double %10, %alpha
  %11 = load double, double* %arrayidx30.us56, align 8
  %mul31.us42 = fmul double %mul26.us41, %11
  %add.us43 = fadd double %mul21.us39, %mul31.us42
  %arrayidx35.us44 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv3
  %12 = load double, double* %arrayidx35.us44, align 8
  %add36.us45 = fadd double %12, %add.us43
  store double %add36.us45, double* %arrayidx35.us44, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, %indvars.iv12
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us57.loopexit, label %for.inc37.us34, !llvm.loop !1

for.cond9.preheader.us51:                         ; preds = %for.cond9.preheader.us51.preheader, %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond9.for.inc40_crit_edge.us57 ], [ 0, %for.cond9.preheader.us51.preheader ]
  %13 = icmp ult i64 %48, 2
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv8
  %14 = add i64 %indvars.iv8, 1
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %14
  %scevgep24 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv8
  %scevgep26 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv14, i64 %14
  %arrayidx20.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv8
  %arrayidx30.us56 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv8
  br i1 %13, label %for.inc37.us34.preheader, label %min.iters.checked

for.inc37.us34.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us51
  %indvars.iv3.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us51 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us34

min.iters.checked:                                ; preds = %for.cond9.preheader.us51
  %15 = icmp eq i64 %n.vec, 0
  br i1 %15, label %for.inc37.us34.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us56
  %bound1 = icmp ult double* %arrayidx30.us56, %scevgep18
  %found.conflict = and i1 %bound0, %bound1
  %bound029 = icmp ult double* %scevgep, %scevgep22
  %bound130 = icmp ult double* %scevgep20, %scevgep18
  %found.conflict31 = and i1 %bound029, %bound130
  %conflict.rdx = or i1 %found.conflict, %found.conflict31
  %bound032 = icmp ult double* %scevgep, %scevgep26
  %bound133 = icmp ult double* %scevgep24, %scevgep18
  %found.conflict34 = and i1 %bound032, %bound133
  %conflict.rdx35 = or i1 %conflict.rdx, %found.conflict34
  %bound038 = icmp ult double* %scevgep, %arrayidx20.us55
  %bound139 = icmp ult double* %arrayidx20.us55, %scevgep18
  %found.conflict40 = and i1 %bound038, %bound139
  %conflict.rdx41 = or i1 %conflict.rdx35, %found.conflict40
  br i1 %conflict.rdx41, label %for.inc37.us34.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %16 = or i64 %index, 1
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv8
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %16, i64 %indvars.iv8
  %19 = load double, double* %17, align 8, !alias.scope !4
  %20 = load double, double* %18, align 8, !alias.scope !4
  %21 = insertelement <2 x double> undef, double %19, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, %broadcast.splat43
  %24 = load double, double* %arrayidx20.us55, align 8, !alias.scope !7
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fmul <2 x double> %23, %26
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv8
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %16, i64 %indvars.iv8
  %30 = load double, double* %28, align 8, !alias.scope !9
  %31 = load double, double* %29, align 8, !alias.scope !9
  %32 = insertelement <2 x double> undef, double %30, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fmul <2 x double> %33, %broadcast.splat43
  %35 = load double, double* %arrayidx30.us56, align 8, !alias.scope !11
  %36 = insertelement <2 x double> undef, double %35, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = fmul <2 x double> %34, %37
  %39 = fadd <2 x double> %27, %38
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !13, !noalias !15
  %42 = fadd <2 x double> %wide.load, %39
  %43 = bitcast double* %40 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8, !alias.scope !13, !noalias !15
  %index.next = add i64 %index, 2
  %44 = icmp eq i64 %index.next, %n.vec
  br i1 %44, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %45 = icmp eq i64 %48, %n.vec
  br i1 %45, label %for.cond9.for.inc40_crit_edge.us57, label %for.inc37.us34.preheader

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv14 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond6.for.inc43_crit_edge.us ]
  %indvars.iv12 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next13, %for.cond6.for.inc43_crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 0
  %46 = mul i64 %indvars.iv14, 1201
  %47 = add i64 %46, 1
  %scevgep18 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %47
  %48 = add i64 %indvars.iv14, 1
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %49 = trunc i64 %indvars.iv.next15 to i32
  %xtraiter = and i32 %49, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv.prol
  %50 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %50, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !17

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %51 = icmp ult i64 %indvars.iv14, 3
  br i1 %51, label %for.cond9.preheader.us51.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond9.preheader.us51.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us51.preheader

for.cond9.preheader.us51.preheader:               ; preds = %for.cond9.preheader.us51.preheader.loopexit, %for.inc.us.prol.loopexit
  %n.vec = and i64 %48, -2
  br label %for.cond9.preheader.us51

for.cond9.for.inc40_crit_edge.us57.loopexit:      ; preds = %for.inc37.us34
  br label %for.cond9.for.inc40_crit_edge.us57

for.cond9.for.inc40_crit_edge.us57:               ; preds = %for.cond9.for.inc40_crit_edge.us57.loopexit, %middle.block
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond10, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us51

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us57
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %for.end45, label %for.inc.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %C) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next3, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv2, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!12}
!12 = distinct !{!12, !6}
!13 = !{!14}
!14 = distinct !{!14, !6}
!15 = !{!12, !5, !10, !8}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}

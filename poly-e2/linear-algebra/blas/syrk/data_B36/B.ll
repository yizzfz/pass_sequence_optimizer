; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv919.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next10.us, %for.inc7.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv517.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next6.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv517.us, %indvars.iv919.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv919.us, i64 %indvars.iv517.us
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond21 = icmp eq i64 %indvars.iv517.us, 999
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv517.us, 1
  br i1 %exitcond21, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv919.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next10.us, 1200
  br i1 %exitcond24, label %for.cond14.preheader.preheader, label %for.cond1.preheader.us

for.cond14.preheader.preheader:                   ; preds = %for.inc7.us
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv314 = phi i64 [ %indvars.iv.next4, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.body17 ]
  %3 = mul nuw nsw i64 %indvars.iv12, %indvars.iv314
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv314, i64 %indvars.iv12
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv314, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond23, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %for.inc32.us ], [ 1, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv1320.us = phi i64 [ %3, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %0 = add i64 %indvars.iv1320.us, 1
  %1 = add i64 %indvars.iv1320.us, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv1320.us, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %4 = mul i64 %indvars.iv1320.us, 1201
  %5 = add i64 %4, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %min.iters.check19 = icmp ult i64 %3, 4
  br i1 %min.iters.check19, label %for.body3.us.preheader, label %min.iters.checked20

min.iters.checked20:                              ; preds = %for.cond1.preheader.us
  %n.vec22 = and i64 %3, -4
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  br i1 %cmp.zero23, label %for.body3.us.preheader, label %vector.ph24

vector.ph24:                                      ; preds = %min.iters.checked20
  %6 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body16.prol, label %vector.body16.prol.loopexit

vector.body16.prol:                               ; preds = %vector.ph24
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load33.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load34.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load33.prol, %broadcast.splat36
  %12 = fmul <2 x double> %wide.load34.prol, %broadcast.splat36
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  br label %vector.body16.prol.loopexit

vector.body16.prol.loopexit:                      ; preds = %vector.body16.prol, %vector.ph24
  %index25.unr.ph = phi i64 [ 4, %vector.body16.prol ], [ 0, %vector.ph24 ]
  %13 = icmp eq i64 %2, 0
  br i1 %13, label %middle.block17, label %vector.ph24.new

vector.ph24.new:                                  ; preds = %vector.body16.prol.loopexit
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16, %vector.ph24.new
  %index25 = phi i64 [ %index25.unr.ph, %vector.ph24.new ], [ %index.next26.1, %vector.body16 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index25
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load33, %broadcast.splat36
  %19 = fmul <2 x double> %wide.load34, %broadcast.splat36
  store <2 x double> %18, <2 x double>* %15, align 8
  store <2 x double> %19, <2 x double>* %17, align 8
  %index.next26 = add i64 %index25, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index.next26
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load33.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load34.1 = load <2 x double>, <2 x double>* %23, align 8
  %24 = fmul <2 x double> %wide.load33.1, %broadcast.splat36
  %25 = fmul <2 x double> %wide.load34.1, %broadcast.splat36
  store <2 x double> %24, <2 x double>* %21, align 8
  store <2 x double> %25, <2 x double>* %23, align 8
  %index.next26.1 = add i64 %index25, 8
  %26 = icmp eq i64 %index.next26.1, %n.vec22
  br i1 %26, label %middle.block17, label %vector.body16, !llvm.loop !1

middle.block17:                                   ; preds = %vector.body16, %vector.body16.prol.loopexit
  %cmp.n28 = icmp eq i64 %3, %n.vec22
  br i1 %cmp.n28, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block17, %min.iters.checked20, %for.cond1.preheader.us
  %indvars.iv15.us.ph = phi i64 [ 0, %min.iters.checked20 ], [ 0, %for.cond1.preheader.us ], [ %n.vec22, %middle.block17 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next.us, %for.body3.us ], [ %indvars.iv15.us.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us
  %27 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %27, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %indvars.iv1122.us
  br i1 %exitcond.us, label %for.cond9.preheader.us.preheader, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.us.preheader:                 ; preds = %for.body3.us, %middle.block17
  %n.vec = and i64 %3, -4
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc29.us
  %indvars.iv918.us = phi i64 [ %29, %for.inc29.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %28 = icmp ult i64 %3, 4
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv918.us
  %29 = add i64 %indvars.iv918.us, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %29
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  br i1 %28, label %for.body11.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us
  %30 = icmp eq i64 %n.vec, 0
  br i1 %30, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %arrayidx15.us
  %bound110 = icmp ult double* %arrayidx15.us, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx15.us, align 8, !alias.scope !6
  %31 = insertelement <2 x double> undef, double %.pre, i32 0
  %32 = fmul <2 x double> %31, %broadcast.splatinsert13
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = or i64 %index, 1
  %35 = or i64 %index, 2
  %36 = or i64 %index, 3
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv918.us
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %34, i64 %indvars.iv918.us
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %35, i64 %indvars.iv918.us
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %36, i64 %indvars.iv918.us
  %41 = load double, double* %37, align 8, !alias.scope !9
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = load double, double* %39, align 8, !alias.scope !9
  %44 = load double, double* %40, align 8, !alias.scope !9
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = fmul <2 x double> %33, %46
  %50 = fmul <2 x double> %33, %48
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !11, !noalias !13
  %55 = fadd <2 x double> %wide.load, %49
  %56 = fadd <2 x double> %wide.load15, %50
  store <2 x double> %55, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %56, <2 x double>* %54, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %58 = icmp eq i64 %3, %n.vec
  br i1 %58, label %for.inc29.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us
  %indvars.iv316.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us ], [ %n.vec, %middle.block ]
  %59 = sub i64 %0, %indvars.iv316.us.ph
  %xtraiter37 = and i64 %59, 1
  %lcmp.mod38 = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod38, label %for.body11.us.prol.loopexit, label %for.body11.us.prol

for.body11.us.prol:                               ; preds = %for.body11.us.preheader
  %60 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %60, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us.ph, i64 %indvars.iv918.us
  %61 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %61
  %arrayidx25.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us.ph
  %62 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %62, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  %indvars.iv.next4.us.prol = or i64 %indvars.iv316.us.ph, 1
  br label %for.body11.us.prol.loopexit

for.body11.us.prol.loopexit:                      ; preds = %for.body11.us.prol, %for.body11.us.preheader
  %indvars.iv316.us.unr.ph = phi i64 [ %indvars.iv.next4.us.prol, %for.body11.us.prol ], [ %indvars.iv316.us.ph, %for.body11.us.preheader ]
  %63 = icmp eq i64 %indvars.iv1320.us, %indvars.iv316.us.ph
  br i1 %63, label %for.inc29.us, label %for.body11.us.preheader.new

for.body11.us.preheader.new:                      ; preds = %for.body11.us.prol.loopexit
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.body11.us.preheader.new
  %indvars.iv316.us = phi i64 [ %indvars.iv316.us.unr.ph, %for.body11.us.preheader.new ], [ %indvars.iv.next4.us.1, %for.body11.us ]
  %64 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %64, %alpha
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %65 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %65
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us
  %66 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %66, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %67 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %67, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4.us, i64 %indvars.iv918.us
  %68 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %68
  %arrayidx25.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next4.us
  %69 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %69, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next4.us.1 = add nsw i64 %indvars.iv316.us, 2
  %exitcond8.us.1 = icmp eq i64 %indvars.iv.next4.us.1, %indvars.iv1122.us
  br i1 %exitcond8.us.1, label %for.inc29.us, label %for.body11.us, !llvm.loop !15

for.inc29.us:                                     ; preds = %for.body11.us.prol.loopexit, %for.body11.us, %middle.block
  %exitcond = icmp eq i64 %29, 1000
  br i1 %exitcond, label %for.inc32.us, label %for.cond9.preheader.us

for.inc32.us:                                     ; preds = %for.inc29.us
  %cmp.us = icmp slt i64 %3, 1200
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end34

for.end34:                                        ; preds = %for.inc32.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge
  %indvars.iv28 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv28, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond10, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!10, !7}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}

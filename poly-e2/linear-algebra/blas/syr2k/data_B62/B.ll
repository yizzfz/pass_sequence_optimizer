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
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc17.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv1121.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next12.us, %for.inc17.us ]
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
  %exitcond23 = icmp eq i64 %indvars.iv519.us, 999
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv519.us, 1
  br i1 %exitcond23, label %for.inc17.us, label %for.body3.us

for.inc17.us:                                     ; preds = %for.body3.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1121.us, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond26, label %for.cond24.preheader.preheader, label %for.cond1.preheader.us

for.cond24.preheader.preheader:                   ; preds = %for.inc17.us
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %indvars.iv316 = phi i64 [ %indvars.iv.next4, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv14, %indvars.iv316
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv316, i64 %indvars.iv14
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv316, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond27, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc43.us, %for.cond1.preheader.us.preheader
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %for.inc43.us ], [ 1, %for.cond1.preheader.us.preheader ]
  %indvars.iv1320.us = phi i64 [ %2, %for.inc43.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = add i64 %indvars.iv1320.us, -3
  %1 = lshr i64 %0, 2
  %2 = add i64 %indvars.iv1320.us, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %3 = mul i64 %indvars.iv1320.us, 1201
  %4 = add i64 %3, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %4
  %min.iters.check31 = icmp ult i64 %2, 4
  br i1 %min.iters.check31, label %for.body3.us.preheader, label %min.iters.checked32

min.iters.checked32:                              ; preds = %for.cond1.preheader.us
  %n.vec34 = and i64 %2, -4
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  br i1 %cmp.zero35, label %for.body3.us.preheader, label %vector.ph36

vector.ph36:                                      ; preds = %min.iters.checked32
  %5 = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %5, 0
  br i1 %lcmp.mod, label %vector.body28.prol, label %vector.body28.prol.loopexit

vector.body28.prol:                               ; preds = %vector.ph36
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load45.prol = load <2 x double>, <2 x double>* %7, align 8
  %8 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load46.prol = load <2 x double>, <2 x double>* %9, align 8
  %10 = fmul <2 x double> %wide.load45.prol, %broadcast.splat48
  %11 = fmul <2 x double> %wide.load46.prol, %broadcast.splat48
  store <2 x double> %10, <2 x double>* %7, align 8
  store <2 x double> %11, <2 x double>* %9, align 8
  br label %vector.body28.prol.loopexit

vector.body28.prol.loopexit:                      ; preds = %vector.body28.prol, %vector.ph36
  %index37.unr.ph = phi i64 [ 4, %vector.body28.prol ], [ 0, %vector.ph36 ]
  %12 = icmp eq i64 %1, 0
  br i1 %12, label %middle.block29, label %vector.ph36.new

vector.ph36.new:                                  ; preds = %vector.body28.prol.loopexit
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph36.new
  %index37 = phi i64 [ %index37.unr.ph, %vector.ph36.new ], [ %index.next38.1, %vector.body28 ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index37
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %16, align 8
  %17 = fmul <2 x double> %wide.load45, %broadcast.splat48
  %18 = fmul <2 x double> %wide.load46, %broadcast.splat48
  store <2 x double> %17, <2 x double>* %14, align 8
  store <2 x double> %18, <2 x double>* %16, align 8
  %index.next38 = add i64 %index37, 4
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index.next38
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load45.1 = load <2 x double>, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load46.1 = load <2 x double>, <2 x double>* %22, align 8
  %23 = fmul <2 x double> %wide.load45.1, %broadcast.splat48
  %24 = fmul <2 x double> %wide.load46.1, %broadcast.splat48
  store <2 x double> %23, <2 x double>* %20, align 8
  store <2 x double> %24, <2 x double>* %22, align 8
  %index.next38.1 = add i64 %index37, 8
  %25 = icmp eq i64 %index.next38.1, %n.vec34
  br i1 %25, label %middle.block29, label %vector.body28, !llvm.loop !1

middle.block29:                                   ; preds = %vector.body28, %vector.body28.prol.loopexit
  %cmp.n40 = icmp eq i64 %2, %n.vec34
  br i1 %cmp.n40, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block29, %min.iters.checked32, %for.cond1.preheader.us
  %indvars.iv15.us.ph = phi i64 [ 0, %min.iters.checked32 ], [ 0, %for.cond1.preheader.us ], [ %n.vec34, %middle.block29 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next.us, %for.body3.us ], [ %indvars.iv15.us.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us
  %26 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %26, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, %indvars.iv1122.us
  br i1 %exitcond.us, label %for.cond9.preheader.us.preheader, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.us.preheader:                 ; preds = %for.body3.us, %middle.block29
  %n.vec = and i64 %2, -2
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc40.us
  %indvars.iv918.us = phi i64 [ %28, %for.inc40.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %27 = icmp ult i64 %2, 2
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv918.us
  %28 = add i64 %indvars.iv918.us, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %28
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv918.us
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %28
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  %arrayidx30.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  br i1 %27, label %for.body11.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us
  %29 = icmp eq i64 %n.vec, 0
  br i1 %29, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us
  %bound1 = icmp ult double* %arrayidx30.us, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %arrayidx20.us
  %bound123 = icmp ult double* %arrayidx20.us, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx20.us, align 8, !alias.scope !6
  %.pre49 = load double, double* %arrayidx30.us, align 8, !alias.scope !9
  %30 = insertelement <2 x double> undef, double %.pre, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x double> undef, double %.pre49, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = or i64 %index, 1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv918.us
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %34, i64 %indvars.iv918.us
  %37 = load double, double* %35, align 8, !alias.scope !11
  %38 = load double, double* %36, align 8, !alias.scope !11
  %39 = insertelement <2 x double> undef, double %37, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %40, %broadcast.splat27
  %42 = fmul <2 x double> %41, %31
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv918.us
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %34, i64 %indvars.iv918.us
  %45 = load double, double* %43, align 8, !alias.scope !13
  %46 = load double, double* %44, align 8, !alias.scope !13
  %47 = insertelement <2 x double> undef, double %45, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fmul <2 x double> %48, %broadcast.splat27
  %50 = fmul <2 x double> %49, %33
  %51 = fadd <2 x double> %42, %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !15, !noalias !17
  %54 = fadd <2 x double> %wide.load, %51
  store <2 x double> %54, <2 x double>* %53, align 8, !alias.scope !15, !noalias !17
  %index.next = add i64 %index, 2
  %55 = icmp eq i64 %index.next, %n.vec
  br i1 %55, label %middle.block, label %vector.body, !llvm.loop !18

middle.block:                                     ; preds = %vector.body
  %56 = icmp eq i64 %2, %n.vec
  br i1 %56, label %for.inc40.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us
  %indvars.iv316.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv316.us = phi i64 [ %indvars.iv.next4.us, %for.body11.us ], [ %indvars.iv316.us.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %57 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %57, %alpha
  %58 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %58
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %59 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %59, %alpha
  %60 = load double, double* %arrayidx30.us, align 8
  %mul31.us = fmul double %mul26.us, %60
  %add.us = fadd double %mul21.us, %mul31.us
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us
  %61 = load double, double* %arrayidx35.us, align 8
  %add36.us = fadd double %61, %add.us
  store double %add36.us, double* %arrayidx35.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %exitcond8.us = icmp eq i64 %indvars.iv.next4.us, %indvars.iv1122.us
  br i1 %exitcond8.us, label %for.inc40.us, label %for.body11.us, !llvm.loop !19

for.inc40.us:                                     ; preds = %for.body11.us, %middle.block
  %exitcond25 = icmp eq i64 %28, 1000
  br i1 %exitcond25, label %for.inc43.us, label %for.cond9.preheader.us

for.inc43.us:                                     ; preds = %for.inc40.us
  %cmp.us = icmp slt i64 %2, 1200
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end45

for.end45:                                        ; preds = %for.inc43.us
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
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !2, !3}
!19 = distinct !{!19, !2, !3}

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
  tail call fastcc void @print_array([1200 x double]* %arraydecay)
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
for.cond1.preheader.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc17, %for.cond1.preheader.preheader
  %indvars.iv22 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next23, %for.inc17 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next17, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv16, %indvars.iv22
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv16
  store double %div, double* %arrayidx6, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9 = srem i32 %4, 1000
  %conv10 = sitofp i32 %rem9 to double
  %div12 = fdiv double %conv10, 1.000000e+03
  %arrayidx16 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv16
  store double %div12, double* %arrayidx16, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond21, label %for.inc17, label %for.body3

for.inc17:                                        ; preds = %for.body3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %for.cond24.preheader.preheader, label %for.cond1.preheader

for.cond24.preheader.preheader:                   ; preds = %for.inc17
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv13
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.preheader:
  %broadcast.splatinsert47 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat48 = shufflevector <2 x double> %broadcast.splatinsert47, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert26 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat27 = shufflevector <2 x double> %broadcast.splatinsert26, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.preheader, %for.inc43
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next26, %for.inc43 ]
  %indvars.iv23 = phi i64 [ 1, %for.cond1.preheader.preheader ], [ %indvars.iv.next24, %for.inc43 ]
  %0 = add i64 %indvars.iv25, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 0
  %1 = mul i64 %indvars.iv25, 1201
  %2 = add i64 %1, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %2
  %3 = add i64 %indvars.iv25, 1
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %4 = trunc i64 %indvars.iv.next26 to i32
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.prol ], [ %xtraiter, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv.prol
  %5 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %5, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !1

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.prol, %for.body3.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %indvars.iv25, 3
  br i1 %6, label %for.cond9.preheader.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %7 = sub i64 %0, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check31 = icmp ult i64 %9, 2
  br i1 %min.iters.check31, label %for.body3.preheader49, label %min.iters.checked32

min.iters.checked32:                              ; preds = %for.body3.preheader
  %n.mod.vf33 = and i64 %9, 1
  %n.vec34 = sub nsw i64 %9, %n.mod.vf33
  %cmp.zero35 = icmp eq i64 %n.vec34, 0
  %10 = add i64 %indvars.iv.unr, 4
  %11 = shl nuw i64 %8, 2
  %12 = add i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf33, 2
  %ind.end = sub i64 %12, %13
  br i1 %cmp.zero35, label %for.body3.preheader49, label %vector.ph36

vector.ph36:                                      ; preds = %min.iters.checked32
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28, %vector.ph36
  %index37 = phi i64 [ 0, %vector.ph36 ], [ %index.next38, %vector.body28 ]
  %14 = shl i64 %index37, 2
  %15 = add i64 %indvars.iv.unr, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %15
  %17 = bitcast double* %16 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %17, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec44 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec45 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec46 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %18 = fmul <2 x double> %strided.vec, %broadcast.splat48
  %19 = fmul <2 x double> %strided.vec44, %broadcast.splat48
  %20 = fmul <2 x double> %strided.vec45, %broadcast.splat48
  %21 = add nsw i64 %15, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %21
  %23 = fmul <2 x double> %strided.vec46, %broadcast.splat48
  %24 = getelementptr double, double* %22, i64 -3
  %25 = bitcast double* %24 to <8 x double>*
  %26 = shufflevector <2 x double> %18, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %20, <2 x double> %23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %25, align 8
  %index.next38 = add i64 %index37, 2
  %28 = icmp eq i64 %index.next38, %n.vec34
  br i1 %28, label %middle.block29, label %vector.body28, !llvm.loop !3

middle.block29:                                   ; preds = %vector.body28
  %cmp.n40 = icmp eq i64 %n.mod.vf33, 0
  br i1 %cmp.n40, label %for.cond9.preheader.preheader, label %for.body3.preheader49

for.body3.preheader49:                            ; preds = %middle.block29, %min.iters.checked32, %for.body3.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked32 ], [ %indvars.iv.unr, %for.body3.preheader ], [ %ind.end, %middle.block29 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader49, %for.body3
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3 ], [ %indvars.iv.ph, %for.body3.preheader49 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv
  %29 = load double, double* %arrayidx5, align 8
  %mul = fmul double %29, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %30, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv.next.1
  %31 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %31, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv.next.2
  %32 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %32, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv23
  br i1 %exitcond.3, label %for.cond9.preheader.preheader.loopexit, label %for.body3, !llvm.loop !6

for.cond9.preheader.preheader.loopexit:           ; preds = %for.body3
  br label %for.cond9.preheader.preheader

for.cond9.preheader.preheader:                    ; preds = %for.cond9.preheader.preheader.loopexit, %middle.block29, %for.body3.prol.loopexit
  %min.iters.check = icmp ult i64 %3, 2
  %n.vec = and i64 %3, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc40
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc40 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv19
  %33 = add i64 %indvars.iv19, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %33
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv19
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %33
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv19
  %arrayidx30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv19
  br i1 %min.iters.check, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  br i1 %cmp.zero, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30
  %bound1 = icmp ult double* %arrayidx30, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep6
  %bound114 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound016 = icmp ult double* %scevgep, %scevgep10
  %bound117 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx19 = or i1 %conflict.rdx, %found.conflict18
  %bound022 = icmp ult double* %scevgep, %arrayidx20
  %bound123 = icmp ult double* %arrayidx20, %scevgep2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx19, %found.conflict24
  br i1 %conflict.rdx25, label %for.body11.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %34 = load double, double* %arrayidx20, align 8, !alias.scope !8
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = load double, double* %arrayidx30, align 8, !alias.scope !11
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %40 = or i64 %index, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv19
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %40, i64 %indvars.iv19
  %43 = load double, double* %41, align 8, !alias.scope !13
  %44 = load double, double* %42, align 8, !alias.scope !13
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat27
  %48 = fmul <2 x double> %47, %36
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv19
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %40, i64 %indvars.iv19
  %51 = load double, double* %49, align 8, !alias.scope !15
  %52 = load double, double* %50, align 8, !alias.scope !15
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat27
  %56 = fmul <2 x double> %55, %39
  %57 = fadd <2 x double> %48, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !19
  %60 = fadd <2 x double> %wide.load, %57
  %61 = bitcast double* %58 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8, !alias.scope !17, !noalias !19
  %index.next = add i64 %index, 2
  %62 = icmp eq i64 %index.next, %n.vec
  br i1 %62, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  br label %for.body11

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.body11 ], [ %indvars.iv14.ph, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv19
  %63 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %63, %alpha
  %64 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %64
  %arrayidx25 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv19
  %65 = load double, double* %arrayidx25, align 8
  %mul26 = fmul double %65, %alpha
  %66 = load double, double* %arrayidx30, align 8
  %mul31 = fmul double %mul26, %66
  %add = fadd double %mul21, %mul31
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv14
  %67 = load double, double* %arrayidx35, align 8
  %add36 = fadd double %67, %add
  store double %add36, double* %arrayidx35, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, %indvars.iv23
  br i1 %exitcond, label %for.inc40.loopexit, label %for.body11, !llvm.loop !21

for.inc40.loopexit:                               ; preds = %for.body11
  br label %for.inc40

for.inc40:                                        ; preds = %for.inc40.loopexit, %middle.block
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond21, label %for.inc43, label %for.cond9.preheader

for.inc43:                                        ; preds = %for.inc40
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond27, label %for.end45, label %for.body3.lr.ph

for.end45:                                        ; preds = %for.inc43
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next9, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv8, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.preheader

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
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}

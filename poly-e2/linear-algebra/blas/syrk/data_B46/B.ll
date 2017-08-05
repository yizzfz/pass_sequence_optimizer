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
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv914 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc7 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv513 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next6, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv513, %indvars.iv914
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1200
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.200000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv914, i64 %indvars.iv513
  store double %div, double* %arrayidx6, align 8
  %exitcond1 = icmp eq i64 %indvars.iv513, 999
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  br i1 %exitcond1, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv914, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond3, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv312 = phi i64 [ %indvars.iv.next4, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.body17 ]
  %3 = mul nuw nsw i64 %indvars.iv11, %indvars.iv312
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv312, i64 %indvars.iv11
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond2, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert14 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert36 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat37 = shufflevector <2 x double> %broadcast.splatinsert36, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv1119 = phi i64 [ 1, %entry ], [ %indvars.iv.next12, %for.inc32 ]
  %indvars.iv1318 = phi i64 [ 0, %entry ], [ %3, %for.inc32 ]
  %0 = add i64 %indvars.iv1318, 1
  %1 = add i64 %indvars.iv1318, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv1318, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 0
  %4 = mul i64 %indvars.iv1318, 1201
  %5 = add i64 %4, 1
  %scevgep3 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %min.iters.check20 = icmp ult i64 %3, 4
  br i1 %min.iters.check20, label %for.body3.preheader, label %min.iters.checked21

min.iters.checked21:                              ; preds = %for.cond1.preheader
  %n.vec23 = and i64 %3, -4
  %cmp.zero24 = icmp eq i64 %n.vec23, 0
  br i1 %cmp.zero24, label %for.body3.preheader, label %vector.ph25

vector.ph25:                                      ; preds = %min.iters.checked21
  %6 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body17.prol, label %vector.body17.prol.loopexit

vector.body17.prol:                               ; preds = %vector.ph25
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load34.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load35.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load34.prol, %broadcast.splat37
  %12 = fmul <2 x double> %wide.load35.prol, %broadcast.splat37
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  br label %vector.body17.prol.loopexit

vector.body17.prol.loopexit:                      ; preds = %vector.body17.prol, %vector.ph25
  %index26.unr.ph = phi i64 [ 4, %vector.body17.prol ], [ 0, %vector.ph25 ]
  %13 = icmp eq i64 %2, 0
  br i1 %13, label %middle.block18, label %vector.ph25.new

vector.ph25.new:                                  ; preds = %vector.body17.prol.loopexit
  br label %vector.body17

vector.body17:                                    ; preds = %vector.body17, %vector.ph25.new
  %index26 = phi i64 [ %index26.unr.ph, %vector.ph25.new ], [ %index.next27.1, %vector.body17 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %index26
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load34, %broadcast.splat37
  %19 = fmul <2 x double> %wide.load35, %broadcast.splat37
  store <2 x double> %18, <2 x double>* %15, align 8
  store <2 x double> %19, <2 x double>* %17, align 8
  %index.next27 = add i64 %index26, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %index.next27
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load34.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load35.1 = load <2 x double>, <2 x double>* %23, align 8
  %24 = fmul <2 x double> %wide.load34.1, %broadcast.splat37
  %25 = fmul <2 x double> %wide.load35.1, %broadcast.splat37
  store <2 x double> %24, <2 x double>* %21, align 8
  store <2 x double> %25, <2 x double>* %23, align 8
  %index.next27.1 = add i64 %index26, 8
  %26 = icmp eq i64 %index.next27.1, %n.vec23
  br i1 %26, label %middle.block18, label %vector.body17, !llvm.loop !1

middle.block18:                                   ; preds = %vector.body17, %vector.body17.prol.loopexit
  %cmp.n29 = icmp eq i64 %3, %n.vec23
  br i1 %cmp.n29, label %for.cond9.preheader.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block18, %min.iters.checked21, %for.cond1.preheader
  %indvars.iv15.ph = phi i64 [ 0, %min.iters.checked21 ], [ 0, %for.cond1.preheader ], [ %n.vec23, %middle.block18 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv15 = phi i64 [ %indvars.iv.next, %for.body3 ], [ %indvars.iv15.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv15
  %27 = load double, double* %arrayidx5, align 8
  %mul = fmul double %27, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv1119
  br i1 %exitcond, label %for.cond9.preheader.preheader, label %for.body3, !llvm.loop !4

for.cond9.preheader.preheader:                    ; preds = %for.body3, %middle.block18
  %n.vec = and i64 %3, -4
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv917 = phi i64 [ %29, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %28 = icmp ult i64 %3, 4
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv917
  %29 = add i64 %indvars.iv917, 1
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1318, i64 %29
  %arrayidx15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1318, i64 %indvars.iv917
  br i1 %28, label %for.body11.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader
  %30 = icmp eq i64 %n.vec, 0
  br i1 %30, label %for.body11.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep, %arrayidx15
  %bound111 = icmp ult double* %arrayidx15, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.body11.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx15, align 8, !alias.scope !6
  %31 = insertelement <2 x double> undef, double %.pre, i32 0
  %32 = fmul <2 x double> %31, %broadcast.splatinsert14
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %34 = or i64 %index, 1
  %35 = or i64 %index, 2
  %36 = or i64 %index, 3
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv917
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %34, i64 %indvars.iv917
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %35, i64 %indvars.iv917
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %36, i64 %indvars.iv917
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
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %index
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !11, !noalias !13
  %55 = fadd <2 x double> %wide.load, %49
  %56 = fadd <2 x double> %wide.load16, %50
  store <2 x double> %55, <2 x double>* %52, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %56, <2 x double>* %54, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %58 = icmp eq i64 %3, %n.vec
  br i1 %58, label %for.inc29, label %for.body11.preheader

for.body11.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader
  %indvars.iv316.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader ], [ %n.vec, %middle.block ]
  %59 = sub i64 %0, %indvars.iv316.ph
  %xtraiter38 = and i64 %59, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %for.body11.prol.loopexit, label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.preheader
  %60 = load double, double* %arrayidx15, align 8
  %mul16.prol = fmul double %60, %alpha
  %arrayidx20.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.ph, i64 %indvars.iv917
  %61 = load double, double* %arrayidx20.prol, align 8
  %mul21.prol = fmul double %mul16.prol, %61
  %arrayidx25.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv316.ph
  %62 = load double, double* %arrayidx25.prol, align 8
  %add.prol = fadd double %62, %mul21.prol
  store double %add.prol, double* %arrayidx25.prol, align 8
  %indvars.iv.next4.prol = or i64 %indvars.iv316.ph, 1
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol, %for.body11.preheader
  %indvars.iv316.unr.ph = phi i64 [ %indvars.iv.next4.prol, %for.body11.prol ], [ %indvars.iv316.ph, %for.body11.preheader ]
  %63 = icmp eq i64 %indvars.iv1318, %indvars.iv316.ph
  br i1 %63, label %for.inc29, label %for.body11.preheader.new

for.body11.preheader.new:                         ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.preheader.new
  %indvars.iv316 = phi i64 [ %indvars.iv316.unr.ph, %for.body11.preheader.new ], [ %indvars.iv.next4.1, %for.body11 ]
  %64 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %64, %alpha
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316, i64 %indvars.iv917
  %65 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %65
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv316
  %66 = load double, double* %arrayidx25, align 8
  %add = fadd double %66, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv316, 1
  %67 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %67, %alpha
  %arrayidx20.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv917
  %68 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %68
  %arrayidx25.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1318, i64 %indvars.iv.next4
  %69 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %69, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv316, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next4.1, %indvars.iv1119
  br i1 %exitcond8.1, label %for.inc29, label %for.body11, !llvm.loop !15

for.inc29:                                        ; preds = %for.body11.prol.loopexit, %for.body11, %middle.block
  %exitcond1 = icmp eq i64 %29, 1000
  br i1 %exitcond1, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %cmp = icmp slt i64 %3, 1200
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end34

for.end34:                                        ; preds = %for.inc32
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

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

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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
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
  %indvars.iv30 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next31, %for.inc7.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv24, %indvars.iv30
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv24
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond = icmp eq i64 %indvars.iv24, 999
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br i1 %exitcond, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next31, 1200
  br i1 %exitcond35, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.inc7.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.inc31.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.inc31.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv22
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 1000
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.000000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv22, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %exitcond34 = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond34, label %for.inc31.us, label %for.body17.us

for.inc31.us:                                     ; preds = %for.body17.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond36, label %for.end33, label %for.cond14.preheader.us

for.end33:                                        ; preds = %for.inc31.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* readonly %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv73 = phi i32 [ %indvars.iv.next74, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv59 = phi i64 [ %3, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %0 = add i64 %indvar, 1
  %1 = add i64 %indvar, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv59, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 0
  %4 = mul i64 %indvars.iv59, 1201
  %5 = add i64 %4, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %6 = zext i32 %indvars.iv73 to i64
  %cmp24.us = icmp slt i64 %indvars.iv59, 0
  br i1 %cmp24.us, label %for.inc32.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us
  %min.iters.check19 = icmp ult i64 %3, 4
  br i1 %min.iters.check19, label %for.body3.us.preheader37, label %min.iters.checked20

min.iters.checked20:                              ; preds = %for.body3.us.preheader
  %n.vec22 = and i64 %3, -4
  %cmp.zero23 = icmp eq i64 %n.vec22, 0
  br i1 %cmp.zero23, label %for.body3.us.preheader37, label %vector.ph24

vector.ph24:                                      ; preds = %min.iters.checked20
  %7 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %vector.body16.prol, label %vector.body16.prol.loopexit

vector.body16.prol:                               ; preds = %vector.ph24
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 0
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load33.prol = load <2 x double>, <2 x double>* %9, align 8
  %10 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load34.prol = load <2 x double>, <2 x double>* %11, align 8
  %12 = fmul <2 x double> %wide.load33.prol, %broadcast.splat36
  %13 = fmul <2 x double> %wide.load34.prol, %broadcast.splat36
  store <2 x double> %12, <2 x double>* %9, align 8
  store <2 x double> %13, <2 x double>* %11, align 8
  br label %vector.body16.prol.loopexit

vector.body16.prol.loopexit:                      ; preds = %vector.body16.prol, %vector.ph24
  %index25.unr.ph = phi i64 [ 4, %vector.body16.prol ], [ 0, %vector.ph24 ]
  %14 = icmp eq i64 %2, 0
  br i1 %14, label %middle.block17, label %vector.ph24.new

vector.ph24.new:                                  ; preds = %vector.body16.prol.loopexit
  br label %vector.body16

vector.body16:                                    ; preds = %vector.body16, %vector.ph24.new
  %index25 = phi i64 [ %index25.unr.ph, %vector.ph24.new ], [ %index.next26.1, %vector.body16 ]
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %index25
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %18, align 8
  %19 = fmul <2 x double> %wide.load33, %broadcast.splat36
  %20 = fmul <2 x double> %wide.load34, %broadcast.splat36
  store <2 x double> %19, <2 x double>* %16, align 8
  store <2 x double> %20, <2 x double>* %18, align 8
  %index.next26 = add i64 %index25, 4
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %index.next26
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load33.1 = load <2 x double>, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load34.1 = load <2 x double>, <2 x double>* %24, align 8
  %25 = fmul <2 x double> %wide.load33.1, %broadcast.splat36
  %26 = fmul <2 x double> %wide.load34.1, %broadcast.splat36
  store <2 x double> %25, <2 x double>* %22, align 8
  store <2 x double> %26, <2 x double>* %24, align 8
  %index.next26.1 = add i64 %index25, 8
  %27 = icmp eq i64 %index.next26.1, %n.vec22
  br i1 %27, label %middle.block17, label %vector.body16, !llvm.loop !1

middle.block17:                                   ; preds = %vector.body16, %vector.body16.prol.loopexit
  %cmp.n28 = icmp eq i64 %3, %n.vec22
  br i1 %cmp.n28, label %for.cond9.preheader.us20.preheader, label %for.body3.us.preheader37

for.body3.us.preheader37:                         ; preds = %middle.block17, %min.iters.checked20, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked20 ], [ 0, %for.body3.us.preheader ], [ %n.vec22, %middle.block17 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader37, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader37 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv
  %28 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %28, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond72 = icmp eq i64 %indvars.iv, %6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond72, label %for.cond9.preheader.us20.preheader, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.us20.preheader:               ; preds = %for.body3.us, %middle.block17
  %n.vec = and i64 %3, -4
  br label %for.cond9.preheader.us20

for.cond9.preheader.us20:                         ; preds = %for.cond9.preheader.us20.preheader, %for.inc29.us39
  %indvars.iv56 = phi i64 [ %30, %for.inc29.us39 ], [ 0, %for.cond9.preheader.us20.preheader ]
  %29 = icmp ult i64 %3, 4
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv56
  %30 = add i64 %indvars.iv56, 1
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv59, i64 %30
  %arrayidx15.us24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv56
  br i1 %29, label %for.body11.us26.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us20
  %31 = icmp eq i64 %n.vec, 0
  br i1 %31, label %for.body11.us26.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %arrayidx15.us24
  %bound110 = icmp ult double* %arrayidx15.us24, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body11.us26.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %.pre = load double, double* %arrayidx15.us24, align 8, !alias.scope !6
  %32 = insertelement <2 x double> undef, double %.pre, i32 0
  %33 = fmul <2 x double> %32, %broadcast.splatinsert13
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %35 = or i64 %index, 1
  %36 = or i64 %index, 2
  %37 = or i64 %index, 3
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv56
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %35, i64 %indvars.iv56
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %36, i64 %indvars.iv56
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %37, i64 %indvars.iv56
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = load double, double* %39, align 8, !alias.scope !9
  %44 = load double, double* %40, align 8, !alias.scope !9
  %45 = load double, double* %41, align 8, !alias.scope !9
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %34, %47
  %51 = fmul <2 x double> %34, %49
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !11, !noalias !13
  %56 = fadd <2 x double> %50, %wide.load
  %57 = fadd <2 x double> %51, %wide.load15
  store <2 x double> %56, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %57, <2 x double>* %55, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %58 = icmp eq i64 %index.next, %n.vec
  br i1 %58, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %59 = icmp eq i64 %3, %n.vec
  br i1 %59, label %for.inc29.us39, label %for.body11.us26.preheader

for.body11.us26.preheader:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us20
  %indvars.iv50.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us20 ], [ %n.vec, %middle.block ]
  %60 = sub i64 %0, %indvars.iv50.ph
  %xtraiter38 = and i64 %60, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %for.body11.us26.prol.loopexit, label %for.body11.us26.prol

for.body11.us26.prol:                             ; preds = %for.body11.us26.preheader
  %61 = load double, double* %arrayidx15.us24, align 8
  %mul16.us28.prol = fmul double %61, %alpha
  %arrayidx20.us30.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv50.ph, i64 %indvars.iv56
  %62 = load double, double* %arrayidx20.us30.prol, align 8
  %mul21.us31.prol = fmul double %mul16.us28.prol, %62
  %arrayidx25.us33.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv50.ph
  %63 = load double, double* %arrayidx25.us33.prol, align 8
  %add.us34.prol = fadd double %mul21.us31.prol, %63
  store double %add.us34.prol, double* %arrayidx25.us33.prol, align 8
  %indvars.iv.next51.prol = or i64 %indvars.iv50.ph, 1
  br label %for.body11.us26.prol.loopexit

for.body11.us26.prol.loopexit:                    ; preds = %for.body11.us26.prol, %for.body11.us26.preheader
  %indvars.iv50.unr.ph = phi i64 [ %indvars.iv.next51.prol, %for.body11.us26.prol ], [ %indvars.iv50.ph, %for.body11.us26.preheader ]
  %64 = icmp eq i64 %indvar, %indvars.iv50.ph
  br i1 %64, label %for.inc29.us39, label %for.body11.us26.preheader.new

for.body11.us26.preheader.new:                    ; preds = %for.body11.us26.prol.loopexit
  br label %for.body11.us26

for.body11.us26:                                  ; preds = %for.body11.us26, %for.body11.us26.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr.ph, %for.body11.us26.preheader.new ], [ %indvars.iv.next51.1, %for.body11.us26 ]
  %65 = load double, double* %arrayidx15.us24, align 8
  %mul16.us28 = fmul double %65, %alpha
  %arrayidx20.us30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv56
  %66 = load double, double* %arrayidx20.us30, align 8
  %mul21.us31 = fmul double %mul16.us28, %66
  %arrayidx25.us33 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv50
  %67 = load double, double* %arrayidx25.us33, align 8
  %add.us34 = fadd double %mul21.us31, %67
  store double %add.us34, double* %arrayidx25.us33, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %68 = load double, double* %arrayidx15.us24, align 8
  %mul16.us28.1 = fmul double %68, %alpha
  %arrayidx20.us30.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv56
  %69 = load double, double* %arrayidx20.us30.1, align 8
  %mul21.us31.1 = fmul double %mul16.us28.1, %69
  %arrayidx25.us33.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv.next51
  %70 = load double, double* %arrayidx25.us33.1, align 8
  %add.us34.1 = fadd double %mul21.us31.1, %70
  store double %add.us34.1, double* %arrayidx25.us33.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next51, %6
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  br i1 %exitcond.1, label %for.inc29.us39, label %for.body11.us26, !llvm.loop !15

for.inc29.us39:                                   ; preds = %for.body11.us26.prol.loopexit, %for.body11.us26, %middle.block
  %exitcond75 = icmp eq i64 %30, 1000
  br i1 %exitcond75, label %for.inc32.us, label %for.cond9.preheader.us20

for.inc32.us:                                     ; preds = %for.inc29.us39, %for.cond1.preheader.us
  %cmp.us = icmp slt i64 %3, 1200
  %indvars.iv.next74 = add i32 %indvars.iv73, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end34

for.end34:                                        ; preds = %for.inc32.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader.us_crit_edge ], [ %indvars.iv.next11, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

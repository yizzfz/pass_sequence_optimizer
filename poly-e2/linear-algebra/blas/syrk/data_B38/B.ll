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
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %broadcast.splatinsert16 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert38 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat39 = shufflevector <2 x double> %broadcast.splatinsert38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.inc32.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv1 = phi i64 [ %3, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %0 = add i64 %indvars.iv1, 1
  %1 = add i64 %indvars.iv1, -3
  %2 = lshr i64 %1, 2
  %3 = add i64 %indvars.iv1, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 0
  %4 = mul i64 %indvars.iv1, 1201
  %5 = add i64 %4, 1
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %5
  %min.iters.check22 = icmp ult i64 %3, 4
  br i1 %min.iters.check22, label %for.body3.us.preheader40, label %min.iters.checked23

min.iters.checked23:                              ; preds = %for.body3.us.preheader
  %n.vec25 = and i64 %3, -4
  %cmp.zero26 = icmp eq i64 %n.vec25, 0
  br i1 %cmp.zero26, label %for.body3.us.preheader40, label %vector.ph27

vector.ph27:                                      ; preds = %min.iters.checked23
  %6 = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %6, 0
  br i1 %lcmp.mod, label %vector.body19.prol, label %vector.body19.prol.loopexit

vector.body19.prol:                               ; preds = %vector.ph27
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 0
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load36.prol = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load37.prol = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load36.prol, %broadcast.splat39
  %12 = fmul <2 x double> %wide.load37.prol, %broadcast.splat39
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  br label %vector.body19.prol.loopexit

vector.body19.prol.loopexit:                      ; preds = %vector.body19.prol, %vector.ph27
  %index28.unr.ph = phi i64 [ 4, %vector.body19.prol ], [ 0, %vector.ph27 ]
  %13 = icmp eq i64 %2, 0
  br i1 %13, label %middle.block20, label %vector.ph27.new

vector.ph27.new:                                  ; preds = %vector.body19.prol.loopexit
  br label %vector.body19

vector.body19:                                    ; preds = %vector.body19, %vector.ph27.new
  %index28 = phi i64 [ %index28.unr.ph, %vector.ph27.new ], [ %index.next29.1, %vector.body19 ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %index28
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load36, %broadcast.splat39
  %19 = fmul <2 x double> %wide.load37, %broadcast.splat39
  store <2 x double> %18, <2 x double>* %15, align 8
  store <2 x double> %19, <2 x double>* %17, align 8
  %index.next29 = add i64 %index28, 4
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %index.next29
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load36.1 = load <2 x double>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load37.1 = load <2 x double>, <2 x double>* %23, align 8
  %24 = fmul <2 x double> %wide.load36.1, %broadcast.splat39
  %25 = fmul <2 x double> %wide.load37.1, %broadcast.splat39
  store <2 x double> %24, <2 x double>* %21, align 8
  store <2 x double> %25, <2 x double>* %23, align 8
  %index.next29.1 = add i64 %index28, 8
  %26 = icmp eq i64 %index.next29.1, %n.vec25
  br i1 %26, label %middle.block20, label %vector.body19, !llvm.loop !1

middle.block20:                                   ; preds = %vector.body19, %vector.body19.prol.loopexit
  %cmp.n31 = icmp eq i64 %3, %n.vec25
  br i1 %cmp.n31, label %for.cond9.preheader.us20.preheader, label %for.body3.us.preheader40

for.body3.us.preheader40:                         ; preds = %middle.block20, %min.iters.checked23, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked23 ], [ 0, %for.body3.us.preheader ], [ %n.vec25, %middle.block20 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader40, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader40 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %indvars.iv
  %27 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %27, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond72 = icmp eq i64 %indvars.iv, %indvars.iv1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond72, label %for.cond9.preheader.us20.preheader, label %for.body3.us, !llvm.loop !4

for.cond9.preheader.us20.preheader:               ; preds = %for.body3.us, %middle.block20
  %n.vec = and i64 %3, -4
  br label %for.cond9.preheader.us20

for.cond9.preheader.us20:                         ; preds = %for.cond9.preheader.us20.preheader, %for.inc29.us39
  %indvars.iv56 = phi i64 [ %29, %for.inc29.us39 ], [ 0, %for.cond9.preheader.us20.preheader ]
  %28 = icmp ult i64 %3, 4
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv56
  %29 = add i64 %indvars.iv56, 1
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1, i64 %29
  %arrayidx15.us24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv56
  br i1 %28, label %for.body11.us26.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us20
  %30 = icmp eq i64 %n.vec, 0
  br i1 %30, label %for.body11.us26.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %arrayidx15.us24
  %bound113 = icmp ult double* %arrayidx15.us24, %scevgep5
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.body11.us26.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %arrayidx15.us24, align 8, !alias.scope !6
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = fmul <2 x double> %35, %broadcast.splatinsert16
  %37 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv56
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %31, i64 %indvars.iv56
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %32, i64 %indvars.iv56
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %33, i64 %indvars.iv56
  %42 = load double, double* %38, align 8, !alias.scope !9
  %43 = load double, double* %39, align 8, !alias.scope !9
  %44 = load double, double* %40, align 8, !alias.scope !9
  %45 = load double, double* %41, align 8, !alias.scope !9
  %46 = insertelement <2 x double> undef, double %42, i32 0
  %47 = insertelement <2 x double> %46, double %43, i32 1
  %48 = insertelement <2 x double> undef, double %44, i32 0
  %49 = insertelement <2 x double> %48, double %45, i32 1
  %50 = fmul <2 x double> %37, %47
  %51 = fmul <2 x double> %37, %49
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %index
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !11, !noalias !13
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !11, !noalias !13
  %56 = fadd <2 x double> %50, %wide.load
  %57 = fadd <2 x double> %51, %wide.load18
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
  %xtraiter41 = and i64 %60, 1
  %lcmp.mod42 = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod42, label %for.body11.us26.prol.loopexit, label %for.body11.us26.prol

for.body11.us26.prol:                             ; preds = %for.body11.us26.preheader
  %61 = load double, double* %arrayidx15.us24, align 8
  %mul16.us28.prol = fmul double %61, %alpha
  %arrayidx20.us30.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv50.ph, i64 %indvars.iv56
  %62 = load double, double* %arrayidx20.us30.prol, align 8
  %mul21.us31.prol = fmul double %mul16.us28.prol, %62
  %arrayidx25.us33.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %indvars.iv50.ph
  %63 = load double, double* %arrayidx25.us33.prol, align 8
  %add.us34.prol = fadd double %mul21.us31.prol, %63
  store double %add.us34.prol, double* %arrayidx25.us33.prol, align 8
  %indvars.iv.next51.prol = or i64 %indvars.iv50.ph, 1
  br label %for.body11.us26.prol.loopexit

for.body11.us26.prol.loopexit:                    ; preds = %for.body11.us26.prol, %for.body11.us26.preheader
  %indvars.iv50.unr.ph = phi i64 [ %indvars.iv.next51.prol, %for.body11.us26.prol ], [ %indvars.iv50.ph, %for.body11.us26.preheader ]
  %64 = icmp eq i64 %indvars.iv1, %indvars.iv50.ph
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
  %arrayidx25.us33 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %indvars.iv50
  %67 = load double, double* %arrayidx25.us33, align 8
  %add.us34 = fadd double %mul21.us31, %67
  store double %add.us34, double* %arrayidx25.us33, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %68 = load double, double* %arrayidx15.us24, align 8
  %mul16.us28.1 = fmul double %68, %alpha
  %arrayidx20.us30.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next51, i64 %indvars.iv56
  %69 = load double, double* %arrayidx20.us30.1, align 8
  %mul21.us31.1 = fmul double %mul16.us28.1, %69
  %arrayidx25.us33.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1, i64 %indvars.iv.next51
  %70 = load double, double* %arrayidx25.us33.1, align 8
  %add.us34.1 = fadd double %mul21.us31.1, %70
  store double %add.us34.1, double* %arrayidx25.us33.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next51, %indvars.iv1
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  br i1 %exitcond.1, label %for.inc29.us39, label %for.body11.us26, !llvm.loop !15

for.inc29.us39:                                   ; preds = %for.body11.us26.prol.loopexit, %for.body11.us26, %middle.block
  %exitcond75 = icmp eq i64 %29, 1000
  br i1 %exitcond75, label %for.inc32.us, label %for.cond9.preheader.us20

for.inc32.us:                                     ; preds = %for.inc29.us39
  %exitcond3 = icmp eq i64 %3, 1200
  br i1 %exitcond3, label %for.end34, label %for.body3.us.preheader

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

; ModuleID = 'A.ll'
source_filename = "symm.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc16.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv1832.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next19.us, %for.inc16.us ]
  %0 = add nuw nsw i64 %indvars.iv1832.us, 1200
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv1430.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next15.us, %for.body3.us ]
  %1 = add nuw nsw i64 %indvars.iv1430.us, %indvars.iv1832.us
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1832.us, i64 %indvars.iv1430.us
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = sub nuw nsw i64 %0, %indvars.iv1430.us
  %4 = trunc i64 %3 to i32
  %rem8.us = srem i32 %4, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv1832.us, i64 %indvars.iv1430.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %exitcond34 = icmp eq i64 %indvars.iv1430.us, 1199
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1430.us, 1
  br i1 %exitcond34, label %for.inc16.us, label %for.body3.us

for.inc16.us:                                     ; preds = %for.body3.us
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1832.us, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next19.us, 1000
  br i1 %exitcond37, label %for.cond23.preheader.preheader, label %for.cond1.preheader.us

for.cond23.preheader.preheader:                   ; preds = %for.inc16.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvars.iv1028 = phi i64 [ %indvars.iv.next11, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv1226 = phi i64 [ %indvars.iv.next13, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %5 = sub i64 999, %indvars.iv1226
  %6 = add i64 %5, -4
  %7 = lshr i64 %6, 2
  %8 = add nuw nsw i64 %7, 1
  %9 = sub i64 999, %indvars.iv1226
  %10 = and i64 %indvars.iv1226, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.cond23.preheader
  %11 = trunc i64 %indvars.iv1226 to i32
  %rem28.prol = srem i32 %11, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.cond23.preheader
  %indvars.iv21.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.cond23.preheader ]
  %12 = icmp eq i64 %indvars.iv1226, 0
  br i1 %12, label %for.cond40.preheader, label %for.cond23.preheader.new

for.cond23.preheader.new:                         ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader:                             ; preds = %for.body26, %for.body26.prol.loopexit
  %exitcond923 = icmp eq i64 %indvars.iv1226, 999
  br i1 %exitcond923, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.cond40.preheader
  %min.iters.check = icmp ult i64 %9, 4
  br i1 %min.iters.check, label %for.body43.preheader2, label %min.iters.checked

for.body43.preheader2:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv.next724.in.ph = phi i64 [ %indvars.iv1226, %min.iters.checked ], [ %indvars.iv1226, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv1226, %n.vec
  br i1 %cmp.zero, label %for.body43.preheader2, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter3 = and i64 %8, 3
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter3, %vector.body.prol.preheader ]
  %offset.idx.prol = add i64 %indvars.iv1226, %index.prol
  %13 = add nuw nsw i64 %offset.idx.prol, 1
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %17, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol ]
  %18 = icmp ult i64 %6, 12
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %offset.idx = add i64 %indvars.iv1226, %index
  %19 = add nuw nsw i64 %offset.idx, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %23, align 8
  %index.next = add i64 %index, 4
  %offset.idx.1 = add i64 %indvars.iv1226, %index.next
  %24 = add nuw nsw i64 %offset.idx.1, 1
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %28, align 8
  %index.next.1 = add i64 %index, 8
  %offset.idx.2 = add i64 %indvars.iv1226, %index.next.1
  %29 = add nuw nsw i64 %offset.idx.2, 1
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %33, align 8
  %index.next.2 = add i64 %index, 12
  %offset.idx.3 = add i64 %indvars.iv1226, %index.next.2
  %34 = add nuw nsw i64 %offset.idx.3, 1
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %36, align 8
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %38, align 8
  %index.next.3 = add i64 %index, 16
  %39 = icmp eq i64 %index.next.3, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %9, %n.vec
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader2

for.body26:                                       ; preds = %for.body26, %for.cond23.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %for.cond23.preheader.new ], [ %indvars.iv.next.1, %for.body26 ]
  %40 = add nuw nsw i64 %indvars.iv21, %indvars.iv1226
  %41 = trunc i64 %40 to i32
  %rem28 = srem i32 %41, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %indvars.iv21
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv21, 1
  %42 = add nuw nsw i64 %indvars.iv.next, %indvars.iv1226
  %43 = trunc i64 %42 to i32
  %rem28.1 = srem i32 %43, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1028
  br i1 %exitcond.1, label %for.cond40.preheader, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader2, %for.body43
  %indvars.iv.next724.in = phi i64 [ %indvars.iv.next724, %for.body43 ], [ %indvars.iv.next724.in.ph, %for.body43.preheader2 ]
  %indvars.iv.next724 = add nuw nsw i64 %indvars.iv.next724.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1226, i64 %indvars.iv.next724
  store double -9.990000e+02, double* %arrayidx47, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next724, 999
  br i1 %exitcond9, label %for.inc51, label %for.body43, !llvm.loop !6

for.inc51:                                        ; preds = %for.body43, %middle.block, %for.cond40.preheader
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1226, 1
  %cmp20 = icmp slt i64 %indvars.iv.next13, 1000
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1028, 1
  br i1 %cmp20, label %for.cond23.preheader, label %for.end53

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %mul44.us.us = fmul double %alpha, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 1, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %B, i64 1, i64 0
  %0 = bitcast double* %scevgep5 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %0, %C
  %1 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %1, %B
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat14 = shufflevector <2 x double> %broadcast.splatinsert13, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert17 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat18 = shufflevector <2 x double> %broadcast.splatinsert17, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %mul44.us.us, i32 0
  %broadcast.splat20 = shufflevector <2 x double> %broadcast.splatinsert19, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc53.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv513.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next6.us, %for.inc53.us ]
  %exitcond7.us = icmp eq i64 %indvars.iv513.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv513.us, i64 %indvars.iv513.us
  br i1 %exitcond7.us, label %vector.memcheck, label %for.cond4.preheader.us15.preheader

for.cond4.preheader.us15.preheader:               ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us15

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %2 = bitcast double* %arrayidx41.us to [1200 x double]*
  %bound08 = icmp ugt [1200 x double]* %2, %C
  %bound19 = icmp ult double* %arrayidx41.us, %scevgep
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.cond4.preheader.us.us.preheader, label %vector.ph

for.cond4.preheader.us.us.preheader:              ; preds = %vector.memcheck
  br label %for.cond4.preheader.us.us

vector.ph:                                        ; preds = %vector.memcheck
  %3 = load double, double* %arrayidx41.us, align 8, !alias.scope !8
  %4 = insertelement <2 x double> undef, double %3, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !11, !noalias !13
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !11, !noalias !13
  %10 = fmul <2 x double> %wide.load, %broadcast.splat14
  %11 = fmul <2 x double> %wide.load12, %broadcast.splat14
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !15
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !15
  %16 = fmul <2 x double> %wide.load15, %broadcast.splat18
  %17 = fmul <2 x double> %wide.load16, %broadcast.splat18
  %18 = fmul <2 x double> %16, %5
  %19 = fmul <2 x double> %17, %5
  %20 = fadd <2 x double> %10, %18
  %21 = fadd <2 x double> %11, %19
  %22 = fadd <2 x double> %broadcast.splat20, %20
  %23 = fadd <2 x double> %broadcast.splat20, %21
  store <2 x double> %22, <2 x double>* %7, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %23, <2 x double>* %9, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %24 = icmp eq i64 %index.next, 1200
  br i1 %24, label %for.inc53.us, label %vector.body, !llvm.loop !16

for.cond4.preheader.us15:                         ; preds = %for.cond4.preheader.us15.preheader, %for.end.us34
  %indvars.iv311.us16 = phi i64 [ %indvars.iv.next4.us44, %for.end.us34 ], [ 0, %for.cond4.preheader.us15.preheader ]
  %arrayidx8.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv513.us, i64 %indvars.iv311.us16
  br label %for.body6.us19

for.body6.us19:                                   ; preds = %for.body6.us19, %for.cond4.preheader.us15
  %temp2.09.us20 = phi double [ 0.000000e+00, %for.cond4.preheader.us15 ], [ %add27.us29, %for.body6.us19 ]
  %indvars.iv8.us21 = phi i64 [ 0, %for.cond4.preheader.us15 ], [ %indvars.iv.next.us30, %for.body6.us19 ]
  %25 = load double, double* %arrayidx8.us18, align 8
  %mul.us22 = fmul double %25, %alpha
  %arrayidx12.us23 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv513.us, i64 %indvars.iv8.us21
  %26 = load double, double* %arrayidx12.us23, align 8
  %mul13.us24 = fmul double %mul.us22, %26
  %arrayidx17.us25 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8.us21, i64 %indvars.iv311.us16
  %27 = load double, double* %arrayidx17.us25, align 8
  %add.us26 = fadd double %27, %mul13.us24
  store double %add.us26, double* %arrayidx17.us25, align 8
  %arrayidx21.us27 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv8.us21, i64 %indvars.iv311.us16
  %28 = load double, double* %arrayidx21.us27, align 8
  %29 = load double, double* %arrayidx12.us23, align 8
  %mul26.us28 = fmul double %28, %29
  %add27.us29 = fadd double %temp2.09.us20, %mul26.us28
  %indvars.iv.next.us30 = add nuw nsw i64 %indvars.iv8.us21, 1
  %exitcond.us31 = icmp eq i64 %indvars.iv.next.us30, %indvars.iv513.us
  br i1 %exitcond.us31, label %for.end.us34, label %for.body6.us19

for.end.us34:                                     ; preds = %for.body6.us19
  %arrayidx31.us36 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv513.us, i64 %indvars.iv311.us16
  %30 = load double, double* %arrayidx31.us36, align 8
  %mul32.us37 = fmul double %30, %beta
  %31 = load double, double* %arrayidx8.us18, align 8
  %mul37.us39 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us, align 8
  %mul42.us40 = fmul double %mul37.us39, %32
  %add43.us41 = fadd double %mul32.us37, %mul42.us40
  %mul44.us42 = fmul double %add27.us29, %alpha
  %add45.us43 = fadd double %mul44.us42, %add43.us41
  store double %add45.us43, double* %arrayidx31.us36, align 8
  %indvars.iv.next4.us44 = add nuw nsw i64 %indvars.iv311.us16, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next4.us44, 1200
  br i1 %exitcond50, label %for.inc53.us, label %for.cond4.preheader.us15

for.inc53.us:                                     ; preds = %for.end.us34, %vector.body, %for.cond4.preheader.us.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv513.us, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond51, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv311.us.us = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next4.us.us.1, %for.cond4.preheader.us.us ]
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv311.us.us
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %arrayidx36.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv311.us.us
  %34 = load double, double* %arrayidx36.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next4.us.us = or i64 %indvars.iv311.us.us, 1
  %arrayidx31.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv.next4.us.us
  %36 = load double, double* %arrayidx31.us.us.1, align 8
  %mul32.us.us.1 = fmul double %36, %beta
  %arrayidx36.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv.next4.us.us
  %37 = load double, double* %arrayidx36.us.us.1, align 8
  %mul37.us.us.1 = fmul double %37, %alpha
  %38 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us.1 = fmul double %mul37.us.us.1, %38
  %add43.us.us.1 = fadd double %mul32.us.us.1, %mul42.us.us.1
  %add45.us.us.1 = fadd double %mul44.us.us, %add43.us.us.1
  store double %add45.us.us.1, double* %arrayidx31.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next4.us.us, 1199
  %indvars.iv.next4.us.us.1 = add nsw i64 %indvars.iv311.us.us, 2
  br i1 %exitcond.1, label %for.inc53.us, label %for.cond4.preheader.us.us, !llvm.loop !17

for.end55:                                        ; preds = %for.inc53.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc10.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.inc10.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv28.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv6.us, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond10, label %for.end12, label %for.cond2.preheader.us

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
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}

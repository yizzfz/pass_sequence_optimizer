; ModuleID = 'A.ll'
source_filename = "symm.c"
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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.end_crit_edge.us, %entry
  %indvars.iv44 = phi i64 [ 0, %entry ], [ %indvars.iv.next45, %for.cond1.for.end_crit_edge.us ]
  %0 = add i64 %indvars.iv44, 1200
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv39 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next40, %for.body3.us ]
  %1 = add nuw nsw i64 %indvars.iv44, %indvars.iv39
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv39
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = sub i64 %0, %indvars.iv39
  %4 = trunc i64 %3 to i32
  %rem8.us = srem i32 %4, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv39
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond43, label %for.cond1.for.end_crit_edge.us, label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond48, label %for.body26.lr.ph.preheader, label %for.cond1.preheader.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.end50
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.end50 ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end50 ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = sub nsw i64 0, %indvars.iv36
  %6 = trunc i64 %5 to i32
  %7 = add i32 %6, 7
  %8 = add i32 %6, 998
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %xtraiter50 = and i64 %indvars.iv.next37, 1
  %lcmp.mod = icmp eq i64 %xtraiter50, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.body26.lr.ph
  %9 = trunc i64 %indvars.iv36 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.body26.lr.ph, %for.body26.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.body26.lr.ph ]
  %10 = icmp eq i64 %indvars.iv36, 0
  br i1 %10, label %for.cond40.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.body26.prol.loopexit.unr-lcssa
  %cmp4110 = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %cmp4110, label %for.body43.lr.ph, label %for.end50

for.body43.lr.ph:                                 ; preds = %for.cond40.preheader
  %xtraiter30 = and i32 %7, 7
  %lcmp.mod31 = icmp eq i32 %xtraiter30, 0
  br i1 %lcmp.mod31, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv27.prol = phi i64 [ %indvars.iv.next28.prol, %for.body43.prol ], [ %indvars.iv34, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter30, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv27.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv27.unr = phi i64 [ %indvars.iv34, %for.body43.lr.ph ], [ %indvars.iv.next28.prol, %for.body43.prol.loopexit.loopexit ]
  %11 = icmp ult i32 %8, 7
  br i1 %11, label %for.end50, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %12 = sub i64 992, %indvars.iv27.unr
  %13 = lshr i64 %12, 3
  %14 = add nuw nsw i64 %13, 1
  %min.iters.check = icmp ult i64 %14, 2
  br i1 %min.iters.check, label %for.body43.preheader52, label %min.iters.checked

for.body43.preheader52:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv27.ph = phi i64 [ %indvars.iv27.unr, %min.iters.checked ], [ %indvars.iv27.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %14, 1
  %n.vec = sub nsw i64 %14, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %15 = add i64 %indvars.iv27.unr, 8
  %16 = shl nuw i64 %13, 3
  %17 = add i64 %15, %16
  %18 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %17, %18
  br i1 %cmp.zero, label %for.body43.preheader52, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %19 = shl i64 %index, 3
  %20 = add i64 %indvars.iv27.unr, %19
  %21 = add nsw i64 %20, 7
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %21
  %23 = getelementptr double, double* %22, i64 -7
  %24 = bitcast double* %23 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %24, align 8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, %n.vec
  br i1 %25, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.end50, label %for.body43.preheader52

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %26 = add nuw nsw i64 %indvars.iv36, %indvars.iv
  %27 = trunc i64 %26 to i32
  %rem28 = srem i32 %27, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = add nuw nsw i64 %indvars.iv36, %indvars.iv.next
  %29 = trunc i64 %28 to i32
  %rem28.1 = srem i32 %29, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %30 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader52, %for.body43
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.7, %for.body43 ], [ %indvars.iv27.ph, %for.body43.preheader52 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv27
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next28.2 = add nsw i64 %indvars.iv27, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next28.3 = add nsw i64 %indvars.iv27, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next28.4 = add nsw i64 %indvars.iv27, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next28.5 = add nsw i64 %indvars.iv27, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next28.6 = add nsw i64 %indvars.iv27, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next28.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next28.7 = add nsw i64 %indvars.iv27, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next28.7, 1000
  br i1 %exitcond.7, label %for.end50.loopexit, label %for.body43, !llvm.loop !6

for.end50.loopexit:                               ; preds = %for.body43
  br label %for.end50

for.end50:                                        ; preds = %for.end50.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond, label %for.end53, label %for.body26.lr.ph

for.end53:                                        ; preds = %for.end50
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44.us35 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert101 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat102 = shufflevector <2 x double> %broadcast.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert107 = insertelement <2 x double> undef, double %mul44.us35, i32 0
  %broadcast.splat108 = shufflevector <2 x double> %broadcast.splatinsert107, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.end52_crit_edge.us
  %indvars.iv80 = phi i64 [ %0, %for.cond1.for.end52_crit_edge.us ], [ 0, %entry ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 0
  %0 = add i64 %indvars.iv80, 1
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp53.us = icmp sgt i64 %indvars.iv80, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv80, i64 %indvars.iv80
  br i1 %cmp53.us, label %for.body3.us.us.preheader, label %vector.memcheck

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.body3.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv80, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep93
  %bound1 = icmp ult double* %scevgep91, %scevgep89
  %found.conflict = and i1 %bound0, %bound1
  %bound096 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound197 = icmp ult double* %arrayidx41.us.us, %scevgep89
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx = or i1 %found.conflict, %found.conflict98
  br i1 %conflict.rdx, label %for.body3.us19.preheader, label %vector.ph

for.body3.us19.preheader:                         ; preds = %vector.memcheck
  br label %for.body3.us19

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat102
  %6 = fmul <2 x double> %wide.load100, %broadcast.splat102
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv80, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load103, %broadcast.splat106
  %12 = fmul <2 x double> %wide.load104, %broadcast.splat106
  %13 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %11, %15
  %17 = fmul <2 x double> %12, %15
  %18 = fadd <2 x double> %5, %16
  %19 = fadd <2 x double> %6, %17
  %20 = fadd <2 x double> %18, %broadcast.splat108
  %21 = fadd <2 x double> %19, %broadcast.splat108
  store <2 x double> %20, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  store <2 x double> %21, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %22 = icmp eq i64 %index.next, 1200
  br i1 %22, label %for.cond1.for.end52_crit_edge.us.loopexit112, label %vector.body, !llvm.loop !16

for.body3.us19:                                   ; preds = %for.body3.us19, %for.body3.us19.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.us19.preheader ], [ %indvars.iv.next.1, %for.body3.us19 ]
  %arrayidx31.us28 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 %indvars.iv
  %23 = load double, double* %arrayidx31.us28, align 8
  %mul32.us29 = fmul double %23, %beta
  %arrayidx36.us30 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv80, i64 %indvars.iv
  %24 = load double, double* %arrayidx36.us30, align 8
  %mul37.us31 = fmul double %24, %alpha
  %25 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us33 = fmul double %mul37.us31, %25
  %add43.us34 = fadd double %mul32.us29, %mul42.us33
  %add45.us36 = fadd double %add43.us34, %mul44.us35
  store double %add45.us36, double* %arrayidx31.us28, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us28.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 %indvars.iv.next
  %26 = load double, double* %arrayidx31.us28.1, align 8
  %mul32.us29.1 = fmul double %26, %beta
  %arrayidx36.us30.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv80, i64 %indvars.iv.next
  %27 = load double, double* %arrayidx36.us30.1, align 8
  %mul37.us31.1 = fmul double %27, %alpha
  %28 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us33.1 = fmul double %mul37.us31.1, %28
  %add43.us34.1 = fadd double %mul32.us29.1, %mul42.us33.1
  %add45.us36.1 = fadd double %add43.us34.1, %mul44.us35
  store double %add45.us36.1, double* %arrayidx31.us28.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.cond1.for.end52_crit_edge.us.loopexit111, label %for.body3.us19, !llvm.loop !17

for.cond1.for.end52_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.end52_crit_edge.us

for.cond1.for.end52_crit_edge.us.loopexit111:     ; preds = %for.body3.us19
  br label %for.cond1.for.end52_crit_edge.us

for.cond1.for.end52_crit_edge.us.loopexit112:     ; preds = %vector.body
  br label %for.cond1.for.end52_crit_edge.us

for.cond1.for.end52_crit_edge.us:                 ; preds = %for.cond1.for.end52_crit_edge.us.loopexit112, %for.cond1.for.end52_crit_edge.us.loopexit111, %for.cond1.for.end52_crit_edge.us.loopexit
  %exitcond83 = icmp eq i64 %0, 1000
  br i1 %exitcond83, label %for.end55, label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv80, i64 %indvars.iv74
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 %indvars.iv74
  %29 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %29, %beta
  %30 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %31
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %add43.us.us, %mul44.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond79, label %for.cond1.for.end52_crit_edge.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body3.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.body6.us.us ], [ 0, %for.body3.us.us ]
  %32 = phi double [ %add27.us.us, %for.body6.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %33 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %33, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv80, i64 %indvars.iv66
  %34 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %34
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv66, i64 %indvars.iv74
  %35 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %35, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv74
  %36 = load double, double* %arrayidx21.us.us, align 8
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %36, %37
  %add27.us.us = fadd double %32, %mul26.us.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next67, %indvars.iv80
  br i1 %exitcond73, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.end52_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv9 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}

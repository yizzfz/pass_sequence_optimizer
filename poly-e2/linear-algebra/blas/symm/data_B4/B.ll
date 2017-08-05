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
  tail call fastcc void @print_array([1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nsw i64 %indvars.iv33, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv29 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next30, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv29, %indvars.iv33
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv29 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond32, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond37, label %for.body26.lr.ph.preheader, label %for.cond1.preheader.us

for.body26.lr.ph.preheader:                       ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.body26.lr.ph.preheader, %for.inc51
  %indvars.iv25 = phi i64 [ %indvars.iv.next2643, %for.inc51 ], [ 0, %for.body26.lr.ph.preheader ]
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc51 ], [ 1, %for.body26.lr.ph.preheader ]
  %5 = sub i64 999, %indvars.iv25
  %6 = sub i64 998, %indvars.iv25
  %7 = and i64 %indvars.iv25, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body26.prol, label %for.body26.prol.loopexit

for.body26.prol:                                  ; preds = %for.body26.lr.ph
  %8 = trunc i64 %indvars.iv25 to i32
  %rem28.prol = srem i32 %8, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  %9 = icmp eq i64 %indvars.iv25, 0
  br i1 %9, label %for.body43.lr.ph, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader:                             ; preds = %for.body26
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %cmp414 = icmp slt i64 %indvars.iv.next26, 1000
  br i1 %cmp414, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.body26.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next2644 = phi i64 [ %indvars.iv.next26, %for.cond40.preheader ], [ 1, %for.body26.prol.loopexit ]
  %xtraiter39 = and i64 %5, 7
  %lcmp.mod40 = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod40, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %for.body43.prol ], [ %indvars.iv23, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter39, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv19.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv19.unr = phi i64 [ %indvars.iv23, %for.body43.lr.ph ], [ %indvars.iv.next20.prol, %for.body43.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %11 = sub i64 992, %indvars.iv19.unr
  %12 = lshr i64 %11, 3
  %13 = add nuw nsw i64 %12, 1
  %min.iters.check = icmp ult i64 %13, 2
  br i1 %min.iters.check, label %for.body43.preheader1, label %min.iters.checked

for.body43.preheader1:                            ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %n.mod.vf = and i64 %13, 1
  %n.vec = sub nsw i64 %13, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = add i64 %indvars.iv19.unr, 8
  %15 = shl nuw i64 %12, 3
  %16 = add i64 %14, %15
  %17 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %16, %17
  br i1 %cmp.zero, label %for.body43.preheader1, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %18 = shl i64 %index, 3
  %19 = add i64 %indvars.iv19.unr, %18
  %20 = add nsw i64 %19, 7
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %20
  %22 = getelementptr double, double* %21, i64 -7
  %23 = bitcast double* %22 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %23, align 8
  %index.next = add i64 %index, 2
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader1

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %25 = add nuw nsw i64 %indvars.iv, %indvars.iv25
  %26 = trunc i64 %25 to i32
  %rem28 = srem i32 %26, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv25
  %28 = trunc i64 %27 to i32
  %rem28.1 = srem i32 %28, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %29 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %for.cond40.preheader, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader1, %for.body43
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.7, %for.body43 ], [ %indvars.iv19.ph, %for.body43.preheader1 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv19
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next20.4 = add nsw i64 %indvars.iv19, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next20.5 = add nsw i64 %indvars.iv19, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next20.6 = add nsw i64 %indvars.iv19, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next20.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next20.7 = add nsw i64 %indvars.iv19, 8
  %exitcond22.7 = icmp eq i64 %indvars.iv.next20.7, 1000
  br i1 %exitcond22.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next2643 = phi i64 [ %indvars.iv.next26, %for.cond40.preheader ], [ %indvars.iv.next2644, %for.body43.prol.loopexit ], [ %indvars.iv.next2644, %middle.block ], [ %indvars.iv.next2644, %for.inc51.loopexit ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next2643, 1000
  br i1 %exitcond28, label %for.end53, label %for.body26.lr.ph

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %mul44.us23 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %mul44.us23, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv64 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next65, %for.cond1.for.inc53_crit_edge.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 0
  %0 = add i64 %indvars.iv64, 1
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp51.us = icmp sgt i64 %indvars.iv64, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv64
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %vector.memcheck

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound180 = icmp ult double* %arrayidx41.us.us, %scevgep72
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  br i1 %conflict.rdx, label %for.cond4.preheader.us41.preheader, label %vector.ph

for.cond4.preheader.us41.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us41

vector.ph:                                        ; preds = %vector.memcheck
  %1 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !8
  %2 = insertelement <2 x double> undef, double %1, i32 0
  %3 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %4 = insertelement <2 x double> undef, double %1, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !11, !noalias !13
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !11, !noalias !13
  %10 = fmul <2 x double> %wide.load, %broadcast.splat85
  %11 = fmul <2 x double> %wide.load83, %broadcast.splat85
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %index
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !15
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !15
  %16 = fmul <2 x double> %wide.load86, %broadcast.splat89
  %17 = fmul <2 x double> %wide.load87, %broadcast.splat89
  %18 = fmul <2 x double> %16, %3
  %19 = fmul <2 x double> %17, %5
  %20 = fadd <2 x double> %10, %18
  %21 = fadd <2 x double> %11, %19
  %22 = fadd <2 x double> %broadcast.splat91, %20
  %23 = fadd <2 x double> %broadcast.splat91, %21
  %24 = bitcast double* %6 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !11, !noalias !13
  %25 = bitcast double* %8 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit2, label %vector.body, !llvm.loop !16

for.cond4.preheader.us41:                         ; preds = %for.cond4.preheader.us41, %for.cond4.preheader.us41.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us41.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader.us41 ]
  %arrayidx31.us16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us16, align 8
  %mul32.us17 = fmul double %27, %beta
  %arrayidx36.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %28 = load double, double* %arrayidx36.us18, align 8
  %mul37.us19 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21 = fmul double %mul37.us19, %29
  %add43.us22 = fadd double %mul32.us17, %mul42.us21
  %add45.us24 = fadd double %mul44.us23, %add43.us22
  store double %add45.us24, double* %arrayidx31.us16, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us16.1, align 8
  %mul32.us17.1 = fmul double %30, %beta
  %arrayidx36.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx36.us18.1, align 8
  %mul37.us19.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21.1 = fmul double %mul37.us19.1, %32
  %add43.us22.1 = fadd double %mul32.us17.1, %mul42.us21.1
  %add45.us24.1 = fadd double %mul44.us23, %add43.us22.1
  store double %add45.us24.1, double* %arrayidx31.us16.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit1, label %for.cond4.preheader.us41, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit1:       ; preds = %for.cond4.preheader.us41
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit2:       ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit2, %for.cond1.for.inc53_crit_edge.us.loopexit1, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond67, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv60
  %33 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %33, %beta
  %34 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %34, %alpha
  %35 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %35
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond63, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.body6.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.03.us.us = phi double [ %add27.us.us, %for.body6.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv54
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv60
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv60
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.03.us.us, %mul26.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv64
  br i1 %exitcond59, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv8, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

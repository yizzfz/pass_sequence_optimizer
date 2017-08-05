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
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1000 x double]*
  %2 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %2)
  call void (...) @polybench_timer_start() #4
  %3 = load double, double* %alpha, align 8
  %4 = load double, double* %beta, align 8
  call void @kernel_symm(double %3, double %4, [1200 x double]* %0, [1000 x double]* %1, [1200 x double]* %2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call to [1200 x double]*
  call void @print_array([1200 x double]* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond1.for.inc16_crit_edge.us ], [ 0, %entry ]
  %0 = add i64 %indvars.iv41, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv38 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next39, %for.inc.us ]
  %2 = add nsw i64 %indvars.iv41, %indvars.iv38
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv41, i64 %indvars.iv38
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv38 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv38
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next39, 1200
  br i1 %cmp2.us, label %for.inc.us, label %for.cond1.for.inc16_crit_edge.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, 1
  %cmp.us = icmp slt i64 %indvars.iv.next42, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond23.preheader.preheader

for.cond23.preheader.preheader:                   ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51.for.cond23.preheader_crit_edge
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc51.for.cond23.preheader_crit_edge ], [ 0, %for.cond23.preheader.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc51.for.cond23.preheader_crit_edge ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv29 = phi i32 [ %indvars.iv.next30, %for.inc51.for.cond23.preheader_crit_edge ], [ 1, %for.cond23.preheader.preheader ]
  %5 = add i64 %indvars.iv36, 1
  %6 = and i64 %5, 4294967295
  %7 = sub i64 998, %indvars.iv36
  %8 = and i64 %7, 4294967295
  %9 = add nuw nsw i64 %8, 1
  %cmp247 = icmp slt i64 %indvars.iv36, 0
  br i1 %cmp247, label %for.cond40.preheader, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.cond23.preheader
  %wide.trip.count = zext i32 %indvars.iv29 to i64
  %xtraiter = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit, label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.preheader
  %10 = trunc i64 %indvars.iv36 to i32
  %rem28.prol = srem i32 %10, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.prol, %for.inc36.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol ], [ 0, %for.inc36.preheader ]
  %11 = icmp eq i64 %6, 1
  br i1 %11, label %for.cond40.preheader, label %for.inc36.preheader.new

for.inc36.preheader.new:                          ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.cond40.preheader.loopexit:                    ; preds = %for.inc36
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.loopexit, %for.inc36.prol.loopexit, %for.cond23.preheader
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %cmp4111 = icmp slt i64 %indvars.iv.next37, 1000
  br i1 %cmp4111, label %for.cond40.preheader.for.inc48_crit_edge, label %for.end53

for.cond40.preheader.for.inc48_crit_edge:         ; preds = %for.cond40.preheader
  %min.iters.check = icmp ult i64 %9, 4
  br i1 %min.iters.check, label %for.inc48.preheader, label %min.iters.checked

for.inc48.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.cond40.preheader.for.inc48_crit_edge
  %indvars.iv33.ph = phi i64 [ %indvars.iv31, %min.iters.checked ], [ %indvars.iv31, %for.cond40.preheader.for.inc48_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.inc48

min.iters.checked:                                ; preds = %for.cond40.preheader.for.inc48_crit_edge
  %fold = add i64 %7, 1
  %n.mod.vf = and i64 %fold, 3
  %n.vec = sub nsw i64 %9, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv31, %n.vec
  br i1 %cmp.zero, label %for.inc48.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %12 = add i64 %indvars.iv31, %index
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %12
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %16, align 8
  %index.next = add i64 %index, 4
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51.for.cond23.preheader_crit_edge, label %for.inc48.preheader

for.inc36:                                        ; preds = %for.inc36, %for.inc36.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc36.preheader.new ], [ %indvars.iv.next.1, %for.inc36 ]
  %18 = add nsw i64 %indvars.iv36, %indvars.iv
  %19 = trunc i64 %18 to i32
  %rem28 = srem i32 %19, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = add nsw i64 %indvars.iv36, %indvars.iv.next
  %21 = trunc i64 %20 to i32
  %rem28.1 = srem i32 %21, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.inc36

for.inc48:                                        ; preds = %for.inc48.preheader, %for.inc48
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc48 ], [ %indvars.iv33.ph, %for.inc48.preheader ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv33
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next34 to i32
  %exitcond35 = icmp eq i32 %lftr.wideiv, 1000
  br i1 %exitcond35, label %for.inc51.for.cond23.preheader_crit_edge.loopexit, label %for.inc48, !llvm.loop !4

for.inc51.for.cond23.preheader_crit_edge.loopexit: ; preds = %for.inc48
  br label %for.inc51.for.cond23.preheader_crit_edge

for.inc51.for.cond23.preheader_crit_edge:         ; preds = %for.inc51.for.cond23.preheader_crit_edge.loopexit, %middle.block
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, 1
  %indvars.iv.next30 = add i32 %indvars.iv29, 1
  br label %for.cond23.preheader

for.end53:                                        ; preds = %for.cond40.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  %mul44 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert14 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat15 = shufflevector <2 x double> %broadcast.splatinsert14, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert18 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat19 = shufflevector <2 x double> %broadcast.splatinsert18, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert20 = insertelement <2 x double> undef, double %mul44, i32 0
  %broadcast.splat21 = shufflevector <2 x double> %broadcast.splatinsert20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc53, %entry
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %0, %for.inc53 ]
  %indvars.iv29 = phi i32 [ 0, %entry ], [ %indvars.iv.next30, %for.inc53 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 0
  %0 = add i64 %indvars.iv31, 1
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %cmp53 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp53, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 0
  %arrayidx41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %arrayidx41
  %bound110 = icmp ult double* %arrayidx41, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body3.preheader22, label %vector.ph

for.body3.preheader22:                            ; preds = %for.body3.preheader
  br label %for.body3

vector.ph:                                        ; preds = %for.body3.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !6, !noalias !9
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !6, !noalias !9
  %5 = fmul <2 x double> %wide.load, %broadcast.splat15
  %6 = fmul <2 x double> %wide.load13, %broadcast.splat15
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !12
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !12
  %11 = fmul <2 x double> %wide.load16, %broadcast.splat19
  %12 = fmul <2 x double> %wide.load17, %broadcast.splat19
  %13 = load double, double* %arrayidx41, align 8, !alias.scope !13
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %11, %15
  %17 = fmul <2 x double> %12, %15
  %18 = fadd <2 x double> %5, %16
  %19 = fadd <2 x double> %6, %17
  %20 = fadd <2 x double> %18, %broadcast.splat21
  %21 = fadd <2 x double> %19, %broadcast.splat21
  store <2 x double> %20, <2 x double>* %2, align 8, !alias.scope !6, !noalias !9
  store <2 x double> %21, <2 x double>* %4, align 8, !alias.scope !6, !noalias !9
  %index.next = add i64 %index, 4
  %22 = icmp eq i64 %index.next, 1200
  br i1 %22, label %for.inc53.loopexit26, label %vector.body, !llvm.loop !14

for.body3.us.preheader:                           ; preds = %for.cond1.preheader
  %wide.trip.count = zext i32 %indvars.iv29 to i64
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv31
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond4.for.inc50_crit_edge.us, %for.body3.us.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.cond4.for.inc50_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv27
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body3.us
  %indvars.iv21 = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next22, %for.inc.us ]
  %add276.us = phi double [ 0.000000e+00, %for.body3.us ], [ %add27.us, %for.inc.us ]
  %23 = load double, double* %arrayidx8.us, align 8
  %mul.us = fmul double %23, %alpha
  %arrayidx12.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv21
  %24 = load double, double* %arrayidx12.us, align 8
  %mul13.us = fmul double %mul.us, %24
  %arrayidx17.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv21, i64 %indvars.iv27
  %25 = load double, double* %arrayidx17.us, align 8
  %add.us = fadd double %mul13.us, %25
  store double %add.us, double* %arrayidx17.us, align 8
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv27
  %26 = load double, double* %arrayidx21.us, align 8
  %27 = load double, double* %arrayidx12.us, align 8
  %mul26.us = fmul double %26, %27
  %add27.us = fadd double %add276.us, %mul26.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc50_crit_edge.us, label %for.inc.us

for.cond4.for.inc50_crit_edge.us:                 ; preds = %for.inc.us
  %arrayidx31.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv27
  %28 = load double, double* %arrayidx31.us, align 8
  %mul32.us = fmul double %28, %beta
  %29 = load double, double* %arrayidx8.us, align 8
  %mul37.us = fmul double %29, %alpha
  %30 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %mul37.us, %30
  %add43.us = fadd double %mul32.us, %mul42.us
  %mul44.us = fmul double %add27.us, %alpha
  %add45.us = fadd double %add43.us, %mul44.us
  store double %add45.us, double* %arrayidx31.us, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next28, 1200
  br i1 %cmp2.us, label %for.body3.us, label %for.inc53.loopexit

for.body3:                                        ; preds = %for.body3, %for.body3.preheader22
  %indvars.iv = phi i64 [ 0, %for.body3.preheader22 ], [ %indvars.iv.next.1, %for.body3 ]
  %arrayidx31 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv
  %31 = load double, double* %arrayidx31, align 8
  %mul32 = fmul double %31, %beta
  %arrayidx36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv
  %32 = load double, double* %arrayidx36, align 8
  %mul37 = fmul double %32, %alpha
  %33 = load double, double* %arrayidx41, align 8
  %mul42 = fmul double %mul37, %33
  %add43 = fadd double %mul32, %mul42
  %add45 = fadd double %add43, %mul44
  store double %add45, double* %arrayidx31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv31, i64 %indvars.iv.next
  %34 = load double, double* %arrayidx31.1, align 8
  %mul32.1 = fmul double %34, %beta
  %arrayidx36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv.next
  %35 = load double, double* %arrayidx36.1, align 8
  %mul37.1 = fmul double %35, %alpha
  %36 = load double, double* %arrayidx41, align 8
  %mul42.1 = fmul double %mul37.1, %36
  %add43.1 = fadd double %mul32.1, %mul42.1
  %add45.1 = fadd double %add43.1, %mul44
  store double %add45.1, double* %arrayidx31.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp2.1 = icmp slt i64 %indvars.iv.next.1, 1200
  br i1 %cmp2.1, label %for.body3, label %for.inc53.loopexit25, !llvm.loop !15

for.inc53.loopexit:                               ; preds = %for.cond4.for.inc50_crit_edge.us
  br label %for.inc53

for.inc53.loopexit25:                             ; preds = %for.body3
  br label %for.inc53

for.inc53.loopexit26:                             ; preds = %vector.body
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53.loopexit26, %for.inc53.loopexit25, %for.inc53.loopexit
  %cmp = icmp slt i64 %0, 1000
  %indvars.iv.next30 = add i32 %indvars.iv29, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end55

for.end55:                                        ; preds = %for.inc53
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv12, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10, !11}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !8}
!12 = !{!10}
!13 = !{!11}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}

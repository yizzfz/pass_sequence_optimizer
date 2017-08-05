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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv4962.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next50.us, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv4962.us, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv4560.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next46.us, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv4560.us, %indvars.iv4962.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv4962.us, i64 %indvars.iv4560.us
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = sub nsw i64 0, %indvars.iv4560.us
  %5 = trunc i64 %4 to i32
  %sub.us = add i32 %1, %5
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv4962.us, i64 %indvars.iv4560.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next46.us = add nuw nsw i64 %indvars.iv4560.us, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next46.us, 1200
  br i1 %exitcond67, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next50.us = add nuw nsw i64 %indvars.iv4962.us, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next50.us, 1000
  br i1 %exitcond68, label %for.cond1.for.inc16_crit_edge.us.for.cond23.preheader_crit_edge, label %for.cond1.preheader.us

for.cond1.for.inc16_crit_edge.us.for.cond23.preheader_crit_edge: ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.inc51.for.cond23.preheader_crit_edge, %for.cond1.for.inc16_crit_edge.us.for.cond23.preheader_crit_edge
  %indvars.iv4158 = phi i64 [ %indvars.iv.next42, %for.inc51.for.cond23.preheader_crit_edge ], [ 1, %for.cond1.for.inc16_crit_edge.us.for.cond23.preheader_crit_edge ]
  %indvars.iv4357 = phi i64 [ %8, %for.inc51.for.cond23.preheader_crit_edge ], [ 0, %for.cond1.for.inc16_crit_edge.us.for.cond23.preheader_crit_edge ]
  %6 = sub i64 999, %indvars.iv4357
  %7 = sub i64 998, %indvars.iv4357
  %8 = add nuw nsw i64 %indvars.iv4357, 1
  %xtraiter = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.cond23.preheader
  %9 = trunc i64 %indvars.iv4357 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.cond23.preheader, %for.inc36.prol.preheader
  %indvars.iv52.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.cond23.preheader ]
  %cond = icmp eq i64 %indvars.iv4357, 0
  br i1 %cond, label %for.inc48.lr.ph, label %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge

for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge: ; preds = %for.inc36.prol.loopexit.unr-lcssa
  br label %for.inc36

for.cond40.preheader:                             ; preds = %for.inc36
  %exitcond4054 = icmp eq i64 %indvars.iv4357, 999
  br i1 %exitcond4054, label %for.inc51, label %for.inc48.lr.ph

for.inc48.lr.ph:                                  ; preds = %for.cond40.preheader, %for.inc36.prol.loopexit.unr-lcssa
  %xtraiter65 = and i64 %6, 7
  %lcmp.mod66 = icmp eq i64 %xtraiter65, 0
  br i1 %lcmp.mod66, label %for.inc48.prol.loopexit, label %for.inc48.lr.ph.for.inc48.prol_crit_edge

for.inc48.lr.ph.for.inc48.prol_crit_edge:         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol, %for.inc48.lr.ph.for.inc48.prol_crit_edge
  %indvars.iv.next3855.in.prol = phi i64 [ %indvars.iv4357, %for.inc48.lr.ph.for.inc48.prol_crit_edge ], [ %indvars.iv.next3855.prol, %for.inc48.prol ]
  %prol.iter = phi i64 [ %xtraiter65, %for.inc48.lr.ph.for.inc48.prol_crit_edge ], [ %prol.iter.sub, %for.inc48.prol ]
  %indvars.iv.next3855.prol = add nuw nsw i64 %indvars.iv.next3855.in.prol, 1
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv.next3855.in.unr = phi i64 [ %indvars.iv4357, %for.inc48.lr.ph ], [ %indvars.iv.next3855.prol, %for.inc48.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %7, 7
  br i1 %10, label %for.inc51, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  %11 = sub i64 991, %indvars.iv.next3855.in.unr
  %12 = lshr i64 %11, 3
  %13 = add nuw nsw i64 %12, 1
  %min.iters.check = icmp ult i64 %13, 2
  br i1 %min.iters.check, label %for.inc48.preheader71, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.mod.vf = and i64 %13, 1
  %n.vec = sub nsw i64 %13, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = add i64 %indvars.iv.next3855.in.unr, 8
  %15 = shl nuw i64 %12, 3
  %16 = add i64 %14, %15
  %17 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %16, %17
  br i1 %cmp.zero, label %for.inc48.preheader71, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge
  %index = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %18 = shl i64 %index, 3
  %19 = add i64 %indvars.iv.next3855.in.unr, %18
  %20 = add nsw i64 %19, 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %20
  %22 = getelementptr double, double* %21, i64 -7
  %23 = bitcast double* %22 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %23, align 8
  %index.next = add i64 %index, 2
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.inc48.preheader71

for.inc48.preheader71:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv.next3855.in.ph = phi i64 [ %indvars.iv.next3855.in.unr, %for.inc48.preheader ], [ %indvars.iv.next3855.in.unr, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.inc48

for.inc36:                                        ; preds = %for.inc36, %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %for.inc36.prol.loopexit.unr-lcssa.for.inc36_crit_edge ], [ %indvars.iv.next.1, %for.inc36 ]
  %25 = add nuw nsw i64 %indvars.iv52, %indvars.iv4357
  %26 = trunc i64 %25 to i32
  %rem28 = srem i32 %26, 100
  %conv29 = sitofp i32 %rem28 to double
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv52, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv4357
  %28 = trunc i64 %27 to i32
  %rem28.1 = srem i32 %28, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.v.i0.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div31.v.i0.2 = insertelement <2 x double> %div31.v.i0.1, double %conv29.1, i32 1
  %div31 = fdiv <2 x double> %div31.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %29 = bitcast double* %arrayidx35 to <2 x double>*
  store <2 x double> %div31, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv52, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4158
  br i1 %exitcond.1, label %for.cond40.preheader, label %for.inc36

for.inc48:                                        ; preds = %for.inc48, %for.inc48.preheader71
  %indvars.iv.next3855.in = phi i64 [ %indvars.iv.next3855.in.ph, %for.inc48.preheader71 ], [ %indvars.iv.next3855.7, %for.inc48 ]
  %indvars.iv.next3855 = add nuw nsw i64 %indvars.iv.next3855.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next3855.1 = add nsw i64 %indvars.iv.next3855.in, 2
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.1
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next3855.2 = add nsw i64 %indvars.iv.next3855.in, 3
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.2
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next3855.3 = add nsw i64 %indvars.iv.next3855.in, 4
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.3
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next3855.4 = add nsw i64 %indvars.iv.next3855.in, 5
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.4
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next3855.5 = add nsw i64 %indvars.iv.next3855.in, 6
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.5
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next3855.6 = add nsw i64 %indvars.iv.next3855.in, 7
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.6
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next3855.7 = add nsw i64 %indvars.iv.next3855.in, 8
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4357, i64 %indvars.iv.next3855.7
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %exitcond40.7 = icmp eq i64 %indvars.iv.next3855.7, 999
  br i1 %exitcond40.7, label %for.inc51.loopexit, label %for.inc48, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.inc48
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.cond40.preheader
  %exitcond = icmp eq i64 %8, 1000
  br i1 %exitcond, label %for.end53, label %for.inc51.for.cond23.preheader_crit_edge

for.inc51.for.cond23.preheader_crit_edge:         ; preds = %for.inc51
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv4158, 1
  br label %for.cond23.preheader

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %mul44.us57 = fmul double %alpha, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 1, i64 0
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %B, i64 1, i64 0
  %0 = bitcast double* %scevgep95 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %0, %C
  %1 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %1, %B
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert103 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat104 = shufflevector <2 x double> %broadcast.splatinsert103, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert107 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat108 = shufflevector <2 x double> %broadcast.splatinsert107, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert109 = insertelement <2 x double> undef, double %mul44.us57, i32 0
  %broadcast.splat110 = shufflevector <2 x double> %broadcast.splatinsert109, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv3644.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next37.us, %for.cond1.for.inc53_crit_edge.us ]
  %exitcond38.us = icmp eq i64 %indvars.iv3644.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3644.us, i64 %indvars.iv3644.us
  br i1 %exitcond38.us, label %vector.memcheck, label %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge

for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %2 = bitcast double* %arrayidx41.us to [1200 x double]*
  %bound098 = icmp ugt [1200 x double]* %2, %C
  %bound199 = icmp ult double* %arrayidx41.us, %scevgep
  %found.conflict100 = and i1 %bound098, %bound199
  %conflict.rdx = or i1 %found.conflict, %found.conflict100
  br i1 %conflict.rdx, label %vector.memcheck.for.cond4.preheader.us47_crit_edge, label %vector.ph

vector.memcheck.for.cond4.preheader.us47_crit_edge: ; preds = %vector.memcheck
  br label %for.cond4.preheader.us47

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %index
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !8, !noalias !11
  %7 = fmul <2 x double> %wide.load, %broadcast.splat104
  %8 = fmul <2 x double> %wide.load102, %broadcast.splat104
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !14
  %13 = fmul <2 x double> %wide.load105, %broadcast.splat108
  %14 = fmul <2 x double> %wide.load106, %broadcast.splat108
  %15 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fmul <2 x double> %13, %17
  %21 = fmul <2 x double> %14, %19
  %22 = fadd <2 x double> %7, %20
  %23 = fadd <2 x double> %8, %21
  %24 = fadd <2 x double> %broadcast.splat110, %22
  %25 = fadd <2 x double> %broadcast.splat110, %23
  %26 = bitcast double* %3 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !8, !noalias !11
  %27 = bitcast double* %5 to <2 x double>*
  store <2 x double> %25, <2 x double>* %27, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %28 = icmp eq i64 %index.next, 1200
  br i1 %28, label %for.cond1.for.inc53_crit_edge.us.loopexit1, label %vector.body, !llvm.loop !16

for.cond4.preheader.us47:                         ; preds = %for.cond4.preheader.us47, %vector.memcheck.for.cond4.preheader.us47_crit_edge
  %indvars.iv3442.us48 = phi i64 [ 0, %vector.memcheck.for.cond4.preheader.us47_crit_edge ], [ %indvars.iv.next35.us60, %for.cond4.preheader.us47 ]
  %arrayidx31.us51 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv3442.us48
  %29 = load double, double* %arrayidx31.us51, align 8
  %mul32.us52 = fmul double %29, %beta
  %arrayidx36.us53 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv3442.us48
  %30 = load double, double* %arrayidx36.us53, align 8
  %mul37.us54 = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41.us, align 8
  %mul42.us55 = fmul double %mul37.us54, %31
  %add43.us56 = fadd double %mul32.us52, %mul42.us55
  %add45.us58 = fadd double %mul44.us57, %add43.us56
  store double %add45.us58, double* %arrayidx31.us51, align 8
  %indvars.iv.next35.us60 = add nuw nsw i64 %indvars.iv3442.us48, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next35.us60, 1200
  br i1 %exitcond86, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us47, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.preheader.us47
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit1:       ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit2:       ; preds = %for.cond4.for.inc50_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit2, %for.cond1.for.inc53_crit_edge.us.loopexit1, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next37.us = add nuw nsw i64 %indvars.iv3644.us, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next37.us, 1000
  br i1 %exitcond87, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc50_crit_edge.us.us, %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge
  %indvars.iv3442.us.us = phi i64 [ 0, %for.cond1.preheader.us.for.cond4.preheader.us.us_crit_edge ], [ %indvars.iv.next35.us.us, %for.cond4.for.inc50_crit_edge.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv3644.us, i64 %indvars.iv3442.us.us
  br label %for.inc.us.us

for.cond4.for.inc50_crit_edge.us.us:              ; preds = %for.inc.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3644.us, i64 %indvars.iv3442.us.us
  %32 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %32, %beta
  %33 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %34
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next35.us.us = add nuw nsw i64 %indvars.iv3442.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next35.us.us, 1200
  br i1 %exitcond, label %for.cond1.for.inc53_crit_edge.us.loopexit2, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %temp2.040.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.inc.us.us ]
  %indvars.iv39.us.us = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.us.us, %for.inc.us.us ]
  %35 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %35, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3644.us, i64 %indvars.iv39.us.us
  %36 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %36
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39.us.us, i64 %indvars.iv3442.us.us
  %37 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %37, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv39.us.us, i64 %indvars.iv3442.us.us
  %38 = load double, double* %arrayidx21.us.us, align 8
  %39 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %38, %39
  %add27.us.us = fadd double %temp2.040.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv39.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv3644.us
  br i1 %exitcond.us.us, label %for.cond4.for.inc50_crit_edge.us.us, label %for.inc.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %C) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv915.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv915.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv13.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv13.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv915.us, i64 %indvars.iv13.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv915.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond17, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

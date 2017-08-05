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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc16_crit_edge.us
  %indvars.iv58.us = phi i64 [ %indvars.iv.next55.us, %for.cond1.for.inc16_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = add i64 %indvars.iv58.us, 1200
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv54.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next50.us, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv54.us, %indvars.iv58.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv58.us, i64 %indvars.iv54.us
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = sub nsw i64 0, %indvars.iv54.us
  %5 = trunc i64 %4 to i32
  %sub.us = add i32 %1, %5
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv58.us, i64 %indvars.iv54.us
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next50.us = add nuw nsw i64 %indvars.iv54.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next50.us, 1200
  br i1 %exitcond60, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next55.us = add nuw nsw i64 %indvars.iv58.us, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next55.us, 1000
  br i1 %exitcond61, label %for.cond23.preheader.preheader, label %for.cond1.preheader.us

for.cond23.preheader.preheader:                   ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.cond23.preheader

for.cond23.preheader:                             ; preds = %for.cond23.preheader.preheader, %for.inc51
  %indvars.iv4249 = phi i64 [ %indvars.iv.next43, %for.inc51 ], [ 1, %for.cond23.preheader.preheader ]
  %indvars.iv4447 = phi i64 [ %8, %for.inc51 ], [ 0, %for.cond23.preheader.preheader ]
  %6 = sub i64 999, %indvars.iv4447
  %7 = sub i64 998, %indvars.iv4447
  %8 = add i64 %indvars.iv4447, 1
  %xtraiter = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit.unr-lcssa, label %for.body26.prol.preheader

for.body26.prol.preheader:                        ; preds = %for.cond23.preheader
  %9 = trunc i64 %indvars.iv4447 to i32
  %rem28.prol = srem i32 %9, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit.unr-lcssa

for.body26.prol.loopexit.unr-lcssa:               ; preds = %for.cond23.preheader, %for.body26.prol.preheader
  %indvars.iv33.unr.ph = phi i64 [ 1, %for.body26.prol.preheader ], [ 0, %for.cond23.preheader ]
  %cond = icmp eq i64 %indvars.iv4447, 0
  br i1 %cond, label %for.body43.preheader, label %for.body26.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa
  br label %for.body26

for.cond40.preheader:                             ; preds = %for.body26
  %exitcond3840 = icmp eq i64 %indvars.iv4447, 999
  br i1 %exitcond3840, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body26.prol.loopexit.unr-lcssa, %for.cond40.preheader
  %xtraiter65 = and i64 %6, 7
  %lcmp.mod66 = icmp eq i64 %xtraiter65, 0
  br i1 %lcmp.mod66, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.preheader
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.preheader, %for.body43.prol
  %indvars.iv.next3641.in.prol = phi i64 [ %indvars.iv.next3641.prol, %for.body43.prol ], [ %indvars.iv4447, %for.body43.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body43.prol ], [ %xtraiter65, %for.body43.prol.preheader ]
  %indvars.iv.next3641.prol = add nuw nsw i64 %indvars.iv.next3641.in.prol, 1
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol, !llvm.loop !1

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.preheader
  %indvars.iv.next3641.in.unr = phi i64 [ %indvars.iv4447, %for.body43.preheader ], [ %indvars.iv.next3641.prol, %for.body43.prol.loopexit.loopexit ]
  %10 = icmp ult i64 %7, 7
  br i1 %10, label %for.inc51, label %for.body43.preheader69

for.body43.preheader69:                           ; preds = %for.body43.prol.loopexit
  %11 = sub i64 991, %indvars.iv.next3641.in.unr
  %12 = lshr i64 %11, 3
  %13 = add nuw nsw i64 %12, 1
  %min.iters.check = icmp ult i64 %13, 2
  br i1 %min.iters.check, label %for.body43.preheader70, label %min.iters.checked

for.body43.preheader70:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader69
  %indvars.iv.next3641.in.ph = phi i64 [ %indvars.iv.next3641.in.unr, %min.iters.checked ], [ %indvars.iv.next3641.in.unr, %for.body43.preheader69 ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader69
  %n.mod.vf = and i64 %13, 1
  %n.vec = sub nsw i64 %13, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %14 = add i64 %indvars.iv.next3641.in.unr, 8
  %15 = shl nuw i64 %12, 3
  %16 = add i64 %14, %15
  %17 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %16, %17
  br i1 %cmp.zero, label %for.body43.preheader70, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %18 = shl i64 %index, 3
  %19 = add i64 %indvars.iv.next3641.in.unr, %18
  %20 = add nsw i64 %19, 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %20
  %22 = getelementptr double, double* %21, i64 -7
  %23 = bitcast double* %22 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %23, align 8
  %index.next = add i64 %index, 2
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader70

for.body26:                                       ; preds = %for.body26.preheader, %for.body26
  %indvars.iv33 = phi i64 [ %indvars.iv.next.1, %for.body26 ], [ %indvars.iv33.unr.ph, %for.body26.preheader ]
  %25 = add nuw nsw i64 %indvars.iv33, %indvars.iv4447
  %26 = trunc i64 %25 to i32
  %rem28 = srem i32 %26, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv33
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv33, 1
  %27 = add nuw nsw i64 %indvars.iv.next, %indvars.iv4447
  %28 = trunc i64 %27 to i32
  %rem28.1 = srem i32 %28, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4249
  br i1 %exitcond.1, label %for.cond40.preheader, label %for.body26

for.body43:                                       ; preds = %for.body43.preheader70, %for.body43
  %indvars.iv.next3641.in = phi i64 [ %indvars.iv.next3641.7, %for.body43 ], [ %indvars.iv.next3641.in.ph, %for.body43.preheader70 ]
  %indvars.iv.next3641 = add nuw nsw i64 %indvars.iv.next3641.in, 1
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next3641.1 = add nsw i64 %indvars.iv.next3641.in, 2
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.1
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next3641.2 = add nsw i64 %indvars.iv.next3641.in, 3
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.2
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next3641.3 = add nsw i64 %indvars.iv.next3641.in, 4
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.3
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next3641.4 = add nsw i64 %indvars.iv.next3641.in, 5
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.4
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next3641.5 = add nsw i64 %indvars.iv.next3641.in, 6
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.5
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next3641.6 = add nsw i64 %indvars.iv.next3641.in, 7
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.6
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next3641.7 = add nsw i64 %indvars.iv.next3641.in, 8
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv4447, i64 %indvars.iv.next3641.7
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %exitcond38.7 = icmp eq i64 %indvars.iv.next3641.7, 999
  br i1 %exitcond38.7, label %for.inc51.loopexit, label %for.body43, !llvm.loop !6

for.inc51.loopexit:                               ; preds = %for.body43
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %exitcond64 = icmp eq i64 %8, 1000
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4249, 1
  br i1 %exitcond64, label %for.end53, label %for.cond23.preheader

for.end53:                                        ; preds = %for.inc51
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
for.cond1.preheader.us.preheader:
  %mul44.us56 = fmul double %alpha, 0.000000e+00
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 1, i64 0
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %B, i64 1, i64 0
  %0 = bitcast double* %scevgep92 to [1200 x double]*
  %bound0 = icmp ugt [1200 x double]* %0, %C
  %1 = bitcast double* %scevgep to [1200 x double]*
  %bound1 = icmp ugt [1200 x double]* %1, %B
  %found.conflict = and i1 %bound0, %bound1
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %mul44.us56, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc53_crit_edge.us
  %indvars.iv45.us = phi i64 [ %indvars.iv.next43.us, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %exitcond36.us = icmp eq i64 %indvars.iv45.us, 0
  %arrayidx41.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv45.us, i64 %indvars.iv45.us
  br i1 %exitcond36.us, label %vector.memcheck, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %2 = bitcast double* %arrayidx41.us to [1200 x double]*
  %bound095 = icmp ugt [1200 x double]* %2, %C
  %bound196 = icmp ult double* %arrayidx41.us, %scevgep
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  br i1 %conflict.rdx, label %for.cond4.preheader.us74.preheader, label %vector.ph

for.cond4.preheader.us74.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us74

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %index
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !8, !noalias !11
  %7 = fmul <2 x double> %wide.load, %broadcast.splat101
  %8 = fmul <2 x double> %wide.load99, %broadcast.splat101
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !14
  %13 = fmul <2 x double> %wide.load102, %broadcast.splat105
  %14 = fmul <2 x double> %wide.load103, %broadcast.splat105
  %15 = load double, double* %arrayidx41.us, align 8, !alias.scope !15
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = insertelement <2 x double> undef, double %15, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = fmul <2 x double> %13, %17
  %21 = fmul <2 x double> %14, %19
  %22 = fadd <2 x double> %7, %20
  %23 = fadd <2 x double> %8, %21
  %24 = fadd <2 x double> %broadcast.splat107, %22
  %25 = fadd <2 x double> %broadcast.splat107, %23
  %26 = bitcast double* %3 to <2 x double>*
  store <2 x double> %24, <2 x double>* %26, align 8, !alias.scope !8, !noalias !11
  %27 = bitcast double* %5 to <2 x double>*
  store <2 x double> %25, <2 x double>* %27, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %28 = icmp eq i64 %index.next, 1200
  br i1 %28, label %for.cond1.for.inc53_crit_edge.us.loopexit1, label %vector.body, !llvm.loop !16

for.cond4.preheader.us74:                         ; preds = %for.cond4.preheader.us74, %for.cond4.preheader.us74.preheader
  %indvars.iv41.us75 = phi i64 [ 0, %for.cond4.preheader.us74.preheader ], [ %indvars.iv.next39.us59.1, %for.cond4.preheader.us74 ]
  %arrayidx31.us50 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv41.us75
  %29 = load double, double* %arrayidx31.us50, align 8
  %mul32.us51 = fmul double %29, %beta
  %arrayidx36.us52 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv41.us75
  %30 = load double, double* %arrayidx36.us52, align 8
  %mul37.us53 = fmul double %30, %alpha
  %31 = load double, double* %arrayidx41.us, align 8
  %mul42.us54 = fmul double %mul37.us53, %31
  %add43.us55 = fadd double %mul32.us51, %mul42.us54
  %add45.us57 = fadd double %mul44.us56, %add43.us55
  store double %add45.us57, double* %arrayidx31.us50, align 8
  %indvars.iv.next39.us59 = or i64 %indvars.iv41.us75, 1
  %arrayidx31.us50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv.next39.us59
  %32 = load double, double* %arrayidx31.us50.1, align 8
  %mul32.us51.1 = fmul double %32, %beta
  %arrayidx36.us52.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 0, i64 %indvars.iv.next39.us59
  %33 = load double, double* %arrayidx36.us52.1, align 8
  %mul37.us53.1 = fmul double %33, %alpha
  %34 = load double, double* %arrayidx41.us, align 8
  %mul42.us54.1 = fmul double %mul37.us53.1, %34
  %add43.us55.1 = fadd double %mul32.us51.1, %mul42.us54.1
  %add45.us57.1 = fadd double %mul44.us56, %add43.us55.1
  store double %add45.us57.1, double* %arrayidx31.us50.1, align 8
  %indvars.iv.next39.us59.1 = add nsw i64 %indvars.iv41.us75, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next39.us59.1, 1200
  br i1 %exitcond82.1, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us74, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.preheader.us74
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit1:       ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit2:       ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit2, %for.cond1.for.inc53_crit_edge.us.loopexit1, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next43.us = add nuw nsw i64 %indvars.iv45.us, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next43.us, 1000
  br i1 %exitcond85, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv41.us.us = phi i64 [ %indvars.iv.next39.us.us, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv45.us, i64 %indvars.iv41.us.us
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45.us, i64 %indvars.iv41.us.us
  %35 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %35, %beta
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul37.us.us = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %37
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next39.us.us = add nuw nsw i64 %indvars.iv41.us.us, 1
  %exitcond42.us = icmp eq i64 %indvars.iv.next39.us.us, 1200
  br i1 %exitcond42.us, label %for.cond1.for.inc53_crit_edge.us.loopexit2, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %temp2.038.us.us = phi double [ 0.000000e+00, %for.cond4.preheader.us.us ], [ %add27.us.us, %for.body6.us.us ]
  %indvars.iv37.us.us = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.us.us, %for.body6.us.us ]
  %38 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %38, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv45.us, i64 %indvars.iv37.us.us
  %39 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %39
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv37.us.us, i64 %indvars.iv41.us.us
  %40 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %40, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv37.us.us, i64 %indvars.iv41.us.us
  %41 = load double, double* %arrayidx21.us.us, align 8
  %42 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %41, %42
  %add27.us.us = fadd double %temp2.038.us.us, %mul26.us.us
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv37.us.us, 1
  %exitcond.us.us = icmp eq i64 %indvars.iv.next.us.us, %indvars.iv45.us
  br i1 %exitcond.us.us, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %C) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv13.us = phi i64 [ %indvars.iv.next10.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nsw i64 %indvars.iv13.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv9.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv9.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13.us, i64 %indvars.iv9.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv9.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond15, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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

; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay1 = bitcast i8* %call to [1200 x double]*
  %arraydecay32 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1200 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_symm(double %0, double %1, [1200 x double]* %arraydecay1, [1000 x double]* %arraydecay32, [1200 x double]* %arraydecay43)
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
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %entry
  %indvars.iv64 = phi i64 [ 0, %entry ], [ %indvars.iv.next65, %for.cond1.for.inc16_crit_edge.us ]
  %0 = add i64 %indvars.iv64, 1200
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv60 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next61, %for.inc.us ]
  %2 = add nuw nsw i64 %indvars.iv60, %indvars.iv64
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv60
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = trunc i64 %indvars.iv60 to i32
  %sub.us = sub i32 %1, %4
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, 1200
  br i1 %exitcond, label %for.cond1.for.inc16_crit_edge.us, label %for.inc.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond75, label %for.inc36.lr.ph.preheader, label %for.cond1.preheader.us

for.inc36.lr.ph.preheader:                        ; preds = %for.cond1.for.inc16_crit_edge.us
  br label %for.inc36.lr.ph

for.cond19.loopexit.loopexit:                     ; preds = %for.inc48
  br label %for.cond19.loopexit

for.cond19.loopexit:                              ; preds = %for.cond19.loopexit.loopexit, %middle.block, %for.inc48.prol.loopexit, %for.end38
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %indvars.iv.next71 = add nuw i64 %indvars.iv70, 1
  %indvars.iv.next73 = add i3 %indvars.iv72, -1
  %exitcond74 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond74, label %for.end53, label %for.inc36.lr.ph

for.inc36.lr.ph:                                  ; preds = %for.inc36.lr.ph.preheader, %for.cond19.loopexit
  %indvars.iv72 = phi i3 [ %indvars.iv.next73, %for.cond19.loopexit ], [ -1, %for.inc36.lr.ph.preheader ]
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.cond19.loopexit ], [ 2, %for.inc36.lr.ph.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.cond19.loopexit ], [ 0, %for.inc36.lr.ph.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond19.loopexit ], [ 1, %for.inc36.lr.ph.preheader ]
  %5 = zext i3 %indvars.iv72 to i64
  %6 = add nuw nsw i64 %5, 4294967295
  %7 = and i64 %6, 4294967295
  %8 = add i64 %indvars.iv70, %7
  %9 = sub nsw i64 0, %indvars.iv57
  %10 = trunc i64 %9 to i32
  %11 = add i32 %10, 7
  %12 = add i32 %10, 998
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %xtraiter76 = and i64 %indvars.iv.next58, 1
  %lcmp.mod = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.lr.ph
  %13 = trunc i64 %indvars.iv57 to i32
  %rem28.prol = srem i32 %13, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, 1.000000e+03
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.inc36.prol.loopexit.unr-lcssa

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.inc36.lr.ph, %for.inc36.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc36.prol.preheader ], [ 0, %for.inc36.lr.ph ]
  %14 = icmp eq i64 %indvars.iv57, 0
  br i1 %14, label %for.end38, label %for.inc36.preheader

for.inc36.preheader:                              ; preds = %for.inc36.prol.loopexit.unr-lcssa
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc36 ], [ %indvars.iv.unr.ph, %for.inc36.preheader ]
  %15 = add nuw nsw i64 %indvars.iv, %indvars.iv57
  %16 = trunc i64 %15 to i32
  %rem28 = srem i32 %16, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = add nuw nsw i64 %indvars.iv.next, %indvars.iv57
  %18 = trunc i64 %17 to i32
  %rem28.1 = srem i32 %18, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, 1.000000e+03
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv55
  br i1 %exitcond.1, label %for.end38.loopexit, label %for.inc36

for.end38.loopexit:                               ; preds = %for.inc36
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.inc36.prol.loopexit.unr-lcssa
  %cmp4132 = icmp slt i64 %indvars.iv.next58, 1000
  br i1 %cmp4132, label %for.inc48.lr.ph, label %for.cond19.loopexit

for.inc48.lr.ph:                                  ; preds = %for.end38
  %xtraiter51 = and i32 %11, 7
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  br i1 %lcmp.mod52, label %for.inc48.prol.loopexit, label %for.inc48.prol.preheader

for.inc48.prol.preheader:                         ; preds = %for.inc48.lr.ph
  br label %for.inc48.prol

for.inc48.prol:                                   ; preds = %for.inc48.prol.preheader, %for.inc48.prol
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %for.inc48.prol ], [ %indvars.iv55, %for.inc48.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc48.prol ], [ %xtraiter51, %for.inc48.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv48.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc48.prol.loopexit.loopexit, label %for.inc48.prol, !llvm.loop !1

for.inc48.prol.loopexit.loopexit:                 ; preds = %for.inc48.prol
  br label %for.inc48.prol.loopexit

for.inc48.prol.loopexit:                          ; preds = %for.inc48.prol.loopexit.loopexit, %for.inc48.lr.ph
  %indvars.iv48.unr = phi i64 [ %indvars.iv55, %for.inc48.lr.ph ], [ %8, %for.inc48.prol.loopexit.loopexit ]
  %19 = icmp ult i32 %12, 7
  br i1 %19, label %for.cond19.loopexit, label %for.inc48.preheader

for.inc48.preheader:                              ; preds = %for.inc48.prol.loopexit
  %20 = sub i64 992, %indvars.iv48.unr
  %21 = lshr i64 %20, 3
  %22 = add nuw nsw i64 %21, 1
  %min.iters.check = icmp ult i64 %22, 2
  br i1 %min.iters.check, label %for.inc48.preheader78, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc48.preheader
  %n.mod.vf = and i64 %22, 1
  %n.vec = sub nsw i64 %22, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = add i64 %indvars.iv48.unr, 8
  %24 = shl nuw i64 %21, 3
  %25 = add i64 %23, %24
  %26 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %25, %26
  br i1 %cmp.zero, label %for.inc48.preheader78, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %27 = shl i64 %index, 3
  %28 = add i64 %indvars.iv48.unr, %27
  %29 = add nsw i64 %28, 7
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %29
  %31 = getelementptr double, double* %30, i64 -7
  %32 = bitcast double* %31 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %32, align 8
  %index.next = add i64 %index, 2
  %33 = icmp eq i64 %index.next, %n.vec
  br i1 %33, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond19.loopexit, label %for.inc48.preheader78

for.inc48.preheader78:                            ; preds = %middle.block, %min.iters.checked, %for.inc48.preheader
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr, %min.iters.checked ], [ %indvars.iv48.unr, %for.inc48.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc48

for.inc48:                                        ; preds = %for.inc48.preheader78, %for.inc48
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.7, %for.inc48 ], [ %indvars.iv48.ph, %for.inc48.preheader78 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv48
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next49.2 = add nsw i64 %indvars.iv48, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next49.3 = add nsw i64 %indvars.iv48, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next49.4 = add nsw i64 %indvars.iv48, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next49.5 = add nsw i64 %indvars.iv48, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next49.6 = add nsw i64 %indvars.iv48, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next49.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next49.7, 1000
  br i1 %exitcond.7, label %for.cond19.loopexit.loopexit, label %for.inc48, !llvm.loop !6

for.end53:                                        ; preds = %for.cond19.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_symm(double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1200 x double]* %B) #0 {
entry:
  %mul44.us54 = fmul double %alpha, 0.000000e+00
  %broadcast.splatinsert118 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat119 = shufflevector <2 x double> %broadcast.splatinsert118, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert122 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat123 = shufflevector <2 x double> %broadcast.splatinsert122, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert124 = insertelement <2 x double> undef, double %mul44.us54, i32 0
  %broadcast.splat125 = shufflevector <2 x double> %broadcast.splatinsert124, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %entry
  %indvars.iv95 = phi i64 [ 0, %entry ], [ %indvars.iv.next96, %for.cond1.for.inc53_crit_edge.us ]
  %0 = add i64 %indvars.iv95, 1
  %cmp532.us = icmp sgt i64 %indvars.iv95, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv95
  br i1 %cmp532.us, label %for.cond4.preheader.us.us.preheader, label %vector.memcheck

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

vector.memcheck:                                  ; preds = %for.cond1.preheader.us
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %B, i64 %0, i64 0
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv95, i64 0
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %C, i64 %0, i64 0
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep110
  %bound1 = icmp ult double* %scevgep108, %scevgep106
  %found.conflict = and i1 %bound0, %bound1
  %bound0113 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound1114 = icmp ult double* %arrayidx41.us.us, %scevgep106
  %found.conflict115 = and i1 %bound0113, %bound1114
  %conflict.rdx = or i1 %found.conflict, %found.conflict115
  br i1 %conflict.rdx, label %for.cond4.preheader.us72.preheader, label %vector.ph

for.cond4.preheader.us72.preheader:               ; preds = %vector.memcheck
  br label %for.cond4.preheader.us72

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !8, !noalias !11
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !8, !noalias !11
  %5 = fmul <2 x double> %wide.load, %broadcast.splat119
  %6 = fmul <2 x double> %wide.load117, %broadcast.splat119
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv95, i64 %index
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !14
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !14
  %11 = fmul <2 x double> %wide.load120, %broadcast.splat123
  %12 = fmul <2 x double> %wide.load121, %broadcast.splat123
  %13 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !15
  %14 = insertelement <2 x double> undef, double %13, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %13, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %11, %15
  %19 = fmul <2 x double> %12, %17
  %20 = fadd <2 x double> %5, %18
  %21 = fadd <2 x double> %6, %19
  %22 = fadd <2 x double> %broadcast.splat125, %20
  %23 = fadd <2 x double> %broadcast.splat125, %21
  %24 = bitcast double* %1 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8, !alias.scope !8, !noalias !11
  %25 = bitcast double* %3 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %26 = icmp eq i64 %index.next, 1200
  br i1 %26, label %for.cond1.for.inc53_crit_edge.us.loopexit2, label %vector.body, !llvm.loop !16

for.cond4.preheader.us72:                         ; preds = %for.cond4.preheader.us72, %for.cond4.preheader.us72.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us72.preheader ], [ %indvars.iv.next.1, %for.cond4.preheader.us72 ]
  %arrayidx31.us47 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 %indvars.iv
  %27 = load double, double* %arrayidx31.us47, align 8
  %mul32.us48 = fmul double %27, %beta
  %arrayidx36.us49 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv95, i64 %indvars.iv
  %28 = load double, double* %arrayidx36.us49, align 8
  %mul37.us50 = fmul double %28, %alpha
  %29 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us52 = fmul double %mul37.us50, %29
  %add43.us53 = fadd double %mul32.us48, %mul42.us52
  %add45.us55 = fadd double %mul44.us54, %add43.us53
  store double %add45.us55, double* %arrayidx31.us47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx31.us47.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx31.us47.1, align 8
  %mul32.us48.1 = fmul double %30, %beta
  %arrayidx36.us49.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv95, i64 %indvars.iv.next
  %31 = load double, double* %arrayidx36.us49.1, align 8
  %mul37.us50.1 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us52.1 = fmul double %mul37.us50.1, %32
  %add43.us53.1 = fadd double %mul32.us48.1, %mul42.us52.1
  %add45.us55.1 = fadd double %mul44.us54, %add43.us53.1
  store double %add45.us55.1, double* %arrayidx31.us47.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond100.1, label %for.cond1.for.inc53_crit_edge.us.loopexit1, label %for.cond4.preheader.us72, !llvm.loop !17

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc50_crit_edge.us.us
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit1:       ; preds = %for.cond4.preheader.us72
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit2:       ; preds = %vector.body
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit2, %for.cond1.for.inc53_crit_edge.us.loopexit1, %for.cond1.for.inc53_crit_edge.us.loopexit
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next96, 1000
  br i1 %exitcond101, label %for.end55, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc50_crit_edge.us.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.cond4.for.inc50_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv95, i64 %indvars.iv91
  br label %for.inc.us.us

for.cond4.for.inc50_crit_edge.us.us:              ; preds = %for.inc.us.us
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv95, i64 %indvars.iv91
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
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond = icmp eq i64 %indvars.iv.next92, 1200
  br i1 %exitcond, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.034.us.us = phi double [ %add27.us.us, %for.inc.us.us ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %36 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %36, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv95, i64 %indvars.iv85
  %37 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %37
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv85, i64 %indvars.iv91
  %38 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %38, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv85, i64 %indvars.iv91
  %39 = load double, double* %arrayidx21.us.us, align 8
  %40 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %39, %40
  %add27.us.us = fadd double %temp2.034.us.us, %mul26.us.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next86, %indvars.iv95
  br i1 %exitcond90, label %for.cond4.for.inc50_crit_edge.us.us, label %for.inc.us.us

for.end55:                                        ; preds = %for.cond1.for.inc53_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* %C) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv13, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond19, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
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

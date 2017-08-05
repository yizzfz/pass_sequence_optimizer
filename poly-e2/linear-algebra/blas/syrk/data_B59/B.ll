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
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc7.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv36, %indvars.iv30
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv30
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond42, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.inc7.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.inc31.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc31.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv28, %indvars.iv
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 1000
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.000000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond41, label %for.inc31.us, label %for.body17.us

for.inc31.us:                                     ; preds = %for.body17.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond43, label %for.end33, label %for.cond14.preheader.us

for.end33:                                        ; preds = %for.inc31.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc32.us ], [ 1, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.inc32.us ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %indvars.iv79 = phi i2 [ %indvars.iv.next80, %for.inc32.us ], [ 1, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ]
  %0 = add i64 %indvars.iv84, -3
  %1 = zext i2 %indvars.iv79 to i64
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %xtraiter = and i64 %indvars.iv.next85, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv.prol
  %2 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %2, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %1, %for.body3.us.prol ]
  %3 = icmp ult i64 %indvars.iv84, 3
  br i1 %3, label %for.cond9.preheader.us21.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %4 = sub i64 %0, %indvars.iv.unr
  %5 = lshr i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %min.iters.check = icmp ult i64 %6, 2
  br i1 %min.iters.check, label %for.body3.us.preheader6, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.us.preheader
  %n.mod.vf = and i64 %6, 1
  %n.vec = sub nsw i64 %6, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %7 = or i64 %indvars.iv.unr, 4
  %8 = shl nuw i64 %5, 2
  %9 = add i64 %7, %8
  %10 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %9, %10
  br i1 %cmp.zero, label %for.body3.us.preheader6, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = shl i64 %index, 2
  %offset.idx = or i64 %indvars.iv.unr, %11
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %offset.idx
  %13 = bitcast double* %12 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %13, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec1 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec2 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec3 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %14 = fmul <2 x double> %strided.vec, %broadcast.splat5
  %15 = fmul <2 x double> %strided.vec1, %broadcast.splat5
  %16 = fmul <2 x double> %strided.vec2, %broadcast.splat5
  %17 = add nsw i64 %offset.idx, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %17
  %19 = fmul <2 x double> %strided.vec3, %broadcast.splat5
  %20 = getelementptr double, double* %18, i64 -3
  %21 = bitcast double* %20 to <8 x double>*
  %22 = shufflevector <2 x double> %14, <2 x double> %15, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %23 = shufflevector <2 x double> %16, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %22, <4 x double> %23, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %21, align 8
  %index.next = add i64 %index, 2
  %24 = icmp eq i64 %index.next, %n.vec
  br i1 %24, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.preheader.us21.preheader, label %for.body3.us.preheader6

for.body3.us.preheader6:                          ; preds = %middle.block, %min.iters.checked, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader6, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader6 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv
  %25 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %25, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv.next
  %26 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %26, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv.next.1
  %27 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %27, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv.next.2
  %28 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %28, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv86
  br i1 %exitcond.3, label %for.cond9.preheader.us21.preheader, label %for.body3.us, !llvm.loop !6

for.cond9.preheader.us21.preheader:               ; preds = %for.body3.us, %middle.block, %for.body3.us.prol.loopexit
  %xtraiter71 = and i64 %indvars.iv.next85, 1
  %arrayidx25.us34.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 0
  br label %for.cond9.preheader.us21

for.cond9.preheader.us21:                         ; preds = %for.inc29.us40, %for.cond9.preheader.us21.preheader
  %indvars.iv81 = phi i64 [ 0, %for.cond9.preheader.us21.preheader ], [ %indvars.iv.next82, %for.inc29.us40 ]
  %29 = icmp eq i64 %xtraiter71, 0
  br i1 %29, label %for.body11.us25.prol.loopexit.unr-lcssa, label %for.body11.us25.prol.preheader

for.body11.us25.prol.preheader:                   ; preds = %for.cond9.preheader.us21
  %arrayidx15.us29.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv84, i64 %indvars.iv81
  %30 = load double, double* %arrayidx15.us29.prol, align 8
  %mul16.us30.prol = fmul double %30, %alpha
  %arrayidx20.us32.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv81
  %31 = load double, double* %arrayidx20.us32.prol, align 8
  %mul21.us33.prol = fmul double %mul16.us30.prol, %31
  %32 = load double, double* %arrayidx25.us34.prol, align 8
  %add.us35.prol = fadd double %mul21.us33.prol, %32
  store double %add.us35.prol, double* %arrayidx25.us34.prol, align 8
  br label %for.body11.us25.prol.loopexit.unr-lcssa

for.body11.us25.prol.loopexit.unr-lcssa:          ; preds = %for.cond9.preheader.us21, %for.body11.us25.prol.preheader
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body11.us25.prol.preheader ], [ 0, %for.cond9.preheader.us21 ]
  %33 = icmp eq i64 %indvars.iv84, 0
  br i1 %33, label %for.inc29.us40, label %for.body11.us25.preheader

for.body11.us25.preheader:                        ; preds = %for.body11.us25.prol.loopexit.unr-lcssa
  %arrayidx15.us29 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv84, i64 %indvars.iv81
  br label %for.body11.us25

for.body11.us25:                                  ; preds = %for.body11.us25.preheader, %for.body11.us25
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body11.us25 ], [ %indvars.iv54.unr.ph, %for.body11.us25.preheader ]
  %34 = load double, double* %arrayidx15.us29, align 8
  %mul16.us30 = fmul double %34, %alpha
  %arrayidx20.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv81
  %35 = load double, double* %arrayidx20.us32, align 8
  %mul21.us33 = fmul double %mul16.us30, %35
  %arrayidx25.us34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv54
  %36 = load double, double* %arrayidx25.us34, align 8
  %add.us35 = fadd double %mul21.us33, %36
  store double %add.us35, double* %arrayidx25.us34, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %37 = load double, double* %arrayidx15.us29, align 8
  %mul16.us30.1 = fmul double %37, %alpha
  %arrayidx20.us32.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next55, i64 %indvars.iv81
  %38 = load double, double* %arrayidx20.us32.1, align 8
  %mul21.us33.1 = fmul double %mul16.us30.1, %38
  %arrayidx25.us34.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv84, i64 %indvars.iv.next55
  %39 = load double, double* %arrayidx25.us34.1, align 8
  %add.us35.1 = fadd double %mul21.us33.1, %39
  store double %add.us35.1, double* %arrayidx25.us34.1, align 8
  %indvars.iv.next55.1 = add nuw nsw i64 %indvars.iv54, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next55.1, %indvars.iv86
  br i1 %exitcond59.1, label %for.inc29.us40, label %for.body11.us25

for.inc29.us40:                                   ; preds = %for.body11.us25, %for.body11.us25.prol.loopexit.unr-lcssa
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond = icmp eq i64 %indvars.iv.next82, 1000
  br i1 %exitcond, label %for.inc32.us, label %for.cond9.preheader.us21

for.inc32.us:                                     ; preds = %for.inc29.us40
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %indvars.iv.next80 = add i2 %indvars.iv79, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next85, 1200
  br i1 %exitcond88, label %for.end34, label %for.cond1.preheader.us

for.end34:                                        ; preds = %for.inc32.us
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

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.cond2.preheader.us ]
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond12, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

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

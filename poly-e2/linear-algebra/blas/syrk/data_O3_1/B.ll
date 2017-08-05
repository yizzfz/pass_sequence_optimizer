; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end33

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count22 = zext i32 %m to i64
  %wide.trip.count26 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv24
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next19, %wide.trip.count22
  br i1 %exitcond23, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %cmp113 = icmp sgt i32 %n, 0
  br i1 %cmp113, label %for.cond14.preheader.lr.ph, label %for.end33

for.cond14.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond10.preheader
  %conv22 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.lr.ph ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next, %for.body17.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, %m
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end33.loopexit, label %for.cond14.preheader.us

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %entry, %for.cond10.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count67 = zext i32 %n to i64
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count47 = zext i32 %m to i64
  %wide.trip.count53 = zext i32 %n to i64
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader103, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader103 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv49
  br i1 %exitcond.3, label %for.cond9.preheader.us25.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.body11.us12:                                  ; preds = %for.body11.us12.preheader, %for.body11.us12
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %for.body11.us12 ], [ %indvars.iv37.unr.ph, %for.body11.us12.preheader ]
  %4 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14 = fmul double %4, %alpha
  %arrayidx20.us16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv45
  %5 = load double, double* %arrayidx20.us16, align 8
  %mul21.us17 = fmul double %mul16.us14, %5
  %arrayidx25.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv37
  %6 = load double, double* %arrayidx25.us18, align 8
  %add.us19 = fadd double %6, %mul21.us17
  store double %add.us19, double* %arrayidx25.us18, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %7 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.1 = fmul double %7, %alpha
  %arrayidx20.us16.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next38, i64 %indvars.iv45
  %8 = load double, double* %arrayidx20.us16.1, align 8
  %mul21.us17.1 = fmul double %mul16.us14.1, %8
  %arrayidx25.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next38
  %9 = load double, double* %arrayidx25.us18.1, align 8
  %add.us19.1 = fadd double %9, %mul21.us17.1
  store double %add.us19.1, double* %arrayidx25.us18.1, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %indvars.iv49
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us30.loopexit, label %for.body11.us12

for.cond9.preheader.us25:                         ; preds = %for.cond9.preheader.us25.preheader, %for.cond9.for.inc29_crit_edge.us30
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond9.for.inc29_crit_edge.us30 ], [ 0, %for.cond9.preheader.us25.preheader ]
  %arrayidx15.us29 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv45
  br i1 %lcmp.mod43, label %for.body11.us12.prol.loopexit, label %for.body11.us12.prol

for.body11.us12.prol:                             ; preds = %for.cond9.preheader.us25
  %10 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.prol = fmul double %10, %alpha
  %arrayidx20.us16.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv45
  %11 = load double, double* %arrayidx20.us16.prol, align 8
  %mul21.us17.prol = fmul double %mul16.us14.prol, %11
  %12 = load double, double* %arrayidx25.us18.prol, align 8
  %add.us19.prol = fadd double %12, %mul21.us17.prol
  store double %add.us19.prol, double* %arrayidx25.us18.prol, align 8
  br label %for.body11.us12.prol.loopexit

for.body11.us12.prol.loopexit:                    ; preds = %for.body11.us12.prol, %for.cond9.preheader.us25
  %indvars.iv37.unr.ph = phi i64 [ 1, %for.body11.us12.prol ], [ 0, %for.cond9.preheader.us25 ]
  br i1 %39, label %for.cond9.for.inc29_crit_edge.us30, label %for.body11.us12.preheader

for.body11.us12.preheader:                        ; preds = %for.body11.us12.prol.loopexit
  br label %for.body11.us12

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond6.for.inc32_crit_edge.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %13 = add i64 %indvars.iv51, -3
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %14 = trunc i64 %indvars.iv.next52 to i32
  %xtraiter = and i32 %14, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.prol
  %15 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %15, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !5

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv51, 3
  br i1 %16, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %17 = sub i64 %13, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check80 = icmp ult i64 %19, 2
  br i1 %min.iters.check80, label %for.body3.us.preheader103, label %min.iters.checked81

for.body3.us.preheader103:                        ; preds = %middle.block78, %min.iters.checked81, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked81 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end89, %middle.block78 ]
  br label %for.body3.us

min.iters.checked81:                              ; preds = %for.body3.us.preheader
  %n.mod.vf82 = and i64 %19, 1
  %n.vec83 = sub nsw i64 %19, %n.mod.vf82
  %cmp.zero84 = icmp eq i64 %n.vec83, 0
  %20 = add i64 %indvars.iv.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf82, 2
  %ind.end89 = sub i64 %22, %23
  br i1 %cmp.zero84, label %for.body3.us.preheader103, label %vector.ph85

vector.ph85:                                      ; preds = %min.iters.checked81
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77, %vector.ph85
  %index86 = phi i64 [ 0, %vector.ph85 ], [ %index.next87, %vector.body77 ]
  %24 = shl i64 %index86, 2
  %25 = add i64 %indvars.iv.unr, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %25
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec95 = load <8 x double>, <8 x double>* %27, align 8
  %strided.vec96 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec97 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec98 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec99 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %28 = fmul <2 x double> %strided.vec96, %broadcast.splat101
  %29 = fmul <2 x double> %strided.vec97, %broadcast.splat101
  %30 = fmul <2 x double> %strided.vec98, %broadcast.splat101
  %31 = add nsw i64 %25, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %31
  %33 = fmul <2 x double> %strided.vec99, %broadcast.splat101
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec102 = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec102, <8 x double>* %35, align 8
  %index.next87 = add i64 %index86, 2
  %38 = icmp eq i64 %index.next87, %n.vec83
  br i1 %38, label %middle.block78, label %vector.body77, !llvm.loop !7

middle.block78:                                   ; preds = %vector.body77
  %cmp.n90 = icmp eq i64 %n.mod.vf82, 0
  br i1 %cmp.n90, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader103

for.cond9.preheader.us25.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us25.preheader

for.cond9.preheader.us25.preheader:               ; preds = %for.cond9.preheader.us25.preheader.loopexit, %middle.block78, %for.body3.us.prol.loopexit
  %xtraiter4269 = and i64 %indvars.iv.next52, 1
  %lcmp.mod43 = icmp eq i64 %xtraiter4269, 0
  %39 = icmp eq i64 %indvars.iv51, 0
  %arrayidx25.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 0
  br label %for.cond9.preheader.us25

for.cond9.for.inc29_crit_edge.us30.loopexit:      ; preds = %for.body11.us12
  br label %for.cond9.for.inc29_crit_edge.us30

for.cond9.for.inc29_crit_edge.us30:               ; preds = %for.cond9.for.inc29_crit_edge.us30.loopexit, %for.body11.us12.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us25

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us30
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %for.end34.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.preheader, %for.inc32
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc32 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc32 ], [ 1, %for.body3.lr.ph.preheader ]
  %40 = add i64 %indvars.iv65, -3
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %41 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter60 = and i32 %41, 3
  %lcmp.mod61 = icmp eq i32 %xtraiter60, 0
  br i1 %lcmp.mod61, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter62 = phi i32 [ %prol.iter62.sub, %for.body3.prol ], [ %xtraiter60, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv55.prol
  %42 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %42, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter62.sub = add i32 %prol.iter62, -1
  %prol.iter62.cmp = icmp eq i32 %prol.iter62.sub, 0
  br i1 %prol.iter62.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !8

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv55.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next56.prol, %for.body3.prol.loopexit.loopexit ]
  %43 = icmp ult i64 %indvars.iv65, 3
  br i1 %43, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %44 = sub i64 %40, %indvars.iv55.unr
  %45 = lshr i64 %44, 2
  %46 = add nuw nsw i64 %45, 1
  %min.iters.check = icmp ult i64 %46, 2
  br i1 %min.iters.check, label %for.body3.preheader104, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %46, 1
  %n.vec = sub nsw i64 %46, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %47 = add i64 %indvars.iv55.unr, 4
  %48 = shl nuw i64 %45, 2
  %49 = add i64 %47, %48
  %50 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %49, %50
  br i1 %cmp.zero, label %for.body3.preheader104, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %51 = shl i64 %index, 2
  %52 = add i64 %indvars.iv55.unr, %51
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %52
  %54 = bitcast double* %53 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %54, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %55 = fmul <2 x double> %strided.vec, %broadcast.splat76
  %56 = fmul <2 x double> %strided.vec72, %broadcast.splat76
  %57 = fmul <2 x double> %strided.vec73, %broadcast.splat76
  %58 = add nsw i64 %52, 3
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %58
  %60 = fmul <2 x double> %strided.vec74, %broadcast.splat76
  %61 = getelementptr double, double* %59, i64 -3
  %62 = bitcast double* %61 to <8 x double>*
  %63 = shufflevector <2 x double> %55, <2 x double> %56, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %64 = shufflevector <2 x double> %57, <2 x double> %60, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %63, <4 x double> %64, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %62, align 8
  %index.next = add i64 %index, 2
  %65 = icmp eq i64 %index.next, %n.vec
  br i1 %65, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc32, label %for.body3.preheader104

for.body3.preheader104:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv55.ph = phi i64 [ %indvars.iv55.unr, %min.iters.checked ], [ %indvars.iv55.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader104, %for.body3
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.3, %for.body3 ], [ %indvars.iv55.ph, %for.body3.preheader104 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv55
  %66 = load double, double* %arrayidx5, align 8
  %mul = fmul double %66, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56
  %67 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %67, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56.1
  %68 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %68, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next56.2 = add nsw i64 %indvars.iv55, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56.2
  %69 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %69, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next56.3, %indvars.iv63
  br i1 %exitcond59.3, label %for.inc32.loopexit, label %for.body3, !llvm.loop !10

for.inc32.loopexit:                               ; preds = %for.body3
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %for.end34.loopexit105, label %for.body3.lr.ph

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  br label %for.end34

for.end34.loopexit105:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit105, %for.end34.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}

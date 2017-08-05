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
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %3)
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
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond1.for.inc7_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv24
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond23, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next, %for.body17.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 1000
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.000000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %for.end33, label %for.cond14.preheader.us

for.end33:                                        ; preds = %for.cond14.for.inc31_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %broadcast.splatinsert101 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat102 = shufflevector <2 x double> %broadcast.splatinsert101, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader104, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader104 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv48
  br i1 %exitcond.3, label %for.cond9.preheader.us25.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.body11.us12:                                  ; preds = %for.body11.us12.preheader, %for.body11.us12
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %for.body11.us12 ], [ %indvars.iv37.unr.ph, %for.body11.us12.preheader ]
  %4 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14 = fmul double %4, %alpha
  %arrayidx20.us16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv43
  %5 = load double, double* %arrayidx20.us16, align 8
  %mul21.us17 = fmul double %mul16.us14, %5
  %arrayidx25.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv37
  %6 = load double, double* %arrayidx25.us18, align 8
  %add.us19 = fadd double %6, %mul21.us17
  store double %add.us19, double* %arrayidx25.us18, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %7 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.1 = fmul double %7, %alpha
  %arrayidx20.us16.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next38, i64 %indvars.iv43
  %8 = load double, double* %arrayidx20.us16.1, align 8
  %mul21.us17.1 = fmul double %mul16.us14.1, %8
  %arrayidx25.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.next38
  %9 = load double, double* %arrayidx25.us18.1, align 8
  %add.us19.1 = fadd double %9, %mul21.us17.1
  store double %add.us19.1, double* %arrayidx25.us18.1, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond42.1 = icmp eq i64 %indvars.iv.next38.1, %indvars.iv48
  br i1 %exitcond42.1, label %for.cond9.for.inc29_crit_edge.us30.loopexit, label %for.body11.us12

for.cond9.preheader.us25:                         ; preds = %for.cond9.preheader.us25.preheader, %for.cond9.for.inc29_crit_edge.us30
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond9.for.inc29_crit_edge.us30 ], [ 0, %for.cond9.preheader.us25.preheader ]
  %arrayidx15.us29 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv43
  br i1 %lcmp.mod67, label %for.body11.us12.prol, label %for.body11.us12.prol.loopexit

for.body11.us12.prol:                             ; preds = %for.cond9.preheader.us25
  %10 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.prol = fmul double %10, %alpha
  %arrayidx20.us16.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv43
  %11 = load double, double* %arrayidx20.us16.prol, align 8
  %mul21.us17.prol = fmul double %mul16.us14.prol, %11
  %12 = load double, double* %arrayidx25.us18.prol, align 8
  %add.us19.prol = fadd double %12, %mul21.us17.prol
  store double %add.us19.prol, double* %arrayidx25.us18.prol, align 8
  br label %for.body11.us12.prol.loopexit

for.body11.us12.prol.loopexit:                    ; preds = %for.body11.us12.prol, %for.cond9.preheader.us25
  %indvars.iv37.unr.ph = phi i64 [ 1, %for.body11.us12.prol ], [ 0, %for.cond9.preheader.us25 ]
  br i1 %40, label %for.cond9.for.inc29_crit_edge.us30, label %for.body11.us12.preheader

for.body11.us12.preheader:                        ; preds = %for.body11.us12.prol.loopexit
  br label %for.body11.us12

for.body3.lr.ph.us:                               ; preds = %entry, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond6.for.inc32_crit_edge.us ], [ 0, %entry ]
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond6.for.inc32_crit_edge.us ], [ 1, %entry ]
  %13 = add i64 %indvars.iv50, -3
  %14 = add i64 %indvars.iv50, 1
  %xtraiter = and i64 %14, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv.prol
  %15 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %15, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !5

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv50, 3
  br i1 %16, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %17 = sub i64 %13, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check81 = icmp ult i64 %19, 2
  br i1 %min.iters.check81, label %for.body3.us.preheader104, label %min.iters.checked82

for.body3.us.preheader104:                        ; preds = %middle.block79, %min.iters.checked82, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked82 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end90, %middle.block79 ]
  br label %for.body3.us

min.iters.checked82:                              ; preds = %for.body3.us.preheader
  %n.mod.vf83 = and i64 %19, 1
  %n.vec84 = sub nsw i64 %19, %n.mod.vf83
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  %20 = add i64 %indvars.iv.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf83, 2
  %ind.end90 = sub i64 %22, %23
  br i1 %cmp.zero85, label %for.body3.us.preheader104, label %vector.ph86

vector.ph86:                                      ; preds = %min.iters.checked82
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %vector.ph86
  %index87 = phi i64 [ 0, %vector.ph86 ], [ %index.next88, %vector.body78 ]
  %24 = shl i64 %index87, 2
  %25 = add i64 %indvars.iv.unr, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %25
  %27 = bitcast double* %26 to <8 x double>*
  %wide.vec96 = load <8 x double>, <8 x double>* %27, align 8
  %strided.vec97 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec98 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec99 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec100 = shufflevector <8 x double> %wide.vec96, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %28 = fmul <2 x double> %strided.vec97, %broadcast.splat102
  %29 = fmul <2 x double> %strided.vec98, %broadcast.splat102
  %30 = fmul <2 x double> %strided.vec99, %broadcast.splat102
  %31 = add nsw i64 %25, 3
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 %31
  %33 = fmul <2 x double> %strided.vec100, %broadcast.splat102
  %34 = getelementptr double, double* %32, i64 -3
  %35 = bitcast double* %34 to <8 x double>*
  %36 = shufflevector <2 x double> %28, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %37 = shufflevector <2 x double> %30, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec103 = shufflevector <4 x double> %36, <4 x double> %37, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec103, <8 x double>* %35, align 8
  %index.next88 = add i64 %index87, 2
  %38 = icmp eq i64 %index.next88, %n.vec84
  br i1 %38, label %middle.block79, label %vector.body78, !llvm.loop !7

middle.block79:                                   ; preds = %vector.body78
  %cmp.n91 = icmp eq i64 %n.mod.vf83, 0
  br i1 %cmp.n91, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader104

for.cond9.preheader.us25.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us25.preheader

for.cond9.preheader.us25.preheader:               ; preds = %for.cond9.preheader.us25.preheader.loopexit, %middle.block79, %for.body3.us.prol.loopexit
  %39 = and i64 %indvars.iv50, 1
  %lcmp.mod67 = icmp eq i64 %39, 0
  %arrayidx25.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv50, i64 0
  %40 = icmp eq i64 %indvars.iv50, 0
  br label %for.cond9.preheader.us25

for.cond9.for.inc29_crit_edge.us30.loopexit:      ; preds = %for.body11.us12
  br label %for.cond9.for.inc29_crit_edge.us30

for.cond9.for.inc29_crit_edge.us30:               ; preds = %for.cond9.for.inc29_crit_edge.us30.loopexit, %for.body11.us12.prol.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond46, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us25

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us30
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 1200
  br i1 %exitcond53, label %for.end34, label %for.body3.lr.ph.us

for.end34:                                        ; preds = %for.cond6.for.inc32_crit_edge.us
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
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv7, 1200
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}

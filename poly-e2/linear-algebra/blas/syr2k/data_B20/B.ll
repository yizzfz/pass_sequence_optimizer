; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp29 = icmp sgt i32 %n, 0
  br i1 %cmp29, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp227 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp227, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count44 = zext i32 %m to i64
  %wide.trip.count48 = zext i32 %n to i64
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv11, i32 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv39 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next40, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv39, %indvars.iv46
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv39
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv39
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next40, %wide.trip.count44
  br i1 %exitcond45, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  br i1 %cmp29, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv35
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count
  br i1 %exitcond38, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry, %for.cond20.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp29 = icmp sgt i32 %n, 0
  br i1 %cmp29, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp727 = icmp sgt i32 %m, 0
  br i1 %cmp727, label %for.inc.lr.ph.us.preheader, label %for.inc.lr.ph.preheader

for.inc.lr.ph.preheader:                          ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count91 = zext i32 %n to i64
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph

for.inc.lr.ph.us.preheader:                       ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count70 = zext i32 %m to i64
  %wide.trip.count77 = zext i32 %n to i64
  %broadcast.splatinsert120 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat121 = shufflevector <2 x double> %broadcast.splatinsert120, <2 x double> undef, <2 x i32> zeroinitializer
  %2 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %3 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.unr, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul.us = fmul <2 x double> %5, %mul.us.v.i1.2
  %6 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul.us.2 = fmul <2 x double> %8, %mul.us.2.v.i1.2
  %9 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %9, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv73
  br i1 %exitcond.3, label %for.cond9.preheader.us33.preheader.loopexit, label %for.inc.us

for.cond9.preheader.us33.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us33.preheader

for.cond9.preheader.us33.preheader:               ; preds = %for.cond9.preheader.us33.preheader.loopexit, %for.inc.us.prol.loopexit
  %min.iters.check = icmp ult i64 %47, 2
  %n.vec = and i64 %47, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %47, %n.vec
  br label %for.cond9.preheader.us33

for.cond9.preheader.us33:                         ; preds = %for.cond9.preheader.us33.preheader, %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond9.for.inc40_crit_edge.us56 ], [ 0, %for.cond9.preheader.us33.preheader ]
  %scevgep98 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv68
  %10 = add i64 %indvars.iv68, 1
  %scevgep100 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %10
  %scevgep102 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv68
  %scevgep104 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %10
  %arrayidx20.us54 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv75, i64 %indvars.iv68
  %arrayidx30.us55 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv75, i64 %indvars.iv68
  br i1 %min.iters.check, label %for.inc37.us35.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us33
  br i1 %cmp.zero, label %for.inc37.us35.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us55
  %bound1 = icmp ult double* %arrayidx30.us55, %scevgep96
  %found.conflict = and i1 %bound0, %bound1
  %bound0107 = icmp ult double* %scevgep, %scevgep100
  %bound1108 = icmp ult double* %scevgep98, %scevgep96
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx = or i1 %found.conflict, %found.conflict109
  %bound0110 = icmp ult double* %scevgep, %scevgep104
  %bound1111 = icmp ult double* %scevgep102, %scevgep96
  %found.conflict112 = and i1 %bound0110, %bound1111
  %conflict.rdx113 = or i1 %conflict.rdx, %found.conflict112
  %bound0116 = icmp ult double* %scevgep, %arrayidx20.us54
  %bound1117 = icmp ult double* %arrayidx20.us54, %scevgep96
  %found.conflict118 = and i1 %bound0116, %bound1117
  %conflict.rdx119 = or i1 %conflict.rdx113, %found.conflict118
  br i1 %conflict.rdx119, label %for.inc37.us35.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = or i64 %index, 1
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv68
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %11, i64 %indvars.iv68
  %14 = load double, double* %12, align 8, !alias.scope !1
  %15 = load double, double* %13, align 8, !alias.scope !1
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, %broadcast.splat121
  %19 = load double, double* %arrayidx20.us54, align 8, !alias.scope !4
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fmul <2 x double> %18, %21
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv68
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %11, i64 %indvars.iv68
  %25 = load double, double* %23, align 8, !alias.scope !6
  %26 = load double, double* %24, align 8, !alias.scope !6
  %27 = insertelement <2 x double> undef, double %25, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fmul <2 x double> %28, %broadcast.splat121
  %30 = load double, double* %arrayidx30.us55, align 8, !alias.scope !8
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = fmul <2 x double> %29, %32
  %34 = fadd <2 x double> %22, %33
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !10, !noalias !12
  %37 = fadd <2 x double> %wide.load, %34
  %38 = bitcast double* %35 to <2 x double>*
  store <2 x double> %37, <2 x double>* %38, align 8, !alias.scope !10, !noalias !12
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond9.for.inc40_crit_edge.us56, label %for.inc37.us35.preheader

for.inc37.us35.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us33
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us33 ], [ %n.vec, %middle.block ]
  br label %for.inc37.us35

for.inc37.us35:                                   ; preds = %for.inc37.us35.preheader, %for.inc37.us35
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc37.us35 ], [ %indvars.iv63.ph, %for.inc37.us35.preheader ]
  %arrayidx15.us38 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv68
  %40 = load double, double* %arrayidx15.us38, align 8
  %mul16.us39 = fmul double %40, %alpha
  %41 = load double, double* %arrayidx20.us54, align 8
  %mul21.us40 = fmul double %mul16.us39, %41
  %arrayidx25.us41 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv63, i64 %indvars.iv68
  %42 = load double, double* %arrayidx25.us41, align 8
  %mul26.us42 = fmul double %42, %alpha
  %43 = load double, double* %arrayidx30.us55, align 8
  %mul31.us43 = fmul double %mul26.us42, %43
  %add.us44 = fadd double %mul21.us40, %mul31.us43
  %arrayidx35.us45 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv63
  %44 = load double, double* %arrayidx35.us45, align 8
  %add36.us46 = fadd double %44, %add.us44
  store double %add36.us46, double* %arrayidx35.us45, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %indvars.iv73
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us56.loopexit, label %for.inc37.us35, !llvm.loop !16

for.inc.lr.ph.us:                                 ; preds = %for.inc.lr.ph.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.inc.lr.ph.us.preheader ]
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.inc.lr.ph.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 0
  %45 = mul i64 %indvars.iv75, 1201
  %46 = add i64 %45, 1
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %46
  %47 = add i64 %indvars.iv75, 1
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %48 = trunc i64 %indvars.iv.next76 to i32
  %xtraiter = and i32 %48, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv.prol
  %49 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %49, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !17

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %50 = icmp ult i64 %indvars.iv75, 3
  br i1 %50, label %for.cond9.preheader.us33.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond9.for.inc40_crit_edge.us56.loopexit:      ; preds = %for.inc37.us35
  br label %for.cond9.for.inc40_crit_edge.us56

for.cond9.for.inc40_crit_edge.us56:               ; preds = %for.cond9.for.inc40_crit_edge.us56.loopexit, %middle.block
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us33

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us56
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77
  br i1 %exitcond78, label %for.end45.loopexit, label %for.inc.lr.ph.us

for.inc.lr.ph:                                    ; preds = %for.inc.lr.ph.preheader, %for.inc43
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %for.inc43 ], [ 0, %for.inc.lr.ph.preheader ]
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc43 ], [ 1, %for.inc.lr.ph.preheader ]
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %51 = trunc i64 %indvars.iv.next90 to i32
  %xtraiter84 = and i32 %51, 3
  %lcmp.mod85 = icmp eq i32 %xtraiter84, 0
  br i1 %lcmp.mod85, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv79.prol = phi i64 [ %indvars.iv.next80.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter86 = phi i32 [ %prol.iter86.sub, %for.inc.prol ], [ %xtraiter84, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv89, i64 %indvars.iv79.prol
  %52 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %52, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next80.prol = add nuw nsw i64 %indvars.iv79.prol, 1
  %prol.iter86.sub = add i32 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i32 %prol.iter86.sub, 0
  br i1 %prol.iter86.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !19

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv79.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next80.prol, %for.inc.prol.loopexit.loopexit ]
  %53 = icmp ult i64 %indvars.iv89, 3
  br i1 %53, label %for.inc43, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.3, %for.inc ], [ %indvars.iv79.unr, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv89, i64 %indvars.iv79
  %54 = bitcast double* %arrayidx5 to <2 x double>*
  %55 = load <2 x double>, <2 x double>* %54, align 8
  %mul = fmul <2 x double> %55, %mul.v.i1.2
  %56 = bitcast double* %arrayidx5 to <2 x double>*
  store <2 x double> %mul, <2 x double>* %56, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv89, i64 %indvars.iv.next80.1
  %57 = bitcast double* %arrayidx5.2 to <2 x double>*
  %58 = load <2 x double>, <2 x double>* %57, align 8
  %mul.2 = fmul <2 x double> %58, %mul.2.v.i1.2
  %59 = bitcast double* %arrayidx5.2 to <2 x double>*
  store <2 x double> %mul.2, <2 x double>* %59, align 8
  %indvars.iv.next80.3 = add nsw i64 %indvars.iv79, 4
  %exitcond83.3 = icmp eq i64 %indvars.iv.next80.3, %indvars.iv87
  br i1 %exitcond83.3, label %for.inc43.loopexit, label %for.inc

for.inc43.loopexit:                               ; preds = %for.inc
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %for.inc.prol.loopexit
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %for.end45.loopexit122, label %for.inc.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit122:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit122, %for.end45.loopexit, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %indvars.iv.next
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!9}
!9 = distinct !{!9, !3}
!10 = !{!11}
!11 = distinct !{!11, !3}
!12 = !{!9, !2, !7, !5}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !18}

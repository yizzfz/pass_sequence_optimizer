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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  %conv11 = sitofp i32 %m to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge

for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %.pre29 = sext i32 %n to i64
  br label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %conv4 = sitofp i32 %n to double
  %0 = add i32 %m, -1
  %1 = sext i32 %n to i64
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv11, i32 1
  %wide.trip.count21 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next24, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nsw i64 %indvars.iv16, %indvars.iv23
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv16
  %5 = add nsw i64 %2, 2
  %6 = trunc i64 %5 to i32
  %rem9.us = srem i32 %6, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv16
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %exitcond22 = icmp eq i64 %indvars.iv16, %wide.trip.count21
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond22, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next24 = add nuw i64 %indvars.iv23, 1
  %cmp.us = icmp slt i64 %indvars.iv.next24, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond24.preheader.lr.ph.loopexit

for.cond24.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.lr.ph

for.cond24.preheader.lr.ph:                       ; preds = %for.cond24.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre29, %for.cond1.preheader.lr.ph.for.cond24.preheader.lr.ph_crit_edge ], [ %1, %for.cond24.preheader.lr.ph.loopexit ]
  %7 = add i32 %n, -1
  %wide.trip.count = zext i32 %7 to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv14 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body27.us ], [ 0, %for.cond24.preheader.us ]
  %8 = mul nsw i64 %indvars.iv, %indvars.iv14
  %9 = add nsw i64 %8, 3
  %10 = trunc i64 %9 to i32
  %rem30.us = srem i32 %10, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv11
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %cmp21.us = icmp slt i64 %indvars.iv.next15, %.pre-phi
  br i1 %cmp21.us, label %for.cond24.preheader.us, label %for.end43.loopexit

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = sext i32 %n to i64
  %broadcast.splatinsert64 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat65 = shufflevector <2 x double> %broadcast.splatinsert64, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %m to i64
  %2 = sext i32 %n to i64
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert130 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat131 = shufflevector <2 x double> %broadcast.splatinsert130, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %indvars.iv
  %3 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %3, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.us10.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us10.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us10.preheader

for.cond9.preheader.us10.preheader:               ; preds = %for.cond9.preheader.us10.preheader.loopexit, %middle.block112
  %min.iters.check69 = icmp ult i64 %44, 2
  %n.vec72 = and i64 %44, -2
  %cmp.zero73 = icmp eq i64 %n.vec72, 0
  %cmp.n104 = icmp eq i64 %44, %n.vec72
  br label %for.cond9.preheader.us10

for.cond9.preheader.us10:                         ; preds = %for.cond9.preheader.us10.preheader, %for.cond9.for.inc40_crit_edge.us33
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.cond9.for.inc40_crit_edge.us33 ], [ 0, %for.cond9.preheader.us10.preheader ]
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv46
  %4 = add i64 %indvars.iv46, 1
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv49, i64 %4
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv46
  %scevgep84 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv49, i64 %4
  %arrayidx20.us31 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv46
  %arrayidx30.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv46
  br i1 %min.iters.check69, label %for.body11.us12.preheader, label %min.iters.checked70

min.iters.checked70:                              ; preds = %for.cond9.preheader.us10
  br i1 %cmp.zero73, label %for.body11.us12.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked70
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us32
  %bound1 = icmp ult double* %arrayidx30.us32, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound087 = icmp ult double* %scevgep, %scevgep80
  %bound188 = icmp ult double* %scevgep78, %scevgep76
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx = or i1 %found.conflict, %found.conflict89
  %bound090 = icmp ult double* %scevgep, %scevgep84
  %bound191 = icmp ult double* %scevgep82, %scevgep76
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx, %found.conflict92
  %bound096 = icmp ult double* %scevgep, %arrayidx20.us31
  %bound197 = icmp ult double* %arrayidx20.us31, %scevgep76
  %found.conflict98 = and i1 %bound096, %bound197
  %conflict.rdx99 = or i1 %conflict.rdx93, %found.conflict98
  br i1 %conflict.rdx99, label %for.body11.us12.preheader, label %vector.ph100

vector.ph100:                                     ; preds = %vector.memcheck
  %5 = load double, double* %arrayidx20.us31, align 8, !alias.scope !5
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = load double, double* %arrayidx30.us32, align 8, !alias.scope !8
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body66

vector.body66:                                    ; preds = %vector.body66, %vector.ph100
  %index101 = phi i64 [ 0, %vector.ph100 ], [ %index.next102, %vector.body66 ]
  %11 = or i64 %index101, 1
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index101, i64 %indvars.iv46
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %11, i64 %indvars.iv46
  %14 = load double, double* %12, align 8, !alias.scope !10
  %15 = load double, double* %13, align 8, !alias.scope !10
  %16 = insertelement <2 x double> undef, double %14, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, %broadcast.splat109
  %19 = fmul <2 x double> %18, %7
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index101, i64 %indvars.iv46
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %11, i64 %indvars.iv46
  %22 = load double, double* %20, align 8, !alias.scope !12
  %23 = load double, double* %21, align 8, !alias.scope !12
  %24 = insertelement <2 x double> undef, double %22, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, %broadcast.splat109
  %27 = fmul <2 x double> %26, %10
  %28 = fadd <2 x double> %19, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %index101
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !14, !noalias !16
  %31 = fadd <2 x double> %wide.load110, %28
  %32 = bitcast double* %29 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8, !alias.scope !14, !noalias !16
  %index.next102 = add i64 %index101, 2
  %33 = icmp eq i64 %index.next102, %n.vec72
  br i1 %33, label %middle.block67, label %vector.body66, !llvm.loop !17

middle.block67:                                   ; preds = %vector.body66
  br i1 %cmp.n104, label %for.cond9.for.inc40_crit_edge.us33, label %for.body11.us12.preheader

for.body11.us12.preheader:                        ; preds = %middle.block67, %vector.memcheck, %min.iters.checked70, %for.cond9.preheader.us10
  %indvars.iv40.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked70 ], [ 0, %for.cond9.preheader.us10 ], [ %n.vec72, %middle.block67 ]
  br label %for.body11.us12

for.body11.us12:                                  ; preds = %for.body11.us12.preheader, %for.body11.us12
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.body11.us12 ], [ %indvars.iv40.ph, %for.body11.us12.preheader ]
  %arrayidx15.us15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv46
  %34 = load double, double* %arrayidx15.us15, align 8
  %mul16.us16 = fmul double %34, %alpha
  %35 = load double, double* %arrayidx20.us31, align 8
  %mul21.us17 = fmul double %mul16.us16, %35
  %arrayidx25.us18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv46
  %36 = load double, double* %arrayidx25.us18, align 8
  %mul26.us19 = fmul double %36, %alpha
  %37 = load double, double* %arrayidx30.us32, align 8
  %mul31.us20 = fmul double %mul26.us19, %37
  %add.us21 = fadd double %mul21.us17, %mul31.us20
  %arrayidx35.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %indvars.iv40
  %38 = load double, double* %arrayidx35.us22, align 8
  %add36.us23 = fadd double %38, %add.us21
  store double %add36.us23, double* %arrayidx35.us22, align 8
  %exitcond45 = icmp eq i64 %indvars.iv40, %indvars.iv49
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  br i1 %exitcond45, label %for.cond9.for.inc40_crit_edge.us33.loopexit, label %for.body11.us12, !llvm.loop !18

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next50, %for.cond6.for.inc43_crit_edge.us ]
  %39 = add i64 %indvars.iv49, -3
  %40 = lshr i64 %39, 2
  %41 = add i64 %indvars.iv49, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 0
  %42 = mul i64 %indvars.iv49, 1201
  %43 = add i64 %42, 1
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %43
  %44 = add i64 %indvars.iv49, 1
  %min.iters.check114 = icmp ult i64 %41, 4
  br i1 %min.iters.check114, label %for.body3.us.preheader, label %min.iters.checked115

for.body3.us.preheader:                           ; preds = %middle.block112, %min.iters.checked115, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked115 ], [ 0, %for.body3.lr.ph.us ], [ %n.vec117, %middle.block112 ]
  br label %for.body3.us

min.iters.checked115:                             ; preds = %for.body3.lr.ph.us
  %n.vec117 = and i64 %41, -4
  %cmp.zero118 = icmp eq i64 %n.vec117, 0
  br i1 %cmp.zero118, label %for.body3.us.preheader, label %vector.ph119

vector.ph119:                                     ; preds = %min.iters.checked115
  %45 = and i64 %40, 1
  %lcmp.mod = icmp eq i64 %45, 0
  br i1 %lcmp.mod, label %vector.body111.prol, label %vector.body111.prol.loopexit

vector.body111.prol:                              ; preds = %vector.ph119
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 0
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load128.prol = load <2 x double>, <2 x double>* %47, align 8
  %48 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load129.prol = load <2 x double>, <2 x double>* %49, align 8
  %50 = fmul <2 x double> %wide.load128.prol, %broadcast.splat131
  %51 = fmul <2 x double> %wide.load129.prol, %broadcast.splat131
  %52 = bitcast double* %46 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8
  %53 = bitcast double* %48 to <2 x double>*
  store <2 x double> %51, <2 x double>* %53, align 8
  br label %vector.body111.prol.loopexit

vector.body111.prol.loopexit:                     ; preds = %vector.body111.prol, %vector.ph119
  %index120.unr.ph = phi i64 [ 4, %vector.body111.prol ], [ 0, %vector.ph119 ]
  %54 = icmp eq i64 %40, 0
  br i1 %54, label %middle.block112, label %vector.ph119.new

vector.ph119.new:                                 ; preds = %vector.body111.prol.loopexit
  br label %vector.body111

vector.body111:                                   ; preds = %vector.body111, %vector.ph119.new
  %index120 = phi i64 [ %index120.unr.ph, %vector.ph119.new ], [ %index.next121.1, %vector.body111 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %index120
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %58, align 8
  %59 = fmul <2 x double> %wide.load128, %broadcast.splat131
  %60 = fmul <2 x double> %wide.load129, %broadcast.splat131
  %61 = bitcast double* %55 to <2 x double>*
  store <2 x double> %59, <2 x double>* %61, align 8
  %62 = bitcast double* %57 to <2 x double>*
  store <2 x double> %60, <2 x double>* %62, align 8
  %index.next121 = add i64 %index120, 4
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv49, i64 %index.next121
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load128.1 = load <2 x double>, <2 x double>* %64, align 8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load129.1 = load <2 x double>, <2 x double>* %66, align 8
  %67 = fmul <2 x double> %wide.load128.1, %broadcast.splat131
  %68 = fmul <2 x double> %wide.load129.1, %broadcast.splat131
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8
  %index.next121.1 = add i64 %index120, 8
  %71 = icmp eq i64 %index.next121.1, %n.vec117
  br i1 %71, label %middle.block112.loopexit, label %vector.body111, !llvm.loop !19

middle.block112.loopexit:                         ; preds = %vector.body111
  br label %middle.block112

middle.block112:                                  ; preds = %middle.block112.loopexit, %vector.body111.prol.loopexit
  %cmp.n123 = icmp eq i64 %41, %n.vec117
  br i1 %cmp.n123, label %for.cond9.preheader.us10.preheader, label %for.body3.us.preheader

for.cond9.for.inc40_crit_edge.us33.loopexit:      ; preds = %for.body11.us12
  br label %for.cond9.for.inc40_crit_edge.us33

for.cond9.for.inc40_crit_edge.us33:               ; preds = %for.cond9.for.inc40_crit_edge.us33.loopexit, %middle.block67
  %indvars.iv.next47 = add nuw i64 %indvars.iv46, 1
  %cmp7.us28 = icmp slt i64 %indvars.iv.next47, %1
  br i1 %cmp7.us28, label %for.cond9.preheader.us10, label %for.cond6.for.inc43_crit_edge.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us33
  %indvars.iv.next50 = add nuw i64 %indvars.iv49, 1
  %cmp.us = icmp slt i64 %indvars.iv.next50, %2
  br i1 %cmp.us, label %for.body3.lr.ph.us, label %for.end45.loopexit

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.cond1.preheader.preheader
  %indvars.iv56 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next57, %for.inc43 ]
  %72 = add i64 %indvars.iv56, -3
  %73 = lshr i64 %72, 2
  %74 = add i64 %indvars.iv56, 1
  %min.iters.check = icmp ult i64 %74, 4
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.lr.ph
  %n.vec = and i64 %74, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %75 = and i64 %73, 1
  %lcmp.mod134 = icmp eq i64 %75, 0
  br i1 %lcmp.mod134, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.ph
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 0
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %77, align 8
  %78 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load63.prol = load <2 x double>, <2 x double>* %79, align 8
  %80 = fmul <2 x double> %wide.load.prol, %broadcast.splat65
  %81 = fmul <2 x double> %wide.load63.prol, %broadcast.splat65
  %82 = bitcast double* %76 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8
  %83 = bitcast double* %78 to <2 x double>*
  store <2 x double> %81, <2 x double>* %83, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  %84 = icmp eq i64 %73, 0
  br i1 %84, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %86, align 8
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %88, align 8
  %89 = fmul <2 x double> %wide.load, %broadcast.splat65
  %90 = fmul <2 x double> %wide.load63, %broadcast.splat65
  %91 = bitcast double* %85 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8
  %92 = bitcast double* %87 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8
  %index.next = add i64 %index, 4
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %index.next
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %94, align 8
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load63.1 = load <2 x double>, <2 x double>* %96, align 8
  %97 = fmul <2 x double> %wide.load.1, %broadcast.splat65
  %98 = fmul <2 x double> %wide.load63.1, %broadcast.splat65
  %99 = bitcast double* %93 to <2 x double>*
  store <2 x double> %97, <2 x double>* %99, align 8
  %100 = bitcast double* %95 to <2 x double>*
  store <2 x double> %98, <2 x double>* %100, align 8
  %index.next.1 = add i64 %index, 8
  %101 = icmp eq i64 %index.next.1, %n.vec
  br i1 %101, label %middle.block.loopexit, label %vector.body, !llvm.loop !20

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %74, %n.vec
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body3.lr.ph
  %indvars.iv51.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body3.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.body3 ], [ %indvars.iv51.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv51
  %102 = load double, double* %arrayidx5, align 8
  %mul = fmul double %102, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond55 = icmp eq i64 %indvars.iv51, %indvars.iv56
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br i1 %exitcond55, label %for.inc43.loopexit, label %for.body3, !llvm.loop !21

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %cmp = icmp slt i64 %indvars.iv.next57, %0
  br i1 %cmp, label %for.body3.lr.ph, label %for.end45.loopexit135

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit135:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit135, %for.end45.loopexit, %entry
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

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %cmp.us = icmp slt i64 %indvars.iv.next8, %3
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

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
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!11}
!11 = distinct !{!11, !7}
!12 = !{!13}
!13 = distinct !{!13, !7}
!14 = !{!15}
!15 = distinct !{!15, !7}
!16 = !{!9, !11, !13, !6}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !3, !4}
!20 = distinct !{!20, !3, !4}
!21 = distinct !{!21, !2, !3, !4}

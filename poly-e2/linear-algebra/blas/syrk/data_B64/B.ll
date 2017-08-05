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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond14.preheader.lr.ph_crit_edge

for.cond1.preheader.lr.ph.for.cond14.preheader.lr.ph_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %.pre = sext i32 %n to i64
  br label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %m, -1
  %1 = sext i32 %n to i64
  %wide.trip.count20 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv22 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next23, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nsw i64 %indvars.iv16, %indvars.iv22
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv16
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond21 = icmp eq i64 %indvars.iv16, %wide.trip.count20
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  br i1 %exitcond21, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next23 = add nuw i64 %indvars.iv22, 1
  %cmp.us = icmp slt i64 %indvars.iv.next23, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond14.preheader.lr.ph.loopexit

for.cond14.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.lr.ph

for.cond14.preheader.lr.ph:                       ; preds = %for.cond14.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph.for.cond14.preheader.lr.ph_crit_edge
  %.pre-phi = phi i64 [ %.pre, %for.cond1.preheader.lr.ph.for.cond14.preheader.lr.ph_crit_edge ], [ %1, %for.cond14.preheader.lr.ph.loopexit ]
  %conv22 = sitofp i32 %m to double
  %5 = add i32 %n, -1
  %wide.trip.count = zext i32 %5 to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.lr.ph
  %indvars.iv14 = phi i64 [ 0, %for.cond14.preheader.lr.ph ], [ %indvars.iv.next15, %for.cond14.for.inc31_crit_edge.us ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %6 = mul nsw i64 %indvars.iv, %indvars.iv14
  %7 = add nsw i64 %6, 2
  %8 = trunc i64 %7 to i32
  %rem20.us = srem i32 %8, %m
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next15, %.pre-phi
  br i1 %cmp11.us, label %for.cond14.preheader.us, label %for.end33.loopexit

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %entry
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
  br i1 %cmp75, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = sext i32 %n to i64
  %broadcast.splatinsert59 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat60 = shufflevector <2 x double> %broadcast.splatinsert59, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %m to i64
  %2 = sext i32 %n to i64
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert113 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat114 = shufflevector <2 x double> %broadcast.splatinsert113, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv
  %3 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %3, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.us10.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us10.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us10.preheader

for.cond9.preheader.us10.preheader:               ; preds = %for.cond9.preheader.us10.preheader.loopexit, %middle.block95
  %min.iters.check64 = icmp ult i64 %55, 4
  %n.vec67 = and i64 %55, -4
  %cmp.zero68 = icmp eq i64 %n.vec67, 0
  %cmp.n85 = icmp eq i64 %55, %n.vec67
  br label %for.cond9.preheader.us10

for.cond9.preheader.us10:                         ; preds = %for.cond9.preheader.us10.preheader, %for.cond9.for.inc29_crit_edge.us28
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond9.for.inc29_crit_edge.us28 ], [ 0, %for.cond9.preheader.us10.preheader ]
  %scevgep73 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv41
  %4 = add i64 %indvars.iv41, 1
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv44, i64 %4
  %arrayidx15.us27 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv41
  br i1 %min.iters.check64, label %for.body11.us12.preheader, label %min.iters.checked65

min.iters.checked65:                              ; preds = %for.cond9.preheader.us10
  br i1 %cmp.zero68, label %for.body11.us12.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked65
  %bound0 = icmp ult double* %scevgep, %scevgep75
  %bound1 = icmp ult double* %scevgep73, %scevgep71
  %found.conflict = and i1 %bound0, %bound1
  %bound078 = icmp ult double* %scevgep, %arrayidx15.us27
  %bound179 = icmp ult double* %arrayidx15.us27, %scevgep71
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx = or i1 %found.conflict, %found.conflict80
  br i1 %conflict.rdx, label %for.body11.us12.preheader, label %vector.ph81

vector.ph81:                                      ; preds = %vector.memcheck
  %5 = load double, double* %arrayidx15.us27, align 8, !alias.scope !5
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = insertelement <2 x double> undef, double %5, i32 0
  %8 = fmul <2 x double> %6, %broadcast.splatinsert90
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = fmul <2 x double> %7, %broadcast.splatinsert90
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body61

vector.body61:                                    ; preds = %vector.body61, %vector.ph81
  %index82 = phi i64 [ 0, %vector.ph81 ], [ %index.next83, %vector.body61 ]
  %12 = or i64 %index82, 1
  %13 = or i64 %index82, 2
  %14 = or i64 %index82, 3
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index82, i64 %indvars.iv41
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %12, i64 %indvars.iv41
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %13, i64 %indvars.iv41
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %14, i64 %indvars.iv41
  %19 = load double, double* %15, align 8, !alias.scope !8
  %20 = load double, double* %16, align 8, !alias.scope !8
  %21 = load double, double* %17, align 8, !alias.scope !8
  %22 = load double, double* %18, align 8, !alias.scope !8
  %23 = insertelement <2 x double> undef, double %19, i32 0
  %24 = insertelement <2 x double> %23, double %20, i32 1
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = fmul <2 x double> %9, %24
  %28 = fmul <2 x double> %11, %26
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %index82
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !10, !noalias !12
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !10, !noalias !12
  %33 = fadd <2 x double> %wide.load92, %27
  %34 = fadd <2 x double> %wide.load93, %28
  %35 = bitcast double* %29 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !10, !noalias !12
  %36 = bitcast double* %31 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !10, !noalias !12
  %index.next83 = add i64 %index82, 4
  %37 = icmp eq i64 %index.next83, %n.vec67
  br i1 %37, label %middle.block62, label %vector.body61, !llvm.loop !13

middle.block62:                                   ; preds = %vector.body61
  br i1 %cmp.n85, label %for.cond9.for.inc29_crit_edge.us28, label %for.body11.us12.preheader

for.body11.us12.preheader:                        ; preds = %middle.block62, %vector.memcheck, %min.iters.checked65, %for.cond9.preheader.us10
  %indvars.iv35.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked65 ], [ 0, %for.cond9.preheader.us10 ], [ %n.vec67, %middle.block62 ]
  %38 = sub i64 %49, %indvars.iv35.ph
  %xtraiter116 = and i64 %38, 1
  %lcmp.mod117 = icmp eq i64 %xtraiter116, 0
  br i1 %lcmp.mod117, label %for.body11.us12.prol.loopexit, label %for.body11.us12.prol

for.body11.us12.prol:                             ; preds = %for.body11.us12.preheader
  %39 = load double, double* %arrayidx15.us27, align 8
  %mul16.us14.prol = fmul double %39, %alpha
  %arrayidx20.us16.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35.ph, i64 %indvars.iv41
  %40 = load double, double* %arrayidx20.us16.prol, align 8
  %mul21.us17.prol = fmul double %mul16.us14.prol, %40
  %arrayidx25.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv35.ph
  %41 = load double, double* %arrayidx25.us18.prol, align 8
  %add.us19.prol = fadd double %41, %mul21.us17.prol
  store double %add.us19.prol, double* %arrayidx25.us18.prol, align 8
  %indvars.iv.next36.prol = or i64 %indvars.iv35.ph, 1
  br label %for.body11.us12.prol.loopexit

for.body11.us12.prol.loopexit:                    ; preds = %for.body11.us12.prol, %for.body11.us12.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.body11.us12.prol ], [ %indvars.iv35.ph, %for.body11.us12.preheader ]
  %42 = icmp eq i64 %indvars.iv44, %indvars.iv35.ph
  br i1 %42, label %for.cond9.for.inc29_crit_edge.us28, label %for.body11.us12.preheader.new

for.body11.us12.preheader.new:                    ; preds = %for.body11.us12.prol.loopexit
  br label %for.body11.us12

for.body11.us12:                                  ; preds = %for.body11.us12, %for.body11.us12.preheader.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.body11.us12.preheader.new ], [ %indvars.iv.next36.1, %for.body11.us12 ]
  %43 = load double, double* %arrayidx15.us27, align 8
  %mul16.us14 = fmul double %43, %alpha
  %arrayidx20.us16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv41
  %44 = load double, double* %arrayidx20.us16, align 8
  %mul21.us17 = fmul double %mul16.us14, %44
  %arrayidx25.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv35
  %45 = load double, double* %arrayidx25.us18, align 8
  %add.us19 = fadd double %45, %mul21.us17
  store double %add.us19, double* %arrayidx25.us18, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %46 = load double, double* %arrayidx15.us27, align 8
  %mul16.us14.1 = fmul double %46, %alpha
  %arrayidx20.us16.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv41
  %47 = load double, double* %arrayidx20.us16.1, align 8
  %mul21.us17.1 = fmul double %mul16.us14.1, %47
  %arrayidx25.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %indvars.iv.next36
  %48 = load double, double* %arrayidx25.us18.1, align 8
  %add.us19.1 = fadd double %48, %mul21.us17.1
  store double %add.us19.1, double* %arrayidx25.us18.1, align 8
  %exitcond40.1 = icmp eq i64 %indvars.iv.next36, %indvars.iv44
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  br i1 %exitcond40.1, label %for.cond9.for.inc29_crit_edge.us28.loopexit, label %for.body11.us12, !llvm.loop !14

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc32_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond6.for.inc32_crit_edge.us ]
  %49 = add i64 %indvars.iv44, 1
  %50 = add i64 %indvars.iv44, -3
  %51 = lshr i64 %50, 2
  %52 = add i64 %indvars.iv44, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 0
  %53 = mul i64 %indvars.iv44, 1201
  %54 = add i64 %53, 1
  %scevgep71 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %54
  %55 = add i64 %indvars.iv44, 1
  %min.iters.check97 = icmp ult i64 %52, 4
  br i1 %min.iters.check97, label %for.body3.us.preheader, label %min.iters.checked98

for.body3.us.preheader:                           ; preds = %middle.block95, %min.iters.checked98, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked98 ], [ 0, %for.body3.lr.ph.us ], [ %n.vec100, %middle.block95 ]
  br label %for.body3.us

min.iters.checked98:                              ; preds = %for.body3.lr.ph.us
  %n.vec100 = and i64 %52, -4
  %cmp.zero101 = icmp eq i64 %n.vec100, 0
  br i1 %cmp.zero101, label %for.body3.us.preheader, label %vector.ph102

vector.ph102:                                     ; preds = %min.iters.checked98
  %56 = and i64 %51, 1
  %lcmp.mod = icmp eq i64 %56, 0
  br i1 %lcmp.mod, label %vector.body94.prol, label %vector.body94.prol.loopexit

vector.body94.prol:                               ; preds = %vector.ph102
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 0
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load111.prol = load <2 x double>, <2 x double>* %58, align 8
  %59 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load112.prol = load <2 x double>, <2 x double>* %60, align 8
  %61 = fmul <2 x double> %wide.load111.prol, %broadcast.splat114
  %62 = fmul <2 x double> %wide.load112.prol, %broadcast.splat114
  %63 = bitcast double* %57 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8
  %64 = bitcast double* %59 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8
  br label %vector.body94.prol.loopexit

vector.body94.prol.loopexit:                      ; preds = %vector.body94.prol, %vector.ph102
  %index103.unr.ph = phi i64 [ 4, %vector.body94.prol ], [ 0, %vector.ph102 ]
  %65 = icmp eq i64 %51, 0
  br i1 %65, label %middle.block95, label %vector.ph102.new

vector.ph102.new:                                 ; preds = %vector.body94.prol.loopexit
  br label %vector.body94

vector.body94:                                    ; preds = %vector.body94, %vector.ph102.new
  %index103 = phi i64 [ %index103.unr.ph, %vector.ph102.new ], [ %index.next104.1, %vector.body94 ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %index103
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %67, align 8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %69, align 8
  %70 = fmul <2 x double> %wide.load111, %broadcast.splat114
  %71 = fmul <2 x double> %wide.load112, %broadcast.splat114
  %72 = bitcast double* %66 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8
  %73 = bitcast double* %68 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8
  %index.next104 = add i64 %index103, 4
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv44, i64 %index.next104
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load111.1 = load <2 x double>, <2 x double>* %75, align 8
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load112.1 = load <2 x double>, <2 x double>* %77, align 8
  %78 = fmul <2 x double> %wide.load111.1, %broadcast.splat114
  %79 = fmul <2 x double> %wide.load112.1, %broadcast.splat114
  %80 = bitcast double* %74 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8
  %81 = bitcast double* %76 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8
  %index.next104.1 = add i64 %index103, 8
  %82 = icmp eq i64 %index.next104.1, %n.vec100
  br i1 %82, label %middle.block95.loopexit, label %vector.body94, !llvm.loop !15

middle.block95.loopexit:                          ; preds = %vector.body94
  br label %middle.block95

middle.block95:                                   ; preds = %middle.block95.loopexit, %vector.body94.prol.loopexit
  %cmp.n106 = icmp eq i64 %52, %n.vec100
  br i1 %cmp.n106, label %for.cond9.preheader.us10.preheader, label %for.body3.us.preheader

for.cond9.for.inc29_crit_edge.us28.loopexit:      ; preds = %for.body11.us12
  br label %for.cond9.for.inc29_crit_edge.us28

for.cond9.for.inc29_crit_edge.us28:               ; preds = %for.cond9.for.inc29_crit_edge.us28.loopexit, %for.body11.us12.prol.loopexit, %middle.block62
  %indvars.iv.next42 = add nuw i64 %indvars.iv41, 1
  %cmp7.us24 = icmp slt i64 %indvars.iv.next42, %1
  br i1 %cmp7.us24, label %for.cond9.preheader.us10, label %for.cond6.for.inc32_crit_edge.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us28
  %indvars.iv.next45 = add nuw i64 %indvars.iv44, 1
  %cmp.us = icmp slt i64 %indvars.iv.next45, %2
  br i1 %cmp.us, label %for.body3.lr.ph.us, label %for.end34.loopexit

for.body3.lr.ph:                                  ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv51 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next52, %for.inc32 ]
  %83 = add i64 %indvars.iv51, -3
  %84 = lshr i64 %83, 2
  %85 = add i64 %indvars.iv51, 1
  %min.iters.check = icmp ult i64 %85, 4
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.lr.ph
  %n.vec = and i64 %85, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %86 = and i64 %84, 1
  %lcmp.mod119 = icmp eq i64 %86, 0
  br i1 %lcmp.mod119, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.ph
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 0
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %88, align 8
  %89 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 2
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load58.prol = load <2 x double>, <2 x double>* %90, align 8
  %91 = fmul <2 x double> %wide.load.prol, %broadcast.splat60
  %92 = fmul <2 x double> %wide.load58.prol, %broadcast.splat60
  %93 = bitcast double* %87 to <2 x double>*
  store <2 x double> %91, <2 x double>* %93, align 8
  %94 = bitcast double* %89 to <2 x double>*
  store <2 x double> %92, <2 x double>* %94, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  %95 = icmp eq i64 %84, 0
  br i1 %95, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %index
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %97, align 8
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %99, align 8
  %100 = fmul <2 x double> %wide.load, %broadcast.splat60
  %101 = fmul <2 x double> %wide.load58, %broadcast.splat60
  %102 = bitcast double* %96 to <2 x double>*
  store <2 x double> %100, <2 x double>* %102, align 8
  %103 = bitcast double* %98 to <2 x double>*
  store <2 x double> %101, <2 x double>* %103, align 8
  %index.next = add i64 %index, 4
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %index.next
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %105, align 8
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load58.1 = load <2 x double>, <2 x double>* %107, align 8
  %108 = fmul <2 x double> %wide.load.1, %broadcast.splat60
  %109 = fmul <2 x double> %wide.load58.1, %broadcast.splat60
  %110 = bitcast double* %104 to <2 x double>*
  store <2 x double> %108, <2 x double>* %110, align 8
  %111 = bitcast double* %106 to <2 x double>*
  store <2 x double> %109, <2 x double>* %111, align 8
  %index.next.1 = add i64 %index, 8
  %112 = icmp eq i64 %index.next.1, %n.vec
  br i1 %112, label %middle.block.loopexit, label %vector.body, !llvm.loop !16

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %85, %n.vec
  br i1 %cmp.n, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body3.lr.ph
  %indvars.iv46.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body3.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.body3 ], [ %indvars.iv46.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv46
  %113 = load double, double* %arrayidx5, align 8
  %mul = fmul double %113, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond50 = icmp eq i64 %indvars.iv46, %indvars.iv51
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br i1 %exitcond50, label %for.inc32.loopexit, label %for.body3, !llvm.loop !17

for.inc32.loopexit:                               ; preds = %for.body3
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block
  %indvars.iv.next52 = add nuw i64 %indvars.iv51, 1
  %cmp = icmp slt i64 %indvars.iv.next52, %0
  br i1 %cmp, label %for.body3.lr.ph, label %for.end34.loopexit120

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  br label %for.end34

for.end34.loopexit120:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit120, %for.end34.loopexit, %entry
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
!12 = !{!9, !6}
!13 = distinct !{!13, !3, !4}
!14 = distinct !{!14, !3, !4}
!15 = distinct !{!15, !3, !4}
!16 = distinct !{!16, !3, !4}
!17 = distinct !{!17, !2, !3, !4}

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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %for.cond1.for.inc17_crit_edge.us.for.cond.for.cond1_crit_edge.us_crit_edge, %entry
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us.for.cond.for.cond1_crit_edge.us_crit_edge ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond.for.cond1_crit_edge.us
  %indvars.iv18 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.us ], [ %indvars.iv.next19, %for.body3.us.for.body3.us_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.200000e+03, double 1.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.cond20.for.cond24_crit_edge.us.preheader, label %for.cond1.for.inc17_crit_edge.us.for.cond.for.cond1_crit_edge.us_crit_edge

for.cond1.for.inc17_crit_edge.us.for.cond.for.cond1_crit_edge.us_crit_edge: ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond.for.cond1_crit_edge.us

for.cond20.for.cond24_crit_edge.us.preheader:     ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond20.for.cond24_crit_edge.us

for.cond20.for.cond24_crit_edge.us:               ; preds = %for.cond24.for.inc41_crit_edge.us.for.cond20.for.cond24_crit_edge.us_crit_edge, %for.cond20.for.cond24_crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us.for.cond20.for.cond24_crit_edge.us_crit_edge ], [ 0, %for.cond20.for.cond24_crit_edge.us.preheader ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us.for.body27.us_crit_edge, %for.cond20.for.cond24_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond20.for.cond24_crit_edge.us ], [ %indvars.iv.next, %for.body27.us.for.body27.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us.for.body27.us_crit_edge

for.body27.us.for.body27.us_crit_edge:            ; preds = %for.body27.us
  br label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %for.end43, label %for.cond24.for.inc41_crit_edge.us.for.cond20.for.cond24_crit_edge.us_crit_edge

for.cond24.for.inc41_crit_edge.us.for.cond20.for.cond24_crit_edge.us_crit_edge: ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.cond20.for.cond24_crit_edge.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert140 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat141 = shufflevector <2 x double> %broadcast.splatinsert140, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert118 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat119 = shufflevector <2 x double> %broadcast.splatinsert118, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv53
  br i1 %exitcond, label %for.cond6.for.cond9_crit_edge.us12.preheader.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !1

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond6.for.cond9_crit_edge.us12.preheader.loopexit: ; preds = %for.body3.us
  br label %for.cond6.for.cond9_crit_edge.us12.preheader

for.cond6.for.cond9_crit_edge.us12.preheader:     ; preds = %middle.block122.for.cond6.for.cond9_crit_edge.us12.preheader_crit_edge, %for.cond6.for.cond9_crit_edge.us12.preheader.loopexit
  %min.iters.check79 = icmp ult i64 %39, 2
  %n.vec82 = and i64 %39, -2
  %cmp.zero83 = icmp eq i64 %n.vec82, 0
  %cmp.n114 = icmp eq i64 %39, %n.vec82
  br label %for.cond6.for.cond9_crit_edge.us12

for.cond6.for.cond9_crit_edge.us12:               ; preds = %for.cond9.for.inc40_crit_edge.us35.for.cond6.for.cond9_crit_edge.us12_crit_edge, %for.cond6.for.cond9_crit_edge.us12.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond9.for.inc40_crit_edge.us35.for.cond6.for.cond9_crit_edge.us12_crit_edge ], [ 0, %for.cond6.for.cond9_crit_edge.us12.preheader ]
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv48
  %1 = add i64 %indvars.iv48, 1
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %1
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv48
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv55, i64 %1
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv48
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv48
  br i1 %min.iters.check79, label %for.cond6.for.cond9_crit_edge.us12.for.body11.us14.preheader_crit_edge, label %min.iters.checked80

for.cond6.for.cond9_crit_edge.us12.for.body11.us14.preheader_crit_edge: ; preds = %for.cond6.for.cond9_crit_edge.us12
  br label %for.body11.us14.preheader

min.iters.checked80:                              ; preds = %for.cond6.for.cond9_crit_edge.us12
  br i1 %cmp.zero83, label %min.iters.checked80.for.body11.us14.preheader_crit_edge, label %vector.memcheck

min.iters.checked80.for.body11.us14.preheader_crit_edge: ; preds = %min.iters.checked80
  br label %for.body11.us14.preheader

vector.memcheck:                                  ; preds = %min.iters.checked80
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep86
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %scevgep90
  %bound198 = icmp ult double* %scevgep88, %scevgep86
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  %bound0100 = icmp ult double* %scevgep, %scevgep94
  %bound1101 = icmp ult double* %scevgep92, %scevgep86
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %conflict.rdx, %found.conflict102
  %bound0106 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound1107 = icmp ult double* %arrayidx20.us33, %scevgep86
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx109 = or i1 %conflict.rdx103, %found.conflict108
  br i1 %conflict.rdx109, label %vector.memcheck.for.body11.us14.preheader_crit_edge, label %vector.ph110

vector.memcheck.for.body11.us14.preheader_crit_edge: ; preds = %vector.memcheck
  br label %for.body11.us14.preheader

vector.ph110:                                     ; preds = %vector.memcheck
  %2 = load double, double* %arrayidx20.us33, align 8, !alias.scope !5
  %3 = insertelement <2 x double> undef, double %2, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %5 = load double, double* %arrayidx30.us34, align 8, !alias.scope !8
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76.vector.body76_crit_edge, %vector.ph110
  %index111 = phi i64 [ 0, %vector.ph110 ], [ %index.next112, %vector.body76.vector.body76_crit_edge ]
  %8 = or i64 %index111, 1
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index111, i64 %indvars.iv48
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %8, i64 %indvars.iv48
  %11 = load double, double* %9, align 8, !alias.scope !10
  %12 = load double, double* %10, align 8, !alias.scope !10
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, %broadcast.splat119
  %16 = fmul <2 x double> %15, %4
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index111, i64 %indvars.iv48
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %8, i64 %indvars.iv48
  %19 = load double, double* %17, align 8, !alias.scope !12
  %20 = load double, double* %18, align 8, !alias.scope !12
  %21 = insertelement <2 x double> undef, double %19, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %22, %broadcast.splat119
  %24 = fmul <2 x double> %23, %7
  %25 = fadd <2 x double> %16, %24
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %index111
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !14, !noalias !16
  %28 = fadd <2 x double> %wide.load120, %25
  %29 = bitcast double* %26 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8, !alias.scope !14, !noalias !16
  %index.next112 = add i64 %index111, 2
  %30 = icmp eq i64 %index.next112, %n.vec82
  br i1 %30, label %middle.block77, label %vector.body76.vector.body76_crit_edge, !llvm.loop !17

vector.body76.vector.body76_crit_edge:            ; preds = %vector.body76
  br label %vector.body76

middle.block77:                                   ; preds = %vector.body76
  br i1 %cmp.n114, label %middle.block77.for.cond9.for.inc40_crit_edge.us35_crit_edge, label %middle.block77.for.body11.us14.preheader_crit_edge

middle.block77.for.body11.us14.preheader_crit_edge: ; preds = %middle.block77
  br label %for.body11.us14.preheader

middle.block77.for.cond9.for.inc40_crit_edge.us35_crit_edge: ; preds = %middle.block77
  br label %for.cond9.for.inc40_crit_edge.us35

for.body11.us14.preheader:                        ; preds = %middle.block77.for.body11.us14.preheader_crit_edge, %vector.memcheck.for.body11.us14.preheader_crit_edge, %min.iters.checked80.for.body11.us14.preheader_crit_edge, %for.cond6.for.cond9_crit_edge.us12.for.body11.us14.preheader_crit_edge
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck.for.body11.us14.preheader_crit_edge ], [ 0, %min.iters.checked80.for.body11.us14.preheader_crit_edge ], [ 0, %for.cond6.for.cond9_crit_edge.us12.for.body11.us14.preheader_crit_edge ], [ %n.vec82, %middle.block77.for.body11.us14.preheader_crit_edge ]
  br label %for.body11.us14

for.body11.us14:                                  ; preds = %for.body11.us14.for.body11.us14_crit_edge, %for.body11.us14.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.body11.us14.for.body11.us14_crit_edge ], [ %indvars.iv42.ph, %for.body11.us14.preheader ]
  %arrayidx15.us17 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv48
  %31 = load double, double* %arrayidx15.us17, align 8
  %mul16.us18 = fmul double %31, %alpha
  %32 = load double, double* %arrayidx20.us33, align 8
  %mul21.us19 = fmul double %mul16.us18, %32
  %arrayidx25.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv48
  %33 = load double, double* %arrayidx25.us20, align 8
  %mul26.us21 = fmul double %33, %alpha
  %34 = load double, double* %arrayidx30.us34, align 8
  %mul31.us22 = fmul double %mul26.us21, %34
  %add.us23 = fadd double %mul21.us19, %mul31.us22
  %arrayidx35.us24 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv42
  %35 = load double, double* %arrayidx35.us24, align 8
  %add36.us25 = fadd double %35, %add.us23
  store double %add36.us25, double* %arrayidx35.us24, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next43, %indvars.iv53
  br i1 %exitcond47, label %for.cond9.for.inc40_crit_edge.us35.loopexit, label %for.body11.us14.for.body11.us14_crit_edge, !llvm.loop !18

for.body11.us14.for.body11.us14_crit_edge:        ; preds = %for.body11.us14
  br label %for.body11.us14

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge, %entry
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge ], [ 0, %entry ]
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge ], [ 1, %entry ]
  %36 = add i64 %indvars.iv55, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 0
  %37 = mul i64 %indvars.iv55, 1201
  %38 = add i64 %37, 1
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %38
  %39 = add i64 %indvars.iv55, 1
  %min.iters.check124 = icmp ult i64 %36, 4
  br i1 %min.iters.check124, label %for.body3.lr.ph.us.for.body3.us.preheader_crit_edge, label %min.iters.checked125

for.body3.lr.ph.us.for.body3.us.preheader_crit_edge: ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block122.for.body3.us.preheader_crit_edge, %min.iters.checked125.for.body3.us.preheader_crit_edge, %for.body3.lr.ph.us.for.body3.us.preheader_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked125.for.body3.us.preheader_crit_edge ], [ 0, %for.body3.lr.ph.us.for.body3.us.preheader_crit_edge ], [ %n.vec127, %middle.block122.for.body3.us.preheader_crit_edge ]
  br label %for.body3.us

min.iters.checked125:                             ; preds = %for.body3.lr.ph.us
  %n.vec127 = and i64 %36, -4
  %cmp.zero128 = icmp eq i64 %n.vec127, 0
  br i1 %cmp.zero128, label %min.iters.checked125.for.body3.us.preheader_crit_edge, label %vector.ph129

min.iters.checked125.for.body3.us.preheader_crit_edge: ; preds = %min.iters.checked125
  br label %for.body3.us.preheader

vector.ph129:                                     ; preds = %min.iters.checked125
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121.vector.body121_crit_edge, %vector.ph129
  %index130 = phi i64 [ 0, %vector.ph129 ], [ %index.next131, %vector.body121.vector.body121_crit_edge ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv55, i64 %index130
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %41, align 8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %43, align 8
  %44 = fmul <2 x double> %wide.load138, %broadcast.splat141
  %45 = fmul <2 x double> %wide.load139, %broadcast.splat141
  %46 = bitcast double* %40 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8
  %47 = bitcast double* %42 to <2 x double>*
  store <2 x double> %45, <2 x double>* %47, align 8
  %index.next131 = add i64 %index130, 4
  %48 = icmp eq i64 %index.next131, %n.vec127
  br i1 %48, label %middle.block122, label %vector.body121.vector.body121_crit_edge, !llvm.loop !19

vector.body121.vector.body121_crit_edge:          ; preds = %vector.body121
  br label %vector.body121

middle.block122:                                  ; preds = %vector.body121
  %cmp.n133 = icmp eq i64 %36, %n.vec127
  br i1 %cmp.n133, label %middle.block122.for.cond6.for.cond9_crit_edge.us12.preheader_crit_edge, label %middle.block122.for.body3.us.preheader_crit_edge

middle.block122.for.body3.us.preheader_crit_edge: ; preds = %middle.block122
  br label %for.body3.us.preheader

middle.block122.for.cond6.for.cond9_crit_edge.us12.preheader_crit_edge: ; preds = %middle.block122
  br label %for.cond6.for.cond9_crit_edge.us12.preheader

for.cond9.for.inc40_crit_edge.us35.loopexit:      ; preds = %for.body11.us14
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.for.inc40_crit_edge.us35:               ; preds = %middle.block77.for.cond9.for.inc40_crit_edge.us35_crit_edge, %for.cond9.for.inc40_crit_edge.us35.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond51, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.for.inc40_crit_edge.us35.for.cond6.for.cond9_crit_edge.us12_crit_edge

for.cond9.for.inc40_crit_edge.us35.for.cond6.for.cond9_crit_edge.us12_crit_edge: ; preds = %for.cond9.for.inc40_crit_edge.us35
  br label %for.cond6.for.cond9_crit_edge.us12

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond58, label %for.end45, label %for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge

for.cond6.for.inc43_crit_edge.us.for.body3.lr.ph.us_crit_edge: ; preds = %for.cond6.for.inc43_crit_edge.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br label %for.body3.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
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
  br label %for.cond.for.cond2_crit_edge.us

for.cond.for.cond2_crit_edge.us:                  ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond.for.cond2_crit_edge.us_crit_edge, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us.for.cond.for.cond2_crit_edge.us_crit_edge ]
  %3 = mul nsw i64 %indvars.iv7, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond.for.cond2_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us ], [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.cond.for.cond2_crit_edge.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond.for.cond2_crit_edge.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond.for.cond2_crit_edge.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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

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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %B.addr = alloca [1000 x double]*, align 8
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp29 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  %0 = load [1000 x double]*, [1000 x double]** %B.addr, align 8
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %m, -1
  %2 = sext i32 %n to i64
  %wide.trip.count24 = zext i32 %1 to i64
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv11, i32 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next27, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv19, %indvars.iv26
  %4 = add nuw nsw i64 %3, 1
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, %n
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv19
  %6 = add nuw nsw i64 %3, 2
  %7 = trunc i64 %6 to i32
  %rem9.us = srem i32 %7, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv19
  store double %div.us.v.r2, double* %arrayidx16.us, align 8
  %exitcond25 = icmp eq i64 %indvars.iv19, %wide.trip.count24
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  br i1 %exitcond25, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond32 = icmp ne i64 %indvars.iv.next27, %2
  br i1 %exitcond32, label %for.cond1.preheader.us, label %for.cond20.preheader

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %cmp215 = icmp sgt i32 %n, 0
  br i1 %cmp215, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond20.preheader, %for.cond1.preheader.lr.ph
  %conv32 = sitofp i32 %m to double
  %8 = add i32 %n, -1
  %9 = sext i32 %n to i64
  %wide.trip.count = zext i32 %8 to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv17 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next18, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body27.us ], [ 0, %for.cond24.preheader.us ]
  %10 = mul nuw nsw i64 %indvars.iv, %indvars.iv17
  %11 = add nuw nsw i64 %10, 3
  %12 = trunc i64 %11 to i32
  %rem30.us = srem i32 %12, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %cmp21.us = icmp slt i64 %indvars.iv.next18, %9
  br i1 %cmp21.us, label %for.cond24.preheader.us, label %for.end43.loopexit

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %for.cond20.preheader, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %alpha.addr = alloca double, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [1000 x double]*, align 8
  store double %alpha, double* %alpha.addr, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [1000 x double]* %B, [1000 x double]** %B.addr, align 8
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp77 = icmp sgt i32 %m, 0
  br i1 %cmp77, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = sext i32 %n to i64
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %m to i64
  %2 = sext i32 %n to i64
  %3 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %4 = load double, double* %alpha.addr, align 8
  %5 = load [1000 x double]*, [1000 x double]** %B.addr, align 8
  %broadcast.splatinsert118 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat119 = shufflevector <2 x double> %broadcast.splatinsert118, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert140 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat141 = shufflevector <2 x double> %broadcast.splatinsert140, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 %indvars.iv
  %6 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %6, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %indvars.iv62
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond9.preheader.us18.preheader.loopexit, label %for.body3.us, !llvm.loop !1

for.cond9.preheader.us18.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us18.preheader

for.cond9.preheader.us18.preheader:               ; preds = %for.cond9.preheader.us18.preheader.loopexit, %middle.block122
  %min.iters.check79 = icmp ult i64 %47, 2
  %n.vec82 = and i64 %47, -2
  %cmp.zero83 = icmp eq i64 %n.vec82, 0
  %cmp.n114 = icmp eq i64 %47, %n.vec82
  br label %for.cond9.preheader.us18

for.cond9.preheader.us18:                         ; preds = %for.cond9.preheader.us18.preheader, %for.cond9.for.inc40_crit_edge.us41
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.cond9.for.inc40_crit_edge.us41 ], [ 0, %for.cond9.preheader.us18.preheader ]
  %scevgep88 = getelementptr [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv59
  %7 = add nuw nsw i64 %indvars.iv59, 1
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %3, i64 %indvars.iv62, i64 %7
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv59
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %7
  %arrayidx20.us39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv59
  %arrayidx30.us40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv62, i64 %indvars.iv59
  br i1 %min.iters.check79, label %for.body11.us19.preheader, label %min.iters.checked80

min.iters.checked80:                              ; preds = %for.cond9.preheader.us18
  br i1 %cmp.zero83, label %for.body11.us19.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked80
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us40
  %bound1 = icmp ult double* %arrayidx30.us40, %scevgep86
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %scevgep90
  %bound198 = icmp ult double* %scevgep88, %scevgep86
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  %bound0100 = icmp ult double* %scevgep, %scevgep94
  %bound1101 = icmp ult double* %scevgep92, %scevgep86
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %conflict.rdx, %found.conflict102
  %bound0106 = icmp ult double* %scevgep, %arrayidx20.us39
  %bound1107 = icmp ult double* %arrayidx20.us39, %scevgep86
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx109 = or i1 %conflict.rdx103, %found.conflict108
  br i1 %conflict.rdx109, label %for.body11.us19.preheader, label %vector.ph110

vector.ph110:                                     ; preds = %vector.memcheck
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76, %vector.ph110
  %index111 = phi i64 [ 0, %vector.ph110 ], [ %index.next112, %vector.body76 ]
  %8 = or i64 %index111, 1
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %index111, i64 %indvars.iv59
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %8, i64 %indvars.iv59
  %11 = load double, double* %9, align 8, !alias.scope !5
  %12 = load double, double* %10, align 8, !alias.scope !5
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, %broadcast.splat119
  %16 = load double, double* %arrayidx20.us39, align 8, !alias.scope !8
  %17 = insertelement <2 x double> undef, double %16, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = fmul <2 x double> %15, %18
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index111, i64 %indvars.iv59
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %8, i64 %indvars.iv59
  %22 = load double, double* %20, align 8, !alias.scope !10
  %23 = load double, double* %21, align 8, !alias.scope !10
  %24 = insertelement <2 x double> undef, double %22, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %25, %broadcast.splat119
  %27 = load double, double* %arrayidx30.us40, align 8, !alias.scope !12
  %28 = insertelement <2 x double> undef, double %27, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = fmul <2 x double> %26, %29
  %31 = fadd <2 x double> %19, %30
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 %index111
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !14, !noalias !16
  %34 = fadd <2 x double> %31, %wide.load120
  %35 = bitcast double* %32 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8, !alias.scope !14, !noalias !16
  %index.next112 = add i64 %index111, 2
  %36 = icmp eq i64 %index.next112, %n.vec82
  br i1 %36, label %middle.block77, label %vector.body76, !llvm.loop !17

middle.block77:                                   ; preds = %vector.body76
  br i1 %cmp.n114, label %for.cond9.for.inc40_crit_edge.us41, label %for.body11.us19.preheader

for.body11.us19.preheader:                        ; preds = %middle.block77, %vector.memcheck, %min.iters.checked80, %for.cond9.preheader.us18
  %indvars.iv53.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked80 ], [ 0, %for.cond9.preheader.us18 ], [ %n.vec82, %middle.block77 ]
  br label %for.body11.us19

for.body11.us19:                                  ; preds = %for.body11.us19.preheader, %for.body11.us19
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.body11.us19 ], [ %indvars.iv53.ph, %for.body11.us19.preheader ]
  %arrayidx15.us21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv53, i64 %indvars.iv59
  %37 = load double, double* %arrayidx15.us21, align 8
  %mul16.us22 = fmul double %37, %4
  %38 = load double, double* %arrayidx20.us39, align 8
  %mul21.us23 = fmul double %mul16.us22, %38
  %arrayidx25.us24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv53, i64 %indvars.iv59
  %39 = load double, double* %arrayidx25.us24, align 8
  %mul26.us25 = fmul double %39, %4
  %40 = load double, double* %arrayidx30.us40, align 8
  %mul31.us26 = fmul double %mul26.us25, %40
  %add.us27 = fadd double %mul21.us23, %mul31.us26
  %arrayidx35.us28 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 %indvars.iv53
  %41 = load double, double* %arrayidx35.us28, align 8
  %add36.us29 = fadd double %add.us27, %41
  store double %add36.us29, double* %arrayidx35.us28, align 8
  %exitcond58 = icmp eq i64 %indvars.iv53, %indvars.iv62
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  br i1 %exitcond58, label %for.cond9.for.inc40_crit_edge.us41.loopexit, label %for.body11.us19, !llvm.loop !18

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv62 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next63, %for.cond6.for.inc43_crit_edge.us ]
  %42 = add nsw i64 %indvars.iv62, -3
  %43 = lshr i64 %42, 2
  %44 = add nuw nsw i64 %indvars.iv62, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 0
  %45 = mul nuw nsw i64 %indvars.iv62, 1201
  %46 = add nuw nsw i64 %45, 1
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %46
  %47 = add nuw nsw i64 %indvars.iv62, 1
  %min.iters.check124 = icmp ult i64 %44, 4
  br i1 %min.iters.check124, label %for.body3.us.preheader, label %min.iters.checked125

for.body3.us.preheader:                           ; preds = %middle.block122, %min.iters.checked125, %for.body3.lr.ph.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked125 ], [ 0, %for.body3.lr.ph.us ], [ %n.vec127, %middle.block122 ]
  br label %for.body3.us

min.iters.checked125:                             ; preds = %for.body3.lr.ph.us
  %n.vec127 = and i64 %44, -4
  %cmp.zero128 = icmp eq i64 %n.vec127, 0
  br i1 %cmp.zero128, label %for.body3.us.preheader, label %vector.ph129

vector.ph129:                                     ; preds = %min.iters.checked125
  %48 = and i64 %43, 1
  %lcmp.mod = icmp eq i64 %48, 0
  br i1 %lcmp.mod, label %vector.body121.prol.preheader, label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.preheader:                    ; preds = %vector.ph129
  br label %vector.body121.prol

vector.body121.prol:                              ; preds = %vector.body121.prol.preheader
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 0
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load138.prol = load <2 x double>, <2 x double>* %50, align 8
  %51 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load139.prol = load <2 x double>, <2 x double>* %52, align 8
  %53 = fmul <2 x double> %wide.load138.prol, %broadcast.splat141
  %54 = fmul <2 x double> %wide.load139.prol, %broadcast.splat141
  %55 = bitcast double* %49 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8
  %56 = bitcast double* %51 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8
  br label %vector.body121.prol.loopexit.unr-lcssa

vector.body121.prol.loopexit.unr-lcssa:           ; preds = %vector.ph129, %vector.body121.prol
  %index130.unr.ph = phi i64 [ 4, %vector.body121.prol ], [ 0, %vector.ph129 ]
  br label %vector.body121.prol.loopexit

vector.body121.prol.loopexit:                     ; preds = %vector.body121.prol.loopexit.unr-lcssa
  %57 = icmp eq i64 %43, 0
  br i1 %57, label %middle.block122, label %vector.ph129.new

vector.ph129.new:                                 ; preds = %vector.body121.prol.loopexit
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121, %vector.ph129.new
  %index130 = phi i64 [ %index130.unr.ph, %vector.ph129.new ], [ %index.next131.1, %vector.body121 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 %index130
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %61, align 8
  %62 = fmul <2 x double> %wide.load138, %broadcast.splat141
  %63 = fmul <2 x double> %wide.load139, %broadcast.splat141
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8
  %index.next131 = add i64 %index130, 4
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv62, i64 %index.next131
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load138.1 = load <2 x double>, <2 x double>* %67, align 8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load139.1 = load <2 x double>, <2 x double>* %69, align 8
  %70 = fmul <2 x double> %wide.load138.1, %broadcast.splat141
  %71 = fmul <2 x double> %wide.load139.1, %broadcast.splat141
  %72 = bitcast double* %66 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8
  %73 = bitcast double* %68 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8
  %index.next131.1 = add i64 %index130, 8
  %74 = icmp eq i64 %index.next131.1, %n.vec127
  br i1 %74, label %middle.block122.unr-lcssa, label %vector.body121, !llvm.loop !19

middle.block122.unr-lcssa:                        ; preds = %vector.body121
  br label %middle.block122

middle.block122:                                  ; preds = %vector.body121.prol.loopexit, %middle.block122.unr-lcssa
  %cmp.n133 = icmp eq i64 %44, %n.vec127
  br i1 %cmp.n133, label %for.cond9.preheader.us18.preheader, label %for.body3.us.preheader

for.cond9.for.inc40_crit_edge.us41.loopexit:      ; preds = %for.body11.us19
  br label %for.cond9.for.inc40_crit_edge.us41

for.cond9.for.inc40_crit_edge.us41:               ; preds = %for.cond9.for.inc40_crit_edge.us41.loopexit, %middle.block77
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond145 = icmp ne i64 %indvars.iv.next60, %1
  br i1 %exitcond145, label %for.cond9.preheader.us18, label %for.cond6.for.inc43_crit_edge.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us41
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond146 = icmp ne i64 %indvars.iv.next63, %2
  br i1 %exitcond146, label %for.body3.lr.ph.us, label %for.end45.loopexit

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.cond1.preheader.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next70, %for.inc43 ]
  %75 = add nsw i64 %indvars.iv69, -3
  %76 = lshr i64 %75, 2
  %77 = add nuw nsw i64 %indvars.iv69, 1
  %min.iters.check = icmp ult i64 %77, 4
  br i1 %min.iters.check, label %for.body3.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.lr.ph
  %n.vec = and i64 %77, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %78 = and i64 %76, 1
  %lcmp.mod144 = icmp eq i64 %78, 0
  br i1 %lcmp.mod144, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv69, i64 0
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %80, align 8
  %81 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv69, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load73.prol = load <2 x double>, <2 x double>* %82, align 8
  %83 = fmul <2 x double> %wide.load.prol, %broadcast.splat75
  %84 = fmul <2 x double> %wide.load73.prol, %broadcast.splat75
  %85 = bitcast double* %79 to <2 x double>*
  store <2 x double> %83, <2 x double>* %85, align 8
  %86 = bitcast double* %81 to <2 x double>*
  store <2 x double> %84, <2 x double>* %86, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  %87 = icmp eq i64 %76, 0
  br i1 %87, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv69, i64 %index
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %89, align 8
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %91, align 8
  %92 = fmul <2 x double> %wide.load, %broadcast.splat75
  %93 = fmul <2 x double> %wide.load73, %broadcast.splat75
  %94 = bitcast double* %88 to <2 x double>*
  store <2 x double> %92, <2 x double>* %94, align 8
  %95 = bitcast double* %90 to <2 x double>*
  store <2 x double> %93, <2 x double>* %95, align 8
  %index.next = add i64 %index, 4
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv69, i64 %index.next
  %97 = bitcast double* %96 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %97, align 8
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load73.1 = load <2 x double>, <2 x double>* %99, align 8
  %100 = fmul <2 x double> %wide.load.1, %broadcast.splat75
  %101 = fmul <2 x double> %wide.load73.1, %broadcast.splat75
  %102 = bitcast double* %96 to <2 x double>*
  store <2 x double> %100, <2 x double>* %102, align 8
  %103 = bitcast double* %98 to <2 x double>*
  store <2 x double> %101, <2 x double>* %103, align 8
  %index.next.1 = add i64 %index, 8
  %104 = icmp eq i64 %index.next.1, %n.vec
  br i1 %104, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !20

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %77, %n.vec
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.body3.lr.ph
  %indvars.iv64.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body3.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body3 ], [ %indvars.iv64.ph, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv69, i64 %indvars.iv64
  %105 = load double, double* %arrayidx5, align 8
  %mul = fmul double %105, %beta
  store double %mul, double* %arrayidx5, align 8
  %exitcond68 = icmp eq i64 %indvars.iv64, %indvars.iv69
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  br i1 %exitcond68, label %for.inc43.loopexit, label %for.body3, !llvm.loop !21

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond147 = icmp ne i64 %indvars.iv.next70, %0
  br i1 %exitcond147, label %for.body3.lr.ph, label %for.end45.loopexit142

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit142:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit142, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = sext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp ne i64 %indvars.iv.next9, %3
  br i1 %exitcond11, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
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
!16 = !{!13, !6, !11, !9}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !3, !4}
!20 = distinct !{!20, !3, !4}
!21 = distinct !{!21, !2, !3, !4}

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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %1 = bitcast i8* %call1 to [1000 x double]*
  %2 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %1, [1000 x double]* %2)
  call void (...) @polybench_timer_start() #4
  %3 = load double, double* %alpha, align 8
  %4 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %3, double %4, [1200 x double]* %0, [1000 x double]* %1, [1000 x double]* %2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1200, [1200 x double]* %0)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.body.lr.ph, label %for.end43

for.body.lr.ph:                                   ; preds = %entry
  %cmp210 = icmp sgt i32 %m, 0
  %0 = sext i32 %n to i64
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp210, label %for.body.us.preheader, label %for.body23.us.preheader

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %1 = sext i32 %m to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv31 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next32, %for.cond1.for.inc17_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body.us, %for.inc.us
  %indvars.iv25 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next26, %for.inc.us ]
  %2 = mul nsw i64 %indvars.iv31, %indvars.iv25
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv25
  store double %div.us, double* %arrayidx6.us, align 8
  %5 = add nsw i64 %2, 2
  %6 = trunc i64 %5 to i32
  %rem9.us = srem i32 %6, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv31, i64 %indvars.iv25
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next26, %1
  br i1 %cmp2.us, label %for.inc.us, label %for.cond1.for.inc17_crit_edge.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, 1
  %cmp.us = icmp slt i64 %indvars.iv.next32, %0
  br i1 %cmp.us, label %for.body.us, label %for.body23.us.preheader.loopexit

for.body23.us.preheader.loopexit:                 ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.body23.us.preheader

for.body23.us.preheader:                          ; preds = %for.body23.us.preheader.loopexit, %for.body.lr.ph
  %7 = zext i32 %n to i64
  br label %for.body23.us

for.body23.us:                                    ; preds = %for.body23.us.preheader, %for.cond24.for.inc41_crit_edge.us
  %indvars.iv23 = phi i64 [ 0, %for.body23.us.preheader ], [ %indvars.iv.next24, %for.cond24.for.inc41_crit_edge.us ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us, %for.body23.us
  %indvars.iv = phi i64 [ 0, %for.body23.us ], [ %indvars.iv.next, %for.inc38.us ]
  %8 = mul nsw i64 %indvars.iv23, %indvars.iv
  %9 = add nsw i64 %8, 3
  %10 = trunc i64 %9 to i32
  %rem30.us = srem i32 %10, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv11
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv23, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond36, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 1
  %cmp21.us = icmp slt i64 %indvars.iv.next24, %0
  br i1 %cmp21.us, label %for.body23.us, label %for.end43.loopexit

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #2 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.body.lr.ph, label %for.end45

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %m to i64
  %cmp79 = icmp sgt i32 %m, 0
  %1 = sext i32 %n to i64
  br i1 %cmp79, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  %broadcast.splatinsert99 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat100 = shufflevector <2 x double> %broadcast.splatinsert99, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %broadcast.splatinsert145 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat146 = shufflevector <2 x double> %broadcast.splatinsert145, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert170 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat171 = shufflevector <2 x double> %broadcast.splatinsert170, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond6.for.inc43_crit_edge.us
  %indvar110 = phi i64 [ %2, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %indvars.iv89 = phi i32 [ %indvars.iv.next90, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.body.us.preheader ]
  %indvars.iv87 = phi i2 [ %indvars.iv.next88, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.body.us.preheader ]
  %indvar = phi i32 [ %4, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %2 = add i64 %indvar110, 1
  %3 = and i64 %2, 4294967295
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar110, i64 0
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvar110, i64 %3
  %4 = add i32 %indvar, 1
  %5 = zext i32 %4 to i64
  %6 = zext i32 %indvars.iv89 to i64
  %7 = zext i2 %indvars.iv87 to i64
  %8 = add nuw nsw i64 %7, 4294967295
  %9 = and i64 %8, 4294967295
  %10 = add nuw nsw i64 %9, 1
  %cmp24.us = icmp slt i64 %indvars.iv70, 0
  br i1 %cmp24.us, label %for.cond6.for.inc43_crit_edge.us, label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader173, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader173 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv
  %11 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %11, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %12, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next.1
  %13 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %13, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next.2
  %14 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %14, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %6
  br i1 %exitcond.3, label %for.body8.us19.preheader.loopexit, label %for.inc.us, !llvm.loop !1

for.body8.us19.preheader.loopexit:                ; preds = %for.inc.us
  br label %for.body8.us19.preheader

for.body8.us19.preheader:                         ; preds = %for.body8.us19.preheader.loopexit, %for.inc.us.prol.loopexit, %middle.block148
  %min.iters.check104 = icmp ult i32 %4, 2
  %15 = and i32 %4, 1
  %n.mod.vf106 = zext i32 %15 to i64
  %n.vec107 = sub nsw i64 %5, %n.mod.vf106
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  %cmp.n141 = icmp eq i32 %15, 0
  br label %for.body8.us19

for.body8.us19:                                   ; preds = %for.body8.us19.preheader, %for.cond9.for.inc40_crit_edge.us48
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.cond9.for.inc40_crit_edge.us48 ], [ 0, %for.body8.us19.preheader ]
  %scevgep115 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv65
  %16 = add i64 %indvars.iv65, -999
  %scevgep117 = getelementptr [1000 x double], [1000 x double]* %A, i64 %3, i64 %16
  %scevgep119 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv65
  %scevgep121 = getelementptr [1000 x double], [1000 x double]* %B, i64 %3, i64 %16
  %arrayidx20.us44 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv70, i64 %indvars.iv65
  %arrayidx30.us47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv65
  br i1 %min.iters.check104, label %for.inc37.us21.preheader, label %min.iters.checked105

min.iters.checked105:                             ; preds = %for.body8.us19
  br i1 %cmp.zero108, label %for.inc37.us21.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked105
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us47
  %bound1 = icmp ult double* %arrayidx30.us47, %scevgep113
  %found.conflict = and i1 %bound0, %bound1
  %bound0124 = icmp ult double* %scevgep, %scevgep117
  %bound1125 = icmp ult double* %scevgep115, %scevgep113
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx = or i1 %found.conflict, %found.conflict126
  %bound0127 = icmp ult double* %scevgep, %scevgep121
  %bound1128 = icmp ult double* %scevgep119, %scevgep113
  %found.conflict129 = and i1 %bound0127, %bound1128
  %conflict.rdx130 = or i1 %conflict.rdx, %found.conflict129
  %bound0133 = icmp ult double* %scevgep, %arrayidx20.us44
  %bound1134 = icmp ult double* %arrayidx20.us44, %scevgep113
  %found.conflict135 = and i1 %bound0133, %bound1134
  %conflict.rdx136 = or i1 %conflict.rdx130, %found.conflict135
  br i1 %conflict.rdx136, label %for.inc37.us21.preheader, label %vector.ph137

vector.ph137:                                     ; preds = %vector.memcheck
  br label %vector.body101

vector.body101:                                   ; preds = %vector.body101, %vector.ph137
  %index138 = phi i64 [ 0, %vector.ph137 ], [ %index.next139, %vector.body101 ]
  %17 = or i64 %index138, 1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index138, i64 %indvars.iv65
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %17, i64 %indvars.iv65
  %20 = load double, double* %18, align 8, !alias.scope !5
  %21 = load double, double* %19, align 8, !alias.scope !5
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fmul <2 x double> %23, %broadcast.splat146
  %25 = load double, double* %arrayidx20.us44, align 8, !alias.scope !8
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %24, %27
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index138, i64 %indvars.iv65
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %17, i64 %indvars.iv65
  %31 = load double, double* %29, align 8, !alias.scope !10
  %32 = load double, double* %30, align 8, !alias.scope !10
  %33 = insertelement <2 x double> undef, double %31, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fmul <2 x double> %34, %broadcast.splat146
  %36 = load double, double* %arrayidx30.us47, align 8, !alias.scope !12
  %37 = insertelement <2 x double> undef, double %36, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = fmul <2 x double> %35, %38
  %40 = fadd <2 x double> %28, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %index138
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !14, !noalias !16
  %43 = fadd <2 x double> %wide.load, %40
  store <2 x double> %43, <2 x double>* %42, align 8, !alias.scope !14, !noalias !16
  %index.next139 = add i64 %index138, 2
  %44 = icmp eq i64 %index.next139, %n.vec107
  br i1 %44, label %middle.block102, label %vector.body101, !llvm.loop !17

middle.block102:                                  ; preds = %vector.body101
  br i1 %cmp.n141, label %for.cond9.for.inc40_crit_edge.us48, label %for.inc37.us21.preheader

for.inc37.us21.preheader:                         ; preds = %middle.block102, %vector.memcheck, %min.iters.checked105, %for.body8.us19
  %indvars.iv59.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked105 ], [ 0, %for.body8.us19 ], [ %n.vec107, %middle.block102 ]
  br label %for.inc37.us21

for.inc37.us21:                                   ; preds = %for.inc37.us21.preheader, %for.inc37.us21
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc37.us21 ], [ %indvars.iv59.ph, %for.inc37.us21.preheader ]
  %arrayidx15.us24 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv65
  %45 = load double, double* %arrayidx15.us24, align 8
  %mul16.us25 = fmul double %45, %alpha
  %46 = load double, double* %arrayidx20.us44, align 8
  %mul21.us26 = fmul double %mul16.us25, %46
  %arrayidx25.us28 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv59, i64 %indvars.iv65
  %47 = load double, double* %arrayidx25.us28, align 8
  %mul26.us29 = fmul double %47, %alpha
  %48 = load double, double* %arrayidx30.us47, align 8
  %mul31.us30 = fmul double %mul26.us29, %48
  %add.us31 = fadd double %mul21.us26, %mul31.us30
  %arrayidx35.us33 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv59
  %49 = load double, double* %arrayidx35.us33, align 8
  %add36.us34 = fadd double %49, %add.us31
  store double %add36.us34, double* %arrayidx35.us33, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond = icmp eq i64 %indvars.iv.next60, %6
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us48.loopexit, label %for.inc37.us21, !llvm.loop !18

for.inc.lr.ph.us:                                 ; preds = %for.body.us
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.prol
  %50 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %50, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !19

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %10, %for.inc.us.prol.loopexit.loopexit ]
  %51 = icmp ult i32 %indvar, 3
  br i1 %51, label %for.body8.us19.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %52 = add nsw i64 %3, -4
  %53 = sub nsw i64 %52, %indvars.iv.unr
  %54 = lshr i64 %53, 2
  %55 = add nuw nsw i64 %54, 1
  %min.iters.check150 = icmp ult i64 %55, 2
  br i1 %min.iters.check150, label %for.inc.us.preheader173, label %min.iters.checked151

for.inc.us.preheader173:                          ; preds = %middle.block148, %min.iters.checked151, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked151 ], [ %indvars.iv.unr, %for.inc.us.preheader ], [ %ind.end159, %middle.block148 ]
  br label %for.inc.us

min.iters.checked151:                             ; preds = %for.inc.us.preheader
  %n.mod.vf152 = and i64 %55, 1
  %n.vec153 = sub nsw i64 %55, %n.mod.vf152
  %cmp.zero154 = icmp eq i64 %n.vec153, 0
  %56 = add nsw i64 %indvars.iv.unr, 4
  %57 = shl nuw i64 %54, 2
  %58 = add i64 %56, %57
  %59 = shl nuw nsw i64 %n.mod.vf152, 2
  %ind.end159 = sub i64 %58, %59
  br i1 %cmp.zero154, label %for.inc.us.preheader173, label %vector.ph155

vector.ph155:                                     ; preds = %min.iters.checked151
  br label %vector.body147

vector.body147:                                   ; preds = %vector.body147, %vector.ph155
  %index156 = phi i64 [ 0, %vector.ph155 ], [ %index.next157, %vector.body147 ]
  %60 = shl i64 %index156, 2
  %offset.idx161 = add i64 %indvars.iv.unr, %60
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %offset.idx161
  %62 = bitcast double* %61 to <8 x double>*
  %wide.vec165 = load <8 x double>, <8 x double>* %62, align 8
  %strided.vec166 = shufflevector <8 x double> %wide.vec165, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec167 = shufflevector <8 x double> %wide.vec165, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec168 = shufflevector <8 x double> %wide.vec165, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec169 = shufflevector <8 x double> %wide.vec165, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %63 = fmul <2 x double> %strided.vec166, %broadcast.splat171
  %64 = fmul <2 x double> %strided.vec167, %broadcast.splat171
  %65 = fmul <2 x double> %strided.vec168, %broadcast.splat171
  %66 = add nsw i64 %offset.idx161, 3
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %66
  %68 = fmul <2 x double> %strided.vec169, %broadcast.splat171
  %69 = getelementptr double, double* %67, i64 -3
  %70 = bitcast double* %69 to <8 x double>*
  %71 = shufflevector <2 x double> %63, <2 x double> %64, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %72 = shufflevector <2 x double> %65, <2 x double> %68, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec172 = shufflevector <4 x double> %71, <4 x double> %72, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec172, <8 x double>* %70, align 8
  %index.next157 = add i64 %index156, 2
  %73 = icmp eq i64 %index.next157, %n.vec153
  br i1 %73, label %middle.block148, label %vector.body147, !llvm.loop !21

middle.block148:                                  ; preds = %vector.body147
  %cmp.n160 = icmp eq i64 %n.mod.vf152, 0
  br i1 %cmp.n160, label %for.body8.us19.preheader, label %for.inc.us.preheader173

for.cond9.for.inc40_crit_edge.us48.loopexit:      ; preds = %for.inc37.us21
  br label %for.cond9.for.inc40_crit_edge.us48

for.cond9.for.inc40_crit_edge.us48:               ; preds = %for.cond9.for.inc40_crit_edge.us48.loopexit, %middle.block102
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next66, %0
  br i1 %exitcond91, label %for.cond6.for.inc43_crit_edge.us.loopexit, label %for.body8.us19

for.cond6.for.inc43_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc40_crit_edge.us48
  br label %for.cond6.for.inc43_crit_edge.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond6.for.inc43_crit_edge.us.loopexit, %for.body.us
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, 1
  %cmp.us = icmp slt i64 %indvars.iv.next71, %1
  %indvars.iv.next90 = add i32 %indvars.iv89, 1
  %indvars.iv.next88 = add i2 %indvars.iv87, 1
  br i1 %cmp.us, label %for.body.us, label %for.end45.loopexit

for.body:                                         ; preds = %for.body.preheader, %for.inc43
  %indvars.iv92 = phi i2 [ %indvars.iv.next93, %for.inc43 ], [ 1, %for.body.preheader ]
  %indvar80 = phi i32 [ %74, %for.inc43 ], [ 0, %for.body.preheader ]
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.inc43 ], [ 0, %for.body.preheader ]
  %indvars.iv74 = phi i32 [ %indvars.iv.next75, %for.inc43 ], [ 1, %for.body.preheader ]
  %74 = add i32 %indvar80, 1
  %75 = zext i32 %74 to i64
  %76 = zext i2 %indvars.iv92 to i64
  %77 = add nuw nsw i64 %76, 4294967295
  %78 = and i64 %77, 4294967295
  %79 = add nuw nsw i64 %78, 1
  %cmp24 = icmp slt i64 %indvars.iv78, 0
  br i1 %cmp24, label %for.inc43, label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body
  %xtraiter82 = and i32 %74, 3
  %lcmp.mod83 = icmp eq i32 %xtraiter82, 0
  br i1 %lcmp.mod83, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader, %for.inc.prol
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.inc.prol ], [ 0, %for.inc.prol.preheader ]
  %prol.iter84 = phi i32 [ %prol.iter84.sub, %for.inc.prol ], [ %xtraiter82, %for.inc.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %indvars.iv72.prol
  %80 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %80, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter84.sub = add nsw i32 %prol.iter84, -1
  %prol.iter84.cmp = icmp eq i32 %prol.iter84.sub, 0
  br i1 %prol.iter84.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !22

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv72.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %79, %for.inc.prol.loopexit.loopexit ]
  %81 = icmp ult i32 %indvar80, 3
  br i1 %81, label %for.inc43, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count76.3 = zext i32 %indvars.iv74 to i64
  %82 = add nsw i64 %75, -4
  %83 = sub nsw i64 %82, %indvars.iv72.unr
  %84 = lshr i64 %83, 2
  %85 = add nuw nsw i64 %84, 1
  %min.iters.check = icmp ult i64 %85, 2
  br i1 %min.iters.check, label %for.inc.preheader174, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.preheader
  %n.mod.vf = and i64 %85, 1
  %n.vec = sub nsw i64 %85, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %86 = add nsw i64 %indvars.iv72.unr, 4
  %87 = shl nuw i64 %84, 2
  %88 = add i64 %86, %87
  %89 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %88, %89
  br i1 %cmp.zero, label %for.inc.preheader174, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %90 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv72.unr, %90
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %offset.idx
  %92 = bitcast double* %91 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %92, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec97 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec98 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %93 = fmul <2 x double> %strided.vec, %broadcast.splat100
  %94 = fmul <2 x double> %strided.vec96, %broadcast.splat100
  %95 = fmul <2 x double> %strided.vec97, %broadcast.splat100
  %96 = add nsw i64 %offset.idx, 3
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %96
  %98 = fmul <2 x double> %strided.vec98, %broadcast.splat100
  %99 = getelementptr double, double* %97, i64 -3
  %100 = bitcast double* %99 to <8 x double>*
  %101 = shufflevector <2 x double> %93, <2 x double> %94, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %102 = shufflevector <2 x double> %95, <2 x double> %98, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %101, <4 x double> %102, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %100, align 8
  %index.next = add i64 %index, 2
  %103 = icmp eq i64 %index.next, %n.vec
  br i1 %103, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.inc.preheader174

for.inc.preheader174:                             ; preds = %middle.block, %min.iters.checked, %for.inc.preheader
  %indvars.iv72.ph = phi i64 [ %indvars.iv72.unr, %min.iters.checked ], [ %indvars.iv72.unr, %for.inc.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader174, %for.inc
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.3, %for.inc ], [ %indvars.iv72.ph, %for.inc.preheader174 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %indvars.iv72
  %104 = load double, double* %arrayidx5, align 8
  %mul = fmul double %104, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %indvars.iv.next73
  %105 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %105, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %indvars.iv.next73.1
  %106 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %106, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next73.2 = add nsw i64 %indvars.iv72, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv78, i64 %indvars.iv.next73.2
  %107 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %107, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next73.3 = add nsw i64 %indvars.iv72, 4
  %exitcond77.3 = icmp eq i64 %indvars.iv.next73.3, %wide.trip.count76.3
  br i1 %exitcond77.3, label %for.inc43.loopexit, label %for.inc, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.inc
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.inc.prol.loopexit, %for.body
  %indvars.iv.next79 = add nsw i64 %indvars.iv78, 1
  %cmp = icmp slt i64 %indvars.iv.next79, %1
  %indvars.iv.next75 = add i32 %indvars.iv74, 1
  %indvars.iv.next93 = add i2 %indvars.iv92, 1
  br i1 %cmp, label %for.body, label %for.end45.loopexit175

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  br label %for.end45

for.end45.loopexit175:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit175, %for.end45.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end12

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.lr.ph, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv10, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %3
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
!16 = !{!13, !6, !11, !9}
!17 = distinct !{!17, !3, !4}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}

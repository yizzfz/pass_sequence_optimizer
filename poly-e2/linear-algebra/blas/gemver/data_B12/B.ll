; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  %arraydecay92 = bitcast i8* %call1 to double*
  %arraydecay103 = bitcast i8* %call2 to double*
  %arraydecay114 = bitcast i8* %call3 to double*
  %arraydecay125 = bitcast i8* %call4 to double*
  %arraydecay136 = bitcast i8* %call5 to double*
  %arraydecay147 = bitcast i8* %call6 to double*
  %arraydecay158 = bitcast i8* %call7 to double*
  %arraydecay169 = bitcast i8* %call8 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %0, double %1, [2000 x double]* %arraydecay1, double* %arraydecay92, double* %arraydecay103, double* %arraydecay114, double* %arraydecay125, double* %arraydecay136, double* %arraydecay147, double* %arraydecay158, double* %arraydecay169)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay136)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call7) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %conv = sitofp i32 %n to double
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.us.preheader, label %for.end48

for.body.us.preheader:                            ; preds = %entry
  %wide.trip.count8 = zext i32 %n to i64
  %xtraiter = and i64 %wide.trip.count8, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %0 = icmp eq i32 %n, 1
  %div41.us.prol = fdiv double 0.000000e+00, %conv
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.cond.loopexit_crit_edge.us, %for.body.us.preheader
  %indvars.iv6 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next7, %for.cond35.for.cond.loopexit_crit_edge.us ]
  %1 = trunc i64 %indvars.iv6 to i32
  %conv2.us = sitofp i32 %1 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv6
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %2 = trunc i64 %indvars.iv.next7 to i32
  %conv3.us = sitofp i32 %2 to double
  %div.us = fdiv double %conv3.us, %conv
  %div4.us = fmul double %div.us, 5.000000e-01
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv6
  store double %div4.us, double* %arrayidx6.us, align 8
  %div10.us = fmul double %div.us, 2.500000e-01
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv6
  store double %div10.us, double* %arrayidx12.us, align 8
  %div16.us = fdiv double %div.us, 6.000000e+00
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv6
  store double %div16.us, double* %arrayidx18.us, align 8
  %div22.us = fmul double %div.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv6
  store double %div22.us, double* %arrayidx24.us, align 8
  %div28.us = fdiv double %div.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv6
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.body.us
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div41.us.prol, double* %arrayidx45.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.body.us ]
  br i1 %0, label %for.cond35.for.cond.loopexit_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %n
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, %conv
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, %n
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, %conv
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond10.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count8
  br i1 %exitcond10.1, label %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, label %for.inc.us

for.cond35.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.inc.us
  br label %for.cond35.for.cond.loopexit_crit_edge.us

for.cond35.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %for.end48.loopexit, label %for.body.us

for.end48.loopexit:                               ; preds = %for.cond35.for.cond.loopexit_crit_edge.us
  br label %for.end48

for.end48:                                        ; preds = %for.end48.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32 %n, double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) unnamed_addr #2 {
entry:
  %cmp13 = icmp sgt i32 %n, 0
  br i1 %cmp13, label %for.cond1.preheader.us.preheader, label %for.end85

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = zext i32 %n to i64
  %1 = zext i32 %n to i64
  %xtraiter49 = and i64 %0, 1
  %lcmp.mod50 = icmp eq i64 %xtraiter49, 0
  %2 = icmp eq i32 %n, 1
  %3 = add nsw i64 %0, -2
  %4 = add nsw i64 %0, -2
  %scevgep63 = getelementptr double, double* %v1, i64 2
  %scevgep68 = getelementptr double, double* %v2, i64 2
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond1.for.inc20_crit_edge.us ]
  %scevgep58 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 2
  %arrayidx7.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv35
  %arrayidx11.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv35
  br i1 %lcmp.mod50, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.cond1.preheader.us
  %arrayidx5.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 0
  %5 = load double, double* %arrayidx5.us.prol, align 8
  %6 = load double, double* %arrayidx7.us, align 8
  %7 = load double, double* %v1, align 8
  %mul.us.prol = fmul double %6, %7
  %add.us.prol = fadd double %5, %mul.us.prol
  %8 = load double, double* %arrayidx11.us, align 8
  %9 = load double, double* %v2, align 8
  %mul14.us.prol = fmul double %8, %9
  %add15.us.prol = fadd double %add.us.prol, %mul14.us.prol
  store double %add15.us.prol, double* %arrayidx5.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.cond1.preheader.us
  %indvars.iv31.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %2, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %10 = sub nsw i64 %3, %indvars.iv31.unr.ph
  %11 = lshr i64 %10, 1
  %12 = add nuw i64 %11, 1
  %min.iters.check = icmp ult i64 %12, 2
  br i1 %min.iters.check, label %for.inc.us.preheader136, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc.us.preheader
  %n.mod.vf = and i64 %12, 1
  %n.vec = sub i64 %12, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc.us.preheader136, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep56 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv31.unr.ph
  %13 = sub nsw i64 %4, %indvars.iv31.unr.ph
  %14 = and i64 %13, -2
  %15 = or i64 %indvars.iv31.unr.ph, %14
  %scevgep59 = getelementptr double, double* %scevgep58, i64 %15
  %scevgep61 = getelementptr double, double* %v1, i64 %indvars.iv31.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %15
  %scevgep66 = getelementptr double, double* %v2, i64 %indvars.iv31.unr.ph
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %15
  %bound0 = icmp ult double* %scevgep56, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep59
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep56, %scevgep64
  %bound173 = icmp ult double* %scevgep61, %scevgep59
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %bound077 = icmp ult double* %scevgep56, %arrayidx11.us
  %bound178 = icmp ult double* %arrayidx11.us, %scevgep59
  %found.conflict79 = and i1 %bound077, %bound178
  %conflict.rdx80 = or i1 %conflict.rdx, %found.conflict79
  %bound081 = icmp ult double* %scevgep56, %scevgep69
  %bound182 = icmp ult double* %scevgep66, %scevgep59
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx84 = or i1 %conflict.rdx80, %found.conflict83
  %16 = or i64 %indvars.iv31.unr.ph, 2
  %17 = shl nuw i64 %11, 1
  %18 = add i64 %16, %17
  %19 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %18, %19
  br i1 %conflict.rdx84, label %for.inc.us.preheader136, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %20 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv31.unr.ph, %20
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %offset.idx
  %22 = bitcast double* %21 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %22, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %23 = load double, double* %arrayidx7.us, align 8, !alias.scope !9
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %27 = bitcast double* %26 to <4 x double>*
  %wide.vec86 = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !10
  %strided.vec87 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec88 = shufflevector <4 x double> %wide.vec86, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = fmul <2 x double> %25, %strided.vec87
  %29 = fadd <2 x double> %strided.vec, %28
  %30 = load double, double* %arrayidx11.us, align 8, !alias.scope !11
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %34 = bitcast double* %33 to <4 x double>*
  %wide.vec89 = load <4 x double>, <4 x double>* %34, align 8, !alias.scope !12
  %strided.vec90 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec91 = shufflevector <4 x double> %wide.vec89, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %35 = fmul <2 x double> %32, %strided.vec90
  %36 = fadd <2 x double> %29, %35
  %37 = add nuw nsw i64 %offset.idx, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %37
  %39 = load double, double* %arrayidx7.us, align 8, !alias.scope !9
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = fmul <2 x double> %41, %strided.vec88
  %43 = fadd <2 x double> %strided.vec85, %42
  %44 = load double, double* %arrayidx11.us, align 8, !alias.scope !11
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = fmul <2 x double> %46, %strided.vec91
  %48 = fadd <2 x double> %43, %47
  %49 = getelementptr double, double* %38, i64 -1
  %50 = bitcast double* %49 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %36, <2 x double> %48, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %50, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us.preheader136

for.inc.us.preheader136:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc.us.preheader
  %indvars.iv31.ph = phi i64 [ %indvars.iv31.unr.ph, %vector.memcheck ], [ %indvars.iv31.unr.ph, %min.iters.checked ], [ %indvars.iv31.unr.ph, %for.inc.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader136, %for.inc.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %for.inc.us ], [ %indvars.iv31.ph, %for.inc.us.preheader136 ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv31
  %52 = load double, double* %arrayidx5.us, align 8
  %53 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv31
  %54 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %53, %54
  %add.us = fadd double %52, %mul.us
  %55 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv31
  %56 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %55, %56
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.next32
  %57 = load double, double* %arrayidx5.us.1, align 8
  %58 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next32
  %59 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %58, %59
  %add.us.1 = fadd double %57, %mul.us.1
  %60 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next32
  %61 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %60, %61
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next32.1, %0
  br i1 %exitcond43.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit, %middle.block, %for.inc.us.prol.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next36, %1
  br i1 %exitcond44, label %for.cond23.preheader, label %for.cond1.preheader.us

for.cond23.preheader:                             ; preds = %for.cond1.for.inc20_crit_edge.us
  %cmp249 = icmp sgt i32 %n, 0
  br i1 %cmp249, label %for.cond26.preheader.us.preheader, label %for.end85

for.cond26.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %62 = zext i32 %n to i64
  %63 = zext i32 %n to i64
  %xtraiter47 = and i64 %62, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  %64 = icmp eq i32 %n, 1
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.for.inc45_crit_edge.us, %for.cond26.preheader.us.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond26.preheader.us.preheader ], [ %indvars.iv.next28, %for.cond26.for.inc45_crit_edge.us ]
  %arrayidx30.us = getelementptr inbounds double, double* %x, i64 %indvars.iv27
  br i1 %lcmp.mod48, label %for.inc42.us.prol.loopexit, label %for.inc42.us.prol

for.inc42.us.prol:                                ; preds = %for.cond26.preheader.us
  %65 = load double, double* %arrayidx30.us, align 8
  %arrayidx34.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv27
  %66 = load double, double* %arrayidx34.us.prol, align 8
  %mul35.us.prol = fmul double %66, %beta
  %67 = load double, double* %y, align 8
  %mul38.us.prol = fmul double %mul35.us.prol, %67
  %add39.us.prol = fadd double %65, %mul38.us.prol
  store double %add39.us.prol, double* %arrayidx30.us, align 8
  br label %for.inc42.us.prol.loopexit

for.inc42.us.prol.loopexit:                       ; preds = %for.inc42.us.prol, %for.cond26.preheader.us
  %indvars.iv23.unr.ph = phi i64 [ 1, %for.inc42.us.prol ], [ 0, %for.cond26.preheader.us ]
  br i1 %64, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us.preheader

for.inc42.us.preheader:                           ; preds = %for.inc42.us.prol.loopexit
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us.preheader, %for.inc42.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %for.inc42.us ], [ %indvars.iv23.unr.ph, %for.inc42.us.preheader ]
  %68 = load double, double* %arrayidx30.us, align 8
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv27
  %69 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %69, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv23
  %70 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %70
  %add39.us = fadd double %68, %mul38.us
  store double %add39.us, double* %arrayidx30.us, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next24, i64 %indvars.iv27
  %71 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %71, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next24
  %72 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %72
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %arrayidx30.us, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next24.1, %62
  br i1 %exitcond41.1, label %for.cond26.for.inc45_crit_edge.us.loopexit, label %for.inc42.us

for.cond26.for.inc45_crit_edge.us.loopexit:       ; preds = %for.inc42.us
  br label %for.cond26.for.inc45_crit_edge.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.cond26.for.inc45_crit_edge.us.loopexit, %for.inc42.us.prol.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next28, %63
  br i1 %exitcond42, label %for.cond48.preheader, label %for.cond26.preheader.us

for.cond48.preheader:                             ; preds = %for.cond26.for.inc45_crit_edge.us
  %cmp495 = icmp sgt i32 %n, 0
  br i1 %cmp495, label %for.inc58.preheader, label %for.end85

for.inc58.preheader:                              ; preds = %for.cond48.preheader
  %73 = zext i32 %n to i64
  %74 = add nsw i64 %73, -1
  %xtraiter45 = and i64 %73, 3
  %lcmp.mod46 = icmp eq i64 %xtraiter45, 0
  br i1 %lcmp.mod46, label %for.inc58.prol.loopexit, label %for.inc58.prol.preheader

for.inc58.prol.preheader:                         ; preds = %for.inc58.preheader
  br label %for.inc58.prol

for.inc58.prol:                                   ; preds = %for.inc58.prol.preheader, %for.inc58.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %for.inc58.prol ], [ 0, %for.inc58.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc58.prol ], [ %xtraiter45, %for.inc58.prol.preheader ]
  %arrayidx52.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv19.prol
  %75 = load double, double* %arrayidx52.prol, align 8
  %arrayidx54.prol = getelementptr inbounds double, double* %z, i64 %indvars.iv19.prol
  %76 = load double, double* %arrayidx54.prol, align 8
  %add55.prol = fadd double %75, %76
  store double %add55.prol, double* %arrayidx52.prol, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc58.prol.loopexit.loopexit, label %for.inc58.prol, !llvm.loop !17

for.inc58.prol.loopexit.loopexit:                 ; preds = %for.inc58.prol
  br label %for.inc58.prol.loopexit

for.inc58.prol.loopexit:                          ; preds = %for.inc58.prol.loopexit.loopexit, %for.inc58.preheader
  %indvars.iv19.unr = phi i64 [ 0, %for.inc58.preheader ], [ %indvars.iv.next20.prol, %for.inc58.prol.loopexit.loopexit ]
  %77 = icmp ult i64 %74, 3
  br i1 %77, label %for.cond61.preheader, label %for.inc58.preheader55

for.inc58.preheader55:                            ; preds = %for.inc58.prol.loopexit
  %78 = add nsw i64 %0, -4
  %79 = sub i64 %78, %indvars.iv19.unr
  %80 = lshr i64 %79, 2
  %81 = add nuw nsw i64 %80, 1
  %min.iters.check95 = icmp ult i64 %81, 2
  br i1 %min.iters.check95, label %for.inc58.preheader135, label %min.iters.checked96

for.inc58.preheader135:                           ; preds = %middle.block93, %vector.memcheck113, %min.iters.checked96, %for.inc58.preheader55
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %vector.memcheck113 ], [ %indvars.iv19.unr, %min.iters.checked96 ], [ %indvars.iv19.unr, %for.inc58.preheader55 ], [ %ind.end118, %middle.block93 ]
  br label %for.inc58

min.iters.checked96:                              ; preds = %for.inc58.preheader55
  %n.mod.vf97 = and i64 %81, 1
  %n.vec98 = sub nsw i64 %81, %n.mod.vf97
  %cmp.zero99 = icmp eq i64 %n.vec98, 0
  br i1 %cmp.zero99, label %for.inc58.preheader135, label %vector.memcheck113

vector.memcheck113:                               ; preds = %min.iters.checked96
  %scevgep101 = getelementptr double, double* %x, i64 %indvars.iv19.unr
  %82 = add nsw i64 %0, -4
  %83 = sub i64 %82, %indvars.iv19.unr
  %84 = and i64 %83, -4
  %85 = add i64 %indvars.iv19.unr, %84
  %86 = add i64 %85, 4
  %scevgep103 = getelementptr double, double* %x, i64 %86
  %scevgep105 = getelementptr double, double* %z, i64 %indvars.iv19.unr
  %scevgep107 = getelementptr double, double* %z, i64 %86
  %bound0109 = icmp ult double* %scevgep101, %scevgep107
  %bound1110 = icmp ult double* %scevgep105, %scevgep103
  %memcheck.conflict112 = and i1 %bound0109, %bound1110
  %87 = shl nuw i64 %80, 2
  %88 = add i64 %indvars.iv19.unr, %87
  %89 = add i64 %88, 4
  %90 = shl nuw nsw i64 %n.mod.vf97, 2
  %ind.end118 = sub i64 %89, %90
  br i1 %memcheck.conflict112, label %for.inc58.preheader135, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %vector.memcheck113
  br label %vector.body92

vector.body92:                                    ; preds = %vector.body92.preheader, %vector.body92
  %index115 = phi i64 [ %index.next116, %vector.body92 ], [ 0, %vector.body92.preheader ]
  %91 = shl i64 %index115, 2
  %92 = add i64 %indvars.iv19.unr, %91
  %93 = getelementptr inbounds double, double* %x, i64 %92
  %94 = bitcast double* %93 to <8 x double>*
  %wide.vec124 = load <8 x double>, <8 x double>* %94, align 8, !alias.scope !19, !noalias !22
  %95 = getelementptr inbounds double, double* %z, i64 %92
  %96 = bitcast double* %95 to <8 x double>*
  %wide.vec129 = load <8 x double>, <8 x double>* %96, align 8, !alias.scope !22
  %97 = fadd <8 x double> %wide.vec124, %wide.vec129
  %98 = shufflevector <8 x double> %97, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %99 = fadd <8 x double> %wide.vec124, %wide.vec129
  %100 = shufflevector <8 x double> %99, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %101 = fadd <8 x double> %wide.vec124, %wide.vec129
  %102 = shufflevector <8 x double> %101, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %103 = add nsw i64 %92, 3
  %104 = getelementptr inbounds double, double* %x, i64 %103
  %105 = fadd <8 x double> %wide.vec124, %wide.vec129
  %106 = shufflevector <8 x double> %105, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %107 = getelementptr double, double* %104, i64 -3
  %108 = bitcast double* %107 to <8 x double>*
  %109 = shufflevector <2 x double> %98, <2 x double> %100, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %110 = shufflevector <2 x double> %102, <2 x double> %106, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec134 = shufflevector <4 x double> %109, <4 x double> %110, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec134, <8 x double>* %108, align 8, !alias.scope !19, !noalias !22
  %index.next116 = add i64 %index115, 2
  %111 = icmp eq i64 %index.next116, %n.vec98
  br i1 %111, label %middle.block93, label %vector.body92, !llvm.loop !24

middle.block93:                                   ; preds = %vector.body92
  %cmp.n119 = icmp eq i64 %n.mod.vf97, 0
  br i1 %cmp.n119, label %for.cond61.preheader, label %for.inc58.preheader135

for.cond61.preheader.loopexit:                    ; preds = %for.inc58
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit, %middle.block93, %for.inc58.prol.loopexit
  %cmp623 = icmp sgt i32 %n, 0
  br i1 %cmp623, label %for.cond64.preheader.us.preheader, label %for.end85

for.cond64.preheader.us.preheader:                ; preds = %for.cond61.preheader
  %112 = zext i32 %n to i64
  %113 = zext i32 %n to i64
  %xtraiter = and i64 %112, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %114 = icmp eq i32 %n, 1
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.for.inc83_crit_edge.us, %for.cond64.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %for.cond64.preheader.us.preheader ], [ %indvars.iv.next16, %for.cond64.for.inc83_crit_edge.us ]
  %arrayidx68.us = getelementptr inbounds double, double* %w, i64 %indvars.iv15
  br i1 %lcmp.mod, label %for.inc80.us.prol.loopexit, label %for.inc80.us.prol

for.inc80.us.prol:                                ; preds = %for.cond64.preheader.us
  %115 = load double, double* %arrayidx68.us, align 8
  %arrayidx72.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %116 = load double, double* %arrayidx72.us.prol, align 8
  %mul73.us.prol = fmul double %116, %alpha
  %117 = load double, double* %x, align 8
  %mul76.us.prol = fmul double %mul73.us.prol, %117
  %add77.us.prol = fadd double %115, %mul76.us.prol
  store double %add77.us.prol, double* %arrayidx68.us, align 8
  br label %for.inc80.us.prol.loopexit

for.inc80.us.prol.loopexit:                       ; preds = %for.inc80.us.prol, %for.cond64.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc80.us.prol ], [ 0, %for.cond64.preheader.us ]
  br i1 %114, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us.preheader

for.inc80.us.preheader:                           ; preds = %for.inc80.us.prol.loopexit
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.preheader, %for.inc80.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc80.us ], [ %indvars.iv.unr.ph, %for.inc80.us.preheader ]
  %118 = load double, double* %arrayidx68.us, align 8
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %119 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %119, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %120 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %120
  %add77.us = fadd double %118, %mul76.us
  store double %add77.us, double* %arrayidx68.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %121 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %121, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %122 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %122
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %arrayidx68.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next.1, %112
  br i1 %exitcond39.1, label %for.cond64.for.inc83_crit_edge.us.loopexit, label %for.inc80.us

for.cond64.for.inc83_crit_edge.us.loopexit:       ; preds = %for.inc80.us
  br label %for.cond64.for.inc83_crit_edge.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.cond64.for.inc83_crit_edge.us.loopexit, %for.inc80.us.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %113
  br i1 %exitcond, label %for.end85.loopexit, label %for.cond64.preheader.us

for.inc58:                                        ; preds = %for.inc58.preheader135, %for.inc58
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.3, %for.inc58 ], [ %indvars.iv19.ph, %for.inc58.preheader135 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv19
  %123 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv19
  %124 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %123, %124
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next20
  %125 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next20
  %126 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %125, %126
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next20.1
  %127 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next20.1
  %128 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %127, %128
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next20.2
  %129 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next20.2
  %130 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %129, %130
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %exitcond40.3 = icmp eq i64 %indvars.iv.next20.3, %73
  br i1 %exitcond40.3, label %for.cond61.preheader.loopexit, label %for.inc58, !llvm.loop !25

for.end85.loopexit:                               ; preds = %for.cond64.for.inc83_crit_edge.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %entry, %for.cond23.preheader, %for.cond48.preheader, %for.cond61.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %w) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond3, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}

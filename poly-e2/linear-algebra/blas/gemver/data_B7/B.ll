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
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay9 = bitcast i8* %call1 to double*
  %arraydecay10 = bitcast i8* %call2 to double*
  %arraydecay11 = bitcast i8* %call3 to double*
  %arraydecay12 = bitcast i8* %call4 to double*
  %arraydecay13 = bitcast i8* %call5 to double*
  %arraydecay14 = bitcast i8* %call6 to double*
  %arraydecay15 = bitcast i8* %call7 to double*
  %arraydecay16 = bitcast i8* %call8 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
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
  %3 = bitcast i8* %call5 to double*
  tail call fastcc void @print_array(i32 2000, double* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %xtraiter = and i32 %n, 1
  %wide.trip.count8 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %div41.us.prol = fdiv double 0.000000e+00, %conv
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.cond.loopexit_crit_edge.us, %for.body.us.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond35.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %0 = icmp eq i32 %xtraiter, 0
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
  br i1 %0, label %for.body38.us.prol.loopexit, label %for.body38.us.prol

for.body38.us.prol:                               ; preds = %for.body.us
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div41.us.prol, double* %arrayidx45.us.prol, align 8
  br label %for.body38.us.prol.loopexit

for.body38.us.prol.loopexit:                      ; preds = %for.body.us, %for.body38.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body38.us.prol ], [ 0, %for.body.us ]
  %3 = icmp eq i32 %n, 1
  br i1 %3, label %for.cond35.for.cond.loopexit_crit_edge.us, label %for.body38.us.preheader

for.body38.us.preheader:                          ; preds = %for.body38.us.prol.loopexit
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body38.us.preheader, %for.body38.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body38.us ], [ %indvars.iv.unr.ph, %for.body38.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, %n
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, %conv
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, %n
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, %conv
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, label %for.body38.us

for.cond35.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.body38.us
  br label %for.cond35.for.cond.loopexit_crit_edge.us

for.cond35.for.cond.loopexit_crit_edge.us:        ; preds = %for.cond35.for.cond.loopexit_crit_edge.us.loopexit, %for.body38.us.prol.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond, label %for.end48.loopexit, label %for.body.us

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
  %xtraiter38 = and i32 %n, 1
  %wide.trip.count42 = zext i32 %n to i64
  %wide.trip.count36.1 = zext i32 %n to i64
  %0 = add nsw i64 %wide.trip.count36.1, -2
  %1 = add nsw i64 %wide.trip.count36.1, -2
  %scevgep57 = getelementptr double, double* %v1, i64 2
  %scevgep62 = getelementptr double, double* %v2, i64 2
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %2 = icmp eq i32 %xtraiter38, 0
  %scevgep52 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 2
  %arrayidx7.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv40
  %arrayidx11.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv40
  br i1 %2, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %arrayidx5.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 0
  %3 = load double, double* %arrayidx5.us.prol, align 8
  %4 = load double, double* %arrayidx7.us, align 8
  %5 = load double, double* %v1, align 8
  %mul.us.prol = fmul double %4, %5
  %add.us.prol = fadd double %3, %mul.us.prol
  %6 = load double, double* %arrayidx11.us, align 8
  %7 = load double, double* %v2, align 8
  %mul14.us.prol = fmul double %6, %7
  %add15.us.prol = fadd double %add.us.prol, %mul14.us.prol
  store double %add15.us.prol, double* %arrayidx5.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.cond1.preheader.us, %for.body3.us.prol
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  %8 = icmp eq i32 %n, 1
  br i1 %8, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %9 = sub nsw i64 %0, %indvars.iv34.unr.ph
  %10 = lshr i64 %9, 1
  %11 = add nuw i64 %10, 1
  %min.iters.check = icmp ult i64 %11, 2
  br i1 %min.iters.check, label %for.body3.us.preheader130, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.us.preheader
  %n.mod.vf = and i64 %11, 1
  %n.vec = sub i64 %11, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body3.us.preheader130, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep50 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv34.unr.ph
  %12 = sub nsw i64 %1, %indvars.iv34.unr.ph
  %13 = and i64 %12, -2
  %14 = or i64 %indvars.iv34.unr.ph, %13
  %scevgep53 = getelementptr double, double* %scevgep52, i64 %14
  %scevgep55 = getelementptr double, double* %v1, i64 %indvars.iv34.unr.ph
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %14
  %scevgep60 = getelementptr double, double* %v2, i64 %indvars.iv34.unr.ph
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %14
  %bound0 = icmp ult double* %scevgep50, %arrayidx7.us
  %bound1 = icmp ult double* %arrayidx7.us, %scevgep53
  %found.conflict = and i1 %bound0, %bound1
  %bound066 = icmp ult double* %scevgep50, %scevgep58
  %bound167 = icmp ult double* %scevgep55, %scevgep53
  %found.conflict68 = and i1 %bound066, %bound167
  %conflict.rdx = or i1 %found.conflict, %found.conflict68
  %bound071 = icmp ult double* %scevgep50, %arrayidx11.us
  %bound172 = icmp ult double* %arrayidx11.us, %scevgep53
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx, %found.conflict73
  %bound075 = icmp ult double* %scevgep50, %scevgep63
  %bound176 = icmp ult double* %scevgep60, %scevgep53
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx78 = or i1 %conflict.rdx74, %found.conflict77
  %15 = or i64 %indvars.iv34.unr.ph, 2
  %16 = shl nuw i64 %10, 1
  %17 = add i64 %15, %16
  %18 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %17, %18
  br i1 %conflict.rdx78, label %for.body3.us.preheader130, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %19 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv34.unr.ph, %19
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %offset.idx
  %21 = bitcast double* %20 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %21, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec79 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %22 = load double, double* %arrayidx7.us, align 8, !alias.scope !9
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec80 = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !10
  %strided.vec81 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec82 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fmul <2 x double> %24, %strided.vec81
  %28 = fadd <2 x double> %strided.vec, %27
  %29 = load double, double* %arrayidx11.us, align 8, !alias.scope !11
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %33 = bitcast double* %32 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %33, align 8, !alias.scope !12
  %strided.vec84 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %34 = fmul <2 x double> %31, %strided.vec84
  %35 = fadd <2 x double> %28, %34
  %36 = add nuw nsw i64 %offset.idx, 1
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %36
  %38 = load double, double* %arrayidx7.us, align 8, !alias.scope !9
  %39 = insertelement <2 x double> undef, double %38, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = fmul <2 x double> %40, %strided.vec82
  %42 = fadd <2 x double> %strided.vec79, %41
  %43 = load double, double* %arrayidx11.us, align 8, !alias.scope !11
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = fmul <2 x double> %45, %strided.vec85
  %47 = fadd <2 x double> %42, %46
  %48 = getelementptr double, double* %37, i64 -1
  %49 = bitcast double* %48 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %35, <2 x double> %47, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %49, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %50 = icmp eq i64 %index.next, %n.vec
  br i1 %50, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.preheader130

for.body3.us.preheader130:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body3.us.preheader
  %indvars.iv34.ph = phi i64 [ %indvars.iv34.unr.ph, %vector.memcheck ], [ %indvars.iv34.unr.ph, %min.iters.checked ], [ %indvars.iv34.unr.ph, %for.body3.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader130, %for.body3.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.body3.us ], [ %indvars.iv34.ph, %for.body3.us.preheader130 ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv34
  %51 = load double, double* %arrayidx5.us, align 8
  %52 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv34
  %53 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %52, %53
  %add.us = fadd double %51, %mul.us
  %54 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv34
  %55 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %54, %55
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv.next35
  %56 = load double, double* %arrayidx5.us.1, align 8
  %57 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next35
  %58 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %57, %58
  %add.us.1 = fadd double %56, %mul.us.1
  %59 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next35
  %60 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %59, %60
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond37.1, label %for.cond1.for.inc20_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !16

for.cond1.for.inc20_crit_edge.us.loopexit:        ; preds = %for.body3.us
  br label %for.cond1.for.inc20_crit_edge.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.cond1.for.inc20_crit_edge.us.loopexit, %middle.block, %for.body3.us.prol.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %for.cond23.preheader, label %for.cond1.preheader.us

for.cond23.preheader:                             ; preds = %for.cond1.for.inc20_crit_edge.us
  %cmp249 = icmp sgt i32 %n, 0
  br i1 %cmp249, label %for.cond26.preheader.us.preheader, label %for.end85

for.cond26.preheader.us.preheader:                ; preds = %for.cond23.preheader
  %xtraiter28 = and i32 %n, 1
  %wide.trip.count32 = zext i32 %n to i64
  %wide.trip.count26.1 = zext i32 %n to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.for.inc45_crit_edge.us, %for.cond26.preheader.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.preheader ]
  %61 = icmp eq i32 %xtraiter28, 0
  br i1 %61, label %for.body28.us.prol.loopexit, label %for.body28.us.prol

for.body28.us.prol:                               ; preds = %for.cond26.preheader.us
  %62 = ptrtoint double* %x to i64
  %sunkaddr131 = shl i64 %indvars.iv30, 3
  %sunkaddr132 = add i64 %62, %sunkaddr131
  %sunkaddr133 = inttoptr i64 %sunkaddr132 to double*
  %63 = load double, double* %sunkaddr133, align 8
  %arrayidx34.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv30
  %64 = load double, double* %arrayidx34.us.prol, align 8
  %mul35.us.prol = fmul double %64, %beta
  %65 = load double, double* %y, align 8
  %mul38.us.prol = fmul double %mul35.us.prol, %65
  %add39.us.prol = fadd double %63, %mul38.us.prol
  store double %add39.us.prol, double* %sunkaddr133, align 8
  br label %for.body28.us.prol.loopexit

for.body28.us.prol.loopexit:                      ; preds = %for.cond26.preheader.us, %for.body28.us.prol
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body28.us.prol ], [ 0, %for.cond26.preheader.us ]
  %66 = icmp eq i32 %n, 1
  br i1 %66, label %for.cond26.for.inc45_crit_edge.us, label %for.body28.us.preheader

for.body28.us.preheader:                          ; preds = %for.body28.us.prol.loopexit
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body28.us.preheader, %for.body28.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body28.us ], [ %indvars.iv24.unr.ph, %for.body28.us.preheader ]
  %sunkaddr = ptrtoint double* %x to i64
  %sunkaddr146 = mul i64 %indvars.iv30, 8
  %sunkaddr147 = add i64 %sunkaddr, %sunkaddr146
  %sunkaddr148 = inttoptr i64 %sunkaddr147 to double*
  %67 = load double, double* %sunkaddr148, align 8
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv30
  %68 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %68, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv24
  %69 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %69
  %add39.us = fadd double %67, %mul38.us
  store double %add39.us, double* %sunkaddr148, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv30
  %70 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %70, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next25
  %71 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %71
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr148, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next25.1, %wide.trip.count26.1
  br i1 %exitcond27.1, label %for.cond26.for.inc45_crit_edge.us.loopexit, label %for.body28.us

for.cond26.for.inc45_crit_edge.us.loopexit:       ; preds = %for.body28.us
  br label %for.cond26.for.inc45_crit_edge.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.cond26.for.inc45_crit_edge.us.loopexit, %for.body28.us.prol.loopexit
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %for.cond48.preheader, label %for.cond26.preheader.us

for.cond48.preheader:                             ; preds = %for.cond26.for.inc45_crit_edge.us
  %cmp495 = icmp sgt i32 %n, 0
  br i1 %cmp495, label %for.body50.preheader, label %for.end85

for.body50.preheader:                             ; preds = %for.cond48.preheader
  %72 = add i32 %n, -1
  %xtraiter22 = and i32 %n, 3
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.body50.prol.loopexit, label %for.body50.prol.preheader

for.body50.prol.preheader:                        ; preds = %for.body50.preheader
  br label %for.body50.prol

for.body50.prol:                                  ; preds = %for.body50.prol.preheader, %for.body50.prol
  %indvars.iv18.prol = phi i64 [ %indvars.iv.next19.prol, %for.body50.prol ], [ 0, %for.body50.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body50.prol ], [ %xtraiter22, %for.body50.prol.preheader ]
  %arrayidx52.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv18.prol
  %73 = load double, double* %arrayidx52.prol, align 8
  %arrayidx54.prol = getelementptr inbounds double, double* %z, i64 %indvars.iv18.prol
  %74 = load double, double* %arrayidx54.prol, align 8
  %add55.prol = fadd double %73, %74
  store double %add55.prol, double* %arrayidx52.prol, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body50.prol.loopexit.loopexit, label %for.body50.prol, !llvm.loop !17

for.body50.prol.loopexit.loopexit:                ; preds = %for.body50.prol
  br label %for.body50.prol.loopexit

for.body50.prol.loopexit:                         ; preds = %for.body50.prol.loopexit.loopexit, %for.body50.preheader
  %indvars.iv18.unr = phi i64 [ 0, %for.body50.preheader ], [ %indvars.iv.next19.prol, %for.body50.prol.loopexit.loopexit ]
  %75 = icmp ult i32 %72, 3
  br i1 %75, label %for.cond64.preheader.us.preheader, label %for.body50.preheader49

for.body50.preheader49:                           ; preds = %for.body50.prol.loopexit
  %wide.trip.count20.3 = zext i32 %n to i64
  %76 = add nsw i64 %wide.trip.count36.1, -4
  %77 = sub i64 %76, %indvars.iv18.unr
  %78 = lshr i64 %77, 2
  %79 = add nuw nsw i64 %78, 1
  %min.iters.check89 = icmp ult i64 %79, 2
  br i1 %min.iters.check89, label %for.body50.preheader129, label %min.iters.checked90

for.body50.preheader129:                          ; preds = %middle.block87, %vector.memcheck107, %min.iters.checked90, %for.body50.preheader49
  %indvars.iv18.ph = phi i64 [ %indvars.iv18.unr, %vector.memcheck107 ], [ %indvars.iv18.unr, %min.iters.checked90 ], [ %indvars.iv18.unr, %for.body50.preheader49 ], [ %ind.end112, %middle.block87 ]
  br label %for.body50

min.iters.checked90:                              ; preds = %for.body50.preheader49
  %n.mod.vf91 = and i64 %79, 1
  %n.vec92 = sub nsw i64 %79, %n.mod.vf91
  %cmp.zero93 = icmp eq i64 %n.vec92, 0
  br i1 %cmp.zero93, label %for.body50.preheader129, label %vector.memcheck107

vector.memcheck107:                               ; preds = %min.iters.checked90
  %scevgep95 = getelementptr double, double* %x, i64 %indvars.iv18.unr
  %80 = add nsw i64 %wide.trip.count36.1, -4
  %81 = sub i64 %80, %indvars.iv18.unr
  %82 = and i64 %81, -4
  %83 = add i64 %indvars.iv18.unr, %82
  %84 = add i64 %83, 4
  %scevgep97 = getelementptr double, double* %x, i64 %84
  %scevgep99 = getelementptr double, double* %z, i64 %indvars.iv18.unr
  %scevgep101 = getelementptr double, double* %z, i64 %84
  %bound0103 = icmp ult double* %scevgep95, %scevgep101
  %bound1104 = icmp ult double* %scevgep99, %scevgep97
  %memcheck.conflict106 = and i1 %bound0103, %bound1104
  %85 = shl nuw i64 %78, 2
  %86 = add i64 %indvars.iv18.unr, %85
  %87 = add i64 %86, 4
  %88 = shl nuw nsw i64 %n.mod.vf91, 2
  %ind.end112 = sub i64 %87, %88
  br i1 %memcheck.conflict106, label %for.body50.preheader129, label %vector.body86.preheader

vector.body86.preheader:                          ; preds = %vector.memcheck107
  br label %vector.body86

vector.body86:                                    ; preds = %vector.body86.preheader, %vector.body86
  %index109 = phi i64 [ %index.next110, %vector.body86 ], [ 0, %vector.body86.preheader ]
  %89 = shl i64 %index109, 2
  %90 = add i64 %indvars.iv18.unr, %89
  %91 = getelementptr inbounds double, double* %x, i64 %90
  %92 = bitcast double* %91 to <8 x double>*
  %wide.vec118 = load <8 x double>, <8 x double>* %92, align 8, !alias.scope !19, !noalias !22
  %93 = getelementptr inbounds double, double* %z, i64 %90
  %94 = bitcast double* %93 to <8 x double>*
  %wide.vec123 = load <8 x double>, <8 x double>* %94, align 8, !alias.scope !22
  %95 = fadd <8 x double> %wide.vec118, %wide.vec123
  %96 = shufflevector <8 x double> %95, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %97 = fadd <8 x double> %wide.vec118, %wide.vec123
  %98 = shufflevector <8 x double> %97, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %99 = fadd <8 x double> %wide.vec118, %wide.vec123
  %100 = shufflevector <8 x double> %99, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %101 = add nsw i64 %90, 3
  %102 = getelementptr inbounds double, double* %x, i64 %101
  %103 = fadd <8 x double> %wide.vec118, %wide.vec123
  %104 = shufflevector <8 x double> %103, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %105 = getelementptr double, double* %102, i64 -3
  %106 = bitcast double* %105 to <8 x double>*
  %107 = shufflevector <2 x double> %96, <2 x double> %98, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %108 = shufflevector <2 x double> %100, <2 x double> %104, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec128 = shufflevector <4 x double> %107, <4 x double> %108, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec128, <8 x double>* %106, align 8, !alias.scope !19, !noalias !22
  %index.next110 = add i64 %index109, 2
  %109 = icmp eq i64 %index.next110, %n.vec92
  br i1 %109, label %middle.block87, label %vector.body86, !llvm.loop !24

middle.block87:                                   ; preds = %vector.body86
  %cmp.n113 = icmp eq i64 %n.mod.vf91, 0
  br i1 %cmp.n113, label %for.cond61.preheader, label %for.body50.preheader129

for.cond61.preheader.loopexit:                    ; preds = %for.body50
  br label %for.cond61.preheader

for.cond61.preheader:                             ; preds = %for.cond61.preheader.loopexit, %middle.block87
  %cmp623 = icmp sgt i32 %n, 0
  br i1 %cmp623, label %for.cond64.preheader.us.preheader, label %for.end85

for.cond64.preheader.us.preheader:                ; preds = %for.cond61.preheader, %for.body50.prol.loopexit
  %xtraiter = and i32 %n, 1
  %wide.trip.count17 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.for.inc83_crit_edge.us, %for.cond64.preheader.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.preheader ]
  %110 = icmp eq i32 %xtraiter, 0
  br i1 %110, label %for.body66.us.prol.loopexit, label %for.body66.us.prol

for.body66.us.prol:                               ; preds = %for.cond64.preheader.us
  %111 = ptrtoint double* %w to i64
  %sunkaddr139 = shl i64 %indvars.iv15, 3
  %sunkaddr140 = add i64 %111, %sunkaddr139
  %sunkaddr141 = inttoptr i64 %sunkaddr140 to double*
  %112 = load double, double* %sunkaddr141, align 8
  %arrayidx72.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 0
  %113 = load double, double* %arrayidx72.us.prol, align 8
  %mul73.us.prol = fmul double %113, %alpha
  %114 = load double, double* %x, align 8
  %mul76.us.prol = fmul double %mul73.us.prol, %114
  %add77.us.prol = fadd double %112, %mul76.us.prol
  store double %add77.us.prol, double* %sunkaddr141, align 8
  br label %for.body66.us.prol.loopexit

for.body66.us.prol.loopexit:                      ; preds = %for.cond64.preheader.us, %for.body66.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body66.us.prol ], [ 0, %for.cond64.preheader.us ]
  %115 = icmp eq i32 %n, 1
  br i1 %115, label %for.cond64.for.inc83_crit_edge.us, label %for.body66.us.preheader

for.body66.us.preheader:                          ; preds = %for.body66.us.prol.loopexit
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us.preheader, %for.body66.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body66.us ], [ %indvars.iv.unr.ph, %for.body66.us.preheader ]
  %sunkaddr149 = ptrtoint double* %w to i64
  %sunkaddr150 = mul i64 %indvars.iv15, 8
  %sunkaddr151 = add i64 %sunkaddr149, %sunkaddr150
  %sunkaddr152 = inttoptr i64 %sunkaddr151 to double*
  %116 = load double, double* %sunkaddr152, align 8
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %117 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %117, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %118 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %118
  %add77.us = fadd double %116, %mul76.us
  store double %add77.us, double* %sunkaddr152, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %119 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %119, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %120 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %120
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr152, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us.loopexit, label %for.body66.us

for.cond64.for.inc83_crit_edge.us.loopexit:       ; preds = %for.body66.us
  br label %for.cond64.for.inc83_crit_edge.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.cond64.for.inc83_crit_edge.us.loopexit, %for.body66.us.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond, label %for.end85.loopexit, label %for.cond64.preheader.us

for.body50:                                       ; preds = %for.body50.preheader129, %for.body50
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.3, %for.body50 ], [ %indvars.iv18.ph, %for.body50.preheader129 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv18
  %121 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv18
  %122 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %121, %122
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19
  %123 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19
  %124 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %123, %124
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.1
  %125 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.1
  %126 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %125, %126
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next19.2 = add nsw i64 %indvars.iv18, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next19.2
  %127 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next19.2
  %128 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %127, %128
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next19.3 = add nsw i64 %indvars.iv18, 4
  %exitcond21.3 = icmp eq i64 %indvars.iv.next19.3, %wide.trip.count20.3
  br i1 %exitcond21.3, label %for.cond61.preheader.loopexit, label %for.body50, !llvm.loop !25

for.end85.loopexit:                               ; preds = %for.cond64.for.inc83_crit_edge.us
  br label %for.end85

for.end85:                                        ; preds = %for.end85.loopexit, %for.cond61.preheader, %for.cond48.preheader, %for.cond23.preheader, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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

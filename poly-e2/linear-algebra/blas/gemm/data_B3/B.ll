; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %0 = bitcast i8* %call to [1100 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %2 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %0, [1200 x double]* %1, [1100 x double]* %2)
  tail call void (...) @polybench_timer_start() #4
  %3 = load double, double* %alpha, align 8
  %4 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %3, double %4, [1100 x double]* %0, [1200 x double]* %1, [1100 x double]* %2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %0)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture %A, [1100 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp34 = icmp sgt i32 %ni, 0
  br i1 %cmp34, label %for.cond1.preheader.lr.ph, label %for.cond34.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp232 = icmp sgt i32 %nj, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp232, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count61 = zext i32 %nj to i64
  %wide.trip.count65 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next58, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv57, %indvars.iv63
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv63, i64 %indvars.iv57
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %wide.trip.count61
  br i1 %exitcond62, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  br i1 true, label %for.cond14.preheader.lr.ph, label %for.cond10.preheader.for.cond34.preheader_crit_edge

for.cond10.preheader.for.cond34.preheader_crit_edge: ; preds = %for.cond10.preheader
  br label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond10.preheader
  %cmp1527 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp1527, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i32 %nk, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp eq i32 %nk, 1
  %wide.trip.count54 = zext i32 %ni to i64
  %wide.trip.count50.1 = zext i32 %nk to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.inc28.us.prol.loopexit, label %for.inc28.us.prol

for.inc28.us.prol:                                ; preds = %for.cond14.preheader.us
  %4 = trunc i64 %indvars.iv52 to i32
  %rem20.us.prol = srem i32 %4, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv52, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.inc28.us.prol.loopexit

for.inc28.us.prol.loopexit:                       ; preds = %for.inc28.us.prol, %for.cond14.preheader.us
  %indvars.iv47.unr.ph = phi i64 [ 1, %for.inc28.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %3, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us.preheader

for.inc28.us.preheader:                           ; preds = %for.inc28.us.prol.loopexit
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us.preheader, %for.inc28.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.inc28.us ], [ %indvars.iv47.unr.ph, %for.inc28.us.preheader ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %5 = mul nuw nsw i64 %indvars.iv.next48, %indvars.iv52
  %6 = trunc i64 %5 to i32
  %rem20.us = srem i32 %6, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv47
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %7 = mul nuw nsw i64 %indvars.iv.next48.1, %indvars.iv52
  %8 = trunc i64 %7 to i32
  %rem20.us.1 = srem i32 %8, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next48
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.inc28.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.inc28.us.prol.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond10.preheader.for.cond34.preheader_crit_edge, %for.cond34.preheader.loopexit, %entry
  %cmp3524 = icmp sgt i32 %nk, 0
  br i1 %cmp3524, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp3922 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp3922, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count44 = zext i32 %nk to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc55_crit_edge.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc52.us

for.inc52.us:                                     ; preds = %for.inc52.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.inc52.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv42
  %11 = trunc i64 %10 to i32
  %rem44.us = srem i32 %11, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.inc52.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.inc52.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %for.end57.loopexit, label %for.cond38.preheader.us

for.end57.loopexit:                               ; preds = %for.cond38.for.inc55_crit_edge.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond14.preheader.lr.ph, %for.cond38.preheader.lr.ph, %for.cond34.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp18 = icmp sgt i32 %ni, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp212 = icmp sgt i32 %nj, 0
  %cmp716 = icmp sgt i32 %nk, 0
  br i1 %cmp212, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %xtraiter62 = and i32 %nj, 1
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  %wide.trip.count66 = zext i32 %nk to i64
  %wide.trip.count60.1 = zext i32 %nj to i64
  %wide.trip.count70 = zext i32 %ni to i64
  %0 = add nsw i64 %wide.trip.count60.1, -2
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %nj, -1
  %xtraiter = and i32 %nj, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp ult i32 %1, 3
  %xtraiter47 = and i32 %nj, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %3 = icmp eq i32 %1, 0
  %wide.trip.count52 = zext i32 %nk to i64
  %wide.trip.count46.1 = zext i32 %nj to i64
  %wide.trip.count55 = zext i32 %ni to i64
  %4 = add nsw i64 %wide.trip.count46.1, -2
  %5 = add nsw i64 %wide.trip.count46.1, -4
  %broadcast.splatinsert140 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert172 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat173 = shufflevector <2 x double> %broadcast.splatinsert172, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next54, %for.inc32.us ]
  %scevgep110 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 2
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.prol
  %6 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %6, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  br i1 %2, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %7 = sub i64 %5, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check152 = icmp ult i64 %9, 2
  br i1 %min.iters.check152, label %for.inc.us.preheader176, label %min.iters.checked153

for.inc.us.preheader176:                          ; preds = %middle.block150, %min.iters.checked153, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked153 ], [ %indvars.iv.unr, %for.inc.us.preheader ], [ %ind.end161, %middle.block150 ]
  br label %for.inc.us

min.iters.checked153:                             ; preds = %for.inc.us.preheader
  %n.mod.vf154 = and i64 %9, 1
  %n.vec155 = sub nsw i64 %9, %n.mod.vf154
  %cmp.zero156 = icmp eq i64 %n.vec155, 0
  %10 = add i64 %indvars.iv.unr, 4
  %11 = shl nuw i64 %8, 2
  %12 = add i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf154, 2
  %ind.end161 = sub i64 %12, %13
  br i1 %cmp.zero156, label %for.inc.us.preheader176, label %vector.ph157

vector.ph157:                                     ; preds = %min.iters.checked153
  br label %vector.body149

vector.body149:                                   ; preds = %vector.body149, %vector.ph157
  %index158 = phi i64 [ 0, %vector.ph157 ], [ %index.next159, %vector.body149 ]
  %14 = shl i64 %index158, 2
  %15 = add i64 %indvars.iv.unr, %14
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %15
  %17 = bitcast double* %16 to <8 x double>*
  %wide.vec167 = load <8 x double>, <8 x double>* %17, align 8
  %strided.vec168 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec169 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec170 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec171 = shufflevector <8 x double> %wide.vec167, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %18 = fmul <2 x double> %strided.vec168, %broadcast.splat173
  %19 = fmul <2 x double> %strided.vec169, %broadcast.splat173
  %20 = fmul <2 x double> %strided.vec170, %broadcast.splat173
  %21 = add nsw i64 %15, 3
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %21
  %23 = fmul <2 x double> %strided.vec171, %broadcast.splat173
  %24 = getelementptr double, double* %22, i64 -3
  %25 = bitcast double* %24 to <8 x double>*
  %26 = shufflevector <2 x double> %18, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %20, <2 x double> %23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec174 = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec174, <8 x double>* %25, align 8
  %index.next159 = add i64 %index158, 2
  %28 = icmp eq i64 %index.next159, %n.vec155
  br i1 %28, label %middle.block150, label %vector.body149, !llvm.loop !3

middle.block150:                                  ; preds = %vector.body149
  %cmp.n162 = icmp eq i64 %n.mod.vf154, 0
  br i1 %cmp.n162, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.inc.us.preheader176

for.inc32.us.loopexit:                            ; preds = %for.cond9.for.inc29_crit_edge.us.us
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.inc32.us.loopexit, %for.cond1.for.cond6.preheader_crit_edge.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.end34.loopexit, label %for.cond1.preheader.us

for.inc.us:                                       ; preds = %for.inc.us.preheader176, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader176 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv
  %29 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %29, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %30, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %31 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %31, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %32 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %32, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count46.1
  br i1 %exitcond.3, label %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !6

for.cond1.for.cond6.preheader_crit_edge.us.loopexit: ; preds = %for.inc.us
  br label %for.cond1.for.cond6.preheader_crit_edge.us

for.cond1.for.cond6.preheader_crit_edge.us:       ; preds = %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, %middle.block150, %for.inc.us.prol.loopexit
  br i1 %cmp716, label %for.cond9.preheader.us.us.preheader, label %for.inc32.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond1.for.cond6.preheader_crit_edge.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 0
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep116 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv50
  br i1 %lcmp.mod48, label %for.inc26.us.us.prol.loopexit, label %for.inc26.us.us.prol

for.inc26.us.us.prol:                             ; preds = %for.cond9.preheader.us.us
  %33 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %33, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 0
  %34 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %34
  %35 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %35, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.inc26.us.us.prol.loopexit

for.inc26.us.us.prol.loopexit:                    ; preds = %for.inc26.us.us.prol, %for.cond9.preheader.us.us
  %indvars.iv44.unr.ph = phi i64 [ 1, %for.inc26.us.us.prol ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %3, label %for.cond9.for.inc29_crit_edge.us.us, label %for.inc26.us.us.preheader

for.inc26.us.us.preheader:                        ; preds = %for.inc26.us.us.prol.loopexit
  %36 = sub nsw i64 %4, %indvars.iv44.unr.ph
  %37 = lshr i64 %36, 1
  %38 = add nuw i64 %37, 1
  %min.iters.check101 = icmp ult i64 %38, 2
  br i1 %min.iters.check101, label %for.inc26.us.us.preheader175, label %min.iters.checked102

for.inc26.us.us.preheader175:                     ; preds = %middle.block99, %vector.memcheck129, %min.iters.checked102, %for.inc26.us.us.preheader
  %indvars.iv44.ph = phi i64 [ %indvars.iv44.unr.ph, %vector.memcheck129 ], [ %indvars.iv44.unr.ph, %min.iters.checked102 ], [ %indvars.iv44.unr.ph, %for.inc26.us.us.preheader ], [ %ind.end134, %middle.block99 ]
  br label %for.inc26.us.us

min.iters.checked102:                             ; preds = %for.inc26.us.us.preheader
  %n.mod.vf103 = and i64 %38, 1
  %n.vec104 = sub i64 %38, %n.mod.vf103
  %cmp.zero105 = icmp eq i64 %n.vec104, 0
  br i1 %cmp.zero105, label %for.inc26.us.us.preheader175, label %vector.memcheck129

vector.memcheck129:                               ; preds = %min.iters.checked102
  %scevgep108 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv44.unr.ph
  %39 = and i64 %36, -2
  %40 = or i64 %indvars.iv44.unr.ph, %39
  %scevgep111 = getelementptr double, double* %scevgep110, i64 %40
  %scevgep114 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv44.unr.ph
  %scevgep117 = getelementptr double, double* %scevgep116, i64 %40
  %bound0121 = icmp ult double* %scevgep108, %arrayidx15.us.us
  %bound1122 = icmp ult double* %arrayidx15.us.us, %scevgep111
  %found.conflict123 = and i1 %bound0121, %bound1122
  %bound0124 = icmp ult double* %scevgep108, %scevgep117
  %bound1125 = icmp ult double* %scevgep114, %scevgep111
  %found.conflict126 = and i1 %bound0124, %bound1125
  %conflict.rdx127 = or i1 %found.conflict123, %found.conflict126
  %41 = or i64 %indvars.iv44.unr.ph, 2
  %42 = shl nuw i64 %37, 1
  %43 = add i64 %41, %42
  %44 = shl nuw nsw i64 %n.mod.vf103, 1
  %ind.end134 = sub i64 %43, %44
  br i1 %conflict.rdx127, label %for.inc26.us.us.preheader175, label %vector.ph130

vector.ph130:                                     ; preds = %vector.memcheck129
  %45 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !8
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = fmul <2 x double> %46, %broadcast.splatinsert140
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %vector.ph130
  %index131 = phi i64 [ 0, %vector.ph130 ], [ %index.next132, %vector.body98 ]
  %49 = shl i64 %index131, 1
  %offset.idx136 = or i64 %indvars.iv44.unr.ph, %49
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 %offset.idx136
  %51 = bitcast double* %50 to <4 x double>*
  %wide.vec142 = load <4 x double>, <4 x double>* %51, align 8, !alias.scope !11
  %strided.vec143 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec144 = shufflevector <4 x double> %wide.vec142, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %52 = fmul <2 x double> %48, %strided.vec143
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %offset.idx136
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec145 = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !13, !noalias !15
  %strided.vec146 = shufflevector <4 x double> %wide.vec145, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec147 = shufflevector <4 x double> %wide.vec145, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %55 = fadd <2 x double> %strided.vec146, %52
  %56 = add nuw nsw i64 %offset.idx136, 1
  %57 = fmul <2 x double> %48, %strided.vec144
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %56
  %59 = fadd <2 x double> %strided.vec147, %57
  %60 = getelementptr double, double* %58, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %interleaved.vec148 = shufflevector <2 x double> %55, <2 x double> %59, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec148, <4 x double>* %61, align 8, !alias.scope !13, !noalias !15
  %index.next132 = add i64 %index131, 2
  %62 = icmp eq i64 %index.next132, %n.vec104
  br i1 %62, label %middle.block99, label %vector.body98, !llvm.loop !16

middle.block99:                                   ; preds = %vector.body98
  %cmp.n135 = icmp eq i64 %n.mod.vf103, 0
  br i1 %cmp.n135, label %for.cond9.for.inc29_crit_edge.us.us, label %for.inc26.us.us.preheader175

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.inc26.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block99, %for.inc26.us.us.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us.preheader175, %for.inc26.us.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %for.inc26.us.us ], [ %indvars.iv44.ph, %for.inc26.us.us.preheader175 ]
  %63 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %63, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv44
  %64 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %64
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv44
  %65 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %65, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %66 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %66, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv.next45
  %67 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %67
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next45
  %68 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %68, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.inc26.us.us, !llvm.loop !17

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.inc32
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc32 ], [ 0, %for.cond1.preheader.preheader ]
  %scevgep79 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 2
  br i1 false, label %for.cond9.preheader.us.preheader, label %for.inc32

for.cond9.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  %arrayidx25.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 0
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.cond9.for.inc29_crit_edge.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond9.for.inc29_crit_edge.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %scevgep85 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 2
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv64
  br i1 %lcmp.mod63, label %for.inc26.us.preheader, label %for.inc26.us.prol

for.inc26.us.prol:                                ; preds = %for.cond9.preheader.us
  %69 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %69, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 0
  %70 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %70
  %71 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %71, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.inc26.us.preheader

for.inc26.us.preheader:                           ; preds = %for.cond9.preheader.us, %for.inc26.us.prol
  %indvars.iv58.unr.ph = phi i64 [ 1, %for.inc26.us.prol ], [ 0, %for.cond9.preheader.us ]
  %72 = sub nsw i64 %0, %indvars.iv58.unr.ph
  %73 = lshr i64 %72, 1
  %74 = add nuw i64 %73, 1
  %min.iters.check = icmp ult i64 %74, 2
  br i1 %min.iters.check, label %for.inc26.us.preheader177, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc26.us.preheader
  %n.mod.vf = and i64 %74, 1
  %n.vec = sub i64 %74, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc26.us.preheader177, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep77 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58.unr.ph
  %75 = and i64 %72, -2
  %76 = or i64 %indvars.iv58.unr.ph, %75
  %scevgep80 = getelementptr double, double* %scevgep79, i64 %76
  %scevgep83 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv58.unr.ph
  %scevgep86 = getelementptr double, double* %scevgep85, i64 %76
  %bound0 = icmp ult double* %scevgep77, %arrayidx15.us
  %bound1 = icmp ult double* %arrayidx15.us, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bound089 = icmp ult double* %scevgep77, %scevgep86
  %bound190 = icmp ult double* %scevgep83, %scevgep80
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx = or i1 %found.conflict, %found.conflict91
  %77 = or i64 %indvars.iv58.unr.ph, 2
  %78 = shl nuw i64 %73, 1
  %79 = add i64 %77, %78
  %80 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %79, %80
  br i1 %conflict.rdx, label %for.inc26.us.preheader177, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %81 = load double, double* %arrayidx15.us, align 8, !alias.scope !18
  %82 = insertelement <2 x double> undef, double %81, i32 0
  %83 = fmul <2 x double> %82, %broadcast.splatinsert92
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  %85 = load double, double* %arrayidx15.us, align 8, !alias.scope !18
  %86 = insertelement <2 x double> undef, double %85, i32 0
  %87 = fmul <2 x double> %86, %broadcast.splatinsert92
  %88 = shufflevector <2 x double> %87, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %89 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv58.unr.ph, %89
  %90 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 %offset.idx
  %91 = bitcast double* %90 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %91, align 8, !alias.scope !21
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec94 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %92 = fmul <2 x double> %84, %strided.vec
  %93 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 %offset.idx
  %94 = bitcast double* %93 to <4 x double>*
  %wide.vec95 = load <4 x double>, <4 x double>* %94, align 8, !alias.scope !23, !noalias !25
  %strided.vec96 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec97 = shufflevector <4 x double> %wide.vec95, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %95 = fadd <2 x double> %strided.vec96, %92
  %96 = add nuw nsw i64 %offset.idx, 1
  %97 = fmul <2 x double> %88, %strided.vec94
  %98 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 %96
  %99 = fadd <2 x double> %strided.vec97, %97
  %100 = getelementptr double, double* %98, i64 -1
  %101 = bitcast double* %100 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %95, <2 x double> %99, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %101, align 8, !alias.scope !23, !noalias !25
  %index.next = add i64 %index, 2
  %102 = icmp eq i64 %index.next, %n.vec
  br i1 %102, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.for.inc29_crit_edge.us, label %for.inc26.us.preheader177

for.inc26.us.preheader177:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc26.us.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr.ph, %vector.memcheck ], [ %indvars.iv58.unr.ph, %min.iters.checked ], [ %indvars.iv58.unr.ph, %for.inc26.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc26.us

for.inc26.us:                                     ; preds = %for.inc26.us.preheader177, %for.inc26.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %for.inc26.us ], [ %indvars.iv58.ph, %for.inc26.us.preheader177 ]
  %103 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %103, %alpha
  %arrayidx20.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv58
  %104 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %104
  %arrayidx25.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58
  %105 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %105, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %106 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %106, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next59
  %107 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %107
  %arrayidx25.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59
  %108 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %108, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond61.1, label %for.cond9.for.inc29_crit_edge.us.loopexit, label %for.inc26.us, !llvm.loop !27

for.cond9.for.inc29_crit_edge.us.loopexit:        ; preds = %for.inc26.us
  br label %for.cond9.for.inc29_crit_edge.us

for.cond9.for.inc29_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.inc32.loopexit, label %for.cond9.preheader.us

for.inc32.loopexit:                               ; preds = %for.cond9.for.inc29_crit_edge.us
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %for.cond1.preheader
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end34.loopexit178, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  br label %for.end34

for.end34.loopexit178:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit178, %for.end34.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nj, [1100 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp7 = icmp sgt i32 %ni, 0
  %cmp35 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count14 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next12, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv11, %3
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, %wide.trip.count14
  br i1 %exitcond15, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = !{!24}
!24 = distinct !{!24, !20}
!25 = !{!19, !22}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !4, !5}

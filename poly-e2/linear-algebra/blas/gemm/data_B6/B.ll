; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
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
  %3 = bitcast i8* %call to [1100 x double]*
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture %A, [1100 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp41 = icmp sgt i32 %ni, 0
  br i1 %cmp41, label %for.cond1.preheader.lr.ph, label %for.cond34.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp239 = icmp sgt i32 %nj, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp239, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count68 = zext i32 %nj to i64
  %wide.trip.count72 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv70 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next71, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv64 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next65, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv64, %indvars.iv70
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv64
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next65, %wide.trip.count68
  br i1 %exitcond69, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %cmp1136 = icmp sgt i32 %ni, 0
  br i1 %cmp1136, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader, %for.cond1.preheader.lr.ph
  %cmp1534 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp1534, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i32 %nk, 1
  %wide.trip.count61 = zext i32 %ni to i64
  %wide.trip.count57.1 = zext i32 %nk to i64
  %3 = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %nk, 1
  %5 = insertelement <2 x double> undef, double %conv22, i32 0
  %div23.us.v.i1.2 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond14.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond14.for.inc31_crit_edge.us ]
  br i1 %3, label %for.body17.us.prol.loopexit, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %6 = trunc i64 %indvars.iv59 to i32
  %rem20.us.prol = srem i32 %6, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.cond14.preheader.us, %for.body17.us.prol
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %4, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body17.us ], [ %indvars.iv54.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %7 = mul nuw nsw i64 %indvars.iv.next55, %indvars.iv59
  %8 = trunc i64 %7 to i32
  %rem20.us = srem i32 %8, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv54
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %9 = mul nuw nsw i64 %indvars.iv.next55.1, %indvars.iv59
  %10 = trunc i64 %9 to i32
  %rem20.us.1 = srem i32 %10, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, %div23.us.v.i1.2
  %11 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %11, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count57.1
  br i1 %exitcond58.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %for.cond10.preheader, %entry
  %cmp3531 = icmp sgt i32 %nk, 0
  br i1 %cmp3531, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp3929 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp3929, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count51 = zext i32 %nk to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.for.inc55_crit_edge.us, %for.cond38.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond38.preheader.us.preheader ], [ %indvars.iv.next50, %for.cond38.for.inc55_crit_edge.us ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.body41.us ]
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = mul nuw nsw i64 %12, %indvars.iv49
  %14 = trunc i64 %13 to i32
  %rem44.us = srem i32 %14, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.body41.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.end57.loopexit, label %for.cond38.preheader.us

for.end57.loopexit:                               ; preds = %for.cond38.for.inc55_crit_edge.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond38.preheader.lr.ph, %for.cond34.preheader, %for.cond14.preheader.lr.ph
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* readonly %A, [1100 x double]* readonly %B) unnamed_addr #2 {
entry:
  %cmp22 = icmp sgt i32 %ni, 0
  br i1 %cmp22, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nj, 0
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %xtraiter66 = and i32 %nj, 1
  %wide.trip.count70 = zext i32 %nk to i64
  %wide.trip.count64.1 = zext i32 %nj to i64
  %wide.trip.count74 = zext i32 %ni to i64
  %0 = add nsw i64 %wide.trip.count64.1, -2
  %1 = add nsw i64 %wide.trip.count64.1, -2
  %2 = icmp sgt i32 %nj, 0
  %3 = icmp sgt i32 %nk, 0
  %brmerge79.demorgan = and i1 %3, %2
  %4 = icmp eq i32 %xtraiter66, 0
  %broadcast.splatinsert96 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %5 = add i32 %nj, -1
  %xtraiter = and i32 %nj, 3
  %xtraiter51 = and i32 %nj, 1
  %wide.trip.count56 = zext i32 %nk to i64
  %wide.trip.count50.1 = zext i32 %nj to i64
  %wide.trip.count59 = zext i32 %ni to i64
  %wide.trip.count.3 = zext i32 %nj to i64
  %6 = add nsw i64 %wide.trip.count50.1, -2
  %7 = add nsw i64 %wide.trip.count50.1, -2
  %8 = icmp eq i32 %xtraiter, 0
  %9 = icmp ult i32 %5, 3
  %10 = icmp sgt i32 %nj, 0
  %11 = icmp sgt i32 %nk, 0
  %brmerge.demorgan = and i1 %11, %10
  %12 = icmp eq i32 %xtraiter51, 0
  %13 = icmp eq i32 %5, 0
  %broadcast.splatinsert144 = insertelement <2 x double> undef, double %alpha, i32 0
  %14 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next58, %for.inc32.us ]
  %scevgep114 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 2
  br i1 %8, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.prol
  %16 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %16, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  br i1 %9, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.inc32.us.loopexit:                            ; preds = %for.cond9.for.inc29_crit_edge.us.us
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.inc32.us.loopexit, %for.cond1.for.cond6.preheader_crit_edge.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.end34.loopexit, label %for.cond1.preheader.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.unr, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv
  %17 = bitcast double* %arrayidx5.us to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul.us = fmul <2 x double> %18, %mul.us.v.i1.2
  %19 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %20 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %mul.us.2 = fmul <2 x double> %21, %mul.us.2.v.i1.2
  %22 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %22, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.cond6.preheader_crit_edge.us.loopexit: ; preds = %for.body3.us
  br label %for.cond1.for.cond6.preheader_crit_edge.us

for.cond1.for.cond6.preheader_crit_edge.us:       ; preds = %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, %for.body3.us.prol.loopexit
  br i1 %brmerge.demorgan, label %for.cond9.preheader.us.us.preheader, label %for.inc32.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond1.for.cond6.preheader_crit_edge.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 0
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.for.inc29_crit_edge.us.us, %for.cond9.preheader.us.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond9.preheader.us.us.preheader ], [ %indvars.iv.next55, %for.cond9.for.inc29_crit_edge.us.us ]
  %scevgep120 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv54
  br i1 %12, label %for.body11.us.us.prol.loopexit, label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.cond9.preheader.us.us
  %23 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %23, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 0
  %24 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %24
  %25 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %25, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.cond9.preheader.us.us, %for.body11.us.us.prol
  %indvars.iv48.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %13, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.prol.loopexit.for.body11.us.us_crit_edge

for.body11.us.us.prol.loopexit.for.body11.us.us_crit_edge: ; preds = %for.body11.us.us.prol.loopexit
  %26 = sub nsw i64 %6, %indvars.iv48.unr.ph
  %27 = lshr i64 %26, 1
  %28 = add nuw i64 %27, 1
  %min.iters.check105 = icmp ult i64 %28, 2
  br i1 %min.iters.check105, label %for.body11.us.us.preheader, label %min.iters.checked106

for.body11.us.us.preheader:                       ; preds = %middle.block103, %vector.memcheck133, %min.iters.checked106, %for.body11.us.us.prol.loopexit.for.body11.us.us_crit_edge
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr.ph, %vector.memcheck133 ], [ %indvars.iv48.unr.ph, %min.iters.checked106 ], [ %indvars.iv48.unr.ph, %for.body11.us.us.prol.loopexit.for.body11.us.us_crit_edge ], [ %ind.end138, %middle.block103 ]
  br label %for.body11.us.us

min.iters.checked106:                             ; preds = %for.body11.us.us.prol.loopexit.for.body11.us.us_crit_edge
  %n.mod.vf107 = and i64 %28, 1
  %n.vec108 = sub i64 %28, %n.mod.vf107
  %cmp.zero109 = icmp eq i64 %n.vec108, 0
  br i1 %cmp.zero109, label %for.body11.us.us.preheader, label %vector.memcheck133

vector.memcheck133:                               ; preds = %min.iters.checked106
  %scevgep112 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48.unr.ph
  %29 = sub nsw i64 %7, %indvars.iv48.unr.ph
  %30 = and i64 %29, -2
  %31 = or i64 %indvars.iv48.unr.ph, %30
  %scevgep115 = getelementptr double, double* %scevgep114, i64 %31
  %scevgep118 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48.unr.ph
  %scevgep121 = getelementptr double, double* %scevgep120, i64 %31
  %bound0125 = icmp ult double* %scevgep112, %arrayidx15.us.us
  %bound1126 = icmp ult double* %arrayidx15.us.us, %scevgep115
  %found.conflict127 = and i1 %bound0125, %bound1126
  %bound0128 = icmp ult double* %scevgep112, %scevgep121
  %bound1129 = icmp ult double* %scevgep118, %scevgep115
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx131 = or i1 %found.conflict127, %found.conflict130
  %32 = or i64 %indvars.iv48.unr.ph, 2
  %33 = shl nuw i64 %27, 1
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf107, 1
  %ind.end138 = sub i64 %34, %35
  br i1 %conflict.rdx131, label %for.body11.us.us.preheader, label %vector.ph134

vector.ph134:                                     ; preds = %vector.memcheck133
  br label %vector.body102

vector.body102:                                   ; preds = %vector.body102, %vector.ph134
  %index135 = phi i64 [ 0, %vector.ph134 ], [ %index.next136, %vector.body102 ]
  %36 = shl i64 %index135, 1
  %offset.idx140 = or i64 %indvars.iv48.unr.ph, %36
  %37 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !3
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = fmul <2 x double> %38, %broadcast.splatinsert144
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %offset.idx140
  %42 = bitcast double* %41 to <4 x double>*
  %wide.vec146 = load <4 x double>, <4 x double>* %42, align 8, !alias.scope !6
  %strided.vec147 = shufflevector <4 x double> %wide.vec146, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec148 = shufflevector <4 x double> %wide.vec146, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %43 = fmul <2 x double> %40, %strided.vec147
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %offset.idx140
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec149 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %strided.vec150 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec151 = shufflevector <4 x double> %wide.vec149, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %strided.vec150, %43
  %47 = add nuw nsw i64 %offset.idx140, 1
  %48 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !3
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = fmul <2 x double> %49, %broadcast.splatinsert144
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = fmul <2 x double> %51, %strided.vec148
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %47
  %54 = fadd <2 x double> %strided.vec151, %52
  %55 = getelementptr double, double* %53, i64 -1
  %56 = bitcast double* %55 to <4 x double>*
  %interleaved.vec152 = shufflevector <2 x double> %46, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec152, <4 x double>* %56, align 8, !alias.scope !8, !noalias !10
  %index.next136 = add i64 %index135, 2
  %57 = icmp eq i64 %index.next136, %n.vec108
  br i1 %57, label %middle.block103, label %vector.body102, !llvm.loop !11

middle.block103:                                  ; preds = %vector.body102
  %cmp.n139 = icmp eq i64 %n.mod.vf107, 0
  br i1 %cmp.n139, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block103, %for.body11.us.us.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.body11.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %for.body11.us.us ], [ %indvars.iv48.ph, %for.body11.us.us.preheader ]
  %58 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %58, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48
  %59 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %59
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48
  %60 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %60, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %61 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %61, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv.next49
  %62 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %62
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next49
  %63 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %63, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.body11.us.us, !llvm.loop !14

for.cond1.preheader:                              ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv72 = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next73, %for.inc32 ]
  %scevgep83 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 2
  br i1 %brmerge79.demorgan, label %for.cond9.preheader.us.preheader, label %for.inc32

for.cond9.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  %arrayidx25.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 0
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.for.inc29_crit_edge.us, %for.cond9.preheader.us.preheader
  %indvars.iv68 = phi i64 [ 0, %for.cond9.preheader.us.preheader ], [ %indvars.iv.next69, %for.cond9.for.inc29_crit_edge.us ]
  %scevgep89 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 2
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv72, i64 %indvars.iv68
  br i1 %4, label %for.body11.us.prol.loopexit.for.body11.us_crit_edge, label %for.body11.us.prol

for.body11.us.prol:                               ; preds = %for.cond9.preheader.us
  %64 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %64, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 0
  %65 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %65
  %66 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %66, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.body11.us.prol.loopexit.for.body11.us_crit_edge

for.body11.us.prol.loopexit.for.body11.us_crit_edge: ; preds = %for.body11.us.prol, %for.cond9.preheader.us
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.body11.us.prol ], [ 0, %for.cond9.preheader.us ]
  %67 = sub nsw i64 %0, %indvars.iv62.unr.ph
  %68 = lshr i64 %67, 1
  %69 = add nuw i64 %68, 1
  %min.iters.check = icmp ult i64 %69, 2
  br i1 %min.iters.check, label %for.body11.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body11.us.prol.loopexit.for.body11.us_crit_edge
  %n.mod.vf = and i64 %69, 1
  %n.vec = sub i64 %69, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep81 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv62.unr.ph
  %70 = sub nsw i64 %1, %indvars.iv62.unr.ph
  %71 = and i64 %70, -2
  %72 = or i64 %indvars.iv62.unr.ph, %71
  %scevgep84 = getelementptr double, double* %scevgep83, i64 %72
  %scevgep87 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv62.unr.ph
  %scevgep90 = getelementptr double, double* %scevgep89, i64 %72
  %bound0 = icmp ult double* %scevgep81, %arrayidx15.us
  %bound1 = icmp ult double* %arrayidx15.us, %scevgep84
  %found.conflict = and i1 %bound0, %bound1
  %bound093 = icmp ult double* %scevgep81, %scevgep90
  %bound194 = icmp ult double* %scevgep87, %scevgep84
  %found.conflict95 = and i1 %bound093, %bound194
  %conflict.rdx = or i1 %found.conflict, %found.conflict95
  %73 = or i64 %indvars.iv62.unr.ph, 2
  %74 = shl nuw i64 %68, 1
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %75, %76
  br i1 %conflict.rdx, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %77 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv62.unr.ph, %77
  %78 = load double, double* %arrayidx15.us, align 8, !alias.scope !15
  %79 = insertelement <2 x double> undef, double %78, i32 0
  %80 = fmul <2 x double> %79, %broadcast.splatinsert96
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> zeroinitializer
  %82 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 %offset.idx
  %83 = bitcast double* %82 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %83, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec98 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %84 = fmul <2 x double> %81, %strided.vec
  %85 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 %offset.idx
  %86 = bitcast double* %85 to <4 x double>*
  %wide.vec99 = load <4 x double>, <4 x double>* %86, align 8, !alias.scope !20, !noalias !22
  %strided.vec100 = shufflevector <4 x double> %wide.vec99, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec101 = shufflevector <4 x double> %wide.vec99, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %87 = fadd <2 x double> %strided.vec100, %84
  %88 = add nuw nsw i64 %offset.idx, 1
  %89 = load double, double* %arrayidx15.us, align 8, !alias.scope !15
  %90 = insertelement <2 x double> undef, double %89, i32 0
  %91 = fmul <2 x double> %90, %broadcast.splatinsert96
  %92 = shufflevector <2 x double> %91, <2 x double> undef, <2 x i32> zeroinitializer
  %93 = fmul <2 x double> %92, %strided.vec98
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 %88
  %95 = fadd <2 x double> %strided.vec101, %93
  %96 = getelementptr double, double* %94, i64 -1
  %97 = bitcast double* %96 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %87, <2 x double> %95, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %97, align 8, !alias.scope !20, !noalias !22
  %index.next = add i64 %index, 2
  %98 = icmp eq i64 %index.next, %n.vec
  br i1 %98, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.for.inc29_crit_edge.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body11.us.prol.loopexit.for.body11.us_crit_edge
  %indvars.iv62.ph = phi i64 [ %indvars.iv62.unr.ph, %vector.memcheck ], [ %indvars.iv62.unr.ph, %min.iters.checked ], [ %indvars.iv62.unr.ph, %for.body11.us.prol.loopexit.for.body11.us_crit_edge ], [ %ind.end, %middle.block ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.1, %for.body11.us ], [ %indvars.iv62.ph, %for.body11.us.preheader ]
  %99 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %99, %alpha
  %arrayidx20.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv62
  %100 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %100
  %arrayidx25.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv62
  %101 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %101, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %102 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %102, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv68, i64 %indvars.iv.next63
  %103 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %103
  %arrayidx25.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv72, i64 %indvars.iv.next63
  %104 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %104, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63.1, %wide.trip.count64.1
  br i1 %exitcond65.1, label %for.cond9.for.inc29_crit_edge.us.loopexit, label %for.body11.us, !llvm.loop !24

for.cond9.for.inc29_crit_edge.us.loopexit:        ; preds = %for.body11.us
  br label %for.cond9.for.inc29_crit_edge.us

for.cond9.for.inc29_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.inc32.loopexit, label %for.cond9.preheader.us

for.inc32.loopexit:                               ; preds = %for.cond9.for.inc29_crit_edge.us
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %for.cond1.preheader
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %for.end34.loopexit153, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  br label %for.end34

for.end34.loopexit153:                            ; preds = %for.inc32
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit153, %for.end34.loopexit, %entry
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
  %cmp9 = icmp sgt i32 %ni, 0
  %cmp37 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp9, %cmp37
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count16 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!4, !7}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = !{!21}
!21 = distinct !{!21, !17}
!22 = !{!16, !19}
!23 = distinct !{!23, !12, !13}
!24 = distinct !{!24, !12, !13}

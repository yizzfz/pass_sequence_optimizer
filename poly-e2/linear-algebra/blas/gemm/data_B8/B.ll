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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %arraydecay)
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
  %cmp13 = icmp sgt i32 %ni, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.cond34.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp211 = icmp sgt i32 %nj, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp211, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %nj to i64
  %1 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv42 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next43, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next37, %for.body3.us ]
  %2 = mul nuw nsw i64 %indvars.iv36, %indvars.iv42
  %3 = add nuw nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv42, i64 %indvars.iv36
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next37, %0
  br i1 %exitcond49, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next43, %1
  br i1 %exitcond50, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  br i1 %cmp13, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond10.preheader
  %cmp156 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp156, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %5 = zext i32 %ni to i64
  %xtraiter = and i32 %nk, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %nk, 1
  %wide.trip.count29.1 = zext i32 %nk to i64
  %7 = insertelement <2 x double> undef, double %conv22, i32 0
  %div23.us.v.i1.2 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.us.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond14.preheader.us.preheader ], [ %indvars.iv.next32, %for.cond14.for.inc31_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body17.us.prol.loopexit.unr-lcssa, label %for.body17.us.prol.preheader

for.body17.us.prol.preheader:                     ; preds = %for.cond14.preheader.us
  %8 = trunc i64 %indvars.iv31 to i32
  %rem20.us.prol = srem i32 %8, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit.unr-lcssa

for.body17.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond14.preheader.us, %for.body17.us.prol.preheader
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.body17.us.prol.preheader ], [ 0, %for.cond14.preheader.us ]
  br i1 %6, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit.unr-lcssa
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %for.body17.us ], [ %indvars.iv26.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %9 = mul nuw nsw i64 %indvars.iv.next27, %indvars.iv31
  %10 = trunc i64 %9 to i32
  %rem20.us = srem i32 %10, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv26
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %11 = mul nuw nsw i64 %indvars.iv.next27.1, %indvars.iv31
  %12 = trunc i64 %11 to i32
  %rem20.us.1 = srem i32 %12, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, %div23.us.v.i1.2
  %13 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %13, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %wide.trip.count29.1
  br i1 %exitcond30.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit.unr-lcssa
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next32, %5
  br i1 %exitcond48, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %entry, %for.cond10.preheader
  %cmp353 = icmp sgt i32 %nk, 0
  br i1 %cmp353, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp391 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp391, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %14 = zext i32 %nj to i64
  %15 = zext i32 %nk to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.for.inc55_crit_edge.us, %for.cond38.preheader.us.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond38.preheader.us.preheader ], [ %indvars.iv.next22, %for.cond38.for.inc55_crit_edge.us ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.body41.us ]
  %16 = add nuw nsw i64 %indvars.iv, 2
  %17 = mul nuw nsw i64 %16, %indvars.iv21
  %18 = trunc i64 %17 to i32
  %rem44.us = srem i32 %18, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next, %14
  br i1 %exitcond47, label %for.cond38.for.inc55_crit_edge.us, label %for.body41.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %15
  br i1 %exitcond, label %for.end57.loopexit, label %for.cond38.preheader.us

for.end57.loopexit:                               ; preds = %for.cond38.for.inc55_crit_edge.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond14.preheader.lr.ph, %for.cond38.preheader.lr.ph, %for.cond34.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %ni, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %nj, 0
  %cmp75 = icmp sgt i32 %nk, 0
  br i1 %cmp21, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = zext i32 %ni to i64
  %1 = add nsw i64 %0, -1
  %xtraiter = and i64 %0, 7
  %lcmp.mod90 = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod90, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %indvars.iv58.prol = phi i64 [ 0, %for.cond1.preheader.prol.preheader ], [ %indvars.iv.next59.prol, %for.cond1.preheader.prol ]
  %prol.iter91 = phi i64 [ %xtraiter, %for.cond1.preheader.prol.preheader ], [ %prol.iter91.sub, %for.cond1.preheader.prol ]
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter91.sub = add i64 %prol.iter91, -1
  %prol.iter91.cmp = icmp eq i64 %prol.iter91.sub, 0
  br i1 %prol.iter91.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !1

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %indvars.iv58.unr = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next59.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %2 = icmp ult i64 %1, 7
  br i1 %2, label %for.end34.loopexit89, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %3 = add i32 %nj, -1
  %4 = and i32 %nj, 3
  %5 = add nsw i32 %4, -1
  %6 = zext i32 %5 to i64
  %7 = add nuw nsw i64 %6, 1
  %8 = zext i32 %nk to i64
  %9 = zext i32 %ni to i64
  %lcmp.mod = icmp eq i32 %4, 0
  %10 = icmp ult i32 %3, 3
  %xtraiter37 = and i32 %nj, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %11 = icmp eq i32 %3, 0
  %wide.trip.count36.1 = zext i32 %nj to i64
  %wide.trip.count.3 = zext i32 %nj to i64
  %12 = add nsw i64 %wide.trip.count36.1, -2
  %13 = add nsw i64 %wide.trip.count36.1, -2
  %broadcast.splatinsert82 = insertelement <2 x double> undef, double %alpha, i32 0
  %14 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next44, %for.inc32.us ]
  %scevgep69 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 2
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %4, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.prol
  %16 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %16, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !3

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %7, %for.body3.us.prol.loopexit.loopexit ]
  br i1 %10, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.inc32.us.loopexit:                            ; preds = %for.cond9.for.inc29_crit_edge.us.us
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.inc32.us.loopexit, %for.cond1.for.cond6.preheader_crit_edge.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %9
  br i1 %exitcond, label %for.end34.loopexit, label %for.cond1.preheader.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.unr, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv
  %17 = bitcast double* %arrayidx5.us to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul.us = fmul <2 x double> %18, %mul.us.v.i1.2
  %19 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next.1
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
  br i1 %cmp75, label %for.cond9.preheader.us.us.preheader, label %for.inc32.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond1.for.cond6.preheader_crit_edge.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 0
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep75 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv40
  br i1 %lcmp.mod38, label %for.body11.us.us.prol.loopexit.unr-lcssa, label %for.body11.us.us.prol.preheader

for.body11.us.us.prol.preheader:                  ; preds = %for.cond9.preheader.us.us
  %23 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %23, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 0
  %24 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %24
  %25 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %25, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.body11.us.us.prol.loopexit.unr-lcssa

for.body11.us.us.prol.loopexit.unr-lcssa:         ; preds = %for.cond9.preheader.us.us, %for.body11.us.us.prol.preheader
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.body11.us.us.prol.preheader ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %11, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit.unr-lcssa
  %26 = sub nsw i64 %12, %indvars.iv34.unr.ph
  %27 = lshr i64 %26, 1
  %28 = add nuw i64 %27, 1
  %min.iters.check = icmp ult i64 %28, 2
  br i1 %min.iters.check, label %for.body11.us.us.preheader88, label %min.iters.checked

for.body11.us.us.preheader88:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body11.us.us.preheader
  %indvars.iv34.ph = phi i64 [ %indvars.iv34.unr.ph, %vector.memcheck ], [ %indvars.iv34.unr.ph, %min.iters.checked ], [ %indvars.iv34.unr.ph, %for.body11.us.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body11.us.us

min.iters.checked:                                ; preds = %for.body11.us.us.preheader
  %n.mod.vf = and i64 %28, 1
  %n.vec = sub i64 %28, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body11.us.us.preheader88, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep67 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34.unr.ph
  %29 = sub nsw i64 %13, %indvars.iv34.unr.ph
  %30 = and i64 %29, -2
  %31 = or i64 %indvars.iv34.unr.ph, %30
  %scevgep70 = getelementptr double, double* %scevgep69, i64 %31
  %scevgep73 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34.unr.ph
  %scevgep76 = getelementptr double, double* %scevgep75, i64 %31
  %bound0 = icmp ult double* %scevgep67, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep70
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep67, %scevgep76
  %bound180 = icmp ult double* %scevgep73, %scevgep70
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  %32 = or i64 %indvars.iv34.unr.ph, 2
  %33 = shl nuw i64 %27, 1
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %34, %35
  br i1 %conflict.rdx, label %for.body11.us.us.preheader88, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %36 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv34.unr.ph, %36
  %37 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = fmul <2 x double> %38, %broadcast.splatinsert82
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %offset.idx
  %42 = bitcast double* %41 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %42, align 8, !alias.scope !7
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec84 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %43 = fmul <2 x double> %40, %strided.vec
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %offset.idx
  %45 = bitcast double* %44 to <4 x double>*
  %wide.vec85 = load <4 x double>, <4 x double>* %45, align 8, !alias.scope !9, !noalias !11
  %strided.vec86 = shufflevector <4 x double> %wide.vec85, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec87 = shufflevector <4 x double> %wide.vec85, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %46 = fadd <2 x double> %strided.vec86, %43
  %47 = add nuw nsw i64 %offset.idx, 1
  %48 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = fmul <2 x double> %49, %broadcast.splatinsert82
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = fmul <2 x double> %51, %strided.vec84
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %47
  %54 = fadd <2 x double> %strided.vec87, %52
  %55 = getelementptr double, double* %53, i64 -1
  %56 = bitcast double* %55 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %46, <2 x double> %54, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %56, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 2
  %57 = icmp eq i64 %index.next, %n.vec
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader88

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block, %for.body11.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next41, %8
  br i1 %exitcond62, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader88, %for.body11.us.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.body11.us.us ], [ %indvars.iv34.ph, %for.body11.us.us.preheader88 ]
  %58 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %58, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34
  %59 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %59
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34
  %60 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %60, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %61 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %61, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv.next35
  %62 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %62
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next35
  %63 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %63, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.body11.us.us, !llvm.loop !15

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr, %for.cond1.preheader.preheader.new ], [ %indvars.iv.next59.7, %for.cond1.preheader ]
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond64.7 = icmp eq i64 %indvars.iv.next59.7, %0
  br i1 %exitcond64.7, label %for.end34.loopexit89.unr-lcssa, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  br label %for.end34

for.end34.loopexit89.unr-lcssa:                   ; preds = %for.cond1.preheader
  br label %for.end34.loopexit89

for.end34.loopexit89:                             ; preds = %for.cond1.preheader.prol.loopexit, %for.end34.loopexit89.unr-lcssa
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit89, %for.end34.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %ni, 0
  %cmp31 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %4 = zext i32 %nj to i64
  %5 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %6 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %7 = add nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond14, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, %5
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #5
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
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !13, !14}

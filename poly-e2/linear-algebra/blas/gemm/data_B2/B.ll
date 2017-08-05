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
  %wide.trip.count40 = zext i32 %nj to i64
  %wide.trip.count44 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next37, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv36, %indvars.iv42
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv42, i64 %indvars.iv36
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %wide.trip.count40
  br i1 %exitcond41, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %for.cond14.preheader.lr.ph.loopexit, label %for.cond1.preheader.us

for.cond14.preheader.lr.ph.loopexit:              ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.lr.ph

for.cond14.preheader.lr.ph:                       ; preds = %for.cond14.preheader.lr.ph.loopexit, %for.cond1.preheader.lr.ph
  %cmp156 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp156, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i32 %nk, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp eq i32 %nk, 1
  %wide.trip.count33 = zext i32 %ni to i64
  %wide.trip.count29.1 = zext i32 %nk to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.inc28.us.prol.loopexit, label %for.inc28.us.prol

for.inc28.us.prol:                                ; preds = %for.cond14.preheader.us
  %4 = trunc i64 %indvars.iv31 to i32
  %rem20.us.prol = srem i32 %4, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.inc28.us.prol.loopexit

for.inc28.us.prol.loopexit:                       ; preds = %for.inc28.us.prol, %for.cond14.preheader.us
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.inc28.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %3, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us.preheader

for.inc28.us.preheader:                           ; preds = %for.inc28.us.prol.loopexit
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us.preheader, %for.inc28.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %for.inc28.us ], [ %indvars.iv26.unr.ph, %for.inc28.us.preheader ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %5 = mul nuw nsw i64 %indvars.iv.next27, %indvars.iv31
  %6 = trunc i64 %5 to i32
  %rem20.us = srem i32 %6, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv26
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %7 = mul nuw nsw i64 %indvars.iv.next27.1, %indvars.iv31
  %8 = trunc i64 %7 to i32
  %rem20.us.1 = srem i32 %8, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next27
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %wide.trip.count29.1
  br i1 %exitcond30.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.inc28.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.inc28.us.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %entry
  %cmp353 = icmp sgt i32 %nk, 0
  br i1 %cmp353, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp391 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp391, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count23 = zext i32 %nk to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc55_crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc52.us

for.inc52.us:                                     ; preds = %for.inc52.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.inc52.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv21
  %11 = trunc i64 %10 to i32
  %rem44.us = srem i32 %11, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.inc52.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.inc52.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %for.end57.loopexit, label %for.cond38.preheader.us

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
  %wide.trip.count60 = zext i32 %ni to i64
  %0 = add nsw i64 %wide.trip.count60, -1
  %xtraiter168 = and i64 %wide.trip.count60, 7
  %lcmp.mod169 = icmp eq i64 %xtraiter168, 0
  br i1 %lcmp.mod169, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %for.cond1.preheader.prol ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter170 = phi i64 [ %prol.iter170.sub, %for.cond1.preheader.prol ], [ %xtraiter168, %for.cond1.preheader.prol.preheader ]
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter170.sub = add i64 %prol.iter170, -1
  %prol.iter170.cmp = icmp eq i64 %prol.iter170.sub, 0
  br i1 %prol.iter170.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !1

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %indvars.iv58.unr = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next59.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %1 = icmp ult i64 %0, 7
  br i1 %1, label %for.end34.loopexit167, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %nj, -1
  %xtraiter = and i32 %nj, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp ult i32 %2, 3
  %xtraiter37 = and i32 %nj, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %4 = icmp eq i32 %2, 0
  %wide.trip.count42 = zext i32 %nk to i64
  %wide.trip.count36.1 = zext i32 %nj to i64
  %wide.trip.count45 = zext i32 %ni to i64
  %5 = add nsw i64 %wide.trip.count36.1, -2
  %6 = add nsw i64 %wide.trip.count36.1, -2
  %7 = add nsw i64 %wide.trip.count36.1, -4
  %broadcast.splatinsert130 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert162 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat163 = shufflevector <2 x double> %broadcast.splatinsert162, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next44, %for.inc32.us ]
  %scevgep100 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 2
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.prol
  %8 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %8, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !3

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  br i1 %3, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %9 = sub i64 %7, %indvars.iv.unr
  %10 = lshr i64 %9, 2
  %11 = add nuw nsw i64 %10, 1
  %min.iters.check142 = icmp ult i64 %11, 2
  br i1 %min.iters.check142, label %for.inc.us.preheader166, label %min.iters.checked143

for.inc.us.preheader166:                          ; preds = %middle.block140, %min.iters.checked143, %for.inc.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked143 ], [ %indvars.iv.unr, %for.inc.us.preheader ], [ %ind.end151, %middle.block140 ]
  br label %for.inc.us

min.iters.checked143:                             ; preds = %for.inc.us.preheader
  %n.mod.vf144 = and i64 %11, 1
  %n.vec145 = sub nsw i64 %11, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  %12 = add i64 %indvars.iv.unr, 4
  %13 = shl nuw i64 %10, 2
  %14 = add i64 %12, %13
  %15 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end151 = sub i64 %14, %15
  br i1 %cmp.zero146, label %for.inc.us.preheader166, label %vector.ph147

vector.ph147:                                     ; preds = %min.iters.checked143
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139, %vector.ph147
  %index148 = phi i64 [ 0, %vector.ph147 ], [ %index.next149, %vector.body139 ]
  %16 = shl i64 %index148, 2
  %17 = add i64 %indvars.iv.unr, %16
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %17
  %19 = bitcast double* %18 to <8 x double>*
  %wide.vec157 = load <8 x double>, <8 x double>* %19, align 8
  %strided.vec158 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec159 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec160 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec161 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %20 = fmul <2 x double> %strided.vec158, %broadcast.splat163
  %21 = fmul <2 x double> %strided.vec159, %broadcast.splat163
  %22 = fmul <2 x double> %strided.vec160, %broadcast.splat163
  %23 = add nsw i64 %17, 3
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %23
  %25 = fmul <2 x double> %strided.vec161, %broadcast.splat163
  %26 = getelementptr double, double* %24, i64 -3
  %27 = bitcast double* %26 to <8 x double>*
  %28 = shufflevector <2 x double> %20, <2 x double> %21, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %29 = shufflevector <2 x double> %22, <2 x double> %25, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec164 = shufflevector <4 x double> %28, <4 x double> %29, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec164, <8 x double>* %27, align 8
  %index.next149 = add i64 %index148, 2
  %30 = icmp eq i64 %index.next149, %n.vec145
  br i1 %30, label %middle.block140, label %vector.body139, !llvm.loop !4

middle.block140:                                  ; preds = %vector.body139
  %cmp.n152 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n152, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.inc.us.preheader166

for.inc32.us.loopexit:                            ; preds = %for.cond9.for.inc29_crit_edge.us.us
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.inc32.us.loopexit, %for.cond1.for.cond6.preheader_crit_edge.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %for.end34.loopexit, label %for.cond1.preheader.us

for.inc.us:                                       ; preds = %for.inc.us.preheader166, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader166 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv
  %31 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %31, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next
  %32 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %32, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %33 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %33, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %34 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %34, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count36.1
  br i1 %exitcond.3, label %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !7

for.cond1.for.cond6.preheader_crit_edge.us.loopexit: ; preds = %for.inc.us
  br label %for.cond1.for.cond6.preheader_crit_edge.us

for.cond1.for.cond6.preheader_crit_edge.us:       ; preds = %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, %middle.block140, %for.inc.us.prol.loopexit
  br i1 %cmp75, label %for.cond9.preheader.us.us.preheader, label %for.inc32.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond1.for.cond6.preheader_crit_edge.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 0
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep106 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv40
  br i1 %lcmp.mod38, label %for.inc26.us.us.prol.loopexit, label %for.inc26.us.us.prol

for.inc26.us.us.prol:                             ; preds = %for.cond9.preheader.us.us
  %35 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %35, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 0
  %36 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %36
  %37 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %37, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.inc26.us.us.prol.loopexit

for.inc26.us.us.prol.loopexit:                    ; preds = %for.inc26.us.us.prol, %for.cond9.preheader.us.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.inc26.us.us.prol ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %4, label %for.cond9.for.inc29_crit_edge.us.us, label %for.inc26.us.us.preheader

for.inc26.us.us.preheader:                        ; preds = %for.inc26.us.us.prol.loopexit
  %38 = sub nsw i64 %5, %indvars.iv34.unr.ph
  %39 = lshr i64 %38, 1
  %40 = add nuw i64 %39, 1
  %min.iters.check91 = icmp ult i64 %40, 2
  br i1 %min.iters.check91, label %for.inc26.us.us.preheader165, label %min.iters.checked92

for.inc26.us.us.preheader165:                     ; preds = %middle.block89, %vector.memcheck119, %min.iters.checked92, %for.inc26.us.us.preheader
  %indvars.iv34.ph = phi i64 [ %indvars.iv34.unr.ph, %vector.memcheck119 ], [ %indvars.iv34.unr.ph, %min.iters.checked92 ], [ %indvars.iv34.unr.ph, %for.inc26.us.us.preheader ], [ %ind.end124, %middle.block89 ]
  br label %for.inc26.us.us

min.iters.checked92:                              ; preds = %for.inc26.us.us.preheader
  %n.mod.vf93 = and i64 %40, 1
  %n.vec94 = sub i64 %40, %n.mod.vf93
  %cmp.zero95 = icmp eq i64 %n.vec94, 0
  br i1 %cmp.zero95, label %for.inc26.us.us.preheader165, label %vector.memcheck119

vector.memcheck119:                               ; preds = %min.iters.checked92
  %scevgep98 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34.unr.ph
  %41 = sub nsw i64 %6, %indvars.iv34.unr.ph
  %42 = and i64 %41, -2
  %43 = or i64 %indvars.iv34.unr.ph, %42
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %43
  %scevgep104 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34.unr.ph
  %scevgep107 = getelementptr double, double* %scevgep106, i64 %43
  %bound0111 = icmp ult double* %scevgep98, %arrayidx15.us.us
  %bound1112 = icmp ult double* %arrayidx15.us.us, %scevgep101
  %found.conflict113 = and i1 %bound0111, %bound1112
  %bound0114 = icmp ult double* %scevgep98, %scevgep107
  %bound1115 = icmp ult double* %scevgep104, %scevgep101
  %found.conflict116 = and i1 %bound0114, %bound1115
  %conflict.rdx117 = or i1 %found.conflict113, %found.conflict116
  %44 = or i64 %indvars.iv34.unr.ph, 2
  %45 = shl nuw i64 %39, 1
  %46 = add i64 %44, %45
  %47 = shl nuw nsw i64 %n.mod.vf93, 1
  %ind.end124 = sub i64 %46, %47
  br i1 %conflict.rdx117, label %for.inc26.us.us.preheader165, label %vector.ph120

vector.ph120:                                     ; preds = %vector.memcheck119
  %48 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !9
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = fmul <2 x double> %49, %broadcast.splatinsert130
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !9
  %53 = insertelement <2 x double> undef, double %52, i32 0
  %54 = fmul <2 x double> %53, %broadcast.splatinsert130
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88, %vector.ph120
  %index121 = phi i64 [ 0, %vector.ph120 ], [ %index.next122, %vector.body88 ]
  %56 = shl i64 %index121, 1
  %offset.idx126 = or i64 %indvars.iv34.unr.ph, %56
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %offset.idx126
  %58 = bitcast double* %57 to <4 x double>*
  %wide.vec132 = load <4 x double>, <4 x double>* %58, align 8, !alias.scope !12
  %strided.vec133 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec134 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %59 = fmul <2 x double> %51, %strided.vec133
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %offset.idx126
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec135 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !14, !noalias !16
  %strided.vec136 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec137 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fadd <2 x double> %strided.vec136, %59
  %63 = add nuw nsw i64 %offset.idx126, 1
  %64 = fmul <2 x double> %55, %strided.vec134
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %63
  %66 = fadd <2 x double> %strided.vec137, %64
  %67 = getelementptr double, double* %65, i64 -1
  %68 = bitcast double* %67 to <4 x double>*
  %interleaved.vec138 = shufflevector <2 x double> %62, <2 x double> %66, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec138, <4 x double>* %68, align 8, !alias.scope !14, !noalias !16
  %index.next122 = add i64 %index121, 2
  %69 = icmp eq i64 %index.next122, %n.vec94
  br i1 %69, label %middle.block89, label %vector.body88, !llvm.loop !17

middle.block89:                                   ; preds = %vector.body88
  %cmp.n125 = icmp eq i64 %n.mod.vf93, 0
  br i1 %cmp.n125, label %for.cond9.for.inc29_crit_edge.us.us, label %for.inc26.us.us.preheader165

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.inc26.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block89, %for.inc26.us.us.prol.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us.preheader165, %for.inc26.us.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.inc26.us.us ], [ %indvars.iv34.ph, %for.inc26.us.us.preheader165 ]
  %70 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %70, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34
  %71 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %71
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34
  %72 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %72, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %73 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %73, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv.next35
  %74 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %74
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next35
  %75 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %75, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.inc26.us.us, !llvm.loop !18

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr, %for.cond1.preheader.preheader.new ], [ %indvars.iv.next59.7, %for.cond1.preheader ]
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond61.7 = icmp eq i64 %indvars.iv.next59.7, %wide.trip.count60
  br i1 %exitcond61.7, label %for.end34.loopexit167.unr-lcssa, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  br label %for.end34

for.end34.loopexit167.unr-lcssa:                  ; preds = %for.cond1.preheader
  br label %for.end34.loopexit167

for.end34.loopexit167:                            ; preds = %for.cond1.preheader.prol.loopexit, %for.end34.loopexit167.unr-lcssa
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit167, %for.end34.loopexit, %entry
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
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count11 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!10, !13}
!17 = distinct !{!17, !5, !6}
!18 = distinct !{!18, !5, !6}

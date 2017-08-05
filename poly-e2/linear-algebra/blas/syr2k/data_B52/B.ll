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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp29 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp29, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count26 = zext i32 %m to i64
  %wide.trip.count30 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc17.us, %for.cond1.preheader.us.preheader
  %indvars.iv28 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next29, %for.inc17.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next22, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv21, %indvars.iv28
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv21
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv28, i64 %indvars.iv21
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next22, %wide.trip.count26
  br i1 %exitcond27, label %for.inc17.us, label %for.body3.us

for.inc17.us:                                     ; preds = %for.body3.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.inc17.us
  br i1 %cmp11, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond20.preheader, %for.cond1.preheader.lr.ph
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count19 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.inc41.us, %for.cond24.preheader.lr.ph
  %indvars.iv17 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next18, %for.inc41.us ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv17
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv17, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc41.us, label %for.body27.us

for.inc41.us:                                     ; preds = %for.body27.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, %wide.trip.count19
  br i1 %exitcond20, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.inc41.us
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %for.cond20.preheader, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp11 = icmp sgt i32 %n, 0
  br i1 %cmp11, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp78 = icmp sgt i32 %m, 0
  br i1 %cmp78, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count72 = zext i32 %n to i64
  %broadcast.splatinsert79 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat80 = shufflevector <2 x double> %broadcast.splatinsert79, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count51 = zext i32 %m to i64
  %wide.trip.count58 = zext i32 %n to i64
  %broadcast.splatinsert148 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat149 = shufflevector <2 x double> %broadcast.splatinsert148, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat124 = shufflevector <2 x double> %broadcast.splatinsert123, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.inc43.us, %for.body3.lr.ph.us.preheader
  %indvars.iv56 = phi i64 [ 0, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next57, %for.inc43.us ]
  %indvars.iv54 = phi i64 [ 1, %for.body3.lr.ph.us.preheader ], [ %indvars.iv.next55, %for.inc43.us ]
  %0 = add i64 %indvars.iv56, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 0
  %1 = mul i64 %indvars.iv56, 1201
  %2 = add i64 %1, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %2
  %3 = add i64 %indvars.iv56, 1
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %4 = trunc i64 %indvars.iv.next57 to i32
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv.prol
  %5 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %5, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %indvars.iv56, 3
  br i1 %6, label %for.cond9.preheader.us14.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %7 = sub i64 %0, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check128 = icmp ult i64 %9, 2
  br i1 %min.iters.check128, label %for.body3.us.preheader151, label %min.iters.checked129

min.iters.checked129:                             ; preds = %for.body3.us.preheader
  %n.mod.vf130 = and i64 %9, 1
  %n.vec131 = sub nsw i64 %9, %n.mod.vf130
  %cmp.zero132 = icmp eq i64 %n.vec131, 0
  %10 = add i64 %indvars.iv.unr, 4
  %11 = shl nuw i64 %8, 2
  %12 = add i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf130, 2
  %ind.end137 = sub i64 %12, %13
  br i1 %cmp.zero132, label %for.body3.us.preheader151, label %vector.ph133

vector.ph133:                                     ; preds = %min.iters.checked129
  br label %vector.body125

vector.body125:                                   ; preds = %vector.body125, %vector.ph133
  %index134 = phi i64 [ 0, %vector.ph133 ], [ %index.next135, %vector.body125 ]
  %14 = shl i64 %index134, 2
  %15 = add i64 %indvars.iv.unr, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %15
  %17 = bitcast double* %16 to <8 x double>*
  %wide.vec143 = load <8 x double>, <8 x double>* %17, align 8
  %strided.vec144 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec145 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec146 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec147 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %18 = fmul <2 x double> %strided.vec144, %broadcast.splat149
  %19 = fmul <2 x double> %strided.vec145, %broadcast.splat149
  %20 = fmul <2 x double> %strided.vec146, %broadcast.splat149
  %21 = add nsw i64 %15, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %21
  %23 = fmul <2 x double> %strided.vec147, %broadcast.splat149
  %24 = getelementptr double, double* %22, i64 -3
  %25 = bitcast double* %24 to <8 x double>*
  %26 = shufflevector <2 x double> %18, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %20, <2 x double> %23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec150 = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec150, <8 x double>* %25, align 8
  %index.next135 = add i64 %index134, 2
  %28 = icmp eq i64 %index.next135, %n.vec131
  br i1 %28, label %middle.block126, label %vector.body125, !llvm.loop !3

middle.block126:                                  ; preds = %vector.body125
  %cmp.n138 = icmp eq i64 %n.mod.vf130, 0
  br i1 %cmp.n138, label %for.cond9.preheader.us14.preheader, label %for.body3.us.preheader151

for.body3.us.preheader151:                        ; preds = %middle.block126, %min.iters.checked129, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked129 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end137, %middle.block126 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader151, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader151 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv
  %29 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %29, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %30, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv.next.1
  %31 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %31, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv.next.2
  %32 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %32, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv54
  br i1 %exitcond.3, label %for.cond9.preheader.us14.preheader.loopexit, label %for.body3.us, !llvm.loop !6

for.cond9.preheader.us14.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us14.preheader

for.cond9.preheader.us14.preheader:               ; preds = %for.cond9.preheader.us14.preheader.loopexit, %middle.block126, %for.body3.us.prol.loopexit
  %min.iters.check84 = icmp ult i64 %3, 2
  %n.vec87 = and i64 %3, -2
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  %cmp.n119 = icmp eq i64 %3, %n.vec87
  br label %for.cond9.preheader.us14

for.cond9.preheader.us14:                         ; preds = %for.cond9.preheader.us14.preheader, %for.inc40.us35
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc40.us35 ], [ 0, %for.cond9.preheader.us14.preheader ]
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv49
  %33 = add i64 %indvars.iv49, 1
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv56, i64 %33
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv49
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv56, i64 %33
  %arrayidx20.us18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv56, i64 %indvars.iv49
  %arrayidx30.us19 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv49
  br i1 %min.iters.check84, label %for.body11.us20.preheader, label %min.iters.checked85

min.iters.checked85:                              ; preds = %for.cond9.preheader.us14
  br i1 %cmp.zero88, label %for.body11.us20.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked85
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us19
  %bound1 = icmp ult double* %arrayidx30.us19, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0102 = icmp ult double* %scevgep, %scevgep95
  %bound1103 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx = or i1 %found.conflict, %found.conflict104
  %bound0105 = icmp ult double* %scevgep, %scevgep99
  %bound1106 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx108 = or i1 %conflict.rdx, %found.conflict107
  %bound0111 = icmp ult double* %scevgep, %arrayidx20.us18
  %bound1112 = icmp ult double* %arrayidx20.us18, %scevgep91
  %found.conflict113 = and i1 %bound0111, %bound1112
  %conflict.rdx114 = or i1 %conflict.rdx108, %found.conflict113
  br i1 %conflict.rdx114, label %for.body11.us20.preheader, label %vector.ph115

vector.ph115:                                     ; preds = %vector.memcheck
  %34 = load double, double* %arrayidx20.us18, align 8, !alias.scope !8
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = load double, double* %arrayidx30.us19, align 8, !alias.scope !11
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %vector.ph115
  %index116 = phi i64 [ 0, %vector.ph115 ], [ %index.next117, %vector.body81 ]
  %40 = or i64 %index116, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index116, i64 %indvars.iv49
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %40, i64 %indvars.iv49
  %43 = load double, double* %41, align 8, !alias.scope !13
  %44 = load double, double* %42, align 8, !alias.scope !13
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat124
  %48 = fmul <2 x double> %47, %36
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index116, i64 %indvars.iv49
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %40, i64 %indvars.iv49
  %51 = load double, double* %49, align 8, !alias.scope !15
  %52 = load double, double* %50, align 8, !alias.scope !15
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat124
  %56 = fmul <2 x double> %55, %39
  %57 = fadd <2 x double> %48, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %index116
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !19
  %60 = fadd <2 x double> %wide.load, %57
  %61 = bitcast double* %58 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8, !alias.scope !17, !noalias !19
  %index.next117 = add i64 %index116, 2
  %62 = icmp eq i64 %index.next117, %n.vec87
  br i1 %62, label %middle.block82, label %vector.body81, !llvm.loop !20

middle.block82:                                   ; preds = %vector.body81
  br i1 %cmp.n119, label %for.inc40.us35, label %for.body11.us20.preheader

for.body11.us20.preheader:                        ; preds = %middle.block82, %vector.memcheck, %min.iters.checked85, %for.cond9.preheader.us14
  %indvars.iv44.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked85 ], [ 0, %for.cond9.preheader.us14 ], [ %n.vec87, %middle.block82 ]
  br label %for.body11.us20

for.body11.us20:                                  ; preds = %for.body11.us20.preheader, %for.body11.us20
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.body11.us20 ], [ %indvars.iv44.ph, %for.body11.us20.preheader ]
  %arrayidx15.us23 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv49
  %63 = load double, double* %arrayidx15.us23, align 8
  %mul16.us24 = fmul double %63, %alpha
  %64 = load double, double* %arrayidx20.us18, align 8
  %mul21.us25 = fmul double %mul16.us24, %64
  %arrayidx25.us26 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv49
  %65 = load double, double* %arrayidx25.us26, align 8
  %mul26.us27 = fmul double %65, %alpha
  %66 = load double, double* %arrayidx30.us19, align 8
  %mul31.us28 = fmul double %mul26.us27, %66
  %add.us29 = fadd double %mul21.us25, %mul31.us28
  %arrayidx35.us30 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv44
  %67 = load double, double* %arrayidx35.us30, align 8
  %add36.us31 = fadd double %67, %add.us29
  store double %add36.us31, double* %arrayidx35.us30, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %indvars.iv54
  br i1 %exitcond, label %for.inc40.us35.loopexit, label %for.body11.us20, !llvm.loop !21

for.inc40.us35.loopexit:                          ; preds = %for.body11.us20
  br label %for.inc40.us35

for.inc40.us35:                                   ; preds = %for.inc40.us35.loopexit, %middle.block82
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.inc43.us, label %for.cond9.preheader.us14

for.inc43.us:                                     ; preds = %for.inc40.us35
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.body3.lr.ph.preheader
  %indvars.iv70 = phi i64 [ 0, %for.body3.lr.ph.preheader ], [ %indvars.iv.next71, %for.inc43 ]
  %indvars.iv68 = phi i64 [ 1, %for.body3.lr.ph.preheader ], [ %indvars.iv.next69, %for.inc43 ]
  %68 = add i64 %indvars.iv70, -3
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %69 = trunc i64 %indvars.iv.next71 to i32
  %xtraiter65 = and i32 %69, 3
  %lcmp.mod66 = icmp eq i32 %xtraiter65, 0
  br i1 %lcmp.mod66, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv60.prol = phi i64 [ %indvars.iv.next61.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter67 = phi i32 [ %prol.iter67.sub, %for.body3.prol ], [ %xtraiter65, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv60.prol
  %70 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %70, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next61.prol = add nuw nsw i64 %indvars.iv60.prol, 1
  %prol.iter67.sub = add i32 %prol.iter67, -1
  %prol.iter67.cmp = icmp eq i32 %prol.iter67.sub, 0
  br i1 %prol.iter67.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !22

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv60.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next61.prol, %for.body3.prol.loopexit.loopexit ]
  %71 = icmp ult i64 %indvars.iv70, 3
  br i1 %71, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %72 = sub i64 %68, %indvars.iv60.unr
  %73 = lshr i64 %72, 2
  %74 = add nuw nsw i64 %73, 1
  %min.iters.check = icmp ult i64 %74, 2
  br i1 %min.iters.check, label %for.body3.preheader152, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %74, 1
  %n.vec = sub nsw i64 %74, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %75 = add i64 %indvars.iv60.unr, 4
  %76 = shl nuw i64 %73, 2
  %77 = add i64 %75, %76
  %78 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %77, %78
  br i1 %cmp.zero, label %for.body3.preheader152, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %79 = shl i64 %index, 2
  %80 = add i64 %indvars.iv60.unr, %79
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %80
  %82 = bitcast double* %81 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %82, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec76 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %83 = fmul <2 x double> %strided.vec, %broadcast.splat80
  %84 = fmul <2 x double> %strided.vec76, %broadcast.splat80
  %85 = fmul <2 x double> %strided.vec77, %broadcast.splat80
  %86 = add nsw i64 %80, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %86
  %88 = fmul <2 x double> %strided.vec78, %broadcast.splat80
  %89 = getelementptr double, double* %87, i64 -3
  %90 = bitcast double* %89 to <8 x double>*
  %91 = shufflevector <2 x double> %83, <2 x double> %84, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %92 = shufflevector <2 x double> %85, <2 x double> %88, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %91, <4 x double> %92, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %90, align 8
  %index.next = add i64 %index, 2
  %93 = icmp eq i64 %index.next, %n.vec
  br i1 %93, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader152

for.body3.preheader152:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv60.ph = phi i64 [ %indvars.iv60.unr, %min.iters.checked ], [ %indvars.iv60.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader152, %for.body3
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.3, %for.body3 ], [ %indvars.iv60.ph, %for.body3.preheader152 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv60
  %94 = load double, double* %arrayidx5, align 8
  %mul = fmul double %94, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next61
  %95 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %95, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next61.1
  %96 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %96, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next61.2 = add nsw i64 %indvars.iv60, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv70, i64 %indvars.iv.next61.2
  %97 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %97, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next61.3 = add nsw i64 %indvars.iv60, 4
  %exitcond64.3 = icmp eq i64 %indvars.iv.next61.3, %indvars.iv68
  br i1 %exitcond64.3, label %for.inc43.loopexit, label %for.body3, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %for.end45.loopexit153, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.inc43.us
  br label %for.end45

for.end45.loopexit153:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit153, %for.end45.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.inc10.us ]
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
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!12, !14, !16, !9}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !7, !4, !5}

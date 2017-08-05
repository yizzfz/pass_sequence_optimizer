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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count27 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc17.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc17.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  br i1 %exitcond24, label %for.inc17.us, label %for.body3.us

for.inc17.us:                                     ; preds = %for.body3.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.inc17.us
  br i1 %cmp8, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond20.preheader
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.inc41, %for.cond24.preheader.lr.ph
  %indvars.iv14 = phi i64 [ 0, %for.cond24.preheader.lr.ph ], [ %indvars.iv.next15, %for.inc41 ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.cond24.preheader
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, %n
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, %conv32
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end43.loopexit, label %for.cond24.preheader

for.end43.loopexit:                               ; preds = %for.inc41
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %entry, %for.cond20.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count69 = zext i32 %n to i64
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat77 = shufflevector <2 x double> %broadcast.splatinsert76, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count48 = zext i32 %m to i64
  %wide.trip.count55 = zext i32 %n to i64
  %broadcast.splatinsert145 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat146 = shufflevector <2 x double> %broadcast.splatinsert145, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert120 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat121 = shufflevector <2 x double> %broadcast.splatinsert120, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.lr.ph.us:                               ; preds = %for.body3.lr.ph.us.preheader, %for.inc43.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.inc43.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc43.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %0 = add i64 %indvars.iv53, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 0
  %1 = mul i64 %indvars.iv53, 1201
  %2 = add i64 %1, 1
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %2
  %3 = add i64 %indvars.iv53, 1
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %4 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter = and i32 %4, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.prol
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
  %6 = icmp ult i64 %indvars.iv53, 3
  br i1 %6, label %for.cond9.preheader.us11.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %7 = sub i64 %0, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = add nuw nsw i64 %8, 1
  %min.iters.check125 = icmp ult i64 %9, 2
  br i1 %min.iters.check125, label %for.body3.us.preheader148, label %min.iters.checked126

min.iters.checked126:                             ; preds = %for.body3.us.preheader
  %n.mod.vf127 = and i64 %9, 1
  %n.vec128 = sub nsw i64 %9, %n.mod.vf127
  %cmp.zero129 = icmp eq i64 %n.vec128, 0
  %10 = add i64 %indvars.iv.unr, 4
  %11 = shl nuw i64 %8, 2
  %12 = add i64 %10, %11
  %13 = shl nuw nsw i64 %n.mod.vf127, 2
  %ind.end134 = sub i64 %12, %13
  br i1 %cmp.zero129, label %for.body3.us.preheader148, label %vector.ph130

vector.ph130:                                     ; preds = %min.iters.checked126
  br label %vector.body122

vector.body122:                                   ; preds = %vector.body122, %vector.ph130
  %index131 = phi i64 [ 0, %vector.ph130 ], [ %index.next132, %vector.body122 ]
  %14 = shl i64 %index131, 2
  %15 = add i64 %indvars.iv.unr, %14
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %15
  %17 = bitcast double* %16 to <8 x double>*
  %wide.vec140 = load <8 x double>, <8 x double>* %17, align 8
  %strided.vec141 = shufflevector <8 x double> %wide.vec140, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec142 = shufflevector <8 x double> %wide.vec140, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec143 = shufflevector <8 x double> %wide.vec140, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec144 = shufflevector <8 x double> %wide.vec140, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %18 = fmul <2 x double> %strided.vec141, %broadcast.splat146
  %19 = fmul <2 x double> %strided.vec142, %broadcast.splat146
  %20 = fmul <2 x double> %strided.vec143, %broadcast.splat146
  %21 = add nsw i64 %15, 3
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %21
  %23 = fmul <2 x double> %strided.vec144, %broadcast.splat146
  %24 = getelementptr double, double* %22, i64 -3
  %25 = bitcast double* %24 to <8 x double>*
  %26 = shufflevector <2 x double> %18, <2 x double> %19, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %27 = shufflevector <2 x double> %20, <2 x double> %23, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec147 = shufflevector <4 x double> %26, <4 x double> %27, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec147, <8 x double>* %25, align 8
  %index.next132 = add i64 %index131, 2
  %28 = icmp eq i64 %index.next132, %n.vec128
  br i1 %28, label %middle.block123, label %vector.body122, !llvm.loop !3

middle.block123:                                  ; preds = %vector.body122
  %cmp.n135 = icmp eq i64 %n.mod.vf127, 0
  br i1 %cmp.n135, label %for.cond9.preheader.us11.preheader, label %for.body3.us.preheader148

for.body3.us.preheader148:                        ; preds = %middle.block123, %min.iters.checked126, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked126 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end134, %middle.block123 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader148, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader148 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv
  %29 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %29, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %30, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %31 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %31, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %32 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %32, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv51
  br i1 %exitcond.3, label %for.cond9.preheader.us11.preheader.loopexit, label %for.body3.us, !llvm.loop !6

for.cond9.preheader.us11.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us11.preheader

for.cond9.preheader.us11.preheader:               ; preds = %for.cond9.preheader.us11.preheader.loopexit, %middle.block123, %for.body3.us.prol.loopexit
  %min.iters.check81 = icmp ult i64 %3, 2
  %n.vec84 = and i64 %3, -2
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  %cmp.n116 = icmp eq i64 %3, %n.vec84
  br label %for.cond9.preheader.us11

for.cond9.preheader.us11:                         ; preds = %for.cond9.preheader.us11.preheader, %for.inc40.us32
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc40.us32 ], [ 0, %for.cond9.preheader.us11.preheader ]
  %scevgep90 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv46
  %33 = add i64 %indvars.iv46, 1
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %33
  %scevgep94 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv46
  %scevgep96 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv53, i64 %33
  %arrayidx20.us15 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv53, i64 %indvars.iv46
  %arrayidx30.us16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv46
  br i1 %min.iters.check81, label %for.body11.us17.preheader, label %min.iters.checked82

min.iters.checked82:                              ; preds = %for.cond9.preheader.us11
  br i1 %cmp.zero85, label %for.body11.us17.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked82
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us16
  %bound1 = icmp ult double* %arrayidx30.us16, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bound099 = icmp ult double* %scevgep, %scevgep92
  %bound1100 = icmp ult double* %scevgep90, %scevgep88
  %found.conflict101 = and i1 %bound099, %bound1100
  %conflict.rdx = or i1 %found.conflict, %found.conflict101
  %bound0102 = icmp ult double* %scevgep, %scevgep96
  %bound1103 = icmp ult double* %scevgep94, %scevgep88
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx105 = or i1 %conflict.rdx, %found.conflict104
  %bound0108 = icmp ult double* %scevgep, %arrayidx20.us15
  %bound1109 = icmp ult double* %arrayidx20.us15, %scevgep88
  %found.conflict110 = and i1 %bound0108, %bound1109
  %conflict.rdx111 = or i1 %conflict.rdx105, %found.conflict110
  br i1 %conflict.rdx111, label %for.body11.us17.preheader, label %vector.ph112

vector.ph112:                                     ; preds = %vector.memcheck
  %34 = load double, double* %arrayidx20.us15, align 8, !alias.scope !8
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = load double, double* %arrayidx30.us16, align 8, !alias.scope !11
  %38 = insertelement <2 x double> undef, double %37, i32 0
  %39 = shufflevector <2 x double> %38, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %vector.ph112
  %index113 = phi i64 [ 0, %vector.ph112 ], [ %index.next114, %vector.body78 ]
  %40 = or i64 %index113, 1
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index113, i64 %indvars.iv46
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %40, i64 %indvars.iv46
  %43 = load double, double* %41, align 8, !alias.scope !13
  %44 = load double, double* %42, align 8, !alias.scope !13
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat121
  %48 = fmul <2 x double> %47, %36
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index113, i64 %indvars.iv46
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %40, i64 %indvars.iv46
  %51 = load double, double* %49, align 8, !alias.scope !15
  %52 = load double, double* %50, align 8, !alias.scope !15
  %53 = insertelement <2 x double> undef, double %51, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %54, %broadcast.splat121
  %56 = fmul <2 x double> %55, %39
  %57 = fadd <2 x double> %48, %56
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %index113
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !17, !noalias !19
  %60 = fadd <2 x double> %wide.load, %57
  %61 = bitcast double* %58 to <2 x double>*
  store <2 x double> %60, <2 x double>* %61, align 8, !alias.scope !17, !noalias !19
  %index.next114 = add i64 %index113, 2
  %62 = icmp eq i64 %index.next114, %n.vec84
  br i1 %62, label %middle.block79, label %vector.body78, !llvm.loop !20

middle.block79:                                   ; preds = %vector.body78
  br i1 %cmp.n116, label %for.inc40.us32, label %for.body11.us17.preheader

for.body11.us17.preheader:                        ; preds = %middle.block79, %vector.memcheck, %min.iters.checked82, %for.cond9.preheader.us11
  %indvars.iv41.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked82 ], [ 0, %for.cond9.preheader.us11 ], [ %n.vec84, %middle.block79 ]
  br label %for.body11.us17

for.body11.us17:                                  ; preds = %for.body11.us17.preheader, %for.body11.us17
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.body11.us17 ], [ %indvars.iv41.ph, %for.body11.us17.preheader ]
  %arrayidx15.us20 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv46
  %63 = load double, double* %arrayidx15.us20, align 8
  %mul16.us21 = fmul double %63, %alpha
  %64 = load double, double* %arrayidx20.us15, align 8
  %mul21.us22 = fmul double %mul16.us21, %64
  %arrayidx25.us23 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv46
  %65 = load double, double* %arrayidx25.us23, align 8
  %mul26.us24 = fmul double %65, %alpha
  %66 = load double, double* %arrayidx30.us16, align 8
  %mul31.us25 = fmul double %mul26.us24, %66
  %add.us26 = fadd double %mul21.us22, %mul31.us25
  %arrayidx35.us27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv53, i64 %indvars.iv41
  %67 = load double, double* %arrayidx35.us27, align 8
  %add36.us28 = fadd double %67, %add.us26
  store double %add36.us28, double* %arrayidx35.us27, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %indvars.iv51
  br i1 %exitcond, label %for.inc40.us32.loopexit, label %for.body11.us17, !llvm.loop !21

for.inc40.us32.loopexit:                          ; preds = %for.body11.us17
  br label %for.inc40.us32

for.inc40.us32:                                   ; preds = %for.inc40.us32.loopexit, %middle.block79
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %for.inc43.us, label %for.cond9.preheader.us11

for.inc43.us:                                     ; preds = %for.inc40.us32
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.body3.lr.ph.preheader, %for.inc43
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc43 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc43 ], [ 1, %for.body3.lr.ph.preheader ]
  %68 = add i64 %indvars.iv67, -3
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %69 = trunc i64 %indvars.iv.next68 to i32
  %xtraiter62 = and i32 %69, 3
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  br i1 %lcmp.mod63, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader, %for.body3.prol
  %indvars.iv57.prol = phi i64 [ %indvars.iv.next58.prol, %for.body3.prol ], [ 0, %for.body3.prol.preheader ]
  %prol.iter64 = phi i32 [ %prol.iter64.sub, %for.body3.prol ], [ %xtraiter62, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv57.prol
  %70 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %70, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next58.prol = add nuw nsw i64 %indvars.iv57.prol, 1
  %prol.iter64.sub = add i32 %prol.iter64, -1
  %prol.iter64.cmp = icmp eq i32 %prol.iter64.sub, 0
  br i1 %prol.iter64.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !22

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.lr.ph
  %indvars.iv57.unr = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next58.prol, %for.body3.prol.loopexit.loopexit ]
  %71 = icmp ult i64 %indvars.iv67, 3
  br i1 %71, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %72 = sub i64 %68, %indvars.iv57.unr
  %73 = lshr i64 %72, 2
  %74 = add nuw nsw i64 %73, 1
  %min.iters.check = icmp ult i64 %74, 2
  br i1 %min.iters.check, label %for.body3.preheader149, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %n.mod.vf = and i64 %74, 1
  %n.vec = sub nsw i64 %74, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %75 = add i64 %indvars.iv57.unr, 4
  %76 = shl nuw i64 %73, 2
  %77 = add i64 %75, %76
  %78 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %77, %78
  br i1 %cmp.zero, label %for.body3.preheader149, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %79 = shl i64 %index, 2
  %80 = add i64 %indvars.iv57.unr, %79
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %80
  %82 = bitcast double* %81 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %82, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec75 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %83 = fmul <2 x double> %strided.vec, %broadcast.splat77
  %84 = fmul <2 x double> %strided.vec73, %broadcast.splat77
  %85 = fmul <2 x double> %strided.vec74, %broadcast.splat77
  %86 = add nsw i64 %80, 3
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %86
  %88 = fmul <2 x double> %strided.vec75, %broadcast.splat77
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
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader149

for.body3.preheader149:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv57.ph = phi i64 [ %indvars.iv57.unr, %min.iters.checked ], [ %indvars.iv57.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader149, %for.body3
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.3, %for.body3 ], [ %indvars.iv57.ph, %for.body3.preheader149 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv57
  %94 = load double, double* %arrayidx5, align 8
  %mul = fmul double %94, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next58
  %95 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %95, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next58.1
  %96 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %96, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next58.2
  %97 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %97, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next58.3, %indvars.iv65
  br i1 %exitcond61.3, label %for.inc43.loopexit, label %for.body3, !llvm.loop !24

for.inc43.loopexit:                               ; preds = %for.body3
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, %wide.trip.count69
  br i1 %exitcond70, label %for.end45.loopexit150, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.inc43.us
  br label %for.end45

for.end45.loopexit150:                            ; preds = %for.inc43
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit150, %for.end45.loopexit, %entry
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
  br i1 %cmp4, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %n to i64
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next9, %for.inc10 ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader

for.end12.loopexit:                               ; preds = %for.inc10
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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

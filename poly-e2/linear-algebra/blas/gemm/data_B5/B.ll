; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
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
  call void @print_array(i32 1000, i32 1100, [1100 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, double* %alpha, double* %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) #2 {
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

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc7.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.inc7.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
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
  br i1 %exitcond69, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.inc7.us
  %cmp1136 = icmp sgt i32 %ni, 0
  br i1 %cmp1136, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond10.preheader
  %cmp1534 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp1534, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i32 %nk, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp eq i32 %nk, 1
  %wide.trip.count61 = zext i32 %ni to i64
  %wide.trip.count57.1 = zext i32 %nk to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.inc31.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc31.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body17.us.prol.loopexit, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %4 = trunc i64 %indvars.iv59 to i32
  %rem20.us.prol = srem i32 %4, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.cond14.preheader.us, %for.body17.us.prol
  %indvars.iv54.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %3, label %for.inc31.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %for.body17.us ], [ %indvars.iv54.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %5 = mul nuw nsw i64 %indvars.iv.next55, %indvars.iv59
  %6 = trunc i64 %5 to i32
  %rem20.us = srem i32 %6, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv54
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %7 = mul nuw nsw i64 %indvars.iv.next55.1, %indvars.iv59
  %8 = trunc i64 %7 to i32
  %rem20.us.1 = srem i32 %8, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv.next55
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count57.1
  br i1 %exitcond58.1, label %for.inc31.us.loopexit, label %for.body17.us

for.inc31.us.loopexit:                            ; preds = %for.body17.us
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us.loopexit, %for.body17.us.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.inc31.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %entry, %for.cond10.preheader
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

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.inc55.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc55.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body41.us ], [ 0, %for.cond38.preheader.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv49
  %11 = trunc i64 %10 to i32
  %rem44.us = srem i32 %11, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc55.us, label %for.body41.us

for.inc55.us:                                     ; preds = %for.body41.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.end57.loopexit, label %for.cond38.preheader.us

for.end57.loopexit:                               ; preds = %for.inc55.us
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond14.preheader.lr.ph, %for.cond38.preheader.lr.ph, %for.cond34.preheader
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) #2 {
entry:
  %cmp22 = icmp sgt i32 %ni, 0
  br i1 %cmp22, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nj, 0
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count74 = zext i32 %ni to i64
  %0 = add nsw i64 %wide.trip.count74, -1
  %xtraiter132 = and i64 %wide.trip.count74, 7
  %lcmp.mod133 = icmp eq i64 %xtraiter132, 0
  br i1 %lcmp.mod133, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %indvars.iv72.prol = phi i64 [ %indvars.iv.next73.prol, %for.cond1.preheader.prol ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter134 = phi i64 [ %prol.iter134.sub, %for.cond1.preheader.prol ], [ %xtraiter132, %for.cond1.preheader.prol.preheader ]
  %indvars.iv.next73.prol = add nuw nsw i64 %indvars.iv72.prol, 1
  %prol.iter134.sub = add i64 %prol.iter134, -1
  %prol.iter134.cmp = icmp eq i64 %prol.iter134.sub, 0
  br i1 %prol.iter134.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !1

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %indvars.iv72.unr = phi i64 [ 0, %for.cond1.preheader.preheader ], [ %indvars.iv.next73.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %1 = icmp ult i64 %0, 7
  br i1 %1, label %for.end34.loopexit131, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %nj, -1
  %xtraiter = and i32 %nj, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp ult i32 %2, 3
  %xtraiter51 = and i32 %nj, 1
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  %4 = icmp eq i32 %2, 0
  %wide.trip.count56 = zext i32 %nk to i64
  %wide.trip.count50.1 = zext i32 %nj to i64
  %wide.trip.count59 = zext i32 %ni to i64
  %wide.trip.count.3 = zext i32 %nj to i64
  %5 = add nsw i64 %wide.trip.count50.1, -2
  %6 = add nsw i64 %wide.trip.count50.1, -2
  %7 = add nsw i64 %wide.trip.count50.1, -4
  %.not = icmp slt i32 %nk, 1
  %broadcast.splatinsert97 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert126 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat127 = shufflevector <2 x double> %broadcast.splatinsert126, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next58, %for.inc32.us ]
  %scevgep84 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 2
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.prol
  %8 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %8, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !3

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  br i1 %3, label %for.cond6.preheader.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %9 = sub i64 %7, %indvars.iv.unr
  %10 = lshr i64 %9, 2
  %11 = add nuw nsw i64 %10, 1
  %min.iters.check106 = icmp ult i64 %11, 2
  br i1 %min.iters.check106, label %for.body3.us.preheader130, label %min.iters.checked107

min.iters.checked107:                             ; preds = %for.body3.us.preheader
  %n.mod.vf108 = and i64 %11, 1
  %n.vec109 = sub nsw i64 %11, %n.mod.vf108
  %cmp.zero110 = icmp eq i64 %n.vec109, 0
  %12 = add i64 %indvars.iv.unr, 4
  %13 = shl nuw i64 %10, 2
  %14 = add i64 %12, %13
  %15 = shl nuw nsw i64 %n.mod.vf108, 2
  %ind.end115 = sub i64 %14, %15
  br i1 %cmp.zero110, label %for.body3.us.preheader130, label %vector.ph111

vector.ph111:                                     ; preds = %min.iters.checked107
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103, %vector.ph111
  %index112 = phi i64 [ 0, %vector.ph111 ], [ %index.next113, %vector.body103 ]
  %16 = shl i64 %index112, 2
  %17 = add i64 %indvars.iv.unr, %16
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %17
  %19 = bitcast double* %18 to <8 x double>*
  %wide.vec121 = load <8 x double>, <8 x double>* %19, align 8
  %strided.vec122 = shufflevector <8 x double> %wide.vec121, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec123 = shufflevector <8 x double> %wide.vec121, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec124 = shufflevector <8 x double> %wide.vec121, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec125 = shufflevector <8 x double> %wide.vec121, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %20 = fmul <2 x double> %strided.vec122, %broadcast.splat127
  %21 = fmul <2 x double> %strided.vec123, %broadcast.splat127
  %22 = fmul <2 x double> %strided.vec124, %broadcast.splat127
  %23 = add nsw i64 %17, 3
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %23
  %25 = fmul <2 x double> %strided.vec125, %broadcast.splat127
  %26 = getelementptr double, double* %24, i64 -3
  %27 = bitcast double* %26 to <8 x double>*
  %28 = shufflevector <2 x double> %20, <2 x double> %21, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %29 = shufflevector <2 x double> %22, <2 x double> %25, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec128 = shufflevector <4 x double> %28, <4 x double> %29, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec128, <8 x double>* %27, align 8
  %index.next113 = add i64 %index112, 2
  %30 = icmp eq i64 %index.next113, %n.vec109
  br i1 %30, label %middle.block104, label %vector.body103, !llvm.loop !4

middle.block104:                                  ; preds = %vector.body103
  %cmp.n116 = icmp eq i64 %n.mod.vf108, 0
  br i1 %cmp.n116, label %for.cond6.preheader.us, label %for.body3.us.preheader130

for.body3.us.preheader130:                        ; preds = %middle.block104, %min.iters.checked107, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked107 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end115, %middle.block104 ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader130, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader130 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv
  %31 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %31, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next
  %32 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %32, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next.1
  %33 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %33, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next.2
  %34 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %34, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond6.preheader.us.loopexit, label %for.body3.us, !llvm.loop !7

for.cond6.preheader.us.loopexit:                  ; preds = %for.body3.us
  br label %for.cond6.preheader.us

for.cond6.preheader.us:                           ; preds = %for.cond6.preheader.us.loopexit, %middle.block104, %for.body3.us.prol.loopexit
  br i1 %.not, label %for.inc32.us, label %for.cond9.preheader.us.us.preheader

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond6.preheader.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 0
  br label %for.cond9.preheader.us.us

for.inc32.us.loopexit:                            ; preds = %for.inc29.us.us
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.inc32.us.loopexit, %for.cond6.preheader.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.end34.loopexit, label %for.cond1.preheader.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.inc29.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.inc29.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep90 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv54
  br i1 %lcmp.mod52, label %for.body11.us.us.prol.loopexit, label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.cond9.preheader.us.us
  %35 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %35, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 0
  %36 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %36
  %37 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %37, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.cond9.preheader.us.us, %for.body11.us.us.prol
  %indvars.iv48.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %4, label %for.inc29.us.us, label %for.body11.us.us.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit
  %38 = sub nsw i64 %5, %indvars.iv48.unr.ph
  %39 = lshr i64 %38, 1
  %40 = add nuw i64 %39, 1
  %min.iters.check = icmp ult i64 %40, 2
  br i1 %min.iters.check, label %for.body11.us.us.preheader129, label %min.iters.checked

for.body11.us.us.preheader129:                    ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body11.us.us.preheader
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr.ph, %vector.memcheck ], [ %indvars.iv48.unr.ph, %min.iters.checked ], [ %indvars.iv48.unr.ph, %for.body11.us.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body11.us.us

min.iters.checked:                                ; preds = %for.body11.us.us.preheader
  %n.mod.vf = and i64 %40, 1
  %n.vec = sub i64 %40, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body11.us.us.preheader129, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep82 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48.unr.ph
  %41 = sub nsw i64 %6, %indvars.iv48.unr.ph
  %42 = and i64 %41, -2
  %43 = or i64 %indvars.iv48.unr.ph, %42
  %scevgep85 = getelementptr double, double* %scevgep84, i64 %43
  %scevgep88 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48.unr.ph
  %scevgep91 = getelementptr double, double* %scevgep90, i64 %43
  %bound0 = icmp ult double* %scevgep82, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep85
  %found.conflict = and i1 %bound0, %bound1
  %bound094 = icmp ult double* %scevgep82, %scevgep91
  %bound195 = icmp ult double* %scevgep88, %scevgep85
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx = or i1 %found.conflict, %found.conflict96
  %44 = or i64 %indvars.iv48.unr.ph, 2
  %45 = shl nuw i64 %39, 1
  %46 = add i64 %44, %45
  %47 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %46, %47
  br i1 %conflict.rdx, label %for.body11.us.us.preheader129, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %48 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv48.unr.ph, %48
  %49 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !9
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = fmul <2 x double> %50, %broadcast.splatinsert97
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %offset.idx
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !12
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec99 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %55 = fmul <2 x double> %52, %strided.vec
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %offset.idx
  %57 = bitcast double* %56 to <4 x double>*
  %wide.vec100 = load <4 x double>, <4 x double>* %57, align 8, !alias.scope !14, !noalias !16
  %strided.vec101 = shufflevector <4 x double> %wide.vec100, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec102 = shufflevector <4 x double> %wide.vec100, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %58 = fadd <2 x double> %strided.vec101, %55
  %59 = add nuw nsw i64 %offset.idx, 1
  %60 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !9
  %61 = insertelement <2 x double> undef, double %60, i32 0
  %62 = fmul <2 x double> %61, %broadcast.splatinsert97
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = fmul <2 x double> %63, %strided.vec99
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %59
  %66 = fadd <2 x double> %strided.vec102, %64
  %67 = getelementptr double, double* %65, i64 -1
  %68 = bitcast double* %67 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %58, <2 x double> %66, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %68, align 8, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 2
  %69 = icmp eq i64 %index.next, %n.vec
  br i1 %69, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc29.us.us, label %for.body11.us.us.preheader129

for.inc29.us.us.loopexit:                         ; preds = %for.body11.us.us
  br label %for.inc29.us.us

for.inc29.us.us:                                  ; preds = %for.inc29.us.us.loopexit, %middle.block, %for.body11.us.us.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader129, %for.body11.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %for.body11.us.us ], [ %indvars.iv48.ph, %for.body11.us.us.preheader129 ]
  %70 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %70, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48
  %71 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %71
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv48
  %72 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %72, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %73 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %73, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv.next49
  %74 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %74
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv.next49
  %75 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %75, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond.1, label %for.inc29.us.us.loopexit, label %for.body11.us.us, !llvm.loop !18

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %indvars.iv72 = phi i64 [ %indvars.iv72.unr, %for.cond1.preheader.preheader.new ], [ %indvars.iv.next73.7, %for.cond1.preheader ]
  %indvars.iv.next73.7 = add nsw i64 %indvars.iv72, 8
  %exitcond75.7 = icmp eq i64 %indvars.iv.next73.7, %wide.trip.count74
  br i1 %exitcond75.7, label %for.end34.loopexit131.unr-lcssa, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  br label %for.end34

for.end34.loopexit131.unr-lcssa:                  ; preds = %for.cond1.preheader
  br label %for.end34.loopexit131

for.end34.loopexit131:                            ; preds = %for.cond1.preheader.prol.loopexit, %for.end34.loopexit131.unr-lcssa
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit131, %for.end34.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nj, [1100 x double]* %C) #0 {
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

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc10.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.cond2.preheader.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

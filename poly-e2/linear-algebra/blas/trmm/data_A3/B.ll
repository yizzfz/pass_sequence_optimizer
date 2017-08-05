; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  tail call void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp123 = icmp sgt i32 %n, 0
  %conv18 = sitofp i32 %n to double
  %conv4 = sitofp i32 %m to double
  br i1 %cmp123, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count36 = zext i32 %m to i64
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %xtraiter15 = and i32 %n, 1
  %lcmp.mod16 = icmp eq i32 %xtraiter15, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count14.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond11.for.inc27_crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = add i64 %indvars.iv21, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %2 = trunc i64 %indvars.iv21 to i32
  %sub.us = add i32 %2, %n
  br i1 %lcmp.mod16, label %for.body14.us.prol.loopexit, label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol, %for.end.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 %0, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.body14.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.body14.us ], [ %indvars.iv12.unr.ph, %for.body14.us.preheader ]
  %3 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %3
  %rem16.us = srem i32 %add15.us, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv18
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv12
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %4 = trunc i64 %indvars.iv.next13 to i32
  %add15.us.1 = sub i32 %sub.us, %4
  %rem16.us.1 = srem i32 %add15.us.1, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv18
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv.next13
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond.118 = icmp eq i64 %indvars.iv.next13.1, %wide.trip.count14.1
  br i1 %exitcond.118, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv21
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv21
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, %m
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.us
  %xtraiter39 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.lr.ph.us
  %9 = trunc i64 %indvars.iv21 to i32
  %rem.us.prol = srem i32 %9, %m
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.lr.ph.us ]
  %10 = trunc i64 %1 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.body14.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond, label %for.end29.loopexit, label %for.cond1.preheader.us

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %12 = add i64 %indvars.iv34, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp21, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %xtraiter3038 = and i64 %indvars.iv34, 1
  %lcmp.mod31 = icmp eq i64 %xtraiter3038, 0
  br i1 %lcmp.mod31, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %13 = trunc i64 %indvars.iv34 to i32
  %rem.prol = srem i32 %13, %m
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, %conv4
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.lr.ph
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %14 = trunc i64 %12 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body3 ], [ %indvars.iv24.unr.ph, %for.body3.preheader ]
  %16 = add nuw nsw i64 %indvars.iv24, %indvars.iv34
  %17 = trunc i64 %16 to i32
  %rem = srem i32 %17, %m
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %18 = add nuw nsw i64 %indvars.iv.next25, %indvars.iv34
  %19 = trunc i64 %18 to i32
  %rem.1 = srem i32 %19, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, %conv4
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv.next25
  store double %div.1, double* %arrayidx6.1, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next25.1, %indvars.iv34
  br i1 %exitcond29.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %for.end29.loopexit42, label %for.cond1.preheader

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit42:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit42, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) #2 {
entry:
  %cmp6 = icmp sgt i32 %m, 0
  %cmp24 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp6, %cmp24
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = add i32 %m, 1
  %2 = add i32 %m, -2
  %3 = sext i32 %m to i64
  %wide.trip.count43 = zext i32 %n to i64
  %wide.trip.count37.1 = zext i32 %m to i64
  %wide.trip.count46 = zext i32 %m to i64
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %n to i64
  %5 = add nsw i64 %wide.trip.count43, -4
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv33 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc30_crit_edge.us ]
  %6 = sub nsw i64 0, %indvars.iv44
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %cmp52.us = icmp slt i64 %indvars.iv.next45, %3
  br i1 %cmp52.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us8.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %7 = trunc i64 %6 to i32
  %8 = trunc i64 %6 to i32
  %9 = add i32 %1, %8
  %xtraiter38 = and i32 %9, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %10 = sub i32 0, %7
  %11 = icmp eq i32 %2, %10
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv44
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv33, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us8.preheader:                ; preds = %for.cond1.preheader.us
  br i1 %lcmp.mod, label %for.cond4.preheader.us8.prol.loopexit, label %for.cond4.preheader.us8.prol.preheader

for.cond4.preheader.us8.prol.preheader:           ; preds = %for.cond4.preheader.us8.preheader
  br label %for.cond4.preheader.us8.prol

for.cond4.preheader.us8.prol:                     ; preds = %for.cond4.preheader.us8.prol.preheader, %for.cond4.preheader.us8.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us8.prol ], [ 0, %for.cond4.preheader.us8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us8.prol ], [ %xtraiter, %for.cond4.preheader.us8.prol.preheader ]
  %arrayidx21.us12.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.prol
  %12 = load double, double* %arrayidx21.us12.prol, align 8
  %mul22.us13.prol = fmul double %12, %alpha
  store double %mul22.us13.prol, double* %arrayidx21.us12.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.us8.prol.loopexit.loopexit, label %for.cond4.preheader.us8.prol, !llvm.loop !1

for.cond4.preheader.us8.prol.loopexit.loopexit:   ; preds = %for.cond4.preheader.us8.prol
  br label %for.cond4.preheader.us8.prol.loopexit

for.cond4.preheader.us8.prol.loopexit:            ; preds = %for.cond4.preheader.us8.prol.loopexit.loopexit, %for.cond4.preheader.us8.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us8.preheader ], [ %indvars.iv.next.prol, %for.cond4.preheader.us8.prol.loopexit.loopexit ]
  br i1 %4, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us8.preheader51

for.cond4.preheader.us8.preheader51:              ; preds = %for.cond4.preheader.us8.prol.loopexit
  %13 = sub i64 %5, %indvars.iv.unr
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %min.iters.check = icmp ult i64 %15, 2
  br i1 %min.iters.check, label %for.cond4.preheader.us8.preheader58, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us8.preheader51
  %n.mod.vf = and i64 %15, 1
  %n.vec = sub nsw i64 %15, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %16 = add i64 %indvars.iv.unr, 4
  %17 = shl nuw i64 %14, 2
  %18 = add i64 %16, %17
  %19 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %18, %19
  br i1 %cmp.zero, label %for.cond4.preheader.us8.preheader58, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %20 = shl i64 %index, 2
  %21 = add i64 %indvars.iv.unr, %20
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %21
  %23 = bitcast double* %22 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %23, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec53 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec54 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec55 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %24 = fmul <2 x double> %strided.vec, %broadcast.splat57
  %25 = fmul <2 x double> %strided.vec53, %broadcast.splat57
  %26 = fmul <2 x double> %strided.vec54, %broadcast.splat57
  %27 = add nsw i64 %21, 3
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %27
  %29 = fmul <2 x double> %strided.vec55, %broadcast.splat57
  %30 = getelementptr double, double* %28, i64 -3
  %31 = bitcast double* %30 to <8 x double>*
  %32 = shufflevector <2 x double> %24, <2 x double> %25, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %33 = shufflevector <2 x double> %26, <2 x double> %29, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %32, <4 x double> %33, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %31, align 8
  %index.next = add i64 %index, 2
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us8.preheader58

for.cond4.preheader.us8.preheader58:              ; preds = %middle.block, %min.iters.checked, %for.cond4.preheader.us8.preheader51
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %for.cond4.preheader.us8.preheader51 ], [ %ind.end, %middle.block ]
  br label %for.cond4.preheader.us8

for.cond4.preheader.us8:                          ; preds = %for.cond4.preheader.us8.preheader58, %for.cond4.preheader.us8
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.cond4.preheader.us8 ], [ %indvars.iv.ph, %for.cond4.preheader.us8.preheader58 ]
  %arrayidx21.us12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv
  %35 = load double, double* %arrayidx21.us12, align 8
  %mul22.us13 = fmul double %35, %alpha
  store double %mul22.us13, double* %arrayidx21.us12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx21.us12.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next
  %36 = load double, double* %arrayidx21.us12.1, align 8
  %mul22.us13.1 = fmul double %36, %alpha
  store double %mul22.us13.1, double* %arrayidx21.us12.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us12.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %37 = load double, double* %arrayidx21.us12.2, align 8
  %mul22.us13.2 = fmul double %37, %alpha
  store double %mul22.us13.2, double* %arrayidx21.us12.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx21.us12.3 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %38 = load double, double* %arrayidx21.us12.3, align 8
  %mul22.us13.3 = fmul double %38, %alpha
  store double %mul22.us13.3, double* %arrayidx21.us12.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond1.for.inc30_crit_edge.us.loopexit59, label %for.cond4.preheader.us8, !llvm.loop !6

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit59:      ; preds = %for.cond4.preheader.us8
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit59, %for.cond1.for.inc30_crit_edge.us.loopexit, %middle.block, %for.cond4.preheader.us8.prol.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %for.end32.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  br i1 %lcmp.mod39, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %39 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv41
  %40 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %39, %40
  %41 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %41, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.body6.us.us.prol ], [ %indvars.iv33, %for.cond4.preheader.us.us ]
  br i1 %11, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.cond4.for.end_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  %42 = load double, double* %arrayidx21.us.us, align 8
  %mul22.us.us = fmul double %42, %alpha
  store double %mul22.us.us, double* %arrayidx21.us.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %for.body6.us.us ], [ %indvars.iv35.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv44
  %43 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv41
  %44 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %43, %44
  %45 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us = fadd double %45, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv44
  %46 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next36, i64 %indvars.iv41
  %47 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %46, %47
  %48 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.1 = fadd double %48, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count37.1
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %m, 0
  %cmp31 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %m to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %m to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
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

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}

; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  %2 = bitcast i8* %call1 to [1200 x double]*
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
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
  %0 = sext i32 %m to i64
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %n, -1
  %2 = sext i32 %m to i64
  %wide.trip.count14 = zext i32 %1 to i64
  %3 = and i64 %wide.trip.count14, 1
  %lcmp.mod33 = icmp eq i64 %3, 0
  %4 = icmp eq i32 %1, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv10 = phi i32 [ %indvars.iv.next11, %for.cond11.for.inc27_crit_edge.us ], [ -1, %for.cond1.preheader.us.preheader ]
  %5 = add i64 %indvars.iv16, 4294967295
  %6 = and i64 %5, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv16, 0
  br i1 %cmp21.us, label %for.body3.us.preheader, label %for.end.us

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us
  %wide.trip.count = zext i32 %indvars.iv10 to i64
  %7 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body3.us.prol, label %for.body3.us.prol.loopexit

for.body3.us.prol:                                ; preds = %for.body3.us.preheader
  %8 = trunc i64 %indvars.iv16 to i32
  %rem.us.prol = srem i32 %8, %m
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.us.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.us.preheader ]
  %9 = icmp eq i64 %6, 0
  br i1 %9, label %for.end.us, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv16
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %10 = trunc i64 %indvars.iv16 to i32
  %sub.us = add i32 %10, %n
  br i1 %lcmp.mod33, label %for.body14.us.prol, label %for.body14.us.prol.loopexit

for.body14.us.prol:                               ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv16, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol, %for.end.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 %4, label %for.cond11.for.inc27_crit_edge.us, label %for.end.us.new

for.end.us.new:                                   ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.unr.ph, %for.end.us.new ], [ %indvars.iv.next13.1, %for.body14.us ]
  %11 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %11
  %rem16.us = srem i32 %add15.us, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv18
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv12
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %12 = trunc i64 %indvars.iv.next13 to i32
  %add15.us.1 = sub i32 %sub.us, %12
  %rem16.us.1 = srem i32 %add15.us.1, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv18
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv.next13
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  br i1 %exitcond15.1, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %13 = add nuw nsw i64 %indvars.iv, %indvars.iv16
  %14 = trunc i64 %13 to i32
  %rem.us = srem i32 %14, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = add nuw nsw i64 %indvars.iv.next, %indvars.iv16
  %16 = trunc i64 %15 to i32
  %rem.us.1 = srem i32 %16, %m
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.body14.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next17 = add nuw i64 %indvars.iv16, 1
  %cmp.us = icmp slt i64 %indvars.iv.next17, %2
  %indvars.iv.next11 = add nsw i32 %indvars.iv10, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end29.loopexit

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv21 = phi i32 [ %indvars.iv.next22, %for.end ], [ -1, %for.cond1.preheader.preheader ]
  %17 = add i64 %indvars.iv25, 4294967295
  %18 = and i64 %17, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv25, 0
  br i1 %cmp21, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %wide.trip.count23 = zext i32 %indvars.iv21 to i64
  %19 = and i64 %17, 1
  %lcmp.mod35 = icmp eq i64 %19, 0
  br i1 %lcmp.mod35, label %for.body3.prol, label %for.body3.prol.loopexit

for.body3.prol:                                   ; preds = %for.body3.preheader
  %20 = trunc i64 %indvars.iv25 to i32
  %rem.prol = srem i32 %20, %m
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, %conv4
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.preheader
  %indvars.iv18.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  %21 = icmp eq i64 %18, 0
  br i1 %21, label %for.end, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next19.1, %for.body3 ]
  %22 = add nuw nsw i64 %indvars.iv18, %indvars.iv25
  %23 = trunc i64 %22 to i32
  %rem = srem i32 %23, %m
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %24 = add nuw nsw i64 %indvars.iv.next19, %indvars.iv25
  %25 = trunc i64 %24 to i32
  %rem.1 = srem i32 %25, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, %conv4
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next19
  store double %div.1, double* %arrayidx6.1, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  br i1 %exitcond24.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv25
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next26 = add nuw i64 %indvars.iv25, 1
  %cmp = icmp slt i64 %indvars.iv.next26, %0
  %indvars.iv.next22 = add nsw i32 %indvars.iv21, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end29.loopexit36

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit36:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit36, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %m, 0
  %cmp24 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp6, %cmp24
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = add i32 %m, -1
  %2 = sext i32 %n to i64
  %3 = sext i32 %m to i64
  %wide.trip.count37 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %0 to i64
  %4 = add nuw nsw i64 %wide.trip.count, 1
  %5 = and i64 %4, 8589934588
  %6 = add nsw i64 %5, -4
  %7 = lshr exact i64 %6, 2
  %8 = add nsw i64 %wide.trip.count37, -1
  %min.iters.check = icmp ult i64 %4, 4
  %n.vec = and i64 %4, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  %9 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %9, 0
  %10 = icmp eq i64 %7, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond1.for.inc30_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond1.for.inc30_crit_edge.us ], [ 1, %for.cond1.preheader.us.preheader ]
  %11 = sub i64 %wide.trip.count37, %indvars.iv41
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %cmp52.us = icmp slt i64 %indvars.iv.next42, %3
  br i1 %cmp52.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us8.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %xtraiter54 = and i64 %11, 1
  %lcmp.mod55 = icmp eq i64 %xtraiter54, 0
  %12 = icmp eq i64 %8, %indvars.iv41
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv41
  %indvars.iv.next36.prol = add nuw i64 %indvars.iv33, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us8.preheader:                ; preds = %for.cond1.preheader.us
  br i1 %min.iters.check, label %for.cond4.preheader.us8.preheader52, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us8.preheader
  br i1 %cmp.zero, label %for.cond4.preheader.us8.preheader52, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.ph
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 0
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %14, align 8
  %15 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load49.prol = load <2 x double>, <2 x double>* %16, align 8
  %17 = fmul <2 x double> %wide.load.prol, %broadcast.splat51
  %18 = fmul <2 x double> %wide.load49.prol, %broadcast.splat51
  %19 = bitcast double* %13 to <2 x double>*
  store <2 x double> %17, <2 x double>* %19, align 8
  %20 = bitcast double* %15 to <2 x double>*
  store <2 x double> %18, <2 x double>* %20, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br i1 %10, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %index
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %22, align 8
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %24, align 8
  %25 = fmul <2 x double> %wide.load, %broadcast.splat51
  %26 = fmul <2 x double> %wide.load49, %broadcast.splat51
  %27 = bitcast double* %21 to <2 x double>*
  store <2 x double> %25, <2 x double>* %27, align 8
  %28 = bitcast double* %23 to <2 x double>*
  store <2 x double> %26, <2 x double>* %28, align 8
  %index.next = add i64 %index, 4
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %index.next
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load49.1 = load <2 x double>, <2 x double>* %32, align 8
  %33 = fmul <2 x double> %wide.load.1, %broadcast.splat51
  %34 = fmul <2 x double> %wide.load49.1, %broadcast.splat51
  %35 = bitcast double* %29 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8
  %36 = bitcast double* %31 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8
  %index.next.1 = add i64 %index, 8
  %37 = icmp eq i64 %index.next.1, %n.vec
  br i1 %37, label %middle.block.loopexit, label %vector.body, !llvm.loop !1

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us8.preheader52

for.cond4.preheader.us8.preheader52:              ; preds = %middle.block, %min.iters.checked, %for.cond4.preheader.us8.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us8.preheader ], [ %n.vec, %middle.block ]
  br label %for.cond4.preheader.us8

for.cond4.preheader.us8:                          ; preds = %for.cond4.preheader.us8.preheader52, %for.cond4.preheader.us8
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond4.preheader.us8 ], [ %indvars.iv.ph, %for.cond4.preheader.us8.preheader52 ]
  %arrayidx21.us12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv
  %38 = load double, double* %arrayidx21.us12, align 8
  %mul22.us13 = fmul double %38, %alpha
  store double %mul22.us13, double* %arrayidx21.us12, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit56, label %for.cond4.preheader.us8, !llvm.loop !4

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit56:      ; preds = %for.cond4.preheader.us8
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit56, %for.cond1.for.inc30_crit_edge.us.loopexit, %middle.block
  %39 = icmp slt i64 %indvars.iv.next42, %3
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br i1 %39, label %for.cond1.preheader.us, label %for.end32.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv41, i64 %indvars.iv39
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br i1 %lcmp.mod55, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %40 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv39
  %41 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %40, %41
  %add17.us.us.prol = fadd double %.pre, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol ], [ undef, %for.cond4.preheader.us.us ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol ], [ %.pre, %for.cond4.preheader.us.us ]
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.body6.us.us.prol ], [ %indvars.iv33, %for.cond4.preheader.us.us ]
  br i1 %12, label %for.cond4.for.end_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.cond4.for.end_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.body6.us.us.prol.loopexit ], [ %add17.us.us.1, %for.cond4.for.end_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next40, %2
  br i1 %cmp2.us.us, label %for.cond4.preheader.us.us, label %for.cond1.for.inc30_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %42 = phi double [ %.unr.ph, %for.cond4.preheader.us.us.new ], [ %add17.us.us.1, %for.body6.us.us ]
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next36.1, %for.body6.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv41
  %43 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv39
  %44 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %43, %44
  %add17.us.us = fadd double %42, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36 = add nuw i64 %indvars.iv35, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv41
  %45 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next36, i64 %indvars.iv39
  %46 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %45, %46
  %add17.us.us.1 = fadd double %add17.us.us, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %exitcond38.1 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  %indvars.iv.next36.1 = add i64 %indvars.iv35, 2
  br i1 %exitcond38.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
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
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, %4
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}

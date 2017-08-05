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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %arraydecay3 = bitcast i8* %call to [1000 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %B.addr = alloca [1200 x double]*, align 8
  store [1200 x double]* %B, [1200 x double]** %B.addr, align 8
  store double 1.500000e+00, double* %alpha, align 8
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp124 = icmp sgt i32 %n, 0
  %conv18 = sitofp i32 %n to double
  %0 = load [1200 x double]*, [1200 x double]** %B.addr, align 8
  %conv4 = sitofp i32 %m to double
  br i1 %cmp124, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %1 = sext i32 %m to i64
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %n, -1
  %3 = sext i32 %m to i64
  %wide.trip.count14 = zext i32 %2 to i64
  %4 = and i64 %wide.trip.count14, 1
  %lcmp.mod30 = icmp eq i64 %4, 0
  %5 = icmp eq i32 %2, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv10 = phi i32 [ %indvars.iv.next11, %for.cond11.for.inc27_crit_edge.us ], [ -1, %for.cond1.preheader.us.preheader ]
  %6 = add nuw nsw i64 %indvars.iv16, 4294967295
  %7 = and i64 %6, 4294967295
  %cmp23.us = icmp sgt i64 %indvars.iv16, 0
  br i1 %cmp23.us, label %for.body3.us.preheader, label %for.end.us

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us
  %wide.trip.count = zext i32 %indvars.iv10 to i64
  %8 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.preheader, label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader
  %9 = trunc i64 %indvars.iv16 to i32
  %rem.us.prol = srem i32 %9, %m
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.us.preheader, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.us.preheader ]
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %7, 0
  br i1 %10, label %for.end.us.loopexit, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body3.us
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body3.us.prol.loopexit, %for.end.us.loopexit.unr-lcssa
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv16
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %11 = trunc i64 %indvars.iv16 to i32
  %sub.us = add i32 %11, %n
  br i1 %lcmp.mod30, label %for.body14.us.prol.preheader, label %for.body14.us.prol.loopexit.unr-lcssa

for.body14.us.prol.preheader:                     ; preds = %for.end.us
  br label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.body14.us.prol.preheader
  %rem16.us.prol = srem i32 %sub.us, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit.unr-lcssa

for.body14.us.prol.loopexit.unr-lcssa:            ; preds = %for.end.us, %for.body14.us.prol
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol.loopexit.unr-lcssa
  br i1 %5, label %for.cond11.for.inc27_crit_edge.us, label %for.end.us.new

for.end.us.new:                                   ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us.new
  %indvars.iv12 = phi i64 [ %indvars.iv12.unr.ph, %for.end.us.new ], [ %indvars.iv.next13.1, %for.body14.us ]
  %12 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %12
  %rem16.us = srem i32 %add15.us, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv12
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %13 = trunc i64 %indvars.iv.next13 to i32
  %add15.us.1 = sub i32 %sub.us, %13
  %rem16.us.1 = srem i32 %add15.us.1, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i1.1 = insertelement <2 x double> undef, double %conv18, i32 0
  %div19.us.v.i1.2 = insertelement <2 x double> %div19.us.v.i1.1, double %conv18, i32 1
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, %div19.us.v.i1.2
  %14 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %14, align 8
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13, %wide.trip.count14
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  br i1 %exitcond15.1, label %for.cond11.for.inc27_crit_edge.us.unr-lcssa, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %15 = add nuw nsw i64 %indvars.iv, %indvars.iv16
  %16 = trunc i64 %15 to i32
  %rem.us = srem i32 %16, %m
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = add nuw nsw i64 %indvars.iv.next, %indvars.iv16
  %18 = trunc i64 %17 to i32
  %rem.us.1 = srem i32 %18, %m
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.us.v.i1.2 = insertelement <2 x double> %div.us.v.i1.1, double %conv4, i32 1
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, %div.us.v.i1.2
  %19 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %19, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body3.us

for.cond11.for.inc27_crit_edge.us.unr-lcssa:      ; preds = %for.body14.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.body14.us.prol.loopexit, %for.cond11.for.inc27_crit_edge.us.unr-lcssa
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %indvars.iv.next11 = add nsw i32 %indvars.iv10, 1
  %exitcond = icmp ne i64 %indvars.iv.next17, %3
  br i1 %exitcond, label %for.cond1.preheader.us, label %for.end29.loopexit

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv21 = phi i32 [ %indvars.iv.next22, %for.end ], [ -1, %for.cond1.preheader.preheader ]
  %20 = add nuw nsw i64 %indvars.iv25, 4294967295
  %21 = and i64 %20, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv25, 0
  br i1 %cmp23, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %wide.trip.count23 = zext i32 %indvars.iv21 to i64
  %22 = and i64 %20, 1
  %lcmp.mod32 = icmp eq i64 %22, 0
  br i1 %lcmp.mod32, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader
  %23 = trunc i64 %indvars.iv25 to i32
  %rem.prol = srem i32 %23, %m
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, %conv4
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol
  %indvars.iv18.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  %24 = icmp eq i64 %21, 0
  br i1 %24, label %for.end.loopexit, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next19.1, %for.body3 ]
  %25 = add nuw nsw i64 %indvars.iv18, %indvars.iv25
  %26 = trunc i64 %25 to i32
  %rem = srem i32 %26, %m
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %27 = add nuw nsw i64 %indvars.iv.next19, %indvars.iv25
  %28 = trunc i64 %27 to i32
  %rem.1 = srem i32 %28, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv4, i32 1
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %29 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %29, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  br i1 %exitcond24.1, label %for.end.loopexit.unr-lcssa, label %for.body3

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv25
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %indvars.iv.next22 = add nsw i32 %indvars.iv21, 1
  %exitcond33 = icmp ne i64 %indvars.iv.next26, %1
  br i1 %exitcond33, label %for.cond1.preheader, label %for.end29.loopexit28

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit28:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit28, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %A.addr = alloca [1000 x double]*, align 8
  %k = alloca i32, align 4
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  %cmp9 = icmp sgt i32 %m, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end32

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp26 = icmp sgt i32 %n, 0
  %0 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond.for.end32_crit_edge_crit_edge

for.cond1.preheader.lr.ph.for.cond.for.end32_crit_edge_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  br label %for.cond.for.end32_crit_edge

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %n, -1
  %2 = add i32 %m, -2
  %3 = add i32 %m, -1
  %4 = sext i32 %n to i64
  %5 = sext i32 %m to i64
  %6 = sext i32 %m to i64
  %wide.trip.count51 = sext i32 %3 to i64
  %wide.trip.count = zext i32 %1 to i64
  %7 = add nuw nsw i64 %wide.trip.count, 1
  %8 = and i64 %7, 8589934588
  %9 = add nsw i64 %8, -4
  %10 = lshr exact i64 %9, 2
  %11 = add nsw i64 %wide.trip.count51, -1
  %min.iters.check = icmp ult i64 %7, 4
  %n.vec = and i64 %7, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert61 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat62 = shufflevector <2 x double> %broadcast.splatinsert61, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = and i64 %10, 1
  %lcmp.mod = icmp eq i64 %12, 0
  %13 = icmp eq i64 %10, 0
  %cmp.n = icmp eq i64 %7, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.us.preheader ]
  %indvars.iv49 = phi i32 [ %indvars.iv.next50, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ %2, %for.cond1.preheader.us.preheader ]
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 2, %for.cond1.preheader.us.preheader ]
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 1, %for.cond1.preheader.us.preheader ]
  %14 = sub i64 %wide.trip.count51, %indvars.iv55
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %cmp54.us = icmp slt i64 %indvars.iv.next56, %6
  br i1 %cmp54.us, label %for.cond4.preheader.us.us.preheader, label %for.cond1.preheader.us.for.cond4.preheader.us14_crit_edge

for.cond1.preheader.us.for.cond4.preheader.us14_crit_edge: ; preds = %for.cond1.preheader.us
  br i1 %min.iters.check, label %for.cond4.preheader.us14.preheader, label %min.iters.checked

for.cond4.preheader.us14.preheader:               ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us.for.cond4.preheader.us14_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us.for.cond4.preheader.us14_crit_edge ], [ %n.vec, %middle.block ]
  br label %for.cond4.preheader.us14

min.iters.checked:                                ; preds = %for.cond1.preheader.us.for.cond4.preheader.us14_crit_edge
  br i1 %cmp.zero, label %for.cond4.preheader.us14.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.ph
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 0
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %16, align 8
  %17 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load60.prol = load <2 x double>, <2 x double>* %18, align 8
  %19 = fmul <2 x double> %wide.load.prol, %broadcast.splat62
  %20 = fmul <2 x double> %wide.load60.prol, %broadcast.splat62
  %21 = bitcast double* %15 to <2 x double>*
  store <2 x double> %19, <2 x double>* %21, align 8
  %22 = bitcast double* %17 to <2 x double>*
  store <2 x double> %20, <2 x double>* %22, align 8
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.ph, %vector.body.prol
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 %13, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %24, align 8
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %26, align 8
  %27 = fmul <2 x double> %wide.load, %broadcast.splat62
  %28 = fmul <2 x double> %wide.load60, %broadcast.splat62
  %29 = bitcast double* %23 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8
  %30 = bitcast double* %25 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8
  %index.next = add i64 %index, 4
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %index.next
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %32, align 8
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load60.1 = load <2 x double>, <2 x double>* %34, align 8
  %35 = fmul <2 x double> %wide.load.1, %broadcast.splat62
  %36 = fmul <2 x double> %wide.load60.1, %broadcast.splat62
  %37 = bitcast double* %31 to <2 x double>*
  store <2 x double> %35, <2 x double>* %37, align 8
  %38 = bitcast double* %33 to <2 x double>*
  store <2 x double> %36, <2 x double>* %38, align 8
  %index.next.1 = add i64 %index, 8
  %39 = icmp eq i64 %index.next.1, %n.vec
  br i1 %39, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !1

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us14.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %40 = zext i32 %indvars.iv49 to i64
  %xtraiter64 = and i64 %14, 1
  %lcmp.mod65 = icmp eq i64 %xtraiter64, 0
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv43, i64 %indvars.iv55
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv43, 1
  %41 = icmp eq i64 %11, %indvars.iv55
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us14:                         ; preds = %for.cond4.preheader.us14.preheader, %for.cond4.preheader.us14
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.cond4.preheader.us14 ], [ %indvars.iv.ph, %for.cond4.preheader.us14.preheader ]
  %arrayidx21.us19 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv
  %42 = load double, double* %arrayidx21.us19, align 8
  %mul22.us20 = fmul double %42, %alpha
  store double %mul22.us20, double* %arrayidx21.us19, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit63, label %for.cond4.preheader.us14, !llvm.loop !4

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  %43 = add i64 %indvars.iv47, %40
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit63:      ; preds = %for.cond4.preheader.us14
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit63, %for.cond1.for.inc30_crit_edge.us.loopexit, %middle.block
  %storemerge2.lcssa8.lcssa.us.in = phi i64 [ %indvars.iv.next56, %middle.block ], [ %43, %for.cond1.for.inc30_crit_edge.us.loopexit ], [ %indvars.iv.next56, %for.cond1.for.inc30_crit_edge.us.loopexit63 ]
  %cmp.us = icmp slt i64 %indvars.iv.next56, %5
  br i1 %cmp.us, label %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge, label %for.cond.for.end32_crit_edge.loopexit

for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc30_crit_edge.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %indvars.iv.next48 = add nuw i64 %indvars.iv47, 1
  %indvars.iv.next50 = add i32 %indvars.iv49, -1
  br label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next54, %for.cond4.for.end_crit_edge.us.us ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv53
  br i1 %lcmp.mod65, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.cond4.preheader.us.us
  br label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader
  %44 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv43, i64 %indvars.iv53
  %45 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %44, %45
  %46 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %mul.us.us.prol, %46
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.cond4.preheader.us.us, %for.body6.us.us.prol
  %indvars.iv45.unr.ph = phi i64 [ %indvars.iv.next46.prol, %for.body6.us.us.prol ], [ %indvars.iv43, %for.cond4.preheader.us.us ]
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br i1 %41, label %for.cond4.for.end_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.unr-lcssa:      ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us.prol.loopexit, %for.cond4.for.end_crit_edge.us.us.unr-lcssa
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv53
  %47 = load double, double* %arrayidx21.us.us, align 8
  %mul22.us.us = fmul double %47, %alpha
  store double %mul22.us.us, double* %arrayidx21.us.us, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond66 = icmp ne i64 %indvars.iv.next54, %4
  br i1 %exitcond66, label %for.cond4.preheader.us.us, label %for.cond1.for.inc30_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv45.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next46.1, %for.body6.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv55
  %48 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv53
  %49 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %50 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us = fadd double %mul.us.us, %50
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv.next46, i64 %indvars.iv55
  %51 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next46, i64 %indvars.iv53
  %52 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %53 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.1 = fadd double %mul.us.us.1, %53
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %exitcond52.1 = icmp eq i64 %indvars.iv.next46, %wide.trip.count51
  %indvars.iv.next46.1 = add i64 %indvars.iv45, 2
  br i1 %exitcond52.1, label %for.cond4.for.end_crit_edge.us.us.unr-lcssa, label %for.body6.us.us

for.cond.for.end32_crit_edge.loopexit:            ; preds = %for.cond1.for.inc30_crit_edge.us
  %storemerge2.lcssa8.lcssa.us = trunc i64 %storemerge2.lcssa8.lcssa.us.in to i32
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge:                     ; preds = %for.cond1.preheader.lr.ph.for.cond.for.end32_crit_edge_crit_edge, %for.cond.for.end32_crit_edge.loopexit
  %storemerge2.lcssa8.lcssa12.lcssa = phi i32 [ %storemerge2.lcssa8.lcssa.us, %for.cond.for.end32_crit_edge.loopexit ], [ %k.promoted, %for.cond1.preheader.lr.ph.for.cond.for.end32_crit_edge_crit_edge ]
  store i32 %storemerge2.lcssa8.lcssa12.lcssa, i32* %k, align 4
  br label %for.end32

for.end32:                                        ; preds = %entry, %for.cond.for.end32_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %m, 0
  %cmp32 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp4, %cmp32
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = sext i32 %m to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv9, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp ne i64 %indvars.iv.next10, %4
  br i1 %exitcond12, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}

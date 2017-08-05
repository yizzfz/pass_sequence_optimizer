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
  call fastcc void @init_array(double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc27, %entry
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc27 ], [ 0, %entry ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.inc27 ], [ -1, %entry ]
  %0 = add nuw nsw i64 %indvars.iv34, 4294967295
  %1 = and i64 %0, 4294967295
  %cmp222 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp222, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %wide.trip.count = zext i32 %indvars.iv28 to i64
  %2 = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %2, 0
  br i1 %lcmp.mod, label %for.body3.prol.preheader, label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.preheader
  %3 = trunc i64 %indvars.iv34 to i32
  %rem.prol = srem i32 %3, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %1, 0
  br i1 %4, label %for.end.loopexit, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3 ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv34
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv34
  %8 = trunc i64 %7 to i32
  %rem.1 = srem i32 %8, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.000000e+03
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx6.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body3

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  store double 1.000000e+00, double* %arrayidx10, align 8
  %9 = add nuw nsw i64 %indvars.iv34, 1200
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.end
  %indvars.iv30 = phi i64 [ 0, %for.end ], [ %indvars.iv.next31.1, %for.body14 ]
  %10 = sub nuw nsw i64 %9, %indvars.iv30
  %11 = trunc i64 %10 to i32
  %rem16 = srem i32 %11, 1200
  %conv17 = sitofp i32 %rem16 to double
  %div19 = fdiv double %conv17, 1.200000e+03
  %arrayidx23 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv34, i64 %indvars.iv30
  store double %div19, double* %arrayidx23, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %12 = sub nuw nsw i64 %9, %indvars.iv.next31
  %13 = trunc i64 %12 to i32
  %rem16.1 = srem i32 %13, 1200
  %conv17.1 = sitofp i32 %rem16.1 to double
  %div19.1 = fdiv double %conv17.1, 1.200000e+03
  %arrayidx23.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv34, i64 %indvars.iv.next31
  store double %div19.1, double* %arrayidx23.1, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31, 1199
  %indvars.iv.next31.1 = add nuw nsw i64 %indvars.iv30, 2
  br i1 %exitcond33.1, label %for.inc27, label %for.body14

for.inc27:                                        ; preds = %for.body14
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %indvars.iv.next29 = add nsw i32 %indvars.iv28, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond1, label %for.end29, label %for.cond1.preheader

for.end29:                                        ; preds = %for.inc27
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond.loopexit.loopexit:                       ; preds = %for.end.us
  br label %for.cond.loopexit

for.cond.loopexit.loopexit8:                      ; preds = %vector.body
  br label %for.cond.loopexit

for.cond.loopexit:                                ; preds = %for.cond.loopexit.loopexit8, %for.cond.loopexit.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond7, label %for.end32, label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond.loopexit, %entry
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.cond.loopexit ], [ 0, %entry ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond.loopexit ], [ 1, %entry ]
  %0 = sub nuw nsw i64 999, %indvars.iv29
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %cmp518 = icmp slt i64 %indvars.iv.next30, 1000
  br i1 %cmp518, label %for.cond4.preheader.us.preheader, label %vector.ph

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %1 = icmp eq i64 %indvars.iv29, 998
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv29
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv22, 1
  br label %for.cond4.preheader.us

vector.ph:                                        ; preds = %for.cond1.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.2, %vector.body ]
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %index
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %3, align 8
  %4 = getelementptr double, double* %2, i64 2
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load3 = load <2 x double>, <2 x double>* %5, align 8
  %6 = fmul <2 x double> %wide.load, %broadcast.splat5
  %7 = fmul <2 x double> %wide.load3, %broadcast.splat5
  %8 = bitcast double* %2 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8
  %9 = bitcast double* %4 to <2 x double>*
  store <2 x double> %7, <2 x double>* %9, align 8
  %index.next = add nuw nsw i64 %index, 4
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %index.next
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %11, align 8
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load3.1 = load <2 x double>, <2 x double>* %13, align 8
  %14 = fmul <2 x double> %wide.load.1, %broadcast.splat5
  %15 = fmul <2 x double> %wide.load3.1, %broadcast.splat5
  %16 = bitcast double* %10 to <2 x double>*
  store <2 x double> %14, <2 x double>* %16, align 8
  %17 = bitcast double* %12 to <2 x double>*
  store <2 x double> %15, <2 x double>* %17, align 8
  %index.next.1 = add nuw nsw i64 %index, 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %index.next.1
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load.2 = load <2 x double>, <2 x double>* %19, align 8
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load3.2 = load <2 x double>, <2 x double>* %21, align 8
  %22 = fmul <2 x double> %wide.load.2, %broadcast.splat5
  %23 = fmul <2 x double> %wide.load3.2, %broadcast.splat5
  %24 = bitcast double* %18 to <2 x double>*
  store <2 x double> %22, <2 x double>* %24, align 8
  %25 = bitcast double* %20 to <2 x double>*
  store <2 x double> %23, <2 x double>* %25, align 8
  %index.next.2 = add nuw nsw i64 %index, 12
  %26 = icmp eq i64 %index.next.2, 1200
  br i1 %26, label %for.cond.loopexit.loopexit8, label %vector.body, !llvm.loop !1

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.end.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.end.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv27
  %.pre = load double, double* %arrayidx16.us, align 8
  br i1 %lcmp.mod, label %for.body6.us.prol.loopexit.unr-lcssa, label %for.body6.us.prol.preheader

for.body6.us.prol.preheader:                      ; preds = %for.cond4.preheader.us
  br label %for.body6.us.prol

for.body6.us.prol:                                ; preds = %for.body6.us.prol.preheader
  %27 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv27
  %28 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %27, %28
  %add17.us.prol = fadd double %.pre, %mul.us.prol
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit.unr-lcssa

for.body6.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond4.preheader.us, %for.body6.us.prol
  %add17.us.lcssa.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol ], [ undef, %for.cond4.preheader.us ]
  %.unr.ph = phi double [ %add17.us.prol, %for.body6.us.prol ], [ %.pre, %for.cond4.preheader.us ]
  %indvars.iv24.unr.ph = phi i64 [ %indvars.iv.next25.prol, %for.body6.us.prol ], [ %indvars.iv22, %for.cond4.preheader.us ]
  br label %for.body6.us.prol.loopexit

for.body6.us.prol.loopexit:                       ; preds = %for.body6.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.end.us, label %for.cond4.preheader.us.new

for.cond4.preheader.us.new:                       ; preds = %for.body6.us.prol.loopexit
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us, %for.cond4.preheader.us.new
  %29 = phi double [ %.unr.ph, %for.cond4.preheader.us.new ], [ %add17.us.1, %for.body6.us ]
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr.ph, %for.cond4.preheader.us.new ], [ %indvars.iv.next25.1, %for.body6.us ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv29
  %30 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv24, i64 %indvars.iv27
  %31 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %30, %31
  %add17.us = fadd double %29, %mul.us
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next25 = add nuw i64 %indvars.iv24, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv29
  %32 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next25, i64 %indvars.iv27
  %33 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %32, %33
  %add17.us.1 = fadd double %add17.us, %mul.us.1
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %exitcond26.1 = icmp eq i64 %indvars.iv.next25, 999
  %indvars.iv.next25.1 = add i64 %indvars.iv24, 2
  br i1 %exitcond26.1, label %for.end.us.unr-lcssa, label %for.body6.us

for.end.us.unr-lcssa:                             ; preds = %for.body6.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.body6.us.prol.loopexit, %for.end.us.unr-lcssa
  %add17.us.lcssa = phi double [ %add17.us.lcssa.unr.ph, %for.body6.us.prol.loopexit ], [ %add17.us.1, %for.end.us.unr-lcssa ]
  %mul22.us = fmul double %add17.us.lcssa, %alpha
  store double %mul22.us, double* %arrayidx16.us, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond6, label %for.cond.loopexit.loopexit, label %for.cond4.preheader.us

for.end32:                                        ; preds = %for.cond.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}

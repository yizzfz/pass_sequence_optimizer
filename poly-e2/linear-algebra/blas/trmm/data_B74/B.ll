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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  tail call fastcc void @kernel_trmm(double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  tail call fastcc void @print_array([1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc27.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv815.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next9.us, %for.inc27.us ]
  %exitcond10.us = icmp eq i64 %indvars.iv815.us, 0
  br i1 %exitcond10.us, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us
  %xtraiter = and i64 %indvars.iv815.us, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.preheader
  %0 = trunc i64 %indvars.iv815.us to i32
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv815.us, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.us.preheader
  %indvars.iv11.us.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.us.preheader ]
  %1 = icmp eq i64 %indvars.iv815.us, 1
  br i1 %1, label %for.end.us, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv11.us = phi i64 [ %indvars.iv11.us.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.us.1, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv11.us, %indvars.iv815.us
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv815.us, i64 %indvars.iv11.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %4 = add nuw nsw i64 %indvars.iv.next.us, %indvars.iv815.us
  %5 = trunc i64 %4 to i32
  %rem.us.1 = srem i32 %5, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv815.us, i64 %indvars.iv.next.us
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv11.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, %indvars.iv815.us
  br i1 %exitcond.us.1, label %for.end.us, label %for.body3.us

for.end.us:                                       ; preds = %for.body3.us.prol.loopexit, %for.body3.us, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv815.us, i64 %indvars.iv815.us
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %6 = add nuw nsw i64 %indvars.iv815.us, 1200
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us
  %indvars.iv413.us = phi i64 [ 0, %for.end.us ], [ %indvars.iv.next5.us.1, %for.body14.us ]
  %7 = sub nuw nsw i64 %6, %indvars.iv413.us
  %8 = trunc i64 %7 to i32
  %rem16.us = srem i32 %8, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv815.us, i64 %indvars.iv413.us
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next5.us = or i64 %indvars.iv413.us, 1
  %9 = sub nuw nsw i64 %6, %indvars.iv.next5.us
  %10 = trunc i64 %9 to i32
  %rem16.us.1 = srem i32 %10, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, 1.200000e+03
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv815.us, i64 %indvars.iv.next5.us
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %exitcond17.1 = icmp eq i64 %indvars.iv.next5.us, 1199
  %indvars.iv.next5.us.1 = add nsw i64 %indvars.iv413.us, 2
  br i1 %exitcond17.1, label %for.inc27.us, label %for.body14.us

for.inc27.us:                                     ; preds = %for.body14.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv815.us, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond19, label %for.end29, label %for.cond1.preheader.us

for.end29:                                        ; preds = %for.inc27.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  %broadcast.splatinsert4 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat5 = shufflevector <2 x double> %broadcast.splatinsert4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc30.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv513.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next6.us, %for.inc30.us ]
  %0 = sub i64 999, %indvars.iv513.us
  %exitcond8.us = icmp eq i64 %indvars.iv513.us, 999
  br i1 %exitcond8.us, label %vector.ph, label %for.cond4.preheader.us15.preheader

for.cond4.preheader.us15.preheader:               ; preds = %for.cond1.preheader.us
  %xtraiter = and i64 %0, 1
  %indvars.iv.next29.us20.prol = add nuw nsw i64 %indvars.iv513.us, 1
  %arrayidx8.us21.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next29.us20.prol, i64 %indvars.iv513.us
  br label %for.cond4.preheader.us15

vector.ph:                                        ; preds = %for.cond1.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.2, %vector.body ]
  %1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 999, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load3 = load <2 x double>, <2 x double>* %4, align 8
  %5 = fmul <2 x double> %wide.load, %broadcast.splat5
  %6 = fmul <2 x double> %wide.load3, %broadcast.splat5
  store <2 x double> %5, <2 x double>* %2, align 8
  store <2 x double> %6, <2 x double>* %4, align 8
  %index.next = add nuw nsw i64 %index, 4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 999, i64 %index.next
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %8, align 8
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load3.1 = load <2 x double>, <2 x double>* %10, align 8
  %11 = fmul <2 x double> %wide.load.1, %broadcast.splat5
  %12 = fmul <2 x double> %wide.load3.1, %broadcast.splat5
  store <2 x double> %11, <2 x double>* %8, align 8
  store <2 x double> %12, <2 x double>* %10, align 8
  %index.next.1 = add nsw i64 %index, 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 999, i64 %index.next.1
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load.2 = load <2 x double>, <2 x double>* %14, align 8
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load3.2 = load <2 x double>, <2 x double>* %16, align 8
  %17 = fmul <2 x double> %wide.load.2, %broadcast.splat5
  %18 = fmul <2 x double> %wide.load3.2, %broadcast.splat5
  store <2 x double> %17, <2 x double>* %14, align 8
  store <2 x double> %18, <2 x double>* %16, align 8
  %index.next.2 = add nsw i64 %index, 12
  %19 = icmp eq i64 %index.next.2, 1200
  br i1 %19, label %for.inc30.us, label %vector.body, !llvm.loop !1

for.cond4.preheader.us15:                         ; preds = %for.cond4.preheader.us15.preheader, %for.end.us28
  %indvars.iv311.us16 = phi i64 [ %indvars.iv.next4.us31, %for.end.us28 ], [ 0, %for.cond4.preheader.us15.preheader ]
  %20 = icmp eq i64 %xtraiter, 0
  %arrayidx16.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv513.us, i64 %indvars.iv311.us16
  %.pre = load double, double* %arrayidx16.us18, align 8
  br i1 %20, label %for.body6.us19.prol.loopexit, label %for.body6.us19.prol

for.body6.us19.prol:                              ; preds = %for.cond4.preheader.us15
  %21 = load double, double* %arrayidx8.us21.prol, align 8
  %arrayidx12.us22.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next29.us20.prol, i64 %indvars.iv311.us16
  %22 = load double, double* %arrayidx12.us22.prol, align 8
  %mul.us23.prol = fmul double %21, %22
  %add17.us24.prol = fadd double %.pre, %mul.us23.prol
  store double %add17.us24.prol, double* %arrayidx16.us18, align 8
  br label %for.body6.us19.prol.loopexit

for.body6.us19.prol.loopexit:                     ; preds = %for.body6.us19.prol, %for.cond4.preheader.us15
  %add17.us24.lcssa.unr.ph = phi double [ %add17.us24.prol, %for.body6.us19.prol ], [ undef, %for.cond4.preheader.us15 ]
  %.unr.ph = phi double [ %add17.us24.prol, %for.body6.us19.prol ], [ %.pre, %for.cond4.preheader.us15 ]
  %indvars.iv.next29.us20.in.unr.ph = phi i64 [ %indvars.iv.next29.us20.prol, %for.body6.us19.prol ], [ %indvars.iv513.us, %for.cond4.preheader.us15 ]
  %23 = icmp eq i64 %indvars.iv513.us, 998
  br i1 %23, label %for.end.us28, label %for.cond4.preheader.us15.new

for.cond4.preheader.us15.new:                     ; preds = %for.body6.us19.prol.loopexit
  br label %for.body6.us19

for.body6.us19:                                   ; preds = %for.body6.us19, %for.cond4.preheader.us15.new
  %24 = phi double [ %.unr.ph, %for.cond4.preheader.us15.new ], [ %add17.us24.1, %for.body6.us19 ]
  %indvars.iv.next29.us20.in = phi i64 [ %indvars.iv.next29.us20.in.unr.ph, %for.cond4.preheader.us15.new ], [ %indvars.iv.next29.us20.1, %for.body6.us19 ]
  %indvars.iv.next29.us20 = add nuw nsw i64 %indvars.iv.next29.us20.in, 1
  %arrayidx8.us21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next29.us20, i64 %indvars.iv513.us
  %25 = load double, double* %arrayidx8.us21, align 8
  %arrayidx12.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next29.us20, i64 %indvars.iv311.us16
  %26 = load double, double* %arrayidx12.us22, align 8
  %mul.us23 = fmul double %25, %26
  %add17.us24 = fadd double %24, %mul.us23
  store double %add17.us24, double* %arrayidx16.us18, align 8
  %indvars.iv.next29.us20.1 = add nsw i64 %indvars.iv.next29.us20.in, 2
  %arrayidx8.us21.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next29.us20.1, i64 %indvars.iv513.us
  %27 = load double, double* %arrayidx8.us21.1, align 8
  %arrayidx12.us22.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next29.us20.1, i64 %indvars.iv311.us16
  %28 = load double, double* %arrayidx12.us22.1, align 8
  %mul.us23.1 = fmul double %27, %28
  %add17.us24.1 = fadd double %add17.us24, %mul.us23.1
  store double %add17.us24.1, double* %arrayidx16.us18, align 8
  %exitcond.us26.1 = icmp eq i64 %indvars.iv.next29.us20.1, 999
  br i1 %exitcond.us26.1, label %for.end.us28, label %for.body6.us19

for.end.us28:                                     ; preds = %for.body6.us19, %for.body6.us19.prol.loopexit
  %add17.us24.lcssa = phi double [ %add17.us24.lcssa.unr.ph, %for.body6.us19.prol.loopexit ], [ %add17.us24.1, %for.body6.us19 ]
  %mul22.us30 = fmul double %add17.us24.lcssa, %alpha
  store double %mul22.us30, double* %arrayidx16.us18, align 8
  %indvars.iv.next4.us31 = add nuw nsw i64 %indvars.iv311.us16, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next4.us31, 1200
  br i1 %exitcond37, label %for.inc30.us, label %for.cond4.preheader.us15

for.inc30.us:                                     ; preds = %for.end.us28, %vector.body
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv513.us, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond38, label %for.end32, label %for.cond1.preheader.us

for.end32:                                        ; preds = %for.inc30.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %B) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc10.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.inc10.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv28.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv6.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond10, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}

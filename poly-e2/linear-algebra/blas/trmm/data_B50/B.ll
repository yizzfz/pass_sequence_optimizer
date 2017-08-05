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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) #0 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond11.for.inc27_crit_edge.us, %for.body.us.preheader
  %indvars.iv14 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next15, %for.cond11.for.inc27_crit_edge.us ]
  %cmp21.us = icmp sgt i64 %indvars.iv14, 0
  br i1 %cmp21.us, label %for.body3.us.preheader, label %for.end.us

for.body3.us.preheader:                           ; preds = %for.body.us
  %xtraiter = and i64 %indvars.iv14, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader
  %0 = trunc i64 %indvars.iv14 to i32
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.us.preheader, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.us.preheader ]
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  %1 = icmp eq i64 %indvars.iv14, 1
  br i1 %1, label %for.end.us.loopexit, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.end.us.loopexit.unr-lcssa:                    ; preds = %for.body3.us
  br label %for.end.us.loopexit

for.end.us.loopexit:                              ; preds = %for.body3.us.prol.loopexit, %for.end.us.loopexit.unr-lcssa
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv14
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %2 = trunc i64 %indvars.iv14 to i32
  %sub.us = add i32 %2, 1200
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us, %for.end.us
  %indvars.iv10 = phi i64 [ 0, %for.end.us ], [ %indvars.iv.next11.1, %for.body14.us ]
  %3 = trunc i64 %indvars.iv10 to i32
  %add15.us = sub nuw nsw i32 %sub.us, %3
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.200000e+03
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv10
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %4 = trunc i64 %indvars.iv.next11 to i32
  %add15.us.1 = sub nuw nsw i32 %sub.us, %4
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, 1.200000e+03
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv14, i64 %indvars.iv.next11
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next11.1, 1200
  br i1 %exitcond13.1, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv14
  br i1 %exitcond.1, label %for.end.us.loopexit.unr-lcssa, label %for.body3.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.body14.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond17, label %for.end29, label %for.body.us

for.end29:                                        ; preds = %for.cond11.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) #0 {
for.body.us.preheader:
  %broadcast.splatinsert61 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat62 = shufflevector <2 x double> %broadcast.splatinsert61, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc30_crit_edge.us, %for.body.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next53, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv38 = phi i64 [ 1, %for.body.us.preheader ], [ %indvars.iv.next39, %for.cond1.for.inc30_crit_edge.us ]
  %0 = sub i64 999, %indvars.iv52
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %cmp51.us = icmp slt i64 %indvars.iv.next53, 1000
  br i1 %cmp51.us, label %for.body3.us.us.preheader, label %vector.ph

for.body3.us.us.preheader:                        ; preds = %for.body.us
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %1 = icmp eq i64 %indvars.iv52, 998
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv52
  %indvars.iv.next41.prol = add nuw nsw i64 %indvars.iv38, 1
  br label %for.body3.us.us

vector.ph:                                        ; preds = %for.body.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next.2, %vector.body ]
  %2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %index
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %3, align 8
  %4 = getelementptr double, double* %2, i64 2
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %5, align 8
  %6 = fmul <2 x double> %wide.load, %broadcast.splat62
  %7 = fmul <2 x double> %wide.load60, %broadcast.splat62
  store <2 x double> %6, <2 x double>* %3, align 8
  store <2 x double> %7, <2 x double>* %5, align 8
  %index.next = add nuw nsw i64 %index, 4
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %index.next
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load60.1 = load <2 x double>, <2 x double>* %11, align 8
  %12 = fmul <2 x double> %wide.load.1, %broadcast.splat62
  %13 = fmul <2 x double> %wide.load60.1, %broadcast.splat62
  store <2 x double> %12, <2 x double>* %9, align 8
  store <2 x double> %13, <2 x double>* %11, align 8
  %index.next.1 = add nsw i64 %index, 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %index.next.1
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load.2 = load <2 x double>, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load60.2 = load <2 x double>, <2 x double>* %17, align 8
  %18 = fmul <2 x double> %wide.load.2, %broadcast.splat62
  %19 = fmul <2 x double> %wide.load60.2, %broadcast.splat62
  store <2 x double> %18, <2 x double>* %15, align 8
  store <2 x double> %19, <2 x double>* %17, align 8
  %index.next.2 = add nsw i64 %index, 12
  %20 = icmp eq i64 %index.next.2, 1200
  br i1 %20, label %for.cond1.for.inc30_crit_edge.us.loopexit63, label %vector.body, !llvm.loop !1

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit63:      ; preds = %vector.body
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit63, %for.cond1.for.inc30_crit_edge.us.loopexit
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1000
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br i1 %exitcond55, label %for.end32, label %for.body.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond4.for.end_crit_edge.us.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.body3.us.us
  br label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader
  %21 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv38, i64 %indvars.iv48
  %22 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %21, %22
  %add17.us.us.prol = fadd double %mul.us.us.prol, %.pre
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body3.us.us, %for.body6.us.us.prol
  %add17.us.us.lcssa.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol ], [ undef, %for.body3.us.us ]
  %indvars.iv40.unr.ph = phi i64 [ %indvars.iv.next41.prol, %for.body6.us.us.prol ], [ %indvars.iv38, %for.body3.us.us ]
  %.unr.ph = phi double [ %add17.us.us.prol, %for.body6.us.us.prol ], [ %.pre, %for.body3.us.us ]
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.cond4.for.end_crit_edge.us.us, label %for.body3.us.us.new

for.body3.us.us.new:                              ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.unr-lcssa:      ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us.prol.loopexit, %for.cond4.for.end_crit_edge.us.us.unr-lcssa
  %add17.us.us.lcssa = phi double [ %add17.us.us.lcssa.unr.ph, %for.body6.us.us.prol.loopexit ], [ %add17.us.us.1, %for.cond4.for.end_crit_edge.us.us.unr-lcssa ]
  %mul22.us.us = fmul double %add17.us.us.lcssa, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1200
  br i1 %exitcond51, label %for.cond1.for.inc30_crit_edge.us.loopexit, label %for.body3.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.body3.us.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr.ph, %for.body3.us.us.new ], [ %indvars.iv.next41.1, %for.body6.us.us ]
  %23 = phi double [ %.unr.ph, %for.body3.us.us.new ], [ %add17.us.us.1, %for.body6.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv40, i64 %indvars.iv52
  %24 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv48
  %25 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %24, %25
  %add17.us.us = fadd double %mul.us.us, %23
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next41, i64 %indvars.iv52
  %26 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next41, i64 %indvars.iv48
  %27 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %26, %27
  %add17.us.us.1 = fadd double %mul.us.us.1, %add17.us.us
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next41.1, 1000
  br i1 %exitcond47.1, label %for.cond4.for.end_crit_edge.us.us.unr-lcssa, label %for.body6.us.us

for.end32:                                        ; preds = %for.cond1.for.inc30_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %B) #0 {
for.body.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv6 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next7, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv6, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond10, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

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

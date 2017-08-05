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
  call void @init_array(double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  call void @kernel_trmm(double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  %2 = bitcast i8* %call1 to [1200 x double]*
  call void @print_array([1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond11.for.inc27_crit_edge.us ]
  %0 = add i64 %indvars.iv10, 4294967295
  %cmp222.us = icmp sgt i64 %indvars.iv10, 0
  br i1 %cmp222.us, label %for.inc.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv10
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %1 = add nuw nsw i64 %indvars.iv10, 1200
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.end.us
  %indvars.iv4 = phi i64 [ 0, %for.end.us ], [ %indvars.iv.next5.1, %for.inc24.us ]
  %2 = sub nuw nsw i64 %1, %indvars.iv4
  %3 = trunc i64 %2 to i32
  %rem16.us = srem i32 %3, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv4
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next5
  %5 = trunc i64 %4 to i32
  %rem16.us.1 = srem i32 %5, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %6 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %6, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %exitcond.17 = icmp eq i64 %indvars.iv.next5.1, 1200
  br i1 %exitcond.17, label %for.cond11.for.inc27_crit_edge.us, label %for.inc24.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %7 = add nuw nsw i64 %indvars.iv, %indvars.iv10
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = add nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %10 = trunc i64 %9 to i32
  %rem.us.1 = srem i32 %10, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %11 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %11, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv10
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us
  %xtraiter13 = and i64 %indvars.iv10, 1
  %lcmp.mod = icmp eq i64 %xtraiter13, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %12 = trunc i64 %indvars.iv10 to i32
  %rem.us.prol = srem i32 %12, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.lr.ph.us ]
  %13 = trunc i64 %0 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %for.end.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.inc24.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond, label %for.end29, label %for.cond1.preheader.us

for.end29:                                        ; preds = %for.cond11.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us28.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us28.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.cond.loopexit_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond1.for.cond.loopexit_crit_edge.us ]
  %indvars.iv1 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next2, %for.cond1.for.cond.loopexit_crit_edge.us ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %cmp519.us = icmp slt i64 %indvars.iv.next8, 1000
  br i1 %cmp519.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us40.preheader

for.cond4.preheader.us40.preheader:               ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us40

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %2 = sub i64 998, %indvars.iv7
  %3 = sub i64 999, %indvars.iv7
  %xtraiter10 = and i64 %3, 1
  %4 = trunc i64 %2 to i32
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv7
  %indvars.iv.next4.prol = add nuw nsw i64 %indvars.iv1, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us40:                         ; preds = %for.cond4.preheader.us40.preheader, %for.cond4.preheader.us40
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %for.cond4.preheader.us40 ], [ 0, %for.cond4.preheader.us40.preheader ]
  %arrayidx21.us27 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  %5 = bitcast double* %arrayidx21.us27 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul22.us28 = fmul <2 x double> %6, %mul22.us28.v.i1.2
  %7 = bitcast double* %arrayidx21.us27 to <2 x double>*
  store <2 x double> %mul22.us28, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us27.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv.next.1
  %8 = bitcast double* %arrayidx21.us27.2 to <2 x double>*
  %9 = load <2 x double>, <2 x double>* %8, align 8
  %mul22.us28.2 = fmul <2 x double> %9, %mul22.us28.2.v.i1.2
  %10 = bitcast double* %arrayidx21.us27.2 to <2 x double>*
  store <2 x double> %mul22.us28.2, <2 x double>* %10, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx21.us27.4 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv.next.3
  %11 = load double, double* %arrayidx21.us27.4, align 8
  %mul22.us28.4 = fmul double %11, %alpha
  store double %mul22.us28.4, double* %arrayidx21.us27.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %for.cond1.for.cond.loopexit_crit_edge.us.loopexit14, label %for.cond4.preheader.us40

for.cond1.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.cond4.for.inc27_crit_edge.us.us
  br label %for.cond1.for.cond.loopexit_crit_edge.us

for.cond1.for.cond.loopexit_crit_edge.us.loopexit14: ; preds = %for.cond4.preheader.us40
  br label %for.cond1.for.cond.loopexit_crit_edge.us

for.cond1.for.cond.loopexit_crit_edge.us:         ; preds = %for.cond1.for.cond.loopexit_crit_edge.us.loopexit14, %for.cond1.for.cond.loopexit_crit_edge.us.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %for.end32, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc27_crit_edge.us.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.cond4.for.inc27_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %12 = icmp eq i64 %xtraiter10, 0
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv5
  br i1 %12, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %13 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv1, i64 %indvars.iv5
  %14 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %13, %14
  %15 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %15, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv3.unr.ph = phi i64 [ %indvars.iv.next4.prol, %for.inc.us.us.prol ], [ %indvars.iv1, %for.cond4.preheader.us.us ]
  %16 = icmp eq i32 %4, 0
  br i1 %16, label %for.cond4.for.inc27_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond4.for.inc27_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond4.for.inc27_crit_edge.us.us

for.cond4.for.inc27_crit_edge.us.us:              ; preds = %for.cond4.for.inc27_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv5
  %17 = load double, double* %arrayidx21.us.us, align 8
  %mul22.us.us = fmul double %17, %alpha
  store double %mul22.us.us, double* %arrayidx21.us.us, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond, label %for.cond1.for.cond.loopexit_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv3 = phi i64 [ %indvars.iv.next4.1, %for.inc.us.us ], [ %indvars.iv3.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv7
  %18 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv5
  %19 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %18, %19
  %20 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us = fadd double %20, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv7
  %21 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next4, i64 %indvars.iv5
  %22 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %21, %22
  %23 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.1 = fadd double %23, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next4.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.inc27_crit_edge.us.us.loopexit, label %for.inc.us.us

for.end32:                                        ; preds = %for.cond1.for.cond.loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %B) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next3, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv2, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

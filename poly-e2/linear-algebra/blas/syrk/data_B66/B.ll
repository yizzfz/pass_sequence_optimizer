; ModuleID = 'A.ll'
source_filename = "syrk.c"
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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  %3 = bitcast i8* %call to [1200 x double]*
  call void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next12, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next7, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv6, %indvars.iv11
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv6
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond10, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond13, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next, %for.inc28.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20.us = srem i32 %5, 1000
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.000000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.inc28.us
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond5, label %for.end33, label %for.cond14.preheader.us

for.end33:                                        ; preds = %for.cond14.for.inc31_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ %indvars.iv.unr, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5.us to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul.us = fmul <2 x double> %3, %mul.us.v.i1.2
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul.us.2 = fmul <2 x double> %6, %mul.us.2.v.i1.2
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %7, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv14
  br i1 %exitcond.3, label %for.cond9.preheader.us41.preheader.loopexit, label %for.inc.us

for.inc26.us28:                                   ; preds = %for.inc26.us28.preheader, %for.inc26.us28
  %indvars.iv3 = phi i64 [ %indvars.iv.next4.1, %for.inc26.us28 ], [ %indvars.iv3.unr.ph, %for.inc26.us28.preheader ]
  %8 = load double, double* %arrayidx15.us45, align 8
  %mul16.us30 = fmul double %8, %alpha
  %arrayidx20.us32 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv11
  %9 = load double, double* %arrayidx20.us32, align 8
  %mul21.us33 = fmul double %mul16.us30, %9
  %arrayidx25.us34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv3
  %10 = load double, double* %arrayidx25.us34, align 8
  %add.us35 = fadd double %10, %mul21.us33
  store double %add.us35, double* %arrayidx25.us34, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %11 = load double, double* %arrayidx15.us45, align 8
  %mul16.us30.1 = fmul double %11, %alpha
  %arrayidx20.us32.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv11
  %12 = load double, double* %arrayidx20.us32.1, align 8
  %mul21.us33.1 = fmul double %mul16.us30.1, %12
  %arrayidx25.us34.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv.next4
  %13 = load double, double* %arrayidx25.us34.1, align 8
  %add.us35.1 = fadd double %13, %mul21.us33.1
  store double %add.us35.1, double* %arrayidx25.us34.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next4.1, %indvars.iv14
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us46.loopexit, label %for.inc26.us28

for.cond9.preheader.us41:                         ; preds = %for.cond9.preheader.us41.preheader, %for.cond9.for.inc29_crit_edge.us46
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.cond9.for.inc29_crit_edge.us46 ], [ 0, %for.cond9.preheader.us41.preheader ]
  %14 = icmp eq i64 %xtraiter819, 0
  %arrayidx15.us45 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv11
  br i1 %14, label %for.inc26.us28.prol.loopexit, label %for.inc26.us28.prol

for.inc26.us28.prol:                              ; preds = %for.cond9.preheader.us41
  %15 = load double, double* %arrayidx15.us45, align 8
  %mul16.us30.prol = fmul double %15, %alpha
  %arrayidx20.us32.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv11
  %16 = load double, double* %arrayidx20.us32.prol, align 8
  %mul21.us33.prol = fmul double %mul16.us30.prol, %16
  %17 = load double, double* %arrayidx25.us34.prol, align 8
  %add.us35.prol = fadd double %17, %mul21.us33.prol
  store double %add.us35.prol, double* %arrayidx25.us34.prol, align 8
  br label %for.inc26.us28.prol.loopexit

for.inc26.us28.prol.loopexit:                     ; preds = %for.inc26.us28.prol, %for.cond9.preheader.us41
  %indvars.iv3.unr.ph = phi i64 [ 1, %for.inc26.us28.prol ], [ 0, %for.cond9.preheader.us41 ]
  %18 = icmp eq i64 %indvars.iv16, 0
  br i1 %18, label %for.cond9.for.inc29_crit_edge.us46, label %for.inc26.us28.preheader

for.inc26.us28.preheader:                         ; preds = %for.inc26.us28.prol.loopexit
  br label %for.inc26.us28

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv16 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next17, %for.cond6.for.inc32_crit_edge.us ]
  %indvars.iv14 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond6.for.inc32_crit_edge.us ]
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %19 = trunc i64 %indvars.iv.next17 to i32
  %xtraiter = and i32 %19, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv.prol
  %20 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %20, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.inc.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us ], [ %indvars.iv.next.prol, %for.inc.us.prol.loopexit.loopexit ]
  %21 = icmp ult i64 %indvars.iv16, 3
  br i1 %21, label %for.cond9.preheader.us41.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond9.preheader.us41.preheader.loopexit:      ; preds = %for.inc.us
  br label %for.cond9.preheader.us41.preheader

for.cond9.preheader.us41.preheader:               ; preds = %for.cond9.preheader.us41.preheader.loopexit, %for.inc.us.prol.loopexit
  %xtraiter819 = and i64 %indvars.iv.next17, 1
  %arrayidx25.us34.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 0
  br label %for.cond9.preheader.us41

for.cond9.for.inc29_crit_edge.us46.loopexit:      ; preds = %for.inc26.us28
  br label %for.cond9.for.inc29_crit_edge.us46

for.cond9.for.inc29_crit_edge.us46:               ; preds = %for.cond9.for.inc29_crit_edge.us46.loopexit, %for.inc26.us28.prol.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us41

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us46
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %for.end34, label %for.inc.lr.ph.us

for.end34:                                        ; preds = %for.cond6.for.inc32_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly %C) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next3, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv2, 1200
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1200
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

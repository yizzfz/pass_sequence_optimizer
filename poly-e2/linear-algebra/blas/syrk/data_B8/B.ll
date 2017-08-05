; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %0 = bitcast i8* %call to [1200 x double]*
  %.cast = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %0, [1000 x double]* %.cast)
  tail call void (...) @polybench_timer_start() #4
  %1 = load double, double* %alpha, align 8
  %2 = load double, double* %beta, align 8
  %3 = bitcast i8* %call1 to [1000 x double]*
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %1, double %2, [1200 x double]* %0, [1000 x double]* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv2434.us = phi i64 [ %indvars.iv.next25.us, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv2032.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next21.us, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv2032.us, %indvars.iv2434.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2434.us, i64 %indvars.iv2032.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2032.us, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond39, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2434.us, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next25.us, 1200
  br i1 %exitcond40, label %for.cond14.preheader.preheader, label %for.cond1.preheader.us

for.cond14.preheader.preheader:                   ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv1829 = phi i64 [ %indvars.iv.next19, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.cond14.preheader, %for.inc28
  %indvars.iv27 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv27, %indvars.iv1829
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1829, i64 %indvars.iv27
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1829, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond38, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next, %for.cond6.for.inc32_crit_edge.us ]
  %indvars.iv2536.us = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next26.us, %for.cond6.for.inc32_crit_edge.us ]
  %indvars.iv2734.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next28.us, %for.cond6.for.inc32_crit_edge.us ]
  %2 = and i64 %indvars.iv, 3
  %3 = add nuw nsw i64 %indvars.iv2734.us, 1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv29.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 %indvars.iv29.us.prol
  %4 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %4, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv29.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv29.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %2, %for.inc.us.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %indvars.iv2734.us, 3
  br i1 %5, label %for.cond9.preheader.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv29.us = phi i64 [ %indvars.iv.next.us.3, %for.inc.us ], [ %indvars.iv29.us.unr, %for.inc.us.preheader ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 %indvars.iv29.us
  %6 = bitcast double* %arrayidx5.us to <2 x double>*
  %7 = load <2 x double>, <2 x double>* %6, align 8
  %mul.us = fmul <2 x double> %7, %mul.us.v.i1.2
  %8 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %8, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv29.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 %indvars.iv.next.us.1
  %9 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul.us.2 = fmul <2 x double> %10, %mul.us.2.v.i1.2
  %11 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %11, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv29.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv2536.us
  br i1 %exitcond.us.3, label %for.cond9.preheader.us.preheader.loopexit, label %for.inc.us

for.cond9.preheader.us.preheader.loopexit:        ; preds = %for.inc.us
  br label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond9.preheader.us.preheader.loopexit, %for.inc.us.prol.loopexit
  %12 = and i64 %indvars.iv2734.us, 1
  %arrayidx25.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 0
  %13 = icmp eq i64 %12, 0
  %14 = icmp eq i64 %indvars.iv2734.us, 0
  br label %for.cond9.preheader.us

for.inc26.us:                                     ; preds = %for.inc26.us.preheader, %for.inc26.us
  %indvars.iv1730.us = phi i64 [ %indvars.iv.next18.us.1, %for.inc26.us ], [ %indvars.iv1730.us.unr.ph, %for.inc26.us.preheader ]
  %15 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %15, %alpha
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1730.us, i64 %indvars.iv2332.us
  %16 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %16
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 %indvars.iv1730.us
  %17 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %17, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1730.us, 1
  %18 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %18, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next18.us, i64 %indvars.iv2332.us
  %19 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %19
  %arrayidx25.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2734.us, i64 %indvars.iv.next18.us
  %20 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %20, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next18.us.1 = add nuw nsw i64 %indvars.iv1730.us, 2
  %exitcond22.us.1 = icmp eq i64 %indvars.iv.next18.us.1, %indvars.iv2536.us
  br i1 %exitcond22.us.1, label %for.inc29.us.loopexit, label %for.inc26.us

for.inc29.us.loopexit:                            ; preds = %for.inc26.us
  br label %for.inc29.us

for.inc29.us:                                     ; preds = %for.inc29.us.loopexit, %for.inc26.us.prol.loopexit
  %indvars.iv.next24.us = add nuw nsw i64 %indvars.iv2332.us, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next24.us, 1000
  br i1 %exitcond39, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc29.us
  %indvars.iv2332.us = phi i64 [ %indvars.iv.next24.us, %for.inc29.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2734.us, i64 %indvars.iv2332.us
  br i1 %13, label %for.inc26.us.prol, label %for.inc26.us.prol.loopexit

for.inc26.us.prol:                                ; preds = %for.cond9.preheader.us
  %21 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %21, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv2332.us
  %22 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %22
  %23 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %23, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.inc26.us.prol.loopexit

for.inc26.us.prol.loopexit:                       ; preds = %for.inc26.us.prol, %for.cond9.preheader.us
  %indvars.iv1730.us.unr.ph = phi i64 [ 1, %for.inc26.us.prol ], [ 0, %for.cond9.preheader.us ]
  br i1 %14, label %for.inc29.us, label %for.inc26.us.preheader

for.inc26.us.preheader:                           ; preds = %for.inc26.us.prol.loopexit
  br label %for.inc26.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.inc29.us
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2734.us, 1
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2536.us, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next28.us, 1200
  %indvars.iv.next = add nuw nsw i64 %2, 1
  br i1 %exitcond40, label %for.end34, label %for.cond1.preheader.us

for.end34:                                        ; preds = %for.cond6.for.inc32_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv814 = phi i64 [ %indvars.iv.next9, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv814, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %for.inc
  %indvars.iv12 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv12, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv814, i64 %indvars.iv12
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv814, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond17, label %for.end12, label %for.cond2.preheader

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

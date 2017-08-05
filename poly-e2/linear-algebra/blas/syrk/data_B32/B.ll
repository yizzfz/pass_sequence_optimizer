; ModuleID = 'A.ll'
source_filename = "syrk.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv920.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next10.us, %for.inc7.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv518.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next6.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv518.us, %indvars.iv920.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv920.us, i64 %indvars.iv518.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv518.us, 1
  %exitcond = icmp eq i64 %indvars.iv518.us, 999
  br i1 %exitcond, label %for.inc7.us, label %for.body3.us

for.inc7.us:                                      ; preds = %for.body3.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv920.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next10.us, 1200
  br i1 %exitcond25, label %for.cond14.preheader.preheader, label %for.cond1.preheader.us

for.cond14.preheader.preheader:                   ; preds = %for.inc7.us
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv315 = phi i64 [ %indvars.iv.next4, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.body17 ]
  %3 = mul nuw nsw i64 %indvars.iv13, %indvars.iv315
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv315, i64 %indvars.iv13
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond11, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv315, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond26, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc32.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc32.us ], [ 1, %for.cond1.preheader.us.preheader ]
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %for.inc32.us ], [ 1, %for.cond1.preheader.us.preheader ]
  %indvars.iv1320.us = phi i64 [ %3, %for.inc32.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = add i64 %indvars.iv1320.us, -3
  %2 = and i64 %indvars.iv, 3
  %3 = add nuw nsw i64 %indvars.iv1320.us, 1
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv15.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us.prol
  %4 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %4, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv15.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv15.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %2, %for.body3.us.prol ]
  %5 = icmp ult i64 %indvars.iv1320.us, 3
  br i1 %5, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %6 = sub i64 %1, %indvars.iv15.us.unr
  %7 = lshr i64 %6, 2
  %8 = and i64 %7, 1
  %lcmp.mod4 = icmp eq i64 %8, 0
  br i1 %lcmp.mod4, label %for.body3.us.prol5, label %for.body3.us.prol.loopexit2

for.body3.us.prol5:                               ; preds = %for.body3.us.preheader
  %arrayidx5.us.prol7 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us.unr
  %9 = bitcast double* %arrayidx5.us.prol7 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul.us.prol8 = fmul <2 x double> %10, %mul.us.v.i1.2
  store <2 x double> %mul.us.prol8, <2 x double>* %9, align 8
  %indvars.iv.next.us.1.prol = add nuw nsw i64 %indvars.iv15.us.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1.prol
  %11 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul.us.2.prol = fmul <2 x double> %12, %mul.us.v.i1.2
  store <2 x double> %mul.us.2.prol, <2 x double>* %11, align 8
  %indvars.iv.next.us.3.prol = or i64 %indvars.iv15.us.unr, 4
  br label %for.body3.us.prol.loopexit2

for.body3.us.prol.loopexit2:                      ; preds = %for.body3.us.prol5, %for.body3.us.preheader
  %indvars.iv15.us.unr9.ph = phi i64 [ %indvars.iv.next.us.3.prol, %for.body3.us.prol5 ], [ %indvars.iv15.us.unr, %for.body3.us.preheader ]
  %13 = icmp eq i64 %7, 0
  br i1 %13, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit2
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv15.us = phi i64 [ %indvars.iv15.us.unr9.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.us.3.1, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us
  %14 = bitcast double* %arrayidx5.us to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %mul.us = fmul <2 x double> %15, %mul.us.v.i1.2
  store <2 x double> %mul.us, <2 x double>* %14, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv15.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1
  %16 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul.us.2 = fmul <2 x double> %17, %mul.us.v.i1.2
  store <2 x double> %mul.us.2, <2 x double>* %16, align 8
  %indvars.iv.next.us.3 = add nuw nsw i64 %indvars.iv15.us, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.3
  %18 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %mul.us.1 = fmul <2 x double> %19, %mul.us.v.i1.2
  store <2 x double> %mul.us.1, <2 x double>* %18, align 8
  %indvars.iv.next.us.1.1 = add nsw i64 %indvars.iv15.us, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1.1
  %20 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %mul.us.2.1 = fmul <2 x double> %21, %mul.us.v.i1.2
  store <2 x double> %mul.us.2.1, <2 x double>* %20, align 8
  %indvars.iv.next.us.3.1 = add nsw i64 %indvars.iv15.us, 8
  %exitcond.us.3.1 = icmp eq i64 %indvars.iv.next.us.3.1, %indvars.iv1122.us
  br i1 %exitcond.us.3.1, label %for.cond9.preheader.us.preheader, label %for.body3.us

for.cond9.preheader.us.preheader:                 ; preds = %for.body3.us.prol.loopexit2, %for.body3.us, %for.body3.us.prol.loopexit
  %xtraiter25 = and i64 %3, 1
  %arrayidx25.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.inc29.us, %for.cond9.preheader.us.preheader
  %indvars.iv918.us = phi i64 [ %indvars.iv.next10.us, %for.inc29.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %22 = icmp eq i64 %xtraiter25, 0
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  br i1 %22, label %for.body11.us.prol.loopexit.unr-lcssa, label %for.body11.us.prol.preheader

for.body11.us.prol.preheader:                     ; preds = %for.cond9.preheader.us
  %23 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %23, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv918.us
  %24 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %24
  %25 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %25, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.body11.us.prol.loopexit.unr-lcssa

for.body11.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond9.preheader.us, %for.body11.us.prol.preheader
  %indvars.iv316.us.unr.ph = phi i64 [ 1, %for.body11.us.prol.preheader ], [ 0, %for.cond9.preheader.us ]
  %26 = icmp eq i64 %indvars.iv1320.us, 0
  br i1 %26, label %for.inc29.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %for.body11.us.prol.loopexit.unr-lcssa
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv316.us = phi i64 [ %indvars.iv.next4.us.1, %for.body11.us ], [ %indvars.iv316.us.unr.ph, %for.body11.us.preheader ]
  %27 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %27, %alpha
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %28 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %28
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us
  %29 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %29, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %30 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %30, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next4.us, i64 %indvars.iv918.us
  %31 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %31
  %arrayidx25.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next4.us
  %32 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %32, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next4.us.1 = add nuw nsw i64 %indvars.iv316.us, 2
  %exitcond8.us.1 = icmp eq i64 %indvars.iv.next4.us.1, %indvars.iv1122.us
  br i1 %exitcond8.us.1, label %for.inc29.us, label %for.body11.us

for.inc29.us:                                     ; preds = %for.body11.us, %for.body11.us.prol.loopexit.unr-lcssa
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv918.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond, label %for.inc32.us, label %for.cond9.preheader.us

for.inc32.us:                                     ; preds = %for.inc29.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %indvars.iv.next = add nuw nsw i64 %2, 1
  %exitcond31 = icmp eq i64 %3, 1200
  br i1 %exitcond31, label %for.end34, label %for.cond1.preheader.us

for.end34:                                        ; preds = %for.inc32.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %C) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.preheader, %for.inc10
  %indvars.iv29 = phi i64 [ %indvars.iv.next3, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv29, 1200
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv7, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv29, i64 %indvars.iv7
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond5, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}

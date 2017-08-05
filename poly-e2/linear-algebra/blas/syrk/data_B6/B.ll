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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call void @kernel_syrk(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  tail call void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* %C, [1000 x double]* %A) #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv2636.us = phi i64 [ %indvars.iv.next27.us, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv2234.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next23.us, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv2234.us, %indvars.iv2636.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2636.us, i64 %indvars.iv2234.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv2234.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next23.us, 1000
  br i1 %exitcond41, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2636.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next27.us, 1200
  br i1 %exitcond42, label %for.cond14.preheader.preheader, label %for.cond1.preheader.us

for.cond14.preheader.preheader:                   ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv2031 = phi i64 [ %indvars.iv.next21, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.cond14.preheader, %for.inc28
  %indvars.iv29 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next, %for.inc28 ]
  %3 = mul nuw nsw i64 %indvars.iv29, %indvars.iv2031
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem20 = srem i32 %5, 1000
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.000000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2031, i64 %indvars.iv29
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2031, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next21, 1200
  br i1 %exitcond40, label %for.end33, label %for.cond14.preheader

for.end33:                                        ; preds = %for.inc31
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A) #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2.prol = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %2 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2.1 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond6.for.inc32_crit_edge.us
  %indvars.iv2738.us = phi i64 [ %indvars.iv.next28.us, %for.cond6.for.inc32_crit_edge.us ], [ 1, %for.cond1.preheader.us.preheader ]
  %indvars.iv2936.us = phi i64 [ %4, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %3 = add i64 %indvars.iv2936.us, -3
  %4 = add nuw nsw i64 %indvars.iv2936.us, 1
  %xtraiter = and i64 %4, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.cond1.preheader.us
  br label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.preheader, %for.inc.us.prol
  %indvars.iv31.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.inc.us.prol ], [ 0, %for.inc.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc.us.prol ], [ %xtraiter, %for.inc.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv31.us.prol
  %5 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %5, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv31.us.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.loopexit.loopexit, label %for.inc.us.prol, !llvm.loop !1

for.inc.us.prol.loopexit.loopexit:                ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv31.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.us.prol, %for.inc.us.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %indvars.iv2936.us, 3
  br i1 %6, label %for.cond9.preheader.us.preheader, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %7 = sub i64 %3, %indvars.iv31.us.unr
  %8 = lshr i64 %7, 2
  %9 = and i64 %8, 1
  %lcmp.mod53 = icmp eq i64 %9, 0
  br i1 %lcmp.mod53, label %for.inc.us.prol.preheader50, label %for.inc.us.prol.loopexit51.unr-lcssa

for.inc.us.prol.preheader50:                      ; preds = %for.inc.us.preheader
  br label %for.inc.us.prol54

for.inc.us.prol54:                                ; preds = %for.inc.us.prol.preheader50
  %arrayidx5.us.prol56 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv31.us.unr
  %10 = bitcast double* %arrayidx5.us.prol56 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul.us.prol57 = fmul <2 x double> %11, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.prol57, <2 x double>* %10, align 8
  %indvars.iv.next.us.1.prol = add nsw i64 %indvars.iv31.us.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv.next.us.1.prol
  %12 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul.us.2.prol = fmul <2 x double> %13, %mul.us.v.i1.2.prol
  store <2 x double> %mul.us.2.prol, <2 x double>* %12, align 8
  %indvars.iv.next.us.3.prol = add nsw i64 %indvars.iv31.us.unr, 4
  br label %for.inc.us.prol.loopexit51.unr-lcssa

for.inc.us.prol.loopexit51.unr-lcssa:             ; preds = %for.inc.us.preheader, %for.inc.us.prol54
  %indvars.iv31.us.unr58.ph = phi i64 [ %indvars.iv.next.us.3.prol, %for.inc.us.prol54 ], [ %indvars.iv31.us.unr, %for.inc.us.preheader ]
  br label %for.inc.us.prol.loopexit51

for.inc.us.prol.loopexit51:                       ; preds = %for.inc.us.prol.loopexit51.unr-lcssa
  %14 = icmp eq i64 %8, 0
  br i1 %14, label %for.cond9.preheader.us.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit51
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv31.us = phi i64 [ %indvars.iv31.us.unr58.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.us.3.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv31.us
  %15 = bitcast double* %arrayidx5.us to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul.us = fmul <2 x double> %16, %mul.us.v.i1.2
  store <2 x double> %mul.us, <2 x double>* %15, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv31.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv.next.us.1
  %17 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul.us.2 = fmul <2 x double> %18, %mul.us.v.i1.2
  store <2 x double> %mul.us.2, <2 x double>* %17, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv31.us, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv.next.us.3
  %19 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul.us.1 = fmul <2 x double> %20, %mul.us.v.i1.2.1
  store <2 x double> %mul.us.1, <2 x double>* %19, align 8
  %indvars.iv.next.us.1.1 = add nsw i64 %indvars.iv31.us, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv.next.us.1.1
  %21 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %mul.us.2.1 = fmul <2 x double> %22, %mul.us.v.i1.2.1
  store <2 x double> %mul.us.2.1, <2 x double>* %21, align 8
  %indvars.iv.next.us.3.1 = add nsw i64 %indvars.iv31.us, 8
  %exitcond.us.3.1 = icmp eq i64 %indvars.iv.next.us.3.1, %indvars.iv2738.us
  br i1 %exitcond.us.3.1, label %for.cond9.preheader.us.preheader.loopexit.unr-lcssa, label %for.inc.us

for.cond9.preheader.us.preheader.loopexit.unr-lcssa: ; preds = %for.inc.us
  br label %for.cond9.preheader.us.preheader.loopexit

for.cond9.preheader.us.preheader.loopexit:        ; preds = %for.inc.us.prol.loopexit51, %for.cond9.preheader.us.preheader.loopexit.unr-lcssa
  br label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond9.preheader.us.preheader.loopexit, %for.inc.us.prol.loopexit
  %23 = and i64 %indvars.iv2936.us, 1
  %arrayidx25.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 0
  %24 = icmp eq i64 %23, 0
  %25 = icmp eq i64 %indvars.iv2936.us, 0
  br label %for.cond9.preheader.us

for.inc26.us:                                     ; preds = %for.inc26.us.preheader, %for.inc26.us
  %indvars.iv1932.us = phi i64 [ %indvars.iv.next20.us.1, %for.inc26.us ], [ %indvars.iv1932.us.unr.ph, %for.inc26.us.preheader ]
  %26 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %26, %alpha
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1932.us, i64 %indvars.iv2534.us
  %27 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %27
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv1932.us
  %28 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %28, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1932.us, 1
  %29 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %29, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next20.us, i64 %indvars.iv2534.us
  %30 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %30
  %arrayidx25.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv2936.us, i64 %indvars.iv.next20.us
  %31 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %31, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next20.us.1 = add nsw i64 %indvars.iv1932.us, 2
  %exitcond24.us.1 = icmp eq i64 %indvars.iv.next20.us.1, %indvars.iv2738.us
  br i1 %exitcond24.us.1, label %for.inc29.us.loopexit, label %for.inc26.us

for.inc29.us.loopexit:                            ; preds = %for.inc26.us
  br label %for.inc29.us

for.inc29.us:                                     ; preds = %for.inc29.us.loopexit, %for.inc26.us.prol.loopexit
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2534.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next26.us, 1000
  br i1 %exitcond43, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc29.us
  %indvars.iv2534.us = phi i64 [ %indvars.iv.next26.us, %for.inc29.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2936.us, i64 %indvars.iv2534.us
  br i1 %24, label %for.inc26.us.prol, label %for.inc26.us.prol.loopexit

for.inc26.us.prol:                                ; preds = %for.cond9.preheader.us
  %32 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %32, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv2534.us
  %33 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %33
  %34 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %34, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.inc26.us.prol.loopexit

for.inc26.us.prol.loopexit:                       ; preds = %for.inc26.us.prol, %for.cond9.preheader.us
  %indvars.iv1932.us.unr.ph = phi i64 [ 1, %for.inc26.us.prol ], [ 0, %for.cond9.preheader.us ]
  br i1 %25, label %for.inc29.us, label %for.inc26.us.preheader

for.inc26.us.preheader:                           ; preds = %for.inc26.us.prol.loopexit
  br label %for.inc26.us

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.inc29.us
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2738.us, 1
  %exitcond44 = icmp eq i64 %4, 1200
  br i1 %exitcond44, label %for.end34, label %for.cond1.preheader.us

for.end34:                                        ; preds = %for.cond6.for.inc32_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1200 x double]* %C) #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv915 = phi i64 [ %indvars.iv.next10, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %3 = mul nsw i64 %indvars.iv915, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %for.inc
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %indvars.iv13, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv915, i64 %indvars.iv13
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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

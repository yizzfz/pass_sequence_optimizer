; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %0 = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %1 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %0, double* %arraydecay5, double* %1)
  tail call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call1 to double*
  %3 = bitcast i8* %call2 to double*
  %4 = bitcast i8* %call4 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %0, double* %2, double* %3, double* %1, double* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call2 to double*
  %7 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %7, double* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* %A, double* %r, double* %p) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %m, 0
  br i1 %cmp8, label %for.inc.lr.ph, label %for.cond2.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %m to double
  %0 = sext i32 %m to i64
  %xtraiter25 = and i64 %0, 1
  %lcmp.mod26 = icmp eq i64 %xtraiter25, 0
  br i1 %lcmp.mod26, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv18.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol ]
  %1 = icmp eq i32 %m, 1
  br i1 %1, label %for.cond2.preheader, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond2.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %for.inc.prol.loopexit, %entry
  %cmp35 = icmp sgt i32 %n, 0
  br i1 %cmp35, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %2 = icmp sgt i32 %m, 0
  %3 = sext i32 %n to i64
  %conv8 = sitofp i32 %n to double
  %wide.trip.count.1 = zext i32 %m to i64
  br i1 %2, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %xtraiter23 = and i64 %3, 1
  %lcmp.mod24 = icmp eq i64 %xtraiter23, 0
  br i1 %lcmp.mod24, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %div9.prol = fdiv double 0.000000e+00, %conv8
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.preheader, %for.body5.prol
  %indvars.iv16.unr = phi i64 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol ]
  %4 = icmp eq i32 %n, 1
  br i1 %4, label %for.end29, label %for.body5.preheader.new

for.body5.preheader.new:                          ; preds = %for.body5.prol.loopexit
  br label %for.body5

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i32 %m, 1
  %5 = insertelement <2 x double> undef, double %conv8, i32 0
  %div19.us.v.i1.2 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv14 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next15, %for.cond12.for.inc27_crit_edge.us ]
  %6 = icmp eq i32 %xtraiter, 0
  %7 = trunc i64 %indvars.iv14 to i32
  %rem6.us = srem i32 %7, %n
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, %conv8
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv14
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %6, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.body5.us
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv14, i64 0
  store double %div9.us, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.body5.us ]
  %8 = icmp eq i32 %m, 1
  br i1 %8, label %for.cond12.for.inc27_crit_edge.us, label %for.inc24.us.preheader

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc24.us ], [ %indvars.iv.unr.ph, %for.inc24.us.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = mul nsw i64 %indvars.iv.next, %indvars.iv14
  %10 = trunc i64 %9 to i32
  %rem16.us = srem i32 %10, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %11 = mul nsw i64 %indvars.iv.next.1, %indvars.iv14
  %12 = trunc i64 %11 to i32
  %rem16.us.1 = srem i32 %12, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, %div19.us.v.i1.2
  %13 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %13, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.cond12.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next15, %3
  br i1 %cmp3.us, label %for.body5.us, label %for.end29.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next19.1, %for.inc ]
  %14 = trunc i64 %indvars.iv18 to i32
  %rem = srem i32 %14, %m
  %conv = sitofp i32 %rem to double
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv18
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %15 = trunc i64 %indvars.iv.next19 to i32
  %rem.1 = srem i32 %15, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv1, i32 1
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, %div.v.i1.2
  %16 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %16, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next19.1, %0
  br i1 %cmp.1, label %for.inc, label %for.cond2.preheader.loopexit

for.body5:                                        ; preds = %for.body5, %for.body5.preheader.new
  %indvars.iv16 = phi i64 [ %indvars.iv16.unr, %for.body5.preheader.new ], [ %indvars.iv.next17.1, %for.body5 ]
  %17 = trunc i64 %indvars.iv16 to i32
  %rem6 = srem i32 %17, %n
  %conv7 = sitofp i32 %rem6 to double
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %18 = trunc i64 %indvars.iv.next17 to i32
  %rem6.1 = srem i32 %18, %n
  %conv7.1 = sitofp i32 %rem6.1 to double
  %div9.v.i1.1 = insertelement <2 x double> undef, double %conv8, i32 0
  %div9.v.i1.2 = insertelement <2 x double> %div9.v.i1.1, double %conv8, i32 1
  %div9.v.i0.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div9.v.i0.2 = insertelement <2 x double> %div9.v.i0.1, double %conv7.1, i32 1
  %div9 = fdiv <2 x double> %div9.v.i0.2, %div9.v.i1.2
  %19 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div9, <2 x double>* %19, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %cmp3.1 = icmp slt i64 %indvars.iv.next17.1, %3
  br i1 %cmp3.1, label %for.body5, label %for.end29.loopexit27

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit27:                             ; preds = %for.body5
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit27, %for.end29.loopexit, %for.body5.prol.loopexit, %for.cond2.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* %A, double* %s, double* %q, double* %p, double* %r) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %m, 0
  br i1 %cmp9, label %for.inc.lr.ph, label %for.cond1.preheader

for.inc.lr.ph:                                    ; preds = %entry
  %0 = sext i32 %m to i64
  %scevgep2324 = bitcast double* %s to i8*
  %1 = add i32 %m, -1
  %2 = zext i32 %1 to i64
  %3 = shl nuw nsw i64 %2, 3
  %4 = add nuw nsw i64 %3, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep2324, i8 0, i64 %4, i32 8, i1 false)
  %5 = add nsw i64 %0, -1
  %xtraiter43 = and i64 %0, 7
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod44, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol, %for.inc.prol.preheader
  %indvars.iv20.prol = phi i64 [ 0, %for.inc.prol.preheader ], [ %indvars.iv.next21.prol, %for.inc.prol ]
  %prol.iter45 = phi i64 [ %xtraiter43, %for.inc.prol.preheader ], [ %prol.iter45.sub, %for.inc.prol ]
  %indvars.iv.next21.prol = add nsw i64 %indvars.iv20.prol, 1
  %prol.iter45.sub = add i64 %prol.iter45, -1
  %prol.iter45.cmp = icmp eq i64 %prol.iter45.sub, 0
  br i1 %prol.iter45.cmp, label %for.inc.prol.loopexit.loopexit, label %for.inc.prol, !llvm.loop !1

for.inc.prol.loopexit.loopexit:                   ; preds = %for.inc.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.loopexit, %for.inc.lr.ph
  %indvars.iv20.unr = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next21.prol, %for.inc.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %5, 7
  br i1 %6, label %for.cond1.preheader, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.cond1.preheader.loopexit:                     ; preds = %for.inc
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %for.inc.prol.loopexit, %entry
  %cmp25 = icmp sgt i32 %n, 0
  br i1 %cmp25, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %7 = icmp sgt i32 %m, 0
  %8 = sext i32 %n to i64
  br i1 %7, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %scevgep19 = bitcast double* %q to i8*
  %9 = icmp sgt i32 %n, 1
  %smax = select i1 %9, i32 %n, i32 1
  %10 = add nsw i32 %smax, -1
  %11 = zext i32 %10 to i64
  %12 = shl nuw nsw i64 %11, 3
  %13 = add nuw nsw i64 %12, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep19, i8 0, i64 %13, i32 8, i1 false)
  %14 = add nsw i64 %8, -1
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol, %for.body3.prol.preheader
  %indvars.iv17.prol = phi i64 [ 0, %for.body3.prol.preheader ], [ %indvars.iv.next18.prol, %for.body3.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body3.prol.preheader ], [ %prol.iter.sub, %for.body3.prol ]
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv17.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol, !llvm.loop !3

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol.loopexit.loopexit, %for.body3.preheader
  %indvars.iv17.unr = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next18.prol, %for.body3.prol.loopexit.loopexit ]
  %15 = icmp ult i64 %14, 7
  br i1 %15, label %for.end36, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %16 = sext i32 %m to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc34_crit_edge.us
  %indvars.iv14 = phi i64 [ 0, %for.body3.us.preheader ], [ %indvars.iv.next15, %for.cond6.for.inc34_crit_edge.us ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv14
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.body3.us, %for.inc31.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %17 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr46 = mul i64 %indvars.iv14, 8
  %sunkaddr47 = add i64 %sunkaddr, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %18 = load double, double* %sunkaddr48, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %18, %19
  %add.us = fadd double %17, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr49 = ptrtoint double* %q to i64
  %sunkaddr50 = mul i64 %indvars.iv14, 8
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %20 = load double, double* %sunkaddr52, align 8
  %21 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %22 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %21, %22
  %add28.us = fadd double %20, %mul27.us
  store double %add28.us, double* %sunkaddr52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp7.us = icmp slt i64 %indvars.iv.next, %16
  br i1 %cmp7.us, label %for.inc31.us, label %for.cond6.for.inc34_crit_edge.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next15, %8
  br i1 %cmp2.us, label %for.body3.us, label %for.end36.loopexit

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv20 = phi i64 [ %indvars.iv20.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next21.7, %for.inc ]
  %indvars.iv.next21.7 = add nsw i64 %indvars.iv20, 8
  %cmp.7 = icmp slt i64 %indvars.iv.next21.7, %0
  br i1 %cmp.7, label %for.inc, label %for.cond1.preheader.loopexit

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv17 = phi i64 [ %indvars.iv17.unr, %for.body3.preheader.new ], [ %indvars.iv.next18.7, %for.body3 ]
  %indvars.iv.next18.7 = add nsw i64 %indvars.iv17, 8
  %cmp2.7 = icmp slt i64 %indvars.iv.next18.7, %8
  br i1 %cmp2.7, label %for.body3, label %for.end36.loopexit53

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  br label %for.end36

for.end36.loopexit53:                             ; preds = %for.body3
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit53, %for.end36.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* %s, double* %q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp7 = icmp sgt i32 %m, 0
  br i1 %cmp7, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %m to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
  %indvars.iv10 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next11, %for.inc ]
  %4 = trunc i64 %indvars.iv10 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv10
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #7
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %cmp85 = icmp sgt i32 %n, 0
  br i1 %cmp85, label %for.body9.lr.ph, label %for.end20

for.body9.lr.ph:                                  ; preds = %for.end
  %10 = sext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %for.body9.lr.ph, %for.inc18
  %indvars.iv = phi i64 [ 0, %for.body9.lr.ph ], [ %indvars.iv.next, %for.inc18 ]
  %11 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %11, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %14 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, %10
  br i1 %cmp8, label %for.body9, label %for.end20.loopexit

for.end20.loopexit:                               ; preds = %for.inc18
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}

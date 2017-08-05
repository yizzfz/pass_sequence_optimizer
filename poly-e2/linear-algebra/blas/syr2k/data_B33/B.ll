; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* %alpha, double* %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc17_crit_edge.us
  %indvars.iv1223.us = phi i64 [ %indvars.iv.next13.us, %for.cond1.for.inc17_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv520.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next6.us, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv520.us, %indvars.iv1223.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1223.us, i64 %indvars.iv520.us
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div.v.i0.1.us = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.v.i0.2.us = insertelement <2 x double> %div.v.i0.1.us, double %conv10.us, i32 1
  %div.us = fdiv <2 x double> %div.v.i0.2.us, <double 1.200000e+03, double 1.000000e+03>
  %div.v.r1.us = extractelement <2 x double> %div.us, i32 0
  %div.v.r2.us = extractelement <2 x double> %div.us, i32 1
  store double %div.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1223.us, i64 %indvars.iv520.us
  store double %div.v.r2.us, double* %arrayidx16.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv520.us, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond28, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1223.us, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next13.us, 1200
  br i1 %exitcond29, label %for.cond24.preheader.preheader, label %for.cond1.preheader.us

for.cond24.preheader.preheader:                   ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader

for.cond24.preheader:                             ; preds = %for.cond24.preheader.preheader, %for.inc41
  %indvars.iv317 = phi i64 [ %indvars.iv.next4, %for.inc41 ], [ 0, %for.cond24.preheader.preheader ]
  br label %for.body27

for.body27:                                       ; preds = %for.cond24.preheader, %for.body27
  %indvars.iv15 = phi i64 [ 0, %for.cond24.preheader ], [ %indvars.iv.next, %for.body27 ]
  %5 = mul nuw nsw i64 %indvars.iv15, %indvars.iv317
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30 = srem i32 %7, 1200
  %conv31 = sitofp i32 %rem30 to double
  %div33 = fdiv double %conv31, 1.000000e+03
  %arrayidx37 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv317, i64 %indvars.iv15
  store double %div33, double* %arrayidx37, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc41, label %for.body27

for.inc41:                                        ; preds = %for.body27
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv317, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond27, label %for.end43, label %for.cond24.preheader

for.end43:                                        ; preds = %for.inc41
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* %C, [1000 x double]* %A, [1000 x double]* %B) unnamed_addr #0 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert60 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat61 = shufflevector <2 x double> %broadcast.splatinsert60, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond6.for.inc43_crit_edge.us
  %indvars.iv = phi i2 [ %indvars.iv.next30, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %indvars.iv1122.us = phi i64 [ %indvars.iv.next12.us, %for.cond6.for.inc43_crit_edge.us ], [ 1, %entry ]
  %indvars.iv1320.us = phi i64 [ %6, %for.cond6.for.inc43_crit_edge.us ], [ 0, %entry ]
  %1 = add i64 %indvars.iv1320.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 0
  %2 = mul i64 %indvars.iv1320.us, 1201
  %3 = add i64 %2, 1
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %3
  %4 = add i64 %indvars.iv1320.us, 1
  %5 = zext i2 %indvars.iv to i64
  %6 = add nuw nsw i64 %indvars.iv1320.us, 1
  %xtraiter = and i64 %6, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.preheader, %for.body3.us.prol
  %indvars.iv15.us.prol = phi i64 [ %indvars.iv.next.us.prol, %for.body3.us.prol ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body3.us.prol ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us.prol
  %7 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %7, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv15.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol, !llvm.loop !1

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.cond1.preheader.us
  %indvars.iv15.us.unr = phi i64 [ 0, %for.cond1.preheader.us ], [ %5, %for.body3.us.prol.loopexit.loopexit ]
  %8 = icmp ult i64 %indvars.iv1320.us, 3
  br i1 %8, label %for.cond9.preheader.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %9 = sub i64 %1, %indvars.iv15.us.unr
  %10 = lshr i64 %9, 2
  %11 = and i64 %10, 1
  %lcmp.mod65 = icmp eq i64 %11, 0
  br i1 %lcmp.mod65, label %for.body3.us.prol.preheader62, label %for.body3.us.prol.loopexit63.unr-lcssa

for.body3.us.prol.preheader62:                    ; preds = %for.body3.us.preheader
  br label %for.body3.us.prol66

for.body3.us.prol66:                              ; preds = %for.body3.us.prol.preheader62
  %arrayidx5.us.prol68 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us.unr
  %12 = bitcast double* %arrayidx5.us.prol68 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul.us.prol69 = fmul <2 x double> %13, %mul.us.v.i1.2
  store <2 x double> %mul.us.prol69, <2 x double>* %12, align 8
  %indvars.iv.next.us.1.prol = add nuw nsw i64 %indvars.iv15.us.unr, 2
  %arrayidx5.us.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1.prol
  %14 = bitcast double* %arrayidx5.us.2.prol to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %mul.us.2.prol = fmul <2 x double> %15, %mul.us.v.i1.2
  store <2 x double> %mul.us.2.prol, <2 x double>* %14, align 8
  %indvars.iv.next.us.3.prol = or i64 %indvars.iv15.us.unr, 4
  br label %for.body3.us.prol.loopexit63.unr-lcssa

for.body3.us.prol.loopexit63.unr-lcssa:           ; preds = %for.body3.us.preheader, %for.body3.us.prol66
  %indvars.iv15.us.unr70.ph = phi i64 [ %indvars.iv.next.us.3.prol, %for.body3.us.prol66 ], [ %indvars.iv15.us.unr, %for.body3.us.preheader ]
  br label %for.body3.us.prol.loopexit63

for.body3.us.prol.loopexit63:                     ; preds = %for.body3.us.prol.loopexit63.unr-lcssa
  %16 = icmp eq i64 %10, 0
  br i1 %16, label %for.cond9.preheader.us.preheader.loopexit, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit63
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv15.us = phi i64 [ %indvars.iv15.us.unr70.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.us.3.1, %for.body3.us ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv15.us
  %17 = bitcast double* %arrayidx5.us to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul.us = fmul <2 x double> %18, %mul.us.v.i1.2
  store <2 x double> %mul.us, <2 x double>* %17, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv15.us, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1
  %19 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul.us.2 = fmul <2 x double> %20, %mul.us.v.i1.2
  store <2 x double> %mul.us.2, <2 x double>* %19, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv15.us, 4
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.3
  %21 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %mul.us.1 = fmul <2 x double> %22, %mul.us.v.i1.2
  store <2 x double> %mul.us.1, <2 x double>* %21, align 8
  %indvars.iv.next.us.1.1 = add nsw i64 %indvars.iv15.us, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv.next.us.1.1
  %23 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %mul.us.2.1 = fmul <2 x double> %24, %mul.us.v.i1.2
  store <2 x double> %mul.us.2.1, <2 x double>* %23, align 8
  %indvars.iv.next.us.3.1 = add nsw i64 %indvars.iv15.us, 8
  %exitcond.us.3.1 = icmp eq i64 %indvars.iv.next.us.3.1, %indvars.iv1122.us
  br i1 %exitcond.us.3.1, label %for.cond9.preheader.us.preheader.loopexit.unr-lcssa, label %for.body3.us

for.cond9.preheader.us.preheader.loopexit.unr-lcssa: ; preds = %for.body3.us
  br label %for.cond9.preheader.us.preheader.loopexit

for.cond9.preheader.us.preheader.loopexit:        ; preds = %for.body3.us.prol.loopexit63, %for.cond9.preheader.us.preheader.loopexit.unr-lcssa
  br label %for.cond9.preheader.us.preheader

for.cond9.preheader.us.preheader:                 ; preds = %for.cond9.preheader.us.preheader.loopexit, %for.body3.us.prol.loopexit
  %min.iters.check = icmp ult i64 %4, 2
  %n.vec = and i64 %4, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %4, %n.vec
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.preheader.us.preheader, %for.inc40.us
  %indvars.iv918.us = phi i64 [ %indvars.iv.next10.us, %for.inc40.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %scevgep38 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv918.us
  %25 = add i64 %indvars.iv918.us, 1
  %scevgep40 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %25
  %scevgep42 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv918.us
  %scevgep44 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %25
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  %arrayidx30.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1320.us, i64 %indvars.iv918.us
  br i1 %min.iters.check, label %for.body11.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond9.preheader.us
  br i1 %cmp.zero, label %for.body11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us
  %bound1 = icmp ult double* %arrayidx30.us, %scevgep36
  %found.conflict = and i1 %bound0, %bound1
  %bound047 = icmp ult double* %scevgep, %scevgep40
  %bound148 = icmp ult double* %scevgep38, %scevgep36
  %found.conflict49 = and i1 %bound047, %bound148
  %conflict.rdx = or i1 %found.conflict, %found.conflict49
  %bound050 = icmp ult double* %scevgep, %scevgep44
  %bound151 = icmp ult double* %scevgep42, %scevgep36
  %found.conflict52 = and i1 %bound050, %bound151
  %conflict.rdx53 = or i1 %conflict.rdx, %found.conflict52
  %bound056 = icmp ult double* %scevgep, %arrayidx20.us
  %bound157 = icmp ult double* %arrayidx20.us, %scevgep36
  %found.conflict58 = and i1 %bound056, %bound157
  %conflict.rdx59 = or i1 %conflict.rdx53, %found.conflict58
  br i1 %conflict.rdx59, label %for.body11.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %26 = load double, double* %arrayidx20.us, align 8, !alias.scope !3
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = load double, double* %arrayidx30.us, align 8, !alias.scope !6
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %32 = or i64 %index, 1
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index, i64 %indvars.iv918.us
  %34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %32, i64 %indvars.iv918.us
  %35 = load double, double* %33, align 8, !alias.scope !8
  %36 = load double, double* %34, align 8, !alias.scope !8
  %37 = insertelement <2 x double> undef, double %35, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  %39 = fmul <2 x double> %38, %broadcast.splat61
  %40 = fmul <2 x double> %39, %28
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index, i64 %indvars.iv918.us
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %32, i64 %indvars.iv918.us
  %43 = load double, double* %41, align 8, !alias.scope !10
  %44 = load double, double* %42, align 8, !alias.scope !10
  %45 = insertelement <2 x double> undef, double %43, i32 0
  %46 = insertelement <2 x double> %45, double %44, i32 1
  %47 = fmul <2 x double> %46, %broadcast.splat61
  %48 = fmul <2 x double> %47, %31
  %49 = fadd <2 x double> %40, %48
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %index
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !12, !noalias !14
  %52 = fadd <2 x double> %wide.load, %49
  %53 = bitcast double* %50 to <2 x double>*
  store <2 x double> %52, <2 x double>* %53, align 8, !alias.scope !12, !noalias !14
  %index.next = add i64 %index, 2
  %54 = icmp eq i64 %index.next, %n.vec
  br i1 %54, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc40.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond9.preheader.us
  %indvars.iv316.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond9.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv316.us = phi i64 [ %indvars.iv.next4.us, %for.body11.us ], [ %indvars.iv316.us.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %55 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %55, %alpha
  %56 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %56
  %arrayidx25.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv316.us, i64 %indvars.iv918.us
  %57 = load double, double* %arrayidx25.us, align 8
  %mul26.us = fmul double %57, %alpha
  %58 = load double, double* %arrayidx30.us, align 8
  %mul31.us = fmul double %mul26.us, %58
  %add.us = fadd double %mul21.us, %mul31.us
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1320.us, i64 %indvars.iv316.us
  %59 = load double, double* %arrayidx35.us, align 8
  %add36.us = fadd double %59, %add.us
  store double %add36.us, double* %arrayidx35.us, align 8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv316.us, 1
  %exitcond8.us = icmp eq i64 %indvars.iv.next4.us, %indvars.iv1122.us
  br i1 %exitcond8.us, label %for.inc40.us.loopexit, label %for.body11.us, !llvm.loop !18

for.inc40.us.loopexit:                            ; preds = %for.body11.us
  br label %for.inc40.us

for.inc40.us:                                     ; preds = %for.inc40.us.loopexit, %middle.block
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv918.us, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond25, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.inc40.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %exitcond26 = icmp eq i64 %6, 1200
  %indvars.iv.next30 = add i2 %indvars.iv, 1
  br i1 %exitcond26, label %for.end45, label %for.cond1.preheader.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv28 = phi i64 [ %indvars.iv.next3, %for.inc10 ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv28, 1200
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv28, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!11}
!11 = distinct !{!11, !5}
!12 = !{!13}
!13 = distinct !{!13, !5}
!14 = !{!7, !9, !11, !4}
!15 = distinct !{!15, !16, !17}
!16 = !{!"llvm.loop.vectorize.width", i32 1}
!17 = !{!"llvm.loop.interleave.count", i32 1}
!18 = distinct !{!18, !16, !17}

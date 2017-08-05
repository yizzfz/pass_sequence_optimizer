; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23.for.inc.lr.ph_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv126 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next127, %for.inc23.for.inc.lr.ph_crit_edge ]
  %indvars.iv124 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next125, %for.inc23.for.inc.lr.ph_crit_edge ]
  %0 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %.pre, %for.inc23.for.inc.lr.ph_crit_edge ]
  %1 = sub i64 1999, %indvars.iv126
  %2 = sub i64 1998, %indvars.iv126
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %cmp971 = icmp slt i64 %indvars.iv.next127, 2000
  br i1 %cmp971, label %for.inc16.lr.ph, label %for.cond8.preheader.for.inc23_crit_edge

for.cond8.preheader.for.inc23_crit_edge:          ; preds = %for.cond8.preheader
  br label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.lr.ph.for.inc16.prol.loopexit_crit_edge, label %for.inc16.prol.preheader

for.inc16.lr.ph.for.inc16.prol.loopexit_crit_edge: ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol.loopexit

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol.for.inc16.prol_crit_edge, %for.inc16.prol.preheader
  %indvars.iv120.prol = phi i64 [ %indvars.iv124, %for.inc16.prol.preheader ], [ %indvars.iv.next121.prol, %for.inc16.prol.for.inc16.prol_crit_edge ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol.for.inc16.prol_crit_edge ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv120.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next121.prol = add nuw nsw i64 %indvars.iv120.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol.for.inc16.prol_crit_edge, !llvm.loop !1

for.inc16.prol.for.inc16.prol_crit_edge:          ; preds = %for.inc16.prol
  br label %for.inc16.prol

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph.for.inc16.prol.loopexit_crit_edge, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv120.unr = phi i64 [ %indvars.iv124, %for.inc16.lr.ph.for.inc16.prol.loopexit_crit_edge ], [ %indvars.iv.next121.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %3 = icmp ult i64 %2, 7
  br i1 %3, label %for.inc16.prol.loopexit.for.inc23.loopexit_crit_edge, label %for.inc16.lr.ph.new

for.inc16.prol.loopexit.for.inc23.loopexit_crit_edge: ; preds = %for.inc16.prol.loopexit
  br label %for.inc23.loopexit

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.lr.ph
  %indvars.iv111 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next112, %for.inc.for.inc_crit_edge ]
  %4 = sub nsw i64 0, %indvars.iv111
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv111
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next112, %indvars.iv124
  br i1 %exitcond117, label %for.cond8.preheader, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.inc16:                                        ; preds = %for.inc16.for.inc16_crit_edge, %for.inc16.lr.ph.new
  %indvars.iv120 = phi i64 [ %indvars.iv120.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next121.7, %for.inc16.for.inc16_crit_edge ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv120
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next121.2 = add nsw i64 %indvars.iv120, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next121.3 = add nsw i64 %indvars.iv120, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next121.4 = add nsw i64 %indvars.iv120, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next121.5 = add nsw i64 %indvars.iv120, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next121.6 = add nsw i64 %indvars.iv120, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv.next121.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond132.7 = icmp eq i64 %indvars.iv.next121.6, 1999
  %indvars.iv.next121.7 = add nsw i64 %indvars.iv120, 8
  br i1 %exitcond132.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16.for.inc16_crit_edge

for.inc16.for.inc16_crit_edge:                    ; preds = %for.inc16
  br label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit.for.inc23.loopexit_crit_edge, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.cond8.preheader.for.inc23_crit_edge, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv126, i64 %indvars.iv126
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond129 = icmp eq i64 %indvars.iv.next127, 2000
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  br i1 %exitcond129, label %for.cond30.preheader.us.preheader, label %for.inc23.for.inc.lr.ph_crit_edge

for.inc23.for.inc.lr.ph_crit_edge:                ; preds = %for.inc23
  br label %for.inc.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %6, align 8
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge, %for.cond30.preheader.us.preheader
  %indvars.iv107 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next108.7, %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv107, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108 = or i64 %indvars.iv107, 1
  %9 = mul nuw nsw i64 %indvars.iv.next108, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.1 = or i64 %indvars.iv107, 2
  %10 = mul nuw nsw i64 %indvars.iv.next108.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.2 = or i64 %indvars.iv107, 3
  %11 = mul nuw nsw i64 %indvars.iv.next108.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.3 = or i64 %indvars.iv107, 4
  %12 = mul nuw nsw i64 %indvars.iv.next108.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.4 = or i64 %indvars.iv107, 5
  %13 = mul nuw nsw i64 %indvars.iv.next108.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.5 = or i64 %indvars.iv107, 6
  %14 = mul nuw nsw i64 %indvars.iv.next108.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next108.6 = or i64 %indvars.iv107, 7
  %15 = mul nuw nsw i64 %indvars.iv.next108.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond131.7 = icmp eq i64 %indvars.iv.next108.6, 1999
  %indvars.iv.next108.7 = add nsw i64 %indvars.iv107, 8
  br i1 %exitcond131.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge

for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us.for.cond52.preheader.us.us.preheader_crit_edge, %for.cond48.preheader.us.preheader
  %indvars.iv99 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %16, %for.cond48.for.inc75_crit_edge.us.for.cond52.preheader.us.us.preheader_crit_edge ]
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 0, i64 %indvars.iv99
  %16 = add nuw nsw i64 %indvars.iv99, 1
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 1999, i64 %16
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond102 = icmp eq i64 %16, 2000
  br i1 %exitcond102, label %for.cond82.preheader.us.preheader, label %for.cond48.for.inc75_crit_edge.us.for.cond52.preheader.us.us.preheader_crit_edge

for.cond48.for.inc75_crit_edge.us.for.cond52.preheader.us.us.preheader_crit_edge: ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us.for.cond52.preheader.us.us_crit_edge, %for.cond52.preheader.us.us.preheader
  %indvars.iv95 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %17, %for.cond52.for.inc72_crit_edge.us.us.for.cond52.preheader.us.us_crit_edge ]
  %scevgep133 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv95, i64 0
  %17 = add nuw nsw i64 %indvars.iv95, 1
  %scevgep135 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %17, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv95, i64 %indvars.iv99
  %bound0 = icmp ult double* %scevgep133, %scevgep139
  %bound1 = icmp ult double* %scevgep137, %scevgep135
  %found.conflict = and i1 %bound0, %bound1
  %bound0142 = icmp ult double* %scevgep133, %arrayidx59.us.us
  %bound1143 = icmp ult double* %arrayidx59.us.us, %scevgep135
  %found.conflict144 = and i1 %bound0142, %bound1143
  %conflict.rdx = or i1 %found.conflict, %found.conflict144
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %18 = or i64 %index, 1
  %19 = or i64 %index, 2
  %20 = or i64 %index, 3
  %21 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %index, i64 %indvars.iv99
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %18, i64 %indvars.iv99
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %19, i64 %indvars.iv99
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %20, i64 %indvars.iv99
  %28 = load double, double* %24, align 8, !alias.scope !6
  %29 = load double, double* %25, align 8, !alias.scope !6
  %30 = load double, double* %26, align 8, !alias.scope !6
  %31 = load double, double* %27, align 8, !alias.scope !6
  %32 = insertelement <2 x double> undef, double %28, i32 0
  %33 = insertelement <2 x double> %32, double %29, i32 1
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = insertelement <2 x double> %34, double %31, i32 1
  %36 = fmul <2 x double> %23, %33
  %37 = fmul <2 x double> %23, %35
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv95, i64 %index
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !8, !noalias !10
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %42 = fadd <2 x double> %36, %wide.load
  %43 = fadd <2 x double> %37, %wide.load146
  store <2 x double> %42, <2 x double>* %39, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %43, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %44 = icmp eq i64 %index.next, 2000
  br i1 %44, label %for.cond52.for.inc72_crit_edge.us.us.loopexit177, label %vector.body.vector.body_crit_edge, !llvm.loop !11

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit177: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit177, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %exitcond98 = icmp eq i64 %17, 2000
  br i1 %exitcond98, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.for.inc72_crit_edge.us.us.for.cond52.preheader.us.us_crit_edge

for.cond52.for.inc72_crit_edge.us.us.for.cond52.preheader.us.us_crit_edge: ; preds = %for.cond52.for.inc72_crit_edge.us.us
  br label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.for.inc69.us.us_crit_edge, %for.inc69.us.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next92.1, %for.inc69.us.us.for.inc69.us.us_crit_edge ]
  %45 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv91, i64 %indvars.iv99
  %46 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %45, %46
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv95, i64 %indvars.iv91
  %47 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %47
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next92 = or i64 %indvars.iv91, 1
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next92, i64 %indvars.iv99
  %49 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %48, %49
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv95, i64 %indvars.iv.next92
  %50 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %50
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next92, 1999
  %indvars.iv.next92.1 = add nsw i64 %indvars.iv91, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us.for.inc69.us.us_crit_edge, !llvm.loop !14

for.inc69.us.us.for.inc69.us.us_crit_edge:        ; preds = %for.inc69.us.us
  br label %for.inc69.us.us

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  %51 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %52 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us.for.cond82.preheader.us_crit_edge, %for.cond82.preheader.us.preheader
  %indvars.iv87 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %53, %for.cond82.for.inc97_crit_edge.us.for.cond82.preheader.us_crit_edge ]
  %scevgep152 = getelementptr [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 0
  %53 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %52, i64 %53, i64 0
  %scevgep156 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 0
  %scevgep158 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %53, i64 0
  %bound0160 = icmp ult double* %scevgep152, %scevgep158
  %bound1161 = icmp ult double* %scevgep156, %scevgep154
  %memcheck.conflict163 = and i1 %bound0160, %bound1161
  br i1 %memcheck.conflict163, label %for.inc94.us.preheader, label %vector.body147.preheader

vector.body147.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body147

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body147:                                   ; preds = %vector.body147.vector.body147_crit_edge, %vector.body147.preheader
  %index166 = phi i64 [ 0, %vector.body147.preheader ], [ %index.next167.1, %vector.body147.vector.body147_crit_edge ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %index166
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load174 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !15
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load175 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !15
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %index166
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load174, <2 x i64>* %59, align 8, !alias.scope !18, !noalias !15
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load175, <2 x i64>* %61, align 8, !alias.scope !18, !noalias !15
  %index.next167 = or i64 %index166, 4
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %index.next167
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load174.1 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load175.1 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !15
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %index.next167
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load174.1, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load175.1, <2 x i64>* %69, align 8, !alias.scope !18, !noalias !15
  %index.next167.1 = add nsw i64 %index166, 8
  %70 = icmp eq i64 %index.next167.1, 2000
  br i1 %70, label %for.cond82.for.inc97_crit_edge.us.loopexit176, label %vector.body147.vector.body147_crit_edge, !llvm.loop !20

vector.body147.vector.body147_crit_edge:          ; preds = %vector.body147
  br label %vector.body147

for.inc94.us:                                     ; preds = %for.inc94.us.for.inc94.us_crit_edge, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us.for.inc94.us_crit_edge ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %indvars.iv
  %71 = bitcast double* %arrayidx89.us to i64*
  %72 = load i64, i64* %71, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %indvars.iv
  %73 = bitcast double* %arrayidx93.us to i64*
  store i64 %72, i64* %73, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next
  %74 = bitcast double* %arrayidx89.us.1 to i64*
  %75 = load i64, i64* %74, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %indvars.iv.next
  %76 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %75, i64* %76, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %77 = bitcast double* %arrayidx89.us.2 to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %indvars.iv.next.1
  %79 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %78, i64* %79, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %80 = bitcast double* %arrayidx89.us.3 to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %indvars.iv.next.2
  %82 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %83 = bitcast double* %arrayidx89.us.4 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv87, i64 %indvars.iv.next.3
  %85 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %84, i64* %85, align 8
  %exitcond130.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond130.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us.for.inc94.us_crit_edge, !llvm.loop !21

for.inc94.us.for.inc94.us_crit_edge:              ; preds = %for.inc94.us
  br label %for.inc94.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit176:    ; preds = %vector.body147
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit176, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond90 = icmp eq i64 %53, 2000
  br i1 %exitcond90, label %for.end99, label %for.cond82.for.inc97_crit_edge.us.for.cond82.preheader.us_crit_edge

for.cond82.for.inc97_crit_edge.us.for.cond82.preheader.us_crit_edge: ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  %86 = bitcast [2000 x [2000 x double]]* %51 to i8*
  tail call void @free(i8* nonnull %86) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv52 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next53, %for.inc54.for.cond1.preheader_crit_edge ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.cond1.preheader.for.inc54_crit_edge

for.cond1.preheader.for.inc54_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.inc54_crit_edge

for.cond31.preheader.lr.ph.for.inc54_crit_edge:   ; preds = %for.cond31.preheader.lr.ph
  br label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter56 = and i64 %indvars.iv52, 1
  %lcmp.mod57 = icmp eq i64 %xtraiter56, 0
  %0 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc51_crit_edge.us.for.cond31.preheader.us_crit_edge, %for.cond31.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us.for.cond31.preheader.us_crit_edge ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod57, label %for.cond31.preheader.us.for.inc48.us.prol.loopexit.unr-lcssa_crit_edge, label %for.inc48.us.prol.preheader

for.cond31.preheader.us.for.inc48.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %1 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us.for.inc48.us.prol.loopexit.unr-lcssa_crit_edge, %for.inc48.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us.for.inc48.us.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr58.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us.for.inc48.us.prol.loopexit.unr-lcssa_crit_edge ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %0, label %for.inc48.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge, label %for.cond31.preheader.us.new

for.inc48.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge: ; preds = %for.inc48.us.prol.loopexit
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.inc48.us.for.inc48.us_crit_edge ]
  %3 = phi double [ %.unr58.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us.for.inc48.us_crit_edge ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %4 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %5 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %4, %5
  %sub47.us = fsub double %3, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %6 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %7 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %6, %7
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  br label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond51, label %for.inc54.loopexit, label %for.cond31.for.inc51_crit_edge.us.for.cond31.preheader.us_crit_edge

for.cond31.for.inc51_crit_edge.us.for.cond31.preheader.us_crit_edge: ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.inc25.for.cond4.preheader_crit_edge, %for.cond4.preheader.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc25.for.cond4.preheader_crit_edge ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.preheader, label %for.cond4.preheader.for.inc25_crit_edge

for.cond4.preheader.for.inc25_crit_edge:          ; preds = %for.cond4.preheader
  br label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge, label %for.inc.prol.preheader

for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.inc.preheader
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader.for.inc.prol.loopexit.unr-lcssa_crit_edge ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %indvars.iv34, 1
  br i1 %10, label %for.inc.prol.loopexit.for.inc25.loopexit_crit_edge, label %for.inc.preheader.new

for.inc.prol.loopexit.for.inc25.loopexit_crit_edge: ; preds = %for.inc.prol.loopexit
  br label %for.inc25.loopexit

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc.for.inc_crit_edge ]
  %11 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc.for.inc_crit_edge ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  br label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit.for.inc25.loopexit_crit_edge, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.for.inc25.loopexit_crit_edge ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader.for.inc25_crit_edge, %for.inc25.loopexit
  %16 = phi double [ %.pre, %for.cond4.preheader.for.inc25_crit_edge ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.lr.ph, label %for.inc25.for.cond4.preheader_crit_edge

for.inc25.for.cond4.preheader_crit_edge:          ; preds = %for.inc25
  br label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.cond1.preheader.for.inc54_crit_edge, %for.cond31.preheader.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond55, label %for.end56, label %for.inc54.for.cond1.preheader_crit_edge

for.inc54.for.cond1.preheader_crit_edge:          ; preds = %for.inc54
  br label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us.for.body4.us_crit_edge ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond14, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = !{!9}
!9 = distinct !{!9, !5}
!10 = !{!7, !4}
!11 = distinct !{!11, !12, !13}
!12 = !{!"llvm.loop.vectorize.width", i32 1}
!13 = !{!"llvm.loop.interleave.count", i32 1}
!14 = distinct !{!14, !12, !13}
!15 = !{!16}
!16 = distinct !{!16, !17}
!17 = distinct !{!17, !"LVerDomain"}
!18 = !{!19}
!19 = distinct !{!19, !17}
!20 = distinct !{!20, !12, !13}
!21 = distinct !{!21, !12, !13}

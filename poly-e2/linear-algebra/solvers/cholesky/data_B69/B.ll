; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc23.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %0 = phi [2000 x double]* [ %5, %for.inc23.for.cond1.preheader_crit_edge ], [ %A, %for.cond1.preheader.lr.ph ]
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc23.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.inc23.for.cond1.preheader_crit_edge ], [ 1, %for.cond1.preheader.lr.ph ]
  %indvars.iv104 = phi i32 [ %indvars.iv.next105, %for.inc23.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %sext = shl i64 %indvars.iv108, 32
  %1 = ashr exact i64 %sext, 32
  %cmp264 = icmp slt i64 %indvars.iv114, 0
  br i1 %cmp264, label %for.end, label %for.cond1.preheader.for.inc_crit_edge

for.cond1.preheader.for.inc_crit_edge:            ; preds = %for.cond1.preheader
  %wide.trip.count106 = zext i32 %indvars.iv104 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader.for.inc_crit_edge
  %indvars.iv101 = phi i64 [ 0, %for.cond1.preheader.for.inc_crit_edge ], [ %indvars.iv.next102, %for.inc ]
  %2 = sub nsw i64 0, %indvars.iv101
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv114, i64 %indvars.iv101
  store double %add, double* %arrayidx6, align 8
  %exitcond107 = icmp eq i64 %indvars.iv101, %wide.trip.count106
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  br i1 %exitcond107, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.cond1.preheader, %for.inc.for.end_crit_edge
  %4 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.cond1.preheader ]
  %indvars.iv.next115 = add i64 %indvars.iv114, 1
  %cmp967 = icmp slt i64 %indvars.iv.next115, 2000
  br i1 %cmp967, label %for.inc16.lr.ph, label %for.cond30.preheader.lr.ph.for.cond30.preheader.us_crit_edge

for.inc16.lr.ph:                                  ; preds = %for.end
  %5 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %6 = sub nsw i64 1999, %1
  %7 = sub nsw i64 0, %1
  %xtraiter = and i64 %7, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv110.prol = phi i64 [ %1, %for.inc16.prol.preheader ], [ %indvars.iv.next111.prol, %for.inc16.prol ]
  %8 = phi [2000 x double]* [ %4, %for.inc16.prol.preheader ], [ %5, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv114, i64 %indvars.iv110.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next111.prol = add nsw i64 %indvars.iv110.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %9 = add i64 %1, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv110.unr = phi i64 [ %9, %for.inc16.prol.loopexit.unr-lcssa ], [ %1, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %5, %for.inc16.prol.loopexit.unr-lcssa ], [ %4, %for.inc16.lr.ph ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc23.for.cond1.preheader_crit_edge, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next111.7, %for.inc16 ]
  %11 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv114, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next111.2 = add nsw i64 %indvars.iv110, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next111.3 = add nsw i64 %indvars.iv110, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next111.5 = add nsw i64 %indvars.iv110, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next111.6 = add nsw i64 %indvars.iv110, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv.next111.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond113.7 = icmp eq i64 %indvars.iv.next111.6, 1999
  %indvars.iv.next111.7 = add nsw i64 %indvars.iv110, 8
  br i1 %exitcond113.7, label %for.inc23.for.cond1.preheader_crit_edge.loopexit, label %for.inc16

for.inc23.for.cond1.preheader_crit_edge.loopexit: ; preds = %for.inc16
  br label %for.inc23.for.cond1.preheader_crit_edge

for.inc23.for.cond1.preheader_crit_edge:          ; preds = %for.inc23.for.cond1.preheader_crit_edge.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next105 = add i32 %indvars.iv104, 1
  %indvars.iv.next109 = add nsw i64 %1, 1
  br label %for.cond1.preheader

for.cond30.preheader.lr.ph.for.cond30.preheader.us_crit_edge: ; preds = %for.end
  %arrayidx22119 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv114, i64 %indvars.iv114
  store double 1.000000e+00, double* %arrayidx22119, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us, %for.cond30.preheader.lr.ph.for.cond30.preheader.us_crit_edge
  %indvars.iv98 = phi i64 [ 0, %for.cond30.preheader.lr.ph.for.cond30.preheader.us_crit_edge ], [ %indvars.iv.next99.4, %for.cond30.preheader.us ]
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv98, i64 0
  %scevgep97 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv98, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next, i64 0
  %scevgep97.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv98, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.1, i64 0
  %scevgep97.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv98, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.2, i64 0
  %scevgep97.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv98, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.3, i64 0
  %scevgep97.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep97.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next99.4 = add nuw nsw i64 %indvars.iv98, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next99.4, 2000
  br i1 %cmp27.us.4, label %for.cond30.preheader.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.cond30.preheader.us
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge

for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge: ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv90 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %14, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv90
  %14 = add i64 %indvars.iv90, 1
  %scevgep136 = getelementptr [2000 x double], [2000 x double]* %13, i64 1999, i64 %14
  br label %vector.memcheck

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %14, 2000
  br i1 %cmp45.us, label %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge, label %vector.memcheck161.preheader

vector.memcheck161.preheader:                     ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %vector.memcheck161

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge
  %indvars.iv88 = phi i64 [ 0, %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge ], [ %indvars.iv.next89, %for.cond52.for.inc72_crit_edge.us.us ]
  %15 = bitcast double* %scevgep134 to i8*
  %16 = bitcast double* %scevgep136 to i8*
  %17 = mul i64 %indvars.iv88, 16000
  %scevgep132 = getelementptr i8, i8* %call, i64 %17
  %18 = add i64 %17, 16000
  %scevgep133 = getelementptr i8, i8* %call, i64 %18
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv88, i64 %indvars.iv90
  %bound0 = icmp ult i8* %scevgep132, %16
  %bound1 = icmp ult i8* %15, %scevgep133
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0139 = icmp ult i8* %scevgep132, %bc
  %bound1140 = icmp ult i8* %bc, %scevgep133
  %found.conflict141 = and i1 %bound0139, %bound1140
  %conflict.rdx = or i1 %found.conflict, %found.conflict141
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = or i64 %index, 1
  %21 = or i64 %index, 2
  %22 = or i64 %index, 3
  %23 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %index, i64 %indvars.iv90
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %20, i64 %indvars.iv90
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %21, i64 %indvars.iv90
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %22, i64 %indvars.iv90
  %30 = load double, double* %26, align 8, !alias.scope !6
  %31 = load double, double* %27, align 8, !alias.scope !6
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = insertelement <2 x double> %34, double %31, i32 1
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = fmul <2 x double> %25, %35
  %39 = fmul <2 x double> %25, %37
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv88, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load143 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = fadd <2 x double> %38, %wide.load
  %45 = fadd <2 x double> %39, %wide.load143
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.cond52.for.inc72_crit_edge.us.us.loopexit177, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit177: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit177, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next89 = add nuw i64 %indvars.iv88, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next89, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.cond48.for.inc75_crit_edge.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv84 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next85.1, %for.inc69.us.us ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv84, i64 %indvars.iv90
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv88, i64 %indvars.iv84
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %50
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next85 = or i64 %indvars.iv84, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next85, i64 %indvars.iv90
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv88, i64 %indvars.iv.next85
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %53
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond87.1 = icmp eq i64 %indvars.iv.next85, 1999
  %indvars.iv.next85.1 = add nuw nsw i64 %indvars.iv84, 2
  br i1 %exitcond87.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck161:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck161.preheader
  %indvars.iv81 = phi i64 [ 0, %vector.memcheck161.preheader ], [ %55, %for.cond82.for.inc97_crit_edge.us ]
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 0
  %55 = add i64 %indvars.iv81, 1
  %scevgep151 = getelementptr [2000 x double], [2000 x double]* %13, i64 %55, i64 0
  %scevgep153 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv81, i64 0
  %scevgep155 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %55, i64 0
  %bound0157 = icmp ult double* %scevgep149, %scevgep155
  %bound1158 = icmp ult double* %scevgep153, %scevgep151
  %memcheck.conflict160 = and i1 %bound0157, %bound1158
  br i1 %memcheck.conflict160, label %for.inc94.us.preheader, label %vector.body144.preheader

vector.body144.preheader:                         ; preds = %vector.memcheck161
  br label %vector.body144

for.inc94.us.preheader:                           ; preds = %vector.memcheck161
  br label %for.inc94.us

vector.body144:                                   ; preds = %vector.body144, %vector.body144.preheader
  %index163 = phi i64 [ 0, %vector.body144.preheader ], [ %index.next164.1, %vector.body144 ]
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv81, i64 %index163
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load171 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !15
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load172 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %index163
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load171, <2 x i64>* %62, align 8, !alias.scope !18, !noalias !15
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load172, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %index.next164 = or i64 %index163, 4
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv81, i64 %index.next164
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load171.1 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !15
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load172.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %index.next164
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load171.1, <2 x i64>* %70, align 8, !alias.scope !18, !noalias !15
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load172.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %index.next164.1 = add nuw nsw i64 %index163, 8
  %73 = icmp eq i64 %index.next164.1, 2000
  br i1 %73, label %for.cond82.for.inc97_crit_edge.us.loopexit176, label %vector.body144, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %74 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv81, i64 %indvars.iv
  %75 = bitcast double* %arrayidx89.us to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %indvars.iv
  %77 = bitcast double* %arrayidx93.us to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next
  %78 = bitcast double* %arrayidx89.us.1 to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %indvars.iv.next
  %80 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %81 = bitcast double* %arrayidx89.us.2 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %83 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %84 = bitcast double* %arrayidx89.us.3 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %86 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.3
  %87 = bitcast double* %arrayidx89.us.4 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv81, i64 %indvars.iv.next.3
  %89 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %88, i64* %89, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit176:    ; preds = %vector.body144
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit176, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %55, 2000
  br i1 %cmp79.us, label %vector.memcheck161, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc56.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv41 = phi i2 [ %indvars.iv.next42, %for.inc56.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc56.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %indvars.iv29 = phi i32 [ %indvars.iv.next30, %for.inc56.for.cond1.preheader_crit_edge ], [ -1, %for.cond1.preheader.lr.ph ]
  %0 = zext i2 %indvars.iv41 to i64
  %1 = add i64 %indvars.iv33, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp28 = icmp sgt i64 %indvars.iv33, 0
  br i1 %cmp28, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.cond1.preheader
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv33
  %.pre37 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv33
  %.pre36 = load double, double* %arrayidx43, align 8
  %wide.trip.count31 = zext i32 %indvars.iv29 to i64
  %xtraiter38 = and i64 %indvars.iv33, 3
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %3 = phi double [ %.pre36, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv27.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next28.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter38, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv27.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr40 = phi double [ %.pre36, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv27.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %0, %for.inc45.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %2, 3
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next26, %for.inc25 ]
  %indvars.iv23 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next24, %for.inc25 ]
  %6 = add i64 %indvars.iv25, 4294967295
  %7 = and i64 %6, 4294967295
  %cmp56 = icmp sgt i64 %indvars.iv25, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv25
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp56, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %wide.trip.count = zext i32 %indvars.iv23 to i64
  %8 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv25, i64 0
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %12 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv25
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next26 = add nuw i64 %indvars.iv25, 1
  %cmp2 = icmp slt i64 %indvars.iv.next26, %indvars.iv33
  %indvars.iv.next24 = add nsw i32 %indvars.iv23, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %19 = phi double [ %.unr40, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next28.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv27
  %20 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %20, %20
  %sub44 = fsub double %19, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next28
  %21 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %21, %21
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next28.1
  %22 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %22, %22
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next28.2 = add nsw i64 %indvars.iv27, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next28.2
  %23 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %23, %23
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond32.3 = icmp eq i64 %indvars.iv.next28.2, %wide.trip.count31
  %indvars.iv.next28.3 = add nsw i64 %indvars.iv27, 4
  br i1 %exitcond32.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit ], [ %arrayidx43, %for.inc56.loopexit ]
  %24 = phi double [ %.pre37, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = call double @sqrt(double %24) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next34 = add i64 %indvars.iv33, 1
  %cmp = icmp slt i64 %indvars.iv.next34, 2000
  %indvars.iv.next30 = add i32 %indvars.iv29, 1
  br i1 %cmp, label %for.inc56.for.cond1.preheader_crit_edge, label %for.end58

for.inc56.for.cond1.preheader_crit_edge:          ; preds = %for.inc56
  %indvars.iv.next42 = add i2 %indvars.iv41, 1
  br label %for.cond1.preheader

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp32 = icmp slt i64 %indvars.iv8, 0
  br i1 %cmp32, label %for.inc10, label %for.cond2.preheader.for.body4_crit_edge

for.cond2.preheader.for.body4_crit_edge:          ; preds = %for.cond2.preheader
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader.for.body4_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.for.body4_crit_edge ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10.loopexit

for.inc10.loopexit:                               ; preds = %for.inc
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.cond2.preheader
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
!22 = distinct !{!22, !2}

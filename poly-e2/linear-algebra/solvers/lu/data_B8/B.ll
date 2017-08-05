; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_lu([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2000 x double]* %A) #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc23.for.cond1.preheader_crit_edge, %entry
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.lcssa11, %for.inc23.for.cond1.preheader_crit_edge ]
  %indvars.iv126 = phi i64 [ 0, %entry ], [ %indvars.iv.next127, %for.inc23.for.cond1.preheader_crit_edge ]
  %indvars.iv121 = phi i64 [ 1, %entry ], [ %indvars.iv.next122, %for.inc23.for.cond1.preheader_crit_edge ]
  %indvars.iv117 = phi i32 [ 1, %entry ], [ %indvars.iv.next118, %for.inc23.for.cond1.preheader_crit_edge ]
  %1 = sub i64 1999, %indvars.iv126
  %2 = trunc i64 %1 to i32
  %3 = sub i64 1998, %indvars.iv126
  %4 = trunc i64 %3 to i32
  %cmp267 = icmp slt i64 %indvars.iv126, 0
  br i1 %cmp267, label %for.cond8.preheader, label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  %wide.trip.count119 = zext i32 %indvars.iv117 to i64
  br label %for.inc

for.cond8.preheader.loopexit:                     ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.cond1.preheader, %for.cond8.preheader.loopexit
  %5 = phi [2000 x double]* [ %.pre, %for.cond8.preheader.loopexit ], [ %0, %for.cond1.preheader ]
  %indvars.iv.next127 = add nsw i64 %indvars.iv126, 1
  %cmp971 = icmp slt i64 %indvars.iv.next127, 2000
  br i1 %cmp971, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %6 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter = and i32 %2, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv123.prol = phi i64 [ %indvars.iv121, %for.inc16.prol.preheader ], [ %indvars.iv.next124.prol, %for.inc16.prol ]
  %7 = phi [2000 x double]* [ %5, %for.inc16.prol.preheader ], [ %6, %for.inc16.prol ]
  %prol.iter = phi i32 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv126, i64 %indvars.iv123.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next124.prol = add nsw i64 %indvars.iv123.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv123.unr = phi i64 [ %indvars.iv121, %for.inc16.lr.ph ], [ %indvars.iv.next124.prol, %for.inc16.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %5, %for.inc16.lr.ph ], [ %6, %for.inc16.prol.loopexit.loopexit ]
  %8 = icmp ult i32 %4, 7
  br i1 %8, label %for.inc23, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv114 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next115, %for.inc ]
  %9 = sub nsw i64 0, %indvars.iv114
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv126, i64 %indvars.iv114
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next115, %wide.trip.count119
  br i1 %exitcond120, label %for.cond8.preheader.loopexit, label %for.inc

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv123 = phi i64 [ %indvars.iv123.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next124.7, %for.inc16 ]
  %11 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %6, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv126, i64 %indvars.iv123
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next124 = add nsw i64 %indvars.iv123, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next124.1 = add nsw i64 %indvars.iv123, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next124.2 = add nsw i64 %indvars.iv123, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next124.3 = add nsw i64 %indvars.iv123, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next124.4 = add nsw i64 %indvars.iv123, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next124.5 = add nsw i64 %indvars.iv123, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next124.6 = add nsw i64 %indvars.iv123, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv126, i64 %indvars.iv.next124.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next124.7 = add nsw i64 %indvars.iv123, 8
  %lftr.wideiv.7 = trunc i64 %indvars.iv.next124.7 to i32
  %exitcond125.7 = icmp eq i32 %lftr.wideiv.7, 2000
  br i1 %exitcond125.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit, %for.cond8.preheader
  %.lcssa11 = phi [2000 x double]* [ %5, %for.cond8.preheader ], [ %6, %for.inc16.prol.loopexit ], [ %6, %for.inc23.loopexit ]
  %12 = icmp slt i64 %indvars.iv.next127, 2000
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa11, i64 %indvars.iv126, i64 %indvars.iv126
  store double 1.000000e+00, double* %arrayidx22, align 8
  br i1 %12, label %for.inc23.for.cond1.preheader_crit_edge, label %for.end25

for.inc23.for.cond1.preheader_crit_edge:          ; preds = %for.inc23
  %indvars.iv.next122 = add nsw i64 %indvars.iv121, 1
  %indvars.iv.next118 = add i32 %indvars.iv117, 1
  br label %for.cond1.preheader

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvar130 = phi i64 [ 0, %for.end25 ], [ %indvar.next131.4, %for.cond30.for.inc41_crit_edge.us ]
  %indvars.iv110 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next111.4, %for.cond30.for.inc41_crit_edge.us ]
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvar130, i64 0
  %scevgep132 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next131 = add nuw nsw i64 %indvar130, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvar.next131, i64 0
  %scevgep132.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next131.1 = add nsw i64 %indvar130, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar.next131.1, i64 0
  %scevgep132.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next131.2 = add nsw i64 %indvar130, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next131.2, i64 0
  %scevgep132.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next131.3 = add nsw i64 %indvar130, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next131.3, i64 0
  %scevgep132.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep132.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next111.4, 2000
  %indvar.next131.4 = add nsw i64 %indvar130, 5
  br i1 %cmp27.us.4, label %for.cond30.for.inc41_crit_edge.us, label %for.cond48.preheader.lr.ph

for.cond48.preheader.lr.ph:                       ; preds = %for.cond30.for.inc41_crit_edge.us
  %18 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond48.preheader.us

for.cond48.preheader.us:                          ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.lr.ph
  %indvars.iv101 = phi i64 [ 0, %for.cond48.preheader.lr.ph ], [ %indvars.iv.next102, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %18, i64 0, i64 %indvars.iv101
  %19 = add i64 %indvars.iv101, -1999
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %18, i64 2000, i64 %19
  br label %vector.memcheck

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next102, 2000
  br i1 %cmp45.us, label %for.cond48.preheader.us, label %for.cond82.preheader.lr.ph

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond48.preheader.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.cond52.for.inc72_crit_edge.us.us ], [ 0, %for.cond48.preheader.us ]
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv97, i64 0
  %scevgep3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv97, i64 2000
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv97, i64 %indvars.iv101
  %bound0 = icmp ult double* %scevgep1, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep1, %arrayidx59.us.us
  %bound111 = icmp ult double* %arrayidx59.us.us, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %index, i64 %indvars.iv101
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %22, i64 %indvars.iv101
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %23, i64 %indvars.iv101
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %24, i64 %indvars.iv101
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = fmul <2 x double> %27, %37
  %41 = fmul <2 x double> %27, %39
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv97, i64 %index
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = fadd <2 x double> %40, %wide.load
  %47 = fadd <2 x double> %41, %wide.load14
  store <2 x double> %46, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %47, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %48 = icmp eq i64 %index.next, 2000
  br i1 %48, label %middle.block, label %vector.body, !llvm.loop !11

middle.block:                                     ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond100, label %for.cond48.for.inc75_crit_edge.us, label %vector.memcheck

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv93 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next94.1, %for.inc69.us.us ]
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %50 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv93, i64 %indvars.iv101
  %51 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %50, %51
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv97, i64 %indvars.iv93
  %52 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %52
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next94 = or i64 %indvars.iv93, 1
  %53 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv.next94, i64 %indvars.iv101
  %54 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %53, %54
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv97, i64 %indvars.iv.next94
  %55 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %55
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next94.1 = add nsw i64 %indvars.iv93, 2
  %exitcond96.1 = icmp eq i64 %indvars.iv.next94.1, 2000
  br i1 %exitcond96.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.cond82.preheader.lr.ph:                       ; preds = %for.cond48.for.inc75_crit_edge.us
  %56 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %vector.memcheck36

vector.memcheck36:                                ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.lr.ph
  %indvars.iv90 = phi i64 [ 0, %for.cond82.preheader.lr.ph ], [ %indvars.iv.next91, %for.cond82.for.inc97_crit_edge.us ]
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 0
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 2000
  %scevgep28 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv90, i64 0
  %scevgep30 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv90, i64 2000
  %bound032 = icmp ult double* %scevgep24, %scevgep30
  %bound133 = icmp ult double* %scevgep28, %scevgep26
  %memcheck.conflict35 = and i1 %bound032, %bound133
  br i1 %memcheck.conflict35, label %for.inc94.us.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %vector.memcheck36
  br label %vector.body15

vector.body15:                                    ; preds = %vector.body15, %vector.body15.preheader
  %index38 = phi i64 [ 0, %vector.body15.preheader ], [ %index.next39.1, %vector.body15 ]
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv90, i64 %index38
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load46 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load47 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !15
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %index38
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load46, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load47, <2 x i64>* %66, align 8, !alias.scope !18, !noalias !15
  %index.next39 = or i64 %index38, 4
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv90, i64 %index.next39
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load46.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load47.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !15
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %index.next39
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load46.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load47.1, <2 x i64>* %74, align 8, !alias.scope !18, !noalias !15
  %index.next39.1 = add nsw i64 %index38, 8
  %75 = icmp eq i64 %index.next39.1, 2000
  br i1 %75, label %middle.block16, label %vector.body15, !llvm.loop !20

middle.block16:                                   ; preds = %vector.body15
  br label %for.cond82.for.inc97_crit_edge.us

for.inc94.us.preheader:                           ; preds = %vector.memcheck36
  br label %for.inc94.us

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %76 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv90, i64 %indvars.iv
  %77 = bitcast double* %arrayidx89.us to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %indvars.iv
  %79 = bitcast double* %arrayidx93.us to i64*
  store i64 %78, i64* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv90, i64 %indvars.iv.next
  %80 = bitcast double* %arrayidx89.us.1 to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv90, i64 %indvars.iv.next.1
  %83 = bitcast double* %arrayidx89.us.2 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %84, i64* %85, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv90, i64 %indvars.iv.next.2
  %86 = bitcast double* %arrayidx89.us.3 to i64*
  %87 = load i64, i64* %86, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %87, i64* %88, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv90, i64 %indvars.iv.next.3
  %89 = bitcast double* %arrayidx89.us.4 to i64*
  %90 = load i64, i64* %89, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %56, i64 %indvars.iv90, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %90, i64* %91, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %middle.block16
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next91, 2000
  br i1 %cmp79.us, label %vector.memcheck36, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_lu([2000 x double]* %A) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %0 = phi [2000 x double]* [ %A, %entry ], [ %23, %for.inc54 ]
  %indvars.iv57 = phi i64 [ 0, %entry ], [ %indvars.iv.next58, %for.inc54 ]
  %indvars.iv54 = phi i32 [ 0, %entry ], [ %indvars.iv.next55, %for.inc54 ]
  %inc49.lcssa24.lcssa27 = phi i32 [ undef, %entry ], [ %inc49.lcssa24.lcssa28, %for.inc54 ]
  %cmp213 = icmp sgt i64 %indvars.iv57, 0
  br i1 %cmp213, label %for.cond4.preheader.preheader, label %for.cond28.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %wide.trip.count40 = zext i32 %indvars.iv54 to i64
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.loopexit:                    ; preds = %for.inc25
  br label %for.cond28.preheader

for.cond28.preheader:                             ; preds = %for.cond28.preheader.loopexit, %for.cond1.preheader
  %inc49.lcssa24.lcssa26 = phi i32 [ %inc49.lcssa24.lcssa27, %for.cond1.preheader ], [ %inc.lcssa16, %for.cond28.preheader.loopexit ]
  %indvars.iv57.off = add i64 %indvars.iv57, -1
  %1 = icmp ugt i64 %indvars.iv57.off, 1998
  br i1 %1, label %for.cond28.preheader.for.inc54_crit_edge, label %for.cond31.preheader.us.preheader

for.cond28.preheader.for.inc54_crit_edge:         ; preds = %for.cond28.preheader
  %2 = icmp sgt i64 %indvars.iv57, 1999
  %inc49.lcssa24.lcssa26.mux = select i1 %2, i32 %inc49.lcssa24.lcssa26, i32 0
  %.mux = select i1 %2, [2000 x double]* %0, [2000 x double]* %A
  br label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond28.preheader
  %wide.trip.count = zext i32 %indvars.iv54 to i64
  %xtraiter1 = and i64 %indvars.iv57, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc51_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv57, %for.cond31.preheader.us.preheader ]
  %3 = icmp eq i64 %xtraiter1, 0
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv52
  %.pre60 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %3, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %4 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv52
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %4, %5
  %sub47.us.prol = fsub double %.pre60, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.cond31.preheader.us
  %.unr3.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre60, %for.cond31.preheader.us ]
  %indvars.iv43.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %6 = icmp eq i64 %indvars.iv57, 1
  br i1 %6, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %7 = phi double [ %.unr3.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %indvars.iv43 = phi i64 [ %indvars.iv43.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next44.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv43
  %8 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv52
  %9 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %8, %9
  %sub47.us = fsub double %7, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv57, i64 %indvars.iv.next44
  %10 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next44, i64 %indvars.iv52
  %11 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %10, %11
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count
  br i1 %exitcond49.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %lftr.wideiv = trunc i64 %indvars.iv.next53 to i32
  %exitcond56 = icmp eq i32 %lftr.wideiv, 2000
  br i1 %exitcond56, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next37, %for.inc25 ]
  %indvars.iv32 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %12, %for.inc25 ]
  %12 = add i32 %indvars.iv32, 1
  %cmp59 = icmp sgt i64 %indvars.iv36, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv36
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp59, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv36, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %13 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv36
  %14 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %13, %14
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %15 = icmp eq i64 %indvars.iv36, 1
  br i1 %15, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %16 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv
  %17 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv36
  %18 = load double, double* %arrayidx12, align 8
  %mul = fmul double %17, %18
  %sub = fsub double %16, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv36
  %20 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %19, %20
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv36
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %21 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %inc.lcssa16 = phi i32 [ 0, %for.cond4.preheader ], [ %12, %for.inc.prol.loopexit ], [ %12, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv36, i64 %indvars.iv36
  %22 = load double, double* %arrayidx20, align 8
  %div = fdiv double %21, %22
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %wide.trip.count40
  br i1 %exitcond41, label %for.cond28.preheader.loopexit, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond28.preheader.for.inc54_crit_edge
  %23 = phi [2000 x double]* [ %.mux, %for.cond28.preheader.for.inc54_crit_edge ], [ %A, %for.inc54.loopexit ]
  %inc49.lcssa24.lcssa28 = phi i32 [ %inc49.lcssa24.lcssa26.mux, %for.cond28.preheader.for.inc54_crit_edge ], [ %indvars.iv54, %for.inc54.loopexit ]
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %cmp = icmp slt i64 %indvars.iv.next58, 2000
  %indvars.iv.next55 = add i32 %indvars.iv54, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.end56

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2000 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv12, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 2000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

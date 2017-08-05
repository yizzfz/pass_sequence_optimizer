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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv124 = phi i64 [ 0, %entry ], [ %indvars.iv.next125, %for.inc23 ]
  %indvars.iv122 = phi i64 [ 1, %entry ], [ %indvars.iv.next123, %for.inc23 ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.lcssa10, %for.inc23 ]
  %1 = sub i64 1999, %indvars.iv124
  %2 = sub i64 1998, %indvars.iv124
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %cmp970 = icmp slt i64 %indvars.iv.next125, 2000
  br i1 %cmp970, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %3 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv118.prol = phi i64 [ %indvars.iv122, %for.inc16.prol.preheader ], [ %indvars.iv.next119.prol, %for.inc16.prol ]
  %4 = phi [2000 x double]* [ %.pre, %for.inc16.prol.preheader ], [ %3, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv124, i64 %indvars.iv118.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next119.prol = add nuw nsw i64 %indvars.iv118.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv118.unr = phi i64 [ %indvars.iv122, %for.inc16.lr.ph ], [ %indvars.iv.next119.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %.unr = phi [2000 x double]* [ %.pre, %for.inc16.lr.ph ], [ %3, %for.inc16.prol.loopexit.unr-lcssa ]
  %5 = icmp ult i64 %2, 7
  br i1 %5, label %for.inc23.loopexit, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv109 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next110, %for.inc ]
  %6 = sub nsw i64 0, %indvars.iv109
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv124, i64 %indvars.iv109
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next110, %indvars.iv122
  br i1 %exitcond115, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next119.7, %for.inc16 ]
  %8 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %3, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv124, i64 %indvars.iv118
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next119.2 = add nsw i64 %indvars.iv118, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next119.3 = add nsw i64 %indvars.iv118, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next119.4 = add nsw i64 %indvars.iv118, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next119.5 = add nsw i64 %indvars.iv118, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next119.6 = add nsw i64 %indvars.iv118, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv124, i64 %indvars.iv.next119.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond130.7 = icmp eq i64 %indvars.iv.next119.6, 1999
  %indvars.iv.next119.7 = add nsw i64 %indvars.iv118, 8
  br i1 %exitcond130.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.cond8.preheader
  %.lcssa10 = phi [2000 x double]* [ %.pre, %for.cond8.preheader ], [ %3, %for.inc23.loopexit ]
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.lcssa10, i64 %indvars.iv124, i64 %indvars.iv124
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 2000
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond127, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %9 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %9, align 8
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvars.iv105 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next106.7, %for.cond30.for.inc41_crit_edge.us ]
  %10 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %11 = mul nuw nsw i64 %indvars.iv.next106, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.1 = or i64 %indvars.iv105, 2
  %12 = mul nuw nsw i64 %indvars.iv.next106.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.2 = or i64 %indvars.iv105, 3
  %13 = mul nuw nsw i64 %indvars.iv.next106.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.3 = or i64 %indvars.iv105, 4
  %14 = mul nuw nsw i64 %indvars.iv.next106.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.4 = or i64 %indvars.iv105, 5
  %15 = mul nuw nsw i64 %indvars.iv.next106.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.5 = or i64 %indvars.iv105, 6
  %16 = mul nuw nsw i64 %indvars.iv.next106.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.6 = or i64 %indvars.iv105, 7
  %17 = mul nuw nsw i64 %indvars.iv.next106.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond129.7 = icmp eq i64 %indvars.iv.next106.6, 1999
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  br i1 %exitcond129.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  %18 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %19 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %indvars.iv.next98, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %18, i64 0, i64 %indvars.iv97
  %20 = add i64 %indvars.iv97, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %18, i64 1999, i64 %20
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next98, 2000
  br i1 %exitcond135, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv93 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next94, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep137 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 0
  %21 = add i64 %indvars.iv93, 1
  %scevgep139 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %21, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv93, i64 %indvars.iv97
  %bound0 = icmp ult double* %scevgep137, %scevgep143
  %bound1 = icmp ult double* %scevgep141, %scevgep139
  %found.conflict = and i1 %bound0, %bound1
  %bound0146 = icmp ult double* %scevgep137, %arrayidx59.us.us
  %bound1147 = icmp ult double* %arrayidx59.us.us, %scevgep139
  %found.conflict148 = and i1 %bound0146, %bound1147
  %conflict.rdx = or i1 %found.conflict, %found.conflict148
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %index, i64 %indvars.iv97
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %22, i64 %indvars.iv97
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %23, i64 %indvars.iv97
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %24, i64 %indvars.iv97
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = load double, double* %32, align 8, !alias.scope !6
  %37 = load double, double* %33, align 8, !alias.scope !6
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %27, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !8, !noalias !10
  %48 = fadd <2 x double> %42, %wide.load
  %49 = fadd <2 x double> %43, %wide.load150
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !8, !noalias !10
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %for.cond52.for.inc72_crit_edge.us.us.loopexit181, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit181: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit181, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond134, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next90.1, %for.inc69.us.us ]
  %53 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv89, i64 %indvars.iv97
  %54 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %53, %54
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv89
  %55 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %55
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %56 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv.next90, i64 %indvars.iv97
  %57 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %56, %57
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next90
  %58 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %58
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next90, 1999
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  %59 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %60 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next86, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep156 = getelementptr [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 0
  %61 = add i64 %indvars.iv85, 1
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %60, i64 %61, i64 0
  %scevgep160 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 0
  %scevgep162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %61, i64 0
  %bound0164 = icmp ult double* %scevgep156, %scevgep162
  %bound1165 = icmp ult double* %scevgep160, %scevgep158
  %memcheck.conflict167 = and i1 %bound0164, %bound1165
  br i1 %memcheck.conflict167, label %for.inc94.us.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body151

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body151:                                   ; preds = %vector.body151, %vector.body151.preheader
  %index170 = phi i64 [ 0, %vector.body151.preheader ], [ %index.next171.1, %vector.body151 ]
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %index170
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load178 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load179 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !15
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %index170
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load178, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load179, <2 x i64>* %69, align 8, !alias.scope !18, !noalias !15
  %index.next171 = or i64 %index170, 4
  %70 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %index.next171
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load178.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !15
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load179.1 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !15
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %index.next171
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load178.1, <2 x i64>* %75, align 8, !alias.scope !18, !noalias !15
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load179.1, <2 x i64>* %77, align 8, !alias.scope !18, !noalias !15
  %index.next171.1 = add nsw i64 %index170, 8
  %78 = icmp eq i64 %index.next171.1, 2000
  br i1 %78, label %for.cond82.for.inc97_crit_edge.us.loopexit180, label %vector.body151, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %79 = bitcast double* %arrayidx89.us to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %indvars.iv
  %81 = bitcast double* %arrayidx93.us to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx89.us.1 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx89.us.2 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx89.us.3 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx89.us.4 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %92, i64* %93, align 8
  %exitcond128.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond128.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit180:    ; preds = %vector.body151
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit180, %for.cond82.for.inc97_crit_edge.us.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next86, 2000
  br i1 %exitcond133, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %94 = bitcast [2000 x [2000 x double]]* %59 to i8*
  tail call void @free(i8* %94) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc54
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc54 ], [ 0, %entry ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %0 = icmp sgt i64 %indvars.iv52, 0
  br i1 %0, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter58 = and i64 %indvars.iv52, 1
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  %1 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod59, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %2 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %3 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %2, %3
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr60.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %1, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.inc48.us ]
  %4 = phi double [ %.unr60.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %5 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %6 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %5, %6
  %sub47.us = fsub double %4, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %7 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %8 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %7, %8
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond56, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %indvars.iv34, 1
  br i1 %11, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %12 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %18 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond57, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

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

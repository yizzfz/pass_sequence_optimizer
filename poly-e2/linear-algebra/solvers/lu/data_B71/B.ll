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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
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
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv116 = phi i64 [ 0, %entry ], [ %indvars.iv.next117, %for.inc23 ]
  %indvars.iv114 = phi i64 [ 1, %entry ], [ %indvars.iv.next115, %for.inc23 ]
  %0 = phi [2000 x double]* [ %A, %entry ], [ %.pre, %for.inc23 ]
  %1 = sub i64 1999, %indvars.iv116
  %2 = sub i64 1998, %indvars.iv116
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv101 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next102, %for.inc ]
  %3 = sub nsw i64 0, %indvars.iv101
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv101
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next102, %indvars.iv114
  br i1 %exitcond107, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %cmp964 = icmp slt i64 %indvars.iv.next117, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.end
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv110.prol = phi i64 [ %indvars.iv114, %for.inc16.prol.preheader ], [ %indvars.iv.next111.prol, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv110.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next111.prol = add nuw nsw i64 %indvars.iv110.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv110.unr = phi i64 [ %indvars.iv114, %for.inc16.lr.ph ], [ %indvars.iv.next111.prol, %for.inc16.prol.loopexit.unr-lcssa ]
  %5 = icmp ult i64 %2, 7
  br i1 %5, label %for.inc23.loopexit, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv110 = phi i64 [ %indvars.iv110.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next111.7, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv110
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next111.1 = add nsw i64 %indvars.iv110, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next111.2 = add nsw i64 %indvars.iv110, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next111.3 = add nsw i64 %indvars.iv110, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next111.4 = add nsw i64 %indvars.iv110, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next111.5 = add nsw i64 %indvars.iv110, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next111.6 = add nsw i64 %indvars.iv110, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv.next111.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond122.7 = icmp eq i64 %indvars.iv.next111.6, 1999
  %indvars.iv.next111.7 = add nsw i64 %indvars.iv110, 8
  br i1 %exitcond122.7, label %for.inc23.loopexit.unr-lcssa, label %for.inc16

for.inc23.loopexit.unr-lcssa:                     ; preds = %for.inc16
  br label %for.inc23.loopexit

for.inc23.loopexit:                               ; preds = %for.inc16.prol.loopexit, %for.inc23.loopexit.unr-lcssa
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv116, i64 %indvars.iv116
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br i1 %exitcond119, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %6, align 8
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvars.iv97 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next98.7, %for.cond30.for.inc41_crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv97, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98 = or i64 %indvars.iv97, 1
  %9 = mul nuw nsw i64 %indvars.iv.next98, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.1 = or i64 %indvars.iv97, 2
  %10 = mul nuw nsw i64 %indvars.iv.next98.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.2 = or i64 %indvars.iv97, 3
  %11 = mul nuw nsw i64 %indvars.iv.next98.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.3 = or i64 %indvars.iv97, 4
  %12 = mul nuw nsw i64 %indvars.iv.next98.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.4 = or i64 %indvars.iv97, 5
  %13 = mul nuw nsw i64 %indvars.iv.next98.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.5 = or i64 %indvars.iv97, 6
  %14 = mul nuw nsw i64 %indvars.iv.next98.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next98.6 = or i64 %indvars.iv97, 7
  %15 = mul nuw nsw i64 %indvars.iv.next98.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond121.7 = icmp eq i64 %indvars.iv.next98.6, 1999
  %indvars.iv.next98.7 = add nsw i64 %indvars.iv97, 8
  br i1 %exitcond121.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond127 = icmp eq i64 %16, 2000
  br i1 %exitcond127, label %for.body81.us.preheader, label %for.body51.lr.ph.us

for.body51.lr.ph.us:                              ; preds = %for.cond48.preheader.us.preheader, %for.inc75.us
  %indvars.iv89 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %16, %for.inc75.us ]
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 0, i64 %indvars.iv89
  %16 = add nuw nsw i64 %indvars.iv89, 1
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %.pre, i64 1999, i64 %16
  br label %for.body51.us.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv85 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %17, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep129 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv85, i64 0
  %17 = add nuw nsw i64 %indvars.iv85, 1
  %scevgep131 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %17, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv85, i64 %indvars.iv89
  %bound0 = icmp ult double* %scevgep129, %scevgep135
  %bound1 = icmp ult double* %scevgep133, %scevgep131
  %found.conflict = and i1 %bound0, %bound1
  %bound0138 = icmp ult double* %scevgep129, %arrayidx59.us.us
  %bound1139 = icmp ult double* %arrayidx59.us.us, %scevgep131
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx = or i1 %found.conflict, %found.conflict140
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %18 = or i64 %index, 1
  %19 = or i64 %index, 2
  %20 = or i64 %index, 3
  %21 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %22 = insertelement <2 x double> undef, double %21, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %index, i64 %indvars.iv89
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %18, i64 %indvars.iv89
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %19, i64 %indvars.iv89
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %20, i64 %indvars.iv89
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
  %38 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv85, i64 %index
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !8, !noalias !10
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %42 = fadd <2 x double> %wide.load, %36
  %43 = fadd <2 x double> %wide.load142, %37
  store <2 x double> %42, <2 x double>* %39, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %43, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %44 = icmp eq i64 %index.next, 2000
  br i1 %44, label %for.cond52.for.inc72_crit_edge.us.us.loopexit173, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit173: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit173, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %exitcond126 = icmp eq i64 %17, 2000
  br i1 %exitcond126, label %for.inc75.us, label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv81 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next82.1, %for.inc69.us.us ]
  %45 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv81, i64 %indvars.iv89
  %46 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %45, %46
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv85, i64 %indvars.iv81
  %47 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %47, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next82 = or i64 %indvars.iv81, 1
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv.next82, i64 %indvars.iv89
  %49 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %48, %49
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next82
  %50 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %50, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next82, 1999
  %indvars.iv.next82.1 = add nsw i64 %indvars.iv81, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

for.body81.us.preheader:                          ; preds = %for.inc75.us
  %51 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %52 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us, %for.body81.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.body81.us.preheader ], [ %53, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 0
  %53 = add nuw nsw i64 %indvars.iv77, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %52, i64 %53, i64 0
  %scevgep152 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 0
  %scevgep154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %53, i64 0
  %bound0156 = icmp ult double* %scevgep148, %scevgep154
  %bound1157 = icmp ult double* %scevgep152, %scevgep150
  %memcheck.conflict159 = and i1 %bound0156, %bound1157
  br i1 %memcheck.conflict159, label %for.inc94.us.preheader, label %vector.body143.preheader

vector.body143.preheader:                         ; preds = %for.body81.us
  br label %vector.body143

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body143:                                   ; preds = %vector.body143, %vector.body143.preheader
  %index162 = phi i64 [ 0, %vector.body143.preheader ], [ %index.next163.1, %vector.body143 ]
  %54 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %index162
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load170 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !15
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load171 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !15
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %index162
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load170, <2 x i64>* %59, align 8, !alias.scope !18, !noalias !15
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load171, <2 x i64>* %61, align 8, !alias.scope !18, !noalias !15
  %index.next163 = or i64 %index162, 4
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %index.next163
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load170.1 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load171.1 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !15
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %index.next163
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load170.1, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load171.1, <2 x i64>* %69, align 8, !alias.scope !18, !noalias !15
  %index.next163.1 = add nsw i64 %index162, 8
  %70 = icmp eq i64 %index.next163.1, 2000
  br i1 %70, label %for.cond82.for.inc97_crit_edge.us.loopexit172, label %vector.body143, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %indvars.iv
  %71 = bitcast double* %arrayidx89.us to i64*
  %72 = load i64, i64* %71, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %indvars.iv
  %73 = bitcast double* %arrayidx93.us to i64*
  store i64 %72, i64* %73, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next
  %74 = bitcast double* %arrayidx89.us.1 to i64*
  %75 = load i64, i64* %74, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %indvars.iv.next
  %76 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %75, i64* %76, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %77 = bitcast double* %arrayidx89.us.2 to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %indvars.iv.next.1
  %79 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %78, i64* %79, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %80 = bitcast double* %arrayidx89.us.3 to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %indvars.iv.next.2
  %82 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %83 = bitcast double* %arrayidx89.us.4 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 %indvars.iv77, i64 %indvars.iv.next.3
  %85 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %84, i64* %85, align 8
  %exitcond120.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond120.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit172:    ; preds = %vector.body143
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit172, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond125 = icmp eq i64 %53, 2000
  br i1 %exitcond125, label %for.end99.loopexit, label %for.body81.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %86 = bitcast [2000 x [2000 x double]]* %51 to i8*
  tail call void @free(i8* %86) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc54
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc54 ], [ 0, %entry ]
  %0 = phi [2000 x double]* [ %22, %for.inc54 ], [ %A, %entry ]
  %cmp27 = icmp sgt i64 %indvars.iv47, 0
  br i1 %cmp27, label %for.body3.preheader, label %for.body30.lr.ph.thread

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body30.lr.ph.thread:                          ; preds = %for.body
  br label %for.inc54

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc25 ], [ 0, %for.body3.preheader ]
  %1 = phi [2000 x double]* [ %10, %for.inc25 ], [ %0, %for.body3.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp55, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv29, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 0
  %2 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv29
  %3 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %2, %3
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %4 = icmp eq i64 %indvars.iv29, 1
  br i1 %4, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %5 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv
  %6 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv29
  %7 = load double, double* %arrayidx12, align 8
  %mul = fmul double %6, %7
  %sub = fsub double %5, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv47, i64 %indvars.iv.next
  %8 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv29
  %9 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %8, %9
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv29
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.unr-lcssa, label %for.inc

for.inc.for.inc25_crit_edge.unr-lcssa:            ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.prol.loopexit, %for.inc.for.inc25_crit_edge.unr-lcssa
  %.pre23 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.body3, %for.inc.for.inc25_crit_edge
  %10 = phi [2000 x double]* [ %.pre23, %for.inc.for.inc25_crit_edge ], [ %1, %for.body3 ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv29
  %11 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv47, i64 %indvars.iv29
  %12 = load double, double* %arrayidx24, align 8
  %div = fdiv double %12, %11
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next30, %indvars.iv47
  br i1 %exitcond34, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter53 = and i64 %indvars.iv47, 1
  %lcmp.mod54 = icmp eq i64 %xtraiter53, 0
  %14 = icmp eq i64 %indvars.iv47, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv47, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv43
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod54, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %15 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv43
  %16 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %15, %16
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv36.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr55.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.body30.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv36 = phi i64 [ %indvars.iv36.unr.ph, %for.body30.us.new ], [ %indvars.iv.next37.1, %for.inc48.us ]
  %17 = phi double [ %.unr55.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv36
  %18 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv36, i64 %indvars.iv43
  %19 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %18, %19
  %sub47.us = fsub double %17, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv47, i64 %indvars.iv.next37
  %20 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next37, i64 %indvars.iv43
  %21 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %20, %21
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond40.1 = icmp eq i64 %indvars.iv.next37.1, %indvars.iv47
  br i1 %exitcond40.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next44, 2000
  br i1 %exitcond51, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.body30.lr.ph.thread
  %22 = phi [2000 x double]* [ %0, %for.body30.lr.ph.thread ], [ undef, %for.body30.lr.ph.for.inc54_crit_edge ], [ %13, %for.inc54.loopexit ]
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next48, 2000
  br i1 %exitcond52, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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

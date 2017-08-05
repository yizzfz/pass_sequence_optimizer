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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc23.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %6, %for.inc23.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc23.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %1 = and i64 %indvars.iv128, 4294967295
  %sext = shl i64 %indvars.iv102, 32
  %2 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv107, -1
  br i1 %cmp257, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv92 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next93, %for.inc ]
  %3 = sub nsw i64 0, %indvars.iv92
  %4 = trunc i64 %3 to i32
  %rem = srem i32 %4, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv92
  store double %add, double* %arrayidx6, align 8
  %exitcond130 = icmp eq i64 %indvars.iv92, %1
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  br i1 %exitcond130, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
  %5 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  %cmp959 = icmp slt i64 %indvars.iv.next108, 2000
  br i1 %cmp959, label %for.inc16.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc16.lr.ph:                                  ; preds = %for.end
  %6 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %7 = sub nsw i64 1999, %2
  %8 = sub nsw i64 0, %2
  %xtraiter = and i64 %8, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv104.prol = phi i64 [ %2, %for.inc16.prol.preheader ], [ %indvars.iv.next105.prol, %for.inc16.prol ]
  %9 = phi [2000 x double]* [ %5, %for.inc16.prol.preheader ], [ %6, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv107, i64 %indvars.iv104.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next105.prol = add nsw i64 %indvars.iv104.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %10 = add i64 %2, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv104.unr = phi i64 [ %10, %for.inc16.prol.loopexit.unr-lcssa ], [ %2, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %6, %for.inc16.prol.loopexit.unr-lcssa ], [ %5, %for.inc16.lr.ph ]
  %11 = icmp ult i64 %7, 7
  br i1 %11, label %for.inc23.for.body_crit_edge, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next105.7, %for.inc16 ]
  %12 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %6, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %indvars.iv107, i64 %indvars.iv104
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next105 = add nsw i64 %indvars.iv104, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next105.2 = add nsw i64 %indvars.iv104, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next105.3 = add nsw i64 %indvars.iv104, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next105.4 = add nsw i64 %indvars.iv104, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next105.5 = add nsw i64 %indvars.iv104, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next105.6 = add nsw i64 %indvars.iv104, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv.next105.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond131.7 = icmp eq i64 %indvars.iv.next105.6, 1999
  %indvars.iv.next105.7 = add nsw i64 %indvars.iv104, 8
  br i1 %exitcond131.7, label %for.inc23.for.body_crit_edge.loopexit, label %for.inc16

for.inc23.for.body_crit_edge.loopexit:            ; preds = %for.inc16
  br label %for.inc23.for.body_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.inc23.for.body_crit_edge.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next129 = add nuw nsw i64 %1, 1
  %indvars.iv.next103 = add nsw i64 %2, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22117 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv107, i64 %indvars.iv107
  store double 1.000000e+00, double* %arrayidx22117, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvar110 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvar.next111.7, %for.body29.us ]
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar110, i64 0
  %scevgep112 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111 = or i64 %indvar110, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111, i64 0
  %scevgep112.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.1 = or i64 %indvar110, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.1, i64 0
  %scevgep112.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.2 = or i64 %indvar110, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.2, i64 0
  %scevgep112.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.3 = or i64 %indvar110, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.3, i64 0
  %scevgep112.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.4, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.4 = or i64 %indvar110, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.4, i64 0
  %scevgep112.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.5, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.5 = or i64 %indvar110, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.5, i64 0
  %scevgep112.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.6, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next111.6 = or i64 %indvar110, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next111.6, i64 0
  %scevgep112.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep112.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond127.7 = icmp eq i64 %indvar.next111.6, 1999
  %indvar.next111.7 = add nuw nsw i64 %indvar110, 8
  br i1 %exitcond127.7, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge, label %for.body29.us

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond126 = icmp eq i64 %15, 2000
  br i1 %exitcond126, label %vector.memcheck170.preheader, label %for.body51.lr.ph.us

vector.memcheck170.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck170

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv82 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %15, %for.inc75.us ]
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %14, i64 0, i64 %indvars.iv82
  %15 = add i64 %indvars.iv82, 1
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %14, i64 1999, i64 %15
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv80 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next81, %for.cond52.for.inc72_crit_edge.us.us ]
  %16 = bitcast double* %scevgep143 to i8*
  %17 = bitcast double* %scevgep145 to i8*
  %18 = mul nuw nsw i64 %indvars.iv80, 16000
  %scevgep141 = getelementptr i8, i8* %call, i64 %18
  %19 = add nuw i64 %18, 16000
  %scevgep142 = getelementptr i8, i8* %call, i64 %19
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv80, i64 %indvars.iv82
  %bound0 = icmp ult i8* %scevgep141, %17
  %bound1 = icmp ult i8* %16, %scevgep142
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0148 = icmp ult i8* %scevgep141, %bc
  %bound1149 = icmp ult i8* %bc, %scevgep142
  %found.conflict150 = and i1 %bound0148, %bound1149
  %conflict.rdx = or i1 %found.conflict, %found.conflict150
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = or i64 %index, 1
  %22 = or i64 %index, 2
  %23 = or i64 %index, 3
  %24 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %index, i64 %indvars.iv82
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %21, i64 %indvars.iv82
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %22, i64 %indvars.iv82
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %23, i64 %indvars.iv82
  %31 = load double, double* %27, align 8, !alias.scope !6
  %32 = load double, double* %28, align 8, !alias.scope !6
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = insertelement <2 x double> undef, double %31, i32 0
  %36 = insertelement <2 x double> %35, double %32, i32 1
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = fmul <2 x double> %26, %36
  %40 = fmul <2 x double> %26, %38
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv80, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load152 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %45 = fadd <2 x double> %39, %wide.load
  %46 = fadd <2 x double> %40, %wide.load152
  store <2 x double> %45, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %46, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %47 = icmp eq i64 %index.next, 2000
  br i1 %47, label %for.cond52.for.inc72_crit_edge.us.us.loopexit186, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit186: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit186, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next81, 2000
  br i1 %exitcond125, label %for.inc75.us, label %vector.memcheck

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv76 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next77.1, %for.inc69.us.us ]
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv76, i64 %indvars.iv82
  %50 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv80, i64 %indvars.iv76
  %51 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %51
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next77 = or i64 %indvars.iv76, 1
  %52 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv.next77, i64 %indvars.iv82
  %53 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv80, i64 %indvars.iv.next77
  %54 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %54
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond79.1 = icmp eq i64 %indvars.iv.next77, 1999
  %indvars.iv.next77.1 = add nuw nsw i64 %indvars.iv76, 2
  br i1 %exitcond79.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck170:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck170.preheader
  %indvars.iv74 = phi i64 [ 0, %vector.memcheck170.preheader ], [ %56, %for.cond82.for.inc97_crit_edge.us ]
  %55 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep158 = getelementptr [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 0
  %56 = add i64 %indvars.iv74, 1
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %14, i64 %56, i64 0
  %scevgep162 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv74, i64 0
  %scevgep164 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %56, i64 0
  %bound0166 = icmp ult double* %scevgep158, %scevgep164
  %bound1167 = icmp ult double* %scevgep162, %scevgep160
  %memcheck.conflict169 = and i1 %bound0166, %bound1167
  br i1 %memcheck.conflict169, label %for.inc94.us.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %vector.memcheck170
  br label %vector.body153

for.inc94.us.preheader:                           ; preds = %vector.memcheck170
  br label %for.inc94.us

vector.body153:                                   ; preds = %vector.body153, %vector.body153.preheader
  %index172 = phi i64 [ 0, %vector.body153.preheader ], [ %index.next173.1, %vector.body153 ]
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv74, i64 %index172
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load180 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !15
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load181 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !15
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %index172
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load180, <2 x i64>* %63, align 8, !alias.scope !18, !noalias !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load181, <2 x i64>* %65, align 8, !alias.scope !18, !noalias !15
  %index.next173 = or i64 %index172, 4
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv74, i64 %index.next173
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load180.1 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load181.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %index.next173
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load180.1, <2 x i64>* %71, align 8, !alias.scope !18, !noalias !15
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load181.1, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %index.next173.1 = add nuw nsw i64 %index172, 8
  %74 = icmp eq i64 %index.next173.1, 2000
  br i1 %74, label %for.cond82.for.inc97_crit_edge.us.loopexit185, label %vector.body153, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %75 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv74, i64 %indvars.iv
  %76 = bitcast double* %arrayidx89.us to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv
  %78 = bitcast double* %arrayidx93.us to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next
  %79 = bitcast double* %arrayidx89.us.1 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next.1
  %82 = bitcast double* %arrayidx89.us.2 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next.2
  %85 = bitcast double* %arrayidx89.us.3 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv74, i64 %indvars.iv.next.3
  %88 = bitcast double* %arrayidx89.us.4 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv74, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %89, i64* %90, align 8
  %exitcond73.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond73.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit185:    ; preds = %vector.body153
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit185, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond = icmp eq i64 %56, 2000
  br i1 %exitcond, label %for.end99, label %vector.memcheck170

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %indvars.iv44 = phi i64 [ 4294967295, %for.body.lr.ph ], [ %indvars.iv.next45, %for.inc56 ]
  %0 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %25, %for.inc56 ]
  %indvars.iv34 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next35, %for.inc56 ]
  %1 = and i64 %indvars.iv44, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre39 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %.pre37 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre38 = load double, double* %arrayidx43, align 8
  %2 = add nsw i64 %indvars.iv44, 1
  %xtraiter47 = and i64 %2, 3
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  br i1 %lcmp.mod48, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %3 = phi double [ %.pre38, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next27.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter47, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr49 = phi double [ %.pre38, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv26.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %xtraiter47, %for.inc45.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %1, 3
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv42 = phi i64 [ 4294967295, %for.cond4.preheader.preheader ], [ %indvars.iv.next43, %for.inc25 ]
  %6 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %17, %for.inc25 ]
  %indvars.iv24 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next25, %for.inc25 ]
  %7 = and i64 %indvars.iv42, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv24, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv24
  %.pre = load double, double* %arrayidx16, align 8
  %8 = and i64 %indvars.iv42, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv34, i64 0
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv24, i64 0
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %12 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %7
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %17 = phi [2000 x double]* [ %.pre36, %for.inc.for.inc25_crit_edge ], [ %6, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv24, i64 %indvars.iv24
  %18 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv34, i64 %indvars.iv24
  %19 = load double, double* %arrayidx24, align 8
  %div = fdiv double %19, %18
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next25 = add nuw i64 %indvars.iv24, 1
  %cmp2 = icmp slt i64 %indvars.iv.next25, %indvars.iv34
  %indvars.iv.next43 = add nuw nsw i64 %7, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %20 = phi double [ %.unr49, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next27.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv26
  %21 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %21, %21
  %sub44 = fsub double %20, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27
  %22 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %22, %22
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %23 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %23, %23
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %24 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %24, %24
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond46.3 = icmp eq i64 %indvars.iv.next27.2, %1
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  br i1 %exitcond46.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %25 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre37, %for.inc45.prol.loopexit ], [ %.pre37, %for.inc56.loopexit ]
  %26 = phi double [ %.pre39, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = tail call double @sqrt(double %26) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %indvars.iv34, i64 %indvars.iv34
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next35 = add i64 %indvars.iv34, 1
  %cmp = icmp slt i64 %indvars.iv.next35, 2000
  %indvars.iv.next45 = add nuw nsw i64 %1, 1
  br i1 %cmp, label %for.body, label %for.end58

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.inc ]
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
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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

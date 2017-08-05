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
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.end18.for.body_crit_edge, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %5, %for.end18.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.end18.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv99, 32
  %1 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv105, -1
  br i1 %cmp257, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.body
  %wide.trip.count97 = zext i32 %indvars.iv95 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv92 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next93, %for.body3 ]
  %2 = sub nsw i64 0, %indvars.iv92
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv92
  store double %add, double* %arrayidx6, align 8
  %exitcond98 = icmp eq i64 %indvars.iv92, %wide.trip.count97
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  br i1 %exitcond98, label %for.body3.for.end_crit_edge, label %for.body3

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.body3.for.end_crit_edge
  %4 = phi [2000 x double]* [ %.pre, %for.body3.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %cmp959 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp959, label %for.body11.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

for.body11.lr.ph:                                 ; preds = %for.end
  %5 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %6 = sub nsw i64 1999, %1
  %7 = sub nsw i64 0, %1
  %xtraiter = and i64 %7, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body11.prol.loopexit, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.lr.ph
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol, %for.body11.prol.preheader
  %indvars.iv101.prol = phi i64 [ %1, %for.body11.prol.preheader ], [ %indvars.iv.next102.prol, %for.body11.prol ]
  %8 = phi [2000 x double]* [ %4, %for.body11.prol.preheader ], [ %5, %for.body11.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body11.prol.preheader ], [ %prol.iter.sub, %for.body11.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv101.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next102.prol = add nsw i64 %indvars.iv101.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.prol.loopexit.unr-lcssa, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.unr-lcssa:               ; preds = %for.body11.prol
  %9 = add i64 %1, %xtraiter
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.lr.ph, %for.body11.prol.loopexit.unr-lcssa
  %indvars.iv101.unr = phi i64 [ %9, %for.body11.prol.loopexit.unr-lcssa ], [ %1, %for.body11.lr.ph ]
  %.unr = phi [2000 x double]* [ %5, %for.body11.prol.loopexit.unr-lcssa ], [ %4, %for.body11.lr.ph ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.end18.for.body_crit_edge, label %for.body11.lr.ph.new

for.body11.lr.ph.new:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.body11.lr.ph.new ], [ %indvars.iv.next102.7, %for.body11 ]
  %11 = phi [2000 x double]* [ %.unr, %for.body11.lr.ph.new ], [ %5, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv105, i64 %indvars.iv101
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next102.2 = add nsw i64 %indvars.iv101, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next102.3 = add nsw i64 %indvars.iv101, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next102.4 = add nsw i64 %indvars.iv101, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next102.5 = add nsw i64 %indvars.iv101, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next102.6 = add nsw i64 %indvars.iv101, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv.next102.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond104.7 = icmp eq i64 %indvars.iv.next102.6, 1999
  %indvars.iv.next102.7 = add nsw i64 %indvars.iv101, 8
  br i1 %exitcond104.7, label %for.end18.for.body_crit_edge.loopexit, label %for.body11

for.end18.for.body_crit_edge.loopexit:            ; preds = %for.body11
  br label %for.end18.for.body_crit_edge

for.end18.for.body_crit_edge:                     ; preds = %for.end18.for.body_crit_edge.loopexit, %for.body11.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  %indvars.iv.next100 = add nsw i64 %1, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22111 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22111, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next90.4, %for.body29.us ]
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv89, i64 0
  %scevgep88 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv89, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next, i64 0
  %scevgep88.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv89, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.1, i64 0
  %scevgep88.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv89, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.2, i64 0
  %scevgep88.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv89, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.3, i64 0
  %scevgep88.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = add nuw nsw i64 %indvars.iv89, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next90.4, 2000
  br i1 %cmp27.us.4, label %for.body29.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %14, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck34.preheader

vector.memcheck34.preheader:                      ; preds = %for.inc75.us
  br label %vector.memcheck34

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv81 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %14, %for.inc75.us ]
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv81
  %14 = add i64 %indvars.iv81, 1
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %13, i64 1999, i64 %14
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv79 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next80, %for.cond52.for.inc72_crit_edge.us.us ]
  %15 = bitcast double* %scevgep9 to i8*
  %16 = bitcast double* %scevgep11 to i8*
  %17 = mul i64 %indvars.iv79, 16000
  %scevgep7 = getelementptr i8, i8* %call, i64 %17
  %18 = add i64 %17, 16000
  %scevgep8 = getelementptr i8, i8* %call, i64 %18
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv79, i64 %indvars.iv81
  %bound0 = icmp ult i8* %scevgep7, %16
  %bound1 = icmp ult i8* %15, %scevgep8
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound014 = icmp ult i8* %scevgep7, %bc
  %bound115 = icmp ult i8* %bc, %scevgep8
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %vector.memcheck
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = or i64 %index, 1
  %21 = or i64 %index, 2
  %22 = or i64 %index, 3
  %23 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %index, i64 %indvars.iv81
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %20, i64 %indvars.iv81
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %21, i64 %indvars.iv81
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %22, i64 %indvars.iv81
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
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv79, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = fadd <2 x double> %wide.load, %38
  %45 = fadd <2 x double> %wide.load18, %39
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.cond52.for.inc72_crit_edge.us.us.loopexit50, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit50:  ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit50, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next76.1, %for.body55.us.us ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv75, i64 %indvars.iv81
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %50, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next76, i64 %indvars.iv81
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %53, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1999
  %indvars.iv.next76.1 = add nuw nsw i64 %indvars.iv75, 2
  br i1 %exitcond78.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !14

vector.memcheck34:                                ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck34.preheader
  %indvars.iv73 = phi i64 [ 0, %vector.memcheck34.preheader ], [ %54, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 0
  %54 = add i64 %indvars.iv73, 1
  %scevgep26 = getelementptr [2000 x double], [2000 x double]* %13, i64 %54, i64 0
  %55 = mul i64 %indvars.iv73, 16000
  %scevgep28 = getelementptr i8, i8* %call, i64 %55
  %56 = add i64 %55, 16000
  %scevgep29 = getelementptr i8, i8* %call, i64 %56
  %57 = bitcast double* %scevgep26 to i8*
  %58 = bitcast double* %scevgep24 to i8*
  %bound030 = icmp ult i8* %58, %scevgep29
  %bound131 = icmp ult i8* %scevgep28, %57
  %memcheck.conflict33 = and i1 %bound030, %bound131
  br i1 %memcheck.conflict33, label %for.body85.us.preheader, label %vector.body19.preheader

vector.body19.preheader:                          ; preds = %vector.memcheck34
  br label %vector.body19

for.body85.us.preheader:                          ; preds = %vector.memcheck34
  br label %for.body85.us

vector.body19:                                    ; preds = %vector.body19, %vector.body19.preheader
  %index36 = phi i64 [ 0, %vector.body19.preheader ], [ %index.next37.1, %vector.body19 ]
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv73, i64 %index36
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load44 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !15
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load45 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %index36
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load44, <2 x i64>* %65, align 8, !alias.scope !18, !noalias !15
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load45, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %index.next37 = or i64 %index36, 4
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv73, i64 %index.next37
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load45.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !15
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %index.next37
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load44.1, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load45.1, <2 x i64>* %75, align 8, !alias.scope !18, !noalias !15
  %index.next37.1 = add nuw nsw i64 %index36, 8
  %76 = icmp eq i64 %index.next37.1, 2000
  br i1 %76, label %for.cond82.for.inc97_crit_edge.us.loopexit49, label %vector.body19, !llvm.loop !20

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %77 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv73, i64 %indvars.iv
  %78 = bitcast double* %arrayidx89.us to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv
  %80 = bitcast double* %arrayidx93.us to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx89.us.1 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next
  %83 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx89.us.2 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %86 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx89.us.3 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %89 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx89.us.4 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %92 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %91, i64* %92, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit49:     ; preds = %vector.body19
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit49, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %54, 2000
  br i1 %cmp79.us, label %vector.memcheck34, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.end47.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv4 = phi i2 [ %indvars.iv.next5, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %27, %for.end47.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv24 = phi i32 [ %indvars.iv.next25, %for.end47.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %1 = zext i2 %indvars.iv4 to i64
  %2 = add i64 %indvars.iv28, 4294967295
  %3 = and i64 %2, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv28, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.end47_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond28.preheader.for.end47_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre33 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %.pre31 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre32 = load double, double* %arrayidx43, align 8
  %wide.trip.count26 = zext i32 %indvars.iv24 to i64
  %xtraiter1 = and i64 %indvars.iv28, 3
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %4 = phi double [ %.pre32, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv22.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next23.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter1, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv22.prol
  %5 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %5, %5
  %sub44.prol = fsub double %4, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !22

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %.unr3 = phi double [ %.pre32, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv22.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %1, %for.body30.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %3, 3
  br i1 %6, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %7 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %19, %for.end ]
  %indvars.iv20 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next21, %for.end ]
  %indvars.iv18 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next19, %for.end ]
  %8 = add i64 %indvars.iv20, 4294967295
  %9 = and i64 %8, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16, align 8
  %wide.trip.count = zext i32 %indvars.iv18 to i64
  %10 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %for.body6.prol.preheader, label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 0
  %11 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 0
  %12 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %11, %12
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %13 = icmp eq i64 %9, 0
  br i1 %13, label %for.body6.for.end_crit_edge, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %14 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv
  %15 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 %indvars.iv
  %16 = load double, double* %arrayidx12, align 8
  %mul = fmul double %15, %16
  %sub = fsub double %14, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.body6.for.end_crit_edge.loopexit, label %for.body6

for.body6.for.end_crit_edge.loopexit:             ; preds = %for.body6
  br label %for.body6.for.end_crit_edge

for.body6.for.end_crit_edge:                      ; preds = %for.body6.for.end_crit_edge.loopexit, %for.body6.prol.loopexit.unr-lcssa
  %.pre30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.cond4.preheader, %for.body6.for.end_crit_edge
  %19 = phi [2000 x double]* [ %.pre30, %for.body6.for.end_crit_edge ], [ %7, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 %indvars.iv20
  %20 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv28, i64 %indvars.iv20
  %21 = load double, double* %arrayidx24, align 8
  %div = fdiv double %21, %20
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %cmp2 = icmp slt i64 %indvars.iv.next21, %indvars.iv28
  %indvars.iv.next19 = add nsw i32 %indvars.iv18, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.body30.lr.ph

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %22 = phi double [ %.unr3, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next23.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv22
  %23 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %23, %23
  %sub44 = fsub double %22, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23
  %24 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %24, %24
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23.1
  %25 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %25, %25
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23.2
  %26 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %26, %26
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond27.3 = icmp eq i64 %indvars.iv.next23.2, %wide.trip.count26
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv22, 4
  br i1 %exitcond27.3, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit, %for.cond28.preheader.for.end47_crit_edge
  %27 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.end47_crit_edge ], [ %.pre31, %for.body30.prol.loopexit ], [ %.pre31, %for.end47.loopexit ]
  %28 = phi double [ %.pre33, %for.cond28.preheader.for.end47_crit_edge ], [ %sub44.lcssa.unr, %for.body30.prol.loopexit ], [ %sub44.3, %for.end47.loopexit ]
  %call = tail call double @sqrt(double %28) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %indvars.iv28, i64 %indvars.iv28
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next29 = add i64 %indvars.iv28, 1
  %cmp = icmp slt i64 %indvars.iv.next29, 2000
  %indvars.iv.next25 = add i32 %indvars.iv24, 1
  br i1 %cmp, label %for.end47.for.body_crit_edge, label %for.end58

for.end47.for.body_crit_edge:                     ; preds = %for.end47
  %indvars.iv.next5 = add i2 %indvars.iv4, 1
  br label %for.body

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.preheader, label %for.inc10

for.body4.preheader:                              ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.preheader
  %indvars.iv = phi i64 [ 0, %for.body4.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10.loopexit

for.inc10.loopexit:                               ; preds = %if.end
  br label %for.inc10

for.inc10:                                        ; preds = %for.inc10.loopexit, %for.body
  %indvars.iv.next9 = add i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body, label %for.end12

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

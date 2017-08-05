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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
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
  %0 = phi [2000 x double]* [ %5, %for.inc23.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.inc23.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv99, 32
  %1 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv105, -1
  br i1 %cmp257, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count97 = zext i32 %indvars.iv95 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc ], [ 0, %for.inc.preheader ]
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
  br i1 %exitcond98, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.inc.for.end_crit_edge, %for.body
  %4 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %cmp959 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp959, label %for.inc16.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

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
  %indvars.iv101.prol = phi i64 [ %1, %for.inc16.prol.preheader ], [ %indvars.iv.next102.prol, %for.inc16.prol ]
  %8 = phi [2000 x double]* [ %4, %for.inc16.prol.preheader ], [ %5, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv101.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next102.prol = add nsw i64 %indvars.iv101.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv101.unr = phi i64 [ %1, %for.inc16.lr.ph ], [ %indvars.iv.next102.prol, %for.inc16.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %4, %for.inc16.lr.ph ], [ %5, %for.inc16.prol.loopexit.loopexit ]
  %9 = icmp ult i64 %6, 7
  br i1 %9, label %for.inc23.for.body_crit_edge, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next102.7, %for.inc16 ]
  %10 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv105, i64 %indvars.iv101
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
  %indvars.iv.next102.7 = add nsw i64 %indvars.iv101, 8
  %exitcond104.7 = icmp eq i64 %indvars.iv.next102.6, 1999
  br i1 %exitcond104.7, label %for.inc23.for.body_crit_edge.loopexit, label %for.inc16

for.inc23.for.body_crit_edge.loopexit:            ; preds = %for.inc16
  br label %for.inc23.for.body_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.inc23.for.body_crit_edge.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next96 = add i32 %indvars.iv95, 1
  %indvars.iv.next100 = add nsw i64 %1, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22111 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22111, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next90.4, %for.cond30.for.inc41_crit_edge.us ]
  %indvar = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvar.next.4, %for.cond30.for.inc41_crit_edge.us ]
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar, i64 0
  %scevgep88 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvar, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next, i64 0
  %scevgep88.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nsw i64 %indvar, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar.next.1, i64 0
  %scevgep88.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nsw i64 %indvar, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next.2, i64 0
  %scevgep88.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nsw i64 %indvar, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvar.next.3, i64 0
  %scevgep88.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = add nsw i64 %indvars.iv89, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next90.4, 2000
  %indvar.next.4 = add nsw i64 %indvar, 5
  br i1 %cmp27.us.4, label %for.cond30.for.inc41_crit_edge.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  %16 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next82 = add i64 %indvars.iv81, 1
  %cmp45.us = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck150.preheader

vector.memcheck150.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck150

for.body51.lr.ph.us:                              ; preds = %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge, %for.inc75.us
  %indvars.iv81 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %indvars.iv.next82, %for.inc75.us ]
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %16, i64 0, i64 %indvars.iv81
  %17 = add i64 %indvars.iv81, 1
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %16, i64 1999, i64 %17
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv79 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next80, %for.cond52.for.inc72_crit_edge.us.us ]
  %18 = bitcast double* %scevgep123 to i8*
  %19 = bitcast double* %scevgep125 to i8*
  %20 = mul i64 %indvars.iv79, 16000
  %scevgep121 = getelementptr i8, i8* %call, i64 %20
  %21 = add i64 %20, 16000
  %scevgep122 = getelementptr i8, i8* %call, i64 %21
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv79, i64 %indvars.iv81
  %bound0 = icmp ult i8* %scevgep121, %19
  %bound1 = icmp ult i8* %18, %scevgep122
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc127 = bitcast double* %arrayidx59.us.us to i8*
  %bound0128 = icmp ult i8* %scevgep121, %bc127
  %bound1129 = icmp ult i8* %bc, %scevgep122
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx = or i1 %found.conflict, %found.conflict130
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x double> undef, double %26, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %index, i64 %indvars.iv81
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %23, i64 %indvars.iv81
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %24, i64 %indvars.iv81
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %25, i64 %indvars.iv81
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = load double, double* %32, align 8, !alias.scope !6
  %37 = load double, double* %33, align 8, !alias.scope !6
  %38 = load double, double* %34, align 8, !alias.scope !6
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %36, i32 1
  %41 = insertelement <2 x double> undef, double %37, i32 0
  %42 = insertelement <2 x double> %41, double %38, i32 1
  %43 = fmul <2 x double> %28, %40
  %44 = fmul <2 x double> %30, %42
  %45 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv79, i64 %index
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !8, !noalias !10
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !8, !noalias !10
  %49 = fadd <2 x double> %43, %wide.load
  %50 = fadd <2 x double> %44, %wide.load132
  %51 = bitcast double* %45 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %52 = bitcast double* %47 to <2 x double>*
  store <2 x double> %50, <2 x double>* %52, align 8, !alias.scope !8, !noalias !10
  %index.next = add i64 %index, 4
  %53 = icmp eq i64 %index.next, 2000
  br i1 %53, label %for.cond52.for.inc72_crit_edge.us.us.loopexit165, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit165: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit165, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next76.1, %for.inc69.us.us ]
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %55 = bitcast i8* %call to [2000 x [2000 x double]]*
  %56 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv75, i64 %indvars.iv81
  %57 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %56, %57
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %58 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %58
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %59 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv.next76, i64 %indvars.iv81
  %60 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %59, %60
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %61 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %61
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1999
  br i1 %exitcond78.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck150:                               ; preds = %vector.memcheck150.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond82.for.inc97_crit_edge.us ], [ 0, %vector.memcheck150.preheader ]
  %62 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 0
  %63 = add i64 %indvars.iv73, 1
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %16, i64 %63, i64 0
  %scevgep142 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv73, i64 0
  %scevgep144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %63, i64 0
  %bound0146 = icmp ult double* %scevgep138, %scevgep144
  %bound1147 = icmp ult double* %scevgep142, %scevgep140
  %memcheck.conflict149 = and i1 %bound0146, %bound1147
  br i1 %memcheck.conflict149, label %for.inc94.us.preheader, label %vector.body133.preheader

vector.body133.preheader:                         ; preds = %vector.memcheck150
  br label %vector.body133

for.inc94.us.preheader:                           ; preds = %vector.memcheck150
  br label %for.inc94.us

vector.body133:                                   ; preds = %vector.body133, %vector.body133.preheader
  %index152 = phi i64 [ 0, %vector.body133.preheader ], [ %index.next153.1, %vector.body133 ]
  %64 = bitcast i8* %call to [2000 x [2000 x double]]*
  %65 = bitcast i8* %call to [2000 x [2000 x double]]*
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv73, i64 %index152
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load160 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load161 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %index152
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load160, <2 x i64>* %71, align 8, !alias.scope !18, !noalias !15
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load161, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %index.next153 = or i64 %index152, 4
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv73, i64 %index.next153
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load160.1 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !15
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load161.1 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !15
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %index.next153
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load160.1, <2 x i64>* %79, align 8, !alias.scope !18, !noalias !15
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load161.1, <2 x i64>* %81, align 8, !alias.scope !18, !noalias !15
  %index.next153.1 = add nsw i64 %index152, 8
  %82 = icmp eq i64 %index.next153.1, 2000
  br i1 %82, label %for.cond82.for.inc97_crit_edge.us.loopexit164, label %vector.body133, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %83 = bitcast i8* %call to [2000 x [2000 x double]]*
  %84 = bitcast i8* %call to [2000 x [2000 x double]]*
  %85 = bitcast i8* %call to [2000 x [2000 x double]]*
  %86 = bitcast i8* %call to [2000 x [2000 x double]]*
  %87 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv73, i64 %indvars.iv
  %88 = bitcast double* %arrayidx89.us to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %indvars.iv
  %90 = bitcast double* %arrayidx93.us to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next
  %91 = bitcast double* %arrayidx89.us.1 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %indvars.iv.next
  %93 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %94 = bitcast double* %arrayidx89.us.2 to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %96 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %95, i64* %96, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %97 = bitcast double* %arrayidx89.us.3 to i64*
  %98 = load i64, i64* %97, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %99 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %98, i64* %99, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %100 = bitcast double* %arrayidx89.us.4 to i64*
  %101 = load i64, i64* %100, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %102 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %101, i64* %102, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit164:    ; preds = %vector.body133
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit164, %for.cond82.for.inc97_crit_edge.us.loopexit
  %indvars.iv.next74 = add i64 %indvars.iv73, 1
  %cmp79.us = icmp slt i64 %indvars.iv.next74, 2000
  br i1 %cmp79.us, label %vector.memcheck150, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
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
  %0 = phi [2000 x double]* [ %26, %for.inc56 ], [ %A, %for.body.lr.ph ]
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc56 ], [ 0, %for.body.lr.ph ]
  %indvars.iv24 = phi i32 [ %indvars.iv.next25, %for.inc56 ], [ -1, %for.body.lr.ph ]
  %1 = add i64 %indvars.iv28, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv28, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre33 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %.pre31 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv28
  %.pre32 = load double, double* %arrayidx43, align 8
  %wide.trip.count26 = zext i32 %indvars.iv24 to i64
  %xtraiter36 = and i64 %indvars.iv28, 3
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  br i1 %lcmp.mod37, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %3 = phi double [ %.pre32, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv22.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next23.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter36, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv22.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr38 = phi double [ %.pre32, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv22.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %indvars.iv.next23.prol, %for.inc45.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %2, 3
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %6 = phi [2000 x double]* [ %18, %for.inc25 ], [ %0, %for.cond4.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv18 = phi i32 [ %indvars.iv.next19, %for.inc25 ], [ -1, %for.cond4.preheader.preheader ]
  %7 = add i64 %indvars.iv20, 4294967295
  %8 = and i64 %7, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16, align 8
  %wide.trip.count = zext i32 %indvars.iv18 to i64
  %9 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv28, i64 0
  %10 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 0
  %11 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %10, %11
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %12 = icmp eq i64 %8, 0
  br i1 %12, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %13 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %sub = fsub double %13, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv28, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %16, %17
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit
  %.pre30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc.for.inc25_crit_edge, %for.cond4.preheader
  %18 = phi [2000 x double]* [ %.pre30, %for.inc.for.inc25_crit_edge ], [ %6, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv20
  %19 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv28, i64 %indvars.iv20
  %20 = load double, double* %arrayidx24, align 8
  %div = fdiv double %20, %19
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %cmp2 = icmp slt i64 %indvars.iv.next21, %indvars.iv28
  %indvars.iv.next19 = add nsw i32 %indvars.iv18, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %21 = phi double [ %.unr38, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next23.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv22
  %22 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %22, %22
  %sub44 = fsub double %21, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23
  %23 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %23, %23
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23.1
  %24 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %24, %24
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv22, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv.next23.2
  %25 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %25, %25
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %indvars.iv.next23.3 = add nsw i64 %indvars.iv22, 4
  %exitcond27.3 = icmp eq i64 %indvars.iv.next23.2, %wide.trip.count26
  br i1 %exitcond27.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %26 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre31, %for.inc45.prol.loopexit ], [ %.pre31, %for.inc56.loopexit ]
  %27 = phi double [ %.pre33, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = tail call double @sqrt(double %27) #4
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv28, i64 %indvars.iv28
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next29 = add i64 %indvars.iv28, 1
  %cmp = icmp slt i64 %indvars.iv.next29, 2000
  %indvars.iv.next25 = add i32 %indvars.iv24, 1
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
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.preheader, label %for.inc10

for.body4.preheader:                              ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.preheader ]
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
  br i1 %cmp3, label %for.body4, label %for.inc10.loopexit

for.inc10.loopexit:                               ; preds = %for.inc
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }
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

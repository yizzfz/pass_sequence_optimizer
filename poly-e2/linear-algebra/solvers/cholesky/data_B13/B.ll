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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc23, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %8, %for.inc23 ], [ %A, %for.body.lr.ph ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %indvars.iv99.in = phi i32 [ %indvars.iv99, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %1 = shl i64 %indvars.iv105, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = sub nsw i64 1999, %2
  %indvars.iv99 = add i32 %indvars.iv99.in, 1
  %4 = sext i32 %indvars.iv99 to i64
  %cmp255 = icmp sgt i64 %indvars.iv105, -1
  br i1 %cmp255, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count97 = zext i32 %indvars.iv99.in to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.inc ], [ 0, %for.inc.preheader ]
  %5 = sub nsw i64 0, %indvars.iv92
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
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

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
  %7 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %cmp957 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp957, label %for.inc16.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc16.lr.ph:                                  ; preds = %for.end
  %8 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %9 = sub nsw i64 0, %2
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv101.prol = phi i64 [ %indvars.iv.next102.prol, %for.inc16.prol ], [ %4, %for.inc16.prol.preheader ]
  %10 = phi [2000 x double]* [ %8, %for.inc16.prol ], [ %7, %for.inc16.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc16.prol ], [ %xtraiter, %for.inc16.prol.preheader ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv105, i64 %indvars.iv101.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next102.prol = add nsw i64 %indvars.iv101.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.loopexit, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.loopexit:                 ; preds = %for.inc16.prol
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.prol.loopexit.loopexit, %for.inc16.lr.ph
  %indvars.iv101.unr = phi i64 [ %4, %for.inc16.lr.ph ], [ %indvars.iv.next102.prol, %for.inc16.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %7, %for.inc16.lr.ph ], [ %8, %for.inc16.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %3, 7
  br i1 %11, label %for.inc23, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next102.7, %for.inc16 ]
  %12 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %8, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %indvars.iv105, i64 %indvars.iv101
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next102.2 = add nsw i64 %indvars.iv101, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next102.3 = add nsw i64 %indvars.iv101, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next102.4 = add nsw i64 %indvars.iv101, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next102.5 = add nsw i64 %indvars.iv101, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next102.6 = add nsw i64 %indvars.iv101, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv.next102.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond104.7 = icmp eq i64 %indvars.iv.next102.6, 1999
  %indvars.iv.next102.7 = add nsw i64 %indvars.iv101, 8
  br i1 %exitcond104.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22, align 8
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22109 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv105, i64 %indvars.iv105
  store double 1.000000e+00, double* %arrayidx22109, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next90.7, %for.body29.us ]
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv89, i64 0
  %scevgep88 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90, i64 0
  %scevgep88.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.1, i64 0
  %scevgep88.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.2, i64 0
  %scevgep88.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.3 = or i64 %indvars.iv89, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.3, i64 0
  %scevgep88.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = or i64 %indvars.iv89, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.4, i64 0
  %scevgep88.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.5 = or i64 %indvars.iv89, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.5, i64 0
  %scevgep88.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.6 = or i64 %indvars.iv89, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.6, i64 0
  %scevgep88.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.7 = add nsw i64 %indvars.iv89, 8
  %exitcond45.7 = icmp eq i64 %indvars.iv.next90.7, 2000
  br i1 %exitcond45.7, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge, label %for.body29.us

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond44 = icmp eq i64 %15, 2000
  br i1 %exitcond44, label %vector.memcheck28.preheader, label %for.body51.lr.ph.us

vector.memcheck28.preheader:                      ; preds = %for.inc75.us
  br label %vector.memcheck28

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv81 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %15, %for.inc75.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %14, i64 0, i64 %indvars.iv81
  %15 = add nuw nsw i64 %indvars.iv81, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %14, i64 1999, i64 %15
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv79 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next80, %for.cond52.for.inc72_crit_edge.us.us ]
  %16 = bitcast double* %scevgep3 to i8*
  %17 = bitcast double* %scevgep5 to i8*
  %18 = mul nuw nsw i64 %indvars.iv79, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %18
  %19 = add nuw nsw i64 %18, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %19
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv79, i64 %indvars.iv81
  %bound0 = icmp ult i8* %scevgep1, %17
  %bound1 = icmp ult i8* %16, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = or i64 %index, 1
  %22 = or i64 %index, 2
  %23 = or i64 %index, 3
  %24 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %index, i64 %indvars.iv81
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %21, i64 %indvars.iv81
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %22, i64 %indvars.iv81
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %23, i64 %indvars.iv81
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
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv79, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %45 = fadd <2 x double> %39, %wide.load
  %46 = fadd <2 x double> %40, %wide.load12
  store <2 x double> %45, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %46, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %47 = icmp eq i64 %index.next, 2000
  br i1 %47, label %for.cond52.for.inc72_crit_edge.us.us.loopexit47, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit47:  ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit47, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond43, label %for.inc75.us, label %vector.memcheck

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next76.1, %for.inc69.us.us ]
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv81
  %50 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %51 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %51
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %52 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv.next76, i64 %indvars.iv81
  %53 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %54 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %54
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1999
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond78.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck28:                                ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck28.preheader
  %indvars.iv73 = phi i64 [ %55, %for.cond82.for.inc97_crit_edge.us ], [ 0, %vector.memcheck28.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 0
  %55 = add nuw nsw i64 %indvars.iv73, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %14, i64 %55, i64 0
  %56 = mul nuw nsw i64 %indvars.iv73, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %56
  %57 = add nuw nsw i64 %56, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %57
  %58 = bitcast double* %scevgep20 to i8*
  %59 = bitcast double* %scevgep18 to i8*
  %bound024 = icmp ult i8* %59, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %58
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.inc94.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck28
  br label %vector.body13

for.inc94.us.preheader:                           ; preds = %vector.memcheck28
  br label %for.inc94.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %60 = bitcast i8* %call to [2000 x [2000 x double]]*
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv73, i64 %index30
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !15
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !15
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %index30
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %66, align 8, !alias.scope !18, !noalias !15
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %68, align 8, !alias.scope !18, !noalias !15
  %index.next31 = or i64 %index30, 4
  %69 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %60, i64 0, i64 %indvars.iv73, i64 %index.next31
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !15
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !15
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %index.next31
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %74, align 8, !alias.scope !18, !noalias !15
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %76, align 8, !alias.scope !18, !noalias !15
  %index.next31.1 = add nsw i64 %index30, 8
  %77 = icmp eq i64 %index.next31.1, 2000
  br i1 %77, label %for.cond82.for.inc97_crit_edge.us.loopexit46, label %vector.body13, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %78 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv73, i64 %indvars.iv
  %79 = bitcast double* %arrayidx89.us to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %indvars.iv
  %81 = bitcast double* %arrayidx93.us to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx89.us.1 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx89.us.2 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx89.us.3 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx89.us.4 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %92, i64* %93, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit46:     ; preds = %vector.body13
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit46, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond42 = icmp eq i64 %55, 2000
  br i1 %exitcond42, label %for.end99, label %vector.memcheck28

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc56 ], [ 0, %for.body.lr.ph ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.inc56 ], [ -1, %for.body.lr.ph ]
  %0 = add i64 %indvars.iv1, 4294967295
  %1 = and i64 %0, 4294967295
  %cmp25 = icmp sgt i64 %indvars.iv1, 0
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv1
  %.pre36 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %arrayidx43.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv1
  %.pre35 = load double, double* %arrayidx43.phi.trans.insert, align 8
  %wide.trip.count30 = zext i32 %indvars.iv28 to i64
  %xtraiter5 = and i64 %indvars.iv1, 3
  %lcmp.mod6 = icmp eq i64 %xtraiter5, 0
  br i1 %lcmp.mod6, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %2 = phi double [ %sub44.prol, %for.inc45.prol ], [ %.pre35, %for.inc45.prol.preheader ]
  %indvars.iv26.prol = phi i64 [ %indvars.iv.next27.prol, %for.inc45.prol ], [ 0, %for.inc45.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc45.prol ], [ %xtraiter5, %for.inc45.prol.preheader ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv26.prol
  %3 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %3, %3
  %sub44.prol = fsub double %2, %mul39.prol
  store double %sub44.prol, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr7 = phi double [ %.pre35, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv26.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %indvars.iv.next27.prol, %for.inc45.prol.loopexit.loopexit ]
  %4 = icmp ult i64 %1, 3
  br i1 %4, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv22 = phi i32 [ %indvars.iv.next23, %for.inc25 ], [ -1, %for.cond4.preheader.preheader ]
  %5 = add i64 %indvars.iv24, 4294967295
  %6 = and i64 %5, 4294967295
  %cmp52 = icmp sgt i64 %indvars.iv24, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv24
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp52, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %wide.trip.count = zext i32 %indvars.iv22 to i64
  %7 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 0
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %10 = icmp eq i64 %6, 0
  br i1 %10, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %11 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv24
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %indvars.iv.next23 = add nsw i32 %indvars.iv22, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next25, %indvars.iv1
  br i1 %exitcond3, label %for.inc45.lr.ph, label %for.cond4.preheader

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %18 = phi double [ %.unr7, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next27.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv26
  %19 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %19, %19
  %sub44 = fsub double %18, %mul39
  store double %sub44, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next27
  %20 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %20, %20
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next27.1
  %21 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %21, %21
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next27.2
  %22 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %22, %22
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43.phi.trans.insert, align 8
  %exitcond31.3 = icmp eq i64 %indvars.iv.next27.2, %wide.trip.count30
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  br i1 %exitcond31.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43.phi.trans.insert, %for.inc45.prol.loopexit ], [ %arrayidx43.phi.trans.insert, %for.inc56.loopexit ]
  %23 = phi double [ %.pre36, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = call double @sqrt(double %23) #4
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next29 = add nsw i32 %indvars.iv28, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond4, label %for.end58, label %for.body

for.end58:                                        ; preds = %for.inc56
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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.body.lr.ph, %for.inc10
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc10 ], [ 1, %for.body.lr.ph ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc10 ], [ 0, %for.body.lr.ph ]
  %3 = mul nuw nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %for.body4.preheader ]
  %4 = add nuw nsw i64 %3, %indvars.iv
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv1
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond3, label %for.end12, label %for.body4.preheader

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

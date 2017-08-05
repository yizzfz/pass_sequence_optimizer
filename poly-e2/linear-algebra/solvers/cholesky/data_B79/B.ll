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

for.body:                                         ; preds = %for.inc23, %for.body.lr.ph
  %indvars.iv175 = phi i32 [ %indvars.iv.next176, %for.inc23 ], [ 1, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %9, %for.inc23 ], [ %A, %for.body.lr.ph ]
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %indvars.iv104.in = phi i32 [ %indvars.iv104, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %1 = sext i32 %indvars.iv175 to i64
  %2 = shl i64 %indvars.iv110, 32
  %sext = add i64 %2, 4294967296
  %3 = ashr exact i64 %sext, 32
  %4 = sub nsw i64 1999, %3
  %indvars.iv104 = add i32 %indvars.iv104.in, 1
  %5 = sext i32 %indvars.iv104 to i64
  %cmp261 = icmp slt i64 %indvars.iv110, 0
  br i1 %cmp261, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count102 = zext i32 %indvars.iv104.in to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv97 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next98, %for.inc ]
  %6 = sub nsw i64 0, %indvars.iv97
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv97
  store double %add, double* %arrayidx6, align 8
  %exitcond103 = icmp eq i64 %indvars.iv97, %wide.trip.count102
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  br i1 %exitcond103, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
  %8 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next111 = add i64 %indvars.iv110, 1
  %cmp964 = icmp slt i64 %indvars.iv.next111, 2000
  br i1 %cmp964, label %for.inc16.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc16.lr.ph:                                  ; preds = %for.end
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %10 = sub nsw i64 0, %3
  %xtraiter = and i64 %10, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc16.prol.loopexit, label %for.inc16.prol.preheader

for.inc16.prol.preheader:                         ; preds = %for.inc16.lr.ph
  br label %for.inc16.prol

for.inc16.prol:                                   ; preds = %for.inc16.prol, %for.inc16.prol.preheader
  %indvars.iv106.prol = phi i64 [ %5, %for.inc16.prol.preheader ], [ %indvars.iv.next107.prol, %for.inc16.prol ]
  %11 = phi [2000 x double]* [ %8, %for.inc16.prol.preheader ], [ %9, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv110, i64 %indvars.iv106.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next107.prol = add nsw i64 %indvars.iv106.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %12 = add i64 %1, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv106.unr = phi i64 [ %12, %for.inc16.prol.loopexit.unr-lcssa ], [ %5, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %9, %for.inc16.prol.loopexit.unr-lcssa ], [ %8, %for.inc16.lr.ph ]
  %13 = icmp ult i64 %4, 7
  br i1 %13, label %for.inc23, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv106 = phi i64 [ %indvars.iv106.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next107.7, %for.inc16 ]
  %14 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %9, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv110, i64 %indvars.iv106
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next107 = add nsw i64 %indvars.iv106, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next107.2 = add nsw i64 %indvars.iv106, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next107.3 = add nsw i64 %indvars.iv106, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next107.4 = add nsw i64 %indvars.iv106, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next107.5 = add nsw i64 %indvars.iv106, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next107.6 = add nsw i64 %indvars.iv106, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv.next107.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond109.7 = icmp eq i64 %indvars.iv.next107.6, 1999
  %indvars.iv.next107.7 = add nsw i64 %indvars.iv106, 8
  br i1 %exitcond109.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv110, i64 %indvars.iv110
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next176 = add i32 %indvars.iv175, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22118 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv110, i64 %indvars.iv110
  store double 1.000000e+00, double* %arrayidx22118, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv94 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next95.4, %for.body29.us ]
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv94, i64 0
  %scevgep93 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep93, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv94, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar.next, i64 0
  %scevgep93.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep93.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv94, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar.next.1, i64 0
  %scevgep93.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep93.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv94, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar.next.2, i64 0
  %scevgep93.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep93.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv94, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvar.next.3, i64 0
  %scevgep93.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep93.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next95.4 = add nuw nsw i64 %indvars.iv94, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next95.4, 2000
  br i1 %cmp27.us.4, label %for.body29.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %16 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %17, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck160.preheader

vector.memcheck160.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck160

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv86 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %17, %for.inc75.us ]
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %16, i64 0, i64 %indvars.iv86
  %17 = add i64 %indvars.iv86, 1
  %scevgep135 = getelementptr [2000 x double], [2000 x double]* %16, i64 1999, i64 %17
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv84 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next85, %for.cond52.for.inc72_crit_edge.us.us ]
  %18 = bitcast double* %scevgep133 to i8*
  %19 = bitcast double* %scevgep135 to i8*
  %20 = mul i64 %indvars.iv84, 16000
  %scevgep131 = getelementptr i8, i8* %call, i64 %20
  %21 = add i64 %20, 16000
  %scevgep132 = getelementptr i8, i8* %call, i64 %21
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv84, i64 %indvars.iv86
  %bound0 = icmp ult i8* %scevgep131, %19
  %bound1 = icmp ult i8* %18, %scevgep132
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0138 = icmp ult i8* %scevgep131, %bc
  %bound1139 = icmp ult i8* %bc, %scevgep132
  %found.conflict140 = and i1 %bound0138, %bound1139
  %conflict.rdx = or i1 %found.conflict, %found.conflict140
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %index, i64 %indvars.iv86
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %23, i64 %indvars.iv86
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %24, i64 %indvars.iv86
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %25, i64 %indvars.iv86
  %33 = load double, double* %29, align 8, !alias.scope !6
  %34 = load double, double* %30, align 8, !alias.scope !6
  %35 = load double, double* %31, align 8, !alias.scope !6
  %36 = load double, double* %32, align 8, !alias.scope !6
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %36, i32 1
  %41 = fmul <2 x double> %28, %38
  %42 = fmul <2 x double> %28, %40
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv84, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load142 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !8, !noalias !10
  %47 = fadd <2 x double> %41, %wide.load
  %48 = fadd <2 x double> %42, %wide.load142
  store <2 x double> %47, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %48, <2 x double>* %46, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %for.cond52.for.inc72_crit_edge.us.us.loopexit178, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit178: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit178, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next85 = add i64 %indvars.iv84, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next85, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv80 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next81.1, %for.inc69.us.us ]
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv80, i64 %indvars.iv86
  %52 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %51, %52
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv84, i64 %indvars.iv80
  %53 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %53
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next81 = or i64 %indvars.iv80, 1
  %54 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv.next81, i64 %indvars.iv86
  %55 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %54, %55
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv84, i64 %indvars.iv.next81
  %56 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %56
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond83.1 = icmp eq i64 %indvars.iv.next81, 1999
  %indvars.iv.next81.1 = add nuw nsw i64 %indvars.iv80, 2
  br i1 %exitcond83.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck160:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck160.preheader
  %indvars.iv78 = phi i64 [ 0, %vector.memcheck160.preheader ], [ %58, %for.cond82.for.inc97_crit_edge.us ]
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 0
  %58 = add i64 %indvars.iv78, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %16, i64 %58, i64 0
  %scevgep152 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv78, i64 0
  %scevgep154 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %58, i64 0
  %bound0156 = icmp ult double* %scevgep148, %scevgep154
  %bound1157 = icmp ult double* %scevgep152, %scevgep150
  %memcheck.conflict159 = and i1 %bound0156, %bound1157
  br i1 %memcheck.conflict159, label %for.inc94.us.preheader, label %vector.body143.preheader

vector.body143.preheader:                         ; preds = %vector.memcheck160
  br label %vector.body143

for.inc94.us.preheader:                           ; preds = %vector.memcheck160
  br label %for.inc94.us

vector.body143:                                   ; preds = %vector.body143, %vector.body143.preheader
  %index162 = phi i64 [ 0, %vector.body143.preheader ], [ %index.next163.1, %vector.body143 ]
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv78, i64 %index162
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load170 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !15
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load171 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %index162
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load170, <2 x i64>* %65, align 8, !alias.scope !18, !noalias !15
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load171, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %index.next163 = or i64 %index162, 4
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv78, i64 %index.next163
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load170.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load171.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !15
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %index.next163
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load170.1, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load171.1, <2 x i64>* %75, align 8, !alias.scope !18, !noalias !15
  %index.next163.1 = add nuw nsw i64 %index162, 8
  %76 = icmp eq i64 %index.next163.1, 2000
  br i1 %76, label %for.cond82.for.inc97_crit_edge.us.loopexit177, label %vector.body143, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %77 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv78, i64 %indvars.iv
  %78 = bitcast double* %arrayidx89.us to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv
  %80 = bitcast double* %arrayidx93.us to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx89.us.1 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv.next
  %83 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx89.us.2 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv.next.1
  %86 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx89.us.3 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv.next.2
  %89 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx89.us.4 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %16, i64 %indvars.iv78, i64 %indvars.iv.next.3
  %92 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %91, i64* %92, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit177:    ; preds = %vector.body143
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit177, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %58, 2000
  br i1 %cmp79.us, label %vector.memcheck160, label %for.end99

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

for.body:                                         ; preds = %for.inc56.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv40 = phi i2 [ %indvars.iv.next41, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %27, %for.inc56.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv26 = phi i32 [ %indvars.iv.next27, %for.inc56.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %1 = zext i2 %indvars.iv40 to i64
  %2 = add i64 %indvars.iv30, 4294967295
  %3 = and i64 %2, 4294967295
  %cmp25 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv30, i64 %indvars.iv30
  %.pre35 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %.pre33 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv30
  %.pre34 = load double, double* %arrayidx43, align 8
  %wide.trip.count28 = zext i32 %indvars.iv26 to i64
  %xtraiter37 = and i64 %indvars.iv30, 3
  %lcmp.mod38 = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod38, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %4 = phi double [ %.pre34, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv24.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next25.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter37, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv24.prol
  %5 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %5, %5
  %sub44.prol = fsub double %4, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next25.prol = add nuw nsw i64 %indvars.iv24.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr39 = phi double [ %.pre34, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv24.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %1, %for.inc45.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %3, 3
  br i1 %6, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %7 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %19, %for.inc25 ]
  %indvars.iv22 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next23, %for.inc25 ]
  %indvars.iv20 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next21, %for.inc25 ]
  %8 = add i64 %indvars.iv22, 4294967295
  %9 = and i64 %8, 4294967295
  %cmp53 = icmp sgt i64 %indvars.iv22, 0
  br i1 %cmp53, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22
  %.pre = load double, double* %arrayidx16, align 8
  %wide.trip.count = zext i32 %indvars.iv20 to i64
  %10 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv30, i64 0
  %11 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv22, i64 0
  %12 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %11, %12
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %13 = icmp eq i64 %9, 0
  br i1 %13, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %14 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv
  %15 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv22, i64 %indvars.iv
  %16 = load double, double* %arrayidx12, align 8
  %mul = fmul double %15, %16
  %sub = fsub double %14, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv22, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre32 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %19 = phi [2000 x double]* [ %.pre32, %for.inc.for.inc25_crit_edge ], [ %7, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv22, i64 %indvars.iv22
  %20 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv30, i64 %indvars.iv22
  %21 = load double, double* %arrayidx24, align 8
  %div = fdiv double %21, %20
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next23 = add nuw i64 %indvars.iv22, 1
  %cmp2 = icmp slt i64 %indvars.iv.next23, %indvars.iv30
  %indvars.iv.next21 = add nsw i32 %indvars.iv20, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %22 = phi double [ %.unr39, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next25.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv24
  %23 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %23, %23
  %sub44 = fsub double %22, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv.next25
  %24 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %24, %24
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv.next25.1
  %25 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %25, %25
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next25.2 = add nsw i64 %indvars.iv24, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre33, i64 %indvars.iv30, i64 %indvars.iv.next25.2
  %26 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %26, %26
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond29.3 = icmp eq i64 %indvars.iv.next25.2, %wide.trip.count28
  %indvars.iv.next25.3 = add nsw i64 %indvars.iv24, 4
  br i1 %exitcond29.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %27 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre33, %for.inc45.prol.loopexit ], [ %.pre33, %for.inc56.loopexit ]
  %28 = phi double [ %.pre35, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = tail call double @sqrt(double %28) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %indvars.iv30, i64 %indvars.iv30
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next31 = add i64 %indvars.iv30, 1
  %cmp = icmp slt i64 %indvars.iv.next31, 2000
  %indvars.iv.next27 = add i32 %indvars.iv26, 1
  br i1 %cmp, label %for.inc56.for.body_crit_edge, label %for.end58

for.inc56.for.body_crit_edge:                     ; preds = %for.inc56
  %indvars.iv.next41 = add i2 %indvars.iv40, 1
  br label %for.body

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
  %cmp32 = icmp slt i64 %indvars.iv8, 0
  br i1 %cmp32, label %for.inc10, label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.body
  %3 = mul nsw i64 %indvars.iv8, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.preheader
  %indvars.iv = phi i64 [ 0, %for.body4.preheader ], [ %indvars.iv.next, %for.inc ]
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

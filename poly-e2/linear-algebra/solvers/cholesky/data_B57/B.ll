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
  %0 = phi [2000 x double]* [ %5, %for.inc23.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.inc23.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv93 = phi i32 [ %indvars.iv.next94, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv97, 32
  %1 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv103, -1
  br i1 %cmp257, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count95 = zext i32 %indvars.iv93 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv90 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next91, %for.inc ]
  %2 = sub nsw i64 0, %indvars.iv90
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv103, i64 %indvars.iv90
  store double %add, double* %arrayidx6, align 8
  %exitcond96 = icmp eq i64 %indvars.iv90, %wide.trip.count95
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  br i1 %exitcond96, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
  %4 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next104 = add i64 %indvars.iv103, 1
  %cmp959 = icmp slt i64 %indvars.iv.next104, 2000
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
  %indvars.iv99.prol = phi i64 [ %1, %for.inc16.prol.preheader ], [ %indvars.iv.next100.prol, %for.inc16.prol ]
  %8 = phi [2000 x double]* [ %4, %for.inc16.prol.preheader ], [ %5, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv103, i64 %indvars.iv99.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next100.prol = add nsw i64 %indvars.iv99.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %9 = add i64 %1, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv99.unr = phi i64 [ %9, %for.inc16.prol.loopexit.unr-lcssa ], [ %1, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %5, %for.inc16.prol.loopexit.unr-lcssa ], [ %4, %for.inc16.lr.ph ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc23.for.body_crit_edge, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv99 = phi i64 [ %indvars.iv99.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next100.7, %for.inc16 ]
  %11 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv103, i64 %indvars.iv99
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next100 = add nsw i64 %indvars.iv99, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next100.2 = add nsw i64 %indvars.iv99, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next100.3 = add nsw i64 %indvars.iv99, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next100.4 = add nsw i64 %indvars.iv99, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next100.5 = add nsw i64 %indvars.iv99, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next100.6 = add nsw i64 %indvars.iv99, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv.next100.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond102.7 = icmp eq i64 %indvars.iv.next100.6, 1999
  %indvars.iv.next100.7 = add nsw i64 %indvars.iv99, 8
  br i1 %exitcond102.7, label %for.inc23.for.body_crit_edge.loopexit, label %for.inc16

for.inc23.for.body_crit_edge.loopexit:            ; preds = %for.inc16
  br label %for.inc23.for.body_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.inc23.for.body_crit_edge.loopexit, %for.inc16.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv103, i64 %indvars.iv103
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next94 = add i32 %indvars.iv93, 1
  %indvars.iv.next98 = add nsw i64 %1, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.end
  %arrayidx22113 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv103, i64 %indvars.iv103
  store double 1.000000e+00, double* %arrayidx22113, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvar106 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvar.next107.4, %for.body29.us ]
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar106, i64 0
  %scevgep108 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next107 = add nuw nsw i64 %indvar106, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next107, i64 0
  %scevgep108.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next107.1 = add nuw nsw i64 %indvar106, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next107.1, i64 0
  %scevgep108.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next107.2 = add nuw nsw i64 %indvar106, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next107.2, i64 0
  %scevgep108.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next107.3 = add nuw nsw i64 %indvar106, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvar.next107.3, i64 0
  %scevgep108.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep108.4, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next107.4 = add nuw nsw i64 %indvar106, 5
  %cmp27.us.4 = icmp slt i64 %indvar.next107.4, 2000
  br i1 %cmp27.us.4, label %for.body29.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %13 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %14, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck147.preheader

vector.memcheck147.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck147

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv80 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %14, %for.inc75.us ]
  %scevgep122 = getelementptr [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv80
  %14 = add i64 %indvars.iv80, 1
  %scevgep124 = getelementptr [2000 x double], [2000 x double]* %13, i64 1999, i64 %14
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv78 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next79, %for.cond52.for.inc72_crit_edge.us.us ]
  %15 = bitcast double* %scevgep122 to i8*
  %16 = bitcast double* %scevgep124 to i8*
  %17 = mul i64 %indvars.iv78, 16000
  %scevgep120 = getelementptr i8, i8* %call, i64 %17
  %18 = add i64 %17, 16000
  %scevgep121 = getelementptr i8, i8* %call, i64 %18
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv78, i64 %indvars.iv80
  %bound0 = icmp ult i8* %scevgep120, %16
  %bound1 = icmp ult i8* %15, %scevgep121
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0127 = icmp ult i8* %scevgep120, %bc
  %bound1128 = icmp ult i8* %bc, %scevgep121
  %found.conflict129 = and i1 %bound0127, %bound1128
  %conflict.rdx = or i1 %found.conflict, %found.conflict129
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
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %index, i64 %indvars.iv80
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %20, i64 %indvars.iv80
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %21, i64 %indvars.iv80
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %22, i64 %indvars.iv80
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
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv78, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = fadd <2 x double> %38, %wide.load
  %45 = fadd <2 x double> %39, %wide.load131
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.cond52.for.inc72_crit_edge.us.us.loopexit163, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit163: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit163, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next79 = add i64 %indvars.iv78, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next79, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv74 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next75.1, %for.inc69.us.us ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv74, i64 %indvars.iv80
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv78, i64 %indvars.iv74
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %50
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next75 = or i64 %indvars.iv74, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next75, i64 %indvars.iv80
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv78, i64 %indvars.iv.next75
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %53
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75, 1999
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv74, 2
  br i1 %exitcond77.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck147:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck147.preheader
  %indvars.iv72 = phi i64 [ 0, %vector.memcheck147.preheader ], [ %54, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep137 = getelementptr [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 0
  %54 = add i64 %indvars.iv72, 1
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %13, i64 %54, i64 0
  %55 = mul i64 %indvars.iv72, 16000
  %scevgep141 = getelementptr i8, i8* %call, i64 %55
  %56 = add i64 %55, 16000
  %scevgep142 = getelementptr i8, i8* %call, i64 %56
  %57 = bitcast double* %scevgep139 to i8*
  %58 = bitcast double* %scevgep137 to i8*
  %bound0143 = icmp ult i8* %58, %scevgep142
  %bound1144 = icmp ult i8* %scevgep141, %57
  %memcheck.conflict146 = and i1 %bound0143, %bound1144
  br i1 %memcheck.conflict146, label %for.inc94.us.preheader, label %vector.body132.preheader

vector.body132.preheader:                         ; preds = %vector.memcheck147
  br label %vector.body132

for.inc94.us.preheader:                           ; preds = %vector.memcheck147
  br label %for.inc94.us

vector.body132:                                   ; preds = %vector.body132, %vector.body132.preheader
  %index149 = phi i64 [ 0, %vector.body132.preheader ], [ %index.next150.1, %vector.body132 ]
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv72, i64 %index149
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load157 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !15
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load158 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !15
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %index149
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load157, <2 x i64>* %65, align 8, !alias.scope !18, !noalias !15
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load158, <2 x i64>* %67, align 8, !alias.scope !18, !noalias !15
  %index.next150 = or i64 %index149, 4
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv72, i64 %index.next150
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load157.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load158.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !15
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %index.next150
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load157.1, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load158.1, <2 x i64>* %75, align 8, !alias.scope !18, !noalias !15
  %index.next150.1 = add nuw nsw i64 %index149, 8
  %76 = icmp eq i64 %index.next150.1, 2000
  br i1 %76, label %for.cond82.for.inc97_crit_edge.us.loopexit162, label %vector.body132, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %77 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv72, i64 %indvars.iv
  %78 = bitcast double* %arrayidx89.us to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %indvars.iv
  %80 = bitcast double* %arrayidx93.us to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx89.us.1 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %indvars.iv.next
  %83 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx89.us.2 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %indvars.iv.next.1
  %86 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx89.us.3 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %indvars.iv.next.2
  %89 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv72, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx89.us.4 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv72, i64 %indvars.iv.next.3
  %92 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %91, i64* %92, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit162:    ; preds = %vector.body132
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit162, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %54, 2000
  br i1 %cmp79.us, label %vector.memcheck147, label %for.end99

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
  %indvars.iv39 = phi i2 [ %indvars.iv.next40, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %27, %for.inc56.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv24 = phi i32 [ %indvars.iv.next25, %for.inc56.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %1 = zext i2 %indvars.iv39 to i64
  %2 = add i64 %indvars.iv28, 4294967295
  %3 = and i64 %2, 4294967295
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
  %4 = phi double [ %.pre32, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv22.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next23.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter36, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre31, i64 %indvars.iv28, i64 %indvars.iv22.prol
  %5 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %5, %5
  %sub44.prol = fsub double %4, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv22.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr38 = phi double [ %.pre32, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv22.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %1, %for.inc45.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %3, 3
  br i1 %6, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %7 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %19, %for.inc25 ]
  %indvars.iv20 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next21, %for.inc25 ]
  %indvars.iv18 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next19, %for.inc25 ]
  %8 = add i64 %indvars.iv20, 4294967295
  %9 = and i64 %8, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16, align 8
  %wide.trip.count = zext i32 %indvars.iv18 to i64
  %10 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv28, i64 0
  %11 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 0
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
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre30 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %19 = phi [2000 x double]* [ %.pre30, %for.inc.for.inc25_crit_edge ], [ %7, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv20, i64 %indvars.iv20
  %20 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv28, i64 %indvars.iv20
  %21 = load double, double* %arrayidx24, align 8
  %div = fdiv double %21, %20
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %cmp2 = icmp slt i64 %indvars.iv.next21, %indvars.iv28
  %indvars.iv.next19 = add nsw i32 %indvars.iv18, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %22 = phi double [ %.unr38, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv22 = phi i64 [ %indvars.iv22.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next23.3, %for.inc45 ]
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
  br i1 %exitcond27.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %27 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre31, %for.inc45.prol.loopexit ], [ %.pre31, %for.inc56.loopexit ]
  %28 = phi double [ %.pre33, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = tail call double @sqrt(double %28) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %indvars.iv28, i64 %indvars.iv28
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next29 = add i64 %indvars.iv28, 1
  %cmp = icmp slt i64 %indvars.iv.next29, 2000
  %indvars.iv.next25 = add i32 %indvars.iv24, 1
  br i1 %cmp, label %for.inc56.for.body_crit_edge, label %for.end58

for.inc56.for.body_crit_edge:                     ; preds = %for.inc56
  %indvars.iv.next40 = add i2 %indvars.iv39, 1
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
  %cmp31 = icmp sgt i64 %indvars.iv8, -1
  br i1 %cmp31, label %for.body4.preheader, label %for.inc10

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

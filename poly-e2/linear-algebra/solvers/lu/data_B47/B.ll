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
  %indvars.iv92 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next93, %for.inc ]
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

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
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
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %9 = add i64 %1, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv101.unr = phi i64 [ %9, %for.inc16.prol.loopexit.unr-lcssa ], [ %1, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %5, %for.inc16.prol.loopexit.unr-lcssa ], [ %4, %for.inc16.lr.ph ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc23.for.body_crit_edge, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next102.7, %for.inc16 ]
  %11 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
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
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck153.preheader

vector.memcheck153.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck153

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv81 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %14, %for.inc75.us ]
  %scevgep126 = getelementptr [2000 x double], [2000 x double]* %13, i64 0, i64 %indvars.iv81
  %14 = add i64 %indvars.iv81, 1
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %13, i64 1999, i64 %14
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv79 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next80, %for.cond52.for.inc72_crit_edge.us.us ]
  %15 = bitcast double* %scevgep126 to i8*
  %16 = bitcast double* %scevgep128 to i8*
  %17 = mul i64 %indvars.iv79, 16000
  %scevgep124 = getelementptr i8, i8* %call, i64 %17
  %18 = add i64 %17, 16000
  %scevgep125 = getelementptr i8, i8* %call, i64 %18
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv79, i64 %indvars.iv81
  %bound0 = icmp ult i8* %scevgep124, %16
  %bound1 = icmp ult i8* %15, %scevgep125
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0131 = icmp ult i8* %scevgep124, %bc
  %bound1132 = icmp ult i8* %bc, %scevgep125
  %found.conflict133 = and i1 %bound0131, %bound1132
  %conflict.rdx = or i1 %found.conflict, %found.conflict133
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
  %wide.load135 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = fadd <2 x double> %38, %wide.load
  %45 = fadd <2 x double> %39, %wide.load135
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.cond52.for.inc72_crit_edge.us.us.loopexit169, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit169: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit169, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next80 = add i64 %indvars.iv79, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next80, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next76.1, %for.inc69.us.us ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv75, i64 %indvars.iv81
  %49 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %48, %49
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %50 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %50
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv.next76, i64 %indvars.iv81
  %52 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %51, %52
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %53 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %53
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1999
  %indvars.iv.next76.1 = add nuw nsw i64 %indvars.iv75, 2
  br i1 %exitcond78.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck153:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck153.preheader
  %indvars.iv73 = phi i64 [ 0, %vector.memcheck153.preheader ], [ %55, %for.cond82.for.inc97_crit_edge.us ]
  %54 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 0
  %55 = add i64 %indvars.iv73, 1
  %scevgep143 = getelementptr [2000 x double], [2000 x double]* %13, i64 %55, i64 0
  %scevgep145 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %indvars.iv73, i64 0
  %scevgep147 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %54, i64 0, i64 %55, i64 0
  %bound0149 = icmp ult double* %scevgep141, %scevgep147
  %bound1150 = icmp ult double* %scevgep145, %scevgep143
  %memcheck.conflict152 = and i1 %bound0149, %bound1150
  br i1 %memcheck.conflict152, label %for.inc94.us.preheader, label %vector.body136.preheader

vector.body136.preheader:                         ; preds = %vector.memcheck153
  br label %vector.body136

for.inc94.us.preheader:                           ; preds = %vector.memcheck153
  br label %for.inc94.us

vector.body136:                                   ; preds = %vector.body136, %vector.body136.preheader
  %index155 = phi i64 [ 0, %vector.body136.preheader ], [ %index.next156.1, %vector.body136 ]
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv73, i64 %index155
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load163 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !15
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load164 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %index155
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load163, <2 x i64>* %62, align 8, !alias.scope !18, !noalias !15
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load164, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %index.next156 = or i64 %index155, 4
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv73, i64 %index.next156
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load163.1 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !15
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load164.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %index.next156
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load163.1, <2 x i64>* %70, align 8, !alias.scope !18, !noalias !15
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load164.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %index.next156.1 = add nuw nsw i64 %index155, 8
  %73 = icmp eq i64 %index.next156.1, 2000
  br i1 %73, label %for.cond82.for.inc97_crit_edge.us.loopexit168, label %vector.body136, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %74 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv73, i64 %indvars.iv
  %75 = bitcast double* %arrayidx89.us to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv
  %77 = bitcast double* %arrayidx93.us to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next
  %78 = bitcast double* %arrayidx89.us.1 to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next
  %80 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %81 = bitcast double* %arrayidx89.us.2 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %83 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %84 = bitcast double* %arrayidx89.us.3 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %86 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %74, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %87 = bitcast double* %arrayidx89.us.4 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %89 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %88, i64* %89, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit168:    ; preds = %vector.body136
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit168, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %55, 2000
  br i1 %cmp79.us, label %vector.memcheck153, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* %A) unnamed_addr #2 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc54, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %17, %for.inc54 ]
  %indvars.iv34 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next35, %for.inc54 ]
  %indvars.iv26 = phi i64 [ 4294967295, %for.body.lr.ph ], [ %indvars.iv.next27, %for.inc54 ]
  %1 = and i64 %indvars.iv26, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp23, label %for.body3.preheader, label %for.body30.lr.ph

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.inc25, %for.body3.preheader
  %2 = phi [2000 x double]* [ %0, %for.body3.preheader ], [ %13, %for.inc25 ]
  %indvars.iv21 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next22, %for.inc25 ]
  %indvars.iv19 = phi i64 [ 4294967295, %for.body3.preheader ], [ %indvars.iv.next20, %for.inc25 ]
  %3 = and i64 %indvars.iv19, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.body3
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv21
  %.pre = load double, double* %arrayidx16, align 8
  %4 = and i64 %indvars.iv19, 1
  %lcmp.mod = icmp eq i64 %4, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv34, i64 0
  %5 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 0, i64 %indvars.iv21
  %6 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %5, %6
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %7 = icmp eq i64 %3, 0
  br i1 %7, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %8 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv
  %9 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv21
  %10 = load double, double* %arrayidx12, align 8
  %mul = fmul double %9, %10
  %sub = fsub double %8, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv21
  %12 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %11, %12
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %3
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.body3, %for.inc.for.inc25_crit_edge
  %13 = phi [2000 x double]* [ %.pre36, %for.inc.for.inc25_crit_edge ], [ %2, %for.body3 ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv21
  %14 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %13, i64 %indvars.iv34, i64 %indvars.iv21
  %15 = load double, double* %arrayidx24, align 8
  %div = fdiv double %15, %14
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next22 = add nuw i64 %indvars.iv21, 1
  %cmp2 = icmp slt i64 %indvars.iv.next22, %indvars.iv34
  %indvars.iv.next20 = add nuw nsw i64 %3, 1
  br i1 %cmp2, label %for.body3, label %for.body30.lr.ph.loopexit

for.body30.lr.ph.loopexit:                        ; preds = %for.inc25
  br label %for.body30.lr.ph

for.body30.lr.ph:                                 ; preds = %for.body30.lr.ph.loopexit, %for.body
  %16 = icmp sgt i64 %indvars.iv34, 0
  %17 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br i1 %16, label %for.body30.us.preheader, label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %18 = and i64 %indvars.iv26, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv34, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond31.for.inc51_crit_edge.us, %for.body30.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv34, %for.body30.us.preheader ], [ %indvars.iv.next33, %for.cond31.for.inc51_crit_edge.us ]
  %19 = icmp eq i64 %18, 0
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv34, i64 %indvars.iv32
  %.pre37 = load double, double* %arrayidx46.us, align 8
  br i1 %19, label %for.inc48.us.prol.preheader, label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  %20 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 0, i64 %indvars.iv32
  %21 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %20, %21
  %sub47.us.prol = fsub double %.pre37, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol.preheader
  %.unr40.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol.preheader ], [ %.pre37, %for.body30.us ]
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.inc48.us.prol.preheader ], [ 0, %for.body30.us ]
  %22 = icmp eq i64 %1, 0
  br i1 %22, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %23 = phi double [ %.unr40.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %indvars.iv24 = phi i64 [ %indvars.iv24.unr.ph, %for.body30.us.new ], [ %indvars.iv.next25.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv34, i64 %indvars.iv24
  %24 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv24, i64 %indvars.iv32
  %25 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %24, %25
  %sub47.us = fsub double %23, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv34, i64 %indvars.iv.next25
  %26 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %17, i64 %indvars.iv.next25, i64 %indvars.iv32
  %27 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %26, %27
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %exitcond29.1 = icmp eq i64 %indvars.iv.next25, %1
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  br i1 %exitcond29.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.cond31.for.inc51_crit_edge.us.loopexit, %for.inc48.us.prol.loopexit.unr-lcssa
  %indvars.iv.next33 = add i64 %indvars.iv32, 1
  %cmp29.us = icmp slt i64 %indvars.iv.next33, 2000
  br i1 %cmp29.us, label %for.body30.us, label %for.inc54.loopexit

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.body30.lr.ph
  %indvars.iv.next35 = add i64 %indvars.iv34, 1
  %cmp = icmp slt i64 %indvars.iv.next35, 2000
  %indvars.iv.next27 = add nuw nsw i64 %1, 1
  br i1 %cmp, label %for.body, label %for.end56

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph.for.body.us_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10 = add i64 %indvars.iv9, 1
  %cmp.us = icmp slt i64 %indvars.iv.next10, 2000
  br i1 %cmp.us, label %for.body.us, label %for.end12

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

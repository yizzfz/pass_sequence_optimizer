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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
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
  %0 = phi [2000 x double]* [ %12, %for.inc23.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc23.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv98 = phi i32 [ %indvars.iv.next99, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv102, 32
  %1 = ashr exact i64 %sext, 32
  %cmp257 = icmp sgt i64 %indvars.iv106, -1
  br i1 %cmp257, label %for.inc.preheader, label %for.end

for.inc.preheader:                                ; preds = %for.body
  %wide.trip.count100 = zext i32 %indvars.iv98 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv93 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next94, %for.inc ]
  %2 = sub nsw i64 0, %indvars.iv93
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv93
  store double %add, double* %arrayidx6, align 8
  %exitcond101 = icmp eq i64 %indvars.iv93, %wide.trip.count100
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  br i1 %exitcond101, label %for.inc.for.end_crit_edge, label %for.inc

for.inc.for.end_crit_edge:                        ; preds = %for.inc
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.body, %for.inc.for.end_crit_edge
  %4 = phi [2000 x double]* [ %.pre, %for.inc.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next107 = add i64 %indvars.iv106, 1
  %cmp959 = icmp slt i64 %indvars.iv.next107, 2000
  br i1 %cmp959, label %for.inc16.lr.ph, label %for.inc23

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
  %indvars.iv104.prol = phi i64 [ %1, %for.inc16.prol.preheader ], [ %indvars.iv.next105.prol, %for.inc16.prol ]
  %8 = phi [2000 x double]* [ %4, %for.inc16.prol.preheader ], [ %5, %for.inc16.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.inc16.prol.preheader ], [ %prol.iter.sub, %for.inc16.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 %indvars.iv106, i64 %indvars.iv104.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next105.prol = add nsw i64 %indvars.iv104.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc16.prol.loopexit.unr-lcssa, label %for.inc16.prol, !llvm.loop !1

for.inc16.prol.loopexit.unr-lcssa:                ; preds = %for.inc16.prol
  %9 = add i64 %1, %xtraiter
  br label %for.inc16.prol.loopexit

for.inc16.prol.loopexit:                          ; preds = %for.inc16.lr.ph, %for.inc16.prol.loopexit.unr-lcssa
  %indvars.iv104.unr = phi i64 [ %9, %for.inc16.prol.loopexit.unr-lcssa ], [ %1, %for.inc16.lr.ph ]
  %.unr = phi [2000 x double]* [ %5, %for.inc16.prol.loopexit.unr-lcssa ], [ %4, %for.inc16.lr.ph ]
  %10 = icmp ult i64 %6, 7
  br i1 %10, label %for.inc23, label %for.inc16.lr.ph.new

for.inc16.lr.ph.new:                              ; preds = %for.inc16.prol.loopexit
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.lr.ph.new
  %indvars.iv104 = phi i64 [ %indvars.iv104.unr, %for.inc16.lr.ph.new ], [ %indvars.iv.next105.7, %for.inc16 ]
  %11 = phi [2000 x double]* [ %.unr, %for.inc16.lr.ph.new ], [ %5, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i64 %indvars.iv106, i64 %indvars.iv104
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next105 = add nsw i64 %indvars.iv104, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next105.2 = add nsw i64 %indvars.iv104, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next105.3 = add nsw i64 %indvars.iv104, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next105.4 = add nsw i64 %indvars.iv104, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next105.5 = add nsw i64 %indvars.iv104, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next105.6 = add nsw i64 %indvars.iv104, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv106, i64 %indvars.iv.next105.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next105.6, 1999
  %indvars.iv.next105.7 = add nsw i64 %indvars.iv104, 8
  br i1 %exitcond.7, label %for.inc23.loopexit, label %for.inc16

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %for.inc16.prol.loopexit, %for.end
  %12 = phi [2000 x double]* [ %4, %for.end ], [ %5, %for.inc16.prol.loopexit ], [ %5, %for.inc23.loopexit ]
  %13 = icmp slt i64 %indvars.iv.next107, 2000
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %indvars.iv106, i64 %indvars.iv106
  store double 1.000000e+00, double* %arrayidx22, align 8
  br i1 %13, label %for.inc23.for.body_crit_edge, label %for.body29.lr.ph.for.body29.us_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.inc23
  %indvars.iv.next99 = add i32 %indvars.iv98, 1
  %indvars.iv.next103 = add nsw i64 %1, 1
  br label %for.body

for.body29.lr.ph.for.body29.us_crit_edge:         ; preds = %for.inc23
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv90 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next91.4, %for.body29.us ]
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv90, i64 0
  %scevgep87 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep87, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next = add nuw nsw i64 %indvars.iv90, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next, i64 0
  %scevgep87.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep87.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.1 = add nuw nsw i64 %indvars.iv90, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.1, i64 0
  %scevgep87.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep87.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.2 = add nuw nsw i64 %indvars.iv90, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.2, i64 0
  %scevgep87.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep87.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next.3 = add nuw nsw i64 %indvars.iv90, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvar.next.3, i64 0
  %scevgep87.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep87.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next91.4 = add nuw nsw i64 %indvars.iv90, 5
  %cmp27.us.4 = icmp slt i64 %indvars.iv.next91.4, 2000
  br i1 %cmp27.us.4, label %for.body29.us, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.body29.us
  %15 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %16, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck144.preheader

vector.memcheck144.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck144

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv83 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %16, %for.inc75.us ]
  %scevgep117 = getelementptr [2000 x double], [2000 x double]* %15, i64 0, i64 %indvars.iv83
  %16 = add i64 %indvars.iv83, 1
  %scevgep119 = getelementptr [2000 x double], [2000 x double]* %15, i64 1999, i64 %16
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv81 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next82, %for.cond52.for.inc72_crit_edge.us.us ]
  %17 = bitcast double* %scevgep117 to i8*
  %18 = bitcast double* %scevgep119 to i8*
  %19 = mul i64 %indvars.iv81, 16000
  %scevgep115 = getelementptr i8, i8* %call, i64 %19
  %20 = add i64 %19, 16000
  %scevgep116 = getelementptr i8, i8* %call, i64 %20
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv81, i64 %indvars.iv83
  %bound0 = icmp ult i8* %scevgep115, %18
  %bound1 = icmp ult i8* %17, %scevgep116
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0122 = icmp ult i8* %scevgep115, %bc
  %bound1123 = icmp ult i8* %bc, %scevgep116
  %found.conflict124 = and i1 %bound0122, %bound1123
  %conflict.rdx = or i1 %found.conflict, %found.conflict124
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %index, i64 %indvars.iv83
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %22, i64 %indvars.iv83
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %23, i64 %indvars.iv83
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %24, i64 %indvars.iv83
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
  %42 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv81, i64 %index
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %46 = fadd <2 x double> %wide.load, %40
  %47 = fadd <2 x double> %wide.load126, %41
  store <2 x double> %46, <2 x double>* %43, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %47, <2 x double>* %45, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %48 = icmp eq i64 %index.next, 2000
  br i1 %48, label %for.cond52.for.inc72_crit_edge.us.us.loopexit159, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit159: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit159, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next82 = add i64 %indvars.iv81, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next78.1, %for.inc69.us.us ]
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %50 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv77, i64 %indvars.iv83
  %51 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %50, %51
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv81, i64 %indvars.iv77
  %52 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %52, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %53 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv.next78, i64 %indvars.iv83
  %54 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %53, %54
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next78
  %55 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %55, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond80.1 = icmp eq i64 %indvars.iv.next78, 1999
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  br i1 %exitcond80.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !14

vector.memcheck144:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck144.preheader
  %indvars.iv75 = phi i64 [ 0, %vector.memcheck144.preheader ], [ %57, %for.cond82.for.inc97_crit_edge.us ]
  %56 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 0
  %57 = add i64 %indvars.iv75, 1
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %15, i64 %57, i64 0
  %scevgep136 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 0
  %scevgep138 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %57, i64 0
  %bound0140 = icmp ult double* %scevgep132, %scevgep138
  %bound1141 = icmp ult double* %scevgep136, %scevgep134
  %memcheck.conflict143 = and i1 %bound0140, %bound1141
  br i1 %memcheck.conflict143, label %for.inc94.us.preheader, label %vector.body127.preheader

vector.body127.preheader:                         ; preds = %vector.memcheck144
  br label %vector.body127

for.inc94.us.preheader:                           ; preds = %vector.memcheck144
  br label %for.inc94.us

vector.body127:                                   ; preds = %vector.body127, %vector.body127.preheader
  %index146 = phi i64 [ 0, %vector.body127.preheader ], [ %index.next147.1, %vector.body127 ]
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv75, i64 %index146
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load154 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !15
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load155 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !15
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %index146
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load154, <2 x i64>* %64, align 8, !alias.scope !18, !noalias !15
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load155, <2 x i64>* %66, align 8, !alias.scope !18, !noalias !15
  %index.next147 = or i64 %index146, 4
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv75, i64 %index.next147
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load154.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load155.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !15
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %index.next147
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load154.1, <2 x i64>* %72, align 8, !alias.scope !18, !noalias !15
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load155.1, <2 x i64>* %74, align 8, !alias.scope !18, !noalias !15
  %index.next147.1 = add nuw nsw i64 %index146, 8
  %75 = icmp eq i64 %index.next147.1, 2000
  br i1 %75, label %for.cond82.for.inc97_crit_edge.us.loopexit158, label %vector.body127, !llvm.loop !20

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %76 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %77 = bitcast double* %arrayidx89.us to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %indvars.iv
  %79 = bitcast double* %arrayidx93.us to i64*
  store i64 %78, i64* %79, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %80 = bitcast double* %arrayidx89.us.1 to i64*
  %81 = load i64, i64* %80, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %81, i64* %82, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %83 = bitcast double* %arrayidx89.us.2 to i64*
  %84 = load i64, i64* %83, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %84, i64* %85, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %86 = bitcast double* %arrayidx89.us.3 to i64*
  %87 = load i64, i64* %86, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %87, i64* %88, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %76, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %89 = bitcast double* %arrayidx89.us.4 to i64*
  %90 = load i64, i64* %89, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %90, i64* %91, align 8
  %exitcond74.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond74.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit158:    ; preds = %vector.body127
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit158, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %57, 2000
  br i1 %cmp79.us, label %vector.memcheck144, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* %call) #3
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
  %indvars.iv45 = phi i2 [ %indvars.iv.next46, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %27, %for.inc56.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc56.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv30 = phi i32 [ %indvars.iv.next31, %for.inc56.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %1 = zext i2 %indvars.iv45 to i64
  %2 = add i64 %indvars.iv34, 4294967295
  %3 = and i64 %2, 4294967295
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
  %wide.trip.count32 = zext i32 %indvars.iv30 to i64
  %xtraiter42 = and i64 %indvars.iv34, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %4 = phi double [ %.pre38, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next27.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter42, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %5 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %5, %5
  %sub44.prol = fsub double %4, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !22

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr44 = phi double [ %.pre38, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv26.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %1, %for.inc45.prol.loopexit.loopexit ]
  %6 = icmp ult i64 %3, 3
  br i1 %6, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %7 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %19, %for.inc25 ]
  %indvars.iv24 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next25, %for.inc25 ]
  %indvars.iv20 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next21, %for.inc25 ]
  %8 = add i64 %indvars.iv24, 4294967295
  %9 = and i64 %8, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv24, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv34, i64 %indvars.iv24
  %.pre = load double, double* %arrayidx16, align 8
  %wide.trip.count22 = zext i32 %indvars.iv20 to i64
  %10 = and i64 %8, 1
  %lcmp.mod = icmp eq i64 %10, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv34, i64 0
  %11 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv24, i64 0
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
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv34, i64 %indvars.iv
  %15 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv24, i64 %indvars.iv
  %16 = load double, double* %arrayidx12, align 8
  %mul = fmul double %15, %16
  %sub = fsub double %14, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv34, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv24, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond23.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count22
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond23.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre36 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %19 = phi [2000 x double]* [ %.pre36, %for.inc.for.inc25_crit_edge ], [ %7, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %7, i64 %indvars.iv24, i64 %indvars.iv24
  %20 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv34, i64 %indvars.iv24
  %21 = load double, double* %arrayidx24, align 8
  %div = fdiv double %21, %20
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next25 = add nuw i64 %indvars.iv24, 1
  %cmp2 = icmp slt i64 %indvars.iv.next25, %indvars.iv34
  %indvars.iv.next21 = add nsw i32 %indvars.iv20, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %22 = phi double [ %.unr44, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next27.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv26
  %23 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %23, %23
  %sub44 = fsub double %22, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27
  %24 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %24, %24
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %25 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %25, %25
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre37, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %26 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %26, %26
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond33.3 = icmp eq i64 %indvars.iv.next27.2, %wide.trip.count32
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  br i1 %exitcond33.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %27 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.inc56_crit_edge ], [ %.pre37, %for.inc45.prol.loopexit ], [ %.pre37, %for.inc56.loopexit ]
  %28 = phi double [ %.pre39, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = call double @sqrt(double %28) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %27, i64 %indvars.iv34, i64 %indvars.iv34
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next35 = add i64 %indvars.iv34, 1
  %cmp = icmp slt i64 %indvars.iv.next35, 2000
  %indvars.iv.next31 = add i32 %indvars.iv30, 1
  br i1 %cmp, label %for.inc56.for.body_crit_edge, label %for.end58

for.inc56.for.body_crit_edge:                     ; preds = %for.inc56
  %indvars.iv.next46 = add i2 %indvars.iv45, 1
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
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
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

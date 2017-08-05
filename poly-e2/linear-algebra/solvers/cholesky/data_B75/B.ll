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
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body.lr.ph, %for.end18.for.body_crit_edge
  %indvars.iv190 = phi i3 [ %indvars.iv.next191, %for.end18.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %indvars.iv188 = phi i64 [ %indvars.iv.next189, %for.end18.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %9, %for.end18.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv122 = phi i32 [ %indvars.iv.next123, %for.end18.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %1 = zext i3 %indvars.iv190 to i64
  %2 = add i64 %indvars.iv188, %1
  %3 = sub i64 1999, %indvars.iv111
  %4 = sub i64 1998, %indvars.iv111
  %5 = zext i32 %indvars.iv122 to i64
  %6 = add nsw i64 %5, -1
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv95 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next96, %for.body3 ]
  %7 = sub nsw i64 0, %indvars.iv95
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv111, i64 %indvars.iv95
  store double %add, double* %arrayidx6, align 8
  %exitcond124 = icmp eq i64 %indvars.iv95, %6
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  br i1 %exitcond124, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %.pre = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %cmp959 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %cmp959, label %for.body11.lr.ph, label %for.body29.us.preheader

for.body11.lr.ph:                                 ; preds = %for.end
  %9 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %xtraiter = and i64 %3, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body11.prol.loopexit, label %for.body11.prol.preheader

for.body11.prol.preheader:                        ; preds = %for.body11.lr.ph
  br label %for.body11.prol

for.body11.prol:                                  ; preds = %for.body11.prol, %for.body11.prol.preheader
  %indvars.iv102.prol = phi i64 [ %indvars.iv188, %for.body11.prol.preheader ], [ %indvars.iv.next103.prol, %for.body11.prol ]
  %10 = phi [2000 x double]* [ %.pre, %for.body11.prol.preheader ], [ %9, %for.body11.prol ]
  %prol.iter = phi i64 [ %xtraiter, %for.body11.prol.preheader ], [ %prol.iter.sub, %for.body11.prol ]
  %arrayidx15.prol = getelementptr inbounds [2000 x double], [2000 x double]* %10, i64 %indvars.iv111, i64 %indvars.iv102.prol
  store double 0.000000e+00, double* %arrayidx15.prol, align 8
  %indvars.iv.next103.prol = add nsw i64 %indvars.iv102.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.prol.loopexit.loopexit, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.loopexit:                ; preds = %for.body11.prol
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.loopexit, %for.body11.lr.ph
  %indvars.iv102.unr = phi i64 [ %indvars.iv188, %for.body11.lr.ph ], [ %2, %for.body11.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %.pre, %for.body11.lr.ph ], [ %9, %for.body11.prol.loopexit.loopexit ]
  %11 = icmp ult i64 %4, 7
  br i1 %11, label %for.end18.for.body_crit_edge, label %for.body11.lr.ph.new

for.body11.lr.ph.new:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph.new
  %indvars.iv102 = phi i64 [ %indvars.iv102.unr, %for.body11.lr.ph.new ], [ %indvars.iv.next103.7, %for.body11 ]
  %12 = phi [2000 x double]* [ %.unr, %for.body11.lr.ph.new ], [ %9, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %12, i64 %indvars.iv111, i64 %indvars.iv102
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, 1
  %arrayidx15.1 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103
  store double 0.000000e+00, double* %arrayidx15.1, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %arrayidx15.2 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.1
  store double 0.000000e+00, double* %arrayidx15.2, align 8
  %indvars.iv.next103.2 = add nsw i64 %indvars.iv102, 3
  %arrayidx15.3 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.2
  store double 0.000000e+00, double* %arrayidx15.3, align 8
  %indvars.iv.next103.3 = add nsw i64 %indvars.iv102, 4
  %arrayidx15.4 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.3
  store double 0.000000e+00, double* %arrayidx15.4, align 8
  %indvars.iv.next103.4 = add nsw i64 %indvars.iv102, 5
  %arrayidx15.5 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.4
  store double 0.000000e+00, double* %arrayidx15.5, align 8
  %indvars.iv.next103.5 = add nsw i64 %indvars.iv102, 6
  %arrayidx15.6 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.5
  store double 0.000000e+00, double* %arrayidx15.6, align 8
  %indvars.iv.next103.6 = add nsw i64 %indvars.iv102, 7
  %arrayidx15.7 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv.next103.6
  store double 0.000000e+00, double* %arrayidx15.7, align 8
  %indvars.iv.next103.7 = add nsw i64 %indvars.iv102, 8
  %cmp9.7 = icmp slt i64 %indvars.iv.next103.7, 2000
  br i1 %cmp9.7, label %for.body11, label %for.end18.for.body_crit_edge.loopexit

for.end18.for.body_crit_edge.loopexit:            ; preds = %for.body11
  br label %for.end18.for.body_crit_edge

for.end18.for.body_crit_edge:                     ; preds = %for.end18.for.body_crit_edge.loopexit, %for.body11.prol.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 %indvars.iv111, i64 %indvars.iv111
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next189 = add nuw nsw i64 %indvars.iv188, 1
  %indvars.iv.next123 = add i32 %indvars.iv122, 1
  %indvars.iv.next191 = add i3 %indvars.iv190, -1
  br label %for.body3.preheader

for.body29.us.preheader:                          ; preds = %for.end
  %arrayidx22128 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre, i64 %indvars.iv111, i64 %indvars.iv111
  store double 1.000000e+00, double* %arrayidx22128, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.cond30.for.inc41_crit_edge.us, %for.body29.us.preheader
  %indvar = phi i64 [ 0, %for.body29.us.preheader ], [ %indvar.next, %for.cond30.for.inc41_crit_edge.us ]
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvar, i64 0
  %scevgep120 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep120, i8 0, i64 16000, i32 8, i1 false)
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body29.us
  %indvars.iv88 = phi i64 [ 0, %for.body29.us ], [ %indvars.iv.next89.24, %for.body33.us ]
  %indvars.iv.next89.24 = add nuw nsw i64 %indvars.iv88, 25
  %cmp31.us.24 = icmp slt i64 %indvars.iv.next89.24, 2000
  br i1 %cmp31.us.24, label %for.body33.us, label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.body33.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %cmp27.us = icmp slt i64 %indvar.next, 2000
  br i1 %cmp27.us, label %for.body29.us, label %for.cond48.preheader.us.preheader

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  %14 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %15, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.us, label %vector.memcheck172.preheader

vector.memcheck172.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck172

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.us.preheader
  %indvars.iv82 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %15, %for.inc75.us ]
  %scevgep145 = getelementptr [2000 x double], [2000 x double]* %14, i64 0, i64 %indvars.iv82
  %15 = add i64 %indvars.iv82, 1
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %14, i64 1999, i64 %15
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv80 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next81, %for.cond52.for.inc72_crit_edge.us.us ]
  %16 = bitcast double* %scevgep145 to i8*
  %17 = bitcast double* %scevgep147 to i8*
  %18 = mul nuw nsw i64 %indvars.iv80, 16000
  %scevgep143 = getelementptr i8, i8* %call, i64 %18
  %19 = add nuw i64 %18, 16000
  %scevgep144 = getelementptr i8, i8* %call, i64 %19
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv80, i64 %indvars.iv82
  %bound0 = icmp ult i8* %scevgep143, %17
  %bound1 = icmp ult i8* %16, %scevgep144
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0150 = icmp ult i8* %scevgep143, %bc
  %bound1151 = icmp ult i8* %bc, %scevgep144
  %found.conflict152 = and i1 %bound0150, %bound1151
  %conflict.rdx = or i1 %found.conflict, %found.conflict152
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %vector.memcheck
  br label %for.body55.us.us

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
  %wide.load154 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %45 = fadd <2 x double> %39, %wide.load
  %46 = fadd <2 x double> %40, %wide.load154
  store <2 x double> %45, <2 x double>* %42, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %46, <2 x double>* %44, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %47 = icmp eq i64 %index.next, 2000
  br i1 %47, label %for.cond52.for.inc72_crit_edge.us.us.loopexit193, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit193: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit193, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next81, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv77 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next78.1, %for.body55.us.us ]
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv77, i64 %indvars.iv82
  %50 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv80, i64 %indvars.iv77
  %51 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %51
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %52 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv.next78, i64 %indvars.iv82
  %53 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv80, i64 %indvars.iv.next78
  %54 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %54
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  %cmp53.us.us.1 = icmp slt i64 %indvars.iv.next78.1, 2000
  br i1 %cmp53.us.us.1, label %for.body55.us.us, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, !llvm.loop !14

vector.memcheck172:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck172.preheader
  %indvars.iv75 = phi i64 [ 0, %vector.memcheck172.preheader ], [ %56, %for.cond82.for.inc97_crit_edge.us ]
  %55 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep160 = getelementptr [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 0
  %56 = add i64 %indvars.iv75, 1
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %14, i64 %56, i64 0
  %scevgep164 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %indvars.iv75, i64 0
  %scevgep166 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %55, i64 0, i64 %56, i64 0
  %bound0168 = icmp ult double* %scevgep160, %scevgep166
  %bound1169 = icmp ult double* %scevgep164, %scevgep162
  %memcheck.conflict171 = and i1 %bound0168, %bound1169
  br i1 %memcheck.conflict171, label %for.body85.us.preheader, label %vector.body155.preheader

vector.body155.preheader:                         ; preds = %vector.memcheck172
  br label %vector.body155

for.body85.us.preheader:                          ; preds = %vector.memcheck172
  br label %for.body85.us

vector.body155:                                   ; preds = %vector.body155, %vector.body155.preheader
  %index174 = phi i64 [ 0, %vector.body155.preheader ], [ %index.next175.1, %vector.body155 ]
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv75, i64 %index174
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load182 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !15
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load183 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !15
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %index174
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load182, <2 x i64>* %63, align 8, !alias.scope !18, !noalias !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load183, <2 x i64>* %65, align 8, !alias.scope !18, !noalias !15
  %index.next175 = or i64 %index174, 4
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv75, i64 %index.next175
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load182.1 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load183.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !15
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %index.next175
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load182.1, <2 x i64>* %71, align 8, !alias.scope !18, !noalias !15
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load183.1, <2 x i64>* %73, align 8, !alias.scope !18, !noalias !15
  %index.next175.1 = add nuw nsw i64 %index174, 8
  %74 = icmp eq i64 %index.next175.1, 2000
  br i1 %74, label %for.cond82.for.inc97_crit_edge.us.loopexit192, label %vector.body155, !llvm.loop !20

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %75 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %76 = bitcast double* %arrayidx89.us to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv
  %78 = bitcast double* %arrayidx93.us to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %79 = bitcast double* %arrayidx89.us.1 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %82 = bitcast double* %arrayidx89.us.2 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %85 = bitcast double* %arrayidx89.us.3 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %75, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %88 = bitcast double* %arrayidx89.us.4 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %cmp83.us.4 = icmp slt i64 %indvars.iv.next.4, 2000
  br i1 %cmp83.us.4, label %for.body85.us, label %for.cond82.for.inc97_crit_edge.us.loopexit, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit192:    ; preds = %vector.body155
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit192, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %56, 2000
  br i1 %cmp79.us, label %vector.memcheck172, label %for.end99

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

for.body:                                         ; preds = %for.end47.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv45 = phi i2 [ %indvars.iv.next46, %for.end47.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %23, %for.end47.for.body_crit_edge ]
  %indvars.iv35 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next36, %for.end47.for.body_crit_edge ]
  %indvars.iv32 = phi i32 [ 0, %for.body.lr.ph ], [ %indvars.iv.next33, %for.end47.for.body_crit_edge ]
  %1 = zext i2 %indvars.iv45 to i64
  %2 = add nsw i64 %indvars.iv35, -1
  %cmp23 = icmp sgt i64 %indvars.iv35, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.end47_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %wide.trip.count26 = zext i32 %indvars.iv32 to i64
  br label %for.cond4.preheader

for.cond28.preheader.for.end47_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv35, i64 %indvars.iv35
  %.pre40 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %.pre38 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv35
  %.pre39 = load double, double* %arrayidx43, align 8
  %xtraiter42 = and i64 %indvars.iv35, 3
  %lcmp.mod43 = icmp eq i64 %xtraiter42, 0
  br i1 %lcmp.mod43, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %3 = phi double [ %.pre39, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv28.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next29.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter42, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv28.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !22

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %.unr44 = phi double [ %.pre39, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv28.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %1, %for.body30.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %2, 3
  br i1 %5, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %6 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %15, %for.end ]
  %indvars.iv20 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next21, %for.end ]
  %cmp51 = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv20
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv35, i64 0
  %7 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 0
  %8 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.lr.ph, %for.body6.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.lr.ph ]
  %9 = icmp eq i64 %indvars.iv20, 1
  br i1 %9, label %for.end.loopexit, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %10 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv
  %11 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv
  %12 = load double, double* %arrayidx12, align 8
  %mul = fmul double %11, %12
  %sub = fsub double %10, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv35, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %13, %14
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv20
  br i1 %exitcond.1, label %for.end.loopexit.loopexit, label %for.body6

for.end.loopexit.loopexit:                        ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.end.loopexit.loopexit, %for.body6.prol.loopexit.unr-lcssa
  %.pre37 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.end

for.end:                                          ; preds = %for.cond4.preheader, %for.end.loopexit
  %15 = phi [2000 x double]* [ %.pre37, %for.end.loopexit ], [ %6, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv20
  %16 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %15, i64 %indvars.iv35, i64 %indvars.iv20
  %17 = load double, double* %arrayidx24, align 8
  %div = fdiv double %17, %16
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next21, %wide.trip.count26
  br i1 %exitcond27, label %for.body30.lr.ph, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %18 = phi double [ %.unr44, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next29.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv28
  %19 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %19, %19
  %sub44 = fsub double %18, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv.next29
  %20 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %20, %20
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv.next29.1
  %21 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %21, %21
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next29.2 = add nsw i64 %indvars.iv28, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre38, i64 %indvars.iv35, i64 %indvars.iv.next29.2
  %22 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %22, %22
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %indvars.iv.next29.3 = add nsw i64 %indvars.iv28, 4
  %exitcond34.3 = icmp eq i64 %indvars.iv.next29.3, %indvars.iv35
  br i1 %exitcond34.3, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit, %for.cond28.preheader.for.end47_crit_edge
  %23 = phi [2000 x double]* [ %0, %for.cond28.preheader.for.end47_crit_edge ], [ %.pre38, %for.body30.prol.loopexit ], [ %.pre38, %for.end47.loopexit ]
  %24 = phi double [ %.pre40, %for.cond28.preheader.for.end47_crit_edge ], [ %sub44.lcssa.unr, %for.body30.prol.loopexit ], [ %sub44.3, %for.end47.loopexit ]
  %call = tail call double @sqrt(double %24) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %23, i64 %indvars.iv35, i64 %indvars.iv35
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %cmp = icmp slt i64 %indvars.iv.next36, 2000
  %indvars.iv.next33 = add i32 %indvars.iv32, 1
  br i1 %cmp, label %for.end47.for.body_crit_edge, label %for.end58

for.end47.for.body_crit_edge:                     ; preds = %for.end47
  %indvars.iv.next46 = add i2 %indvars.iv45, 1
  br label %for.body

for.end58:                                        ; preds = %for.end47
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

for.body4:                                        ; preds = %if.end, %for.body4.preheader
  %indvars.iv = phi i64 [ 0, %for.body4.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add i64 %3, %indvars.iv
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
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3 = icmp sgt i64 %indvars.iv.next, %indvars.iv8
  br i1 %cmp3, label %for.inc10.loopexit, label %for.body4

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

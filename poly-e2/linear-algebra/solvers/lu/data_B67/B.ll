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
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc.preheader

for.inc.preheader:                                ; preds = %entry, %for.inc23.for.body_crit_edge
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %for.inc23.for.body_crit_edge ], [ 0, %entry ]
  %0 = shl i64 %indvars.iv111, 32
  %sext = add i64 %0, 4294967296
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.preheader ]
  %1 = sub nsw i64 0, %indvars.iv95
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv95
  store double %add, double* %arrayidx6, align 8
  %exitcond101 = icmp eq i64 %indvars.iv95, %indvars.iv111
  br i1 %exitcond101, label %for.end, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  br label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %cmp969 = icmp slt i64 %indvars.iv.next112, 2000
  br i1 %cmp969, label %for.inc23.for.body_crit_edge, label %for.end25

for.inc23.for.body_crit_edge:                     ; preds = %for.end
  %3 = sub i64 1998, %indvars.iv111
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = ashr exact i64 %sext, 32
  %scevgep109 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %6
  %7 = add nuw nsw i64 %5, 8
  %8 = bitcast double* %scevgep109 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 %7, i32 8, i1 false)
  %arrayidx22115 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv111
  store double 1.000000e+00, double* %arrayidx22115, align 8
  br label %for.inc.preheader

for.end25:                                        ; preds = %for.end
  %arrayidx22117 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv111, i64 %indvars.iv111
  store double 1.000000e+00, double* %arrayidx22117, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %9 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %9, align 8
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge, %for.end25
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge ], [ 0, %for.end25 ]
  %11 = mul nuw nsw i64 %indvars.iv93, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %exitcond114 = icmp eq i64 %indvars.iv93, 1999
  br i1 %exitcond114, label %for.body47.us.preheader, label %for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge

for.cond30.for.inc41_crit_edge.us.for.cond30.for.inc41_crit_edge.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  br label %for.cond30.for.inc41_crit_edge.us

for.body47.us.preheader:                          ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.body51.us.us.preheader

for.body51.us.us.preheader:                       ; preds = %for.cond48.for.inc75_crit_edge.us.for.body51.us.us.preheader_crit_edge, %for.body47.us.preheader
  %indvars.iv87 = phi i64 [ 0, %for.body47.us.preheader ], [ %12, %for.cond48.for.inc75_crit_edge.us.for.body51.us.us.preheader_crit_edge ]
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv87
  %12 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %12
  br label %for.body51.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond122 = icmp eq i64 %12, 2000
  br i1 %exitcond122, label %for.body81.us.preheader, label %for.cond48.for.inc75_crit_edge.us.for.body51.us.us.preheader_crit_edge

for.cond48.for.inc75_crit_edge.us.for.body51.us.us.preheader_crit_edge: ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.body51.us.us.preheader

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us.for.body51.us.us_crit_edge, %for.body51.us.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.body51.us.us.preheader ], [ %13, %for.cond52.for.inc72_crit_edge.us.us.for.body51.us.us_crit_edge ]
  %scevgep1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv85, i64 0
  %13 = add nuw nsw i64 %indvars.iv85, 1
  %scevgep3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %13, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv87
  %bound0 = icmp ult double* %scevgep1, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound010 = icmp ult double* %scevgep1, %arrayidx59.us.us
  %bound111 = icmp ult double* %arrayidx59.us.us, %scevgep3
  %found.conflict12 = and i1 %bound010, %bound111
  %conflict.rdx = or i1 %found.conflict, %found.conflict12
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %14 = or i64 %index, 1
  %15 = or i64 %index, 2
  %16 = or i64 %index, 3
  %17 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv87
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %14, i64 %indvars.iv87
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %15, i64 %indvars.iv87
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %16, i64 %indvars.iv87
  %24 = load double, double* %20, align 8, !alias.scope !4
  %25 = load double, double* %21, align 8, !alias.scope !4
  %26 = load double, double* %22, align 8, !alias.scope !4
  %27 = load double, double* %23, align 8, !alias.scope !4
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %25, i32 1
  %30 = insertelement <2 x double> undef, double %26, i32 0
  %31 = insertelement <2 x double> %30, double %27, i32 1
  %32 = fmul <2 x double> %19, %29
  %33 = fmul <2 x double> %19, %31
  %34 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv85, i64 %index
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !6, !noalias !8
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !6, !noalias !8
  %38 = fadd <2 x double> %32, %wide.load
  %39 = fadd <2 x double> %33, %wide.load14
  store <2 x double> %38, <2 x double>* %35, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %39, <2 x double>* %37, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %40 = icmp eq i64 %index.next, 2000
  br i1 %40, label %for.cond52.for.inc72_crit_edge.us.us.loopexit45, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit45:  ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit45, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %exitcond121 = icmp eq i64 %13, 2000
  br i1 %exitcond121, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.for.inc72_crit_edge.us.us.for.body51.us.us_crit_edge

for.cond52.for.inc72_crit_edge.us.us.for.body51.us.us_crit_edge: ; preds = %for.cond52.for.inc72_crit_edge.us.us
  br label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us.for.inc69.us.us_crit_edge, %for.inc69.us.us.preheader
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.inc69.us.us.for.inc69.us.us_crit_edge ], [ 0, %for.inc69.us.us.preheader ]
  %41 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv87
  %42 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %41, %42
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv85, i64 %indvars.iv81
  %43 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %43
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %exitcond = icmp eq i64 %indvars.iv81, 1999
  br i1 %exitcond, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us.for.inc69.us.us_crit_edge, !llvm.loop !12

for.inc69.us.us.for.inc69.us.us_crit_edge:        ; preds = %for.inc69.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  br label %for.inc69.us.us

for.body81.us.preheader:                          ; preds = %for.cond48.for.inc75_crit_edge.us
  %44 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %45 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us.for.body81.us_crit_edge, %for.body81.us.preheader
  %indvars.iv79 = phi i64 [ 0, %for.body81.us.preheader ], [ %46, %for.cond82.for.inc97_crit_edge.us.for.body81.us_crit_edge ]
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %45, i64 %indvars.iv79, i64 0
  %46 = add nuw nsw i64 %indvars.iv79, 1
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %45, i64 %46, i64 0
  %scevgep24 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv79, i64 0
  %scevgep26 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %46, i64 0
  %bound028 = icmp ult double* %scevgep20, %scevgep26
  %bound129 = icmp ult double* %scevgep24, %scevgep22
  %memcheck.conflict31 = and i1 %bound028, %bound129
  br i1 %memcheck.conflict31, label %for.inc94.us.preheader, label %vector.body15.preheader

vector.body15.preheader:                          ; preds = %for.body81.us
  br label %vector.body15

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body15:                                    ; preds = %vector.body15.vector.body15_crit_edge, %vector.body15.preheader
  %index34 = phi i64 [ %index.next35, %vector.body15.vector.body15_crit_edge ], [ 0, %vector.body15.preheader ]
  %47 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv79, i64 %index34
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !13
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !13
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %45, i64 %indvars.iv79, i64 %index34
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %52, align 8, !alias.scope !16, !noalias !13
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %54, align 8, !alias.scope !16, !noalias !13
  %index.next35 = add nuw nsw i64 %index34, 4
  %55 = icmp eq i64 %index.next35, 2000
  br i1 %55, label %for.cond82.for.inc97_crit_edge.us.loopexit44, label %vector.body15.vector.body15_crit_edge, !llvm.loop !18

vector.body15.vector.body15_crit_edge:            ; preds = %vector.body15
  br label %vector.body15

for.inc94.us:                                     ; preds = %for.inc94.us.for.inc94.us_crit_edge, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc94.us.for.inc94.us_crit_edge ], [ 0, %for.inc94.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv79, i64 %indvars.iv
  %56 = bitcast double* %arrayidx89.us to i64*
  %57 = load i64, i64* %56, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %45, i64 %indvars.iv79, i64 %indvars.iv
  %58 = bitcast double* %arrayidx93.us to i64*
  store i64 %57, i64* %58, align 8
  %exitcond113 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond113, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us.for.inc94.us_crit_edge, !llvm.loop !19

for.inc94.us.for.inc94.us_crit_edge:              ; preds = %for.inc94.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc94.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit44:     ; preds = %vector.body15
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit44, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond120 = icmp eq i64 %46, 2000
  br i1 %exitcond120, label %for.end99.loopexit, label %for.cond82.for.inc97_crit_edge.us.for.body81.us_crit_edge

for.cond82.for.inc97_crit_edge.us.for.body81.us_crit_edge: ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.body81.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %59 = bitcast [2000 x [2000 x double]]* %44 to i8*
  tail call void @free(i8* %59) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.inc54.for.body_crit_edge, %entry
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc54.for.body_crit_edge ], [ 0, %entry ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc54.for.body_crit_edge ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv51, 4294967295
  %cmp210 = icmp sgt i64 %indvars.iv1, 0
  br i1 %cmp210, label %for.body3.preheader, label %for.body.for.inc54_crit_edge

for.body.for.inc54_crit_edge:                     ; preds = %for.body
  br label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  br label %for.body3

for.body3:                                        ; preds = %for.inc25.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.inc25.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.inc25.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %1 = and i64 %indvars.iv48, 4294967295
  %cmp56 = icmp sgt i64 %indvars.iv33, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv33
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp56, label %for.inc.preheader, label %for.body3.for.inc25_crit_edge

for.body3.for.inc25_crit_edge:                    ; preds = %for.body3
  br label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.for.inc_crit_edge ], [ 0, %for.inc.preheader ]
  %2 = phi double [ %sub, %for.inc.for.inc_crit_edge ], [ %.pre, %for.inc.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv
  %3 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv33
  %4 = load double, double* %arrayidx12, align 8
  %mul = fmul double %3, %4
  %sub = fsub double %2, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %exitcond50 = icmp eq i64 %indvars.iv, %1
  br i1 %exitcond50, label %for.inc25.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.body3.for.inc25_crit_edge, %for.inc25.loopexit
  %5 = phi double [ %.pre, %for.body3.for.inc25_crit_edge ], [ %sub, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv33
  %6 = load double, double* %arrayidx20, align 8
  %div = fdiv double %5, %6
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next34, %indvars.iv1
  br i1 %exitcond3, label %for.body30.lr.ph, label %for.inc25.for.body3_crit_edge

for.inc25.for.body3_crit_edge:                    ; preds = %for.inc25
  %indvars.iv.next49 = add nuw nsw i64 %1, 1
  br label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond31.for.inc51_crit_edge.us.for.body30.us_crit_edge, %for.body30.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.cond31.for.inc51_crit_edge.us.for.body30.us_crit_edge ], [ %indvars.iv1, %for.body30.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv44
  %.pre29 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.body30.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc48.us.for.inc48.us_crit_edge ], [ 0, %for.body30.us ]
  %7 = phi double [ %sub47.us, %for.inc48.us.for.inc48.us_crit_edge ], [ %.pre29, %for.body30.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv36
  %8 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv44
  %9 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %8, %9
  %sub47.us = fsub double %7, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %exitcond = icmp eq i64 %indvars.iv36, %0
  br i1 %exitcond, label %for.cond31.for.inc51_crit_edge.us, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  br label %for.inc48.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next45, 2000
  br i1 %exitcond53, label %for.inc54.loopexit, label %for.cond31.for.inc51_crit_edge.us.for.body30.us_crit_edge

for.cond31.for.inc51_crit_edge.us.for.body30.us_crit_edge: ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.body.for.inc54_crit_edge, %for.inc54.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond4, label %for.end56, label %for.inc54.for.body_crit_edge

for.inc54.for.body_crit_edge:                     ; preds = %for.inc54
  %indvars.iv.next52 = add nuw nsw i64 %0, 1
  br label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us.for.body.us_crit_edge, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond2.for.inc10_crit_edge.us.for.body.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv11, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us.for.body4.us_crit_edge ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %exitcond14, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.body.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}

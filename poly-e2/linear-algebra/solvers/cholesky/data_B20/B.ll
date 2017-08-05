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

for.body:                                         ; preds = %for.end18.for.body_crit_edge, %for.body.lr.ph
  %0 = phi [2000 x double]* [ %5, %for.end18.for.body_crit_edge ], [ %A, %for.body.lr.ph ]
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.end18.for.body_crit_edge ], [ 1, %for.body.lr.ph ]
  %indvars.iv95 = phi i32 [ %indvars.iv.next96, %for.end18.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv99, 32
  %1 = ashr exact i64 %sext, 32
  %cmp28 = icmp sgt i64 %indvars.iv105, -1
  br i1 %cmp28, label %for.body3.preheader, label %for.end

for.body3.preheader:                              ; preds = %for.body
  %wide.trip.count97 = zext i32 %indvars.iv95 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.body3 ], [ 0, %for.body3.preheader ]
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

for.end:                                          ; preds = %for.body3.for.end_crit_edge, %for.body
  %4 = phi [2000 x double]* [ %.pre, %for.body3.for.end_crit_edge ], [ %0, %for.body ]
  %indvars.iv.next106 = add i64 %indvars.iv105, 1
  %cmp99 = icmp slt i64 %indvars.iv.next106, 2000
  br i1 %cmp99, label %for.body11.lr.ph, label %for.body29.lr.ph.for.body29.us_crit_edge

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
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body11.prol.loopexit.loopexit, label %for.body11.prol, !llvm.loop !1

for.body11.prol.loopexit.loopexit:                ; preds = %for.body11.prol
  br label %for.body11.prol.loopexit

for.body11.prol.loopexit:                         ; preds = %for.body11.prol.loopexit.loopexit, %for.body11.lr.ph
  %indvars.iv101.unr = phi i64 [ %1, %for.body11.lr.ph ], [ %indvars.iv.next102.prol, %for.body11.prol.loopexit.loopexit ]
  %.unr = phi [2000 x double]* [ %4, %for.body11.lr.ph ], [ %5, %for.body11.prol.loopexit.loopexit ]
  %9 = icmp ult i64 %6, 7
  br i1 %9, label %for.end18.for.body_crit_edge, label %for.body11.lr.ph.new

for.body11.lr.ph.new:                             ; preds = %for.body11.prol.loopexit
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body11.lr.ph.new
  %indvars.iv101 = phi i64 [ %indvars.iv101.unr, %for.body11.lr.ph.new ], [ %indvars.iv.next102.7, %for.body11 ]
  %10 = phi [2000 x double]* [ %.unr, %for.body11.lr.ph.new ], [ %5, %for.body11 ]
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.body29.lr.ph.for.body29.us_crit_edge
  %indvars.iv89 = phi i64 [ 0, %for.body29.lr.ph.for.body29.us_crit_edge ], [ %indvars.iv.next90.7, %for.cond30.for.inc41_crit_edge.us ]
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  %12 = bitcast i8* %call to [2000 x [2000 x double]]*
  %13 = bitcast i8* %call to [2000 x [2000 x double]]*
  %14 = bitcast i8* %call to [2000 x [2000 x double]]*
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv89, i64 0
  %scevgep88 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv.next90, i64 0
  %scevgep88.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.1 = or i64 %indvars.iv89, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv.next90.1, i64 0
  %scevgep88.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.2 = or i64 %indvars.iv89, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv.next90.2, i64 0
  %scevgep88.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.3 = or i64 %indvars.iv89, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %14, i64 0, i64 %indvars.iv.next90.3, i64 0
  %scevgep88.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.4 = or i64 %indvars.iv89, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %13, i64 0, i64 %indvars.iv.next90.4, i64 0
  %scevgep88.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.5 = or i64 %indvars.iv89, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %12, i64 0, i64 %indvars.iv.next90.5, i64 0
  %scevgep88.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.6 = or i64 %indvars.iv89, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv.next90.6, i64 0
  %scevgep88.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep88.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.7 = add nsw i64 %indvars.iv89, 8
  %exitcond165.7 = icmp eq i64 %indvars.iv.next90.7, 2000
  br i1 %exitcond165.7, label %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us
  %19 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body51.lr.ph.us

for.inc75.us:                                     ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond164 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond164, label %vector.memcheck148.preheader, label %for.body51.lr.ph.us

vector.memcheck148.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck148

for.body51.lr.ph.us:                              ; preds = %for.inc75.us, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge
  %indvars.iv81 = phi i64 [ 0, %for.cond48.preheader.lr.ph.for.cond48.preheader.us_crit_edge ], [ %indvars.iv.next82, %for.inc75.us ]
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %19, i64 0, i64 %indvars.iv81
  %20 = add nuw nsw i64 %indvars.iv81, 1
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %19, i64 1999, i64 %20
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.lr.ph.us
  %indvars.iv79 = phi i64 [ 0, %for.body51.lr.ph.us ], [ %indvars.iv.next80, %for.cond52.for.inc72_crit_edge.us.us ]
  %21 = bitcast double* %scevgep123 to i8*
  %22 = bitcast double* %scevgep125 to i8*
  %23 = mul nuw nsw i64 %indvars.iv79, 16000
  %scevgep121 = getelementptr i8, i8* %call, i64 %23
  %24 = add nuw nsw i64 %23, 16000
  %scevgep122 = getelementptr i8, i8* %call, i64 %24
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv79, i64 %indvars.iv81
  %bound0 = icmp ult i8* %scevgep121, %22
  %bound1 = icmp ult i8* %21, %scevgep122
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc127 = bitcast double* %arrayidx59.us.us to i8*
  %bound0128 = icmp ult i8* %scevgep121, %bc127
  %bound1129 = icmp ult i8* %bc, %scevgep122
  %found.conflict130 = and i1 %bound0128, %bound1129
  %conflict.rdx = or i1 %found.conflict, %found.conflict130
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %vector.memcheck
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = or i64 %index, 1
  %27 = or i64 %index, 2
  %28 = or i64 %index, 3
  %29 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !3
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x double> undef, double %29, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %index, i64 %indvars.iv81
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %26, i64 %indvars.iv81
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %27, i64 %indvars.iv81
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %28, i64 %indvars.iv81
  %38 = load double, double* %34, align 8, !alias.scope !6
  %39 = load double, double* %35, align 8, !alias.scope !6
  %40 = load double, double* %36, align 8, !alias.scope !6
  %41 = load double, double* %37, align 8, !alias.scope !6
  %42 = insertelement <2 x double> undef, double %38, i32 0
  %43 = insertelement <2 x double> %42, double %39, i32 1
  %44 = insertelement <2 x double> undef, double %40, i32 0
  %45 = insertelement <2 x double> %44, double %41, i32 1
  %46 = fmul <2 x double> %31, %43
  %47 = fmul <2 x double> %33, %45
  %48 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv79, i64 %index
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !8, !noalias !10
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %52 = fadd <2 x double> %wide.load, %46
  %53 = fadd <2 x double> %wide.load132, %47
  %54 = bitcast double* %48 to <2 x double>*
  store <2 x double> %52, <2 x double>* %54, align 8, !alias.scope !8, !noalias !10
  %55 = bitcast double* %50 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8, !alias.scope !8, !noalias !10
  %index.next = add nuw nsw i64 %index, 4
  %56 = icmp eq i64 %index.next, 2000
  br i1 %56, label %for.cond52.for.inc72_crit_edge.us.us.loopexit167, label %vector.body, !llvm.loop !11

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit167: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit167, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond163 = icmp eq i64 %indvars.iv.next80, 2000
  br i1 %exitcond163, label %for.inc75.us, label %vector.memcheck

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next76.1, %for.body55.us.us ]
  %57 = bitcast i8* %call to [2000 x [2000 x double]]*
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv75, i64 %indvars.iv81
  %60 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %59, %60
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv79, i64 %indvars.iv75
  %61 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %61, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next76 = or i64 %indvars.iv75, 1
  %62 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv.next76, i64 %indvars.iv81
  %63 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %62, %63
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 %indvars.iv79, i64 %indvars.iv.next76
  %64 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %64, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1999
  br i1 %exitcond78.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !14

vector.memcheck148:                               ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck148.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %for.cond82.for.inc97_crit_edge.us ], [ 0, %vector.memcheck148.preheader ]
  %scevgep138 = getelementptr [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 0
  %65 = add nuw nsw i64 %indvars.iv73, 1
  %scevgep140 = getelementptr [2000 x double], [2000 x double]* %19, i64 %65, i64 0
  %66 = mul nuw nsw i64 %indvars.iv73, 16000
  %scevgep142 = getelementptr i8, i8* %call, i64 %66
  %67 = add nuw nsw i64 %66, 16000
  %scevgep143 = getelementptr i8, i8* %call, i64 %67
  %68 = bitcast double* %scevgep140 to i8*
  %69 = bitcast double* %scevgep138 to i8*
  %bound0144 = icmp ult i8* %69, %scevgep143
  %bound1145 = icmp ult i8* %scevgep142, %68
  %memcheck.conflict147 = and i1 %bound0144, %bound1145
  br i1 %memcheck.conflict147, label %for.body85.us.preheader, label %vector.body133.preheader

vector.body133.preheader:                         ; preds = %vector.memcheck148
  br label %vector.body133

for.body85.us.preheader:                          ; preds = %vector.memcheck148
  br label %for.body85.us

vector.body133:                                   ; preds = %vector.body133, %vector.body133.preheader
  %index150 = phi i64 [ 0, %vector.body133.preheader ], [ %index.next151.1, %vector.body133 ]
  %70 = bitcast i8* %call to [2000 x [2000 x double]]*
  %71 = bitcast i8* %call to [2000 x [2000 x double]]*
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %71, i64 0, i64 %indvars.iv73, i64 %index150
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load158 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !15
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load159 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !15
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %index150
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load158, <2 x i64>* %77, align 8, !alias.scope !18, !noalias !15
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load159, <2 x i64>* %79, align 8, !alias.scope !18, !noalias !15
  %index.next151 = or i64 %index150, 4
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv73, i64 %index.next151
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load158.1 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !15
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load159.1 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !15
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %index.next151
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load158.1, <2 x i64>* %85, align 8, !alias.scope !18, !noalias !15
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load159.1, <2 x i64>* %87, align 8, !alias.scope !18, !noalias !15
  %index.next151.1 = add nsw i64 %index150, 8
  %88 = icmp eq i64 %index.next151.1, 2000
  br i1 %88, label %for.cond82.for.inc97_crit_edge.us.loopexit166, label %vector.body133, !llvm.loop !20

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %89 = bitcast i8* %call to [2000 x [2000 x double]]*
  %90 = bitcast i8* %call to [2000 x [2000 x double]]*
  %91 = bitcast i8* %call to [2000 x [2000 x double]]*
  %92 = bitcast i8* %call to [2000 x [2000 x double]]*
  %93 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %93, i64 0, i64 %indvars.iv73, i64 %indvars.iv
  %94 = bitcast double* %arrayidx89.us to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %indvars.iv
  %96 = bitcast double* %arrayidx93.us to i64*
  store i64 %95, i64* %96, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %92, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next
  %97 = bitcast double* %arrayidx89.us.1 to i64*
  %98 = load i64, i64* %97, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %indvars.iv.next
  %99 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %98, i64* %99, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %91, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %100 = bitcast double* %arrayidx89.us.2 to i64*
  %101 = load i64, i64* %100, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %indvars.iv.next.1
  %102 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %101, i64* %102, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %90, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %103 = bitcast double* %arrayidx89.us.3 to i64*
  %104 = load i64, i64* %103, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %indvars.iv.next.2
  %105 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %104, i64* %105, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %106 = bitcast double* %arrayidx89.us.4 to i64*
  %107 = load i64, i64* %106, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv73, i64 %indvars.iv.next.3
  %108 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %107, i64* %108, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !21

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit166:    ; preds = %vector.body133
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit166, %for.cond82.for.inc97_crit_edge.us.loopexit
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond162 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond162, label %for.end99, label %vector.memcheck148

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.body

for.body:                                         ; preds = %for.end47, %for.body.lr.ph
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end47 ], [ 0, %for.body.lr.ph ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.end47 ], [ -1, %for.body.lr.ph ]
  %0 = add i64 %indvars.iv37, 4294967295
  %1 = and i64 %0, 4294967295
  %cmp24 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp24, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.end47_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.end47_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv37
  %.pre36 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.end47

for.body30.lr.ph:                                 ; preds = %for.end
  %arrayidx43.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv37
  %.pre35 = load double, double* %arrayidx43.phi.trans.insert, align 8
  %wide.trip.count30 = zext i32 %indvars.iv28 to i64
  %xtraiter41 = and i64 %indvars.iv37, 3
  %lcmp.mod42 = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod42, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %2 = phi double [ %.pre35, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next27.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter41, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv26.prol
  %3 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %3, %3
  %sub44.prol = fsub double %2, %mul39.prol
  store double %sub44.prol, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !22

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %.unr43 = phi double [ %.pre35, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol.loopexit.loopexit ]
  %indvars.iv26.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %indvars.iv.next27.prol, %for.body30.prol.loopexit.loopexit ]
  %4 = icmp ult i64 %1, 3
  br i1 %4, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv22 = phi i32 [ %indvars.iv.next23, %for.end ], [ -1, %for.cond4.preheader.preheader ]
  %5 = add i64 %indvars.iv24, 4294967295
  %6 = and i64 %5, 4294967295
  %cmp52 = icmp sgt i64 %indvars.iv24, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv24
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp52, label %for.body6.lr.ph, label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %wide.trip.count = zext i32 %indvars.iv22 to i64
  %7 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %7, 0
  br i1 %lcmp.mod, label %for.body6.prol, label %for.body6.prol.loopexit

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 0
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %10 = icmp eq i64 %6, 0
  br i1 %10, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %11 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv24
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %indvars.iv.next23 = add nsw i32 %indvars.iv22, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next25, %indvars.iv37
  br i1 %exitcond39, label %for.body30.lr.ph, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %18 = phi double [ %.unr43, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next27.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv26
  %19 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %19, %19
  %sub44 = fsub double %18, %mul39
  store double %sub44, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next27
  %20 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %20, %20
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next27.1
  %21 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %21, %21
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next27.2
  %22 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %22, %22
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43.phi.trans.insert, align 8
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  %exitcond31.3 = icmp eq i64 %indvars.iv.next27.2, %wide.trip.count30
  br i1 %exitcond31.3, label %for.end47.loopexit, label %for.body30

for.end47.loopexit:                               ; preds = %for.body30
  br label %for.end47

for.end47:                                        ; preds = %for.end47.loopexit, %for.body30.prol.loopexit, %for.cond28.preheader.for.end47_crit_edge
  %arrayidx55.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.cond28.preheader.for.end47_crit_edge ], [ %arrayidx43.phi.trans.insert, %for.body30.prol.loopexit ], [ %arrayidx43.phi.trans.insert, %for.end47.loopexit ]
  %23 = phi double [ %.pre36, %for.cond28.preheader.for.end47_crit_edge ], [ %sub44.lcssa.unr, %for.body30.prol.loopexit ], [ %sub44.3, %for.end47.loopexit ]
  %call = tail call double @sqrt(double %23) #4
  store double %call, double* %arrayidx55.pre-phi, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %indvars.iv.next29 = add nsw i32 %indvars.iv28, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond40, label %for.end58, label %for.body

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
  br label %for.body4.preheader

for.body4.preheader:                              ; preds = %for.body.lr.ph, %for.inc10
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc10 ], [ 1, %for.body.lr.ph ]
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc10 ], [ 0, %for.body.lr.ph ]
  %3 = mul nuw nsw i64 %indvars.iv7, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body4.preheader ]
  %4 = add nuw nsw i64 %3, %indvars.iv
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
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv10
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond12, label %for.end12, label %for.body4.preheader

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

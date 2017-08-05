; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_start() #5
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry.for.body_crit_edge:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry.for.body_crit_edge
  %indvars.iv146 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next147, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv146
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv146
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %0 = trunc i64 %indvars.iv.next147 to i32
  %conv4 = sitofp i32 %0 to double
  %div = fdiv double %conv4, 2.000000e+03
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv146
  store double %add6, double* %arrayidx8, align 8
  %exitcond149 = icmp eq i64 %indvars.iv146, 1999
  br i1 %exitcond149, label %for.body.for.body16.lr.ph_crit_edge, label %for.body

for.body.for.body16.lr.ph_crit_edge:              ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body.for.body16.lr.ph_crit_edge, %for.end39.for.cond13.preheader_crit_edge
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %for.end39.for.cond13.preheader_crit_edge ], [ 0, %for.body.for.body16.lr.ph_crit_edge ]
  %1 = shl i64 %indvars.iv144, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = sub i64 1998, %indvars.iv144
  %4 = shl i64 %3, 3
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %cmp3080, label %for.end39.for.cond13.preheader_crit_edge, label %for.end46.for.cond51.preheader.us_crit_edge

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %5 = sub nsw i64 0, %indvars.iv128
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv128
  store double %add20, double* %arrayidx24, align 8
  %exitcond134 = icmp eq i64 %indvars.iv128, %indvars.iv144
  br i1 %exitcond134, label %for.cond29.preheader, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  br label %for.body16

for.end39.for.cond13.preheader_crit_edge:         ; preds = %for.cond29.preheader
  %7 = and i64 %4, 34359738360
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %2
  %8 = add nuw nsw i64 %7, 8
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep142143, i8 0, i64 %8, i32 8, i1 false)
  %arrayidx43152 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %arrayidx43152, align 8
  br label %for.body16.lr.ph

for.end46.for.cond51.preheader.us_crit_edge:      ; preds = %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %arrayidx43, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46.for.cond51.preheader.us_crit_edge
  %indvars.iv126 = phi i64 [ 0, %for.end46.for.cond51.preheader.us_crit_edge ], [ %indvars.iv.next127, %for.inc62.us ]
  %9 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next127, 2000
  br i1 %exitcond157, label %for.inc62.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge, label %for.inc62.us

for.inc62.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge: ; preds = %for.inc62.us
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.inc62.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge
  %indvars.iv120 = phi i64 [ 0, %for.inc62.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge ], [ %11, %for.inc96.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv120
  %11 = add i64 %indvars.iv120, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %11
  %12 = bitcast double* %scevgep5 to i8*
  %13 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %exitcond156 = icmp eq i64 %11, 2000
  br i1 %exitcond156, label %for.inc96.us.for.cond103.preheader.us_crit_edge, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.inc96.us.for.cond103.preheader.us_crit_edge:  ; preds = %for.inc96.us
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv118 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next119, %for.inc93.us.us ]
  %14 = mul i64 %indvars.iv118, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %14
  %15 = add i64 %14, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %15
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv120
  %bound0 = icmp ult i8* %scevgep1, %12
  %bound1 = icmp ult i8* %13, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.cond73.preheader.us.us.for.body76.us.us_crit_edge, label %for.cond73.preheader.us.us.vector.body_crit_edge

for.cond73.preheader.us.us.vector.body_crit_edge: ; preds = %for.cond73.preheader.us.us
  br label %vector.body

for.cond73.preheader.us.us.for.body76.us.us_crit_edge: ; preds = %for.cond73.preheader.us.us
  br label %for.body76.us.us

vector.body:                                      ; preds = %vector.body, %for.cond73.preheader.us.us.vector.body_crit_edge
  %index = phi i64 [ 0, %for.cond73.preheader.us.us.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %16 = or i64 %index, 1
  %17 = or i64 %index, 2
  %18 = or i64 %index, 3
  %19 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv120
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %16, i64 %indvars.iv120
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %17, i64 %indvars.iv120
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %18, i64 %indvars.iv120
  %26 = load double, double* %22, align 8, !alias.scope !4
  %27 = load double, double* %23, align 8, !alias.scope !4
  %28 = load double, double* %24, align 8, !alias.scope !4
  %29 = load double, double* %25, align 8, !alias.scope !4
  %30 = insertelement <2 x double> undef, double %26, i32 0
  %31 = insertelement <2 x double> %30, double %27, i32 1
  %32 = insertelement <2 x double> undef, double %28, i32 0
  %33 = insertelement <2 x double> %32, double %29, i32 1
  %34 = fmul <2 x double> %21, %31
  %35 = fmul <2 x double> %21, %33
  %36 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv118, i64 %index
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !6, !noalias !8
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !6, !noalias !8
  %40 = fadd <2 x double> %wide.load, %34
  %41 = fadd <2 x double> %wide.load12, %35
  store <2 x double> %40, <2 x double>* %37, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %41, <2 x double>* %39, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, 2000
  br i1 %42, label %for.inc93.us.us.loopexit41, label %vector.body, !llvm.loop !9

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us.loopexit41:                       ; preds = %vector.body
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit41, %for.inc93.us.us.loopexit
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond155, label %for.inc96.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.cond73.preheader.us.us.for.body76.us.us_crit_edge
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.body76.us.us.for.body76.us.us_crit_edge ], [ 0, %for.cond73.preheader.us.us.for.body76.us.us_crit_edge ]
  %43 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv120
  %44 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %43, %44
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv118, i64 %indvars.iv114
  %45 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %45, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond117 = icmp eq i64 %indvars.iv114, 1999
  br i1 %exitcond117, label %for.inc93.us.us.loopexit, label %for.body76.us.us.for.body76.us.us_crit_edge, !llvm.loop !12

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br label %for.body76.us.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.inc96.us.for.cond103.preheader.us_crit_edge
  %indvars.iv112 = phi i64 [ 0, %for.inc96.us.for.cond103.preheader.us_crit_edge ], [ %46, %for.inc118.us ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %46 = add i64 %indvars.iv112, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %46, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %47 = mul i64 %indvars.iv112, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %47
  %48 = add i64 %47, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %48
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.cond103.preheader.us.for.body106.us_crit_edge, label %for.cond103.preheader.us.vector.body13_crit_edge

for.cond103.preheader.us.vector.body13_crit_edge: ; preds = %for.cond103.preheader.us
  br label %vector.body13

for.cond103.preheader.us.for.body106.us_crit_edge: ; preds = %for.cond103.preheader.us
  br label %for.body106.us

vector.body13:                                    ; preds = %vector.body13, %for.cond103.preheader.us.vector.body13_crit_edge
  %index30 = phi i64 [ 0, %for.cond103.preheader.us.vector.body13_crit_edge ], [ %index.next31, %vector.body13 ]
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv112, i64 %index30
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !13
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !13
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %index30
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %54, align 8, !alias.scope !16, !noalias !13
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %56, align 8, !alias.scope !16, !noalias !13
  %index.next31 = add i64 %index30, 4
  %57 = icmp eq i64 %index.next31, 2000
  br i1 %57, label %for.inc118.us.loopexit40, label %vector.body13, !llvm.loop !18

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.cond103.preheader.us.for.body106.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.us.for.body106.us_crit_edge ], [ 0, %for.cond103.preheader.us.for.body106.us_crit_edge ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv112, i64 %indvars.iv
  %58 = bitcast double* %arrayidx110.us to i64*
  %59 = load i64, i64* %58, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv
  %60 = bitcast double* %arrayidx114.us to i64*
  store i64 %59, i64* %60, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %for.inc118.us.loopexit, label %for.body106.us.for.body106.us_crit_edge, !llvm.loop !19

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106.us

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us.loopexit40:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit40, %for.inc118.us.loopexit
  %exitcond154 = icmp eq i64 %46, 2000
  br i1 %exitcond154, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  call void @free(i8* nonnull %call) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry.for.cond1.preheader_crit_edge
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry.for.cond1.preheader_crit_edge ]
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry.for.cond1.preheader_crit_edge ]
  %0 = sub i64 2000, %indvars.iv2
  %1 = and i64 %indvars.iv156, 4294967295
  %cmp295 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp295, label %for.cond1.preheader.for.body3_crit_edge, label %for.body30.preheader

for.cond1.preheader.for.body3_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph.for.body30.preheader_crit_edge, %for.cond1.preheader
  %min.iters.check = icmp ult i64 %0, 4
  br i1 %min.iters.check, label %for.body30.preheader18, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body30.preheader
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv2, %n.vec
  br i1 %cmp.zero, label %for.body30.preheader18, label %min.iters.checked.vector.body_crit_edge

min.iters.checked.vector.body_crit_edge:          ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked.vector.body_crit_edge
  %index = phi i64 [ 0, %min.iters.checked.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %index.next = add i64 %index, 4
  %2 = icmp eq i64 %index.next, %n.vec
  br i1 %2, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %0, %n.vec
  br i1 %cmp.n, label %for.inc58, label %for.body30.preheader18

for.body30.preheader18:                           ; preds = %middle.block, %min.iters.checked, %for.body30.preheader
  %indvars.iv127.ph = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv2, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.body30

for.body30.lr.ph:                                 ; preds = %for.end
  br i1 true, label %for.body30.lr.ph.for.body30.us_crit_edge, label %for.body30.lr.ph.for.body30.preheader_crit_edge

for.body30.lr.ph.for.body30.preheader_crit_edge:  ; preds = %for.body30.lr.ph
  br label %for.body30.preheader

for.body30.lr.ph.for.body30.us_crit_edge:         ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.end50.us, %for.body30.lr.ph.for.body30.us_crit_edge
  %indvars.iv140 = phi i64 [ %indvars.iv2, %for.body30.lr.ph.for.body30.us_crit_edge ], [ %indvars.iv.next141, %for.end50.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv140
  %3 = load double, double* %arrayidx34.us, align 8
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %w.199.us = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %3, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv132
  %4 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv132, i64 %indvars.iv140
  %5 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %4, %5
  %sub47.us = fsub double %w.199.us, %mul46.us
  %exitcond158 = icmp eq i64 %indvars.iv132, %1
  br i1 %exitcond158, label %for.end50.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  br label %for.body37.us

for.end50.us:                                     ; preds = %for.body37.us
  store double %sub47.us, double* %arrayidx34.us, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond159 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond159, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.end.for.body3_crit_edge, %for.cond1.preheader.for.body3_crit_edge
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %for.end.for.body3_crit_edge ], [ 4294967295, %for.cond1.preheader.for.body3_crit_edge ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.end.for.body3_crit_edge ], [ 0, %for.cond1.preheader.for.body3_crit_edge ]
  %6 = and i64 %indvars.iv153, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv123
  %7 = load double, double* %arrayidx5, align 8
  %cmp791 = icmp sgt i64 %indvars.iv123, 0
  br i1 %cmp791, label %for.body3.for.body8_crit_edge, label %for.end

for.body3.for.body8_crit_edge:                    ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body3.for.body8_crit_edge
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.body8.for.body8_crit_edge ], [ 0, %for.body3.for.body8_crit_edge ]
  %w.093 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %7, %for.body3.for.body8_crit_edge ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv117
  %8 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv123
  %9 = load double, double* %arrayidx16, align 8
  %mul = fmul double %8, %9
  %sub = fsub double %w.093, %mul
  %exitcond155 = icmp eq i64 %indvars.iv117, %6
  br i1 %exitcond155, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %w.0.lcssa = phi double [ %7, %for.body3 ], [ %sub, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  %10 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %10
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next124, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  %indvars.iv.next154 = add nuw nsw i64 %6, 1
  br label %for.body3

for.body30:                                       ; preds = %for.body30.preheader18, %for.body30.for.body30_crit_edge
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.body30.for.body30_crit_edge ], [ %indvars.iv127.ph, %for.body30.preheader18 ]
  %exitcond130 = icmp eq i64 %indvars.iv127, 1999
  br i1 %exitcond130, label %for.inc58.loopexit19, label %for.body30.for.body30_crit_edge, !llvm.loop !21

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit19:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit19, %for.inc58.loopexit, %middle.block
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond5, label %for.inc58.for.body63_crit_edge, label %for.inc58.for.cond1.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next157 = add nuw nsw i64 %1, 1
  br label %for.cond1.preheader

for.inc58.for.body63_crit_edge:                   ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.end79.for.body63_crit_edge, %for.inc58.for.body63_crit_edge
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.inc58.for.body63_crit_edge ]
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.end79.for.body63_crit_edge ], [ 0, %for.inc58.for.body63_crit_edge ]
  %11 = and i64 %indvars.iv150, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv115
  %12 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv115, 0
  br i1 %cmp6784, label %for.body63.for.body68_crit_edge, label %for.end79

for.body63.for.body68_crit_edge:                  ; preds = %for.body63
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body63.for.body68_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body68.for.body68_crit_edge ], [ 0, %for.body63.for.body68_crit_edge ]
  %w.286 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %12, %for.body63.for.body68_crit_edge ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv
  %13 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %14 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %13, %14
  %sub76 = fsub double %w.286, %mul75
  %exitcond152 = icmp eq i64 %indvars.iv, %11
  br i1 %exitcond152, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body63
  %w.2.lcssa = phi double [ %12, %for.body63 ], [ %sub76, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv115
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond1, label %for.end79.for.body88_crit_edge, label %for.end79.for.body63_crit_edge

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next151 = add nuw nsw i64 %11, 1
  br label %for.body63

for.end79.for.body88_crit_edge:                   ; preds = %for.end79
  %sunkaddr10 = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.backedge, %for.end79.for.body88_crit_edge
  %indvars.iv109 = phi i64 [ 2000, %for.end79.for.body88_crit_edge ], [ %indvars.iv.next110, %for.body88.backedge ]
  %indvars.iv.next110 = add i64 %indvars.iv109, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next110
  %15 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv109, 2000
  br i1 %cmp9278, label %for.body88.for.body93_crit_edge, label %for.end104.thread

for.body88.for.body93_crit_edge:                  ; preds = %for.body88
  br label %for.body93

for.end104.thread:                                ; preds = %for.body88
  %arrayidx108145 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next110
  %16 = load double, double* %arrayidx108145, align 8
  %div109146 = fdiv double %15, %16
  %sunkaddr6 = shl i64 %indvars.iv109, 3
  %sunkaddr7 = add i64 %sunkaddr10, %sunkaddr6
  %sunkaddr8 = add i64 %sunkaddr7, -8
  %sunkaddr9 = inttoptr i64 %sunkaddr8 to double*
  store double %div109146, double* %sunkaddr9, align 8
  br label %for.body88.backedge

for.body88.backedge:                              ; preds = %for.end104.thread, %for.end104
  br label %for.body88

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body88.for.body93_crit_edge
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.body93.for.body93_crit_edge ], [ %indvars.iv109, %for.body88.for.body93_crit_edge ]
  %w.379 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %15, %for.body88.for.body93_crit_edge ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107
  %17 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv107
  %18 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %17, %18
  %sub101 = fsub double %w.379, %mul100
  %exitcond = icmp eq i64 %indvars.iv107, 1999
  br i1 %exitcond, label %for.end104, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  br label %for.body93

for.end104:                                       ; preds = %for.body93
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next110
  %19 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %sub101, %19
  %sunkaddr11 = shl i64 %indvars.iv109, 3
  %sunkaddr12 = add i64 %sunkaddr10, %sunkaddr11
  %sunkaddr13 = add i64 %sunkaddr12, -8
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  store double %div109, double* %sunkaddr14, align 8
  %cmp87 = icmp sgt i64 %indvars.iv109, 1
  br i1 %cmp87, label %for.body88.backedge, label %for.end113

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry.for.body_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
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
!20 = distinct !{!20, !10, !11}
!21 = distinct !{!21, !22, !10, !11}
!22 = !{!"llvm.loop.unroll.runtime.disable"}

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
  %arraydecay7 = bitcast i8* %call to [2000 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10)
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
  %arraydecay12 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %arraydecay12)
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
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv146 = phi i64 [ 0, %entry ], [ %indvars.iv.next147, %for.body ]
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
  %exitcond170 = icmp eq i64 %indvars.iv146, 1999
  br i1 %exitcond170, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.end39, %for.body16.lr.ph.preheader
  %indvars.iv144 = phi i64 [ 0, %for.body16.lr.ph.preheader ], [ %indvars.iv.next145, %for.end39 ]
  %1 = shl i64 %indvars.iv144, 32
  %sext = add nuw nsw i64 %1, 4294967296
  %2 = sub nsw i64 1998, %indvars.iv144
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %3 = ashr exact i64 %sext, 32
  %4 = shl i64 %2, 3
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %cmp3080, label %for.body32.for.end39_crit_edge, label %for.end39

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

for.body32.for.end39_crit_edge:                   ; preds = %for.cond29.preheader
  %7 = and i64 %4, 34359738360
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %3
  %8 = add nuw nsw i64 %7, 8
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep142143, i8 0, i64 %8, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.cond29.preheader, %for.body32.for.end39_crit_edge
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %arrayidx43, align 8
  %exitcond169 = icmp eq i64 %indvars.iv.next145, 2000
  br i1 %exitcond169, label %for.end46, label %for.body16.lr.ph

for.end46:                                        ; preds = %for.end39
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %for.inc62.us

for.inc62.us:                                     ; preds = %for.inc62.us, %for.end46
  %indvars.iv126 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next127, %for.inc62.us ]
  %9 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond168 = icmp eq i64 %indvars.iv.next127, 2000
  br i1 %exitcond168, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader, label %for.inc62.us

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader: ; preds = %for.inc62.us
  %10 = bitcast i8* %call to [2000 x [2000 x double]]*
  %11 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader
  %indvars.iv120 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge.preheader ], [ %indvars.iv.next121, %for.inc96.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv120
  %12 = add nuw nsw i64 %indvars.iv120, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %12
  %13 = bitcast double* %scevgep5 to i8*
  %14 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond167 = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond167, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.inc96.us
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv118 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next119, %for.inc93.us.us ]
  %17 = mul nuw nsw i64 %indvars.iv118, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %17
  %18 = add nuw nsw i64 %17, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %18
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv120
  %bound0 = icmp ult i8* %scevgep1, %13
  %bound1 = icmp ult i8* %14, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80.us.us to i8*
  %bc7 = bitcast double* %arrayidx80.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.body76.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us.us
  br label %vector.body

for.body76.us.us.preheader:                       ; preds = %for.cond73.preheader.us.us
  br label %for.body76.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %19 = or i64 %index, 1
  %20 = or i64 %index, 2
  %21 = or i64 %index, 3
  %22 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv120
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %19, i64 %indvars.iv120
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %20, i64 %indvars.iv120
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %21, i64 %indvars.iv120
  %31 = load double, double* %27, align 8, !alias.scope !4
  %32 = load double, double* %28, align 8, !alias.scope !4
  %33 = load double, double* %29, align 8, !alias.scope !4
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = insertelement <2 x double> undef, double %31, i32 0
  %36 = insertelement <2 x double> %35, double %32, i32 1
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = fmul <2 x double> %24, %36
  %40 = fmul <2 x double> %26, %38
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %11, i64 0, i64 %indvars.iv118, i64 %index
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !6, !noalias !8
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = fadd <2 x double> %wide.load, %39
  %46 = fadd <2 x double> %wide.load12, %40
  %47 = bitcast double* %41 to <2 x double>*
  store <2 x double> %45, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = bitcast double* %43 to <2 x double>*
  store <2 x double> %46, <2 x double>* %48, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %for.inc93.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us.loopexit43:                       ; preds = %vector.body
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit43, %for.inc93.us.us.loopexit
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond166, label %for.inc96.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body76.us.us.preheader
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.body76.us.us.for.body76.us.us_crit_edge ], [ 0, %for.body76.us.us.preheader ]
  %50 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv120
  %51 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %50, %51
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %10, i64 0, i64 %indvars.iv118, i64 %indvars.iv114
  %52 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %52, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %exitcond165 = icmp eq i64 %indvars.iv114, 1999
  br i1 %exitcond165, label %for.inc93.us.us.loopexit, label %for.body76.us.us.for.body76.us.us_crit_edge, !llvm.loop !12

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br label %for.body76.us.us

for.cond103.preheader.us:                         ; preds = %for.inc118.us, %for.cond103.preheader.us.preheader
  %indvars.iv112 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next113, %for.inc118.us ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %53 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %53, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %54 = mul nuw nsw i64 %indvars.iv112, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %54
  %55 = add nuw nsw i64 %54, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %55
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.body106.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader.us
  br label %vector.body13

for.body106.us.preheader:                         ; preds = %for.cond103.preheader.us
  br label %for.body106.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31, %vector.body13 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv112, i64 %index30
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !13
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !13
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %index30
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %61, align 8, !alias.scope !16, !noalias !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %63, align 8, !alias.scope !16, !noalias !13
  %index.next31 = add nuw nsw i64 %index30, 4
  %64 = icmp eq i64 %index.next31, 2000
  br i1 %64, label %for.inc118.us.loopexit42, label %vector.body13, !llvm.loop !18

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body106.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body106.us.for.body106.us_crit_edge ], [ 0, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv112, i64 %indvars.iv
  %65 = bitcast double* %arrayidx110.us to i64*
  %66 = load i64, i64* %65, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv
  %67 = bitcast double* %arrayidx114.us to i64*
  store i64 %66, i64* %67, align 8
  %exitcond164 = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond164, label %for.inc118.us.loopexit, label %for.body106.us.for.body106.us_crit_edge, !llvm.loop !19

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body106.us

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  call void @free(i8* %call) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58.for.cond1.preheader_crit_edge, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58.for.cond1.preheader_crit_edge ], [ 0, %entry ]
  %indvars.iv155 = phi i64 [ %indvars.iv.next156, %for.inc58.for.cond1.preheader_crit_edge ], [ 4294967295, %entry ]
  %0 = sub i64 2000, %indvars.iv2
  %1 = and i64 %indvars.iv155, 4294967295
  %cmp295 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp295, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.cond1.preheader
  %min.iters.check = icmp ult i64 %0, 4
  br i1 %min.iters.check, label %for.body30.preheader13, label %min.iters.checked

for.body30.preheader13:                           ; preds = %middle.block, %min.iters.checked, %for.body30.preheader
  %indvars.iv127.ph = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv2, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.body30

min.iters.checked:                                ; preds = %for.body30.preheader
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv2, %n.vec
  br i1 %cmp.zero, label %for.body30.preheader13, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %2 = add i64 %indvars.iv2, %index
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %2
  %4 = bitcast double* %3 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %4, align 8
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x i64>*
  %wide.load8 = load <2 x i64>, <2 x i64>* %6, align 8
  %7 = bitcast double* %3 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %7, align 8
  %8 = bitcast double* %5 to <2 x i64>*
  store <2 x i64> %wide.load8, <2 x i64>* %8, align 8
  %index.next = add i64 %index, 4
  %9 = icmp eq i64 %index.next, %n.vec
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !20

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %0, %n.vec
  br i1 %cmp.n, label %for.inc58, label %for.body30.preheader13

for.body30.lr.ph:                                 ; preds = %for.end
  %cmp3697 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp3697, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.end50.us, %for.body30.us.preheader
  %indvars.iv140 = phi i64 [ %indvars.iv2, %for.body30.us.preheader ], [ %indvars.iv.next141, %for.end50.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv140
  %10 = load double, double* %arrayidx34.us, align 8
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.for.body37.us_crit_edge, %for.body30.us
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.body37.us.for.body37.us_crit_edge ], [ 0, %for.body30.us ]
  %w.199.us = phi double [ %sub47.us, %for.body37.us.for.body37.us_crit_edge ], [ %10, %for.body30.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv132
  %11 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv132, i64 %indvars.iv140
  %12 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %11, %12
  %sub47.us = fsub double %w.199.us, %mul46.us
  %exitcond157 = icmp eq i64 %indvars.iv132, %1
  br i1 %exitcond157, label %for.end50.us, label %for.body37.us.for.body37.us_crit_edge

for.body37.us.for.body37.us_crit_edge:            ; preds = %for.body37.us
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  br label %for.body37.us

for.end50.us:                                     ; preds = %for.body37.us
  %arrayidx54.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv140
  store double %sub47.us, double* %arrayidx54.us, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.end.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv151 = phi i64 [ %indvars.iv.next152, %for.end.for.body3_crit_edge ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.end.for.body3_crit_edge ], [ 0, %for.body3.preheader ]
  %13 = and i64 %indvars.iv151, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv123
  %14 = load double, double* %arrayidx5, align 8
  %cmp791 = icmp sgt i64 %indvars.iv123, 0
  br i1 %cmp791, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body8.preheader
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %for.body8.for.body8_crit_edge ], [ 0, %for.body8.preheader ]
  %w.093 = phi double [ %sub, %for.body8.for.body8_crit_edge ], [ %14, %for.body8.preheader ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv117
  %15 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv123
  %16 = load double, double* %arrayidx16, align 8
  %mul = fmul double %15, %16
  %sub = fsub double %w.093, %mul
  %exitcond153 = icmp eq i64 %indvars.iv117, %13
  br i1 %exitcond153, label %for.end.loopexit, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  br label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3
  %w.0.lcssa = phi double [ %14, %for.body3 ], [ %sub, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %17
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv123
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next124, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  %indvars.iv.next152 = add nuw nsw i64 %13, 1
  br label %for.body3

for.body30:                                       ; preds = %for.body30.for.body30_crit_edge, %for.body30.preheader13
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %for.body30.for.body30_crit_edge ], [ %indvars.iv127.ph, %for.body30.preheader13 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv127
  %18 = bitcast double* %arrayidx34 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv127
  %20 = bitcast double* %arrayidx54 to i64*
  store i64 %19, i64* %20, align 8
  %exitcond154 = icmp eq i64 %indvars.iv127, 1999
  br i1 %exitcond154, label %for.inc58.loopexit15, label %for.body30.for.body30_crit_edge, !llvm.loop !21

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  br label %for.body30

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit15:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit15, %for.inc58.loopexit, %middle.block
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.inc58.for.cond1.preheader_crit_edge

for.inc58.for.cond1.preheader_crit_edge:          ; preds = %for.inc58
  %indvars.iv.next156 = add nuw nsw i64 %1, 1
  br label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.end79.for.body63_crit_edge, %for.body63.preheader
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %for.end79.for.body63_crit_edge ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.end79.for.body63_crit_edge ], [ 0, %for.body63.preheader ]
  %21 = and i64 %indvars.iv148, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv115
  %22 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv115, 0
  br i1 %cmp6784, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  br label %for.body68

for.body68:                                       ; preds = %for.body68.for.body68_crit_edge, %for.body68.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body68.for.body68_crit_edge ], [ 0, %for.body68.preheader ]
  %w.286 = phi double [ %sub76, %for.body68.for.body68_crit_edge ], [ %22, %for.body68.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv
  %23 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %24 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %23, %24
  %sub76 = fsub double %w.286, %mul75
  %exitcond150 = icmp eq i64 %indvars.iv, %21
  br i1 %exitcond150, label %for.end79.loopexit, label %for.body68.for.body68_crit_edge

for.body68.for.body68_crit_edge:                  ; preds = %for.body68
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body63
  %w.2.lcssa = phi double [ %22, %for.body63 ], [ %sub76, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv115
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.end79.for.body63_crit_edge

for.end79.for.body63_crit_edge:                   ; preds = %for.end79
  %indvars.iv.next149 = add nuw nsw i64 %21, 1
  br label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.end104, %for.body88.preheader
  %indvars.iv109 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next110, %for.end104 ]
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next110
  %25 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv109, 2000
  br i1 %cmp9278, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  br label %for.body93

for.body93:                                       ; preds = %for.body93.for.body93_crit_edge, %for.body93.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.body93.for.body93_crit_edge ], [ %indvars.iv109, %for.body93.preheader ]
  %w.379 = phi double [ %sub101, %for.body93.for.body93_crit_edge ], [ %25, %for.body93.preheader ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107
  %26 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv107
  %27 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %26, %27
  %sub101 = fsub double %w.379, %mul100
  %exitcond = icmp eq i64 %indvars.iv107, 1999
  br i1 %exitcond, label %for.end104.loopexit, label %for.body93.for.body93_crit_edge

for.body93.for.body93_crit_edge:                  ; preds = %for.body93
  %indvars.iv.next108 = add i64 %indvars.iv107, 1
  br label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body88
  %w.3.lcssa = phi double [ %25, %for.body88 ], [ %sub101, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next110
  %28 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %28
  %sunkaddr9 = shl i64 %indvars.iv109, 3
  %sunkaddr10 = add i64 %sunkaddr, %sunkaddr9
  %sunkaddr11 = add i64 %sunkaddr10, -8
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  store double %div109, double* %sunkaddr12, align 8
  %cmp87 = icmp sgt i64 %indvars.iv109, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.end104
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
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

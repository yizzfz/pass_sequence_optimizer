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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #5
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #5
  tail call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv146 = phi i64 [ 0, %entry ], [ %indvars.iv.next147.1, %for.body ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv146
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv146
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next147 = or i64 %indvars.iv146, 1
  %2 = trunc i64 %indvars.iv.next147 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv146
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next147.1 = add nsw i64 %indvars.iv146, 2
  %3 = trunc i64 %indvars.iv.next147.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond168.1 = icmp eq i64 %indvars.iv.next147, 1999
  br i1 %exitcond168.1, label %for.body16.lr.ph.preheader, label %for.body

for.body16.lr.ph.preheader:                       ; preds = %for.body
  br label %for.body16.lr.ph

for.body16.lr.ph:                                 ; preds = %for.body16.lr.ph.preheader, %for.end39.for.cond13.preheader_crit_edge
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %for.end39.for.cond13.preheader_crit_edge ], [ 0, %for.body16.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv144, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  %7 = sub i64 1998, %indvars.iv144
  %8 = shl i64 %7, 3
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next145, 2000
  br i1 %cmp3080, label %for.end39.for.cond13.preheader_crit_edge, label %for.end46

for.body16:                                       ; preds = %for.body16, %for.body16.lr.ph
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %for.body16 ], [ 0, %for.body16.lr.ph ]
  %9 = sub nsw i64 0, %indvars.iv128
  %10 = trunc i64 %9 to i32
  %rem = srem i32 %10, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv128
  store double %add20, double* %arrayidx24, align 8
  %exitcond134 = icmp eq i64 %indvars.iv128, %indvars.iv144
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  br i1 %exitcond134, label %for.cond29.preheader, label %for.body16

for.end39.for.cond13.preheader_crit_edge:         ; preds = %for.cond29.preheader
  %11 = and i64 %8, 34359738360
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %6
  %12 = add nuw nsw i64 %11, 8
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep142143, i8 0, i64 %12, i32 8, i1 false)
  %arrayidx43152 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %arrayidx43152, align 8
  br label %for.body16.lr.ph

for.end46:                                        ; preds = %for.cond29.preheader
  %arrayidx43154 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv144, i64 %indvars.iv144
  store double 1.000000e+00, double* %arrayidx43154, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #5
  br label %for.cond51.preheader.us

for.cond51.preheader.us:                          ; preds = %for.cond51.preheader.us, %for.end46
  %indvars.iv126 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next127.7, %for.cond51.preheader.us ]
  %13 = mul nuw nsw i64 %indvars.iv126, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %14 = mul nuw nsw i64 %indvars.iv.next127, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.1 = or i64 %indvars.iv126, 2
  %15 = mul nuw nsw i64 %indvars.iv.next127.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.2 = or i64 %indvars.iv126, 3
  %16 = mul nuw nsw i64 %indvars.iv.next127.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.3 = or i64 %indvars.iv126, 4
  %17 = mul nuw nsw i64 %indvars.iv.next127.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.4 = or i64 %indvars.iv126, 5
  %18 = mul nuw nsw i64 %indvars.iv.next127.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.5 = or i64 %indvars.iv126, 6
  %19 = mul nuw nsw i64 %indvars.iv.next127.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.6 = or i64 %indvars.iv126, 7
  %20 = mul nuw nsw i64 %indvars.iv.next127.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next127.7 = add nsw i64 %indvars.iv126, 8
  %exitcond167.7 = icmp eq i64 %indvars.iv.next127.7, 2000
  br i1 %exitcond167.7, label %for.cond51.preheader.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge, label %for.cond51.preheader.us

for.cond51.preheader.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge: ; preds = %for.cond51.preheader.us
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge: ; preds = %for.inc96.us, %for.cond51.preheader.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc96.us ], [ 0, %for.cond51.preheader.us.for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge_crit_edge ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv120
  %24 = add i64 %indvars.iv120, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %24
  %25 = bitcast double* %scevgep5 to i8*
  %26 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next121, 2000
  br i1 %exitcond166, label %for.cond103.preheader.us.preheader, label %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge

for.cond103.preheader.us.preheader:               ; preds = %for.inc96.us
  %27 = bitcast i8* %call to [2000 x [2000 x double]]*
  %28 = bitcast i8* %call to [2000 x [2000 x double]]*
  %29 = bitcast i8* %call to [2000 x [2000 x double]]*
  %30 = bitcast i8* %call to [2000 x [2000 x double]]*
  %31 = bitcast i8* %call to [2000 x [2000 x double]]*
  %32 = bitcast i8* %call to [2000 x [2000 x double]]*
  %33 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader.us

for.cond73.preheader.us.us:                       ; preds = %for.inc93.us.us, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge
  %indvars.iv118 = phi i64 [ 0, %for.cond69.preheader.us.for.cond73.preheader.us.us_crit_edge ], [ %indvars.iv.next119, %for.inc93.us.us ]
  %34 = mul i64 %indvars.iv118, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %34
  %35 = add i64 %34, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %35
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv120
  %bound0 = icmp ult i8* %scevgep1, %25
  %bound1 = icmp ult i8* %26, %scevgep2
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

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %arrayidx80.us.us, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv120
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %36, i64 %indvars.iv120
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %37, i64 %indvars.iv120
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %38, i64 %indvars.iv120
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %41, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv118, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load12, %57
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %for.inc93.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc93.us.us.loopexit:                         ; preds = %for.body76.us.us
  br label %for.inc93.us.us

for.inc93.us.us.loopexit43:                       ; preds = %vector.body
  br label %for.inc93.us.us

for.inc93.us.us:                                  ; preds = %for.inc93.us.us.loopexit43, %for.inc93.us.us.loopexit
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond165 = icmp eq i64 %indvars.iv.next119, 2000
  br i1 %exitcond165, label %for.inc96.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us, %for.body76.us.us.preheader
  %indvars.iv114 = phi i64 [ 0, %for.body76.us.us.preheader ], [ %indvars.iv.next115.1, %for.body76.us.us ]
  %67 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv114, i64 %indvars.iv120
  %68 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %67, %68
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv118, i64 %indvars.iv114
  %69 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %69, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next115 = or i64 %indvars.iv114, 1
  %70 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next115, i64 %indvars.iv120
  %71 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %70, %71
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv118, i64 %indvars.iv.next115
  %72 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %72, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %exitcond164.1 = icmp eq i64 %indvars.iv.next115, 1999
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  br i1 %exitcond164.1, label %for.inc93.us.us.loopexit, label %for.body76.us.us, !llvm.loop !12

for.cond103.preheader.us:                         ; preds = %for.cond103.preheader.us.preheader, %for.inc118.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %for.inc118.us ], [ 0, %for.cond103.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %73 = add i64 %indvars.iv112, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %73, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %74 = mul i64 %indvars.iv112, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %74
  %75 = add i64 %74, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %75
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.body106.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader.us
  br label %vector.body13

for.body106.us.preheader:                         ; preds = %for.cond103.preheader.us
  br label %for.body106.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv112, i64 %index30
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %index30
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %84 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv112, i64 %index.next31
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %index.next31
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %92 = icmp eq i64 %index.next31.1, 2000
  br i1 %92, label %for.inc118.us.loopexit42, label %vector.body13, !llvm.loop !18

for.body106.us:                                   ; preds = %for.body106.us, %for.body106.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body106.us.preheader ], [ %indvars.iv.next.4, %for.body106.us ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv112, i64 %indvars.iv
  %93 = bitcast double* %arrayidx110.us to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv
  %95 = bitcast double* %arrayidx114.us to i64*
  store i64 %94, i64* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next
  %96 = bitcast double* %arrayidx110.us.1 to i64*
  %97 = load i64, i64* %96, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv.next
  %98 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %97, i64* %98, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.1
  %99 = bitcast double* %arrayidx110.us.2 to i64*
  %100 = load i64, i64* %99, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv.next.1
  %101 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %100, i64* %101, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.2
  %102 = bitcast double* %arrayidx110.us.3 to i64*
  %103 = load i64, i64* %102, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv.next.2
  %104 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %103, i64* %104, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv112, i64 %indvars.iv.next.3
  %105 = bitcast double* %arrayidx110.us.4 to i64*
  %106 = load i64, i64* %105, align 8
  %arrayidx114.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv112, i64 %indvars.iv.next.3
  %107 = bitcast double* %arrayidx114.us.4 to i64*
  store i64 %106, i64* %107, align 8
  %exitcond163.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond163.4, label %for.inc118.us.loopexit, label %for.body106.us, !llvm.loop !19

for.inc118.us.loopexit:                           ; preds = %for.body106.us
  br label %for.inc118.us

for.inc118.us.loopexit42:                         ; preds = %vector.body13
  br label %for.inc118.us

for.inc118.us:                                    ; preds = %for.inc118.us.loopexit42, %for.inc118.us.loopexit
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader.us

for.end120:                                       ; preds = %for.inc118.us
  tail call void @free(i8* %call) #5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.inc58 ], [ 4294967295, %entry ]
  %0 = sub i64 1999, %indvars.iv2
  %1 = and i64 %indvars.iv152, 4294967295
  %cmp295 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp295, label %for.body3.preheader, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.cond1.preheader
  %2 = sub i64 0, %indvars.iv2
  %xtraiter15 = and i64 %2, 7
  %lcmp.mod16 = icmp eq i64 %xtraiter15, 0
  br i1 %lcmp.mod16, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv127.prol = phi i64 [ %indvars.iv.next128.prol, %for.body30.prol ], [ %indvars.iv2, %for.body30.prol.preheader ]
  %prol.iter17 = phi i64 [ %prol.iter17.sub, %for.body30.prol ], [ %xtraiter15, %for.body30.prol.preheader ]
  %indvars.iv.next128.prol = add nuw nsw i64 %indvars.iv127.prol, 1
  %prol.iter17.sub = add i64 %prol.iter17, -1
  %prol.iter17.cmp = icmp eq i64 %prol.iter17.sub, 0
  br i1 %prol.iter17.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !20

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv127.unr = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv.next128.prol, %for.body30.prol.loopexit.loopexit ]
  %3 = icmp ult i64 %0, 7
  br i1 %3, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.end50.us
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %for.end50.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv140
  %4 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod21, label %for.body37.us.prol, label %for.body37.us.prol.loopexit

for.body37.us.prol:                               ; preds = %for.body30.us
  %5 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv140
  %6 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %5, %6
  %sub47.us.prol = fsub double %4, %mul46.us.prol
  br label %for.body37.us.prol.loopexit

for.body37.us.prol.loopexit:                      ; preds = %for.body37.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv132.unr.ph = phi i64 [ 1, %for.body37.us.prol ], [ 0, %for.body30.us ]
  %w.199.us.unr.ph = phi double [ %sub47.us.prol, %for.body37.us.prol ], [ %4, %for.body30.us ]
  br i1 %23, label %for.end50.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.body37.us.prol.loopexit
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us, %for.body30.us.new
  %indvars.iv132 = phi i64 [ %indvars.iv132.unr.ph, %for.body30.us.new ], [ %indvars.iv.next133.1, %for.body37.us ]
  %w.199.us = phi double [ %w.199.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.body37.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv132
  %7 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv132, i64 %indvars.iv140
  %8 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %9 = load <2 x double>, <2 x double>* %7, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next133, i64 %indvars.iv140
  %10 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %8, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %10, i32 1
  %mul46.us = fmul <2 x double> %9, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.199.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond154.1 = icmp eq i64 %indvars.iv.next133, %1
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  br i1 %exitcond154.1, label %for.end50.us.loopexit, label %for.body37.us

for.end50.us.loopexit:                            ; preds = %for.body37.us
  br label %for.end50.us

for.end50.us:                                     ; preds = %for.end50.us.loopexit, %for.body37.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.body37.us.prol.loopexit ], [ %sub47.us.1, %for.end50.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.end
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %for.end ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv123 = phi i64 [ %indvars.iv.next124, %for.end ], [ 0, %for.body3.preheader ]
  %11 = and i64 %indvars.iv148, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv123
  %12 = load double, double* %arrayidx5, align 8
  %cmp791 = icmp sgt i64 %indvars.iv123, 0
  br i1 %cmp791, label %for.body8.preheader, label %for.end

for.body8.preheader:                              ; preds = %for.body3
  %13 = and i64 %indvars.iv148, 1
  %lcmp.mod19 = icmp eq i64 %13, 0
  br i1 %lcmp.mod19, label %for.body8.prol, label %for.body8.prol.loopexit

for.body8.prol:                                   ; preds = %for.body8.preheader
  %14 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv123
  %15 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %14, %15
  %sub.prol = fsub double %12, %mul.prol
  br label %for.body8.prol.loopexit

for.body8.prol.loopexit:                          ; preds = %for.body8.prol, %for.body8.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ undef, %for.body8.preheader ]
  %indvars.iv117.unr.ph = phi i64 [ 1, %for.body8.prol ], [ 0, %for.body8.preheader ]
  %w.093.unr.ph = phi double [ %sub.prol, %for.body8.prol ], [ %12, %for.body8.preheader ]
  %16 = icmp eq i64 %11, 0
  br i1 %16, label %for.end, label %for.body8.preheader.new

for.body8.preheader.new:                          ; preds = %for.body8.prol.loopexit
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body8.preheader.new
  %indvars.iv117 = phi i64 [ %indvars.iv117.unr.ph, %for.body8.preheader.new ], [ %indvars.iv.next118.1, %for.body8 ]
  %w.093 = phi double [ %w.093.unr.ph, %for.body8.preheader.new ], [ %sub.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv117
  %17 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv117, i64 %indvars.iv123
  %18 = load double, double* %arrayidx16, align 8
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %19 = load <2 x double>, <2 x double>* %17, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next118, i64 %indvars.iv123
  %20 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %18, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %20, i32 1
  %mul = fmul <2 x double> %19, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.093, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond150.1 = icmp eq i64 %indvars.iv.next118, %11
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  br i1 %exitcond150.1, label %for.end.loopexit, label %for.body8

for.end.loopexit:                                 ; preds = %for.body8
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body8.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %12, %for.body3 ], [ %sub.lcssa.unr.ph, %for.body8.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv123, i64 %indvars.iv123
  %21 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %21
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next124 = add nuw nsw i64 %indvars.iv123, 1
  %indvars.iv.next149 = add nuw nsw i64 %11, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next124, %indvars.iv2
  br i1 %exitcond4, label %for.body30.us.preheader, label %for.body3

for.body30.us.preheader:                          ; preds = %for.end
  %22 = and i64 %indvars.iv152, 1
  %lcmp.mod21 = icmp eq i64 %22, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %23 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv127 = phi i64 [ %indvars.iv127.unr, %for.body30.preheader.new ], [ %indvars.iv.next128.7, %for.body30 ]
  %exitcond151.7 = icmp eq i64 %indvars.iv127, 1992
  %indvars.iv.next128.7 = add nsw i64 %indvars.iv127, 8
  br i1 %exitcond151.7, label %for.inc58.loopexit22, label %for.body30

for.inc58.loopexit:                               ; preds = %for.end50.us
  br label %for.inc58

for.inc58.loopexit22:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit22, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next153 = add nuw nsw i64 %1, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.end79
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.end79 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.end79 ], [ 0, %for.body63.preheader ]
  %24 = and i64 %indvars.iv145, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv115
  %25 = load double, double* %arrayidx65, align 8
  %cmp6784 = icmp sgt i64 %indvars.iv115, 0
  br i1 %cmp6784, label %for.body68.preheader, label %for.end79

for.body68.preheader:                             ; preds = %for.body63
  %26 = add nsw i64 %indvars.iv145, 1
  %xtraiter12 = and i64 %26, 3
  %lcmp.mod13 = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13, label %for.body68.prol.loopexit, label %for.body68.prol.preheader

for.body68.prol.preheader:                        ; preds = %for.body68.preheader
  br label %for.body68.prol

for.body68.prol:                                  ; preds = %for.body68.prol, %for.body68.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body68.prol ], [ 0, %for.body68.prol.preheader ]
  %w.286.prol = phi double [ %sub76.prol, %for.body68.prol ], [ %25, %for.body68.prol.preheader ]
  %prol.iter14 = phi i64 [ %prol.iter14.sub, %for.body68.prol ], [ %xtraiter12, %for.body68.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv.prol
  %27 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %28 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %27, %28
  %sub76.prol = fsub double %w.286.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter14.sub = add i64 %prol.iter14, -1
  %prol.iter14.cmp = icmp eq i64 %prol.iter14.sub, 0
  br i1 %prol.iter14.cmp, label %for.body68.prol.loopexit.loopexit, label %for.body68.prol, !llvm.loop !22

for.body68.prol.loopexit.loopexit:                ; preds = %for.body68.prol
  br label %for.body68.prol.loopexit

for.body68.prol.loopexit:                         ; preds = %for.body68.prol.loopexit.loopexit, %for.body68.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.body68.preheader ], [ %indvars.iv.next.prol, %for.body68.prol.loopexit.loopexit ]
  %w.286.unr = phi double [ %25, %for.body68.preheader ], [ %sub76.prol, %for.body68.prol.loopexit.loopexit ]
  %29 = icmp ult i64 %24, 3
  br i1 %29, label %for.end79, label %for.body68.preheader.new

for.body68.preheader.new:                         ; preds = %for.body68.prol.loopexit
  br label %for.body68

for.body68:                                       ; preds = %for.body68, %for.body68.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body68.preheader.new ], [ %indvars.iv.next.3, %for.body68 ]
  %w.286 = phi double [ %w.286.unr, %for.body68.preheader.new ], [ %sub76.3, %for.body68 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv
  %30 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %31 = bitcast double* %arrayidx74 to <2 x double>*
  %32 = load <2 x double>, <2 x double>* %30, align 8
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %mul75 = fmul <2 x double> %32, %33
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.286, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv.next.1
  %34 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %35 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %36 = load <2 x double>, <2 x double>* %34, align 8
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %mul75.2 = fmul <2 x double> %36, %37
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond147.3 = icmp eq i64 %indvars.iv.next.2, %24
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond147.3, label %for.end79.loopexit, label %for.body68

for.end79.loopexit:                               ; preds = %for.body68
  br label %for.end79

for.end79:                                        ; preds = %for.end79.loopexit, %for.body68.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %25, %for.body63 ], [ %sub76.lcssa.unr, %for.body68.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv115
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %indvars.iv.next146 = add nuw nsw i64 %24, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.end79
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.end104
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104 ]
  %indvars.iv109 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next110, %for.end104 ]
  %38 = add i64 %indvar, -1
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next110
  %39 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv109, 2000
  br i1 %cmp9278, label %for.body93.preheader, label %for.end104

for.body93.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body93.prol.loopexit, label %for.body93.prol.preheader

for.body93.prol.preheader:                        ; preds = %for.body93.preheader
  br label %for.body93.prol

for.body93.prol:                                  ; preds = %for.body93.prol, %for.body93.prol.preheader
  %indvars.iv107.prol = phi i64 [ %indvars.iv.next108.prol, %for.body93.prol ], [ %indvars.iv109, %for.body93.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.body93.prol ], [ %39, %for.body93.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body93.prol ], [ %xtraiter, %for.body93.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107.prol
  %40 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv107.prol
  %41 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %40, %41
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next108.prol = add i64 %indvars.iv107.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body93.prol.loopexit.loopexit, label %for.body93.prol, !llvm.loop !23

for.body93.prol.loopexit.loopexit:                ; preds = %for.body93.prol
  br label %for.body93.prol.loopexit

for.body93.prol.loopexit:                         ; preds = %for.body93.prol.loopexit.loopexit, %for.body93.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %indvars.iv107.unr = phi i64 [ %indvars.iv109, %for.body93.preheader ], [ %indvars.iv.next108.prol, %for.body93.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %39, %for.body93.preheader ], [ %sub101.prol, %for.body93.prol.loopexit.loopexit ]
  %42 = icmp ult i64 %38, 3
  br i1 %42, label %for.end104, label %for.body93.preheader.new

for.body93.preheader.new:                         ; preds = %for.body93.prol.loopexit
  br label %for.body93

for.body93:                                       ; preds = %for.body93, %for.body93.preheader.new
  %indvars.iv107 = phi i64 [ %indvars.iv107.unr, %for.body93.preheader.new ], [ %indvars.iv.next108.3, %for.body93 ]
  %w.379 = phi double [ %w.379.unr, %for.body93.preheader.new ], [ %sub101.3, %for.body93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv107
  %43 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv107
  %44 = bitcast double* %arrayidx99 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %43, align 8
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %mul100 = fmul <2 x double> %45, %46
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next108.1 = add i64 %indvars.iv107, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next108.1
  %47 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next108.1
  %48 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next108.2 = add i64 %indvars.iv107, 3
  %49 = load <2 x double>, <2 x double>* %47, align 8
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %mul100.2 = fmul <2 x double> %49, %50
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next108.2, 1999
  %indvars.iv.next108.3 = add i64 %indvars.iv107, 4
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.body93

for.end104.loopexit:                              ; preds = %for.body93
  br label %for.end104

for.end104:                                       ; preds = %for.end104.loopexit, %for.body93.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %39, %for.body88 ], [ %sub101.lcssa.unr, %for.body93.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next110, i64 %indvars.iv.next110
  %51 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %51
  %sunkaddr7 = shl i64 %indvars.iv109, 3
  %sunkaddr8 = add i64 %sunkaddr, %sunkaddr7
  %sunkaddr9 = add i64 %sunkaddr8, -8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  store double %div109, double* %sunkaddr10, align 8
  %cmp87 = icmp sgt i64 %indvars.iv109, 1
  %indvar.next = add i64 %indvar, 1
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}

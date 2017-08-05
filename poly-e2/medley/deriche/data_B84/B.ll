; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %arraydecay = bitcast i8* %call to [2160 x float]*
  %arraydecay4 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(float* nonnull %alpha, [2160 x float]* %arraydecay)
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @print_array([2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc7 ]
  %0 = mul nuw nsw i64 %indvars.iv7, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nuw nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv7, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.inc7, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

for.inc7:                                         ; preds = %vector.body
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 4096
  br i1 %exitcond6, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) unnamed_addr #0 {
entry:
  %sub = fsub float -0.000000e+00, %alpha
  %call = tail call float @expf(float %sub) #5
  %sub1 = fsub float 1.000000e+00, %call
  %call3 = tail call float @expf(float %sub) #5
  %sub4 = fsub float 1.000000e+00, %call3
  %mul = fmul float %sub1, %sub4
  %mul5 = fmul float %alpha, 2.000000e+00
  %call7 = tail call float @expf(float %sub) #5
  %mul8 = fmul float %mul5, %call7
  %add = fadd float %mul8, 1.000000e+00
  %call10 = tail call float @expf(float %mul5) #5
  %sub11 = fsub float %add, %call10
  %div = fdiv float %mul, %sub11
  %call13 = tail call float @expf(float %sub) #5
  %mul14 = fmul float %call13, %div
  %sub15 = fadd float %alpha, -1.000000e+00
  %mul16 = fmul float %sub15, %mul14
  %call18 = tail call float @expf(float %sub) #5
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul3740 = fmul float %mul16, 0.000000e+00
  %mul3942 = fmul float %exp2, 0.000000e+00
  %mul4144 = fmul float %call29, -0.000000e+00
  %mul36.v.i0.1 = insertelement <2 x float> undef, float %mul16, i32 0
  %mul36.v.i0.2 = insertelement <2 x float> %mul36.v.i0.1, float %div, i32 1
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.inc55, %entry
  %indvars.iv46 = phi i64 [ 0, %entry ], [ %indvars.iv.next44, %for.inc55 ]
  %arrayidx3538 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv46, i64 0
  %0 = load float, float* %arrayidx3538, align 4
  %mul3639 = fmul float %div, %0
  %add3841 = fadd float %mul3740, %mul3639
  %add4043 = fadd float %mul3942, %add3841
  %add4245 = fadd float %mul4144, %add4043
  %arrayidx4646 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv46, i64 0
  store float %add4245, float* %arrayidx4646, align 4
  br label %for.inc.for.inc_crit_edge

for.cond58.preheader:                             ; preds = %for.inc55
  %add20 = fadd float %alpha, 1.000000e+00
  %1 = fmul float %div, %call24
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %1
  %mul6526 = fmul float %mul21, 0.000000e+00
  %mul6627 = fmul float %1, -0.000000e+00
  %add6728 = fadd float %mul6526, %mul6627
  %mul6829 = fmul float %exp2, 0.000000e+00
  %add6930 = fadd float %add6728, %mul6829
  %mul7031 = fmul float %call29, -0.000000e+00
  %add7132 = fadd float %add6930, %mul7031
  br label %for.cond62.preheader

for.inc.for.inc_crit_edge:                        ; preds = %for.inc.for.inc_crit_edge, %for.cond31.preheader
  %indvars.iv.next3850 = phi i64 [ 1, %for.cond31.preheader ], [ %indvars.iv.next38, %for.inc.for.inc_crit_edge ]
  %add4249 = phi float [ %add4245, %for.cond31.preheader ], [ %add42, %for.inc.for.inc_crit_edge ]
  %arrayidx3548 = phi float* [ %arrayidx3538, %for.cond31.preheader ], [ %arrayidx35, %for.inc.for.inc_crit_edge ]
  %ym1.04147 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add4249, %for.inc.for.inc_crit_edge ]
  %2 = bitcast float* %arrayidx3548 to <2 x float>*
  %arrayidx35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv46, i64 %indvars.iv.next3850
  %3 = load <2 x float>, <2 x float>* %2, align 4
  %mul37 = fmul <2 x float> %mul36.v.i0.2, %3
  %mul37.v.r1 = extractelement <2 x float> %mul37, i32 0
  %mul37.v.r2 = extractelement <2 x float> %mul37, i32 1
  %add38 = fadd float %mul37.v.r1, %mul37.v.r2
  %mul39 = fmul float %exp2, %add4249
  %add40 = fadd float %mul39, %add38
  %mul41 = fmul float %ym1.04147, %sub30
  %add42 = fadd float %mul41, %add40
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv46, i64 %indvars.iv.next3850
  store float %add42, float* %arrayidx46, align 4
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv.next3850, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 2160
  br i1 %exitcond39, label %for.inc55, label %for.inc.for.inc_crit_edge

for.inc55:                                        ; preds = %for.inc.for.inc_crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 4096
  br i1 %exitcond45, label %for.cond58.preheader, label %for.cond31.preheader

for.cond62.preheader:                             ; preds = %for.inc86, %for.cond58.preheader
  %indvars.iv37 = phi i64 [ 0, %for.cond58.preheader ], [ %indvars.iv.next35, %for.inc86 ]
  %arrayidx7533 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv37, i64 2159
  store float %add7132, float* %arrayidx7533, align 4
  br label %for.inc84.for.inc84_crit_edge

for.inc84.for.inc84_crit_edge:                    ; preds = %for.inc84.for.inc84_crit_edge.1, %for.cond62.preheader
  %add7137 = phi float [ %add7132, %for.cond62.preheader ], [ %add71.1, %for.inc84.for.inc84_crit_edge.1 ]
  %xp1.03036 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %84, %for.inc84.for.inc84_crit_edge.1 ]
  %yp1.03235 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %add71, %for.inc84.for.inc84_crit_edge.1 ]
  %indvars.iv.next293434 = phi i64 [ 2159, %for.cond62.preheader ], [ %indvars.iv.next29.1, %for.inc84.for.inc84_crit_edge.1 ]
  %indvars.iv.next29 = add nsw i64 %indvars.iv.next293434, -1
  %arrayidx79 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv37, i64 %indvars.iv.next293434
  %4 = load float, float* %arrayidx79, align 4
  %mul65 = fmul float %mul21, %4
  %mul66 = fmul float %xp1.03036, %mul25
  %add67 = fadd float %mul65, %mul66
  %mul68 = fmul float %exp2, %add7137
  %add69 = fadd float %add67, %mul68
  %mul70 = fmul float %yp1.03235, %sub30
  %add71 = fadd float %add69, %mul70
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv37, i64 %indvars.iv.next29
  store float %add71, float* %arrayidx75, align 4
  %cmp63 = icmp sgt i64 %indvars.iv.next293434, 1
  br i1 %cmp63, label %for.inc84.for.inc84_crit_edge.1, label %for.inc86

for.inc86:                                        ; preds = %for.inc84.for.inc84_crit_edge
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 4096
  br i1 %exitcond36, label %for.cond92.preheader.preheader, label %for.cond62.preheader

for.cond92.preheader.preheader:                   ; preds = %for.inc86
  br label %for.cond92.preheader

for.cond92.preheader:                             ; preds = %for.cond92.preheader.preheader, %for.inc112
  %indvars.iv28 = phi i64 [ %indvars.iv.next26, %for.inc112 ], [ 0, %for.cond92.preheader.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 0
  %5 = add i64 %indvars.iv28, 1
  %scevgep52 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %5, i64 0
  %scevgep54 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 0
  %scevgep56 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %5, i64 0
  %scevgep58 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 0
  %scevgep60 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %5, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep56
  %bound1 = icmp ult float* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult float* %scevgep, %scevgep60
  %bound163 = icmp ult float* %scevgep58, %scevgep52
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  br i1 %conflict.rdx, label %for.inc109.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond92.preheader
  br label %vector.body

for.inc109.preheader:                             ; preds = %for.cond92.preheader
  br label %for.inc109

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %6 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 %index
  %7 = bitcast float* %6 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %7, align 4, !alias.scope !4
  %8 = getelementptr float, float* %6, i64 4
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %9, align 4, !alias.scope !4
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  %wide.load67 = load <4 x float>, <4 x float>* %11, align 4, !alias.scope !7
  %12 = getelementptr float, float* %10, i64 4
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load68 = load <4 x float>, <4 x float>* %13, align 4, !alias.scope !7
  %14 = fadd <4 x float> %wide.load, %wide.load67
  %15 = fadd <4 x float> %wide.load66, %wide.load68
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 %index
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> %14, <4 x float>* %17, align 4, !alias.scope !9, !noalias !11
  %18 = getelementptr float, float* %16, i64 4
  %19 = bitcast float* %18 to <4 x float>*
  store <4 x float> %15, <4 x float>* %19, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %20 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 %index.next
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %21, align 4, !alias.scope !4
  %22 = getelementptr float, float* %20, i64 4
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load66.1 = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !4
  %24 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 %index.next
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load67.1 = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !7
  %26 = getelementptr float, float* %24, i64 4
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load68.1 = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !7
  %28 = fadd <4 x float> %wide.load.1, %wide.load67.1
  %29 = fadd <4 x float> %wide.load66.1, %wide.load68.1
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 %index.next
  %31 = bitcast float* %30 to <4 x float>*
  store <4 x float> %28, <4 x float>* %31, align 4, !alias.scope !9, !noalias !11
  %32 = getelementptr float, float* %30, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %29, <4 x float>* %33, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %34 = icmp eq i64 %index.next.1, 2160
  br i1 %34, label %for.inc112.loopexit111, label %vector.body, !llvm.loop !12

for.inc109:                                       ; preds = %for.inc109, %for.inc109.preheader
  %indvars.iv25 = phi i64 [ 0, %for.inc109.preheader ], [ %indvars.iv.next23.2, %for.inc109 ]
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 %indvars.iv25
  %35 = load float, float* %arrayidx98, align 4
  %arrayidx102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 %indvars.iv25
  %36 = load float, float* %arrayidx102, align 4
  %add103 = fadd float %35, %36
  %arrayidx108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 %indvars.iv25
  store float %add103, float* %arrayidx108, align 4
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv25, 1
  %arrayidx98.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 %indvars.iv.next23
  %37 = load float, float* %arrayidx98.1, align 4
  %arrayidx102.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 %indvars.iv.next23
  %38 = load float, float* %arrayidx102.1, align 4
  %add103.1 = fadd float %37, %38
  %arrayidx108.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 %indvars.iv.next23
  store float %add103.1, float* %arrayidx108.1, align 4
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv25, 2
  %arrayidx98.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv28, i64 %indvars.iv.next23.1
  %39 = load float, float* %arrayidx98.2, align 4
  %arrayidx102.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv28, i64 %indvars.iv.next23.1
  %40 = load float, float* %arrayidx102.2, align 4
  %add103.2 = fadd float %39, %40
  %arrayidx108.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28, i64 %indvars.iv.next23.1
  store float %add103.2, float* %arrayidx108.2, align 4
  %indvars.iv.next23.2 = add nsw i64 %indvars.iv25, 3
  %exitcond24.2 = icmp eq i64 %indvars.iv.next23.2, 2160
  br i1 %exitcond24.2, label %for.inc112.loopexit, label %for.inc109, !llvm.loop !13

for.inc112.loopexit:                              ; preds = %for.inc109
  br label %for.inc112

for.inc112.loopexit111:                           ; preds = %vector.body
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit111, %for.inc112.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 4096
  br i1 %exitcond27, label %for.cond118.preheader.preheader, label %for.cond92.preheader

for.cond118.preheader.preheader:                  ; preds = %for.inc112
  %mul12615 = fmul float %mul16, 0.000000e+00
  %mul12817 = fmul float %exp2, 0.000000e+00
  %mul13019 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader

for.cond118.preheader:                            ; preds = %for.cond118.preheader.preheader, %for.inc147
  %indvars.iv22 = phi i64 [ %indvars.iv.next20, %for.inc147 ], [ 0, %for.cond118.preheader.preheader ]
  %arrayidx12413 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv22
  %41 = load float, float* %arrayidx12413, align 4
  %mul12514 = fmul float %div, %41
  %add12716 = fadd float %mul12615, %mul12514
  %add12918 = fadd float %mul12817, %add12716
  %add13120 = fadd float %mul13019, %add12918
  %arrayidx13521 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv22
  store float %add13120, float* %arrayidx13521, align 4
  br label %for.inc144.for.inc144_crit_edge

for.inc144.for.inc144_crit_edge:                  ; preds = %for.inc144.for.inc144_crit_edge.1, %for.cond118.preheader
  %indvars.iv.next1425 = phi i64 [ 1, %for.cond118.preheader ], [ %indvars.iv.next14.1, %for.inc144.for.inc144_crit_edge.1 ]
  %add13124 = phi float [ %add13120, %for.cond118.preheader ], [ %add131.1, %for.inc144.for.inc144_crit_edge.1 ]
  %arrayidx12423 = phi float* [ %arrayidx12413, %for.cond118.preheader ], [ %arrayidx124.1, %for.inc144.for.inc144_crit_edge.1 ]
  %ym1.11722 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131, %for.inc144.for.inc144_crit_edge.1 ]
  %42 = load float, float* %arrayidx12423, align 4
  %arrayidx124 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next1425, i64 %indvars.iv22
  %43 = load float, float* %arrayidx124, align 4
  %mul125 = fmul float %div, %43
  %mul126 = fmul float %mul16, %42
  %add127 = fadd float %mul126, %mul125
  %mul128 = fmul float %exp2, %add13124
  %add129 = fadd float %mul128, %add127
  %mul130 = fmul float %ym1.11722, %sub30
  %add131 = fadd float %mul130, %add129
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next1425, i64 %indvars.iv22
  store float %add131, float* %arrayidx135, align 4
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv.next1425, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 4096
  br i1 %exitcond15, label %for.inc147, label %for.inc144.for.inc144_crit_edge.1

for.inc147:                                       ; preds = %for.inc144.for.inc144_crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2160
  br i1 %exitcond21, label %for.cond154.preheader.preheader, label %for.cond118.preheader

for.cond154.preheader.preheader:                  ; preds = %for.inc147
  %mul1571 = fmul float %mul21, 0.000000e+00
  %mul1582 = fmul float %1, -0.000000e+00
  %add1593 = fadd float %mul1571, %mul1582
  %mul1604 = fmul float %exp2, 0.000000e+00
  %add1615 = fadd float %add1593, %mul1604
  %mul1626 = fmul float %call29, -0.000000e+00
  %add1637 = fadd float %add1615, %mul1626
  br label %for.cond154.preheader

for.cond154.preheader:                            ; preds = %for.cond154.preheader.preheader, %for.inc179
  %indvars.iv13 = phi i64 [ %indvars.iv.next11, %for.inc179 ], [ 0, %for.cond154.preheader.preheader ]
  %arrayidx1678 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv13
  store float %add1637, float* %arrayidx1678, align 4
  br label %for.inc176.for.inc176_crit_edge

for.inc176.for.inc176_crit_edge:                  ; preds = %for.inc176.for.inc176_crit_edge.1, %for.cond154.preheader
  %add16312 = phi float [ %add1637, %for.cond154.preheader ], [ %add163.1, %for.inc176.for.inc176_crit_edge.1 ]
  %tp1.0611 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %81, %for.inc176.for.inc176_crit_edge.1 ]
  %yp1.1810 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %add163, %for.inc176.for.inc176_crit_edge.1 ]
  %indvars.iv.next5109 = phi i64 [ 4095, %for.cond154.preheader ], [ %indvars.iv.next5.1, %for.inc176.for.inc176_crit_edge.1 ]
  %indvars.iv.next5 = add nsw i64 %indvars.iv.next5109, -1
  %arrayidx171 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next5109, i64 %indvars.iv13
  %44 = load float, float* %arrayidx171, align 4
  %mul157 = fmul float %mul21, %44
  %mul158 = fmul float %tp1.0611, %mul25
  %add159 = fadd float %mul157, %mul158
  %mul160 = fmul float %exp2, %add16312
  %add161 = fadd float %add159, %mul160
  %mul162 = fmul float %yp1.1810, %sub30
  %add163 = fadd float %add161, %mul162
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next5, i64 %indvars.iv13
  store float %add163, float* %arrayidx167, align 4
  %cmp155 = icmp sgt i64 %indvars.iv.next5109, 1
  br i1 %cmp155, label %for.inc176.for.inc176_crit_edge.1, label %for.inc179

for.inc179:                                       ; preds = %for.inc176.for.inc176_crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2160
  br i1 %exitcond12, label %for.cond185.preheader.preheader, label %for.cond154.preheader

for.cond185.preheader.preheader:                  ; preds = %for.inc179
  br label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.cond185.preheader.preheader, %for.inc205
  %indvars.iv4 = phi i64 [ %indvars.iv.next2, %for.inc205 ], [ 0, %for.cond185.preheader.preheader ]
  %scevgep74 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 0
  %45 = add i64 %indvars.iv4, 1
  %scevgep76 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %45, i64 0
  %scevgep78 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 0
  %scevgep80 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %45, i64 0
  %scevgep82 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 0
  %scevgep84 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %45, i64 0
  %bound086 = icmp ult float* %scevgep74, %scevgep80
  %bound187 = icmp ult float* %scevgep78, %scevgep76
  %found.conflict88 = and i1 %bound086, %bound187
  %bound089 = icmp ult float* %scevgep74, %scevgep84
  %bound190 = icmp ult float* %scevgep82, %scevgep76
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx92 = or i1 %found.conflict88, %found.conflict91
  br i1 %conflict.rdx92, label %for.inc202.preheader, label %vector.body69.preheader

vector.body69.preheader:                          ; preds = %for.cond185.preheader
  br label %vector.body69

for.inc202.preheader:                             ; preds = %for.cond185.preheader
  br label %for.inc202

vector.body69:                                    ; preds = %vector.body69, %vector.body69.preheader
  %index96 = phi i64 [ 0, %vector.body69.preheader ], [ %index.next97.1, %vector.body69 ]
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 %index96
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load104 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !14
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load105 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !14
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 %index96
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load106 = load <4 x float>, <4 x float>* %51, align 4, !alias.scope !17
  %52 = getelementptr float, float* %50, i64 4
  %53 = bitcast float* %52 to <4 x float>*
  %wide.load107 = load <4 x float>, <4 x float>* %53, align 4, !alias.scope !17
  %54 = fadd <4 x float> %wide.load104, %wide.load106
  %55 = fadd <4 x float> %wide.load105, %wide.load107
  %56 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %index96
  %57 = bitcast float* %56 to <4 x float>*
  store <4 x float> %54, <4 x float>* %57, align 4, !alias.scope !19, !noalias !21
  %58 = getelementptr float, float* %56, i64 4
  %59 = bitcast float* %58 to <4 x float>*
  store <4 x float> %55, <4 x float>* %59, align 4, !alias.scope !19, !noalias !21
  %index.next97 = or i64 %index96, 8
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 %index.next97
  %61 = bitcast float* %60 to <4 x float>*
  %wide.load104.1 = load <4 x float>, <4 x float>* %61, align 4, !alias.scope !14
  %62 = getelementptr float, float* %60, i64 4
  %63 = bitcast float* %62 to <4 x float>*
  %wide.load105.1 = load <4 x float>, <4 x float>* %63, align 4, !alias.scope !14
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 %index.next97
  %65 = bitcast float* %64 to <4 x float>*
  %wide.load106.1 = load <4 x float>, <4 x float>* %65, align 4, !alias.scope !17
  %66 = getelementptr float, float* %64, i64 4
  %67 = bitcast float* %66 to <4 x float>*
  %wide.load107.1 = load <4 x float>, <4 x float>* %67, align 4, !alias.scope !17
  %68 = fadd <4 x float> %wide.load104.1, %wide.load106.1
  %69 = fadd <4 x float> %wide.load105.1, %wide.load107.1
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %index.next97
  %71 = bitcast float* %70 to <4 x float>*
  store <4 x float> %68, <4 x float>* %71, align 4, !alias.scope !19, !noalias !21
  %72 = getelementptr float, float* %70, i64 4
  %73 = bitcast float* %72 to <4 x float>*
  store <4 x float> %69, <4 x float>* %73, align 4, !alias.scope !19, !noalias !21
  %index.next97.1 = add nsw i64 %index96, 16
  %74 = icmp eq i64 %index.next97.1, 2160
  br i1 %74, label %for.inc205.loopexit110, label %vector.body69, !llvm.loop !22

for.inc202:                                       ; preds = %for.inc202, %for.inc202.preheader
  %indvars.iv1 = phi i64 [ 0, %for.inc202.preheader ], [ %indvars.iv.next.2, %for.inc202 ]
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 %indvars.iv1
  %75 = load float, float* %arrayidx191, align 4
  %arrayidx195 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 %indvars.iv1
  %76 = load float, float* %arrayidx195, align 4
  %add196 = fadd float %75, %76
  %arrayidx201 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %indvars.iv1
  store float %add196, float* %arrayidx201, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %arrayidx191.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 %indvars.iv.next
  %77 = load float, float* %arrayidx191.1, align 4
  %arrayidx195.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 %indvars.iv.next
  %78 = load float, float* %arrayidx195.1, align 4
  %add196.1 = fadd float %77, %78
  %arrayidx201.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %indvars.iv.next
  store float %add196.1, float* %arrayidx201.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv1, 2
  %arrayidx191.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %79 = load float, float* %arrayidx191.2, align 4
  %arrayidx195.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %80 = load float, float* %arrayidx195.2, align 4
  %add196.2 = fadd float %79, %80
  %arrayidx201.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %indvars.iv.next.1
  store float %add196.2, float* %arrayidx201.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv1, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %for.inc205.loopexit, label %for.inc202, !llvm.loop !23

for.inc205.loopexit:                              ; preds = %for.inc202
  br label %for.inc205

for.inc205.loopexit110:                           ; preds = %vector.body69
  br label %for.inc205

for.inc205:                                       ; preds = %for.inc205.loopexit110, %for.inc205.loopexit
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 4096
  br i1 %exitcond3, label %for.end207, label %for.cond185.preheader

for.end207:                                       ; preds = %for.inc205
  ret void

for.inc176.for.inc176_crit_edge.1:                ; preds = %for.inc176.for.inc176_crit_edge
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv.next5109, -2
  %arrayidx171.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next5, i64 %indvars.iv13
  %81 = load float, float* %arrayidx171.1, align 4
  %mul157.1 = fmul float %mul21, %81
  %mul158.1 = fmul float %44, %mul25
  %add159.1 = fadd float %mul157.1, %mul158.1
  %mul160.1 = fmul float %exp2, %add163
  %add161.1 = fadd float %add159.1, %mul160.1
  %mul162.1 = fmul float %add16312, %sub30
  %add163.1 = fadd float %add161.1, %mul162.1
  %arrayidx167.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next5.1, i64 %indvars.iv13
  store float %add163.1, float* %arrayidx167.1, align 4
  br label %for.inc176.for.inc176_crit_edge

for.inc144.for.inc144_crit_edge.1:                ; preds = %for.inc144.for.inc144_crit_edge
  %82 = load float, float* %arrayidx124, align 4
  %arrayidx124.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next14, i64 %indvars.iv22
  %83 = load float, float* %arrayidx124.1, align 4
  %mul125.1 = fmul float %div, %83
  %mul126.1 = fmul float %mul16, %82
  %add127.1 = fadd float %mul126.1, %mul125.1
  %mul128.1 = fmul float %exp2, %add131
  %add129.1 = fadd float %mul128.1, %add127.1
  %mul130.1 = fmul float %add13124, %sub30
  %add131.1 = fadd float %mul130.1, %add129.1
  %arrayidx135.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next14, i64 %indvars.iv22
  store float %add131.1, float* %arrayidx135.1, align 4
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv.next1425, 2
  br label %for.inc144.for.inc144_crit_edge

for.inc84.for.inc84_crit_edge.1:                  ; preds = %for.inc84.for.inc84_crit_edge
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv.next293434, -2
  %arrayidx79.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv37, i64 %indvars.iv.next29
  %84 = load float, float* %arrayidx79.1, align 4
  %mul65.1 = fmul float %mul21, %84
  %mul66.1 = fmul float %4, %mul25
  %add67.1 = fadd float %mul65.1, %mul66.1
  %mul68.1 = fmul float %exp2, %add71
  %add69.1 = fadd float %add67.1, %mul68.1
  %mul70.1 = fmul float %add7137, %sub30
  %add71.1 = fadd float %add69.1, %mul70.1
  %arrayidx75.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv37, i64 %indvars.iv.next29.1
  store float %add71.1, float* %arrayidx75.1, align 4
  br label %for.inc84.for.inc84_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv6, 2160
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv2, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv6, i64 %indvars.iv2
  %8 = load float, float* %arrayidx8, align 4
  %conv = fpext float %8 to double
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 4096
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = !{!20}
!20 = distinct !{!20, !16}
!21 = !{!15, !18}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}

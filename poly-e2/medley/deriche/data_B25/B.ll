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
  call fastcc void @print_array([2160 x float]* %arraydecay4)
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
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc7 ]
  %0 = mul nsw i64 %indvars.iv10, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.inc7, label %vector.body, !llvm.loop !1

for.inc7:                                         ; preds = %vector.body
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, 4096
  br i1 %cmp, label %for.cond1.preheader, label %for.end9

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
  %call18 = tail call float @expf(float %sub) #5
  %mul19 = fmul float %call18, %div
  %0 = insertelement <2 x float> undef, float %alpha, i32 0
  %sub15.v.i0.2 = shufflevector <2 x float> %0, <2 x float> undef, <2 x i32> zeroinitializer
  %sub15 = fadd <2 x float> %sub15.v.i0.2, <float -1.000000e+00, float 1.000000e+00>
  %mul16.v.i1.1 = insertelement <2 x float> undef, float %mul14, i32 0
  %mul16.v.i1.2 = insertelement <2 x float> %mul16.v.i1.1, float %mul19, i32 1
  %mul16 = fmul <2 x float> %sub15, %mul16.v.i1.2
  %mul16.v.r1 = extractelement <2 x float> %mul16, i32 0
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %1 = fmul float %div, %call24
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul3740 = fmul float %mul16.v.r1, 0.000000e+00
  %mul3942 = fmul float %exp2, 0.000000e+00
  %mul4144 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.inc55, %entry
  %indvars.iv168 = phi i64 [ 0, %entry ], [ %indvars.iv.next169, %for.inc55 ]
  %arrayidx3538 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv168, i64 0
  %2 = load float, float* %arrayidx3538, align 4
  %mul3639 = fmul float %div, %2
  %add3841 = fadd float %mul3740, %mul3639
  %add4043 = fadd float %mul3942, %add3841
  %add4245 = fadd float %mul4144, %add4043
  %arrayidx4646 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv168, i64 0
  store float %add4245, float* %arrayidx4646, align 4
  br label %for.body33.for.body33_crit_edge

for.body33.for.body33_crit_edge:                  ; preds = %for.body33.for.body33_crit_edge.1, %for.cond31.preheader
  %add4250 = phi float [ %add4245, %for.cond31.preheader ], [ %add42.1, %for.body33.for.body33_crit_edge.1 ]
  %arrayidx3549 = phi float* [ %arrayidx3538, %for.cond31.preheader ], [ %arrayidx35.1, %for.body33.for.body33_crit_edge.1 ]
  %ym1.014148 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add42, %for.body33.for.body33_crit_edge.1 ]
  %indvars.iv16547 = phi i64 [ 0, %for.cond31.preheader ], [ %indvars.iv.next166.1, %for.body33.for.body33_crit_edge.1 ]
  %indvars.iv.next166 = or i64 %indvars.iv16547, 1
  %3 = load float, float* %arrayidx3549, align 4
  %arrayidx35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv168, i64 %indvars.iv.next166
  %4 = load float, float* %arrayidx35, align 4
  %mul36 = fmul float %div, %4
  %mul37 = fmul float %mul16.v.r1, %3
  %add38 = fadd float %mul37, %mul36
  %mul39 = fmul float %exp2, %add4250
  %add40 = fadd float %mul39, %add38
  %mul41 = fmul float %ym1.014148, %sub30
  %add42 = fadd float %mul41, %add40
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv168, i64 %indvars.iv.next166
  store float %add42, float* %arrayidx46, align 4
  %exitcond167 = icmp eq i64 %indvars.iv.next166, 2159
  br i1 %exitcond167, label %for.inc55, label %for.body33.for.body33_crit_edge.1

for.inc55:                                        ; preds = %for.body33.for.body33_crit_edge
  %indvars.iv.next169 = add nuw i64 %indvars.iv168, 1
  %cmp = icmp slt i64 %indvars.iv.next169, 4096
  br i1 %cmp, label %for.cond31.preheader, label %for.cond62.preheader.preheader

for.cond62.preheader.preheader:                   ; preds = %for.inc55
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul25 = fsub float -0.000000e+00, %1
  %mul6526 = fmul float %mul16.v.r2, 0.000000e+00
  %mul6627 = fmul float %1, -0.000000e+00
  %add6728 = fadd float %mul6627, %mul6526
  %add6930 = fadd float %mul3942, %add6728
  %add7132 = fadd float %mul4144, %add6930
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.inc86, %for.cond62.preheader.preheader
  %indvars.iv163 = phi i64 [ 0, %for.cond62.preheader.preheader ], [ %indvars.iv.next164, %for.inc86 ]
  %arrayidx7533 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv163, i64 2159
  store float %add7132, float* %arrayidx7533, align 4
  br label %for.body64.for.body64_crit_edge

for.body64.for.body64_crit_edge:                  ; preds = %for.body64.for.body64_crit_edge.1, %for.cond62.preheader
  %add7137 = phi float [ %add7132, %for.cond62.preheader ], [ %add71.1, %for.body64.for.body64_crit_edge.1 ]
  %yp1.013536 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %add71, %for.body64.for.body64_crit_edge.1 ]
  %xp1.013735 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %85, %for.body64.for.body64_crit_edge.1 ]
  %indvars.iv16134 = phi i64 [ 2159, %for.cond62.preheader ], [ %indvars.iv.next162.1, %for.body64.for.body64_crit_edge.1 ]
  %indvars.iv.next162 = add nsw i64 %indvars.iv16134, -1
  %arrayidx79 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv163, i64 %indvars.iv16134
  %5 = load float, float* %arrayidx79, align 4
  %mul65 = fmul float %mul16.v.r2, %5
  %mul66 = fmul float %xp1.013735, %mul25
  %add67 = fadd float %mul66, %mul65
  %mul68 = fmul float %exp2, %add7137
  %add69 = fadd float %mul68, %add67
  %mul70 = fmul float %yp1.013536, %sub30
  %add71 = fadd float %mul70, %add69
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv163, i64 %indvars.iv.next162
  store float %add71, float* %arrayidx75, align 4
  %cmp63 = icmp sgt i64 %indvars.iv16134, 1
  br i1 %cmp63, label %for.body64.for.body64_crit_edge.1, label %for.inc86

for.inc86:                                        ; preds = %for.body64.for.body64_crit_edge
  %indvars.iv.next164 = add nuw i64 %indvars.iv163, 1
  %cmp59 = icmp slt i64 %indvars.iv.next164, 4096
  br i1 %cmp59, label %for.cond62.preheader, label %for.cond92.preheader.preheader

for.cond92.preheader.preheader:                   ; preds = %for.inc86
  br label %for.cond92.preheader

for.cond92.preheader:                             ; preds = %for.cond92.preheader.preheader, %for.inc112
  %indvars.iv159 = phi i64 [ %indvars.iv.next160, %for.inc112 ], [ 0, %for.cond92.preheader.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 0
  %6 = add i64 %indvars.iv159, 1
  %scevgep52 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %6, i64 0
  %scevgep54 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 0
  %scevgep56 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %6, i64 0
  %scevgep58 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 0
  %scevgep60 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %6, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep56
  %bound1 = icmp ult float* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult float* %scevgep, %scevgep60
  %bound163 = icmp ult float* %scevgep58, %scevgep52
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  br i1 %conflict.rdx, label %for.body94.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond92.preheader
  br label %vector.body

for.body94.preheader:                             ; preds = %for.cond92.preheader
  br label %for.body94

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %8, align 4, !alias.scope !4
  %9 = getelementptr float, float* %7, i64 4
  %10 = bitcast float* %9 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %10, align 4, !alias.scope !4
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  %wide.load67 = load <4 x float>, <4 x float>* %12, align 4, !alias.scope !7
  %13 = getelementptr float, float* %11, i64 4
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load68 = load <4 x float>, <4 x float>* %14, align 4, !alias.scope !7
  %15 = fadd <4 x float> %wide.load, %wide.load67
  %16 = fadd <4 x float> %wide.load66, %wide.load68
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 %index
  %18 = bitcast float* %17 to <4 x float>*
  store <4 x float> %15, <4 x float>* %18, align 4, !alias.scope !9, !noalias !11
  %19 = getelementptr float, float* %17, i64 4
  %20 = bitcast float* %19 to <4 x float>*
  store <4 x float> %16, <4 x float>* %20, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 %index.next
  %22 = bitcast float* %21 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %22, align 4, !alias.scope !4
  %23 = getelementptr float, float* %21, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load66.1 = load <4 x float>, <4 x float>* %24, align 4, !alias.scope !4
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 %index.next
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load67.1 = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !7
  %27 = getelementptr float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load68.1 = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !7
  %29 = fadd <4 x float> %wide.load.1, %wide.load67.1
  %30 = fadd <4 x float> %wide.load66.1, %wide.load68.1
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 %index.next
  %32 = bitcast float* %31 to <4 x float>*
  store <4 x float> %29, <4 x float>* %32, align 4, !alias.scope !9, !noalias !11
  %33 = getelementptr float, float* %31, i64 4
  %34 = bitcast float* %33 to <4 x float>*
  store <4 x float> %30, <4 x float>* %34, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %35 = icmp eq i64 %index.next.1, 2160
  br i1 %35, label %for.inc112.loopexit109, label %vector.body, !llvm.loop !12

for.body94:                                       ; preds = %for.body94, %for.body94.preheader
  %indvars.iv156 = phi i64 [ 0, %for.body94.preheader ], [ %indvars.iv.next157.2, %for.body94 ]
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 %indvars.iv156
  %36 = load float, float* %arrayidx98, align 4
  %arrayidx102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 %indvars.iv156
  %37 = load float, float* %arrayidx102, align 4
  %add103 = fadd float %36, %37
  %arrayidx108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 %indvars.iv156
  store float %add103, float* %arrayidx108, align 4
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  %arrayidx98.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 %indvars.iv.next157
  %38 = load float, float* %arrayidx98.1, align 4
  %arrayidx102.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 %indvars.iv.next157
  %39 = load float, float* %arrayidx102.1, align 4
  %add103.1 = fadd float %38, %39
  %arrayidx108.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 %indvars.iv.next157
  store float %add103.1, float* %arrayidx108.1, align 4
  %indvars.iv.next157.1 = add nsw i64 %indvars.iv156, 2
  %arrayidx98.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv159, i64 %indvars.iv.next157.1
  %40 = load float, float* %arrayidx98.2, align 4
  %arrayidx102.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv159, i64 %indvars.iv.next157.1
  %41 = load float, float* %arrayidx102.2, align 4
  %add103.2 = fadd float %40, %41
  %arrayidx108.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv159, i64 %indvars.iv.next157.1
  store float %add103.2, float* %arrayidx108.2, align 4
  %exitcond158.2 = icmp eq i64 %indvars.iv.next157.1, 2159
  %indvars.iv.next157.2 = add nsw i64 %indvars.iv156, 3
  br i1 %exitcond158.2, label %for.inc112.loopexit, label %for.body94, !llvm.loop !13

for.inc112.loopexit:                              ; preds = %for.body94
  br label %for.inc112

for.inc112.loopexit109:                           ; preds = %vector.body
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit109, %for.inc112.loopexit
  %indvars.iv.next160 = add nuw i64 %indvars.iv159, 1
  %cmp90 = icmp slt i64 %indvars.iv.next160, 4096
  br i1 %cmp90, label %for.cond92.preheader, label %for.cond118.preheader.preheader

for.cond118.preheader.preheader:                  ; preds = %for.inc112
  br label %for.cond118.preheader

for.cond118.preheader:                            ; preds = %for.cond118.preheader.preheader, %for.inc147
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %for.inc147 ], [ 0, %for.cond118.preheader.preheader ]
  %arrayidx12413 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv154
  %42 = load float, float* %arrayidx12413, align 4
  %mul12514 = fmul float %div, %42
  %add12716 = fadd float %mul3740, %mul12514
  %add12918 = fadd float %mul3942, %add12716
  %add13120 = fadd float %mul4144, %add12918
  %arrayidx13521 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv154
  store float %add13120, float* %arrayidx13521, align 4
  br label %for.body120.for.body120_crit_edge

for.body120.for.body120_crit_edge:                ; preds = %for.body120.for.body120_crit_edge.1, %for.cond118.preheader
  %add13125 = phi float [ %add13120, %for.cond118.preheader ], [ %add131.1, %for.body120.for.body120_crit_edge.1 ]
  %arrayidx12424 = phi float* [ %arrayidx12413, %for.cond118.preheader ], [ %arrayidx124.1, %for.body120.for.body120_crit_edge.1 ]
  %ym1.112823 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131, %for.body120.for.body120_crit_edge.1 ]
  %indvars.iv15122 = phi i64 [ 0, %for.cond118.preheader ], [ %indvars.iv.next152.1, %for.body120.for.body120_crit_edge.1 ]
  %indvars.iv.next152 = or i64 %indvars.iv15122, 1
  %43 = load float, float* %arrayidx12424, align 4
  %arrayidx124 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next152, i64 %indvars.iv154
  %44 = load float, float* %arrayidx124, align 4
  %mul125 = fmul float %div, %44
  %mul126 = fmul float %mul16.v.r1, %43
  %add127 = fadd float %mul126, %mul125
  %mul128 = fmul float %exp2, %add13125
  %add129 = fadd float %mul128, %add127
  %mul130 = fmul float %ym1.112823, %sub30
  %add131 = fadd float %mul130, %add129
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next152, i64 %indvars.iv154
  store float %add131, float* %arrayidx135, align 4
  %exitcond153 = icmp eq i64 %indvars.iv.next152, 4095
  br i1 %exitcond153, label %for.inc147, label %for.body120.for.body120_crit_edge.1

for.inc147:                                       ; preds = %for.body120.for.body120_crit_edge
  %indvars.iv.next155 = add nuw i64 %indvars.iv154, 1
  %cmp116 = icmp slt i64 %indvars.iv.next155, 2160
  br i1 %cmp116, label %for.cond118.preheader, label %for.cond154.preheader.preheader

for.cond154.preheader.preheader:                  ; preds = %for.inc147
  br label %for.cond154.preheader

for.cond154.preheader:                            ; preds = %for.cond154.preheader.preheader, %for.inc179
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc179 ], [ 0, %for.cond154.preheader.preheader ]
  %arrayidx1678 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv149
  store float %add7132, float* %arrayidx1678, align 4
  br label %for.body156.for.body156_crit_edge

for.body156.for.body156_crit_edge:                ; preds = %for.body156.for.body156_crit_edge.1, %for.cond154.preheader
  %add16312 = phi float [ %add7132, %for.cond154.preheader ], [ %add163.1, %for.body156.for.body156_crit_edge.1 ]
  %yp1.112211 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %add163, %for.body156.for.body156_crit_edge.1 ]
  %tp1.012410 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %82, %for.body156.for.body156_crit_edge.1 ]
  %indvars.iv1479 = phi i64 [ 4095, %for.cond154.preheader ], [ %indvars.iv.next148.1, %for.body156.for.body156_crit_edge.1 ]
  %indvars.iv.next148 = add nsw i64 %indvars.iv1479, -1
  %arrayidx171 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1479, i64 %indvars.iv149
  %45 = load float, float* %arrayidx171, align 4
  %mul157 = fmul float %mul16.v.r2, %45
  %mul158 = fmul float %tp1.012410, %mul25
  %add159 = fadd float %mul158, %mul157
  %mul160 = fmul float %exp2, %add16312
  %add161 = fadd float %mul160, %add159
  %mul162 = fmul float %yp1.112211, %sub30
  %add163 = fadd float %mul162, %add161
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next148, i64 %indvars.iv149
  store float %add163, float* %arrayidx167, align 4
  %cmp155 = icmp sgt i64 %indvars.iv1479, 1
  br i1 %cmp155, label %for.body156.for.body156_crit_edge.1, label %for.inc179

for.inc179:                                       ; preds = %for.body156.for.body156_crit_edge
  %indvars.iv.next150 = add nuw i64 %indvars.iv149, 1
  %cmp151 = icmp slt i64 %indvars.iv.next150, 2160
  br i1 %cmp151, label %for.cond154.preheader, label %for.cond185.preheader.preheader

for.cond185.preheader.preheader:                  ; preds = %for.inc179
  br label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.cond185.preheader.preheader, %for.inc205
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %for.inc205 ], [ 0, %for.cond185.preheader.preheader ]
  %scevgep74 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 0
  %46 = add i64 %indvars.iv145, 1
  %scevgep76 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %46, i64 0
  %scevgep78 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 0
  %scevgep80 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %46, i64 0
  %scevgep82 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 0
  %scevgep84 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %46, i64 0
  %bound086 = icmp ult float* %scevgep74, %scevgep80
  %bound187 = icmp ult float* %scevgep78, %scevgep76
  %found.conflict88 = and i1 %bound086, %bound187
  %bound089 = icmp ult float* %scevgep74, %scevgep84
  %bound190 = icmp ult float* %scevgep82, %scevgep76
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx92 = or i1 %found.conflict88, %found.conflict91
  br i1 %conflict.rdx92, label %for.body187.preheader, label %vector.body69.preheader

vector.body69.preheader:                          ; preds = %for.cond185.preheader
  br label %vector.body69

for.body187.preheader:                            ; preds = %for.cond185.preheader
  br label %for.body187

vector.body69:                                    ; preds = %vector.body69, %vector.body69.preheader
  %index96 = phi i64 [ 0, %vector.body69.preheader ], [ %index.next97.1, %vector.body69 ]
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index96
  %48 = bitcast float* %47 to <4 x float>*
  %wide.load104 = load <4 x float>, <4 x float>* %48, align 4, !alias.scope !14
  %49 = getelementptr float, float* %47, i64 4
  %50 = bitcast float* %49 to <4 x float>*
  %wide.load105 = load <4 x float>, <4 x float>* %50, align 4, !alias.scope !14
  %51 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index96
  %52 = bitcast float* %51 to <4 x float>*
  %wide.load106 = load <4 x float>, <4 x float>* %52, align 4, !alias.scope !17
  %53 = getelementptr float, float* %51, i64 4
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load107 = load <4 x float>, <4 x float>* %54, align 4, !alias.scope !17
  %55 = fadd <4 x float> %wide.load104, %wide.load106
  %56 = fadd <4 x float> %wide.load105, %wide.load107
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index96
  %58 = bitcast float* %57 to <4 x float>*
  store <4 x float> %55, <4 x float>* %58, align 4, !alias.scope !19, !noalias !21
  %59 = getelementptr float, float* %57, i64 4
  %60 = bitcast float* %59 to <4 x float>*
  store <4 x float> %56, <4 x float>* %60, align 4, !alias.scope !19, !noalias !21
  %index.next97 = or i64 %index96, 8
  %61 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index.next97
  %62 = bitcast float* %61 to <4 x float>*
  %wide.load104.1 = load <4 x float>, <4 x float>* %62, align 4, !alias.scope !14
  %63 = getelementptr float, float* %61, i64 4
  %64 = bitcast float* %63 to <4 x float>*
  %wide.load105.1 = load <4 x float>, <4 x float>* %64, align 4, !alias.scope !14
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index.next97
  %66 = bitcast float* %65 to <4 x float>*
  %wide.load106.1 = load <4 x float>, <4 x float>* %66, align 4, !alias.scope !17
  %67 = getelementptr float, float* %65, i64 4
  %68 = bitcast float* %67 to <4 x float>*
  %wide.load107.1 = load <4 x float>, <4 x float>* %68, align 4, !alias.scope !17
  %69 = fadd <4 x float> %wide.load104.1, %wide.load106.1
  %70 = fadd <4 x float> %wide.load105.1, %wide.load107.1
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index.next97
  %72 = bitcast float* %71 to <4 x float>*
  store <4 x float> %69, <4 x float>* %72, align 4, !alias.scope !19, !noalias !21
  %73 = getelementptr float, float* %71, i64 4
  %74 = bitcast float* %73 to <4 x float>*
  store <4 x float> %70, <4 x float>* %74, align 4, !alias.scope !19, !noalias !21
  %index.next97.1 = add nsw i64 %index96, 16
  %75 = icmp eq i64 %index.next97.1, 2160
  br i1 %75, label %for.inc205.loopexit108, label %vector.body69, !llvm.loop !22

for.body187:                                      ; preds = %for.body187, %for.body187.preheader
  %indvars.iv = phi i64 [ 0, %for.body187.preheader ], [ %indvars.iv.next.2, %for.body187 ]
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv
  %76 = load float, float* %arrayidx191, align 4
  %arrayidx195 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv
  %77 = load float, float* %arrayidx195, align 4
  %add196 = fadd float %76, %77
  %arrayidx201 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv
  store float %add196, float* %arrayidx201, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.next
  %78 = load float, float* %arrayidx191.1, align 4
  %arrayidx195.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.next
  %79 = load float, float* %arrayidx195.1, align 4
  %add196.1 = fadd float %78, %79
  %arrayidx201.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.next
  store float %add196.1, float* %arrayidx201.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx191.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.next.1
  %80 = load float, float* %arrayidx191.2, align 4
  %arrayidx195.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.next.1
  %81 = load float, float* %arrayidx195.2, align 4
  %add196.2 = fadd float %80, %81
  %arrayidx201.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.next.1
  store float %add196.2, float* %arrayidx201.2, align 4
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2159
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %for.inc205.loopexit, label %for.body187, !llvm.loop !23

for.inc205.loopexit:                              ; preds = %for.body187
  br label %for.inc205

for.inc205.loopexit108:                           ; preds = %vector.body69
  br label %for.inc205

for.inc205:                                       ; preds = %for.inc205.loopexit108, %for.inc205.loopexit
  %indvars.iv.next146 = add nuw i64 %indvars.iv145, 1
  %cmp183 = icmp slt i64 %indvars.iv.next146, 4096
  br i1 %cmp183, label %for.cond185.preheader, label %for.end207

for.end207:                                       ; preds = %for.inc205
  ret void

for.body156.for.body156_crit_edge.1:              ; preds = %for.body156.for.body156_crit_edge
  %indvars.iv.next148.1 = add nsw i64 %indvars.iv1479, -2
  %arrayidx171.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next148, i64 %indvars.iv149
  %82 = load float, float* %arrayidx171.1, align 4
  %mul157.1 = fmul float %mul16.v.r2, %82
  %mul158.1 = fmul float %45, %mul25
  %add159.1 = fadd float %mul158.1, %mul157.1
  %mul160.1 = fmul float %exp2, %add163
  %add161.1 = fadd float %mul160.1, %add159.1
  %mul162.1 = fmul float %add16312, %sub30
  %add163.1 = fadd float %mul162.1, %add161.1
  %arrayidx167.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next148.1, i64 %indvars.iv149
  store float %add163.1, float* %arrayidx167.1, align 4
  br label %for.body156.for.body156_crit_edge

for.body120.for.body120_crit_edge.1:              ; preds = %for.body120.for.body120_crit_edge
  %indvars.iv.next152.1 = add nsw i64 %indvars.iv15122, 2
  %83 = load float, float* %arrayidx124, align 4
  %arrayidx124.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next152.1, i64 %indvars.iv154
  %84 = load float, float* %arrayidx124.1, align 4
  %mul125.1 = fmul float %div, %84
  %mul126.1 = fmul float %mul16.v.r1, %83
  %add127.1 = fadd float %mul126.1, %mul125.1
  %mul128.1 = fmul float %exp2, %add131
  %add129.1 = fadd float %mul128.1, %add127.1
  %mul130.1 = fmul float %add13125, %sub30
  %add131.1 = fadd float %mul130.1, %add129.1
  %arrayidx135.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next152.1, i64 %indvars.iv154
  store float %add131.1, float* %arrayidx135.1, align 4
  br label %for.body120.for.body120_crit_edge

for.body64.for.body64_crit_edge.1:                ; preds = %for.body64.for.body64_crit_edge
  %indvars.iv.next162.1 = add nsw i64 %indvars.iv16134, -2
  %arrayidx79.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv163, i64 %indvars.iv.next162
  %85 = load float, float* %arrayidx79.1, align 4
  %mul65.1 = fmul float %mul16.v.r2, %85
  %mul66.1 = fmul float %5, %mul25
  %add67.1 = fadd float %mul66.1, %mul65.1
  %mul68.1 = fmul float %exp2, %add71
  %add69.1 = fadd float %mul68.1, %add67.1
  %mul70.1 = fmul float %add7137, %sub30
  %add71.1 = fadd float %mul70.1, %add69.1
  %arrayidx75.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv163, i64 %indvars.iv.next162.1
  store float %add71.1, float* %arrayidx75.1, align 4
  br label %for.body64.for.body64_crit_edge

for.body33.for.body33_crit_edge.1:                ; preds = %for.body33.for.body33_crit_edge
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv16547, 2
  %86 = load float, float* %arrayidx35, align 4
  %arrayidx35.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv168, i64 %indvars.iv.next166.1
  %87 = load float, float* %arrayidx35.1, align 4
  %mul36.1 = fmul float %div, %87
  %mul37.1 = fmul float %mul16.v.r1, %86
  %add38.1 = fadd float %mul37.1, %mul36.1
  %mul39.1 = fmul float %exp2, %add42
  %add40.1 = fadd float %mul39.1, %add38.1
  %mul41.1 = fmul float %add4250, %sub30
  %add42.1 = fadd float %mul41.1, %add40.1
  %arrayidx46.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv168, i64 %indvars.iv.next166.1
  store float %add42.1, float* %arrayidx46.1, align 4
  br label %for.body33.for.body33_crit_edge
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
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv10, 2160
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load float, float* %arrayidx8, align 4
  %conv = fpext float %8 to double
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3 = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, 4096
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

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

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
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay)
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond1.for.inc7_crit_edge.us ]
  %0 = mul nuw nsw i64 %indvars.iv13, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.us
  %index = phi i64 [ 0, %for.cond1.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader.us ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nuw nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv13, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.cond1.for.inc7_crit_edge.us, label %vector.body, !llvm.loop !1

for.cond1.for.inc7_crit_edge.us:                  ; preds = %vector.body
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 4096
  br i1 %exitcond16, label %for.end9, label %for.cond1.preheader.us

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) unnamed_addr #0 {
for.cond31.preheader.us.preheader:
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
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %1 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %1
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul36.us.1.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.1.v.i0.2 = insertelement <2 x float> %mul36.us.1.v.i0.1, float %div, i32 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv197 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next198, %for.cond31.for.inc55_crit_edge.us ]
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.cond31.preheader.us
  %indvars.iv194 = phi i64 [ 0, %for.cond31.preheader.us ], [ %indvars.iv.next195.1, %for.body33.us ]
  %xm1.0155.us = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %5, %for.body33.us ]
  %ym1.0154.us = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us.1, %for.body33.us ]
  %ym2.0153.us = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us, %for.body33.us ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv197, i64 %indvars.iv194
  %2 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %2
  %mul37.us = fmul float %mul16.v.r1, %xm1.0155.us
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %ym1.0154.us
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym2.0153.us, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv197, i64 %indvars.iv194
  store float %add42.us, float* %arrayidx46.us, align 4
  %3 = bitcast float* %arrayidx35.us to <2 x float>*
  %indvars.iv.next195 = or i64 %indvars.iv194, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv197, i64 %indvars.iv.next195
  %4 = load <2 x float>, <2 x float>* %3, align 4
  %mul37.us.1 = fmul <2 x float> %mul36.us.1.v.i0.2, %4
  %mul37.us.1.v.r1 = extractelement <2 x float> %mul37.us.1, i32 0
  %mul37.us.1.v.r2 = extractelement <2 x float> %mul37.us.1, i32 1
  %add38.us.1 = fadd float %mul37.us.1.v.r1, %mul37.us.1.v.r2
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %ym1.0154.us, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv197, i64 %indvars.iv.next195
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %5 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next195.1 = add nsw i64 %indvars.iv194, 2
  %exitcond196.1 = icmp eq i64 %indvars.iv.next195.1, 2160
  br i1 %exitcond196.1, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv197, 1
  %exitcond199 = icmp eq i64 %indvars.iv.next198, 4096
  br i1 %exitcond199, label %for.cond62.preheader.us.preheader, label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv190 = phi i64 [ %indvars.iv.next191, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.body64.us, %for.cond62.preheader.us
  %indvars.iv188 = phi i64 [ 2160, %for.cond62.preheader.us ], [ %indvars.iv.next189.1, %for.body64.us ]
  %xp1.0148.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %7, %for.body64.us ]
  %xp2.0147.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %6, %for.body64.us ]
  %yp1.0146.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us.1, %for.body64.us ]
  %yp2.0145.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us ]
  %indvars.iv.next189 = add nsw i64 %indvars.iv188, -1
  %mul65.us = fmul float %mul16.v.r2, %xp1.0148.us
  %mul66.us = fmul float %xp2.0147.us, %mul25
  %add67.us = fadd float %mul66.us, %mul65.us
  %mul68.us = fmul float %exp2, %yp1.0146.us
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %yp2.0145.us, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv190, i64 %indvars.iv.next189
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv190, i64 %indvars.iv.next189
  %6 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next189.1 = add nsw i64 %indvars.iv188, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %6
  %mul66.us.1 = fmul float %xp1.0148.us, %mul25
  %add67.us.1 = fadd float %mul66.us.1, %mul65.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %mul68.us.1, %add67.us.1
  %mul70.us.1 = fmul float %yp1.0146.us, %sub30
  %add71.us.1 = fadd float %mul70.us.1, %add69.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv190, i64 %indvars.iv.next189.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv190, i64 %indvars.iv.next189.1
  %7 = load float, float* %arrayidx79.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next189, 1
  br i1 %cmp63.us.1, label %for.body64.us, label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us
  %indvars.iv.next191 = add nuw nsw i64 %indvars.iv190, 1
  %exitcond192 = icmp eq i64 %indvars.iv.next191, 4096
  br i1 %exitcond192, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.cond92.preheader.us
  %indvars.iv181 = phi i64 [ 0, %for.cond92.preheader.us ], [ %indvars.iv.next182.2, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv181
  %8 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv181
  %9 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %8, %9
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv181
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv.next182
  %10 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv.next182
  %11 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %10, %11
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv.next182
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv181, 2
  %arrayidx98.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv.next182.1
  %12 = load float, float* %arrayidx98.us.2, align 4
  %arrayidx102.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv.next182.1
  %13 = load float, float* %arrayidx102.us.2, align 4
  %add103.us.2 = fadd float %12, %13
  %arrayidx108.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv.next182.1
  store float %add103.us.2, float* %arrayidx108.us.2, align 4
  %indvars.iv.next182.2 = add nsw i64 %indvars.iv181, 3
  %exitcond183.2 = icmp eq i64 %indvars.iv.next182.2, 2160
  br i1 %exitcond183.2, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.body94.us
  %indvars.iv.next185 = add nuw nsw i64 %indvars.iv184, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next185, 4096
  br i1 %exitcond186, label %for.cond118.preheader.us.preheader, label %for.cond92.preheader.us

for.cond118.preheader.us.preheader:               ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.cond118.for.inc147_crit_edge.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us, %for.cond118.preheader.us
  %indvars.iv174 = phi i64 [ 0, %for.cond118.preheader.us ], [ %indvars.iv.next175.1, %for.body120.us ]
  %tm1.0135.us = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %17, %for.body120.us ]
  %ym1.1134.us = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us.1, %for.body120.us ]
  %ym2.1133.us = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us, %for.body120.us ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 %indvars.iv177
  %14 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %14
  %mul126.us = fmul float %mul16.v.r1, %tm1.0135.us
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %ym1.1134.us
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym2.1133.us, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 %indvars.iv177
  store float %add131.us, float* %arrayidx135.us, align 4
  %15 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next175 = or i64 %indvars.iv174, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next175, i64 %indvars.iv177
  %16 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %16
  %mul126.us.1 = fmul float %mul16.v.r1, %15
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %ym1.1134.us, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next175, i64 %indvars.iv177
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %17 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next175.1 = add nsw i64 %indvars.iv174, 2
  %exitcond176.1 = icmp eq i64 %indvars.iv.next175.1, 4096
  br i1 %exitcond176.1, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond179 = icmp eq i64 %indvars.iv.next178, 2160
  br i1 %exitcond179, label %for.cond154.preheader.us.preheader, label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.body156.us, %for.cond154.preheader.us
  %indvars.iv168 = phi i64 [ 4096, %for.cond154.preheader.us ], [ %indvars.iv.next169.1, %for.body156.us ]
  %tp1.0128.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %19, %for.body156.us ]
  %tp2.0127.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %18, %for.body156.us ]
  %yp1.1126.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us.1, %for.body156.us ]
  %yp2.1125.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us ]
  %indvars.iv.next169 = add nsw i64 %indvars.iv168, -1
  %mul157.us = fmul float %mul16.v.r2, %tp1.0128.us
  %mul158.us = fmul float %tp2.0127.us, %mul25
  %add159.us = fadd float %mul158.us, %mul157.us
  %mul160.us = fmul float %exp2, %yp1.1126.us
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %yp2.1125.us, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next169, i64 %indvars.iv170
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next169, i64 %indvars.iv170
  %18 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %18
  %mul158.us.1 = fmul float %tp1.0128.us, %mul25
  %add159.us.1 = fadd float %mul158.us.1, %mul157.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %mul160.us.1, %add159.us.1
  %mul162.us.1 = fmul float %yp1.1126.us, %sub30
  %add163.us.1 = fadd float %mul162.us.1, %add161.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next169.1, i64 %indvars.iv170
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next169.1, i64 %indvars.iv170
  %19 = load float, float* %arrayidx171.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next169, 1
  br i1 %cmp155.us.1, label %for.body156.us, label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us
  %indvars.iv.next171 = add nuw nsw i64 %indvars.iv170, 1
  %exitcond172 = icmp eq i64 %indvars.iv.next171, 2160
  br i1 %exitcond172, label %for.cond185.preheader.us.preheader, label %for.cond154.preheader.us

for.cond185.preheader.us.preheader:               ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.preheader.us.preheader, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %for.cond185.for.inc205_crit_edge.us ], [ 0, %for.cond185.preheader.us.preheader ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.cond185.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond185.preheader.us ], [ %indvars.iv.next.2, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv
  %20 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv
  %21 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %20, %21
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.next
  %22 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.next
  %23 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %22, %23
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx191.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.next.1
  %24 = load float, float* %arrayidx191.us.2, align 4
  %arrayidx195.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.next.1
  %25 = load float, float* %arrayidx195.us.2, align 4
  %add196.us.2 = fadd float %24, %25
  %arrayidx201.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.next.1
  store float %add196.us.2, float* %arrayidx201.us.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.body187.us
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond = icmp eq i64 %indvars.iv.next166, 4096
  br i1 %exitcond, label %for.end207, label %for.cond185.preheader.us

for.end207:                                       ; preds = %for.cond185.for.inc205_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %w, i32 %h, [2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 2160
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 4096
  br i1 %exitcond16, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}

; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %arraydecay = bitcast i8* %call to [2160 x float]*
  %arraydecay4 = bitcast i8* %call1 to [2160 x float]*
  call void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [2160 x float]*
  tail call void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* nocapture %imgIn, [2160 x float]* nocapture readnone %imgOut) #2 {
for.cond1.preheader.us.preheader:
  store float 2.500000e-01, float* %alpha, align 4
  br label %vector.ph

vector.ph:                                        ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv713.us = phi i64 [ %indvars.iv.next8.us, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv713.us, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nuw nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv713.us, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.cond1.for.inc7_crit_edge.us, label %vector.body, !llvm.loop !1

for.cond1.for.inc7_crit_edge.us:                  ; preds = %vector.body
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv713.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next8.us, 4096
  br i1 %exitcond16, label %for.end9, label %vector.ph

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) #0 {
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
  %sub15 = fadd float %alpha, -1.000000e+00
  %mul16 = fmul float %sub15, %mul14
  %call18 = tail call float @expf(float %sub) #5
  %add20 = fadd float %alpha, 1.000000e+00
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %0 = fmul float %div, %call24
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  br label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc55_crit_edge.us
  %indvars.iv126165.us = phi i64 [ %indvars.iv.next127.us, %for.cond31.for.inc55_crit_edge.us ], [ 0, %for.cond31.preheader.us.preheader ]
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.body33.us.preheader
  %1 = phi float [ %7, %for.body33.us ], [ 0.000000e+00, %for.body33.us.preheader ]
  %2 = phi float [ %add42.us.1, %for.body33.us ], [ 0.000000e+00, %for.body33.us.preheader ]
  %3 = phi float [ %add42.us, %for.body33.us ], [ 0.000000e+00, %for.body33.us.preheader ]
  %indvars.iv124163.us = phi i64 [ %indvars.iv.next125.us.1, %for.body33.us ], [ 0, %for.body33.us.preheader ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv126165.us, i64 %indvars.iv124163.us
  %4 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %4
  %mul37.us = fmul float %mul16, %1
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %2
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %3, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126165.us, i64 %indvars.iv124163.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %5 = load float, float* %arrayidx35.us, align 4
  %indvars.iv.next125.us = or i64 %indvars.iv124163.us, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv126165.us, i64 %indvars.iv.next125.us
  %6 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %6
  %mul37.us.1 = fmul float %mul16, %5
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %2, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126165.us, i64 %indvars.iv.next125.us
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %7 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next125.us.1 = add nsw i64 %indvars.iv124163.us, 2
  %exitcond190.1 = icmp eq i64 %indvars.iv.next125.us.1, 2160
  br i1 %exitcond190.1, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us
  %indvars.iv.next127.us = add nuw nsw i64 %indvars.iv126165.us, 1
  %exitcond196 = icmp eq i64 %indvars.iv.next127.us, 4096
  br i1 %exitcond196, label %for.cond62.preheader.us.preheader, label %for.body33.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv122160.us = phi i64 [ %indvars.iv.next123.us, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.body64.us, %for.cond62.preheader.us
  %indvars.iv.next121158.us.in = phi i64 [ 2160, %for.cond62.preheader.us ], [ %indvars.iv.next121158.us, %for.body64.us ]
  %xp1.sroa.0.0157.us = phi i32 [ 0, %for.cond62.preheader.us ], [ %13, %for.body64.us ]
  %8 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %14, %for.body64.us ]
  %xp2.sroa.0.0156.us = phi i32 [ 0, %for.cond62.preheader.us ], [ %xp1.sroa.0.0157.us, %for.body64.us ]
  %9 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us ]
  %10 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %9, %for.body64.us ]
  %indvars.iv.next121158.us = add nsw i64 %indvars.iv.next121158.us.in, -1
  %mul65.us = fmul float %mul21, %8
  %11 = bitcast i32 %xp2.sroa.0.0156.us to float
  %mul66.us = fmul float %11, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %9
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %10, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv122160.us, i64 %indvars.iv.next121158.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv122160.us, i64 %indvars.iv.next121158.us
  %12 = bitcast float* %arrayidx79.us to i32*
  %13 = load i32, i32* %12, align 4
  %14 = bitcast i32 %13 to float
  %cmp63.us = icmp sgt i64 %indvars.iv.next121158.us.in, 1
  br i1 %cmp63.us, label %for.body64.us, label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us
  %indvars.iv.next123.us = add nuw nsw i64 %indvars.iv122160.us, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next123.us, 4096
  br i1 %exitcond188, label %vector.memcheck.preheader, label %for.cond62.preheader.us

vector.memcheck.preheader:                        ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv118152.us = phi i64 [ %indvars.iv.next119.us, %for.cond92.for.inc112_crit_edge.us ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv118152.us, i64 0
  %15 = add i64 %indvars.iv118152.us, 1
  %scevgep205 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %15, i64 0
  %scevgep207 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv118152.us, i64 0
  %scevgep209 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %15, i64 0
  %scevgep211 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv118152.us, i64 0
  %scevgep213 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %15, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep209
  %bound1 = icmp ult float* %scevgep207, %scevgep205
  %found.conflict = and i1 %bound0, %bound1
  %bound0215 = icmp ult float* %scevgep, %scevgep213
  %bound1216 = icmp ult float* %scevgep211, %scevgep205
  %found.conflict217 = and i1 %bound0215, %bound1216
  %conflict.rdx = or i1 %found.conflict, %found.conflict217
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body94.us.preheader:                          ; preds = %vector.memcheck
  br label %for.body94.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv118152.us, i64 %offset.idx
  %17 = bitcast float* %16 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %17, align 4, !alias.scope !4
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv118152.us, i64 %offset.idx
  %19 = bitcast float* %18 to <8 x float>*
  %wide.vec219 = load <8 x float>, <8 x float>* %19, align 4, !alias.scope !7
  %20 = fadd <8 x float> %wide.vec, %wide.vec219
  %21 = shufflevector <8 x float> %20, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %22 = or i64 %offset.idx, 1
  %23 = fadd <8 x float> %wide.vec, %wide.vec219
  %24 = shufflevector <8 x float> %23, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv118152.us, i64 %22
  %26 = getelementptr float, float* %25, i64 -1
  %27 = bitcast float* %26 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %21, <4 x float> %24, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %27, align 4, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %28 = icmp eq i64 %index.next, 1080
  br i1 %28, label %for.cond92.for.inc112_crit_edge.us.loopexit265, label %vector.body, !llvm.loop !12

for.body94.us:                                    ; preds = %for.body94.us.preheader, %for.body94.us
  %indvars.iv116150.us = phi i64 [ %indvars.iv.next117.us.1, %for.body94.us ], [ 0, %for.body94.us.preheader ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv118152.us, i64 %indvars.iv116150.us
  %29 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv118152.us, i64 %indvars.iv116150.us
  %30 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %29, %30
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv118152.us, i64 %indvars.iv116150.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next117.us = or i64 %indvars.iv116150.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv118152.us, i64 %indvars.iv.next117.us
  %31 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv118152.us, i64 %indvars.iv.next117.us
  %32 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %31, %32
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv118152.us, i64 %indvars.iv.next117.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next117.us.1 = add nsw i64 %indvars.iv116150.us, 2
  %exitcond183.1 = icmp eq i64 %indvars.iv.next117.us.1, 2160
  br i1 %exitcond183.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !13

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us.loopexit265:   ; preds = %vector.body
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit265, %for.cond92.for.inc112_crit_edge.us.loopexit
  %indvars.iv.next119.us = add nuw nsw i64 %indvars.iv118152.us, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next119.us, 4096
  br i1 %exitcond186, label %for.body120.us.preheader.preheader, label %vector.memcheck

for.body120.us.preheader.preheader:               ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.body120.us.preheader

for.body120.us.preheader:                         ; preds = %for.body120.us.preheader.preheader, %for.cond118.for.inc147_crit_edge.us
  %indvars.iv114147.us = phi i64 [ %indvars.iv.next115.us, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.body120.us.preheader.preheader ]
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us, %for.body120.us.preheader
  %33 = phi float [ %39, %for.body120.us ], [ 0.000000e+00, %for.body120.us.preheader ]
  %34 = phi float [ %add131.us.1, %for.body120.us ], [ 0.000000e+00, %for.body120.us.preheader ]
  %35 = phi float [ %add131.us, %for.body120.us ], [ 0.000000e+00, %for.body120.us.preheader ]
  %indvars.iv112145.us = phi i64 [ %indvars.iv.next113.us.1, %for.body120.us ], [ 0, %for.body120.us.preheader ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv112145.us, i64 %indvars.iv114147.us
  %36 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %36
  %mul126.us = fmul float %mul16, %33
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %34
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %35, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv112145.us, i64 %indvars.iv114147.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %37 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next113.us = or i64 %indvars.iv112145.us, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next113.us, i64 %indvars.iv114147.us
  %38 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %38
  %mul126.us.1 = fmul float %mul16, %37
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %34, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next113.us, i64 %indvars.iv114147.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %39 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next113.us.1 = add nsw i64 %indvars.iv112145.us, 2
  %exitcond176.1 = icmp eq i64 %indvars.iv.next113.us.1, 4096
  br i1 %exitcond176.1, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us
  %indvars.iv.next115.us = add nuw nsw i64 %indvars.iv114147.us, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next115.us, 2160
  br i1 %exitcond181, label %for.cond154.preheader.us.preheader, label %for.body120.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv110142.us = phi i64 [ %indvars.iv.next111.us, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.body156.us, %for.cond154.preheader.us
  %indvars.iv.next109140.us.in = phi i64 [ 4096, %for.cond154.preheader.us ], [ %indvars.iv.next109140.us, %for.body156.us ]
  %tp1.sroa.0.0139.us = phi i32 [ 0, %for.cond154.preheader.us ], [ %45, %for.body156.us ]
  %40 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %46, %for.body156.us ]
  %tp2.sroa.0.0138.us = phi i32 [ 0, %for.cond154.preheader.us ], [ %tp1.sroa.0.0139.us, %for.body156.us ]
  %41 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us ]
  %42 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %41, %for.body156.us ]
  %indvars.iv.next109140.us = add nsw i64 %indvars.iv.next109140.us.in, -1
  %mul157.us = fmul float %mul21, %40
  %43 = bitcast i32 %tp2.sroa.0.0138.us to float
  %mul158.us = fmul float %43, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %41
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %42, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next109140.us, i64 %indvars.iv110142.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next109140.us, i64 %indvars.iv110142.us
  %44 = bitcast float* %arrayidx171.us to i32*
  %45 = load i32, i32* %44, align 4
  %46 = bitcast i32 %45 to float
  %cmp155.us = icmp sgt i64 %indvars.iv.next109140.us.in, 1
  br i1 %cmp155.us, label %for.body156.us, label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us
  %indvars.iv.next111.us = add nuw nsw i64 %indvars.iv110142.us, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next111.us, 2160
  br i1 %exitcond174, label %vector.memcheck247.preheader, label %for.cond154.preheader.us

vector.memcheck247.preheader:                     ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %vector.memcheck247

vector.memcheck247:                               ; preds = %vector.memcheck247.preheader, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv106134.us = phi i64 [ %indvars.iv.next107.us, %for.cond185.for.inc205_crit_edge.us ], [ 0, %vector.memcheck247.preheader ]
  %scevgep227 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv106134.us, i64 0
  %47 = add i64 %indvars.iv106134.us, 1
  %scevgep229 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %47, i64 0
  %scevgep231 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv106134.us, i64 0
  %scevgep233 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %47, i64 0
  %scevgep235 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv106134.us, i64 0
  %scevgep237 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %47, i64 0
  %bound0239 = icmp ult float* %scevgep227, %scevgep233
  %bound1240 = icmp ult float* %scevgep231, %scevgep229
  %found.conflict241 = and i1 %bound0239, %bound1240
  %bound0242 = icmp ult float* %scevgep227, %scevgep237
  %bound1243 = icmp ult float* %scevgep235, %scevgep229
  %found.conflict244 = and i1 %bound0242, %bound1243
  %conflict.rdx245 = or i1 %found.conflict241, %found.conflict244
  br i1 %conflict.rdx245, label %for.body187.us.preheader, label %vector.body222.preheader

vector.body222.preheader:                         ; preds = %vector.memcheck247
  br label %vector.body222

for.body187.us.preheader:                         ; preds = %vector.memcheck247
  br label %for.body187.us

vector.body222:                                   ; preds = %vector.body222.preheader, %vector.body222
  %index249 = phi i64 [ %index.next250, %vector.body222 ], [ 0, %vector.body222.preheader ]
  %offset.idx253 = shl i64 %index249, 1
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv106134.us, i64 %offset.idx253
  %49 = bitcast float* %48 to <8 x float>*
  %wide.vec257 = load <8 x float>, <8 x float>* %49, align 4, !alias.scope !14
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv106134.us, i64 %offset.idx253
  %51 = bitcast float* %50 to <8 x float>*
  %wide.vec260 = load <8 x float>, <8 x float>* %51, align 4, !alias.scope !17
  %52 = fadd <8 x float> %wide.vec257, %wide.vec260
  %53 = shufflevector <8 x float> %52, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %54 = or i64 %offset.idx253, 1
  %55 = fadd <8 x float> %wide.vec257, %wide.vec260
  %56 = shufflevector <8 x float> %55, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv106134.us, i64 %54
  %58 = getelementptr float, float* %57, i64 -1
  %59 = bitcast float* %58 to <8 x float>*
  %interleaved.vec263 = shufflevector <4 x float> %53, <4 x float> %56, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec263, <8 x float>* %59, align 4, !alias.scope !19, !noalias !21
  %index.next250 = add i64 %index249, 4
  %60 = icmp eq i64 %index.next250, 1080
  br i1 %60, label %for.cond185.for.inc205_crit_edge.us.loopexit264, label %vector.body222, !llvm.loop !22

for.body187.us:                                   ; preds = %for.body187.us.preheader, %for.body187.us
  %indvars.iv132.us = phi i64 [ %indvars.iv.next.us.1, %for.body187.us ], [ 0, %for.body187.us.preheader ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv106134.us, i64 %indvars.iv132.us
  %61 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv106134.us, i64 %indvars.iv132.us
  %62 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %61, %62
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv106134.us, i64 %indvars.iv132.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = or i64 %indvars.iv132.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv106134.us, i64 %indvars.iv.next.us
  %63 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv106134.us, i64 %indvars.iv.next.us
  %64 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %63, %64
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv106134.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv132.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !23

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us.loopexit264:  ; preds = %vector.body222
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit264, %for.cond185.for.inc205_crit_edge.us.loopexit
  %indvars.iv.next107.us = add nuw nsw i64 %indvars.iv106134.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next107.us, 4096
  br i1 %exitcond, label %for.end207, label %vector.memcheck247

for.end207:                                       ; preds = %for.cond185.for.inc205_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %w, i32 %h, [2160 x float]* nocapture readonly %imgOut) #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv713.us = phi i64 [ %indvars.iv.next8.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nsw i64 %indvars.iv713.us, 2160
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv11.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv11.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv713.us, i64 %indvars.iv11.us
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv713.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next8.us, 4096
  br i1 %exitcond16, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

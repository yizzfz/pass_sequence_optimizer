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
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
  %0 = mul nsw i64 %indvars.iv8, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader.us
  %index = phi i64 [ 0, %for.cond1.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader.us ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.cond1.for.inc7_crit_edge.us, label %vector.body, !llvm.loop !1

for.cond1.for.inc7_crit_edge.us:                  ; preds = %vector.body
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, 4096
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) unnamed_addr #0 {
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
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %1 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %1
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul37.us260 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us262 = fmul float %exp2, 0.000000e+00
  %mul41.us264 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %entry
  %indvars.iv196 = phi i64 [ 0, %entry ], [ %indvars.iv.next197, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us258 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv196, i64 0
  %2 = load float, float* %arrayidx35.us258, align 4
  %mul36.us259 = fmul float %div, %2
  %add38.us261 = fadd float %mul37.us260, %mul36.us259
  %add40.us263 = fadd float %mul39.us262, %add38.us261
  %add42.us265 = fadd float %mul41.us264, %add40.us263
  %arrayidx46.us266 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv196, i64 0
  store float %add42.us265, float* %arrayidx46.us266, align 4
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge.1, %for.cond31.preheader.us
  %add42.us271 = phi float [ %add42.us265, %for.cond31.preheader.us ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %arrayidx35.us270 = phi float* [ %arrayidx35.us258, %for.cond31.preheader.us ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %ym1.0154.us269 = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv192268 = phi i64 [ 0, %for.cond31.preheader.us ], [ %indvars.iv.next193.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv.next193 = or i64 %indvars.iv192268, 1
  %3 = load float, float* %arrayidx35.us270, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv196, i64 %indvars.iv.next193
  %4 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %4
  %mul37.us = fmul float %mul16.v.r1, %3
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us271
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.0154.us269, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv196, i64 %indvars.iv.next193
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond195 = icmp eq i64 %indvars.iv.next193, 2159
  br i1 %exitcond195, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.1

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next197 = add nuw i64 %indvars.iv196, 1
  %cmp.us = icmp slt i64 %indvars.iv.next197, 4096
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul65.us245 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us246 = fmul float %1, -0.000000e+00
  %add67.us247 = fadd float %mul66.us246, %mul65.us245
  %mul68.us248 = fmul float %exp2, 0.000000e+00
  %add69.us249 = fadd float %mul68.us248, %add67.us247
  %mul70.us250 = fmul float %call29, -0.000000e+00
  %add71.us251 = fadd float %mul70.us250, %add69.us249
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv189 = phi i64 [ %indvars.iv.next190, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  %arrayidx75.us252 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv189, i64 2159
  store float %add71.us251, float* %arrayidx75.us252, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.1, %for.cond62.preheader.us
  %add71.us257 = phi float [ %add71.us251, %for.cond62.preheader.us ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %indvars.iv.next188256 = phi i64 [ 2159, %for.cond62.preheader.us ], [ %indvars.iv.next188.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %yp1.0146.us255 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge.1 ]
  %xp1.0148.us254 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %85, %for.body64.us.for.body64.us_crit_edge.1 ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv189, i64 %indvars.iv.next188256
  %5 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next188 = add nsw i64 %indvars.iv.next188256, -1
  %mul65.us = fmul float %mul16.v.r2, %5
  %mul66.us = fmul float %xp1.0148.us254, %mul25
  %add67.us = fadd float %mul66.us, %mul65.us
  %mul68.us = fmul float %exp2, %add71.us257
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %yp1.0146.us255, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv189, i64 %indvars.iv.next188
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next188256, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge.1, label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us.for.body64.us_crit_edge
  %indvars.iv.next190 = add nuw i64 %indvars.iv189, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next190, 4096
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 0
  %6 = add i64 %indvars.iv184, 1
  %scevgep273 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %6, i64 0
  %scevgep275 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 0
  %scevgep277 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %6, i64 0
  %scevgep279 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 0
  %scevgep281 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %6, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep277
  %bound1 = icmp ult float* %scevgep275, %scevgep273
  %found.conflict = and i1 %bound0, %bound1
  %bound0283 = icmp ult float* %scevgep, %scevgep281
  %bound1284 = icmp ult float* %scevgep279, %scevgep273
  %found.conflict285 = and i1 %bound0283, %bound1284
  %conflict.rdx = or i1 %found.conflict, %found.conflict285
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond92.preheader.us
  br label %vector.body

for.body94.us.preheader:                          ; preds = %for.cond92.preheader.us
  br label %for.body94.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %8, align 4, !alias.scope !4
  %9 = getelementptr float, float* %7, i64 4
  %10 = bitcast float* %9 to <4 x float>*
  %wide.load287 = load <4 x float>, <4 x float>* %10, align 4, !alias.scope !4
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  %wide.load288 = load <4 x float>, <4 x float>* %12, align 4, !alias.scope !7
  %13 = getelementptr float, float* %11, i64 4
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load289 = load <4 x float>, <4 x float>* %14, align 4, !alias.scope !7
  %15 = fadd <4 x float> %wide.load, %wide.load288
  %16 = fadd <4 x float> %wide.load287, %wide.load289
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %index
  %18 = bitcast float* %17 to <4 x float>*
  store <4 x float> %15, <4 x float>* %18, align 4, !alias.scope !9, !noalias !11
  %19 = getelementptr float, float* %17, i64 4
  %20 = bitcast float* %19 to <4 x float>*
  store <4 x float> %16, <4 x float>* %20, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %index.next
  %22 = bitcast float* %21 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %22, align 4, !alias.scope !4
  %23 = getelementptr float, float* %21, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load287.1 = load <4 x float>, <4 x float>* %24, align 4, !alias.scope !4
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %index.next
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load288.1 = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !7
  %27 = getelementptr float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load289.1 = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !7
  %29 = fadd <4 x float> %wide.load.1, %wide.load288.1
  %30 = fadd <4 x float> %wide.load287.1, %wide.load289.1
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %index.next
  %32 = bitcast float* %31 to <4 x float>*
  store <4 x float> %29, <4 x float>* %32, align 4, !alias.scope !9, !noalias !11
  %33 = getelementptr float, float* %31, i64 4
  %34 = bitcast float* %33 to <4 x float>*
  store <4 x float> %30, <4 x float>* %34, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %35 = icmp eq i64 %index.next.1, 2160
  br i1 %35, label %for.cond92.for.inc112_crit_edge.us.loopexit332, label %vector.body, !llvm.loop !12

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader
  %indvars.iv180 = phi i64 [ 0, %for.body94.us.preheader ], [ %indvars.iv.next181.2, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv180
  %36 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv180
  %37 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %36, %37
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv180
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv.next181
  %38 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv.next181
  %39 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %38, %39
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv.next181
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next181.1 = add nsw i64 %indvars.iv180, 2
  %arrayidx98.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv184, i64 %indvars.iv.next181.1
  %40 = load float, float* %arrayidx98.us.2, align 4
  %arrayidx102.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv184, i64 %indvars.iv.next181.1
  %41 = load float, float* %arrayidx102.us.2, align 4
  %add103.us.2 = fadd float %40, %41
  %arrayidx108.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv184, i64 %indvars.iv.next181.1
  store float %add103.us.2, float* %arrayidx108.us.2, align 4
  %exitcond183.2 = icmp eq i64 %indvars.iv.next181.1, 2159
  %indvars.iv.next181.2 = add nsw i64 %indvars.iv180, 3
  br i1 %exitcond183.2, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !13

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us.loopexit332:   ; preds = %vector.body
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit332, %for.cond92.for.inc112_crit_edge.us.loopexit
  %indvars.iv.next185 = add nuw i64 %indvars.iv184, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next185, 4096
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond118.preheader.us.preheader

for.cond118.preheader.us.preheader:               ; preds = %for.cond92.for.inc112_crit_edge.us
  %mul126.us232 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us234 = fmul float %exp2, 0.000000e+00
  %mul130.us236 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.cond118.for.inc147_crit_edge.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  %arrayidx124.us230 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv177
  %42 = load float, float* %arrayidx124.us230, align 4
  %mul125.us231 = fmul float %div, %42
  %add127.us233 = fadd float %mul126.us232, %mul125.us231
  %add129.us235 = fadd float %mul128.us234, %add127.us233
  %add131.us237 = fadd float %mul130.us236, %add129.us235
  %arrayidx135.us238 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv177
  store float %add131.us237, float* %arrayidx135.us238, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge.1, %for.cond118.preheader.us
  %add131.us243 = phi float [ %add131.us237, %for.cond118.preheader.us ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %arrayidx124.us242 = phi float* [ %arrayidx124.us230, %for.cond118.preheader.us ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %ym1.1134.us241 = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv173240 = phi i64 [ 0, %for.cond118.preheader.us ], [ %indvars.iv.next174.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv.next174 = or i64 %indvars.iv173240, 1
  %43 = load float, float* %arrayidx124.us242, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next174, i64 %indvars.iv177
  %44 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %44
  %mul126.us = fmul float %mul16.v.r1, %43
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us243
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.1134.us241, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next174, i64 %indvars.iv177
  store float %add131.us, float* %arrayidx135.us, align 4
  %exitcond176 = icmp eq i64 %indvars.iv.next174, 4095
  br i1 %exitcond176, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.1

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next178 = add nuw i64 %indvars.iv177, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next178, 2160
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %mul157.us217 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us218 = fmul float %1, -0.000000e+00
  %add159.us219 = fadd float %mul158.us218, %mul157.us217
  %mul160.us220 = fmul float %exp2, 0.000000e+00
  %add161.us221 = fadd float %mul160.us220, %add159.us219
  %mul162.us222 = fmul float %call29, -0.000000e+00
  %add163.us223 = fadd float %mul162.us222, %add161.us221
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv170 = phi i64 [ %indvars.iv.next171, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us224 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv170
  store float %add163.us223, float* %arrayidx167.us224, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.1, %for.cond154.preheader.us
  %add163.us229 = phi float [ %add163.us223, %for.cond154.preheader.us ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %indvars.iv.next169228 = phi i64 [ 4095, %for.cond154.preheader.us ], [ %indvars.iv.next169.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %yp1.1126.us227 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge.1 ]
  %tp1.0128.us226 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %82, %for.body156.us.for.body156.us_crit_edge.1 ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next169228, i64 %indvars.iv170
  %45 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next169 = add nsw i64 %indvars.iv.next169228, -1
  %mul157.us = fmul float %mul16.v.r2, %45
  %mul158.us = fmul float %tp1.0128.us226, %mul25
  %add159.us = fadd float %mul158.us, %mul157.us
  %mul160.us = fmul float %exp2, %add163.us229
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %yp1.1126.us227, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next169, i64 %indvars.iv170
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next169228, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge.1, label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us.for.body156.us_crit_edge
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next171, 2160
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond185.preheader.us.preheader

for.cond185.preheader.us.preheader:               ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.preheader.us.preheader, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %for.cond185.for.inc205_crit_edge.us ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep295 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 0
  %46 = add i64 %indvars.iv165, 1
  %scevgep297 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %46, i64 0
  %scevgep299 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 0
  %scevgep301 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %46, i64 0
  %scevgep303 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 0
  %scevgep305 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %46, i64 0
  %bound0307 = icmp ult float* %scevgep295, %scevgep301
  %bound1308 = icmp ult float* %scevgep299, %scevgep297
  %found.conflict309 = and i1 %bound0307, %bound1308
  %bound0310 = icmp ult float* %scevgep295, %scevgep305
  %bound1311 = icmp ult float* %scevgep303, %scevgep297
  %found.conflict312 = and i1 %bound0310, %bound1311
  %conflict.rdx313 = or i1 %found.conflict309, %found.conflict312
  br i1 %conflict.rdx313, label %for.body187.us.preheader, label %vector.body290.preheader

vector.body290.preheader:                         ; preds = %for.cond185.preheader.us
  br label %vector.body290

for.body187.us.preheader:                         ; preds = %for.cond185.preheader.us
  br label %for.body187.us

vector.body290:                                   ; preds = %vector.body290, %vector.body290.preheader
  %index317 = phi i64 [ 0, %vector.body290.preheader ], [ %index.next318.1, %vector.body290 ]
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %index317
  %48 = bitcast float* %47 to <4 x float>*
  %wide.load325 = load <4 x float>, <4 x float>* %48, align 4, !alias.scope !14
  %49 = getelementptr float, float* %47, i64 4
  %50 = bitcast float* %49 to <4 x float>*
  %wide.load326 = load <4 x float>, <4 x float>* %50, align 4, !alias.scope !14
  %51 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %index317
  %52 = bitcast float* %51 to <4 x float>*
  %wide.load327 = load <4 x float>, <4 x float>* %52, align 4, !alias.scope !17
  %53 = getelementptr float, float* %51, i64 4
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load328 = load <4 x float>, <4 x float>* %54, align 4, !alias.scope !17
  %55 = fadd <4 x float> %wide.load325, %wide.load327
  %56 = fadd <4 x float> %wide.load326, %wide.load328
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %index317
  %58 = bitcast float* %57 to <4 x float>*
  store <4 x float> %55, <4 x float>* %58, align 4, !alias.scope !19, !noalias !21
  %59 = getelementptr float, float* %57, i64 4
  %60 = bitcast float* %59 to <4 x float>*
  store <4 x float> %56, <4 x float>* %60, align 4, !alias.scope !19, !noalias !21
  %index.next318 = or i64 %index317, 8
  %61 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %index.next318
  %62 = bitcast float* %61 to <4 x float>*
  %wide.load325.1 = load <4 x float>, <4 x float>* %62, align 4, !alias.scope !14
  %63 = getelementptr float, float* %61, i64 4
  %64 = bitcast float* %63 to <4 x float>*
  %wide.load326.1 = load <4 x float>, <4 x float>* %64, align 4, !alias.scope !14
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %index.next318
  %66 = bitcast float* %65 to <4 x float>*
  %wide.load327.1 = load <4 x float>, <4 x float>* %66, align 4, !alias.scope !17
  %67 = getelementptr float, float* %65, i64 4
  %68 = bitcast float* %67 to <4 x float>*
  %wide.load328.1 = load <4 x float>, <4 x float>* %68, align 4, !alias.scope !17
  %69 = fadd <4 x float> %wide.load325.1, %wide.load327.1
  %70 = fadd <4 x float> %wide.load326.1, %wide.load328.1
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %index.next318
  %72 = bitcast float* %71 to <4 x float>*
  store <4 x float> %69, <4 x float>* %72, align 4, !alias.scope !19, !noalias !21
  %73 = getelementptr float, float* %71, i64 4
  %74 = bitcast float* %73 to <4 x float>*
  store <4 x float> %70, <4 x float>* %74, align 4, !alias.scope !19, !noalias !21
  %index.next318.1 = add nsw i64 %index317, 16
  %75 = icmp eq i64 %index.next318.1, 2160
  br i1 %75, label %for.cond185.for.inc205_crit_edge.us.loopexit331, label %vector.body290, !llvm.loop !22

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body187.us.preheader ], [ %indvars.iv.next.2, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv
  %76 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv
  %77 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %76, %77
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.next
  %78 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.next
  %79 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %78, %79
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx191.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.next.1
  %80 = load float, float* %arrayidx191.us.2, align 4
  %arrayidx195.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.next.1
  %81 = load float, float* %arrayidx195.us.2, align 4
  %add196.us.2 = fadd float %80, %81
  %arrayidx201.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.next.1
  store float %add196.us.2, float* %arrayidx201.us.2, align 4
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2159
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !23

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us.loopexit331:  ; preds = %vector.body290
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit331, %for.cond185.for.inc205_crit_edge.us.loopexit
  %indvars.iv.next166 = add nuw i64 %indvars.iv165, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next166, 4096
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207

for.end207:                                       ; preds = %for.cond185.for.inc205_crit_edge.us
  ret void

for.body156.us.for.body156.us_crit_edge.1:        ; preds = %for.body156.us.for.body156.us_crit_edge
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next169, i64 %indvars.iv170
  %82 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv.next169228, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %82
  %mul158.us.1 = fmul float %45, %mul25
  %add159.us.1 = fadd float %mul158.us.1, %mul157.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %mul160.us.1, %add159.us.1
  %mul162.us.1 = fmul float %add163.us229, %sub30
  %add163.us.1 = fadd float %mul162.us.1, %add161.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next169.1, i64 %indvars.iv170
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body120.us.for.body120.us_crit_edge.1:        ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next174.1 = add nsw i64 %indvars.iv173240, 2
  %83 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next174.1, i64 %indvars.iv177
  %84 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %84
  %mul126.us.1 = fmul float %mul16.v.r1, %83
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us243, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next174.1, i64 %indvars.iv177
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body64.us.for.body64.us_crit_edge.1:          ; preds = %for.body64.us.for.body64.us_crit_edge
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv189, i64 %indvars.iv.next188
  %85 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv.next188256, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %85
  %mul66.us.1 = fmul float %5, %mul25
  %add67.us.1 = fadd float %mul66.us.1, %mul65.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %mul68.us.1, %add67.us.1
  %mul70.us.1 = fmul float %add71.us257, %sub30
  %add71.us.1 = fadd float %mul70.us.1, %add69.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv189, i64 %indvars.iv.next188.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body33.us.for.body33.us_crit_edge.1:          ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next193.1 = add nsw i64 %indvars.iv192268, 2
  %86 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv196, i64 %indvars.iv.next193.1
  %87 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %87
  %mul37.us.1 = fmul float %mul16.v.r1, %86
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us271, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv196, i64 %indvars.iv.next193.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  br label %for.body33.us.for.body33.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %w, i32 %h, [2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv13, 2160
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw i64 %indvars.iv13, 1
  %cmp.us = icmp slt i64 %indvars.iv.next14, 4096
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

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

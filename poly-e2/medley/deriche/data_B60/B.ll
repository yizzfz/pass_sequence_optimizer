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
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  tail call fastcc void @print_array([2160 x float]* %2)
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
define internal fastcc void @init_array(float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.end_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv34.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next4.us, %for.cond1.for.end_crit_edge.us ]
  %0 = mul nuw nsw i64 %indvars.iv34.us, 313
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
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv34.us, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.cond1.for.end_crit_edge.us, label %vector.body, !llvm.loop !1

for.cond1.for.end_crit_edge.us:                   ; preds = %vector.body
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv34.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next4.us, 4096
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9

for.end9:                                         ; preds = %for.cond1.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) unnamed_addr #0 {
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
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul37.us40 = fmul float %mul16, 0.000000e+00
  %mul39.us42 = fmul float %exp2, 0.000000e+00
  %mul41.us44 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.end_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv2167.us = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next22.us, %for.cond31.for.end_crit_edge.us ]
  %arrayidx35.us38 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 0
  %0 = load float, float* %arrayidx35.us38, align 4
  %mul36.us39 = fmul float %div, %0
  %add38.us41 = fadd float %mul37.us40, %mul36.us39
  %add40.us43 = fadd float %mul39.us42, %add38.us41
  %add42.us45 = fadd float %mul41.us44, %add40.us43
  %arrayidx46.us46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 0
  store float %add42.us45, float* %arrayidx46.us46, align 4
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge.1, %for.cond31.preheader.us
  %add42.us50 = phi float [ %add42.us45, %for.cond31.preheader.us ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %arrayidx35.us49 = phi float* [ %arrayidx35.us38, %for.cond31.preheader.us ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv1962.us48 = phi i64 [ 0, %for.cond31.preheader.us ], [ %indvars.iv.next20.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %ym1.063.us47 = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv.next20.us = or i64 %indvars.iv1962.us48, 1
  %1 = load float, float* %arrayidx35.us49, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  %2 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %2
  %mul37.us = fmul float %mul16, %1
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us50
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.063.us47, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond82 = icmp eq i64 %indvars.iv.next20.us, 2159
  br i1 %exitcond82, label %for.cond31.for.end_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.1

for.cond31.for.end_crit_edge.us:                  ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2167.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next22.us, 4096
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.end_crit_edge.us
  %add20 = fadd float %alpha, 1.000000e+00
  %3 = fmul float %div, %call24
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %3
  %mul65.us26 = fmul float %mul21, 0.000000e+00
  %mul66.us27 = fmul float %3, -0.000000e+00
  %add67.us28 = fadd float %mul65.us26, %mul66.us27
  %mul68.us29 = fmul float %exp2, 0.000000e+00
  %add69.us30 = fadd float %add67.us28, %mul68.us29
  %mul70.us31 = fmul float %call29, -0.000000e+00
  %add71.us32 = fadd float %add69.us30, %mul70.us31
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.end85_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv1759.us = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next18.us, %for.cond62.for.end85_crit_edge.us ]
  %arrayidx75.us33 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 2159
  store float %add71.us32, float* %arrayidx75.us33, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.1, %for.cond62.preheader.us
  %add71.us37 = phi float [ %add71.us32, %for.cond62.preheader.us ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %indvars.iv.next1657.us36 = phi i64 [ 2159, %for.cond62.preheader.us ], [ %indvars.iv.next1657.us.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %xp1.053.us35 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %84, %for.body64.us.for.body64.us_crit_edge.1 ]
  %yp1.055.us34 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge.1 ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us36
  %4 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next1657.us = add nsw i64 %indvars.iv.next1657.us36, -1
  %mul65.us = fmul float %mul21, %4
  %mul66.us = fmul float %xp1.053.us35, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us37
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.055.us34, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next1657.us36, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge.1, label %for.cond62.for.end85_crit_edge.us

for.cond62.for.end85_crit_edge.us:                ; preds = %for.body64.us.for.body64.us_crit_edge
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1759.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next18.us, 4096
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.end85_crit_edge.us
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.end111_crit_edge.us
  %indvars.iv1349.us = phi i64 [ %indvars.iv.next14.us, %for.cond92.for.end111_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 0
  %5 = add i64 %indvars.iv1349.us, 1
  %scevgep52 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %5, i64 0
  %scevgep54 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 0
  %scevgep56 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %5, i64 0
  %scevgep58 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 0
  %scevgep60 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %5, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep56
  %bound1 = icmp ult float* %scevgep54, %scevgep52
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult float* %scevgep, %scevgep60
  %bound163 = icmp ult float* %scevgep58, %scevgep52
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond92.preheader.us
  br label %vector.body

for.body94.us.preheader:                          ; preds = %for.cond92.preheader.us
  br label %for.body94.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %6 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %index
  %7 = bitcast float* %6 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %7, align 4, !alias.scope !4
  %8 = getelementptr float, float* %6, i64 4
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %9, align 4, !alias.scope !4
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  %wide.load67 = load <4 x float>, <4 x float>* %11, align 4, !alias.scope !7
  %12 = getelementptr float, float* %10, i64 4
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load68 = load <4 x float>, <4 x float>* %13, align 4, !alias.scope !7
  %14 = fadd <4 x float> %wide.load, %wide.load67
  %15 = fadd <4 x float> %wide.load66, %wide.load68
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %index
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> %14, <4 x float>* %17, align 4, !alias.scope !9, !noalias !11
  %18 = getelementptr float, float* %16, i64 4
  %19 = bitcast float* %18 to <4 x float>*
  store <4 x float> %15, <4 x float>* %19, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %20 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %index.next
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %21, align 4, !alias.scope !4
  %22 = getelementptr float, float* %20, i64 4
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load66.1 = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !4
  %24 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %index.next
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load67.1 = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !7
  %26 = getelementptr float, float* %24, i64 4
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load68.1 = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !7
  %28 = fadd <4 x float> %wide.load.1, %wide.load67.1
  %29 = fadd <4 x float> %wide.load66.1, %wide.load68.1
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %index.next
  %31 = bitcast float* %30 to <4 x float>*
  store <4 x float> %28, <4 x float>* %31, align 4, !alias.scope !9, !noalias !11
  %32 = getelementptr float, float* %30, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %29, <4 x float>* %33, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %34 = icmp eq i64 %index.next.1, 2160
  br i1 %34, label %for.cond92.for.end111_crit_edge.us.loopexit111, label %vector.body, !llvm.loop !12

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader
  %indvars.iv1147.us = phi i64 [ 0, %for.body94.us.preheader ], [ %indvars.iv.next12.us.2, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %35 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %36 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %35, %36
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1147.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  %37 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  %38 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %37, %38
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next12.us.1 = add nsw i64 %indvars.iv1147.us, 2
  %arrayidx98.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us.1
  %39 = load float, float* %arrayidx98.us.2, align 4
  %arrayidx102.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us.1
  %40 = load float, float* %arrayidx102.us.2, align 4
  %add103.us.2 = fadd float %39, %40
  %arrayidx108.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us.1
  store float %add103.us.2, float* %arrayidx108.us.2, align 4
  %exitcond79.2 = icmp eq i64 %indvars.iv.next12.us.1, 2159
  %indvars.iv.next12.us.2 = add nsw i64 %indvars.iv1147.us, 3
  br i1 %exitcond79.2, label %for.cond92.for.end111_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !13

for.cond92.for.end111_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.end111_crit_edge.us

for.cond92.for.end111_crit_edge.us.loopexit111:   ; preds = %vector.body
  br label %for.cond92.for.end111_crit_edge.us

for.cond92.for.end111_crit_edge.us:               ; preds = %for.cond92.for.end111_crit_edge.us.loopexit111, %for.cond92.for.end111_crit_edge.us.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1349.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next14.us, 4096
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond118.preheader.us.preheader

for.cond118.preheader.us.preheader:               ; preds = %for.cond92.for.end111_crit_edge.us
  %mul126.us15 = fmul float %mul16, 0.000000e+00
  %mul128.us17 = fmul float %exp2, 0.000000e+00
  %mul130.us19 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.cond118.for.end146_crit_edge.us
  %indvars.iv944.us = phi i64 [ %indvars.iv.next10.us, %for.cond118.for.end146_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  %arrayidx124.us13 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv944.us
  %41 = load float, float* %arrayidx124.us13, align 4
  %mul125.us14 = fmul float %div, %41
  %add127.us16 = fadd float %mul126.us15, %mul125.us14
  %add129.us18 = fadd float %mul128.us17, %add127.us16
  %add131.us20 = fadd float %mul130.us19, %add129.us18
  %arrayidx135.us21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv944.us
  store float %add131.us20, float* %arrayidx135.us21, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge.1, %for.cond118.preheader.us
  %add131.us25 = phi float [ %add131.us20, %for.cond118.preheader.us ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %arrayidx124.us24 = phi float* [ %arrayidx124.us13, %for.cond118.preheader.us ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv739.us23 = phi i64 [ 0, %for.cond118.preheader.us ], [ %indvars.iv.next8.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %ym1.140.us22 = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv.next8.us = or i64 %indvars.iv739.us23, 1
  %42 = load float, float* %arrayidx124.us24, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  %43 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %43
  %mul126.us = fmul float %mul16, %42
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us25
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.140.us22, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %exitcond77 = icmp eq i64 %indvars.iv.next8.us, 4095
  br i1 %exitcond77, label %for.cond118.for.end146_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.1

for.cond118.for.end146_crit_edge.us:              ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv944.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next10.us, 2160
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.end146_crit_edge.us
  %mul157.us1 = fmul float %mul21, 0.000000e+00
  %mul158.us2 = fmul float %3, -0.000000e+00
  %add159.us3 = fadd float %mul157.us1, %mul158.us2
  %mul160.us4 = fmul float %exp2, 0.000000e+00
  %add161.us5 = fadd float %add159.us3, %mul160.us4
  %mul162.us6 = fmul float %call29, -0.000000e+00
  %add163.us7 = fadd float %add161.us5, %mul162.us6
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.end178_crit_edge.us
  %indvars.iv536.us = phi i64 [ %indvars.iv.next6.us, %for.cond154.for.end178_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us8 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv536.us
  store float %add163.us7, float* %arrayidx167.us8, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.1, %for.cond154.preheader.us
  %add163.us12 = phi float [ %add163.us7, %for.cond154.preheader.us ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %indvars.iv.next434.us11 = phi i64 [ 4095, %for.cond154.preheader.us ], [ %indvars.iv.next434.us.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %tp1.030.us10 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %81, %for.body156.us.for.body156.us_crit_edge.1 ]
  %yp1.132.us9 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge.1 ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us11, i64 %indvars.iv536.us
  %44 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next434.us = add nsw i64 %indvars.iv.next434.us11, -1
  %mul157.us = fmul float %mul21, %44
  %mul158.us = fmul float %tp1.030.us10, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us12
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.132.us9, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us, i64 %indvars.iv536.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next434.us11, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge.1, label %for.cond154.for.end178_crit_edge.us

for.cond154.for.end178_crit_edge.us:              ; preds = %for.body156.us.for.body156.us_crit_edge
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv536.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next6.us, 2160
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond185.preheader.us.preheader

for.cond185.preheader.us.preheader:               ; preds = %for.cond154.for.end178_crit_edge.us
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.preheader.us.preheader, %for.cond185.for.end204_crit_edge.us
  %indvars.iv126.us = phi i64 [ %indvars.iv.next2.us, %for.cond185.for.end204_crit_edge.us ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep74 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 0
  %45 = add i64 %indvars.iv126.us, 1
  %scevgep76 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %45, i64 0
  %scevgep78 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 0
  %scevgep80 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %45, i64 0
  %scevgep82 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 0
  %scevgep84 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %45, i64 0
  %bound086 = icmp ult float* %scevgep74, %scevgep80
  %bound187 = icmp ult float* %scevgep78, %scevgep76
  %found.conflict88 = and i1 %bound086, %bound187
  %bound089 = icmp ult float* %scevgep74, %scevgep84
  %bound190 = icmp ult float* %scevgep82, %scevgep76
  %found.conflict91 = and i1 %bound089, %bound190
  %conflict.rdx92 = or i1 %found.conflict88, %found.conflict91
  br i1 %conflict.rdx92, label %for.body187.us.preheader, label %vector.body69.preheader

vector.body69.preheader:                          ; preds = %for.cond185.preheader.us
  br label %vector.body69

for.body187.us.preheader:                         ; preds = %for.cond185.preheader.us
  br label %for.body187.us

vector.body69:                                    ; preds = %vector.body69, %vector.body69.preheader
  %index96 = phi i64 [ 0, %vector.body69.preheader ], [ %index.next97.1, %vector.body69 ]
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %index96
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load104 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !14
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load105 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !14
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %index96
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load106 = load <4 x float>, <4 x float>* %51, align 4, !alias.scope !17
  %52 = getelementptr float, float* %50, i64 4
  %53 = bitcast float* %52 to <4 x float>*
  %wide.load107 = load <4 x float>, <4 x float>* %53, align 4, !alias.scope !17
  %54 = fadd <4 x float> %wide.load104, %wide.load106
  %55 = fadd <4 x float> %wide.load105, %wide.load107
  %56 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %index96
  %57 = bitcast float* %56 to <4 x float>*
  store <4 x float> %54, <4 x float>* %57, align 4, !alias.scope !19, !noalias !21
  %58 = getelementptr float, float* %56, i64 4
  %59 = bitcast float* %58 to <4 x float>*
  store <4 x float> %55, <4 x float>* %59, align 4, !alias.scope !19, !noalias !21
  %index.next97 = or i64 %index96, 8
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %index.next97
  %61 = bitcast float* %60 to <4 x float>*
  %wide.load104.1 = load <4 x float>, <4 x float>* %61, align 4, !alias.scope !14
  %62 = getelementptr float, float* %60, i64 4
  %63 = bitcast float* %62 to <4 x float>*
  %wide.load105.1 = load <4 x float>, <4 x float>* %63, align 4, !alias.scope !14
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %index.next97
  %65 = bitcast float* %64 to <4 x float>*
  %wide.load106.1 = load <4 x float>, <4 x float>* %65, align 4, !alias.scope !17
  %66 = getelementptr float, float* %64, i64 4
  %67 = bitcast float* %66 to <4 x float>*
  %wide.load107.1 = load <4 x float>, <4 x float>* %67, align 4, !alias.scope !17
  %68 = fadd <4 x float> %wide.load104.1, %wide.load106.1
  %69 = fadd <4 x float> %wide.load105.1, %wide.load107.1
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %index.next97
  %71 = bitcast float* %70 to <4 x float>*
  store <4 x float> %68, <4 x float>* %71, align 4, !alias.scope !19, !noalias !21
  %72 = getelementptr float, float* %70, i64 4
  %73 = bitcast float* %72 to <4 x float>*
  store <4 x float> %69, <4 x float>* %73, align 4, !alias.scope !19, !noalias !21
  %index.next97.1 = add nsw i64 %index96, 16
  %74 = icmp eq i64 %index.next97.1, 2160
  br i1 %74, label %for.cond185.for.end204_crit_edge.us.loopexit110, label %vector.body69, !llvm.loop !22

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader
  %indvars.iv24.us = phi i64 [ 0, %for.body187.us.preheader ], [ %indvars.iv.next.us.2, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %75 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %76 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %75, %76
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %77 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %78 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %77, %78
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv24.us, 2
  %arrayidx191.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv.next.us.1
  %79 = load float, float* %arrayidx191.us.2, align 4
  %arrayidx195.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv.next.us.1
  %80 = load float, float* %arrayidx195.us.2, align 4
  %add196.us.2 = fadd float %79, %80
  %arrayidx201.us.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv.next.us.1
  store float %add196.us.2, float* %arrayidx201.us.2, align 4
  %exitcond.2 = icmp eq i64 %indvars.iv.next.us.1, 2159
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv24.us, 3
  br i1 %exitcond.2, label %for.cond185.for.end204_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !23

for.cond185.for.end204_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.end204_crit_edge.us

for.cond185.for.end204_crit_edge.us.loopexit110:  ; preds = %vector.body69
  br label %for.cond185.for.end204_crit_edge.us

for.cond185.for.end204_crit_edge.us:              ; preds = %for.cond185.for.end204_crit_edge.us.loopexit110, %for.cond185.for.end204_crit_edge.us.loopexit
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv126.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next2.us, 4096
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207

for.end207:                                       ; preds = %for.cond185.for.end204_crit_edge.us
  ret void

for.body156.us.for.body156.us_crit_edge.1:        ; preds = %for.body156.us.for.body156.us_crit_edge
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us, i64 %indvars.iv536.us
  %81 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next434.us.1 = add nsw i64 %indvars.iv.next434.us11, -2
  %mul157.us.1 = fmul float %mul21, %81
  %mul158.us.1 = fmul float %44, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us12, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us.1, i64 %indvars.iv536.us
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body120.us.for.body120.us_crit_edge.1:        ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next8.us.1 = add nsw i64 %indvars.iv739.us23, 2
  %82 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us.1, i64 %indvars.iv944.us
  %83 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %83
  %mul126.us.1 = fmul float %mul16, %82
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us25, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us.1, i64 %indvars.iv944.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body64.us.for.body64.us_crit_edge.1:          ; preds = %for.body64.us.for.body64.us_crit_edge
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us
  %84 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next1657.us.1 = add nsw i64 %indvars.iv.next1657.us36, -2
  %mul65.us.1 = fmul float %mul21, %84
  %mul66.us.1 = fmul float %4, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us37, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body33.us.for.body33.us_crit_edge.1:          ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next20.us.1 = add nsw i64 %indvars.iv1962.us48, 2
  %85 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us.1
  %86 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %86
  %mul37.us.1 = fmul float %mul16, %85
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us50, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  br label %for.body33.us.for.body33.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv28.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next3.us, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv28.us, 2160
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv6.us, %3
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, 2160
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.end_crit_edge.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next3.us, 4096
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
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

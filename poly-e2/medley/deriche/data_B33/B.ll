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
  %indvars.iv10 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond1.for.end_crit_edge.us ]
  %0 = mul nsw i64 %indvars.iv10, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %for.cond1.preheader.us
  %index = phi i64 [ 0, %for.cond1.preheader.us ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader.us ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
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
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.cond1.for.end_crit_edge.us, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

for.cond1.for.end_crit_edge.us:                   ; preds = %vector.body
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 4096
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
  %mul37.us39 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us41 = fmul float %exp2, 0.000000e+00
  %mul41.us43 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.end_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv170 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next171, %for.cond31.for.end_crit_edge.us ]
  %arrayidx35.us37 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv170, i64 0
  %2 = load float, float* %arrayidx35.us37, align 4
  %mul36.us38 = fmul float %div, %2
  %add38.us40 = fadd float %mul37.us39, %mul36.us38
  %add40.us42 = fadd float %mul39.us41, %add38.us40
  %add42.us44 = fadd float %mul41.us43, %add40.us42
  %arrayidx46.us45 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv170, i64 0
  store float %add42.us44, float* %arrayidx46.us45, align 4
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.cond31.preheader.us
  %add42.us48 = phi float [ %add42.us44, %for.cond31.preheader.us ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us47 = phi float* [ %arrayidx35.us37, %for.cond31.preheader.us ], [ %arrayidx35.us, %for.body33.us.for.body33.us_crit_edge ]
  %3 = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us48, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv16646 = phi i64 [ 0, %for.cond31.preheader.us ], [ %indvars.iv.next167, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv16646, 1
  %4 = load float, float* %arrayidx35.us47, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv170, i64 %indvars.iv.next167
  %5 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %5
  %mul37.us = fmul float %mul16.v.r1, %4
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us48
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %3, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv170, i64 %indvars.iv.next167
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond169 = icmp eq i64 %indvars.iv.next167, 2159
  br i1 %exitcond169, label %for.cond31.for.end_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.end_crit_edge.us:                  ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next171 = add nuw i64 %indvars.iv170, 1
  %cmp.us = icmp slt i64 %indvars.iv.next171, 4096
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond31.for.end_crit_edge.us.for.cond62.preheader.us_crit_edge

for.cond31.for.end_crit_edge.us.for.cond62.preheader.us_crit_edge: ; preds = %for.cond31.for.end_crit_edge.us
  %mul65.us25 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us26 = fmul float %1, -0.000000e+00
  %add67.us27 = fadd float %mul65.us25, %mul66.us26
  %mul68.us28 = fmul float %exp2, 0.000000e+00
  %add69.us29 = fadd float %mul68.us28, %add67.us27
  %mul70.us30 = fmul float %call29, -0.000000e+00
  %add71.us31 = fadd float %mul70.us30, %add69.us29
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.end85_crit_edge.us, %for.cond31.for.end_crit_edge.us.for.cond62.preheader.us_crit_edge
  %indvars.iv164 = phi i64 [ 0, %for.cond31.for.end_crit_edge.us.for.cond62.preheader.us_crit_edge ], [ %indvars.iv.next165, %for.cond62.for.end85_crit_edge.us ]
  %arrayidx75.us32 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 2159
  store float %add71.us31, float* %arrayidx75.us32, align 4
  %arrayidx79.us33 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv164, i64 2159
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge, %for.cond62.preheader.us
  %.in.in = phi float* [ %arrayidx79.us33, %for.cond62.preheader.us ], [ %arrayidx79.us, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %add71.us36 = phi float [ %add71.us31, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %indvars.iv.next16335 = phi i64 [ 2159, %for.cond62.preheader.us ], [ %indvars.iv.next163, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %6 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us36, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %xp1.sroa.0.0128.us34 = phi i32 [ 0, %for.cond62.preheader.us ], [ %7, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %.in = bitcast float* %.in.in to i32*
  %7 = load i32, i32* %.in, align 4
  %8 = bitcast i32 %7 to float
  %indvars.iv.next163 = add nsw i64 %indvars.iv.next16335, -1
  %mul65.us = fmul float %mul16.v.r2, %8
  %9 = bitcast i32 %xp1.sroa.0.0128.us34 to float
  %mul66.us = fmul float %9, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us36
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %6, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv.next163
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next16335, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge, label %for.cond62.for.end85_crit_edge.us

for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge: ; preds = %for.body64.us.for.body64.us_crit_edge
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv164, i64 %indvars.iv.next163
  br label %for.body64.us.for.body64.us_crit_edge

for.cond62.for.end85_crit_edge.us:                ; preds = %for.body64.us.for.body64.us_crit_edge
  %indvars.iv.next165 = add nuw i64 %indvars.iv164, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next165, 4096
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond62.for.end85_crit_edge.us.for.cond92.preheader.us_crit_edge

for.cond62.for.end85_crit_edge.us.for.cond92.preheader.us_crit_edge: ; preds = %for.cond62.for.end85_crit_edge.us
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.end111_crit_edge.us, %for.cond62.for.end85_crit_edge.us.for.cond92.preheader.us_crit_edge
  %indvars.iv160 = phi i64 [ 0, %for.cond62.for.end85_crit_edge.us.for.cond92.preheader.us_crit_edge ], [ %indvars.iv.next161, %for.cond92.for.end111_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv160, i64 0
  %10 = add i64 %indvars.iv160, 1
  %scevgep50 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %10, i64 0
  %scevgep52 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv160, i64 0
  %scevgep54 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %10, i64 0
  %scevgep56 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv160, i64 0
  %scevgep58 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %10, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep54
  %bound1 = icmp ult float* %scevgep52, %scevgep50
  %found.conflict = and i1 %bound0, %bound1
  %bound060 = icmp ult float* %scevgep, %scevgep58
  %bound161 = icmp ult float* %scevgep56, %scevgep50
  %found.conflict62 = and i1 %bound060, %bound161
  %conflict.rdx = or i1 %found.conflict, %found.conflict62
  br i1 %conflict.rdx, label %for.cond92.preheader.us.for.body94.us_crit_edge, label %for.cond92.preheader.us.vector.body_crit_edge

for.cond92.preheader.us.vector.body_crit_edge:    ; preds = %for.cond92.preheader.us
  br label %vector.body

for.cond92.preheader.us.for.body94.us_crit_edge:  ; preds = %for.cond92.preheader.us
  br label %for.body94.us

vector.body:                                      ; preds = %vector.body, %for.cond92.preheader.us.vector.body_crit_edge
  %index = phi i64 [ 0, %for.cond92.preheader.us.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv160, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %12, align 4, !alias.scope !4
  %13 = getelementptr float, float* %11, i64 4
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load64 = load <4 x float>, <4 x float>* %14, align 4, !alias.scope !4
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv160, i64 %index
  %16 = bitcast float* %15 to <4 x float>*
  %wide.load65 = load <4 x float>, <4 x float>* %16, align 4, !alias.scope !7
  %17 = getelementptr float, float* %15, i64 4
  %18 = bitcast float* %17 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %18, align 4, !alias.scope !7
  %19 = fadd <4 x float> %wide.load, %wide.load65
  %20 = fadd <4 x float> %wide.load64, %wide.load66
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv160, i64 %index
  %22 = bitcast float* %21 to <4 x float>*
  store <4 x float> %19, <4 x float>* %22, align 4, !alias.scope !9, !noalias !11
  %23 = getelementptr float, float* %21, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  store <4 x float> %20, <4 x float>* %24, align 4, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 8
  %25 = icmp eq i64 %index.next, 2160
  br i1 %25, label %for.cond92.for.end111_crit_edge.us.loopexit108, label %vector.body, !llvm.loop !12

for.body94.us:                                    ; preds = %for.body94.us.for.body94.us_crit_edge, %for.cond92.preheader.us.for.body94.us_crit_edge
  %indvars.iv156 = phi i64 [ %indvars.iv.next157, %for.body94.us.for.body94.us_crit_edge ], [ 0, %for.cond92.preheader.us.for.body94.us_crit_edge ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv160, i64 %indvars.iv156
  %26 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv160, i64 %indvars.iv156
  %27 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %26, %27
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv160, i64 %indvars.iv156
  store float %add103.us, float* %arrayidx108.us, align 4
  %exitcond159 = icmp eq i64 %indvars.iv156, 2159
  br i1 %exitcond159, label %for.cond92.for.end111_crit_edge.us.loopexit, label %for.body94.us.for.body94.us_crit_edge, !llvm.loop !13

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  %indvars.iv.next157 = add nuw nsw i64 %indvars.iv156, 1
  br label %for.body94.us

for.cond92.for.end111_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.end111_crit_edge.us

for.cond92.for.end111_crit_edge.us.loopexit108:   ; preds = %vector.body
  br label %for.cond92.for.end111_crit_edge.us

for.cond92.for.end111_crit_edge.us:               ; preds = %for.cond92.for.end111_crit_edge.us.loopexit108, %for.cond92.for.end111_crit_edge.us.loopexit
  %indvars.iv.next161 = add nuw i64 %indvars.iv160, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next161, 4096
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond92.for.end111_crit_edge.us.for.cond118.preheader.us_crit_edge

for.cond92.for.end111_crit_edge.us.for.cond118.preheader.us_crit_edge: ; preds = %for.cond92.for.end111_crit_edge.us
  %mul126.us15 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us17 = fmul float %exp2, 0.000000e+00
  %mul130.us19 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.end146_crit_edge.us, %for.cond92.for.end111_crit_edge.us.for.cond118.preheader.us_crit_edge
  %indvars.iv154 = phi i64 [ 0, %for.cond92.for.end111_crit_edge.us.for.cond118.preheader.us_crit_edge ], [ %indvars.iv.next155, %for.cond118.for.end146_crit_edge.us ]
  %arrayidx124.us13 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv154
  %28 = load float, float* %arrayidx124.us13, align 4
  %mul125.us14 = fmul float %div, %28
  %add127.us16 = fadd float %mul126.us15, %mul125.us14
  %add129.us18 = fadd float %mul128.us17, %add127.us16
  %add131.us20 = fadd float %mul130.us19, %add129.us18
  %arrayidx135.us21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv154
  store float %add131.us20, float* %arrayidx135.us21, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.cond118.preheader.us
  %add131.us24 = phi float [ %add131.us20, %for.cond118.preheader.us ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us23 = phi float* [ %arrayidx124.us13, %for.cond118.preheader.us ], [ %arrayidx124.us, %for.body120.us.for.body120.us_crit_edge ]
  %29 = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us24, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv15022 = phi i64 [ 0, %for.cond118.preheader.us ], [ %indvars.iv.next151, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv15022, 1
  %30 = load float, float* %arrayidx124.us23, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next151, i64 %indvars.iv154
  %31 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %31
  %mul126.us = fmul float %mul16.v.r1, %30
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us24
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %29, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next151, i64 %indvars.iv154
  store float %add131.us, float* %arrayidx135.us, align 4
  %exitcond153 = icmp eq i64 %indvars.iv.next151, 4095
  br i1 %exitcond153, label %for.cond118.for.end146_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.end146_crit_edge.us:              ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next155 = add nuw i64 %indvars.iv154, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next155, 2160
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond118.for.end146_crit_edge.us.for.cond154.preheader.us_crit_edge

for.cond118.for.end146_crit_edge.us.for.cond154.preheader.us_crit_edge: ; preds = %for.cond118.for.end146_crit_edge.us
  %mul157.us1 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us2 = fmul float %1, -0.000000e+00
  %add159.us3 = fadd float %mul157.us1, %mul158.us2
  %mul160.us4 = fmul float %exp2, 0.000000e+00
  %add161.us5 = fadd float %mul160.us4, %add159.us3
  %mul162.us6 = fmul float %call29, -0.000000e+00
  %add163.us7 = fadd float %mul162.us6, %add161.us5
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.end178_crit_edge.us, %for.cond118.for.end146_crit_edge.us.for.cond154.preheader.us_crit_edge
  %indvars.iv148 = phi i64 [ 0, %for.cond118.for.end146_crit_edge.us.for.cond154.preheader.us_crit_edge ], [ %indvars.iv.next149, %for.cond154.for.end178_crit_edge.us ]
  %arrayidx167.us8 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv148
  store float %add163.us7, float* %arrayidx167.us8, align 4
  %arrayidx171.us9 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 4095, i64 %indvars.iv148
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge, %for.cond154.preheader.us
  %.in106.in = phi float* [ %arrayidx171.us9, %for.cond154.preheader.us ], [ %arrayidx171.us, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %add163.us12 = phi float [ %add163.us7, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %indvars.iv.next14711 = phi i64 [ 4095, %for.cond154.preheader.us ], [ %indvars.iv.next147, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %32 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us12, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %tp1.sroa.0.0113.us10 = phi i32 [ 0, %for.cond154.preheader.us ], [ %33, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %.in106 = bitcast float* %.in106.in to i32*
  %33 = load i32, i32* %.in106, align 4
  %34 = bitcast i32 %33 to float
  %indvars.iv.next147 = add nsw i64 %indvars.iv.next14711, -1
  %mul157.us = fmul float %mul16.v.r2, %34
  %35 = bitcast i32 %tp1.sroa.0.0113.us10 to float
  %mul158.us = fmul float %35, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us12
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %32, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next147, i64 %indvars.iv148
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next14711, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge, label %for.cond154.for.end178_crit_edge.us

for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge: ; preds = %for.body156.us.for.body156.us_crit_edge
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next147, i64 %indvars.iv148
  br label %for.body156.us.for.body156.us_crit_edge

for.cond154.for.end178_crit_edge.us:              ; preds = %for.body156.us.for.body156.us_crit_edge
  %indvars.iv.next149 = add nuw i64 %indvars.iv148, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next149, 2160
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond154.for.end178_crit_edge.us.for.cond185.preheader.us_crit_edge

for.cond154.for.end178_crit_edge.us.for.cond185.preheader.us_crit_edge: ; preds = %for.cond154.for.end178_crit_edge.us
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.end204_crit_edge.us, %for.cond154.for.end178_crit_edge.us.for.cond185.preheader.us_crit_edge
  %indvars.iv144 = phi i64 [ 0, %for.cond154.for.end178_crit_edge.us.for.cond185.preheader.us_crit_edge ], [ %indvars.iv.next145, %for.cond185.for.end204_crit_edge.us ]
  %scevgep72 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 0
  %36 = add i64 %indvars.iv144, 1
  %scevgep74 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %36, i64 0
  %scevgep76 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 0
  %scevgep78 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %36, i64 0
  %scevgep80 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 0
  %scevgep82 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %36, i64 0
  %bound084 = icmp ult float* %scevgep72, %scevgep78
  %bound185 = icmp ult float* %scevgep76, %scevgep74
  %found.conflict86 = and i1 %bound084, %bound185
  %bound087 = icmp ult float* %scevgep72, %scevgep82
  %bound188 = icmp ult float* %scevgep80, %scevgep74
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx90 = or i1 %found.conflict86, %found.conflict89
  br i1 %conflict.rdx90, label %for.cond185.preheader.us.for.body187.us_crit_edge, label %for.cond185.preheader.us.vector.body67_crit_edge

for.cond185.preheader.us.vector.body67_crit_edge: ; preds = %for.cond185.preheader.us
  br label %vector.body67

for.cond185.preheader.us.for.body187.us_crit_edge: ; preds = %for.cond185.preheader.us
  br label %for.body187.us

vector.body67:                                    ; preds = %vector.body67, %for.cond185.preheader.us.vector.body67_crit_edge
  %index94 = phi i64 [ 0, %for.cond185.preheader.us.vector.body67_crit_edge ], [ %index.next95, %vector.body67 ]
  %37 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %index94
  %38 = bitcast float* %37 to <4 x float>*
  %wide.load102 = load <4 x float>, <4 x float>* %38, align 4, !alias.scope !14
  %39 = getelementptr float, float* %37, i64 4
  %40 = bitcast float* %39 to <4 x float>*
  %wide.load103 = load <4 x float>, <4 x float>* %40, align 4, !alias.scope !14
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %index94
  %42 = bitcast float* %41 to <4 x float>*
  %wide.load104 = load <4 x float>, <4 x float>* %42, align 4, !alias.scope !17
  %43 = getelementptr float, float* %41, i64 4
  %44 = bitcast float* %43 to <4 x float>*
  %wide.load105 = load <4 x float>, <4 x float>* %44, align 4, !alias.scope !17
  %45 = fadd <4 x float> %wide.load102, %wide.load104
  %46 = fadd <4 x float> %wide.load103, %wide.load105
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %index94
  %48 = bitcast float* %47 to <4 x float>*
  store <4 x float> %45, <4 x float>* %48, align 4, !alias.scope !19, !noalias !21
  %49 = getelementptr float, float* %47, i64 4
  %50 = bitcast float* %49 to <4 x float>*
  store <4 x float> %46, <4 x float>* %50, align 4, !alias.scope !19, !noalias !21
  %index.next95 = add i64 %index94, 8
  %51 = icmp eq i64 %index.next95, 2160
  br i1 %51, label %for.cond185.for.end204_crit_edge.us.loopexit107, label %vector.body67, !llvm.loop !22

for.body187.us:                                   ; preds = %for.body187.us.for.body187.us_crit_edge, %for.cond185.preheader.us.for.body187.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body187.us.for.body187.us_crit_edge ], [ 0, %for.cond185.preheader.us.for.body187.us_crit_edge ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %indvars.iv
  %52 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %indvars.iv
  %53 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %52, %53
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %exitcond143 = icmp eq i64 %indvars.iv, 2159
  br i1 %exitcond143, label %for.cond185.for.end204_crit_edge.us.loopexit, label %for.body187.us.for.body187.us_crit_edge, !llvm.loop !23

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body187.us

for.cond185.for.end204_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.end204_crit_edge.us

for.cond185.for.end204_crit_edge.us.loopexit107:  ; preds = %vector.body67
  br label %for.cond185.for.end204_crit_edge.us

for.cond185.for.end204_crit_edge.us:              ; preds = %for.cond185.for.end204_crit_edge.us.loopexit107, %for.cond185.for.end204_crit_edge.us.loopexit
  %indvars.iv.next145 = add nuw i64 %indvars.iv144, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next145, 4096
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207

for.end207:                                       ; preds = %for.cond185.for.end204_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.end_crit_edge.us ]
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
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.end_crit_edge.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next14 = add nuw i64 %indvars.iv13, 1
  %cmp.us = icmp slt i64 %indvars.iv.next14, 4096
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
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

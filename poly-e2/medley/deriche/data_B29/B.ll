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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  %cmp8 = icmp sgt i32 %w, 0
  %cmp26 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %h, -1
  %1 = sext i32 %w to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = add nuw nsw i64 %wide.trip.count, 1
  %min.iters.check = icmp ult i64 %2, 4
  %n.vec = and i64 %2, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond1.for.inc7_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 313
  br i1 %min.iters.check, label %for.inc.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %for.inc.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %4 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %5 = add nuw nsw <4 x i64> %4, %broadcast.splat
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv13, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv13, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next14, %1
  br i1 %exitcond1, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
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
  %cmp137 = icmp sgt i32 %w, 0
  br i1 %cmp137, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32135 = icmp sgt i32 %h, 0
  br i1 %cmp32135, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %2 = add i32 %h, -1
  %3 = sext i32 %w to i64
  %wide.trip.count174 = zext i32 %2 to i64
  %mul37.us239 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us241 = fmul float %exp2, 0.000000e+00
  %mul41.us243 = fmul float %call29, -0.000000e+00
  %exitcond175246 = icmp eq i32 %2, 0
  %mul36.us.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.v.i0.2 = insertelement <2 x float> %mul36.us.v.i0.1, float %div, i32 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv176 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next177, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us237 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 0
  %4 = load float, float* %arrayidx35.us237, align 4
  %mul36.us238 = fmul float %div, %4
  %add38.us240 = fadd float %mul37.us239, %mul36.us238
  %add40.us242 = fadd float %mul39.us241, %add38.us240
  %add42.us244 = fadd float %mul41.us243, %add40.us242
  %arrayidx46.us245 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 0
  store float %add42.us244, float* %arrayidx46.us245, align 4
  br i1 %exitcond175246, label %for.cond31.for.inc55_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge.preheader

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge.preheader, %for.inc.us.for.inc.us_crit_edge
  %add42.us249 = phi float [ %add42.us, %for.inc.us.for.inc.us_crit_edge ], [ %add42.us244, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %arrayidx35.us248 = phi float* [ %arrayidx35.us, %for.inc.us.for.inc.us_crit_edge ], [ %arrayidx35.us237, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %5 = phi float [ %add42.us249, %for.inc.us.for.inc.us_crit_edge ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %indvars.iv172247 = phi i64 [ %indvars.iv.next173, %for.inc.us.for.inc.us_crit_edge ], [ 0, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172247, 1
  %6 = bitcast float* %arrayidx35.us248 to <2 x float>*
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 %indvars.iv.next173
  %7 = load <2 x float>, <2 x float>* %6, align 4
  %mul37.us = fmul <2 x float> %mul36.us.v.i0.2, %7
  %mul37.us.v.r1 = extractelement <2 x float> %mul37.us, i32 0
  %mul37.us.v.r2 = extractelement <2 x float> %mul37.us, i32 1
  %add38.us = fadd float %mul37.us.v.r1, %mul37.us.v.r2
  %mul39.us = fmul float %exp2, %add42.us249
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %5, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 %indvars.iv.next173
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond175 = icmp eq i64 %indvars.iv.next173, %wide.trip.count174
  br i1 %exitcond175, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.inc.us.for.inc.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.cond31.preheader.us
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond255 = icmp eq i64 %indvars.iv.next177, %3
  br i1 %exitcond255, label %for.cond62.preheader.us.preheader, label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %8 = sext i32 %h to i64
  %indvars.iv.next168223 = add nsw i64 %8, -1
  %mul65.us224 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us225 = fmul float %1, -0.000000e+00
  %add67.us226 = fadd float %mul65.us224, %mul66.us225
  %add69.us228 = fadd float %mul39.us241, %add67.us226
  %add71.us230 = fadd float %mul41.us243, %add69.us228
  %cmp63.us233 = icmp sgt i32 %h, 1
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv169 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next170, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us231 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv169, i64 %indvars.iv.next168223
  store float %add71.us230, float* %arrayidx75.us231, align 4
  br i1 %cmp63.us233, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader, %for.inc84.us.for.inc84.us_crit_edge
  %indvars.iv.next168223.pn = phi i64 [ %indvars.iv.next168, %for.inc84.us.for.inc84.us_crit_edge ], [ %indvars.iv.next168223, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %add71.us236 = phi float [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge ], [ %add71.us230, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %9 = phi float [ %add71.us236, %for.inc84.us.for.inc84.us_crit_edge ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %xp1.sroa.0.0131.us234 = phi i32 [ %10, %for.inc84.us.for.inc84.us_crit_edge ], [ 0, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %.in317.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv169, i64 %indvars.iv.next168223.pn
  %.in317 = bitcast float* %.in317.in to i32*
  %10 = load i32, i32* %.in317, align 4
  %11 = bitcast i32 %10 to float
  %indvars.iv.next168 = add nsw i64 %indvars.iv.next168223.pn, -1
  %mul65.us = fmul float %mul16.v.r2, %11
  %12 = bitcast i32 %xp1.sroa.0.0131.us234 to float
  %mul66.us = fmul float %12, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us236
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %9, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv169, i64 %indvars.iv.next168
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next168223.pn, 1
  br i1 %cmp63.us, label %for.inc84.us.for.inc84.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %exitcond254 = icmp eq i64 %indvars.iv.next170, %3
  br i1 %exitcond254, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %13 = add nuw nsw i64 %wide.trip.count174, 1
  %14 = and i64 %13, 8589934584
  %15 = add nsw i64 %14, -8
  %16 = lshr exact i64 %15, 3
  %min.iters.check = icmp ult i64 %13, 8
  %cmp.zero = icmp eq i64 %14, 0
  %17 = and i64 %16, 1
  %lcmp.mod323 = icmp eq i64 %17, 0
  %18 = icmp eq i64 %16, 0
  %cmp.n = icmp eq i64 %13, %14
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv164 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next165, %for.cond92.for.inc112_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 0
  %scevgep257 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %13
  %scevgep259 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 0
  %scevgep261 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %13
  %scevgep263 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 0
  %scevgep265 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %13
  br i1 %min.iters.check, label %for.inc109.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.inc109.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep261
  %bound1 = icmp ult float* %scevgep259, %scevgep257
  %found.conflict = and i1 %bound0, %bound1
  %bound0267 = icmp ult float* %scevgep, %scevgep265
  %bound1268 = icmp ult float* %scevgep263, %scevgep257
  %found.conflict269 = and i1 %bound0267, %bound1268
  %conflict.rdx = or i1 %found.conflict, %found.conflict269
  br i1 %conflict.rdx, label %for.inc109.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod323, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %19 = bitcast float* %scevgep259 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %19, align 4, !alias.scope !6
  %20 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 4
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load271.prol = load <4 x float>, <4 x float>* %21, align 4, !alias.scope !6
  %22 = bitcast float* %scevgep263 to <4 x float>*
  %wide.load272.prol = load <4 x float>, <4 x float>* %22, align 4, !alias.scope !9
  %23 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load273.prol = load <4 x float>, <4 x float>* %24, align 4, !alias.scope !9
  %25 = fadd <4 x float> %wide.load.prol, %wide.load272.prol
  %26 = fadd <4 x float> %wide.load271.prol, %wide.load273.prol
  %27 = bitcast float* %scevgep to <4 x float>*
  store <4 x float> %25, <4 x float>* %27, align 4, !alias.scope !11, !noalias !13
  %28 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 4
  %29 = bitcast float* %28 to <4 x float>*
  store <4 x float> %26, <4 x float>* %29, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %index
  %31 = bitcast float* %30 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %31, align 4, !alias.scope !6
  %32 = getelementptr float, float* %30, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  %wide.load271 = load <4 x float>, <4 x float>* %33, align 4, !alias.scope !6
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %index
  %35 = bitcast float* %34 to <4 x float>*
  %wide.load272 = load <4 x float>, <4 x float>* %35, align 4, !alias.scope !9
  %36 = getelementptr float, float* %34, i64 4
  %37 = bitcast float* %36 to <4 x float>*
  %wide.load273 = load <4 x float>, <4 x float>* %37, align 4, !alias.scope !9
  %38 = fadd <4 x float> %wide.load, %wide.load272
  %39 = fadd <4 x float> %wide.load271, %wide.load273
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %index
  %41 = bitcast float* %40 to <4 x float>*
  store <4 x float> %38, <4 x float>* %41, align 4, !alias.scope !11, !noalias !13
  %42 = getelementptr float, float* %40, i64 4
  %43 = bitcast float* %42 to <4 x float>*
  store <4 x float> %39, <4 x float>* %43, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %index.next
  %45 = bitcast float* %44 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %45, align 4, !alias.scope !6
  %46 = getelementptr float, float* %44, i64 4
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load271.1 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !6
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %index.next
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load272.1 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !9
  %50 = getelementptr float, float* %48, i64 4
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load273.1 = load <4 x float>, <4 x float>* %51, align 4, !alias.scope !9
  %52 = fadd <4 x float> %wide.load.1, %wide.load272.1
  %53 = fadd <4 x float> %wide.load271.1, %wide.load273.1
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %index.next
  %55 = bitcast float* %54 to <4 x float>*
  store <4 x float> %52, <4 x float>* %55, align 4, !alias.scope !11, !noalias !13
  %56 = getelementptr float, float* %54, i64 4
  %57 = bitcast float* %56 to <4 x float>*
  store <4 x float> %53, <4 x float>* %57, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %58 = icmp eq i64 %index.next.1, %14
  br i1 %58, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader

for.inc109.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv160.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %14, %middle.block ]
  %59 = sub nsw i64 %13, %indvars.iv160.ph
  %xtraiter324 = and i64 %59, 1
  %lcmp.mod325 = icmp eq i64 %xtraiter324, 0
  br i1 %lcmp.mod325, label %for.inc109.us.prol.loopexit, label %for.inc109.us.prol

for.inc109.us.prol:                               ; preds = %for.inc109.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv160.ph
  %60 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv160.ph
  %61 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %60, %61
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv160.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next161.prol = or i64 %indvars.iv160.ph, 1
  br label %for.inc109.us.prol.loopexit

for.inc109.us.prol.loopexit:                      ; preds = %for.inc109.us.prol, %for.inc109.us.preheader
  %indvars.iv160.unr.ph = phi i64 [ %indvars.iv.next161.prol, %for.inc109.us.prol ], [ %indvars.iv160.ph, %for.inc109.us.preheader ]
  %62 = icmp eq i64 %wide.trip.count174, %indvars.iv160.ph
  br i1 %62, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader.new

for.inc109.us.preheader.new:                      ; preds = %for.inc109.us.prol.loopexit
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us, %for.inc109.us.preheader.new
  %indvars.iv160 = phi i64 [ %indvars.iv160.unr.ph, %for.inc109.us.preheader.new ], [ %indvars.iv.next161.1, %for.inc109.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv160
  %63 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv160
  %64 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %63, %64
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv160
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv.next161
  %65 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv.next161
  %66 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %65, %66
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv.next161
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161, %wide.trip.count174
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  br i1 %exitcond163.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.inc109.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.inc109.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.inc109.us.prol.loopexit, %middle.block
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond253 = icmp eq i64 %indvars.iv.next165, %3
  br i1 %exitcond253, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp116122 = icmp sgt i32 %h, 0
  br i1 %cmp116122, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 %cmp137, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %67 = add i32 %w, -1
  %68 = sext i32 %h to i64
  %wide.trip.count155 = zext i32 %67 to i64
  %mul126.us212 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us214 = fmul float %exp2, 0.000000e+00
  %mul130.us216 = fmul float %call29, -0.000000e+00
  %exitcond156219 = icmp eq i32 %67, 0
  %xtraiter320 = and i64 %wide.trip.count155, 1
  %lcmp.mod321 = icmp eq i64 %xtraiter320, 0
  %69 = icmp eq i32 %67, 1
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv157 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next158, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us210 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv157
  %70 = load float, float* %arrayidx124.us210, align 4
  %mul125.us211 = fmul float %div, %70
  %add127.us213 = fadd float %mul126.us212, %mul125.us211
  %add129.us215 = fadd float %mul128.us214, %add127.us213
  %add131.us217 = fadd float %mul130.us216, %add129.us215
  %arrayidx135.us218 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv157
  store float %add131.us217, float* %arrayidx135.us218, align 4
  br i1 %exitcond156219, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod321, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  %sunkaddr326 = mul i64 %indvars.iv157, 4
  %sunkaddr327 = add i64 %sunkaddr, %sunkaddr326
  %sunkaddr328 = inttoptr i64 %sunkaddr327 to float*
  %71 = load float, float* %sunkaddr328, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv157
  %72 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %72
  %mul126.us.prol = fmul float %mul16.v.r1, %71
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us217
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us216, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv157
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol, %for.inc144.us.for.inc144.us_crit_edge.preheader
  %add131.us222.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us217, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %arrayidx124.us221.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us210, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %.unr.ph = phi float [ %add131.us217, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %indvars.iv153220.unr.ph = phi i64 [ 1, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  br i1 %69, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %add131.us222 = phi float [ %add131.us222.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %arrayidx124.us221 = phi float* [ %arrayidx124.us221.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %73 = phi float [ %.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv153220 = phi i64 [ %indvars.iv153220.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next154.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153220, 1
  %74 = load float, float* %arrayidx124.us221, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next154, i64 %indvars.iv157
  %75 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %75
  %mul126.us = fmul float %mul16.v.r1, %74
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us222
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %73, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next154, i64 %indvars.iv157
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next154.1 = add nuw nsw i64 %indvars.iv153220, 2
  %76 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next154.1, i64 %indvars.iv157
  %77 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %77
  %mul126.us.1 = fmul float %mul16.v.r1, %76
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us222, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next154.1, i64 %indvars.iv157
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond156.1 = icmp eq i64 %indvars.iv.next154.1, %wide.trip.count155
  br i1 %exitcond156.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond252 = icmp eq i64 %indvars.iv.next158, %68
  br i1 %exitcond252, label %for.cond154.preheader.us.preheader, label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %78 = sext i32 %w to i64
  %indvars.iv.next149196 = add nsw i64 %78, -1
  %mul157.us197 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us198 = fmul float %1, -0.000000e+00
  %add159.us199 = fadd float %mul157.us197, %mul158.us198
  %add161.us201 = fadd float %mul128.us214, %add159.us199
  %add163.us203 = fadd float %mul130.us216, %add161.us201
  %cmp155.us206 = icmp sgt i32 %w, 1
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv150 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next151, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us204 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next149196, i64 %indvars.iv150
  store float %add163.us203, float* %arrayidx167.us204, align 4
  br i1 %cmp155.us206, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader, %for.inc176.us.for.inc176.us_crit_edge
  %indvars.iv.next149196.pn = phi i64 [ %indvars.iv.next149, %for.inc176.us.for.inc176.us_crit_edge ], [ %indvars.iv.next149196, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %add163.us209 = phi float [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge ], [ %add163.us203, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %79 = phi float [ %add163.us209, %for.inc176.us.for.inc176.us_crit_edge ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %tp1.sroa.0.0116.us207 = phi i32 [ %80, %for.inc176.us.for.inc176.us_crit_edge ], [ 0, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %.in.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next149196.pn, i64 %indvars.iv150
  %.in = bitcast float* %.in.in to i32*
  %80 = load i32, i32* %.in, align 4
  %81 = bitcast i32 %80 to float
  %indvars.iv.next149 = add nsw i64 %indvars.iv.next149196.pn, -1
  %mul157.us = fmul float %mul16.v.r2, %81
  %82 = bitcast i32 %tp1.sroa.0.0116.us207 to float
  %mul158.us = fmul float %82, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us209
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %79, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next149, i64 %indvars.iv150
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next149196.pn, 1
  br i1 %cmp155.us, label %for.inc176.us.for.inc176.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond251 = icmp eq i64 %indvars.iv.next151, %68
  br i1 %exitcond251, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %or.cond = and i1 %cmp137, %cmp116122
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %83 = add i32 %h, -1
  %84 = sext i32 %w to i64
  %wide.trip.count = zext i32 %83 to i64
  %85 = add nuw nsw i64 %wide.trip.count, 1
  %86 = and i64 %85, 8589934584
  %87 = add nsw i64 %86, -8
  %88 = lshr exact i64 %87, 3
  %min.iters.check277 = icmp ult i64 %85, 8
  %cmp.zero281 = icmp eq i64 %86, 0
  %89 = and i64 %88, 1
  %lcmp.mod = icmp eq i64 %89, 0
  %90 = icmp eq i64 %88, 0
  %cmp.n308 = icmp eq i64 %85, %86
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv145 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next146, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep283 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 0
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %85
  %scevgep287 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 0
  %scevgep289 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %85
  %scevgep291 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 0
  %scevgep293 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %85
  br i1 %min.iters.check277, label %for.inc202.us.preheader, label %min.iters.checked278

min.iters.checked278:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero281, label %for.inc202.us.preheader, label %vector.memcheck303

vector.memcheck303:                               ; preds = %min.iters.checked278
  %bound0295 = icmp ult float* %scevgep283, %scevgep289
  %bound1296 = icmp ult float* %scevgep287, %scevgep285
  %found.conflict297 = and i1 %bound0295, %bound1296
  %bound0298 = icmp ult float* %scevgep283, %scevgep293
  %bound1299 = icmp ult float* %scevgep291, %scevgep285
  %found.conflict300 = and i1 %bound0298, %bound1299
  %conflict.rdx301 = or i1 %found.conflict297, %found.conflict300
  br i1 %conflict.rdx301, label %for.inc202.us.preheader, label %vector.body274.preheader

vector.body274.preheader:                         ; preds = %vector.memcheck303
  br i1 %lcmp.mod, label %vector.body274.prol, label %vector.body274.prol.loopexit

vector.body274.prol:                              ; preds = %vector.body274.preheader
  %91 = bitcast float* %scevgep287 to <4 x float>*
  %wide.load313.prol = load <4 x float>, <4 x float>* %91, align 4, !alias.scope !16
  %92 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 4
  %93 = bitcast float* %92 to <4 x float>*
  %wide.load314.prol = load <4 x float>, <4 x float>* %93, align 4, !alias.scope !16
  %94 = bitcast float* %scevgep291 to <4 x float>*
  %wide.load315.prol = load <4 x float>, <4 x float>* %94, align 4, !alias.scope !19
  %95 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 4
  %96 = bitcast float* %95 to <4 x float>*
  %wide.load316.prol = load <4 x float>, <4 x float>* %96, align 4, !alias.scope !19
  %97 = fadd <4 x float> %wide.load313.prol, %wide.load315.prol
  %98 = fadd <4 x float> %wide.load314.prol, %wide.load316.prol
  %99 = bitcast float* %scevgep283 to <4 x float>*
  store <4 x float> %97, <4 x float>* %99, align 4, !alias.scope !21, !noalias !23
  %100 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 4
  %101 = bitcast float* %100 to <4 x float>*
  store <4 x float> %98, <4 x float>* %101, align 4, !alias.scope !21, !noalias !23
  br label %vector.body274.prol.loopexit

vector.body274.prol.loopexit:                     ; preds = %vector.body274.prol, %vector.body274.preheader
  %index305.unr.ph = phi i64 [ 8, %vector.body274.prol ], [ 0, %vector.body274.preheader ]
  br i1 %90, label %middle.block275, label %vector.body274.preheader.new

vector.body274.preheader.new:                     ; preds = %vector.body274.prol.loopexit
  br label %vector.body274

vector.body274:                                   ; preds = %vector.body274, %vector.body274.preheader.new
  %index305 = phi i64 [ %index305.unr.ph, %vector.body274.preheader.new ], [ %index.next306.1, %vector.body274 ]
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index305
  %103 = bitcast float* %102 to <4 x float>*
  %wide.load313 = load <4 x float>, <4 x float>* %103, align 4, !alias.scope !16
  %104 = getelementptr float, float* %102, i64 4
  %105 = bitcast float* %104 to <4 x float>*
  %wide.load314 = load <4 x float>, <4 x float>* %105, align 4, !alias.scope !16
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index305
  %107 = bitcast float* %106 to <4 x float>*
  %wide.load315 = load <4 x float>, <4 x float>* %107, align 4, !alias.scope !19
  %108 = getelementptr float, float* %106, i64 4
  %109 = bitcast float* %108 to <4 x float>*
  %wide.load316 = load <4 x float>, <4 x float>* %109, align 4, !alias.scope !19
  %110 = fadd <4 x float> %wide.load313, %wide.load315
  %111 = fadd <4 x float> %wide.load314, %wide.load316
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index305
  %113 = bitcast float* %112 to <4 x float>*
  store <4 x float> %110, <4 x float>* %113, align 4, !alias.scope !21, !noalias !23
  %114 = getelementptr float, float* %112, i64 4
  %115 = bitcast float* %114 to <4 x float>*
  store <4 x float> %111, <4 x float>* %115, align 4, !alias.scope !21, !noalias !23
  %index.next306 = add i64 %index305, 8
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index.next306
  %117 = bitcast float* %116 to <4 x float>*
  %wide.load313.1 = load <4 x float>, <4 x float>* %117, align 4, !alias.scope !16
  %118 = getelementptr float, float* %116, i64 4
  %119 = bitcast float* %118 to <4 x float>*
  %wide.load314.1 = load <4 x float>, <4 x float>* %119, align 4, !alias.scope !16
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index.next306
  %121 = bitcast float* %120 to <4 x float>*
  %wide.load315.1 = load <4 x float>, <4 x float>* %121, align 4, !alias.scope !19
  %122 = getelementptr float, float* %120, i64 4
  %123 = bitcast float* %122 to <4 x float>*
  %wide.load316.1 = load <4 x float>, <4 x float>* %123, align 4, !alias.scope !19
  %124 = fadd <4 x float> %wide.load313.1, %wide.load315.1
  %125 = fadd <4 x float> %wide.load314.1, %wide.load316.1
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index.next306
  %127 = bitcast float* %126 to <4 x float>*
  store <4 x float> %124, <4 x float>* %127, align 4, !alias.scope !21, !noalias !23
  %128 = getelementptr float, float* %126, i64 4
  %129 = bitcast float* %128 to <4 x float>*
  store <4 x float> %125, <4 x float>* %129, align 4, !alias.scope !21, !noalias !23
  %index.next306.1 = add i64 %index305, 16
  %130 = icmp eq i64 %index.next306.1, %86
  br i1 %130, label %middle.block275.loopexit, label %vector.body274, !llvm.loop !24

middle.block275.loopexit:                         ; preds = %vector.body274
  br label %middle.block275

middle.block275:                                  ; preds = %middle.block275.loopexit, %vector.body274.prol.loopexit
  br i1 %cmp.n308, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader

for.inc202.us.preheader:                          ; preds = %middle.block275, %vector.memcheck303, %min.iters.checked278, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck303 ], [ 0, %min.iters.checked278 ], [ 0, %for.cond185.preheader.us ], [ %86, %middle.block275 ]
  %131 = sub nsw i64 %85, %indvars.iv.ph
  %xtraiter318 = and i64 %131, 1
  %lcmp.mod319 = icmp eq i64 %xtraiter318, 0
  br i1 %lcmp.mod319, label %for.inc202.us.prol.loopexit, label %for.inc202.us.prol

for.inc202.us.prol:                               ; preds = %for.inc202.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.ph
  %132 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.ph
  %133 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %132, %133
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.inc202.us.prol.loopexit

for.inc202.us.prol.loopexit:                      ; preds = %for.inc202.us.prol, %for.inc202.us.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc202.us.prol ], [ %indvars.iv.ph, %for.inc202.us.preheader ]
  %134 = icmp eq i64 %wide.trip.count, %indvars.iv.ph
  br i1 %134, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader.new

for.inc202.us.preheader.new:                      ; preds = %for.inc202.us.prol.loopexit
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us, %for.inc202.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc202.us.preheader.new ], [ %indvars.iv.next.1, %for.inc202.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv
  %135 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv
  %136 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %135, %136
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.next
  %137 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.next
  %138 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %137, %138
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.inc202.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.inc202.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.inc202.us.prol.loopexit, %middle.block275
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond250 = icmp eq i64 %indvars.iv.next146, %84
  br i1 %exitcond250, label %for.end207.loopexit, label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond31.preheader.lr.ph, %for.cond118.preheader.lr.ph, %for.cond182.preheader
  ret void
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
  %cmp9 = icmp sgt i32 %w, 0
  %cmp37 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp9, %cmp37
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv13, i64 %indvars.iv
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, %4
  br i1 %exitcond16, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!7, !10}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = !{!22}
!22 = distinct !{!22, !18}
!23 = !{!17, !20}
!24 = distinct !{!24, !2, !3}
!25 = distinct !{!25, !2, !3}

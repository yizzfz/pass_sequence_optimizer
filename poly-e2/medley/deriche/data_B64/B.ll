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
  %0 = bitcast i8* %call to [2160 x float]*
  %1 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %0)
  tail call void (...) @polybench_timer_start() #5
  %2 = load float, float* %alpha, align 4
  %3 = bitcast i8* %call2 to [2160 x float]*
  %4 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %2, [2160 x float]* %0, [2160 x float]* %1, [2160 x float]* %3, [2160 x float]* %4)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call1 to [2160 x float]*
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %6)
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
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
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

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next9, %for.inc7.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 313
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
  %5 = add nsw <4 x i64> %4, %broadcast.splat
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc7.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv, 991
  %14 = add nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc7.us.loopexit, label %for.inc.us, !llvm.loop !4

for.inc7.us.loopexit:                             ; preds = %for.inc.us
  br label %for.inc7.us

for.inc7.us:                                      ; preds = %for.inc7.us.loopexit, %middle.block
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %1
  br i1 %exitcond12, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.inc7.us
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
  %xtraiter320 = and i64 %wide.trip.count174, 1
  %lcmp.mod321 = icmp eq i64 %xtraiter320, 0
  %4 = icmp eq i32 %2, 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.inc55.us, %for.cond31.preheader.us.preheader
  %indvars.iv176 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next177, %for.inc55.us ]
  %arrayidx35.us237 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 0
  %5 = load float, float* %arrayidx35.us237, align 4
  %mul36.us238 = fmul float %div, %5
  %add38.us240 = fadd float %mul37.us239, %mul36.us238
  %add40.us242 = fadd float %mul39.us241, %add38.us240
  %add42.us244 = fadd float %mul41.us243, %add40.us242
  %arrayidx46.us245 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 0
  store float %add42.us244, float* %arrayidx46.us245, align 4
  br i1 %exitcond175246, label %for.inc55.us, label %for.inc.us.for.inc.us_crit_edge.preheader

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod321, label %for.inc.us.for.inc.us_crit_edge.prol.loopexit, label %for.inc.us.for.inc.us_crit_edge.prol

for.inc.us.for.inc.us_crit_edge.prol:             ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us237, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16.v.r1, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us244
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol.loopexit:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol, %for.inc.us.for.inc.us_crit_edge.preheader
  %add42.us249.unr.ph = phi float [ %add42.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %add42.us244, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %arrayidx35.us248.unr.ph = phi float* [ %arrayidx35.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %arrayidx35.us237, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %.unr322.ph = phi float [ %add42.us244, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %indvars.iv172247.unr.ph = phi i64 [ 1, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0, %for.inc.us.for.inc.us_crit_edge.preheader ]
  br i1 %4, label %for.inc55.us, label %for.inc.us.for.inc.us_crit_edge.preheader.new

for.inc.us.for.inc.us_crit_edge.preheader.new:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge, %for.inc.us.for.inc.us_crit_edge.preheader.new
  %add42.us249 = phi float [ %add42.us249.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %arrayidx35.us248 = phi float* [ %arrayidx35.us248.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %8 = phi float [ %.unr322.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv172247 = phi i64 [ %indvars.iv172247.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %indvars.iv.next173.1, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv.next173 = add nuw nsw i64 %indvars.iv172247, 1
  %9 = load float, float* %arrayidx35.us248, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 %indvars.iv.next173
  %10 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %10
  %mul37.us = fmul float %mul16.v.r1, %9
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us249
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %8, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 %indvars.iv.next173
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next173.1 = add nuw nsw i64 %indvars.iv172247, 2
  %11 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv176, i64 %indvars.iv.next173.1
  %12 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %12
  %mul37.us.1 = fmul float %mul16.v.r1, %11
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us249, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 %indvars.iv.next173.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond175.1 = icmp eq i64 %indvars.iv.next173.1, %wide.trip.count174
  br i1 %exitcond175.1, label %for.inc55.us.loopexit, label %for.inc.us.for.inc.us_crit_edge

for.inc55.us.loopexit:                            ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc.us.for.inc.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond330 = icmp eq i64 %indvars.iv.next177, %3
  br i1 %exitcond330, label %for.cond62.preheader.us.preheader, label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.inc55.us
  %13 = sext i32 %h to i64
  %indvars.iv.next168223 = add nsw i64 %13, -1
  %mul65.us224 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us225 = fmul float %1, -0.000000e+00
  %add67.us226 = fadd float %mul65.us224, %mul66.us225
  %mul68.us227 = fmul float %exp2, 0.000000e+00
  %add69.us228 = fadd float %mul68.us227, %add67.us226
  %mul70.us229 = fmul float %call29, -0.000000e+00
  %add71.us230 = fadd float %mul70.us229, %add69.us228
  %cmp63.us233 = icmp sgt i32 %h, 1
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.inc86.us, %for.cond62.preheader.us.preheader
  %indvars.iv169 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next170, %for.inc86.us ]
  %arrayidx75.us231 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv169, i64 %indvars.iv.next168223
  store float %add71.us230, float* %arrayidx75.us231, align 4
  br i1 %cmp63.us233, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.inc86.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader, %for.inc84.us.for.inc84.us_crit_edge
  %indvars.iv.next168223.pn = phi i64 [ %indvars.iv.next168, %for.inc84.us.for.inc84.us_crit_edge ], [ %indvars.iv.next168223, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %add71.us236 = phi float [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge ], [ %add71.us230, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %14 = phi float [ %add71.us236, %for.inc84.us.for.inc84.us_crit_edge ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %xp1.sroa.0.0131.us234 = phi i32 [ %15, %for.inc84.us.for.inc84.us_crit_edge ], [ 0, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %.in250.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv169, i64 %indvars.iv.next168223.pn
  %.in250 = bitcast float* %.in250.in to i32*
  %15 = load i32, i32* %.in250, align 4
  %16 = bitcast i32 %15 to float
  %indvars.iv.next168 = add nsw i64 %indvars.iv.next168223.pn, -1
  %mul65.us = fmul float %mul16.v.r2, %16
  %17 = bitcast i32 %xp1.sroa.0.0131.us234 to float
  %mul66.us = fmul float %17, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us236
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %14, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv169, i64 %indvars.iv.next168
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next168223.pn, 1
  br i1 %cmp63.us, label %for.inc84.us.for.inc84.us_crit_edge, label %for.inc86.us.loopexit

for.inc86.us.loopexit:                            ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.inc86.us

for.inc86.us:                                     ; preds = %for.inc86.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %exitcond329 = icmp eq i64 %indvars.iv.next170, %3
  br i1 %exitcond329, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.inc86.us
  %18 = add nuw nsw i64 %wide.trip.count174, 1
  %19 = and i64 %18, 8589934584
  %20 = add nsw i64 %19, -8
  %21 = lshr exact i64 %20, 3
  %22 = add nuw nsw i64 %wide.trip.count174, 1
  %min.iters.check = icmp ult i64 %18, 8
  %n.vec = and i64 %18, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = and i64 %21, 1
  %lcmp.mod317 = icmp eq i64 %23, 0
  %24 = icmp eq i64 %21, 0
  %cmp.n = icmp eq i64 %18, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.inc112.us, %for.cond92.preheader.us.preheader
  %indvars.iv164 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next165, %for.inc112.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 0
  %scevgep252 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %18
  %scevgep254 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 0
  %scevgep256 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %18
  %scevgep258 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 0
  %scevgep260 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %18
  br i1 %min.iters.check, label %for.inc109.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.inc109.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep256
  %bound1 = icmp ult float* %scevgep254, %scevgep252
  %found.conflict = and i1 %bound0, %bound1
  %bound0262 = icmp ult float* %scevgep, %scevgep260
  %bound1263 = icmp ult float* %scevgep258, %scevgep252
  %found.conflict264 = and i1 %bound0262, %bound1263
  %conflict.rdx = or i1 %found.conflict, %found.conflict264
  br i1 %conflict.rdx, label %for.inc109.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod317, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 0
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !6
  %27 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load266.prol = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !6
  %29 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 0
  %30 = bitcast float* %29 to <4 x float>*
  %wide.load267.prol = load <4 x float>, <4 x float>* %30, align 4, !alias.scope !9
  %31 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 4
  %32 = bitcast float* %31 to <4 x float>*
  %wide.load268.prol = load <4 x float>, <4 x float>* %32, align 4, !alias.scope !9
  %33 = fadd <4 x float> %wide.load.prol, %wide.load267.prol
  %34 = fadd <4 x float> %wide.load266.prol, %wide.load268.prol
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 0
  %36 = bitcast float* %35 to <4 x float>*
  store <4 x float> %33, <4 x float>* %36, align 4, !alias.scope !11, !noalias !13
  %37 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 4
  %38 = bitcast float* %37 to <4 x float>*
  store <4 x float> %34, <4 x float>* %38, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br i1 %24, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %index
  %40 = bitcast float* %39 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %40, align 4, !alias.scope !6
  %41 = getelementptr float, float* %39, i64 4
  %42 = bitcast float* %41 to <4 x float>*
  %wide.load266 = load <4 x float>, <4 x float>* %42, align 4, !alias.scope !6
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %index
  %44 = bitcast float* %43 to <4 x float>*
  %wide.load267 = load <4 x float>, <4 x float>* %44, align 4, !alias.scope !9
  %45 = getelementptr float, float* %43, i64 4
  %46 = bitcast float* %45 to <4 x float>*
  %wide.load268 = load <4 x float>, <4 x float>* %46, align 4, !alias.scope !9
  %47 = fadd <4 x float> %wide.load, %wide.load267
  %48 = fadd <4 x float> %wide.load266, %wide.load268
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %index
  %50 = bitcast float* %49 to <4 x float>*
  store <4 x float> %47, <4 x float>* %50, align 4, !alias.scope !11, !noalias !13
  %51 = getelementptr float, float* %49, i64 4
  %52 = bitcast float* %51 to <4 x float>*
  store <4 x float> %48, <4 x float>* %52, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %index.next
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %54, align 4, !alias.scope !6
  %55 = getelementptr float, float* %53, i64 4
  %56 = bitcast float* %55 to <4 x float>*
  %wide.load266.1 = load <4 x float>, <4 x float>* %56, align 4, !alias.scope !6
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %index.next
  %58 = bitcast float* %57 to <4 x float>*
  %wide.load267.1 = load <4 x float>, <4 x float>* %58, align 4, !alias.scope !9
  %59 = getelementptr float, float* %57, i64 4
  %60 = bitcast float* %59 to <4 x float>*
  %wide.load268.1 = load <4 x float>, <4 x float>* %60, align 4, !alias.scope !9
  %61 = fadd <4 x float> %wide.load.1, %wide.load267.1
  %62 = fadd <4 x float> %wide.load266.1, %wide.load268.1
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %index.next
  %64 = bitcast float* %63 to <4 x float>*
  store <4 x float> %61, <4 x float>* %64, align 4, !alias.scope !11, !noalias !13
  %65 = getelementptr float, float* %63, i64 4
  %66 = bitcast float* %65 to <4 x float>*
  store <4 x float> %62, <4 x float>* %66, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.1, %n.vec
  br i1 %67, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.inc112.us, label %for.inc109.us.preheader

for.inc109.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv160.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %68 = sub nsw i64 %22, %indvars.iv160.ph
  %xtraiter318 = and i64 %68, 1
  %lcmp.mod319 = icmp eq i64 %xtraiter318, 0
  br i1 %lcmp.mod319, label %for.inc109.us.prol.loopexit, label %for.inc109.us.prol

for.inc109.us.prol:                               ; preds = %for.inc109.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv160.ph
  %69 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv160.ph
  %70 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %69, %70
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv160.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next161.prol = or i64 %indvars.iv160.ph, 1
  br label %for.inc109.us.prol.loopexit

for.inc109.us.prol.loopexit:                      ; preds = %for.inc109.us.prol, %for.inc109.us.preheader
  %indvars.iv160.unr.ph = phi i64 [ %indvars.iv.next161.prol, %for.inc109.us.prol ], [ %indvars.iv160.ph, %for.inc109.us.preheader ]
  %71 = icmp eq i64 %wide.trip.count174, %indvars.iv160.ph
  br i1 %71, label %for.inc112.us, label %for.inc109.us.preheader.new

for.inc109.us.preheader.new:                      ; preds = %for.inc109.us.prol.loopexit
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us, %for.inc109.us.preheader.new
  %indvars.iv160 = phi i64 [ %indvars.iv160.unr.ph, %for.inc109.us.preheader.new ], [ %indvars.iv.next161.1, %for.inc109.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv160
  %72 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv160
  %73 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %72, %73
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv160
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next161 = add nuw nsw i64 %indvars.iv160, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv164, i64 %indvars.iv.next161
  %74 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv164, i64 %indvars.iv.next161
  %75 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %74, %75
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv164, i64 %indvars.iv.next161
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161, %wide.trip.count174
  %indvars.iv.next161.1 = add nsw i64 %indvars.iv160, 2
  br i1 %exitcond163.1, label %for.inc112.us.loopexit, label %for.inc109.us, !llvm.loop !15

for.inc112.us.loopexit:                           ; preds = %for.inc109.us
  br label %for.inc112.us

for.inc112.us:                                    ; preds = %for.inc112.us.loopexit, %for.inc109.us.prol.loopexit, %middle.block
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond328 = icmp eq i64 %indvars.iv.next165, %3
  br i1 %exitcond328, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.inc112.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp116122 = icmp sgt i32 %h, 0
  br i1 %cmp116122, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %76 = icmp sgt i32 %w, 0
  br i1 %76, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %77 = add i32 %w, -1
  %78 = sext i32 %h to i64
  %wide.trip.count155 = zext i32 %77 to i64
  %mul126.us212 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us214 = fmul float %exp2, 0.000000e+00
  %mul130.us216 = fmul float %call29, -0.000000e+00
  %exitcond156219 = icmp eq i32 %77, 0
  %xtraiter314 = and i64 %wide.trip.count155, 1
  %lcmp.mod315 = icmp eq i64 %xtraiter314, 0
  %79 = icmp eq i32 %77, 1
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.inc147.us, %for.cond118.preheader.us.preheader
  %indvars.iv157 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next158, %for.inc147.us ]
  %arrayidx124.us210 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv157
  %80 = load float, float* %arrayidx124.us210, align 4
  %mul125.us211 = fmul float %div, %80
  %add127.us213 = fadd float %mul126.us212, %mul125.us211
  %add129.us215 = fadd float %mul128.us214, %add127.us213
  %add131.us217 = fadd float %mul130.us216, %add129.us215
  %arrayidx135.us218 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv157
  store float %add131.us217, float* %arrayidx135.us218, align 4
  br i1 %exitcond156219, label %for.inc147.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod315, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  %sunkaddr323 = shl nuw nsw i64 %indvars.iv157, 2
  %sunkaddr324 = add i64 %sunkaddr, %sunkaddr323
  %sunkaddr325 = inttoptr i64 %sunkaddr324 to float*
  %81 = load float, float* %sunkaddr325, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv157
  %82 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %82
  %mul126.us.prol = fmul float %mul16.v.r1, %81
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us217
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv157
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol, %for.inc144.us.for.inc144.us_crit_edge.preheader
  %add131.us222.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us217, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %arrayidx124.us221.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us210, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %.unr.ph = phi float [ %add131.us217, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %indvars.iv153220.unr.ph = phi i64 [ 1, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  br i1 %79, label %for.inc147.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %add131.us222 = phi float [ %add131.us222.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %arrayidx124.us221 = phi float* [ %arrayidx124.us221.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %83 = phi float [ %.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv153220 = phi i64 [ %indvars.iv153220.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next154.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153220, 1
  %84 = load float, float* %arrayidx124.us221, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next154, i64 %indvars.iv157
  %85 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %85
  %mul126.us = fmul float %mul16.v.r1, %84
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us222
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %83, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next154, i64 %indvars.iv157
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next154.1 = add nuw nsw i64 %indvars.iv153220, 2
  %86 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next154.1, i64 %indvars.iv157
  %87 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %87
  %mul126.us.1 = fmul float %mul16.v.r1, %86
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us222, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next154.1, i64 %indvars.iv157
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond156.1 = icmp eq i64 %indvars.iv.next154.1, %wide.trip.count155
  br i1 %exitcond156.1, label %for.inc147.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge

for.inc147.us.loopexit:                           ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.inc147.us

for.inc147.us:                                    ; preds = %for.inc147.us.loopexit, %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next158 = add nuw nsw i64 %indvars.iv157, 1
  %exitcond327 = icmp eq i64 %indvars.iv.next158, %78
  br i1 %exitcond327, label %for.cond154.preheader.us.preheader, label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.inc147.us
  %88 = sext i32 %w to i64
  %indvars.iv.next149196 = add nsw i64 %88, -1
  %mul157.us197 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us198 = fmul float %1, -0.000000e+00
  %add159.us199 = fadd float %mul157.us197, %mul158.us198
  %mul160.us200 = fmul float %exp2, 0.000000e+00
  %add161.us201 = fadd float %mul160.us200, %add159.us199
  %mul162.us202 = fmul float %call29, -0.000000e+00
  %add163.us203 = fadd float %mul162.us202, %add161.us201
  %cmp155.us206 = icmp sgt i32 %w, 1
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.inc179.us, %for.cond154.preheader.us.preheader
  %indvars.iv150 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next151, %for.inc179.us ]
  %arrayidx167.us204 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next149196, i64 %indvars.iv150
  store float %add163.us203, float* %arrayidx167.us204, align 4
  br i1 %cmp155.us206, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.inc179.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader, %for.inc176.us.for.inc176.us_crit_edge
  %indvars.iv.next149196.pn = phi i64 [ %indvars.iv.next149, %for.inc176.us.for.inc176.us_crit_edge ], [ %indvars.iv.next149196, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %add163.us209 = phi float [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge ], [ %add163.us203, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %89 = phi float [ %add163.us209, %for.inc176.us.for.inc176.us_crit_edge ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %tp1.sroa.0.0116.us207 = phi i32 [ %90, %for.inc176.us.for.inc176.us_crit_edge ], [ 0, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %.in.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next149196.pn, i64 %indvars.iv150
  %.in = bitcast float* %.in.in to i32*
  %90 = load i32, i32* %.in, align 4
  %91 = bitcast i32 %90 to float
  %indvars.iv.next149 = add nsw i64 %indvars.iv.next149196.pn, -1
  %mul157.us = fmul float %mul16.v.r2, %91
  %92 = bitcast i32 %tp1.sroa.0.0116.us207 to float
  %mul158.us = fmul float %92, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us209
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %89, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next149, i64 %indvars.iv150
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next149196.pn, 1
  br i1 %cmp155.us, label %for.inc176.us.for.inc176.us_crit_edge, label %for.inc179.us.loopexit

for.inc179.us.loopexit:                           ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.inc179.us

for.inc179.us:                                    ; preds = %for.inc179.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond326 = icmp eq i64 %indvars.iv.next151, %78
  br i1 %exitcond326, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.inc179.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %93 = icmp sgt i32 %h, 0
  %94 = icmp sgt i32 %w, 0
  %or.cond = and i1 %94, %93
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %95 = add i32 %h, -1
  %96 = sext i32 %w to i64
  %wide.trip.count = zext i32 %95 to i64
  %97 = add nuw nsw i64 %wide.trip.count, 1
  %98 = and i64 %97, 8589934584
  %99 = add nsw i64 %98, -8
  %100 = lshr exact i64 %99, 3
  %101 = add nuw nsw i64 %wide.trip.count, 1
  %min.iters.check272 = icmp ult i64 %97, 8
  %n.vec275 = and i64 %97, 8589934584
  %cmp.zero276 = icmp eq i64 %n.vec275, 0
  %102 = and i64 %100, 1
  %lcmp.mod = icmp eq i64 %102, 0
  %103 = icmp eq i64 %100, 0
  %cmp.n303 = icmp eq i64 %97, %n.vec275
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.inc205.us, %for.cond185.preheader.us.preheader
  %indvars.iv145 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next146, %for.inc205.us ]
  %scevgep278 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 0
  %scevgep280 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %97
  %scevgep282 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 0
  %scevgep284 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %97
  %scevgep286 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 0
  %scevgep288 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %97
  br i1 %min.iters.check272, label %for.inc202.us.preheader, label %min.iters.checked273

min.iters.checked273:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero276, label %for.inc202.us.preheader, label %vector.memcheck298

vector.memcheck298:                               ; preds = %min.iters.checked273
  %bound0290 = icmp ult float* %scevgep278, %scevgep284
  %bound1291 = icmp ult float* %scevgep282, %scevgep280
  %found.conflict292 = and i1 %bound0290, %bound1291
  %bound0293 = icmp ult float* %scevgep278, %scevgep288
  %bound1294 = icmp ult float* %scevgep286, %scevgep280
  %found.conflict295 = and i1 %bound0293, %bound1294
  %conflict.rdx296 = or i1 %found.conflict292, %found.conflict295
  br i1 %conflict.rdx296, label %for.inc202.us.preheader, label %vector.body269.preheader

vector.body269.preheader:                         ; preds = %vector.memcheck298
  br i1 %lcmp.mod, label %vector.body269.prol, label %vector.body269.prol.loopexit

vector.body269.prol:                              ; preds = %vector.body269.preheader
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 0
  %105 = bitcast float* %104 to <4 x float>*
  %wide.load308.prol = load <4 x float>, <4 x float>* %105, align 4, !alias.scope !16
  %106 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 4
  %107 = bitcast float* %106 to <4 x float>*
  %wide.load309.prol = load <4 x float>, <4 x float>* %107, align 4, !alias.scope !16
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 0
  %109 = bitcast float* %108 to <4 x float>*
  %wide.load310.prol = load <4 x float>, <4 x float>* %109, align 4, !alias.scope !19
  %110 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 4
  %111 = bitcast float* %110 to <4 x float>*
  %wide.load311.prol = load <4 x float>, <4 x float>* %111, align 4, !alias.scope !19
  %112 = fadd <4 x float> %wide.load308.prol, %wide.load310.prol
  %113 = fadd <4 x float> %wide.load309.prol, %wide.load311.prol
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 0
  %115 = bitcast float* %114 to <4 x float>*
  store <4 x float> %112, <4 x float>* %115, align 4, !alias.scope !21, !noalias !23
  %116 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 4
  %117 = bitcast float* %116 to <4 x float>*
  store <4 x float> %113, <4 x float>* %117, align 4, !alias.scope !21, !noalias !23
  br label %vector.body269.prol.loopexit

vector.body269.prol.loopexit:                     ; preds = %vector.body269.prol, %vector.body269.preheader
  %index300.unr.ph = phi i64 [ 8, %vector.body269.prol ], [ 0, %vector.body269.preheader ]
  br i1 %103, label %middle.block270, label %vector.body269.preheader.new

vector.body269.preheader.new:                     ; preds = %vector.body269.prol.loopexit
  br label %vector.body269

vector.body269:                                   ; preds = %vector.body269, %vector.body269.preheader.new
  %index300 = phi i64 [ %index300.unr.ph, %vector.body269.preheader.new ], [ %index.next301.1, %vector.body269 ]
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index300
  %119 = bitcast float* %118 to <4 x float>*
  %wide.load308 = load <4 x float>, <4 x float>* %119, align 4, !alias.scope !16
  %120 = getelementptr float, float* %118, i64 4
  %121 = bitcast float* %120 to <4 x float>*
  %wide.load309 = load <4 x float>, <4 x float>* %121, align 4, !alias.scope !16
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index300
  %123 = bitcast float* %122 to <4 x float>*
  %wide.load310 = load <4 x float>, <4 x float>* %123, align 4, !alias.scope !19
  %124 = getelementptr float, float* %122, i64 4
  %125 = bitcast float* %124 to <4 x float>*
  %wide.load311 = load <4 x float>, <4 x float>* %125, align 4, !alias.scope !19
  %126 = fadd <4 x float> %wide.load308, %wide.load310
  %127 = fadd <4 x float> %wide.load309, %wide.load311
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index300
  %129 = bitcast float* %128 to <4 x float>*
  store <4 x float> %126, <4 x float>* %129, align 4, !alias.scope !21, !noalias !23
  %130 = getelementptr float, float* %128, i64 4
  %131 = bitcast float* %130 to <4 x float>*
  store <4 x float> %127, <4 x float>* %131, align 4, !alias.scope !21, !noalias !23
  %index.next301 = add i64 %index300, 8
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %index.next301
  %133 = bitcast float* %132 to <4 x float>*
  %wide.load308.1 = load <4 x float>, <4 x float>* %133, align 4, !alias.scope !16
  %134 = getelementptr float, float* %132, i64 4
  %135 = bitcast float* %134 to <4 x float>*
  %wide.load309.1 = load <4 x float>, <4 x float>* %135, align 4, !alias.scope !16
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %index.next301
  %137 = bitcast float* %136 to <4 x float>*
  %wide.load310.1 = load <4 x float>, <4 x float>* %137, align 4, !alias.scope !19
  %138 = getelementptr float, float* %136, i64 4
  %139 = bitcast float* %138 to <4 x float>*
  %wide.load311.1 = load <4 x float>, <4 x float>* %139, align 4, !alias.scope !19
  %140 = fadd <4 x float> %wide.load308.1, %wide.load310.1
  %141 = fadd <4 x float> %wide.load309.1, %wide.load311.1
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %index.next301
  %143 = bitcast float* %142 to <4 x float>*
  store <4 x float> %140, <4 x float>* %143, align 4, !alias.scope !21, !noalias !23
  %144 = getelementptr float, float* %142, i64 4
  %145 = bitcast float* %144 to <4 x float>*
  store <4 x float> %141, <4 x float>* %145, align 4, !alias.scope !21, !noalias !23
  %index.next301.1 = add i64 %index300, 16
  %146 = icmp eq i64 %index.next301.1, %n.vec275
  br i1 %146, label %middle.block270.loopexit, label %vector.body269, !llvm.loop !24

middle.block270.loopexit:                         ; preds = %vector.body269
  br label %middle.block270

middle.block270:                                  ; preds = %middle.block270.loopexit, %vector.body269.prol.loopexit
  br i1 %cmp.n303, label %for.inc205.us, label %for.inc202.us.preheader

for.inc202.us.preheader:                          ; preds = %middle.block270, %vector.memcheck298, %min.iters.checked273, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck298 ], [ 0, %min.iters.checked273 ], [ 0, %for.cond185.preheader.us ], [ %n.vec275, %middle.block270 ]
  %147 = sub nsw i64 %101, %indvars.iv.ph
  %xtraiter312 = and i64 %147, 1
  %lcmp.mod313 = icmp eq i64 %xtraiter312, 0
  br i1 %lcmp.mod313, label %for.inc202.us.prol.loopexit, label %for.inc202.us.prol

for.inc202.us.prol:                               ; preds = %for.inc202.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.ph
  %148 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.ph
  %149 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %148, %149
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.inc202.us.prol.loopexit

for.inc202.us.prol.loopexit:                      ; preds = %for.inc202.us.prol, %for.inc202.us.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc202.us.prol ], [ %indvars.iv.ph, %for.inc202.us.preheader ]
  %150 = icmp eq i64 %wide.trip.count, %indvars.iv.ph
  br i1 %150, label %for.inc205.us, label %for.inc202.us.preheader.new

for.inc202.us.preheader.new:                      ; preds = %for.inc202.us.prol.loopexit
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us, %for.inc202.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc202.us.preheader.new ], [ %indvars.iv.next.1, %for.inc202.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv
  %151 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv
  %152 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %151, %152
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv145, i64 %indvars.iv.next
  %153 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv145, i64 %indvars.iv.next
  %154 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %153, %154
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv145, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc205.us.loopexit, label %for.inc202.us, !llvm.loop !25

for.inc205.us.loopexit:                           ; preds = %for.inc202.us
  br label %for.inc205.us

for.inc205.us:                                    ; preds = %for.inc205.us.loopexit, %for.inc202.us.prol.loopexit, %middle.block270
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond = icmp eq i64 %indvars.iv.next146, %96
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.inc205.us
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
  %cmp8 = icmp sgt i32 %w, 0
  %cmp36 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp36
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next13, %for.inc10.us ]
  %5 = mul nsw i64 %indvars.iv12, %3
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv12, i64 %indvars.iv
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, %4
  br i1 %exitcond15, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
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

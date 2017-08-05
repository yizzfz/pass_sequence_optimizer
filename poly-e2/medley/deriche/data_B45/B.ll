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
  %0 = sext i32 %w to i64
  %cmp8 = icmp sgt i32 %w, 0
  %cmp26 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %1 = sext i32 %h to i64
  %2 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv39.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next4.us, %for.cond1.for.inc7_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv39.us, 313
  br i1 %min.iters.check, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %for.body3.us.preheader, label %vector.ph

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
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv39.us, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv7.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv7.us = phi i64 [ %indvars.iv.next.us, %for.body3.us ], [ %indvars.iv7.us.ph, %for.body3.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv7.us, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv39.us, i64 %indvars.iv7.us
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv7.us, %2
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv39.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next4.us, %0
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9.loopexit

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
  %1 = sext i32 %h to i64
  %2 = sext i32 %w to i64
  %cmp164 = icmp sgt i32 %w, 0
  br i1 %cmp164, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread189

for.cond58.preheader.thread189:                   ; preds = %entry
  %mul19190 = fmul float %call18, %div
  %mul21191 = fmul float %add20, %mul19190
  %mul25192 = fsub float -0.000000e+00, %0
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32162 = icmp sgt i32 %h, 0
  br i1 %cmp32162, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %3 = add nsw i64 %1, -1
  %mul37.us274 = fmul float %mul16, 0.000000e+00
  %mul39.us276 = fmul float %exp2, 0.000000e+00
  %mul41.us278 = fmul float %call29, -0.000000e+00
  %exitcond180281 = icmp eq i64 %3, 0
  %xtraiter355 = and i64 %3, 1
  %lcmp.mod356 = icmp eq i64 %xtraiter355, 0
  %4 = icmp eq i32 %h, 2
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv129165.us = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next130.us, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us272 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv129165.us, i64 0
  %5 = load float, float* %arrayidx35.us272, align 4
  %mul36.us273 = fmul float %div, %5
  %add38.us275 = fadd float %mul37.us274, %mul36.us273
  %add40.us277 = fadd float %mul39.us276, %add38.us275
  %add42.us279 = fadd float %mul41.us278, %add40.us277
  %arrayidx46.us280 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv129165.us, i64 0
  store float %add42.us279, float* %arrayidx46.us280, align 4
  br i1 %exitcond180281, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod356, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit, label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us272, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv129165.us, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us279
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv129165.us, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol, %for.body33.us.for.body33.us_crit_edge.preheader
  %add42.us284.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us279, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us283.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us272, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv127163.us282.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %.unr357.ph = phi float [ %add42.us279, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us284 = phi float [ %add42.us284.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us283 = phi float* [ %arrayidx35.us283.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv127163.us282 = phi i64 [ %indvars.iv127163.us282.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next128.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %8 = phi float [ %.unr357.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next128.us = add nuw nsw i64 %indvars.iv127163.us282, 1
  %9 = load float, float* %arrayidx35.us283, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv129165.us, i64 %indvars.iv.next128.us
  %10 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %10
  %mul37.us = fmul float %mul16, %9
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us284
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %8, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv129165.us, i64 %indvars.iv.next128.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next128.us.1 = add nsw i64 %indvars.iv127163.us282, 2
  %11 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv129165.us, i64 %indvars.iv.next128.us.1
  %12 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %12
  %mul37.us.1 = fmul float %mul16, %11
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us284, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv129165.us, i64 %indvars.iv.next128.us.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond180.1 = icmp eq i64 %indvars.iv.next128.us.1, %3
  br i1 %exitcond180.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next130.us = add nuw nsw i64 %indvars.iv129165.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next130.us, %2
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  %indvars.iv.next124158.us258 = add nsw i64 %1, -1
  %mul65.us259 = fmul float %mul21, 0.000000e+00
  %mul66.us260 = fmul float %0, -0.000000e+00
  %add67.us261 = fadd float %mul65.us259, %mul66.us260
  %mul68.us262 = fmul float %exp2, 0.000000e+00
  %add69.us263 = fadd float %mul68.us262, %add67.us261
  %mul70.us264 = fmul float %call29, -0.000000e+00
  %add71.us265 = fadd float %mul70.us264, %add69.us263
  %cmp63.us268 = icmp sgt i32 %h, 1
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv125160.us = phi i64 [ %indvars.iv.next126.us, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  %arrayidx75.us266 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv125160.us, i64 %indvars.iv.next124158.us258
  store float %add71.us265, float* %arrayidx75.us266, align 4
  br i1 %cmp63.us268, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.preheader, %for.body64.us.for.body64.us_crit_edge
  %indvars.iv.next124158.us258.pn = phi i64 [ %indvars.iv.next124158.us, %for.body64.us.for.body64.us_crit_edge ], [ %indvars.iv.next124158.us258, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %add71.us271 = phi float [ %add71.us, %for.body64.us.for.body64.us_crit_edge ], [ %add71.us265, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %13 = phi float [ %add71.us271, %for.body64.us.for.body64.us_crit_edge ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.sroa.0.0157.us269 = phi i32 [ %14, %for.body64.us.for.body64.us_crit_edge ], [ 0, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %.in346.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv125160.us, i64 %indvars.iv.next124158.us258.pn
  %.in346 = bitcast float* %.in346.in to i32*
  %14 = load i32, i32* %.in346, align 4
  %15 = bitcast i32 %14 to float
  %indvars.iv.next124158.us = add nsw i64 %indvars.iv.next124158.us258.pn, -1
  %mul65.us = fmul float %mul21, %15
  %16 = bitcast i32 %xp1.sroa.0.0157.us269 to float
  %mul66.us = fmul float %16, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us271
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %13, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv125160.us, i64 %indvars.iv.next124158.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next124158.us258.pn, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next126.us = add nuw nsw i64 %indvars.iv125160.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next126.us, %2
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %17 = add nsw i64 %1, -8
  %18 = lshr i64 %17, 3
  %19 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 8
  %n.vec = and i64 %1, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %20 = and i64 %18, 1
  %lcmp.mod352 = icmp eq i64 %20, 0
  %21 = icmp eq i64 %18, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv121152.us = phi i64 [ %indvars.iv.next122.us, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 0
  %scevgep286 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %1
  %scevgep288 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 0
  %scevgep290 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %1
  %scevgep292 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 0
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %1
  br i1 %min.iters.check, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep290
  %bound1 = icmp ult float* %scevgep288, %scevgep286
  %found.conflict = and i1 %bound0, %bound1
  %bound0296 = icmp ult float* %scevgep, %scevgep294
  %bound1297 = icmp ult float* %scevgep292, %scevgep286
  %found.conflict298 = and i1 %bound0296, %bound1297
  %conflict.rdx = or i1 %found.conflict, %found.conflict298
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod352, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %22 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 0
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !6
  %24 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 4
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load300.prol = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !6
  %26 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 0
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load301.prol = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !9
  %28 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 4
  %29 = bitcast float* %28 to <4 x float>*
  %wide.load302.prol = load <4 x float>, <4 x float>* %29, align 4, !alias.scope !9
  %30 = fadd <4 x float> %wide.load.prol, %wide.load301.prol
  %31 = fadd <4 x float> %wide.load300.prol, %wide.load302.prol
  %32 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 0
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %30, <4 x float>* %33, align 4, !alias.scope !11, !noalias !13
  %34 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 4
  %35 = bitcast float* %34 to <4 x float>*
  store <4 x float> %31, <4 x float>* %35, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br i1 %21, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %36 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %index
  %37 = bitcast float* %36 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %37, align 4, !alias.scope !6
  %38 = getelementptr float, float* %36, i64 4
  %39 = bitcast float* %38 to <4 x float>*
  %wide.load300 = load <4 x float>, <4 x float>* %39, align 4, !alias.scope !6
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %index
  %41 = bitcast float* %40 to <4 x float>*
  %wide.load301 = load <4 x float>, <4 x float>* %41, align 4, !alias.scope !9
  %42 = getelementptr float, float* %40, i64 4
  %43 = bitcast float* %42 to <4 x float>*
  %wide.load302 = load <4 x float>, <4 x float>* %43, align 4, !alias.scope !9
  %44 = fadd <4 x float> %wide.load, %wide.load301
  %45 = fadd <4 x float> %wide.load300, %wide.load302
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %index
  %47 = bitcast float* %46 to <4 x float>*
  store <4 x float> %44, <4 x float>* %47, align 4, !alias.scope !11, !noalias !13
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  store <4 x float> %45, <4 x float>* %49, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %index.next
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %51, align 4, !alias.scope !6
  %52 = getelementptr float, float* %50, i64 4
  %53 = bitcast float* %52 to <4 x float>*
  %wide.load300.1 = load <4 x float>, <4 x float>* %53, align 4, !alias.scope !6
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %index.next
  %55 = bitcast float* %54 to <4 x float>*
  %wide.load301.1 = load <4 x float>, <4 x float>* %55, align 4, !alias.scope !9
  %56 = getelementptr float, float* %54, i64 4
  %57 = bitcast float* %56 to <4 x float>*
  %wide.load302.1 = load <4 x float>, <4 x float>* %57, align 4, !alias.scope !9
  %58 = fadd <4 x float> %wide.load.1, %wide.load301.1
  %59 = fadd <4 x float> %wide.load300.1, %wide.load302.1
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %index.next
  %61 = bitcast float* %60 to <4 x float>*
  store <4 x float> %58, <4 x float>* %61, align 4, !alias.scope !11, !noalias !13
  %62 = getelementptr float, float* %60, i64 4
  %63 = bitcast float* %62 to <4 x float>*
  store <4 x float> %59, <4 x float>* %63, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %64 = icmp eq i64 %index.next.1, %n.vec
  br i1 %64, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv119150.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %65 = sub nsw i64 %1, %indvars.iv119150.us.ph
  %xtraiter353 = and i64 %65, 1
  %lcmp.mod354 = icmp eq i64 %xtraiter353, 0
  br i1 %lcmp.mod354, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us.ph
  %66 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us.ph
  %67 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %66, %67
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next120.us.prol = or i64 %indvars.iv119150.us.ph, 1
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.body94.us.preheader
  %indvars.iv119150.us.unr.ph = phi i64 [ %indvars.iv.next120.us.prol, %for.body94.us.prol ], [ %indvars.iv119150.us.ph, %for.body94.us.preheader ]
  %68 = icmp eq i64 %19, %indvars.iv119150.us.ph
  br i1 %68, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv119150.us = phi i64 [ %indvars.iv119150.us.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next120.us.1, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us
  %69 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us
  %70 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %69, %70
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %indvars.iv119150.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next120.us = add nuw nsw i64 %indvars.iv119150.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv121152.us, i64 %indvars.iv.next120.us
  %71 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv121152.us, i64 %indvars.iv.next120.us
  %72 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %71, %72
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv121152.us, i64 %indvars.iv.next120.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond177.1 = icmp eq i64 %indvars.iv.next120.us, %3
  %indvars.iv.next120.us.1 = add nsw i64 %indvars.iv119150.us, 2
  br i1 %exitcond177.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.body94.us.prol.loopexit, %middle.block
  %indvars.iv.next122.us = add nuw nsw i64 %indvars.iv121152.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next122.us, %2
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %for.cond58.preheader.thread189
  %mul21185200 = phi float [ %mul21191, %for.cond58.preheader.thread189 ], [ %mul21, %for.cond115.preheader.loopexit ]
  %mul25187198 = phi float [ %mul25192, %for.cond58.preheader.thread189 ], [ %mul25, %for.cond115.preheader.loopexit ]
  %cmp116146 = icmp sgt i32 %h, 0
  br i1 %cmp116146, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %73 = icmp sgt i32 %w, 0
  br i1 %73, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %74 = add nsw i64 %2, -1
  %mul126.us247 = fmul float %mul16, 0.000000e+00
  %mul128.us249 = fmul float %exp2, 0.000000e+00
  %mul130.us251 = fmul float %call29, -0.000000e+00
  %exitcond175254 = icmp eq i64 %74, 0
  %xtraiter349 = and i64 %74, 1
  %lcmp.mod350 = icmp eq i64 %xtraiter349, 0
  %75 = icmp eq i32 %w, 2
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv117147.us = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next118.us, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us245 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv117147.us
  %76 = load float, float* %arrayidx124.us245, align 4
  %mul125.us246 = fmul float %div, %76
  %add127.us248 = fadd float %mul126.us247, %mul125.us246
  %add129.us250 = fadd float %mul128.us249, %add127.us248
  %add131.us252 = fadd float %mul130.us251, %add129.us250
  %arrayidx135.us253 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv117147.us
  store float %add131.us252, float* %arrayidx135.us253, align 4
  br i1 %exitcond175254, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod350, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit, label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  %sunkaddr358 = mul i64 %indvars.iv117147.us, 4
  %sunkaddr359 = add i64 %sunkaddr, %sunkaddr358
  %sunkaddr360 = inttoptr i64 %sunkaddr359 to float*
  %77 = load float, float* %sunkaddr360, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv117147.us
  %78 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %78
  %mul126.us.prol = fmul float %mul16, %77
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us252
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv117147.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol, %for.body120.us.for.body120.us_crit_edge.preheader
  %add131.us257.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us252, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us256.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us245, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv115145.us255.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %.unr.ph = phi float [ %add131.us252, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  br i1 %75, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us257 = phi float [ %add131.us257.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us256 = phi float* [ %arrayidx124.us256.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv115145.us255 = phi i64 [ %indvars.iv115145.us255.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next116.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %79 = phi float [ %.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next116.us = add nuw nsw i64 %indvars.iv115145.us255, 1
  %80 = load float, float* %arrayidx124.us256, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next116.us, i64 %indvars.iv117147.us
  %81 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %81
  %mul126.us = fmul float %mul16, %80
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us257
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %79, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next116.us, i64 %indvars.iv117147.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next116.us.1 = add nsw i64 %indvars.iv115145.us255, 2
  %82 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next116.us.1, i64 %indvars.iv117147.us
  %83 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %83
  %mul126.us.1 = fmul float %mul16, %82
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us257, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next116.us.1, i64 %indvars.iv117147.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond175.1 = icmp eq i64 %indvars.iv.next116.us.1, %74
  br i1 %exitcond175.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next118.us = add nuw nsw i64 %indvars.iv117147.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next118.us, %1
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %indvars.iv.next112140.us231 = add nsw i64 %2, -1
  %mul157.us232 = fmul float %mul21185200, 0.000000e+00
  %mul158.us233 = fmul float %mul25187198, 0.000000e+00
  %add159.us234 = fadd float %mul157.us232, %mul158.us233
  %mul160.us235 = fmul float %exp2, 0.000000e+00
  %add161.us236 = fadd float %mul160.us235, %add159.us234
  %mul162.us237 = fmul float %call29, -0.000000e+00
  %add163.us238 = fadd float %mul162.us237, %add161.us236
  %cmp155.us241 = icmp sgt i32 %w, 1
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv113142.us = phi i64 [ %indvars.iv.next114.us, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us239 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next112140.us231, i64 %indvars.iv113142.us
  store float %add163.us238, float* %arrayidx167.us239, align 4
  br i1 %cmp155.us241, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.preheader, %for.body156.us.for.body156.us_crit_edge
  %indvars.iv.next112140.us231.pn = phi i64 [ %indvars.iv.next112140.us, %for.body156.us.for.body156.us_crit_edge ], [ %indvars.iv.next112140.us231, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %add163.us244 = phi float [ %add163.us, %for.body156.us.for.body156.us_crit_edge ], [ %add163.us238, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %84 = phi float [ %add163.us244, %for.body156.us.for.body156.us_crit_edge ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.sroa.0.0139.us242 = phi i32 [ %85, %for.body156.us.for.body156.us_crit_edge ], [ 0, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %.in.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next112140.us231.pn, i64 %indvars.iv113142.us
  %.in = bitcast float* %.in.in to i32*
  %85 = load i32, i32* %.in, align 4
  %86 = bitcast i32 %85 to float
  %indvars.iv.next112140.us = add nsw i64 %indvars.iv.next112140.us231.pn, -1
  %mul157.us = fmul float %mul21185200, %86
  %87 = bitcast i32 %tp1.sroa.0.0139.us242 to float
  %mul158.us = fmul float %87, %mul25187198
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us244
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %84, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next112140.us, i64 %indvars.iv113142.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next112140.us231.pn, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next114.us = add nuw nsw i64 %indvars.iv113142.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next114.us, %1
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %cmp116146216218 = phi i1 [ true, %for.cond115.preheader ], [ false, %for.cond182.preheader.loopexit ]
  %.not = icmp slt i32 %w, 1
  %brmerge = or i1 %.not, %cmp116146216218
  br i1 %brmerge, label %for.end207, label %for.cond185.preheader.us.preheader

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %88 = add nsw i64 %1, -1
  %89 = add nsw i64 %1, -8
  %90 = lshr i64 %89, 3
  %91 = add nsw i64 %1, -1
  %min.iters.check306 = icmp ult i32 %h, 8
  %n.vec309 = and i64 %1, -8
  %cmp.zero310 = icmp eq i64 %n.vec309, 0
  %92 = and i64 %90, 1
  %lcmp.mod = icmp eq i64 %92, 0
  %93 = icmp eq i64 %90, 0
  %cmp.n337 = icmp eq i64 %1, %n.vec309
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv109134.us = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next110.us, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep312 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 0
  %scevgep314 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %1
  %scevgep316 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 0
  %scevgep318 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %1
  %scevgep320 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 0
  %scevgep322 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %1
  br i1 %min.iters.check306, label %for.body187.us.preheader, label %min.iters.checked307

min.iters.checked307:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero310, label %for.body187.us.preheader, label %vector.memcheck332

vector.memcheck332:                               ; preds = %min.iters.checked307
  %bound0324 = icmp ult float* %scevgep312, %scevgep318
  %bound1325 = icmp ult float* %scevgep316, %scevgep314
  %found.conflict326 = and i1 %bound0324, %bound1325
  %bound0327 = icmp ult float* %scevgep312, %scevgep322
  %bound1328 = icmp ult float* %scevgep320, %scevgep314
  %found.conflict329 = and i1 %bound0327, %bound1328
  %conflict.rdx330 = or i1 %found.conflict326, %found.conflict329
  br i1 %conflict.rdx330, label %for.body187.us.preheader, label %vector.body303.preheader

vector.body303.preheader:                         ; preds = %vector.memcheck332
  br i1 %lcmp.mod, label %vector.body303.prol, label %vector.body303.prol.loopexit

vector.body303.prol:                              ; preds = %vector.body303.preheader
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 0
  %95 = bitcast float* %94 to <4 x float>*
  %wide.load342.prol = load <4 x float>, <4 x float>* %95, align 4, !alias.scope !16
  %96 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 4
  %97 = bitcast float* %96 to <4 x float>*
  %wide.load343.prol = load <4 x float>, <4 x float>* %97, align 4, !alias.scope !16
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 0
  %99 = bitcast float* %98 to <4 x float>*
  %wide.load344.prol = load <4 x float>, <4 x float>* %99, align 4, !alias.scope !19
  %100 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 4
  %101 = bitcast float* %100 to <4 x float>*
  %wide.load345.prol = load <4 x float>, <4 x float>* %101, align 4, !alias.scope !19
  %102 = fadd <4 x float> %wide.load342.prol, %wide.load344.prol
  %103 = fadd <4 x float> %wide.load343.prol, %wide.load345.prol
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 0
  %105 = bitcast float* %104 to <4 x float>*
  store <4 x float> %102, <4 x float>* %105, align 4, !alias.scope !21, !noalias !23
  %106 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 4
  %107 = bitcast float* %106 to <4 x float>*
  store <4 x float> %103, <4 x float>* %107, align 4, !alias.scope !21, !noalias !23
  br label %vector.body303.prol.loopexit

vector.body303.prol.loopexit:                     ; preds = %vector.body303.prol, %vector.body303.preheader
  %index334.unr.ph = phi i64 [ 8, %vector.body303.prol ], [ 0, %vector.body303.preheader ]
  br i1 %93, label %middle.block304, label %vector.body303.preheader.new

vector.body303.preheader.new:                     ; preds = %vector.body303.prol.loopexit
  br label %vector.body303

vector.body303:                                   ; preds = %vector.body303, %vector.body303.preheader.new
  %index334 = phi i64 [ %index334.unr.ph, %vector.body303.preheader.new ], [ %index.next335.1, %vector.body303 ]
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %index334
  %109 = bitcast float* %108 to <4 x float>*
  %wide.load342 = load <4 x float>, <4 x float>* %109, align 4, !alias.scope !16
  %110 = getelementptr float, float* %108, i64 4
  %111 = bitcast float* %110 to <4 x float>*
  %wide.load343 = load <4 x float>, <4 x float>* %111, align 4, !alias.scope !16
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %index334
  %113 = bitcast float* %112 to <4 x float>*
  %wide.load344 = load <4 x float>, <4 x float>* %113, align 4, !alias.scope !19
  %114 = getelementptr float, float* %112, i64 4
  %115 = bitcast float* %114 to <4 x float>*
  %wide.load345 = load <4 x float>, <4 x float>* %115, align 4, !alias.scope !19
  %116 = fadd <4 x float> %wide.load342, %wide.load344
  %117 = fadd <4 x float> %wide.load343, %wide.load345
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %index334
  %119 = bitcast float* %118 to <4 x float>*
  store <4 x float> %116, <4 x float>* %119, align 4, !alias.scope !21, !noalias !23
  %120 = getelementptr float, float* %118, i64 4
  %121 = bitcast float* %120 to <4 x float>*
  store <4 x float> %117, <4 x float>* %121, align 4, !alias.scope !21, !noalias !23
  %index.next335 = add i64 %index334, 8
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %index.next335
  %123 = bitcast float* %122 to <4 x float>*
  %wide.load342.1 = load <4 x float>, <4 x float>* %123, align 4, !alias.scope !16
  %124 = getelementptr float, float* %122, i64 4
  %125 = bitcast float* %124 to <4 x float>*
  %wide.load343.1 = load <4 x float>, <4 x float>* %125, align 4, !alias.scope !16
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %index.next335
  %127 = bitcast float* %126 to <4 x float>*
  %wide.load344.1 = load <4 x float>, <4 x float>* %127, align 4, !alias.scope !19
  %128 = getelementptr float, float* %126, i64 4
  %129 = bitcast float* %128 to <4 x float>*
  %wide.load345.1 = load <4 x float>, <4 x float>* %129, align 4, !alias.scope !19
  %130 = fadd <4 x float> %wide.load342.1, %wide.load344.1
  %131 = fadd <4 x float> %wide.load343.1, %wide.load345.1
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %index.next335
  %133 = bitcast float* %132 to <4 x float>*
  store <4 x float> %130, <4 x float>* %133, align 4, !alias.scope !21, !noalias !23
  %134 = getelementptr float, float* %132, i64 4
  %135 = bitcast float* %134 to <4 x float>*
  store <4 x float> %131, <4 x float>* %135, align 4, !alias.scope !21, !noalias !23
  %index.next335.1 = add i64 %index334, 16
  %136 = icmp eq i64 %index.next335.1, %n.vec309
  br i1 %136, label %middle.block304.loopexit, label %vector.body303, !llvm.loop !24

middle.block304.loopexit:                         ; preds = %vector.body303
  br label %middle.block304

middle.block304:                                  ; preds = %middle.block304.loopexit, %vector.body303.prol.loopexit
  br i1 %cmp.n337, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block304, %vector.memcheck332, %min.iters.checked307, %for.cond185.preheader.us
  %indvars.iv132.us.ph = phi i64 [ 0, %vector.memcheck332 ], [ 0, %min.iters.checked307 ], [ 0, %for.cond185.preheader.us ], [ %n.vec309, %middle.block304 ]
  %137 = sub nsw i64 %1, %indvars.iv132.us.ph
  %xtraiter347 = and i64 %137, 1
  %lcmp.mod348 = icmp eq i64 %xtraiter347, 0
  br i1 %lcmp.mod348, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %indvars.iv132.us.ph
  %138 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %indvars.iv132.us.ph
  %139 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %138, %139
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %indvars.iv132.us.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.us.prol = or i64 %indvars.iv132.us.ph, 1
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.body187.us.preheader
  %indvars.iv132.us.unr.ph = phi i64 [ %indvars.iv.next.us.prol, %for.body187.us.prol ], [ %indvars.iv132.us.ph, %for.body187.us.preheader ]
  %140 = icmp eq i64 %91, %indvars.iv132.us.ph
  br i1 %140, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv132.us = phi i64 [ %indvars.iv132.us.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.us.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %indvars.iv132.us
  %141 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %indvars.iv132.us
  %142 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %141, %142
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %indvars.iv132.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv132.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv109134.us, i64 %indvars.iv.next.us
  %143 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv109134.us, i64 %indvars.iv.next.us
  %144 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %143, %144
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv109134.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us, %88
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv132.us, 2
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.body187.us.prol.loopexit, %middle.block304
  %indvars.iv.next110.us = add nuw nsw i64 %indvars.iv109134.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next110.us, %2
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207.loopexit

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond182.preheader, %for.cond31.preheader.lr.ph, %for.cond118.preheader.lr.ph
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
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  %cmp12 = icmp sgt i32 %w, 0
  %cmp310 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp12, %cmp310
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv713.us = phi i64 [ %indvars.iv.next8.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv713.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv11.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %6 = add nsw i64 %indvars.iv11.us, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv713.us, i64 %indvars.iv11.us
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv713.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next8.us, %4
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

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

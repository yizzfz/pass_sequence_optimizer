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
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay4)
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
  %cmp8 = icmp sgt i32 %w, 0
  %cmp26 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.split.us, label %for.end9

for.cond1.preheader.lr.ph.split.us:               ; preds = %entry
  %0 = zext i32 %h to i64
  %1 = zext i32 %w to i64
  %min.iters.check = icmp ult i32 %h, 4
  %2 = and i32 %h, 3
  %n.mod.vf = zext i32 %2 to i64
  %n.vec = sub nsw i64 %0, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %2, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %for.cond1.preheader.lr.ph.split.us
  %indvars.iv3.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.split.us ], [ %indvars.iv.next4.us, %for.inc7.us ]
  %3 = mul nuw nsw i64 %indvars.iv3.us, 313
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
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv3.us, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc7.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %for.inc.us ], [ %indvars.iv.us.ph, %for.inc.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv.us, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv3.us, i64 %indvars.iv.us
  store float %div.us, float* %arrayidx6.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next.us, %0
  br i1 %exitcond8, label %for.inc7.us.loopexit, label %for.inc.us, !llvm.loop !4

for.inc7.us.loopexit:                             ; preds = %for.inc.us
  br label %for.inc7.us

for.inc7.us:                                      ; preds = %for.inc7.us.loopexit, %middle.block
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next4.us, %1
  br i1 %exitcond9, label %for.end9.loopexit, label %for.cond1.preheader.us

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
  br i1 %cmp32135, label %for.cond31.preheader.lr.ph.split.us, label %for.end207

for.cond31.preheader.lr.ph.split.us:              ; preds = %for.cond31.preheader.lr.ph
  %2 = zext i32 %h to i64
  %3 = zext i32 %w to i64
  %mul37.us255 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us257 = fmul float %exp2, 0.000000e+00
  %mul41.us259 = fmul float %call29, -0.000000e+00
  %exitcond187262 = icmp eq i32 %h, 1
  %4 = and i64 %2, 1
  %lcmp.mod333 = icmp eq i64 %4, 0
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  %5 = icmp eq i32 %h, 2
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.inc55.us, %for.cond31.preheader.lr.ph.split.us
  %indvars.iv175.us = phi i64 [ 0, %for.cond31.preheader.lr.ph.split.us ], [ %indvars.iv.next176.us, %for.inc55.us ]
  %arrayidx35.us253 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv175.us, i64 0
  %6 = load float, float* %arrayidx35.us253, align 4
  %mul36.us254 = fmul float %div, %6
  %add38.us256 = fadd float %mul37.us255, %mul36.us254
  %add40.us258 = fadd float %mul39.us257, %add38.us256
  %add42.us260 = fadd float %mul41.us259, %add40.us258
  %arrayidx46.us261 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv175.us, i64 0
  store float %add42.us260, float* %arrayidx46.us261, align 4
  br i1 %exitcond187262, label %for.inc55.us, label %for.inc.us.for.inc.us_crit_edge.preheader

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod333, label %for.inc.us.for.inc.us_crit_edge.prol.preheader, label %for.inc.us.for.inc.us_crit_edge.prol.loopexit.unr-lcssa

for.inc.us.for.inc.us_crit_edge.prol.preheader:   ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  br label %for.inc.us.for.inc.us_crit_edge.prol

for.inc.us.for.inc.us_crit_edge.prol:             ; preds = %for.inc.us.for.inc.us_crit_edge.prol.preheader
  %7 = load float, float* %arrayidx35.us253, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv175.us, i64 1
  %8 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %8
  %mul37.us.prol = fmul float %mul16.v.r1, %7
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us260
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv175.us, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit.unr-lcssa

for.inc.us.for.inc.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.inc.us.for.inc.us_crit_edge.preheader, %for.inc.us.for.inc.us_crit_edge.prol
  %indvars.iv.next172.us265.unr.ph = phi i64 [ 2, %for.inc.us.for.inc.us_crit_edge.prol ], [ 1, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %add42.us264.unr.ph = phi float [ %add42.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %add42.us260, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %arrayidx35.us263.unr.ph = phi float* [ %arrayidx35.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %arrayidx35.us253, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %.unr334.ph = phi float [ %add42.us260, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader ]
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol.loopexit:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %5, label %for.inc55.us.loopexit, label %for.inc.us.for.inc.us_crit_edge.preheader.new

for.inc.us.for.inc.us_crit_edge.preheader.new:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge, %for.inc.us.for.inc.us_crit_edge.preheader.new
  %indvars.iv.next172.us265 = phi i64 [ %indvars.iv.next172.us265.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %indvars.iv.next172.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %add42.us264 = phi float [ %add42.us264.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %arrayidx35.us263 = phi float* [ %arrayidx35.us263.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %9 = phi float [ %.unr334.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us, %for.inc.us.for.inc.us_crit_edge ]
  %10 = load float, float* %arrayidx35.us263, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv175.us, i64 %indvars.iv.next172.us265
  %11 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %11
  %mul37.us = fmul float %mul16.v.r1, %10
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us264
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %9, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv175.us, i64 %indvars.iv.next172.us265
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next172.us = add nuw nsw i64 %indvars.iv.next172.us265, 1
  %12 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv175.us, i64 %indvars.iv.next172.us
  %13 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %13
  %mul37.us.1 = fmul float %mul16.v.r1, %12
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us264, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv175.us, i64 %indvars.iv.next172.us
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %indvars.iv.next172.us.1 = add nsw i64 %indvars.iv.next172.us265, 2
  %exitcond187.1 = icmp eq i64 %indvars.iv.next172.us.1, %2
  br i1 %exitcond187.1, label %for.inc55.us.loopexit.unr-lcssa, label %for.inc.us.for.inc.us_crit_edge

for.inc55.us.loopexit.unr-lcssa:                  ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.inc55.us.loopexit

for.inc55.us.loopexit:                            ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit, %for.inc55.us.loopexit.unr-lcssa
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.cond31.preheader.us
  %indvars.iv.next176.us = add nuw nsw i64 %indvars.iv175.us, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next176.us, %3
  br i1 %exitcond188, label %for.cond62.preheader.lr.ph, label %for.cond31.preheader.us

for.cond62.preheader.lr.ph:                       ; preds = %for.inc55.us
  %14 = sext i32 %h to i64
  %indvars.iv165.us239 = add nsw i64 %14, -1
  %mul65.us240 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us241 = fmul float %1, -0.000000e+00
  %add67.us242 = fadd float %mul65.us240, %mul66.us241
  %mul68.us243 = fmul float %exp2, 0.000000e+00
  %add69.us244 = fadd float %mul68.us243, %add67.us242
  %mul70.us245 = fmul float %call29, -0.000000e+00
  %add71.us246 = fadd float %mul70.us245, %add69.us244
  %cmp63.us249 = icmp sgt i32 %h, 1
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.inc86.us, %for.cond62.preheader.lr.ph
  %indvars.iv167.us = phi i64 [ 0, %for.cond62.preheader.lr.ph ], [ %indvars.iv.next168.us, %for.inc86.us ]
  %arrayidx75.us247 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv167.us, i64 %indvars.iv165.us239
  store float %add71.us246, float* %arrayidx75.us247, align 4
  br i1 %cmp63.us249, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.inc86.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader, %for.inc84.us.for.inc84.us_crit_edge
  %indvars.iv165.us239.pn = phi i64 [ %indvars.iv165.us, %for.inc84.us.for.inc84.us_crit_edge ], [ %indvars.iv165.us239, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %add71.us252 = phi float [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge ], [ %add71.us246, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %15 = phi float [ %add71.us252, %for.inc84.us.for.inc84.us_crit_edge ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %xp1.sroa.0.0131.us250 = phi i32 [ %16, %for.inc84.us.for.inc84.us_crit_edge ], [ 0, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %.in327.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv167.us, i64 %indvars.iv165.us239.pn
  %.in327 = bitcast float* %.in327.in to i32*
  %16 = load i32, i32* %.in327, align 4
  %17 = bitcast i32 %16 to float
  %indvars.iv165.us = add nsw i64 %indvars.iv165.us239.pn, -1
  %mul65.us = fmul float %mul16.v.r2, %17
  %18 = bitcast i32 %xp1.sroa.0.0131.us250 to float
  %mul66.us = fmul float %18, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us252
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %15, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv167.us, i64 %indvars.iv165.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv165.us239.pn, 1
  br i1 %cmp63.us, label %for.inc84.us.for.inc84.us_crit_edge, label %for.inc86.us.loopexit

for.inc86.us.loopexit:                            ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.inc86.us

for.inc86.us:                                     ; preds = %for.inc86.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next168.us = add nuw nsw i64 %indvars.iv167.us, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next168.us, %3
  br i1 %exitcond186, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.inc86.us
  %19 = add nsw i64 %2, -1
  %min.iters.check = icmp ult i32 %h, 8
  %20 = and i32 %h, 7
  %n.mod.vf = zext i32 %20 to i64
  %n.vec = sub nsw i64 %2, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %20, 0
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.inc112.us
  %indvars.iv161.us = phi i64 [ %indvars.iv.next162.us, %for.inc112.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 0
  %scevgep267 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 %2
  %scevgep269 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 0
  %scevgep271 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 %2
  %scevgep273 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 0
  %scevgep275 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 %2
  br i1 %min.iters.check, label %for.inc109.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.inc109.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep271
  %bound1 = icmp ult float* %scevgep269, %scevgep267
  %found.conflict = and i1 %bound0, %bound1
  %bound0277 = icmp ult float* %scevgep, %scevgep275
  %bound1278 = icmp ult float* %scevgep273, %scevgep267
  %found.conflict279 = and i1 %bound0277, %bound1278
  %conflict.rdx = or i1 %found.conflict, %found.conflict279
  br i1 %conflict.rdx, label %for.inc109.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 %index
  %22 = bitcast float* %21 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %22, align 4, !alias.scope !6
  %23 = getelementptr float, float* %21, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load281 = load <4 x float>, <4 x float>* %24, align 4, !alias.scope !6
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 %index
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load282 = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !9
  %27 = getelementptr float, float* %25, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load283 = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !9
  %29 = fadd <4 x float> %wide.load, %wide.load282
  %30 = fadd <4 x float> %wide.load281, %wide.load283
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 %index
  %32 = bitcast float* %31 to <4 x float>*
  store <4 x float> %29, <4 x float>* %32, align 4, !alias.scope !11, !noalias !13
  %33 = getelementptr float, float* %31, i64 4
  %34 = bitcast float* %33 to <4 x float>*
  store <4 x float> %30, <4 x float>* %34, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %35 = icmp eq i64 %index.next, %n.vec
  br i1 %35, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc112.us, label %for.inc109.us.preheader

for.inc109.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv157.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %36 = sub nsw i64 %2, %indvars.iv157.us.ph
  %xtraiter330 = and i64 %36, 1
  %lcmp.mod331 = icmp eq i64 %xtraiter330, 0
  br i1 %lcmp.mod331, label %for.inc109.us.prol.loopexit.unr-lcssa, label %for.inc109.us.prol.preheader

for.inc109.us.prol.preheader:                     ; preds = %for.inc109.us.preheader
  br label %for.inc109.us.prol

for.inc109.us.prol:                               ; preds = %for.inc109.us.prol.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 %indvars.iv157.us.ph
  %37 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 %indvars.iv157.us.ph
  %38 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %37, %38
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 %indvars.iv157.us.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next158.us.prol = add nuw nsw i64 %indvars.iv157.us.ph, 1
  br label %for.inc109.us.prol.loopexit.unr-lcssa

for.inc109.us.prol.loopexit.unr-lcssa:            ; preds = %for.inc109.us.preheader, %for.inc109.us.prol
  %indvars.iv157.us.unr.ph = phi i64 [ %indvars.iv.next158.us.prol, %for.inc109.us.prol ], [ %indvars.iv157.us.ph, %for.inc109.us.preheader ]
  br label %for.inc109.us.prol.loopexit

for.inc109.us.prol.loopexit:                      ; preds = %for.inc109.us.prol.loopexit.unr-lcssa
  %39 = icmp eq i64 %19, %indvars.iv157.us.ph
  br i1 %39, label %for.inc112.us.loopexit, label %for.inc109.us.preheader.new

for.inc109.us.preheader.new:                      ; preds = %for.inc109.us.prol.loopexit
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us, %for.inc109.us.preheader.new
  %indvars.iv157.us = phi i64 [ %indvars.iv157.us.unr.ph, %for.inc109.us.preheader.new ], [ %indvars.iv.next158.us.1, %for.inc109.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 %indvars.iv157.us
  %40 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 %indvars.iv157.us
  %41 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %40, %41
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 %indvars.iv157.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next158.us = add nuw nsw i64 %indvars.iv157.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv161.us, i64 %indvars.iv.next158.us
  %42 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv161.us, i64 %indvars.iv.next158.us
  %43 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %42, %43
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv161.us, i64 %indvars.iv.next158.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next158.us.1 = add nsw i64 %indvars.iv157.us, 2
  %exitcond184.1 = icmp eq i64 %indvars.iv.next158.us.1, %2
  br i1 %exitcond184.1, label %for.inc112.us.loopexit.unr-lcssa, label %for.inc109.us, !llvm.loop !15

for.inc112.us.loopexit.unr-lcssa:                 ; preds = %for.inc109.us
  br label %for.inc112.us.loopexit

for.inc112.us.loopexit:                           ; preds = %for.inc109.us.prol.loopexit, %for.inc112.us.loopexit.unr-lcssa
  br label %for.inc112.us

for.inc112.us:                                    ; preds = %for.inc112.us.loopexit, %middle.block
  %indvars.iv.next162.us = add nuw nsw i64 %indvars.iv161.us, 1
  %exitcond185 = icmp eq i64 %indvars.iv.next162.us, %3
  br i1 %exitcond185, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.inc112.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp116122 = icmp sgt i32 %h, 0
  br i1 %cmp116122, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 %cmp137, label %for.cond118.preheader.lr.ph.split.us, label %for.end207

for.cond118.preheader.lr.ph.split.us:             ; preds = %for.cond118.preheader.lr.ph
  %44 = zext i32 %w to i64
  %45 = zext i32 %h to i64
  %mul126.us228 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us230 = fmul float %exp2, 0.000000e+00
  %mul130.us232 = fmul float %call29, -0.000000e+00
  %exitcond182235 = icmp eq i32 %w, 1
  %46 = and i64 %44, 1
  %lcmp.mod329 = icmp eq i64 %46, 0
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  %47 = icmp eq i32 %w, 2
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.inc147.us, %for.cond118.preheader.lr.ph.split.us
  %indvars.iv153.us = phi i64 [ 0, %for.cond118.preheader.lr.ph.split.us ], [ %indvars.iv.next154.us, %for.inc147.us ]
  %arrayidx124.us226 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv153.us
  %48 = load float, float* %arrayidx124.us226, align 4
  %mul125.us227 = fmul float %div, %48
  %add127.us229 = fadd float %mul126.us228, %mul125.us227
  %add129.us231 = fadd float %mul128.us230, %add127.us229
  %add131.us233 = fadd float %mul130.us232, %add129.us231
  %arrayidx135.us234 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv153.us
  store float %add131.us233, float* %arrayidx135.us234, align 4
  br i1 %exitcond182235, label %for.inc147.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod329, label %for.inc144.us.for.inc144.us_crit_edge.prol.preheader, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.unr-lcssa

for.inc144.us.for.inc144.us_crit_edge.prol.preheader: ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  br label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.preheader
  %49 = load float, float* %arrayidx124.us226, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv153.us
  %50 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %50
  %mul126.us.prol = fmul float %mul16.v.r1, %49
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us233
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv153.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.unr-lcssa

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader, %for.inc144.us.for.inc144.us_crit_edge.prol
  %indvars.iv.next150.us238.unr.ph = phi i64 [ 2, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 1, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %add131.us237.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us233, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %arrayidx124.us236.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us226, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %.unr.ph = phi float [ %add131.us233, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %47, label %for.inc147.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %indvars.iv.next150.us238 = phi i64 [ %indvars.iv.next150.us238.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next150.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %add131.us237 = phi float [ %add131.us237.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %arrayidx124.us236 = phi float* [ %arrayidx124.us236.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %51 = phi float [ %.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge ]
  %52 = load float, float* %arrayidx124.us236, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next150.us238, i64 %indvars.iv153.us
  %53 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %53
  %mul126.us = fmul float %mul16.v.r1, %52
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us237
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %51, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next150.us238, i64 %indvars.iv153.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next150.us = add nuw nsw i64 %indvars.iv.next150.us238, 1
  %54 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next150.us, i64 %indvars.iv153.us
  %55 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %55
  %mul126.us.1 = fmul float %mul16.v.r1, %54
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us237, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next150.us, i64 %indvars.iv153.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %indvars.iv.next150.us.1 = add nsw i64 %indvars.iv.next150.us238, 2
  %exitcond182.1 = icmp eq i64 %indvars.iv.next150.us.1, %44
  br i1 %exitcond182.1, label %for.inc147.us.loopexit.unr-lcssa, label %for.inc144.us.for.inc144.us_crit_edge

for.inc147.us.loopexit.unr-lcssa:                 ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.inc147.us.loopexit

for.inc147.us.loopexit:                           ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, %for.inc147.us.loopexit.unr-lcssa
  br label %for.inc147.us

for.inc147.us:                                    ; preds = %for.inc147.us.loopexit, %for.cond118.preheader.us
  %indvars.iv.next154.us = add nuw nsw i64 %indvars.iv153.us, 1
  %exitcond183 = icmp eq i64 %indvars.iv.next154.us, %45
  br i1 %exitcond183, label %for.cond154.preheader.lr.ph, label %for.cond118.preheader.us

for.cond154.preheader.lr.ph:                      ; preds = %for.inc147.us
  %56 = sext i32 %w to i64
  %indvars.iv143.us212 = add nsw i64 %56, -1
  %mul157.us213 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us214 = fmul float %1, -0.000000e+00
  %add159.us215 = fadd float %mul157.us213, %mul158.us214
  %mul160.us216 = fmul float %exp2, 0.000000e+00
  %add161.us217 = fadd float %mul160.us216, %add159.us215
  %mul162.us218 = fmul float %call29, -0.000000e+00
  %add163.us219 = fadd float %mul162.us218, %add161.us217
  %cmp155.us222 = icmp sgt i32 %w, 1
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.inc179.us, %for.cond154.preheader.lr.ph
  %indvars.iv145.us = phi i64 [ 0, %for.cond154.preheader.lr.ph ], [ %indvars.iv.next146.us, %for.inc179.us ]
  %arrayidx167.us220 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv143.us212, i64 %indvars.iv145.us
  store float %add163.us219, float* %arrayidx167.us220, align 4
  br i1 %cmp155.us222, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.inc179.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader, %for.inc176.us.for.inc176.us_crit_edge
  %indvars.iv143.us212.pn = phi i64 [ %indvars.iv143.us, %for.inc176.us.for.inc176.us_crit_edge ], [ %indvars.iv143.us212, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %add163.us225 = phi float [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge ], [ %add163.us219, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %57 = phi float [ %add163.us225, %for.inc176.us.for.inc176.us_crit_edge ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %tp1.sroa.0.0116.us223 = phi i32 [ %58, %for.inc176.us.for.inc176.us_crit_edge ], [ 0, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %.in.in = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv143.us212.pn, i64 %indvars.iv145.us
  %.in = bitcast float* %.in.in to i32*
  %58 = load i32, i32* %.in, align 4
  %59 = bitcast i32 %58 to float
  %indvars.iv143.us = add nsw i64 %indvars.iv143.us212.pn, -1
  %mul157.us = fmul float %mul16.v.r2, %59
  %60 = bitcast i32 %tp1.sroa.0.0116.us223 to float
  %mul158.us = fmul float %60, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us225
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %57, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv143.us, i64 %indvars.iv145.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv143.us212.pn, 1
  br i1 %cmp155.us, label %for.inc176.us.for.inc176.us_crit_edge, label %for.inc179.us.loopexit

for.inc179.us.loopexit:                           ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.inc179.us

for.inc179.us:                                    ; preds = %for.inc179.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next146.us = add nuw nsw i64 %indvars.iv145.us, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next146.us, %45
  br i1 %exitcond181, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.inc179.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %cmp116122201203 = phi i1 [ true, %for.cond115.preheader ], [ false, %for.cond182.preheader.loopexit ]
  %cmp137.not = icmp slt i32 %w, 1
  %brmerge = or i1 %cmp137.not, %cmp116122201203
  br i1 %brmerge, label %for.end207, label %for.cond185.preheader.lr.ph.split.us

for.cond185.preheader.lr.ph.split.us:             ; preds = %for.cond182.preheader
  %61 = zext i32 %h to i64
  %62 = zext i32 %w to i64
  %63 = add nsw i64 %61, -1
  %min.iters.check287 = icmp ult i32 %h, 8
  %64 = and i32 %h, 7
  %n.mod.vf289 = zext i32 %64 to i64
  %n.vec290 = sub nsw i64 %61, %n.mod.vf289
  %cmp.zero291 = icmp eq i64 %n.vec290, 0
  %cmp.n318 = icmp eq i32 %64, 0
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.inc205.us, %for.cond185.preheader.lr.ph.split.us
  %indvars.iv139.us = phi i64 [ 0, %for.cond185.preheader.lr.ph.split.us ], [ %indvars.iv.next140.us, %for.inc205.us ]
  %scevgep293 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 0
  %scevgep295 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 %61
  %scevgep297 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 0
  %scevgep299 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 %61
  %scevgep301 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 0
  %scevgep303 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 %61
  br i1 %min.iters.check287, label %for.inc202.us.preheader, label %min.iters.checked288

min.iters.checked288:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero291, label %for.inc202.us.preheader, label %vector.memcheck313

vector.memcheck313:                               ; preds = %min.iters.checked288
  %bound0305 = icmp ult float* %scevgep293, %scevgep299
  %bound1306 = icmp ult float* %scevgep297, %scevgep295
  %found.conflict307 = and i1 %bound0305, %bound1306
  %bound0308 = icmp ult float* %scevgep293, %scevgep303
  %bound1309 = icmp ult float* %scevgep301, %scevgep295
  %found.conflict310 = and i1 %bound0308, %bound1309
  %conflict.rdx311 = or i1 %found.conflict307, %found.conflict310
  br i1 %conflict.rdx311, label %for.inc202.us.preheader, label %vector.body284.preheader

vector.body284.preheader:                         ; preds = %vector.memcheck313
  br label %vector.body284

vector.body284:                                   ; preds = %vector.body284.preheader, %vector.body284
  %index315 = phi i64 [ %index.next316, %vector.body284 ], [ 0, %vector.body284.preheader ]
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 %index315
  %66 = bitcast float* %65 to <4 x float>*
  %wide.load323 = load <4 x float>, <4 x float>* %66, align 4, !alias.scope !16
  %67 = getelementptr float, float* %65, i64 4
  %68 = bitcast float* %67 to <4 x float>*
  %wide.load324 = load <4 x float>, <4 x float>* %68, align 4, !alias.scope !16
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 %index315
  %70 = bitcast float* %69 to <4 x float>*
  %wide.load325 = load <4 x float>, <4 x float>* %70, align 4, !alias.scope !19
  %71 = getelementptr float, float* %69, i64 4
  %72 = bitcast float* %71 to <4 x float>*
  %wide.load326 = load <4 x float>, <4 x float>* %72, align 4, !alias.scope !19
  %73 = fadd <4 x float> %wide.load323, %wide.load325
  %74 = fadd <4 x float> %wide.load324, %wide.load326
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 %index315
  %76 = bitcast float* %75 to <4 x float>*
  store <4 x float> %73, <4 x float>* %76, align 4, !alias.scope !21, !noalias !23
  %77 = getelementptr float, float* %75, i64 4
  %78 = bitcast float* %77 to <4 x float>*
  store <4 x float> %74, <4 x float>* %78, align 4, !alias.scope !21, !noalias !23
  %index.next316 = add i64 %index315, 8
  %79 = icmp eq i64 %index.next316, %n.vec290
  br i1 %79, label %middle.block285, label %vector.body284, !llvm.loop !24

middle.block285:                                  ; preds = %vector.body284
  br i1 %cmp.n318, label %for.inc205.us, label %for.inc202.us.preheader

for.inc202.us.preheader:                          ; preds = %middle.block285, %vector.memcheck313, %min.iters.checked288, %for.cond185.preheader.us
  %indvars.iv.us.ph = phi i64 [ 0, %vector.memcheck313 ], [ 0, %min.iters.checked288 ], [ 0, %for.cond185.preheader.us ], [ %n.vec290, %middle.block285 ]
  %80 = sub nsw i64 %61, %indvars.iv.us.ph
  %xtraiter = and i64 %80, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc202.us.prol.loopexit.unr-lcssa, label %for.inc202.us.prol.preheader

for.inc202.us.prol.preheader:                     ; preds = %for.inc202.us.preheader
  br label %for.inc202.us.prol

for.inc202.us.prol:                               ; preds = %for.inc202.us.prol.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 %indvars.iv.us.ph
  %81 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 %indvars.iv.us.ph
  %82 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %81, %82
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 %indvars.iv.us.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv.us.ph, 1
  br label %for.inc202.us.prol.loopexit.unr-lcssa

for.inc202.us.prol.loopexit.unr-lcssa:            ; preds = %for.inc202.us.preheader, %for.inc202.us.prol
  %indvars.iv.us.unr.ph = phi i64 [ %indvars.iv.next.us.prol, %for.inc202.us.prol ], [ %indvars.iv.us.ph, %for.inc202.us.preheader ]
  br label %for.inc202.us.prol.loopexit

for.inc202.us.prol.loopexit:                      ; preds = %for.inc202.us.prol.loopexit.unr-lcssa
  %83 = icmp eq i64 %63, %indvars.iv.us.ph
  br i1 %83, label %for.inc205.us.loopexit, label %for.inc202.us.preheader.new

for.inc202.us.preheader.new:                      ; preds = %for.inc202.us.prol.loopexit
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us, %for.inc202.us.preheader.new
  %indvars.iv.us = phi i64 [ %indvars.iv.us.unr.ph, %for.inc202.us.preheader.new ], [ %indvars.iv.next.us.1, %for.inc202.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 %indvars.iv.us
  %84 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 %indvars.iv.us
  %85 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %84, %85
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 %indvars.iv.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139.us, i64 %indvars.iv.next.us
  %86 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv139.us, i64 %indvars.iv.next.us
  %87 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %86, %87
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv139.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next.us.1, %61
  br i1 %exitcond179.1, label %for.inc205.us.loopexit.unr-lcssa, label %for.inc202.us, !llvm.loop !25

for.inc205.us.loopexit.unr-lcssa:                 ; preds = %for.inc202.us
  br label %for.inc205.us.loopexit

for.inc205.us.loopexit:                           ; preds = %for.inc202.us.prol.loopexit, %for.inc205.us.loopexit.unr-lcssa
  br label %for.inc205.us

for.inc205.us:                                    ; preds = %for.inc205.us.loopexit, %middle.block285
  %indvars.iv.next140.us = add nuw nsw i64 %indvars.iv139.us, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next140.us, %62
  br i1 %exitcond180, label %for.end207.loopexit, label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.inc205.us
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond182.preheader, %for.cond118.preheader.lr.ph, %for.cond31.preheader.lr.ph
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp9 = icmp sgt i32 %w, 0
  br i1 %cmp9, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp37 = icmp sgt i32 %h, 0
  %3 = sext i32 %h to i64
  br i1 %cmp37, label %for.cond2.preheader.lr.ph.split.us, label %for.end12

for.cond2.preheader.lr.ph.split.us:               ; preds = %for.cond2.preheader.lr.ph
  %4 = zext i32 %h to i64
  %5 = zext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.lr.ph.split.us
  %indvars.iv12.us = phi i64 [ 0, %for.cond2.preheader.lr.ph.split.us ], [ %indvars.iv.next13.us, %for.inc10.us ]
  %6 = mul nsw i64 %indvars.iv12.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %7 = add nsw i64 %indvars.iv.us, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv12.us, i64 %indvars.iv.us
  %11 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %11 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next.us, %4
  br i1 %exitcond17, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv12.us, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next13.us, %5
  br i1 %exitcond18, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %for.cond2.preheader.lr.ph, %entry
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #6
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

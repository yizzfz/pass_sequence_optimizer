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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [2160 x float]*
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %entry.for.end9_crit_edge

entry.for.end9_crit_edge:                         ; preds = %entry
  br label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %1 = sext i32 %h to i64
  %2 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv39.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next4.us, %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv39.us, 313
  br i1 %min.iters.check, label %for.cond1.preheader.us.for.body3.us_crit_edge, label %min.iters.checked

for.cond1.preheader.us.for.body3.us_crit_edge:    ; preds = %for.cond1.preheader.us
  br label %for.body3.us.preheader

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.for.body3.us_crit_edge, label %vector.ph

min.iters.checked.for.body3.us_crit_edge:         ; preds = %min.iters.checked
  br label %for.body3.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
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
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, label %middle.block.for.body3.us_crit_edge

middle.block.for.body3.us_crit_edge:              ; preds = %middle.block
  br label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.cond1.preheader.us.for.body3.us_crit_edge, %min.iters.checked.for.body3.us_crit_edge, %middle.block.for.body3.us_crit_edge
  %indvars.iv7.us.ph = phi i64 [ 0, %min.iters.checked.for.body3.us_crit_edge ], [ 0, %for.cond1.preheader.us.for.body3.us_crit_edge ], [ %n.vec, %middle.block.for.body3.us_crit_edge ]
  br label %for.body3.us

middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond1.for.inc7_crit_edge.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us.for.body3.us_crit_edge
  %indvars.iv7.us = phi i64 [ %indvars.iv.next.us, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv7.us.ph, %for.body3.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv7.us, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv39.us, i64 %indvars.iv7.us
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv7.us, %2
  br i1 %exitcond, label %for.body3.us.for.cond1.for.inc7_crit_edge.us_crit_edge, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !4

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  br label %for.body3.us

for.body3.us.for.cond1.for.inc7_crit_edge.us_crit_edge: ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us.for.cond1.for.inc7_crit_edge.us_crit_edge, %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv39.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next4.us, %0
  br i1 %cmp.us, label %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge, label %for.cond1.for.inc7_crit_edge.us.for.end9_crit_edge

for.cond1.for.inc7_crit_edge.us.for.end9_crit_edge: ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond1.preheader.us

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us.for.end9_crit_edge, %entry.for.end9_crit_edge
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
  %cmp66 = icmp sgt i32 %w, 0
  br i1 %cmp66, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread92

for.cond58.preheader.thread92:                    ; preds = %entry
  %mul1993 = fmul float %call18, %div
  %mul2194 = fmul float %add20, %mul1993
  %mul2595 = fsub float -0.000000e+00, %0
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp3261 = icmp sgt i32 %h, 0
  br i1 %cmp3261, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.end207_crit_edge

for.cond31.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond31.preheader.lr.ph
  br label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %3 = add nsw i64 %1, -1
  %mul37.us175 = fmul float %mul16, 0.000000e+00
  %mul39.us177 = fmul float %exp2, 0.000000e+00
  %mul41.us179 = fmul float %call29, -0.000000e+00
  %exitcond82182 = icmp eq i64 %3, 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge, %for.cond31.preheader.us.preheader
  %indvars.iv2167.us = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next22.us, %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge ]
  %arrayidx35.us173 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 0
  %4 = load float, float* %arrayidx35.us173, align 4
  %mul36.us174 = fmul float %div, %4
  %add38.us176 = fadd float %mul37.us175, %mul36.us174
  %add40.us178 = fadd float %mul39.us177, %add38.us176
  %add42.us180 = fadd float %mul41.us179, %add40.us178
  %arrayidx46.us181 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 0
  store float %add42.us180, float* %arrayidx46.us181, align 4
  br i1 %exitcond82182, label %for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge

for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge: ; preds = %for.cond31.preheader.us
  br label %for.body33.us.for.body33.us_crit_edge

for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.cond31.preheader.us
  br label %for.cond31.for.inc55_crit_edge.us

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge, %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge
  %add42.us186 = phi float [ %add42.us, %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge ], [ %add42.us180, %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge ]
  %arrayidx35.us185 = phi float* [ %arrayidx35.us, %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge ], [ %arrayidx35.us173, %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge ]
  %indvars.iv1962.us184 = phi i64 [ %indvars.iv.next20.us, %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge ], [ 0, %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge ]
  %ym1.063.us183 = phi float [ %add42.us186, %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond31.preheader.us.for.body33.us.for.body33.us_crit_edge_crit_edge ]
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1962.us184, 1
  %5 = load float, float* %arrayidx35.us185, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  %6 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %6
  %mul37.us = fmul float %mul16, %5
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us186
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.063.us183, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond82 = icmp eq i64 %indvars.iv.next20.us, %3
  br i1 %exitcond82, label %for.body33.us.for.body33.us_crit_edge.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge

for.body33.us.for.body33.us_crit_edge.for.body33.us.for.body33.us_crit_edge_crit_edge: ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us.for.body33.us_crit_edge.for.cond31.for.inc55_crit_edge.us_crit_edge, %for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2167.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next22.us, %2
  br i1 %cmp.us, label %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge, label %for.cond58.preheader

for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge: ; preds = %for.cond31.for.inc55_crit_edge.us
  br label %for.cond31.preheader.us

for.cond58.preheader:                             ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  %7 = sext i32 %w to i64
  %cmp5958 = icmp sgt i32 %w, 0
  br i1 %cmp5958, label %for.cond62.preheader.lr.ph, label %for.cond58.preheader.for.cond115.preheader_crit_edge

for.cond58.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond58.preheader
  br label %for.cond115.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader
  %8 = sext i32 %h to i64
  %cmp6352 = icmp sgt i32 %h, 0
  br i1 %cmp6352, label %for.cond62.preheader.lr.ph.for.cond62.preheader.us_crit_edge, label %for.cond62.preheader.lr.ph.for.end207_crit_edge

for.cond62.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond62.preheader.lr.ph
  br label %for.end207

for.cond62.preheader.lr.ph.for.cond62.preheader.us_crit_edge: ; preds = %for.cond62.preheader.lr.ph
  %indvars.iv.next1657.us159 = add nsw i64 %8, -1
  %mul65.us160 = fmul float %mul21, 0.000000e+00
  %mul66.us161 = fmul float %0, -0.000000e+00
  %add67.us162 = fadd float %mul65.us160, %mul66.us161
  %mul68.us163 = fmul float %exp2, 0.000000e+00
  %add69.us164 = fadd float %add67.us162, %mul68.us163
  %mul70.us165 = fmul float %call29, -0.000000e+00
  %add71.us166 = fadd float %add69.us164, %mul70.us165
  %cmp63.us168 = icmp sgt i32 %h, 1
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge, %for.cond62.preheader.lr.ph.for.cond62.preheader.us_crit_edge
  %indvars.iv1759.us = phi i64 [ %indvars.iv.next18.us, %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge ], [ 0, %for.cond62.preheader.lr.ph.for.cond62.preheader.us_crit_edge ]
  %arrayidx75.us167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us159
  store float %add71.us166, float* %arrayidx75.us167, align 4
  br i1 %cmp63.us168, label %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge, label %for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge

for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge: ; preds = %for.cond62.preheader.us
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge: ; preds = %for.cond62.preheader.us
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge, %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge
  %add71.us172 = phi float [ %add71.us, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ], [ %add71.us166, %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %indvars.iv.next1657.us171 = phi i64 [ %indvars.iv.next1657.us, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ], [ %indvars.iv.next1657.us159, %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %xp1.053.us170 = phi float [ %9, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %yp1.055.us169 = phi float [ %add71.us172, %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond62.preheader.us.for.body64.us.for.body64.us_crit_edge_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us171
  %9 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next1657.us = add nsw i64 %indvars.iv.next1657.us171, -1
  %mul65.us = fmul float %mul21, %9
  %mul66.us = fmul float %xp1.053.us170, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us172
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.055.us169, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next1657.us171, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge, label %for.body64.us.for.body64.us_crit_edge.for.cond62.for.inc86_crit_edge.us_crit_edge

for.body64.us.for.body64.us_crit_edge.for.cond62.for.inc86_crit_edge.us_crit_edge: ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.for.body64.us.for.body64.us_crit_edge_crit_edge: ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.body64.us.for.body64.us_crit_edge

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us.for.body64.us_crit_edge.for.cond62.for.inc86_crit_edge.us_crit_edge, %for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1759.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next18.us, %7
  br i1 %cmp59.us, label %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge, label %for.cond89.preheader

for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge: ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond62.preheader.us

for.cond89.preheader:                             ; preds = %for.cond62.for.inc86_crit_edge.us
  %10 = sext i32 %h to i64
  %11 = sext i32 %w to i64
  %cmp9048 = icmp sgt i32 %w, 0
  br i1 %cmp9048, label %for.cond92.preheader.lr.ph, label %for.cond89.preheader.for.cond115.preheader_crit_edge

for.cond89.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond89.preheader
  br label %for.cond115.preheader

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  %cmp9346 = icmp sgt i32 %h, 0
  br i1 %cmp9346, label %for.cond92.preheader.us.preheader, label %for.cond92.preheader.lr.ph.for.end207_crit_edge

for.cond92.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond92.preheader.lr.ph
  br label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  %12 = add nsw i64 %10, -1
  %min.iters.check = icmp ult i32 %h, 8
  %n.vec = and i64 %1, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge, %for.cond92.preheader.us.preheader
  %indvars.iv1349.us = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next14.us, %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 0
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %1
  %scevgep190 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 0
  %scevgep192 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %1
  %scevgep194 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 0
  %scevgep196 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %1
  br i1 %min.iters.check, label %for.cond92.preheader.us.for.body94.us_crit_edge, label %min.iters.checked

for.cond92.preheader.us.for.body94.us_crit_edge:  ; preds = %for.cond92.preheader.us
  br label %for.body94.us.preheader

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.for.body94.us_crit_edge, label %vector.memcheck

min.iters.checked.for.body94.us_crit_edge:        ; preds = %min.iters.checked
  br label %for.body94.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep192
  %bound1 = icmp ult float* %scevgep190, %scevgep188
  %found.conflict = and i1 %bound0, %bound1
  %bound0198 = icmp ult float* %scevgep, %scevgep196
  %bound1199 = icmp ult float* %scevgep194, %scevgep188
  %found.conflict200 = and i1 %bound0198, %bound1199
  %conflict.rdx = or i1 %found.conflict, %found.conflict200
  br i1 %conflict.rdx, label %vector.memcheck.for.body94.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.for.body94.us_crit_edge:          ; preds = %vector.memcheck
  br label %for.body94.us.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %13 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %index
  %14 = bitcast float* %13 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %14, align 4, !alias.scope !6
  %15 = getelementptr float, float* %13, i64 4
  %16 = bitcast float* %15 to <4 x float>*
  %wide.load202 = load <4 x float>, <4 x float>* %16, align 4, !alias.scope !6
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %index
  %18 = bitcast float* %17 to <4 x float>*
  %wide.load203 = load <4 x float>, <4 x float>* %18, align 4, !alias.scope !9
  %19 = getelementptr float, float* %17, i64 4
  %20 = bitcast float* %19 to <4 x float>*
  %wide.load204 = load <4 x float>, <4 x float>* %20, align 4, !alias.scope !9
  %21 = fadd <4 x float> %wide.load, %wide.load203
  %22 = fadd <4 x float> %wide.load202, %wide.load204
  %23 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %index
  %24 = bitcast float* %23 to <4 x float>*
  store <4 x float> %21, <4 x float>* %24, align 4, !alias.scope !11, !noalias !13
  %25 = getelementptr float, float* %23, i64 4
  %26 = bitcast float* %25 to <4 x float>*
  store <4 x float> %22, <4 x float>* %26, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %27 = icmp eq i64 %index.next, %n.vec
  br i1 %27, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge, label %middle.block.for.body94.us_crit_edge

middle.block.for.body94.us_crit_edge:             ; preds = %middle.block
  br label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %for.cond92.preheader.us.for.body94.us_crit_edge, %min.iters.checked.for.body94.us_crit_edge, %vector.memcheck.for.body94.us_crit_edge, %middle.block.for.body94.us_crit_edge
  %indvars.iv1147.us.ph = phi i64 [ 0, %vector.memcheck.for.body94.us_crit_edge ], [ 0, %min.iters.checked.for.body94.us_crit_edge ], [ 0, %for.cond92.preheader.us.for.body94.us_crit_edge ], [ %n.vec, %middle.block.for.body94.us_crit_edge ]
  br label %for.body94.us

middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond92.for.inc112_crit_edge.us

for.body94.us:                                    ; preds = %for.body94.us.preheader, %for.body94.us.for.body94.us_crit_edge
  %indvars.iv1147.us = phi i64 [ %indvars.iv.next12.us, %for.body94.us.for.body94.us_crit_edge ], [ %indvars.iv1147.us.ph, %for.body94.us.preheader ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %28 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %29 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %28, %29
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %exitcond79 = icmp eq i64 %indvars.iv1147.us, %12
  br i1 %exitcond79, label %for.body94.us.for.cond92.for.inc112_crit_edge.us_crit_edge, label %for.body94.us.for.body94.us_crit_edge, !llvm.loop !15

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1147.us, 1
  br label %for.body94.us

for.body94.us.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.body94.us.for.cond92.for.inc112_crit_edge.us_crit_edge, %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1349.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next14.us, %11
  br i1 %cmp90.us, label %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge, label %for.cond92.for.inc112_crit_edge.us.for.cond115.preheader_crit_edge

for.cond92.for.inc112_crit_edge.us.for.cond115.preheader_crit_edge: ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge: ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond92.preheader.us

for.cond115.preheader:                            ; preds = %for.cond92.for.inc112_crit_edge.us.for.cond115.preheader_crit_edge, %for.cond89.preheader.for.cond115.preheader_crit_edge, %for.cond58.preheader.for.cond115.preheader_crit_edge, %for.cond58.preheader.thread92
  %mul2188105 = phi float [ %mul21, %for.cond89.preheader.for.cond115.preheader_crit_edge ], [ %mul21, %for.cond58.preheader.for.cond115.preheader_crit_edge ], [ %mul2194, %for.cond58.preheader.thread92 ], [ %mul21, %for.cond92.for.inc112_crit_edge.us.for.cond115.preheader_crit_edge ]
  %mul2590103 = phi float [ %mul25, %for.cond89.preheader.for.cond115.preheader_crit_edge ], [ %mul25, %for.cond58.preheader.for.cond115.preheader_crit_edge ], [ %mul2595, %for.cond58.preheader.thread92 ], [ %mul25, %for.cond92.for.inc112_crit_edge.us.for.cond115.preheader_crit_edge ]
  %30 = sext i32 %w to i64
  %31 = sext i32 %h to i64
  %cmp11643 = icmp sgt i32 %h, 0
  br i1 %cmp11643, label %for.cond118.preheader.lr.ph, label %for.cond115.preheader.for.cond182.preheader_crit_edge

for.cond115.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond115.preheader
  br label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %cmp11938 = icmp sgt i32 %w, 0
  br i1 %cmp11938, label %for.cond118.preheader.us.preheader, label %for.cond118.preheader.lr.ph.for.end207_crit_edge

for.cond118.preheader.lr.ph.for.end207_crit_edge: ; preds = %for.cond118.preheader.lr.ph
  br label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %32 = add nsw i64 %30, -1
  %mul126.us147 = fmul float %mul16, 0.000000e+00
  %mul128.us149 = fmul float %exp2, 0.000000e+00
  %mul130.us151 = fmul float %call29, -0.000000e+00
  %exitcond77154 = icmp eq i64 %32, 0
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge, %for.cond118.preheader.us.preheader
  %indvars.iv944.us = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge ]
  %arrayidx124.us145 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv944.us
  %33 = load float, float* %arrayidx124.us145, align 4
  %mul125.us146 = fmul float %div, %33
  %add127.us148 = fadd float %mul126.us147, %mul125.us146
  %add129.us150 = fadd float %mul128.us149, %add127.us148
  %add131.us152 = fadd float %mul130.us151, %add129.us150
  %arrayidx135.us153 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv944.us
  store float %add131.us152, float* %arrayidx135.us153, align 4
  br i1 %exitcond77154, label %for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge

for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge: ; preds = %for.cond118.preheader.us
  br label %for.body120.us.for.body120.us_crit_edge

for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.cond118.preheader.us
  br label %for.cond118.for.inc147_crit_edge.us

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge, %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge
  %add131.us158 = phi float [ %add131.us, %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge ], [ %add131.us152, %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge ]
  %arrayidx124.us157 = phi float* [ %arrayidx124.us, %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge ], [ %arrayidx124.us145, %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge ]
  %indvars.iv739.us156 = phi i64 [ %indvars.iv.next8.us, %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge ], [ 0, %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge ]
  %ym1.140.us155 = phi float [ %add131.us158, %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond118.preheader.us.for.body120.us.for.body120.us_crit_edge_crit_edge ]
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv739.us156, 1
  %34 = load float, float* %arrayidx124.us157, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  %35 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %35
  %mul126.us = fmul float %mul16, %34
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us158
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.140.us155, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %exitcond77 = icmp eq i64 %indvars.iv.next8.us, %32
  br i1 %exitcond77, label %for.body120.us.for.body120.us_crit_edge.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge

for.body120.us.for.body120.us_crit_edge.for.body120.us.for.body120.us_crit_edge_crit_edge: ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us.for.body120.us_crit_edge.for.cond118.for.inc147_crit_edge.us_crit_edge, %for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv944.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next10.us, %31
  br i1 %cmp116.us, label %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge, label %for.cond150.preheader

for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge: ; preds = %for.cond118.for.inc147_crit_edge.us
  br label %for.cond118.preheader.us

for.cond150.preheader:                            ; preds = %for.cond118.for.inc147_crit_edge.us
  %36 = sext i32 %h to i64
  %cmp15135 = icmp sgt i32 %h, 0
  br i1 %cmp15135, label %for.cond154.preheader.lr.ph, label %for.cond150.preheader.for.cond182.preheader_crit_edge

for.cond150.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond150.preheader
  br label %for.cond182.preheader

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader
  %37 = sext i32 %w to i64
  %cmp15529 = icmp sgt i32 %w, 0
  br i1 %cmp15529, label %for.cond154.preheader.lr.ph.for.cond154.preheader.us_crit_edge, label %for.cond154.preheader.lr.ph.for.end207_crit_edge

for.cond154.preheader.lr.ph.for.end207_crit_edge: ; preds = %for.cond154.preheader.lr.ph
  br label %for.end207

for.cond154.preheader.lr.ph.for.cond154.preheader.us_crit_edge: ; preds = %for.cond154.preheader.lr.ph
  %indvars.iv.next434.us131 = add nsw i64 %37, -1
  %mul157.us132 = fmul float %mul2188105, 0.000000e+00
  %mul158.us133 = fmul float %mul2590103, 0.000000e+00
  %add159.us134 = fadd float %mul157.us132, %mul158.us133
  %mul160.us135 = fmul float %exp2, 0.000000e+00
  %add161.us136 = fadd float %add159.us134, %mul160.us135
  %mul162.us137 = fmul float %call29, -0.000000e+00
  %add163.us138 = fadd float %add161.us136, %mul162.us137
  %cmp155.us140 = icmp sgt i32 %w, 1
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge, %for.cond154.preheader.lr.ph.for.cond154.preheader.us_crit_edge
  %indvars.iv536.us = phi i64 [ %indvars.iv.next6.us, %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge ], [ 0, %for.cond154.preheader.lr.ph.for.cond154.preheader.us_crit_edge ]
  %arrayidx167.us139 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us131, i64 %indvars.iv536.us
  store float %add163.us138, float* %arrayidx167.us139, align 4
  br i1 %cmp155.us140, label %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge, label %for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge

for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge: ; preds = %for.cond154.preheader.us
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge: ; preds = %for.cond154.preheader.us
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge, %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge
  %add163.us144 = phi float [ %add163.us, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ], [ %add163.us138, %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %indvars.iv.next434.us143 = phi i64 [ %indvars.iv.next434.us, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ], [ %indvars.iv.next434.us131, %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %tp1.030.us142 = phi float [ %38, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %yp1.132.us141 = phi float [ %add163.us144, %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge ], [ 0.000000e+00, %for.cond154.preheader.us.for.body156.us.for.body156.us_crit_edge_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us143, i64 %indvars.iv536.us
  %38 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next434.us = add nsw i64 %indvars.iv.next434.us143, -1
  %mul157.us = fmul float %mul2188105, %38
  %mul158.us = fmul float %tp1.030.us142, %mul2590103
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us144
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.132.us141, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us, i64 %indvars.iv536.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next434.us143, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge, label %for.body156.us.for.body156.us_crit_edge.for.cond154.for.inc179_crit_edge.us_crit_edge

for.body156.us.for.body156.us_crit_edge.for.cond154.for.inc179_crit_edge.us_crit_edge: ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.for.body156.us.for.body156.us_crit_edge_crit_edge: ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.body156.us.for.body156.us_crit_edge

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us.for.body156.us_crit_edge.for.cond154.for.inc179_crit_edge.us_crit_edge, %for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv536.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next6.us, %36
  br i1 %cmp151.us, label %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.for.cond182.preheader_crit_edge

for.cond154.for.inc179_crit_edge.us.for.cond182.preheader_crit_edge: ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge: ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond154.preheader.us

for.cond182.preheader:                            ; preds = %for.cond154.for.inc179_crit_edge.us.for.cond182.preheader_crit_edge, %for.cond150.preheader.for.cond182.preheader_crit_edge, %for.cond115.preheader.for.cond182.preheader_crit_edge
  %39 = sext i32 %w to i64
  %cmp18325 = icmp sgt i32 %w, 0
  %cmp18623 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp18325, %cmp18623
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.cond182.preheader.for.end207_crit_edge

for.cond182.preheader.for.end207_crit_edge:       ; preds = %for.cond182.preheader
  br label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %40 = sext i32 %h to i64
  %41 = add nsw i64 %40, -1
  %min.iters.check208 = icmp ult i32 %h, 8
  %n.vec211 = and i64 %1, -8
  %cmp.zero212 = icmp eq i64 %n.vec211, 0
  %cmp.n239 = icmp eq i64 %1, %n.vec211
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge, %for.cond185.preheader.us.preheader
  %indvars.iv126.us = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next2.us, %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge ]
  %scevgep214 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 0
  %scevgep216 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %1
  %scevgep218 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 0
  %scevgep220 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %1
  %scevgep222 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 0
  %scevgep224 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %1
  br i1 %min.iters.check208, label %for.cond185.preheader.us.for.body187.us_crit_edge, label %min.iters.checked209

for.cond185.preheader.us.for.body187.us_crit_edge: ; preds = %for.cond185.preheader.us
  br label %for.body187.us.preheader

min.iters.checked209:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero212, label %min.iters.checked209.for.body187.us_crit_edge, label %vector.memcheck234

min.iters.checked209.for.body187.us_crit_edge:    ; preds = %min.iters.checked209
  br label %for.body187.us.preheader

vector.memcheck234:                               ; preds = %min.iters.checked209
  %bound0226 = icmp ult float* %scevgep214, %scevgep220
  %bound1227 = icmp ult float* %scevgep218, %scevgep216
  %found.conflict228 = and i1 %bound0226, %bound1227
  %bound0229 = icmp ult float* %scevgep214, %scevgep224
  %bound1230 = icmp ult float* %scevgep222, %scevgep216
  %found.conflict231 = and i1 %bound0229, %bound1230
  %conflict.rdx232 = or i1 %found.conflict228, %found.conflict231
  br i1 %conflict.rdx232, label %vector.memcheck234.for.body187.us_crit_edge, label %vector.memcheck234.vector.body205_crit_edge

vector.memcheck234.vector.body205_crit_edge:      ; preds = %vector.memcheck234
  br label %vector.body205

vector.memcheck234.for.body187.us_crit_edge:      ; preds = %vector.memcheck234
  br label %for.body187.us.preheader

vector.body205:                                   ; preds = %vector.body205.vector.body205_crit_edge, %vector.memcheck234.vector.body205_crit_edge
  %index236 = phi i64 [ %index.next237, %vector.body205.vector.body205_crit_edge ], [ 0, %vector.memcheck234.vector.body205_crit_edge ]
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %index236
  %43 = bitcast float* %42 to <4 x float>*
  %wide.load244 = load <4 x float>, <4 x float>* %43, align 4, !alias.scope !16
  %44 = getelementptr float, float* %42, i64 4
  %45 = bitcast float* %44 to <4 x float>*
  %wide.load245 = load <4 x float>, <4 x float>* %45, align 4, !alias.scope !16
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %index236
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load246 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !19
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load247 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !19
  %50 = fadd <4 x float> %wide.load244, %wide.load246
  %51 = fadd <4 x float> %wide.load245, %wide.load247
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %index236
  %53 = bitcast float* %52 to <4 x float>*
  store <4 x float> %50, <4 x float>* %53, align 4, !alias.scope !21, !noalias !23
  %54 = getelementptr float, float* %52, i64 4
  %55 = bitcast float* %54 to <4 x float>*
  store <4 x float> %51, <4 x float>* %55, align 4, !alias.scope !21, !noalias !23
  %index.next237 = add i64 %index236, 8
  %56 = icmp eq i64 %index.next237, %n.vec211
  br i1 %56, label %middle.block206, label %vector.body205.vector.body205_crit_edge, !llvm.loop !24

vector.body205.vector.body205_crit_edge:          ; preds = %vector.body205
  br label %vector.body205

middle.block206:                                  ; preds = %vector.body205
  br i1 %cmp.n239, label %middle.block206.for.cond185.for.inc205_crit_edge.us_crit_edge, label %middle.block206.for.body187.us_crit_edge

middle.block206.for.body187.us_crit_edge:         ; preds = %middle.block206
  br label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %for.cond185.preheader.us.for.body187.us_crit_edge, %min.iters.checked209.for.body187.us_crit_edge, %vector.memcheck234.for.body187.us_crit_edge, %middle.block206.for.body187.us_crit_edge
  %indvars.iv24.us.ph = phi i64 [ 0, %vector.memcheck234.for.body187.us_crit_edge ], [ 0, %min.iters.checked209.for.body187.us_crit_edge ], [ 0, %for.cond185.preheader.us.for.body187.us_crit_edge ], [ %n.vec211, %middle.block206.for.body187.us_crit_edge ]
  br label %for.body187.us

middle.block206.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %middle.block206
  br label %for.cond185.for.inc205_crit_edge.us

for.body187.us:                                   ; preds = %for.body187.us.preheader, %for.body187.us.for.body187.us_crit_edge
  %indvars.iv24.us = phi i64 [ %indvars.iv.next.us, %for.body187.us.for.body187.us_crit_edge ], [ %indvars.iv24.us.ph, %for.body187.us.preheader ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %57 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %58 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %57, %58
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %exitcond = icmp eq i64 %indvars.iv24.us, %41
  br i1 %exitcond, label %for.body187.us.for.cond185.for.inc205_crit_edge.us_crit_edge, label %for.body187.us.for.body187.us_crit_edge, !llvm.loop !25

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  br label %for.body187.us

for.body187.us.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.body187.us.for.cond185.for.inc205_crit_edge.us_crit_edge, %middle.block206.for.cond185.for.inc205_crit_edge.us_crit_edge
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv126.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next2.us, %39
  br i1 %cmp183.us, label %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge, label %for.cond185.for.inc205_crit_edge.us.for.end207_crit_edge

for.cond185.for.inc205_crit_edge.us.for.end207_crit_edge: ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge: ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.cond185.preheader.us

for.end207:                                       ; preds = %for.cond185.for.inc205_crit_edge.us.for.end207_crit_edge, %for.cond182.preheader.for.end207_crit_edge, %for.cond154.preheader.lr.ph.for.end207_crit_edge, %for.cond118.preheader.lr.ph.for.end207_crit_edge, %for.cond92.preheader.lr.ph.for.end207_crit_edge, %for.cond62.preheader.lr.ph.for.end207_crit_edge, %for.cond31.preheader.lr.ph.for.end207_crit_edge
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
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  %5 = sext i32 %h to i64
  %cmp7 = icmp sgt i32 %w, 0
  %cmp35 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %entry.for.cond2.preheader.us_crit_edge, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

entry.for.cond2.preheader.us_crit_edge:           ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %entry.for.cond2.preheader.us_crit_edge
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ], [ 0, %entry.for.cond2.preheader.us_crit_edge ]
  %6 = mul nsw i64 %indvars.iv28.us, %5
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us.for.body4.us_crit_edge ]
  %7 = add nsw i64 %indvars.iv6.us, %6
  %8 = trunc i64 %7 to i32
  %rem.us = srem i32 %8, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %11 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %11 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, %3
  br i1 %cmp3.us, label %if.end.us.for.body4.us_crit_edge, label %for.cond2.for.inc10_crit_edge.us

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next3.us, %4
  br i1 %cmp.us, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, label %for.cond2.for.inc10_crit_edge.us.for.end12_crit_edge

for.cond2.for.inc10_crit_edge.us.for.end12_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us.for.end12_crit_edge, %entry.for.end12_crit_edge
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

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
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay4)
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
  %0 = sext i32 %h to i64
  %1 = sext i32 %w to i64
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %entry.for.end9_crit_edge

entry.for.end9_crit_edge:                         ; preds = %entry
  br label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %min.iters.check = icmp ult i32 %h, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv34.us = phi i64 [ %indvars.iv.next4.us, %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.us.preheader ]
  %2 = mul nuw nsw i64 %indvars.iv34.us, 313
  br i1 %min.iters.check, label %for.cond1.preheader.us.for.body3.us.preheader_crit_edge, label %min.iters.checked

for.cond1.preheader.us.for.body3.us.preheader_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.body3.us.preheader

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.for.body3.us.preheader_crit_edge, label %vector.ph

min.iters.checked.for.body3.us.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.body3.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %2, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %3 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %4 = add nuw nsw <4 x i64> %3, %broadcast.splat
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = srem <4 x i32> %5, <i32 65536, i32 65536, i32 65536, i32 65536>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  %8 = fdiv <4 x float> %7, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %9 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv34.us, i64 %index
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %8, <4 x float>* %10, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, label %middle.block.for.body3.us.preheader_crit_edge

middle.block.for.body3.us.preheader_crit_edge:    ; preds = %middle.block
  br label %for.body3.us.preheader

middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond1.for.inc7_crit_edge.us

for.body3.us.preheader:                           ; preds = %middle.block.for.body3.us.preheader_crit_edge, %min.iters.checked.for.body3.us.preheader_crit_edge, %for.cond1.preheader.us.for.body3.us.preheader_crit_edge
  %indvars.iv2.us.ph = phi i64 [ 0, %min.iters.checked.for.body3.us.preheader_crit_edge ], [ 0, %for.cond1.preheader.us.for.body3.us.preheader_crit_edge ], [ %n.vec, %middle.block.for.body3.us.preheader_crit_edge ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv2.us = phi i64 [ %indvars.iv.next.us, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv2.us.ph, %for.body3.us.preheader ]
  %12 = mul nuw nsw i64 %indvars.iv2.us, 991
  %13 = add nuw nsw i64 %12, %2
  %14 = trunc i64 %13 to i32
  %rem.us = srem i32 %14, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv34.us, i64 %indvars.iv2.us
  store float %div.us, float* %arrayidx6.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv2.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %0
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !4

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, %for.cond1.for.inc7_crit_edge.us.loopexit
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv34.us, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4.us, %1
  br i1 %exitcond7, label %for.end9.loopexit, label %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %entry.for.end9_crit_edge, %for.end9.loopexit
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
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %1 = sext i32 %h to i64
  %2 = sext i32 %w to i64
  %cmp64 = icmp sgt i32 %w, 0
  br i1 %cmp64, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread97

for.cond58.preheader.thread97:                    ; preds = %entry
  %3 = fmul float %div, %call24
  %mul2598 = fsub float -0.000000e+00, %3
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp3259 = icmp sgt i32 %h, 0
  br i1 %cmp3259, label %for.cond31.preheader.us.preheader, label %for.cond58.preheader.thread

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter89 = and i64 %1, 1
  %lcmp.mod90 = icmp eq i64 %xtraiter89, 0
  %4 = icmp eq i32 %h, 1
  %mul36.us.1.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.1.v.i0.2 = insertelement <2 x float> %mul36.us.1.v.i0.1, float %div, i32 1
  %mul37.us.prol = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us.prol = fmul float %exp2, 0.000000e+00
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond58.preheader.thread:                      ; preds = %for.cond31.preheader.lr.ph
  %5 = fmul float %div, %call24
  %mul2593 = fsub float -0.000000e+00, %5
  br label %for.cond62.preheader.lr.ph

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge, %for.cond31.preheader.us.preheader
  %indvars.iv2165.us = phi i64 [ %indvars.iv.next22.us, %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge ], [ 0, %for.cond31.preheader.us.preheader ]
  br i1 %lcmp.mod90, label %for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge, label %for.body33.us.prol

for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge: ; preds = %for.cond31.preheader.us
  br label %for.body33.us.prol.loopexit

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2165.us, i64 0
  %6 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2165.us, i64 0
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  %7 = load float, float* %arrayidx35.us.prol, align 4
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge, %for.body33.us.prol
  %xm1.062.us.unr.ph = phi float [ %7, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge ]
  %ym1.061.us.unr.ph = phi float [ %add42.us.prol, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge ]
  %indvars.iv1960.us.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us.for.body33.us.prol.loopexit_crit_edge ]
  br i1 %4, label %for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.body33.us.preheader

for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.body33.us.prol.loopexit
  br label %for.cond31.for.inc55_crit_edge.us

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.preheader
  %ym2.063.us = phi float [ %add42.us, %for.body33.us.for.body33.us_crit_edge ], [ 0.000000e+00, %for.body33.us.preheader ]
  %xm1.062.us = phi float [ %11, %for.body33.us.for.body33.us_crit_edge ], [ %xm1.062.us.unr.ph, %for.body33.us.preheader ]
  %ym1.061.us = phi float [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ], [ %ym1.061.us.unr.ph, %for.body33.us.preheader ]
  %indvars.iv1960.us = phi i64 [ %indvars.iv.next20.us.1, %for.body33.us.for.body33.us_crit_edge ], [ %indvars.iv1960.us.unr.ph, %for.body33.us.preheader ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2165.us, i64 %indvars.iv1960.us
  %8 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %8
  %mul37.us = fmul float %mul16.v.r1, %xm1.062.us
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %ym1.061.us
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym2.063.us, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2165.us, i64 %indvars.iv1960.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %9 = bitcast float* %arrayidx35.us to <2 x float>*
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1960.us, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2165.us, i64 %indvars.iv.next20.us
  %10 = load <2 x float>, <2 x float>* %9, align 4
  %mul37.us.1 = fmul <2 x float> %mul36.us.1.v.i0.2, %10
  %mul37.us.1.v.r1 = extractelement <2 x float> %mul37.us.1, i32 0
  %mul37.us.1.v.r2 = extractelement <2 x float> %mul37.us.1, i32 1
  %add38.us.1 = fadd float %mul37.us.1.v.r1, %mul37.us.1.v.r2
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %ym1.061.us, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2165.us, i64 %indvars.iv.next20.us
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %11 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next20.us.1 = add nsw i64 %indvars.iv1960.us, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next20.us.1, %1
  br i1 %exitcond88.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us
  br label %for.body33.us

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, %for.cond31.for.inc55_crit_edge.us.loopexit
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2165.us, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next22.us, %2
  br i1 %exitcond91, label %for.cond58.preheader, label %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge

for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge: ; preds = %for.cond31.for.inc55_crit_edge.us
  br label %for.cond31.preheader.us

for.cond58.preheader:                             ; preds = %for.cond31.for.inc55_crit_edge.us
  %12 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %12
  %cmp5956 = icmp sgt i32 %w, 0
  br i1 %cmp5956, label %for.cond58.preheader.for.cond62.preheader.lr.ph_crit_edge, label %for.cond58.preheader.for.cond115.preheader_crit_edge

for.cond58.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond58.preheader
  br label %for.cond115.preheader

for.cond58.preheader.for.cond62.preheader.lr.ph_crit_edge: ; preds = %for.cond58.preheader
  br label %for.cond62.preheader.lr.ph

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader.for.cond62.preheader.lr.ph_crit_edge, %for.cond58.preheader.thread
  %mul2596 = phi float [ %mul2593, %for.cond58.preheader.thread ], [ %mul25, %for.cond58.preheader.for.cond62.preheader.lr.ph_crit_edge ]
  %.in113 = add i32 %h, -1
  %13 = sext i32 %.in113 to i64
  %14 = sext i32 %w to i64
  %cmp6350 = icmp sgt i32 %.in113, -1
  br i1 %cmp6350, label %for.cond62.preheader.us.preheader, label %for.cond62.preheader.lr.ph.for.cond92.preheader.lr.ph_crit_edge

for.cond62.preheader.lr.ph.for.cond92.preheader.lr.ph_crit_edge: ; preds = %for.cond62.preheader.lr.ph
  br label %for.cond92.preheader.lr.ph

for.cond62.preheader.us.preheader:                ; preds = %for.cond62.preheader.lr.ph
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge, %for.cond62.preheader.us.preheader
  %indvars.iv1757.us = phi i64 [ %indvars.iv.next18.us, %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge ], [ 0, %for.cond62.preheader.us.preheader ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.body64.us.for.body64.us_crit_edge, %for.cond62.preheader.us
  %yp2.055.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %yp1.054.us, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.054.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %xp2.053.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %xp1.052.us, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.052.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %15, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv1551.us = phi i64 [ %13, %for.cond62.preheader.us ], [ %indvars.iv.next16.us, %for.body64.us.for.body64.us_crit_edge ]
  %mul65.us = fmul float %mul16.v.r2, %xp1.052.us
  %mul66.us = fmul float %xp2.053.us, %mul2596
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %yp1.054.us
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp2.055.us, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1757.us, i64 %indvars.iv1551.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1757.us, i64 %indvars.iv1551.us
  %15 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next16.us = add nsw i64 %indvars.iv1551.us, -1
  %cmp63.us = icmp sgt i64 %indvars.iv1551.us, 0
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us
  br label %for.body64.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1757.us, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next18.us, %14
  br i1 %exitcond86, label %for.cond89.preheader, label %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge

for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge: ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond62.preheader.us

for.cond89.preheader:                             ; preds = %for.cond62.for.inc86_crit_edge.us
  %cmp9047 = icmp sgt i32 %w, 0
  br i1 %cmp9047, label %for.cond89.preheader.for.cond92.preheader.lr.ph_crit_edge, label %for.cond89.preheader.for.cond115.preheader_crit_edge

for.cond89.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond89.preheader
  br label %for.cond115.preheader

for.cond89.preheader.for.cond92.preheader.lr.ph_crit_edge: ; preds = %for.cond89.preheader
  br label %for.cond92.preheader.lr.ph

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader.for.cond92.preheader.lr.ph_crit_edge, %for.cond62.preheader.lr.ph.for.cond92.preheader.lr.ph_crit_edge
  %16 = sext i32 %h to i64
  %17 = sext i32 %w to i64
  %cmp9345 = icmp sgt i32 %h, 0
  br i1 %cmp9345, label %for.cond92.preheader.us.preheader, label %for.cond92.preheader.lr.ph.for.end207_crit_edge

for.cond92.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond92.preheader.lr.ph
  br label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  %xtraiter82 = and i64 %16, 1
  %lcmp.mod83 = icmp eq i64 %xtraiter82, 0
  %18 = icmp eq i32 %h, 1
  %19 = add nsw i64 %1, -2
  %20 = add nsw i64 %1, -2
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge, %for.cond92.preheader.us.preheader
  %indvars.iv1348.us = phi i64 [ %indvars.iv.next14.us, %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep116 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 2
  %scevgep122 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 2
  %scevgep128 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 2
  br i1 %lcmp.mod83, label %for.cond92.preheader.us.for.body94.us.prol.loopexit_crit_edge, label %for.body94.us.prol

for.cond92.preheader.us.for.body94.us.prol.loopexit_crit_edge: ; preds = %for.cond92.preheader.us
  br label %for.body94.us.prol.loopexit

for.body94.us.prol:                               ; preds = %for.cond92.preheader.us
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 0
  %21 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 0
  %22 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %21, %22
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 0
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.cond92.preheader.us.for.body94.us.prol.loopexit_crit_edge, %for.body94.us.prol
  %indvars.iv1146.us.unr.ph = phi i64 [ 1, %for.body94.us.prol ], [ 0, %for.cond92.preheader.us.for.body94.us.prol.loopexit_crit_edge ]
  br i1 %18, label %for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge, label %for.body94.us.preheader

for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %for.body94.us.prol.loopexit
  br label %for.cond92.for.inc112_crit_edge.us

for.body94.us.preheader:                          ; preds = %for.body94.us.prol.loopexit
  %23 = sub nsw i64 %19, %indvars.iv1146.us.unr.ph
  %24 = lshr i64 %23, 1
  %25 = add nuw i64 %24, 1
  %min.iters.check = icmp ult i64 %25, 4
  br i1 %min.iters.check, label %for.body94.us.preheader.for.body94.us.preheader192_crit_edge, label %min.iters.checked

for.body94.us.preheader.for.body94.us.preheader192_crit_edge: ; preds = %for.body94.us.preheader
  br label %for.body94.us.preheader192

min.iters.checked:                                ; preds = %for.body94.us.preheader
  %n.mod.vf = and i64 %25, 3
  %n.vec = sub i64 %25, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.for.body94.us.preheader192_crit_edge, label %vector.memcheck

min.iters.checked.for.body94.us.preheader192_crit_edge: ; preds = %min.iters.checked
  br label %for.body94.us.preheader192

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep114 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us.unr.ph
  %26 = sub nsw i64 %20, %indvars.iv1146.us.unr.ph
  %27 = and i64 %26, -2
  %28 = or i64 %indvars.iv1146.us.unr.ph, %27
  %scevgep117 = getelementptr float, float* %scevgep116, i64 %28
  %scevgep120 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us.unr.ph
  %scevgep123 = getelementptr float, float* %scevgep122, i64 %28
  %scevgep126 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us.unr.ph
  %scevgep129 = getelementptr float, float* %scevgep128, i64 %28
  %bound0 = icmp ult float* %scevgep114, %scevgep123
  %bound1 = icmp ult float* %scevgep120, %scevgep117
  %found.conflict = and i1 %bound0, %bound1
  %bound0131 = icmp ult float* %scevgep114, %scevgep129
  %bound1132 = icmp ult float* %scevgep126, %scevgep117
  %found.conflict133 = and i1 %bound0131, %bound1132
  %conflict.rdx = or i1 %found.conflict, %found.conflict133
  %29 = or i64 %indvars.iv1146.us.unr.ph, 2
  %30 = shl nuw i64 %24, 1
  %31 = add i64 %29, %30
  %32 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %31, %32
  br i1 %conflict.rdx, label %vector.memcheck.for.body94.us.preheader192_crit_edge, label %vector.body.preheader

vector.memcheck.for.body94.us.preheader192_crit_edge: ; preds = %vector.memcheck
  br label %for.body94.us.preheader192

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %33 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv1146.us.unr.ph, %33
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 %offset.idx
  %35 = bitcast float* %34 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %35, align 4, !alias.scope !6
  %36 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 %offset.idx
  %37 = bitcast float* %36 to <8 x float>*
  %wide.vec135 = load <8 x float>, <8 x float>* %37, align 4, !alias.scope !9
  %38 = fadd <8 x float> %wide.vec, %wide.vec135
  %39 = shufflevector <8 x float> %38, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %40 = add nuw nsw i64 %offset.idx, 1
  %41 = fadd <8 x float> %wide.vec, %wide.vec135
  %42 = shufflevector <8 x float> %41, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 %40
  %44 = getelementptr float, float* %43, i64 -1
  %45 = bitcast float* %44 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %39, <4 x float> %42, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %45, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge, label %middle.block.for.body94.us.preheader192_crit_edge

middle.block.for.body94.us.preheader192_crit_edge: ; preds = %middle.block
  br label %for.body94.us.preheader192

middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond92.for.inc112_crit_edge.us

for.body94.us.preheader192:                       ; preds = %middle.block.for.body94.us.preheader192_crit_edge, %vector.memcheck.for.body94.us.preheader192_crit_edge, %min.iters.checked.for.body94.us.preheader192_crit_edge, %for.body94.us.preheader.for.body94.us.preheader192_crit_edge
  %indvars.iv1146.us.ph = phi i64 [ %indvars.iv1146.us.unr.ph, %vector.memcheck.for.body94.us.preheader192_crit_edge ], [ %indvars.iv1146.us.unr.ph, %min.iters.checked.for.body94.us.preheader192_crit_edge ], [ %indvars.iv1146.us.unr.ph, %for.body94.us.preheader.for.body94.us.preheader192_crit_edge ], [ %ind.end, %middle.block.for.body94.us.preheader192_crit_edge ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.for.body94.us_crit_edge, %for.body94.us.preheader192
  %indvars.iv1146.us = phi i64 [ %indvars.iv.next12.us.1, %for.body94.us.for.body94.us_crit_edge ], [ %indvars.iv1146.us.ph, %for.body94.us.preheader192 ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us
  %47 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us
  %48 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %47, %48
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 %indvars.iv1146.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1146.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1348.us, i64 %indvars.iv.next12.us
  %49 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1348.us, i64 %indvars.iv.next12.us
  %50 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %49, %50
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1348.us, i64 %indvars.iv.next12.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next12.us.1 = add nsw i64 %indvars.iv1146.us, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next12.us.1, %16
  br i1 %exitcond81.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us.for.body94.us_crit_edge, !llvm.loop !15

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  br label %for.body94.us

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge, %for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge, %for.cond92.for.inc112_crit_edge.us.loopexit
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1348.us, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next14.us, %17
  br i1 %exitcond84, label %for.cond115.preheader.loopexit, label %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge

for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge: ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond89.preheader.for.cond115.preheader_crit_edge, %for.cond58.preheader.for.cond115.preheader_crit_edge, %for.cond115.preheader.loopexit, %for.cond58.preheader.thread97
  %mul2595101 = phi float [ %mul2596, %for.cond89.preheader.for.cond115.preheader_crit_edge ], [ %mul2598, %for.cond58.preheader.thread97 ], [ %mul25, %for.cond58.preheader.for.cond115.preheader_crit_edge ], [ %mul2596, %for.cond115.preheader.loopexit ]
  %51 = sext i32 %w to i64
  %52 = sext i32 %h to i64
  %cmp11642 = icmp sgt i32 %h, 0
  br i1 %cmp11642, label %for.cond118.preheader.lr.ph, label %for.cond115.preheader.for.cond182.preheader_crit_edge

for.cond115.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond115.preheader
  br label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %cmp11937 = icmp sgt i32 %w, 0
  br i1 %cmp11937, label %for.cond118.preheader.us.preheader, label %for.cond150.preheader.thread108

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %xtraiter77 = and i64 %51, 1
  %lcmp.mod78 = icmp eq i64 %xtraiter77, 0
  %53 = icmp eq i32 %w, 1
  %mul126.us.prol = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us.prol = fmul float %exp2, 0.000000e+00
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond150.preheader.thread108:                  ; preds = %for.cond118.preheader.lr.ph
  br label %for.cond154.preheader.lr.ph

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge, %for.cond118.preheader.us.preheader
  %indvars.iv943.us = phi i64 [ %indvars.iv.next10.us, %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge ], [ 0, %for.cond118.preheader.us.preheader ]
  br i1 %lcmp.mod78, label %for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge, label %for.body120.us.prol

for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge: ; preds = %for.cond118.preheader.us
  br label %for.body120.us.prol.loopexit

for.body120.us.prol:                              ; preds = %for.cond118.preheader.us
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv943.us
  %54 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %54
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv943.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  %55 = load float, float* %arrayidx124.us.prol, align 4
  br label %for.body120.us.prol.loopexit

for.body120.us.prol.loopexit:                     ; preds = %for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge, %for.body120.us.prol
  %tm1.040.us.unr.ph = phi float [ %55, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge ]
  %ym1.139.us.unr.ph = phi float [ %add131.us.prol, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge ]
  %indvars.iv738.us.unr.ph = phi i64 [ 1, %for.body120.us.prol ], [ 0, %for.cond118.preheader.us.for.body120.us.prol.loopexit_crit_edge ]
  br i1 %53, label %for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.body120.us.preheader

for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.body120.us.prol.loopexit
  br label %for.cond118.for.inc147_crit_edge.us

for.body120.us.preheader:                         ; preds = %for.body120.us.prol.loopexit
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.preheader
  %ym2.141.us = phi float [ %add131.us, %for.body120.us.for.body120.us_crit_edge ], [ 0.000000e+00, %for.body120.us.preheader ]
  %tm1.040.us = phi float [ %59, %for.body120.us.for.body120.us_crit_edge ], [ %tm1.040.us.unr.ph, %for.body120.us.preheader ]
  %ym1.139.us = phi float [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ], [ %ym1.139.us.unr.ph, %for.body120.us.preheader ]
  %indvars.iv738.us = phi i64 [ %indvars.iv.next8.us.1, %for.body120.us.for.body120.us_crit_edge ], [ %indvars.iv738.us.unr.ph, %for.body120.us.preheader ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv738.us, i64 %indvars.iv943.us
  %56 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %56
  %mul126.us = fmul float %mul16.v.r1, %tm1.040.us
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %ym1.139.us
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym2.141.us, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv738.us, i64 %indvars.iv943.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %57 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv738.us, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us, i64 %indvars.iv943.us
  %58 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %58
  %mul126.us.1 = fmul float %mul16.v.r1, %57
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %ym1.139.us, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us, i64 %indvars.iv943.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %59 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next8.us.1 = add nsw i64 %indvars.iv738.us, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next8.us.1, %51
  br i1 %exitcond76.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us
  br label %for.body120.us

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, %for.cond118.for.inc147_crit_edge.us.loopexit
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv943.us, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next10.us, %52
  br i1 %exitcond79, label %for.cond150.preheader, label %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge

for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge: ; preds = %for.cond118.for.inc147_crit_edge.us
  br label %for.cond118.preheader.us

for.cond150.preheader:                            ; preds = %for.cond118.for.inc147_crit_edge.us
  %cmp15134 = icmp sgt i32 %h, 0
  br i1 %cmp15134, label %for.cond150.preheader.for.cond154.preheader.lr.ph_crit_edge, label %for.cond150.preheader.for.cond182.preheader_crit_edge

for.cond150.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond150.preheader
  br label %for.cond182.preheader

for.cond150.preheader.for.cond154.preheader.lr.ph_crit_edge: ; preds = %for.cond150.preheader
  br label %for.cond154.preheader.lr.ph

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader.for.cond154.preheader.lr.ph_crit_edge, %for.cond150.preheader.thread108
  %.in = add i32 %w, -1
  %60 = sext i32 %.in to i64
  %61 = sext i32 %h to i64
  %cmp15528 = icmp sgt i32 %.in, -1
  br i1 %cmp15528, label %for.cond154.preheader.us.preheader, label %for.cond154.preheader.lr.ph.for.cond182.preheader_crit_edge

for.cond154.preheader.lr.ph.for.cond182.preheader_crit_edge: ; preds = %for.cond154.preheader.lr.ph
  br label %for.cond182.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond154.preheader.lr.ph
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge, %for.cond154.preheader.us.preheader
  %indvars.iv535.us = phi i64 [ %indvars.iv.next6.us, %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge ], [ 0, %for.cond154.preheader.us.preheader ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.body156.us.for.body156.us_crit_edge, %for.cond154.preheader.us
  %yp2.133.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %yp1.132.us, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.132.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %tp2.031.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %tp1.030.us, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.030.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %62, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv329.us = phi i64 [ %60, %for.cond154.preheader.us ], [ %indvars.iv.next4.us, %for.body156.us.for.body156.us_crit_edge ]
  %mul157.us = fmul float %mul16.v.r2, %tp1.030.us
  %mul158.us = fmul float %tp2.031.us, %mul2595101
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %yp1.132.us
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp2.133.us, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv329.us, i64 %indvars.iv535.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv329.us, i64 %indvars.iv535.us
  %62 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next4.us = add nsw i64 %indvars.iv329.us, -1
  %cmp155.us = icmp sgt i64 %indvars.iv329.us, 0
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us
  br label %for.body156.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv535.us, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next6.us, %61
  br i1 %exitcond74, label %for.cond182.preheader.loopexit, label %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge

for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge: ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond154.preheader.lr.ph.for.cond182.preheader_crit_edge, %for.cond150.preheader.for.cond182.preheader_crit_edge, %for.cond115.preheader.for.cond182.preheader_crit_edge, %for.cond182.preheader.loopexit
  %63 = sext i32 %h to i64
  %64 = sext i32 %w to i64
  %cmp18325 = icmp sgt i32 %w, 0
  %cmp18623 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp18325, %cmp18623
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.cond182.preheader.for.end207_crit_edge

for.cond182.preheader.for.end207_crit_edge:       ; preds = %for.cond182.preheader
  br label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %xtraiter = and i64 %63, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %65 = icmp eq i32 %h, 1
  %66 = add nsw i64 %1, -2
  %67 = add nsw i64 %1, -2
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge, %for.cond185.preheader.us.preheader
  %indvars.iv126.us = phi i64 [ %indvars.iv.next2.us, %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 2
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 2
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 2
  br i1 %lcmp.mod, label %for.cond185.preheader.us.for.body187.us.prol.loopexit_crit_edge, label %for.body187.us.prol

for.cond185.preheader.us.for.body187.us.prol.loopexit_crit_edge: ; preds = %for.cond185.preheader.us
  br label %for.body187.us.prol.loopexit

for.body187.us.prol:                              ; preds = %for.cond185.preheader.us
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 0
  %68 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 0
  %69 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %68, %69
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 0
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.cond185.preheader.us.for.body187.us.prol.loopexit_crit_edge, %for.body187.us.prol
  %indvars.iv24.us.unr.ph = phi i64 [ 1, %for.body187.us.prol ], [ 0, %for.cond185.preheader.us.for.body187.us.prol.loopexit_crit_edge ]
  br i1 %65, label %for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge, label %for.body187.us.preheader

for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %for.body187.us.prol.loopexit
  br label %for.cond185.for.inc205_crit_edge.us

for.body187.us.preheader:                         ; preds = %for.body187.us.prol.loopexit
  %70 = sub nsw i64 %66, %indvars.iv24.us.unr.ph
  %71 = lshr i64 %70, 1
  %72 = add nuw i64 %71, 1
  %min.iters.check141 = icmp ult i64 %72, 4
  br i1 %min.iters.check141, label %for.body187.us.preheader.for.body187.us.preheader191_crit_edge, label %min.iters.checked142

for.body187.us.preheader.for.body187.us.preheader191_crit_edge: ; preds = %for.body187.us.preheader
  br label %for.body187.us.preheader191

min.iters.checked142:                             ; preds = %for.body187.us.preheader
  %n.mod.vf143 = and i64 %72, 3
  %n.vec144 = sub i64 %72, %n.mod.vf143
  %cmp.zero145 = icmp eq i64 %n.vec144, 0
  br i1 %cmp.zero145, label %min.iters.checked142.for.body187.us.preheader191_crit_edge, label %vector.memcheck173

min.iters.checked142.for.body187.us.preheader191_crit_edge: ; preds = %min.iters.checked142
  br label %for.body187.us.preheader191

vector.memcheck173:                               ; preds = %min.iters.checked142
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us.unr.ph
  %73 = sub nsw i64 %67, %indvars.iv24.us.unr.ph
  %74 = and i64 %73, -2
  %75 = or i64 %indvars.iv24.us.unr.ph, %74
  %scevgep151 = getelementptr float, float* %scevgep150, i64 %75
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us.unr.ph
  %scevgep157 = getelementptr float, float* %scevgep156, i64 %75
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us.unr.ph
  %scevgep163 = getelementptr float, float* %scevgep162, i64 %75
  %bound0165 = icmp ult float* %scevgep148, %scevgep157
  %bound1166 = icmp ult float* %scevgep154, %scevgep151
  %found.conflict167 = and i1 %bound0165, %bound1166
  %bound0168 = icmp ult float* %scevgep148, %scevgep163
  %bound1169 = icmp ult float* %scevgep160, %scevgep151
  %found.conflict170 = and i1 %bound0168, %bound1169
  %conflict.rdx171 = or i1 %found.conflict167, %found.conflict170
  %76 = or i64 %indvars.iv24.us.unr.ph, 2
  %77 = shl nuw i64 %71, 1
  %78 = add i64 %76, %77
  %79 = shl nuw nsw i64 %n.mod.vf143, 1
  %ind.end178 = sub i64 %78, %79
  br i1 %conflict.rdx171, label %vector.memcheck173.for.body187.us.preheader191_crit_edge, label %vector.body138.preheader

vector.memcheck173.for.body187.us.preheader191_crit_edge: ; preds = %vector.memcheck173
  br label %for.body187.us.preheader191

vector.body138.preheader:                         ; preds = %vector.memcheck173
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138.vector.body138_crit_edge, %vector.body138.preheader
  %index175 = phi i64 [ %index.next176, %vector.body138.vector.body138_crit_edge ], [ 0, %vector.body138.preheader ]
  %80 = shl i64 %index175, 1
  %offset.idx180 = or i64 %indvars.iv24.us.unr.ph, %80
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %offset.idx180
  %82 = bitcast float* %81 to <8 x float>*
  %wide.vec184 = load <8 x float>, <8 x float>* %82, align 4, !alias.scope !16
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %offset.idx180
  %84 = bitcast float* %83 to <8 x float>*
  %wide.vec187 = load <8 x float>, <8 x float>* %84, align 4, !alias.scope !19
  %85 = fadd <8 x float> %wide.vec184, %wide.vec187
  %86 = shufflevector <8 x float> %85, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %87 = add nuw nsw i64 %offset.idx180, 1
  %88 = fadd <8 x float> %wide.vec184, %wide.vec187
  %89 = shufflevector <8 x float> %88, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %87
  %91 = getelementptr float, float* %90, i64 -1
  %92 = bitcast float* %91 to <8 x float>*
  %interleaved.vec190 = shufflevector <4 x float> %86, <4 x float> %89, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec190, <8 x float>* %92, align 4, !alias.scope !21, !noalias !23
  %index.next176 = add i64 %index175, 4
  %93 = icmp eq i64 %index.next176, %n.vec144
  br i1 %93, label %middle.block139, label %vector.body138.vector.body138_crit_edge, !llvm.loop !24

vector.body138.vector.body138_crit_edge:          ; preds = %vector.body138
  br label %vector.body138

middle.block139:                                  ; preds = %vector.body138
  %cmp.n179 = icmp eq i64 %n.mod.vf143, 0
  br i1 %cmp.n179, label %middle.block139.for.cond185.for.inc205_crit_edge.us_crit_edge, label %middle.block139.for.body187.us.preheader191_crit_edge

middle.block139.for.body187.us.preheader191_crit_edge: ; preds = %middle.block139
  br label %for.body187.us.preheader191

middle.block139.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %middle.block139
  br label %for.cond185.for.inc205_crit_edge.us

for.body187.us.preheader191:                      ; preds = %middle.block139.for.body187.us.preheader191_crit_edge, %vector.memcheck173.for.body187.us.preheader191_crit_edge, %min.iters.checked142.for.body187.us.preheader191_crit_edge, %for.body187.us.preheader.for.body187.us.preheader191_crit_edge
  %indvars.iv24.us.ph = phi i64 [ %indvars.iv24.us.unr.ph, %vector.memcheck173.for.body187.us.preheader191_crit_edge ], [ %indvars.iv24.us.unr.ph, %min.iters.checked142.for.body187.us.preheader191_crit_edge ], [ %indvars.iv24.us.unr.ph, %for.body187.us.preheader.for.body187.us.preheader191_crit_edge ], [ %ind.end178, %middle.block139.for.body187.us.preheader191_crit_edge ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.for.body187.us_crit_edge, %for.body187.us.preheader191
  %indvars.iv24.us = phi i64 [ %indvars.iv.next.us.1, %for.body187.us.for.body187.us_crit_edge ], [ %indvars.iv24.us.ph, %for.body187.us.preheader191 ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %94 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %95 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %94, %95
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %96 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %97 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %96, %97
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv24.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %63
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us.for.body187.us_crit_edge, !llvm.loop !25

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  br label %for.body187.us

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %middle.block139.for.cond185.for.inc205_crit_edge.us_crit_edge, %for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge, %for.cond185.for.inc205_crit_edge.us.loopexit
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv126.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next2.us, %64
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge

for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge: ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.end207:                                       ; preds = %for.cond182.preheader.for.end207_crit_edge, %for.cond92.preheader.lr.ph.for.end207_crit_edge, %for.end207.loopexit
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
  %5 = sext i32 %h to i64
  %cmp7 = icmp sgt i32 %w, 0
  %cmp35 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ], [ 0, %for.cond2.preheader.us.preheader ]
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
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3.us, %4
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #6
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

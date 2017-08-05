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
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %1 = sext i32 %h to i64
  %2 = add nsw i64 %1, -1
  %n.vec = and i64 %1, -4
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv34.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next4.us, %for.cond1.for.inc7_crit_edge.us ]
  %3 = icmp ult i32 %h, 4
  %4 = mul nuw nsw i64 %indvars.iv34.us, 313
  br i1 %3, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  %5 = icmp eq i64 %n.vec, 0
  br i1 %5, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add nuw nsw <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv34.us, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, %n.vec
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %15 = icmp eq i64 %1, %n.vec
  br i1 %15, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv2.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv2.us = phi i64 [ %indvars.iv.next.us, %for.body3.us ], [ %indvars.iv2.us.ph, %for.body3.us.preheader ]
  %16 = mul nuw nsw i64 %indvars.iv2.us, 991
  %17 = add nuw nsw i64 %16, %4
  %18 = trunc i64 %17 to i32
  %rem.us = srem i32 %18, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv34.us, i64 %indvars.iv2.us
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv2.us, %2
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv2.us, 1
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv34.us, 1
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
  %cmp66 = icmp sgt i32 %w, 0
  br i1 %cmp66, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread92

for.cond58.preheader.thread92:                    ; preds = %entry
  %mul1993 = fmul float %call18, %div
  %mul2194 = fmul float %add20, %mul1993
  %mul2595 = fsub float -0.000000e+00, %0
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp3261 = icmp sgt i32 %h, 0
  br i1 %cmp3261, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %3 = add nsw i64 %1, -1
  %mul37.us175 = fmul float %mul16, 0.000000e+00
  %mul39.us177 = fmul float %exp2, 0.000000e+00
  %mul41.us179 = fmul float %call29, -0.000000e+00
  %xtraiter260 = and i64 %3, 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv2167.us = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next22.us, %for.cond31.for.inc55_crit_edge.us ]
  %4 = icmp eq i64 %3, 0
  %arrayidx35.us173 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 0
  %5 = load float, float* %arrayidx35.us173, align 4
  %mul36.us174 = fmul float %div, %5
  %add38.us176 = fadd float %mul37.us175, %mul36.us174
  %add40.us178 = fadd float %mul39.us177, %add38.us176
  %add42.us180 = fadd float %mul41.us179, %add40.us178
  %arrayidx46.us181 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 0
  store float %add42.us180, float* %arrayidx46.us181, align 4
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  %6 = icmp eq i64 %xtraiter260, 0
  br i1 %6, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit, label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  %7 = load float, float* %arrayidx35.us173, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 1
  %8 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %8
  %mul37.us.prol = fmul float %mul16, %7
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us180
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol, %for.body33.us.for.body33.us_crit_edge.preheader
  %add42.us186.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us180, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us185.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us173, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv1962.us184.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.063.us183.unr.ph = phi float [ %add42.us180, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %9 = icmp eq i32 %h, 2
  br i1 %9, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us186 = phi float [ %add42.us186.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us185 = phi float* [ %arrayidx35.us185.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv1962.us184 = phi i64 [ %indvars.iv1962.us184.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next20.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %ym1.063.us183 = phi float [ %ym1.063.us183.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1962.us184, 1
  %10 = load float, float* %arrayidx35.us185, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  %11 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %11
  %mul37.us = fmul float %mul16, %10
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us186
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.063.us183, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next20.us.1 = add nsw i64 %indvars.iv1962.us184, 2
  %12 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us.1
  %13 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %13
  %mul37.us.1 = fmul float %mul16, %12
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us186, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv2167.us, i64 %indvars.iv.next20.us.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond82.1 = icmp eq i64 %indvars.iv.next20.us.1, %3
  br i1 %exitcond82.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2167.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next22.us, %2
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  %indvars.iv.next1657.us159 = add nsw i64 %1, -1
  %mul65.us160 = fmul float %mul21, 0.000000e+00
  %mul66.us161 = fmul float %0, -0.000000e+00
  %add67.us162 = fadd float %mul65.us160, %mul66.us161
  %mul68.us163 = fmul float %exp2, 0.000000e+00
  %add69.us164 = fadd float %add67.us162, %mul68.us163
  %mul70.us165 = fmul float %call29, -0.000000e+00
  %add71.us166 = fadd float %add69.us164, %mul70.us165
  %xtraiter258 = and i64 %3, 1
  %indvars.iv.next1657.us.prol = add nsw i64 %1, -2
  %mul66.us.prol = fmul float %0, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us166
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv1759.us = phi i64 [ %indvars.iv.next18.us, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  %14 = icmp sgt i32 %h, 1
  %arrayidx75.us167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us159
  store float %add71.us166, float* %arrayidx75.us167, align 4
  br i1 %14, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  %15 = icmp eq i64 %xtraiter258, 0
  br i1 %15, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit, label %for.body64.us.for.body64.us_crit_edge.prol

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us159
  %16 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul21, %16
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol, %for.body64.us.for.body64.us_crit_edge.preheader
  %add71.us172.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us166, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next1657.us171.unr.ph = phi i64 [ %indvars.iv.next1657.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %indvars.iv.next1657.us159, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.053.us170.unr.ph = phi float [ %16, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.055.us169.unr.ph = phi float [ %add71.us166, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %17 = icmp eq i32 %h, 2
  br i1 %17, label %for.cond62.for.inc86_crit_edge.us, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us172 = phi float [ %add71.us172.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next1657.us171 = phi i64 [ %indvars.iv.next1657.us171.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next1657.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.053.us170 = phi float [ %xp1.053.us170.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %19, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.055.us169 = phi float [ %yp1.055.us169.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us171
  %18 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next1657.us = add nsw i64 %indvars.iv.next1657.us171, -1
  %mul65.us = fmul float %mul21, %18
  %mul66.us = fmul float %xp1.053.us170, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us172
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.055.us169, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us
  %19 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next1657.us.1 = add nsw i64 %indvars.iv.next1657.us171, -2
  %mul65.us.1 = fmul float %mul21, %19
  %mul66.us.1 = fmul float %18, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us172, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1759.us, i64 %indvars.iv.next1657.us.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next1657.us, 1
  br i1 %cmp63.us.1, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.body64.us.for.body64.us_crit_edge.prol.loopexit, %for.cond62.preheader.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1759.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next18.us, %2
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %20 = add nsw i64 %1, -8
  %21 = lshr i64 %20, 3
  %22 = add nsw i64 %1, -1
  %n.vec = and i64 %1, -8
  %23 = and i64 %21, 1
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv1349.us = phi i64 [ %indvars.iv.next14.us, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %24 = icmp ult i32 %h, 8
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 0
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %1
  %scevgep190 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 0
  %scevgep192 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %1
  %scevgep194 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 0
  %scevgep196 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %1
  br i1 %24, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  %25 = icmp eq i64 %n.vec, 0
  br i1 %25, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep192
  %bound1 = icmp ult float* %scevgep190, %scevgep188
  %found.conflict = and i1 %bound0, %bound1
  %bound0198 = icmp ult float* %scevgep, %scevgep196
  %bound1199 = icmp ult float* %scevgep194, %scevgep188
  %found.conflict200 = and i1 %bound0198, %bound1199
  %conflict.rdx = or i1 %found.conflict, %found.conflict200
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %26 = icmp eq i64 %23, 0
  br i1 %26, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %27 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 0
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !6
  %29 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 4
  %30 = bitcast float* %29 to <4 x float>*
  %wide.load202.prol = load <4 x float>, <4 x float>* %30, align 4, !alias.scope !6
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 0
  %32 = bitcast float* %31 to <4 x float>*
  %wide.load203.prol = load <4 x float>, <4 x float>* %32, align 4, !alias.scope !9
  %33 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 4
  %34 = bitcast float* %33 to <4 x float>*
  %wide.load204.prol = load <4 x float>, <4 x float>* %34, align 4, !alias.scope !9
  %35 = fadd <4 x float> %wide.load.prol, %wide.load203.prol
  %36 = fadd <4 x float> %wide.load202.prol, %wide.load204.prol
  %37 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 0
  %38 = bitcast float* %37 to <4 x float>*
  store <4 x float> %35, <4 x float>* %38, align 4, !alias.scope !11, !noalias !13
  %39 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 4
  %40 = bitcast float* %39 to <4 x float>*
  store <4 x float> %36, <4 x float>* %40, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  %41 = icmp eq i64 %21, 0
  br i1 %41, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %index
  %43 = bitcast float* %42 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %43, align 4, !alias.scope !6
  %44 = getelementptr float, float* %42, i64 4
  %45 = bitcast float* %44 to <4 x float>*
  %wide.load202 = load <4 x float>, <4 x float>* %45, align 4, !alias.scope !6
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %index
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load203 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !9
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load204 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !9
  %50 = fadd <4 x float> %wide.load, %wide.load203
  %51 = fadd <4 x float> %wide.load202, %wide.load204
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %index
  %53 = bitcast float* %52 to <4 x float>*
  store <4 x float> %50, <4 x float>* %53, align 4, !alias.scope !11, !noalias !13
  %54 = getelementptr float, float* %52, i64 4
  %55 = bitcast float* %54 to <4 x float>*
  store <4 x float> %51, <4 x float>* %55, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %56 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %index.next
  %57 = bitcast float* %56 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %57, align 4, !alias.scope !6
  %58 = getelementptr float, float* %56, i64 4
  %59 = bitcast float* %58 to <4 x float>*
  %wide.load202.1 = load <4 x float>, <4 x float>* %59, align 4, !alias.scope !6
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %index.next
  %61 = bitcast float* %60 to <4 x float>*
  %wide.load203.1 = load <4 x float>, <4 x float>* %61, align 4, !alias.scope !9
  %62 = getelementptr float, float* %60, i64 4
  %63 = bitcast float* %62 to <4 x float>*
  %wide.load204.1 = load <4 x float>, <4 x float>* %63, align 4, !alias.scope !9
  %64 = fadd <4 x float> %wide.load.1, %wide.load203.1
  %65 = fadd <4 x float> %wide.load202.1, %wide.load204.1
  %66 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %index.next
  %67 = bitcast float* %66 to <4 x float>*
  store <4 x float> %64, <4 x float>* %67, align 4, !alias.scope !11, !noalias !13
  %68 = getelementptr float, float* %66, i64 4
  %69 = bitcast float* %68 to <4 x float>*
  store <4 x float> %65, <4 x float>* %69, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %70 = icmp eq i64 %index.next.1, %n.vec
  br i1 %70, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %71 = icmp eq i64 %1, %n.vec
  br i1 %71, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv1147.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %72 = sub nsw i64 %1, %indvars.iv1147.us.ph
  %xtraiter256 = and i64 %72, 1
  %lcmp.mod257 = icmp eq i64 %xtraiter256, 0
  br i1 %lcmp.mod257, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us.ph
  %73 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us.ph
  %74 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %73, %74
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next12.us.prol = or i64 %indvars.iv1147.us.ph, 1
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.body94.us.preheader
  %indvars.iv1147.us.unr.ph = phi i64 [ %indvars.iv.next12.us.prol, %for.body94.us.prol ], [ %indvars.iv1147.us.ph, %for.body94.us.preheader ]
  %75 = icmp eq i64 %22, %indvars.iv1147.us.ph
  br i1 %75, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv1147.us = phi i64 [ %indvars.iv1147.us.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next12.us.1, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %76 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  %77 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %76, %77
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv1147.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1147.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  %78 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  %79 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %78, %79
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv1349.us, i64 %indvars.iv.next12.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond79.1 = icmp eq i64 %indvars.iv.next12.us, %3
  %indvars.iv.next12.us.1 = add nsw i64 %indvars.iv1147.us, 2
  br i1 %exitcond79.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.body94.us.prol.loopexit, %middle.block
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1349.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next14.us, %2
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %for.cond58.preheader.thread92
  %mul2188105 = phi float [ %mul2194, %for.cond58.preheader.thread92 ], [ %mul21, %for.cond115.preheader.loopexit ]
  %mul2590103 = phi float [ %mul2595, %for.cond58.preheader.thread92 ], [ %mul25, %for.cond115.preheader.loopexit ]
  %cmp11643 = icmp sgt i32 %h, 0
  br i1 %cmp11643, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %80 = icmp sgt i32 %w, 0
  br i1 %80, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %81 = add nsw i64 %2, -1
  %mul126.us147 = fmul float %mul16, 0.000000e+00
  %mul128.us149 = fmul float %exp2, 0.000000e+00
  %mul130.us151 = fmul float %call29, -0.000000e+00
  %xtraiter252 = and i64 %81, 1
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv944.us = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.cond118.for.inc147_crit_edge.us ]
  %82 = icmp eq i64 %81, 0
  %arrayidx124.us145 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv944.us
  %83 = load float, float* %arrayidx124.us145, align 4
  %mul125.us146 = fmul float %div, %83
  %add127.us148 = fadd float %mul126.us147, %mul125.us146
  %add129.us150 = fadd float %mul128.us149, %add127.us148
  %add131.us152 = fadd float %mul130.us151, %add129.us150
  %arrayidx135.us153 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv944.us
  store float %add131.us152, float* %arrayidx135.us153, align 4
  br i1 %82, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  %84 = icmp eq i64 %xtraiter252, 0
  br i1 %84, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit, label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  %85 = ptrtoint [2160 x float]* %imgOut to i64
  %sunkaddr262 = shl i64 %indvars.iv944.us, 2
  %sunkaddr263 = add i64 %85, %sunkaddr262
  %sunkaddr264 = inttoptr i64 %sunkaddr263 to float*
  %86 = load float, float* %sunkaddr264, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv944.us
  %87 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %87
  %mul126.us.prol = fmul float %mul16, %86
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us152
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv944.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol, %for.body120.us.for.body120.us_crit_edge.preheader
  %add131.us158.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us152, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us157.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us145, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv739.us156.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %ym1.140.us155.unr.ph = phi float [ %add131.us152, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %88 = icmp eq i32 %w, 2
  br i1 %88, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us158 = phi float [ %add131.us158.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us157 = phi float* [ %arrayidx124.us157.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv739.us156 = phi i64 [ %indvars.iv739.us156.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next8.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.140.us155 = phi float [ %ym1.140.us155.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv739.us156, 1
  %89 = load float, float* %arrayidx124.us157, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  %90 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %90
  %mul126.us = fmul float %mul16, %89
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us158
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.140.us155, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us, i64 %indvars.iv944.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next8.us.1 = add nsw i64 %indvars.iv739.us156, 2
  %91 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next8.us.1, i64 %indvars.iv944.us
  %92 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %92
  %mul126.us.1 = fmul float %mul16, %91
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us158, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next8.us.1, i64 %indvars.iv944.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond77.1 = icmp eq i64 %indvars.iv.next8.us.1, %81
  br i1 %exitcond77.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv944.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next10.us, %1
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %indvars.iv.next434.us131 = add nsw i64 %2, -1
  %mul157.us132 = fmul float %mul2188105, 0.000000e+00
  %mul158.us133 = fmul float %mul2590103, 0.000000e+00
  %add159.us134 = fadd float %mul157.us132, %mul158.us133
  %mul160.us135 = fmul float %exp2, 0.000000e+00
  %add161.us136 = fadd float %add159.us134, %mul160.us135
  %mul162.us137 = fmul float %call29, -0.000000e+00
  %add163.us138 = fadd float %add161.us136, %mul162.us137
  %93 = and i64 %2, 1
  %indvars.iv.next434.us.prol = add nsw i64 %2, -2
  %mul158.us.prol = fmul float %mul2590103, 0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us138
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv536.us = phi i64 [ %indvars.iv.next6.us, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %94 = icmp sgt i32 %w, 1
  %arrayidx167.us139 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us131, i64 %indvars.iv536.us
  store float %add163.us138, float* %arrayidx167.us139, align 4
  br i1 %94, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  %95 = icmp eq i64 %93, 0
  br i1 %95, label %for.body156.us.for.body156.us_crit_edge.prol, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us131, i64 %indvars.iv536.us
  %96 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul2188105, %96
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us.prol, i64 %indvars.iv536.us
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol, %for.body156.us.for.body156.us_crit_edge.preheader
  %add163.us144.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us138, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next434.us143.unr.ph = phi i64 [ %indvars.iv.next434.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %indvars.iv.next434.us131, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.030.us142.unr.ph = phi float [ %96, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.132.us141.unr.ph = phi float [ %add163.us138, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %97 = icmp eq i32 %w, 2
  br i1 %97, label %for.cond154.for.inc179_crit_edge.us, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us144 = phi float [ %add163.us144.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next434.us143 = phi i64 [ %indvars.iv.next434.us143.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next434.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.030.us142 = phi float [ %tp1.030.us142.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %99, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.132.us141 = phi float [ %yp1.132.us141.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us143, i64 %indvars.iv536.us
  %98 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next434.us = add nsw i64 %indvars.iv.next434.us143, -1
  %mul157.us = fmul float %mul2188105, %98
  %mul158.us = fmul float %tp1.030.us142, %mul2590103
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us144
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.132.us141, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us, i64 %indvars.iv536.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next434.us, i64 %indvars.iv536.us
  %99 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next434.us.1 = add nsw i64 %indvars.iv.next434.us143, -2
  %mul157.us.1 = fmul float %mul2188105, %99
  %mul158.us.1 = fmul float %98, %mul2590103
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us144, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next434.us.1, i64 %indvars.iv536.us
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next434.us, 1
  br i1 %cmp155.us.1, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.body156.us.for.body156.us_crit_edge.prol.loopexit, %for.cond154.preheader.us
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv536.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next6.us, %1
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %100 = icmp sgt i32 %h, 0
  %101 = icmp sgt i32 %w, 0
  %or.cond = and i1 %101, %100
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %102 = add nsw i64 %1, -1
  %103 = add nsw i64 %1, -8
  %104 = lshr i64 %103, 3
  %105 = add nsw i64 %1, -1
  %n.vec211 = and i64 %1, -8
  %106 = and i64 %104, 1
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv126.us = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next2.us, %for.cond185.for.inc205_crit_edge.us ]
  %107 = icmp ult i32 %h, 8
  %scevgep214 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 0
  %scevgep216 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %1
  %scevgep218 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 0
  %scevgep220 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %1
  %scevgep222 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 0
  %scevgep224 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %1
  br i1 %107, label %for.body187.us.preheader, label %min.iters.checked209

min.iters.checked209:                             ; preds = %for.cond185.preheader.us
  %108 = icmp eq i64 %n.vec211, 0
  br i1 %108, label %for.body187.us.preheader, label %vector.memcheck234

vector.memcheck234:                               ; preds = %min.iters.checked209
  %bound0226 = icmp ult float* %scevgep214, %scevgep220
  %bound1227 = icmp ult float* %scevgep218, %scevgep216
  %found.conflict228 = and i1 %bound0226, %bound1227
  %bound0229 = icmp ult float* %scevgep214, %scevgep224
  %bound1230 = icmp ult float* %scevgep222, %scevgep216
  %found.conflict231 = and i1 %bound0229, %bound1230
  %conflict.rdx232 = or i1 %found.conflict228, %found.conflict231
  br i1 %conflict.rdx232, label %for.body187.us.preheader, label %vector.body205.preheader

vector.body205.preheader:                         ; preds = %vector.memcheck234
  %109 = icmp eq i64 %106, 0
  br i1 %109, label %vector.body205.prol, label %vector.body205.prol.loopexit

vector.body205.prol:                              ; preds = %vector.body205.preheader
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 0
  %111 = bitcast float* %110 to <4 x float>*
  %wide.load244.prol = load <4 x float>, <4 x float>* %111, align 4, !alias.scope !16
  %112 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 4
  %113 = bitcast float* %112 to <4 x float>*
  %wide.load245.prol = load <4 x float>, <4 x float>* %113, align 4, !alias.scope !16
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 0
  %115 = bitcast float* %114 to <4 x float>*
  %wide.load246.prol = load <4 x float>, <4 x float>* %115, align 4, !alias.scope !19
  %116 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 4
  %117 = bitcast float* %116 to <4 x float>*
  %wide.load247.prol = load <4 x float>, <4 x float>* %117, align 4, !alias.scope !19
  %118 = fadd <4 x float> %wide.load244.prol, %wide.load246.prol
  %119 = fadd <4 x float> %wide.load245.prol, %wide.load247.prol
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 0
  %121 = bitcast float* %120 to <4 x float>*
  store <4 x float> %118, <4 x float>* %121, align 4, !alias.scope !21, !noalias !23
  %122 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 4
  %123 = bitcast float* %122 to <4 x float>*
  store <4 x float> %119, <4 x float>* %123, align 4, !alias.scope !21, !noalias !23
  br label %vector.body205.prol.loopexit

vector.body205.prol.loopexit:                     ; preds = %vector.body205.prol, %vector.body205.preheader
  %index236.unr.ph = phi i64 [ 8, %vector.body205.prol ], [ 0, %vector.body205.preheader ]
  %124 = icmp eq i64 %104, 0
  br i1 %124, label %middle.block206, label %vector.body205.preheader.new

vector.body205.preheader.new:                     ; preds = %vector.body205.prol.loopexit
  br label %vector.body205

vector.body205:                                   ; preds = %vector.body205, %vector.body205.preheader.new
  %index236 = phi i64 [ %index236.unr.ph, %vector.body205.preheader.new ], [ %index.next237.1, %vector.body205 ]
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %index236
  %126 = bitcast float* %125 to <4 x float>*
  %wide.load244 = load <4 x float>, <4 x float>* %126, align 4, !alias.scope !16
  %127 = getelementptr float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  %wide.load245 = load <4 x float>, <4 x float>* %128, align 4, !alias.scope !16
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %index236
  %130 = bitcast float* %129 to <4 x float>*
  %wide.load246 = load <4 x float>, <4 x float>* %130, align 4, !alias.scope !19
  %131 = getelementptr float, float* %129, i64 4
  %132 = bitcast float* %131 to <4 x float>*
  %wide.load247 = load <4 x float>, <4 x float>* %132, align 4, !alias.scope !19
  %133 = fadd <4 x float> %wide.load244, %wide.load246
  %134 = fadd <4 x float> %wide.load245, %wide.load247
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %index236
  %136 = bitcast float* %135 to <4 x float>*
  store <4 x float> %133, <4 x float>* %136, align 4, !alias.scope !21, !noalias !23
  %137 = getelementptr float, float* %135, i64 4
  %138 = bitcast float* %137 to <4 x float>*
  store <4 x float> %134, <4 x float>* %138, align 4, !alias.scope !21, !noalias !23
  %index.next237 = add i64 %index236, 8
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %index.next237
  %140 = bitcast float* %139 to <4 x float>*
  %wide.load244.1 = load <4 x float>, <4 x float>* %140, align 4, !alias.scope !16
  %141 = getelementptr float, float* %139, i64 4
  %142 = bitcast float* %141 to <4 x float>*
  %wide.load245.1 = load <4 x float>, <4 x float>* %142, align 4, !alias.scope !16
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %index.next237
  %144 = bitcast float* %143 to <4 x float>*
  %wide.load246.1 = load <4 x float>, <4 x float>* %144, align 4, !alias.scope !19
  %145 = getelementptr float, float* %143, i64 4
  %146 = bitcast float* %145 to <4 x float>*
  %wide.load247.1 = load <4 x float>, <4 x float>* %146, align 4, !alias.scope !19
  %147 = fadd <4 x float> %wide.load244.1, %wide.load246.1
  %148 = fadd <4 x float> %wide.load245.1, %wide.load247.1
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %index.next237
  %150 = bitcast float* %149 to <4 x float>*
  store <4 x float> %147, <4 x float>* %150, align 4, !alias.scope !21, !noalias !23
  %151 = getelementptr float, float* %149, i64 4
  %152 = bitcast float* %151 to <4 x float>*
  store <4 x float> %148, <4 x float>* %152, align 4, !alias.scope !21, !noalias !23
  %index.next237.1 = add i64 %index236, 16
  %153 = icmp eq i64 %index.next237.1, %n.vec211
  br i1 %153, label %middle.block206.loopexit, label %vector.body205, !llvm.loop !24

middle.block206.loopexit:                         ; preds = %vector.body205
  br label %middle.block206

middle.block206:                                  ; preds = %middle.block206.loopexit, %vector.body205.prol.loopexit
  %154 = icmp eq i64 %1, %n.vec211
  br i1 %154, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block206, %vector.memcheck234, %min.iters.checked209, %for.cond185.preheader.us
  %indvars.iv24.us.ph = phi i64 [ 0, %vector.memcheck234 ], [ 0, %min.iters.checked209 ], [ 0, %for.cond185.preheader.us ], [ %n.vec211, %middle.block206 ]
  %155 = sub nsw i64 %1, %indvars.iv24.us.ph
  %xtraiter248 = and i64 %155, 1
  %lcmp.mod249 = icmp eq i64 %xtraiter248, 0
  br i1 %lcmp.mod249, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us.ph
  %156 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us.ph
  %157 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %156, %157
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.us.prol = or i64 %indvars.iv24.us.ph, 1
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.body187.us.preheader
  %indvars.iv24.us.unr.ph = phi i64 [ %indvars.iv.next.us.prol, %for.body187.us.prol ], [ %indvars.iv24.us.ph, %for.body187.us.preheader ]
  %158 = icmp eq i64 %105, %indvars.iv24.us.ph
  br i1 %158, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv24.us = phi i64 [ %indvars.iv24.us.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.us.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %159 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  %160 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %159, %160
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv24.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %161 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  %162 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %161, %162
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv126.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us, %102
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv24.us, 2
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.body187.us.prol.loopexit, %middle.block206
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv126.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next2.us, %2
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207.loopexit

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
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  %cmp7 = icmp sgt i32 %w, 0
  %cmp35 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv28.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %6 = add nsw i64 %indvars.iv6.us, %5
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next3.us, %4
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

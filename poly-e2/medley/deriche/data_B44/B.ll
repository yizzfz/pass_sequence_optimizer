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
  %2 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
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
  %0 = sext i32 %w to i64
  %cmp8 = icmp sgt i32 %w, 0
  %cmp26 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.end9

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %entry
  %1 = sext i32 %h to i64
  %2 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %indvars.iv39.us = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %indvars.iv.next4.us, %for.cond1.for.inc7_crit_edge.us ]
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
  %cmp184 = icmp sgt i32 %w, 0
  br i1 %cmp184, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread204

for.cond58.preheader.thread204:                   ; preds = %entry
  %mul19205 = fmul float %call18, %div
  %mul21206 = fmul float %add20, %mul19205
  %mul25207 = fsub float -0.000000e+00, %0
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32179 = icmp sgt i32 %h, 0
  br i1 %cmp32179, label %for.cond31.preheader.lr.ph.for.cond31.preheader.us_crit_edge, label %for.end207

for.cond31.preheader.lr.ph.for.cond31.preheader.us_crit_edge: ; preds = %for.cond31.preheader.lr.ph
  %3 = add nsw i64 %1, -1
  %mul37.us287 = fmul float %mul16, 0.000000e+00
  %mul39.us289 = fmul float %exp2, 0.000000e+00
  %mul41.us291 = fmul float %call29, -0.000000e+00
  %exitcond194294 = icmp eq i64 %3, 0
  %xtraiter372 = and i64 %3, 1
  %lcmp.mod373 = icmp eq i64 %xtraiter372, 0
  %4 = icmp eq i32 %h, 2
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.lr.ph.for.cond31.preheader.us_crit_edge
  %indvars.iv139185.us = phi i64 [ 0, %for.cond31.preheader.lr.ph.for.cond31.preheader.us_crit_edge ], [ %indvars.iv.next140.us, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us285 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 0
  %5 = load float, float* %arrayidx35.us285, align 4
  %mul36.us286 = fmul float %div, %5
  %add38.us288 = fadd float %mul37.us287, %mul36.us286
  %add40.us290 = fadd float %mul39.us289, %add38.us288
  %add42.us292 = fadd float %mul41.us291, %add40.us290
  %arrayidx46.us293 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 0
  store float %add42.us292, float* %arrayidx46.us293, align 4
  br i1 %exitcond194294, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod373, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit, label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us285, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us292
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol, %for.body33.us.for.body33.us_crit_edge.preheader
  %add42.us298.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us292, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us297.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us285, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv137180.us296.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.0182.us295.unr.ph = phi float [ %add42.us292, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us298 = phi float [ %add42.us298.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us297 = phi float* [ %arrayidx35.us297.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv137180.us296 = phi i64 [ %indvars.iv137180.us296.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next138.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %ym1.0182.us295 = phi float [ %ym1.0182.us295.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next138.us = add nuw nsw i64 %indvars.iv137180.us296, 1
  %8 = load float, float* %arrayidx35.us297, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us298
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.0182.us295, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next138.us.1 = add nsw i64 %indvars.iv137180.us296, 2
  %10 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us.1
  %11 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %11
  %mul37.us.1 = fmul float %mul16, %10
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us298, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond194.1 = icmp eq i64 %indvars.iv.next138.us.1, %3
  br i1 %exitcond194.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next140.us = add nuw nsw i64 %indvars.iv139185.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next140.us, %2
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  %indvars.iv.next134175.us271 = add nsw i64 %1, -1
  %mul65.us272 = fmul float %mul21, 0.000000e+00
  %mul66.us273 = fmul float %0, -0.000000e+00
  %add67.us274 = fadd float %mul66.us273, %mul65.us272
  %mul68.us275 = fmul float %exp2, 0.000000e+00
  %add69.us276 = fadd float %mul68.us275, %add67.us274
  %mul70.us277 = fmul float %call29, -0.000000e+00
  %add71.us278 = fadd float %mul70.us277, %add69.us276
  %cmp63.us280 = icmp sgt i32 %h, 1
  %xtraiter370 = and i64 %3, 1
  %lcmp.mod371 = icmp eq i64 %xtraiter370, 0
  %12 = icmp eq i32 %h, 2
  %indvars.iv.next134175.us.prol = add nsw i64 %1, -2
  %mul66.us.prol = fmul float %0, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us278
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv135177.us = phi i64 [ %indvars.iv.next136.us, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  %arrayidx75.us279 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us271
  store float %add71.us278, float* %arrayidx75.us279, align 4
  br i1 %cmp63.us280, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod371, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit, label %for.body64.us.for.body64.us_crit_edge.prol

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us271
  %13 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul21, %13
  %add67.us.prol = fadd float %mul66.us.prol, %mul65.us.prol
  %add69.us.prol = fadd float %mul68.us.prol, %add67.us.prol
  %add71.us.prol = fadd float %mul70.us.prol, %add69.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol, %for.body64.us.for.body64.us_crit_edge.preheader
  %add71.us284.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us278, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next134175.us283.unr.ph = phi i64 [ %indvars.iv.next134175.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %indvars.iv.next134175.us271, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.0172.us282.unr.ph = phi float [ %add71.us278, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.0174.us281.unr.ph = phi float [ %13, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  br i1 %12, label %for.cond62.for.inc86_crit_edge.us, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us284 = phi float [ %add71.us284.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next134175.us283 = phi i64 [ %indvars.iv.next134175.us283.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next134175.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.0172.us282 = phi float [ %yp1.0172.us282.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.0174.us281 = phi float [ %xp1.0174.us281.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %15, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us283
  %14 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next134175.us = add nsw i64 %indvars.iv.next134175.us283, -1
  %mul65.us = fmul float %mul21, %14
  %mul66.us = fmul float %xp1.0174.us281, %mul25
  %add67.us = fadd float %mul66.us, %mul65.us
  %mul68.us = fmul float %exp2, %add71.us284
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %yp1.0172.us282, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us
  %15 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next134175.us.1 = add nsw i64 %indvars.iv.next134175.us283, -2
  %mul65.us.1 = fmul float %mul21, %15
  %mul66.us.1 = fmul float %14, %mul25
  %add67.us.1 = fadd float %mul66.us.1, %mul65.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %mul68.us.1, %add67.us.1
  %mul70.us.1 = fmul float %add71.us284, %sub30
  %add71.us.1 = fadd float %mul70.us.1, %add69.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next134175.us, 1
  br i1 %cmp63.us.1, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.body64.us.for.body64.us_crit_edge.prol.loopexit, %for.cond62.preheader.us
  %indvars.iv.next136.us = add nuw nsw i64 %indvars.iv135177.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next136.us, %2
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %16 = add nsw i64 %1, -8
  %17 = lshr i64 %16, 3
  %18 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 8
  %n.vec = and i64 %1, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %19 = and i64 %17, 1
  %lcmp.mod367 = icmp eq i64 %19, 0
  %20 = icmp eq i64 %17, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv131167.us = phi i64 [ %indvars.iv.next132.us, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 0
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %1
  %scevgep302 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 0
  %scevgep304 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %1
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 0
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %1
  br i1 %min.iters.check, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep304
  %bound1 = icmp ult float* %scevgep302, %scevgep300
  %found.conflict = and i1 %bound0, %bound1
  %bound0310 = icmp ult float* %scevgep, %scevgep308
  %bound1311 = icmp ult float* %scevgep306, %scevgep300
  %found.conflict312 = and i1 %bound0310, %bound1311
  %conflict.rdx = or i1 %found.conflict, %found.conflict312
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod367, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 0
  %22 = bitcast float* %21 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %22, align 4, !alias.scope !6
  %23 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 4
  %24 = bitcast float* %23 to <4 x float>*
  %wide.load314.prol = load <4 x float>, <4 x float>* %24, align 4, !alias.scope !6
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 0
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load315.prol = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !9
  %27 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load316.prol = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !9
  %29 = fadd <4 x float> %wide.load.prol, %wide.load315.prol
  %30 = fadd <4 x float> %wide.load314.prol, %wide.load316.prol
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 0
  %32 = bitcast float* %31 to <4 x float>*
  store <4 x float> %29, <4 x float>* %32, align 4, !alias.scope !11, !noalias !13
  %33 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 4
  %34 = bitcast float* %33 to <4 x float>*
  store <4 x float> %30, <4 x float>* %34, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %index
  %36 = bitcast float* %35 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %36, align 4, !alias.scope !6
  %37 = getelementptr float, float* %35, i64 4
  %38 = bitcast float* %37 to <4 x float>*
  %wide.load314 = load <4 x float>, <4 x float>* %38, align 4, !alias.scope !6
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %index
  %40 = bitcast float* %39 to <4 x float>*
  %wide.load315 = load <4 x float>, <4 x float>* %40, align 4, !alias.scope !9
  %41 = getelementptr float, float* %39, i64 4
  %42 = bitcast float* %41 to <4 x float>*
  %wide.load316 = load <4 x float>, <4 x float>* %42, align 4, !alias.scope !9
  %43 = fadd <4 x float> %wide.load, %wide.load315
  %44 = fadd <4 x float> %wide.load314, %wide.load316
  %45 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %index
  %46 = bitcast float* %45 to <4 x float>*
  store <4 x float> %43, <4 x float>* %46, align 4, !alias.scope !11, !noalias !13
  %47 = getelementptr float, float* %45, i64 4
  %48 = bitcast float* %47 to <4 x float>*
  store <4 x float> %44, <4 x float>* %48, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %index.next
  %50 = bitcast float* %49 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %50, align 4, !alias.scope !6
  %51 = getelementptr float, float* %49, i64 4
  %52 = bitcast float* %51 to <4 x float>*
  %wide.load314.1 = load <4 x float>, <4 x float>* %52, align 4, !alias.scope !6
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %index.next
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load315.1 = load <4 x float>, <4 x float>* %54, align 4, !alias.scope !9
  %55 = getelementptr float, float* %53, i64 4
  %56 = bitcast float* %55 to <4 x float>*
  %wide.load316.1 = load <4 x float>, <4 x float>* %56, align 4, !alias.scope !9
  %57 = fadd <4 x float> %wide.load.1, %wide.load315.1
  %58 = fadd <4 x float> %wide.load314.1, %wide.load316.1
  %59 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %index.next
  %60 = bitcast float* %59 to <4 x float>*
  store <4 x float> %57, <4 x float>* %60, align 4, !alias.scope !11, !noalias !13
  %61 = getelementptr float, float* %59, i64 4
  %62 = bitcast float* %61 to <4 x float>*
  store <4 x float> %58, <4 x float>* %62, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %63 = icmp eq i64 %index.next.1, %n.vec
  br i1 %63, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv129165.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %64 = sub nsw i64 %1, %indvars.iv129165.us.ph
  %xtraiter368 = and i64 %64, 1
  %lcmp.mod369 = icmp eq i64 %xtraiter368, 0
  br i1 %lcmp.mod369, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us.ph
  %65 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us.ph
  %66 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %65, %66
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next130.us.prol = or i64 %indvars.iv129165.us.ph, 1
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.body94.us.preheader
  %indvars.iv129165.us.unr.ph = phi i64 [ %indvars.iv.next130.us.prol, %for.body94.us.prol ], [ %indvars.iv129165.us.ph, %for.body94.us.preheader ]
  %67 = icmp eq i64 %18, %indvars.iv129165.us.ph
  br i1 %67, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv129165.us = phi i64 [ %indvars.iv129165.us.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next130.us.1, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  %68 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  %69 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %68, %69
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next130.us = add nuw nsw i64 %indvars.iv129165.us, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %indvars.iv.next130.us
  %70 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %indvars.iv.next130.us
  %71 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %70, %71
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %indvars.iv.next130.us
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond191.1 = icmp eq i64 %indvars.iv.next130.us, %3
  %indvars.iv.next130.us.1 = add nsw i64 %indvars.iv129165.us, 2
  br i1 %exitcond191.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.body94.us.prol.loopexit, %middle.block
  %indvars.iv.next132.us = add nuw nsw i64 %indvars.iv131167.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next132.us, %2
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %for.cond58.preheader.thread204
  %mul21200217 = phi float [ %mul21206, %for.cond58.preheader.thread204 ], [ %mul21, %for.cond115.preheader.loopexit ]
  %mul25202215 = phi float [ %mul25207, %for.cond58.preheader.thread204 ], [ %mul25, %for.cond115.preheader.loopexit ]
  %cmp116161 = icmp sgt i32 %h, 0
  br i1 %cmp116161, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %72 = icmp sgt i32 %w, 0
  br i1 %72, label %for.cond118.preheader.lr.ph.for.cond118.preheader.us_crit_edge, label %for.end207

for.cond118.preheader.lr.ph.for.cond118.preheader.us_crit_edge: ; preds = %for.cond118.preheader.lr.ph
  %73 = add nsw i64 %2, -1
  %mul126.us259 = fmul float %mul16, 0.000000e+00
  %mul128.us261 = fmul float %exp2, 0.000000e+00
  %mul130.us263 = fmul float %call29, -0.000000e+00
  %exitcond189266 = icmp eq i64 %73, 0
  %xtraiter364 = and i64 %73, 1
  %lcmp.mod365 = icmp eq i64 %xtraiter364, 0
  %74 = icmp eq i32 %w, 2
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.lr.ph.for.cond118.preheader.us_crit_edge
  %indvars.iv127162.us = phi i64 [ 0, %for.cond118.preheader.lr.ph.for.cond118.preheader.us_crit_edge ], [ %indvars.iv.next128.us, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us257 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv127162.us
  %75 = load float, float* %arrayidx124.us257, align 4
  %mul125.us258 = fmul float %div, %75
  %add127.us260 = fadd float %mul126.us259, %mul125.us258
  %add129.us262 = fadd float %mul128.us261, %add127.us260
  %add131.us264 = fadd float %mul130.us263, %add129.us262
  %arrayidx135.us265 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv127162.us
  store float %add131.us264, float* %arrayidx135.us265, align 4
  br i1 %exitcond189266, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod365, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit, label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  %sunkaddr374 = mul i64 %indvars.iv127162.us, 4
  %sunkaddr375 = add i64 %sunkaddr, %sunkaddr374
  %sunkaddr376 = inttoptr i64 %sunkaddr375 to float*
  %76 = load float, float* %sunkaddr376, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv127162.us
  %77 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %77
  %mul126.us.prol = fmul float %mul16, %76
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us264
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv127162.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol, %for.body120.us.for.body120.us_crit_edge.preheader
  %add131.us270.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us264, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us269.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us257, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv125157.us268.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %ym1.1159.us267.unr.ph = phi float [ %add131.us264, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  br i1 %74, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us270 = phi float [ %add131.us270.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us269 = phi float* [ %arrayidx124.us269.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv125157.us268 = phi i64 [ %indvars.iv125157.us268.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next126.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.1159.us267 = phi float [ %ym1.1159.us267.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next126.us = add nuw nsw i64 %indvars.iv125157.us268, 1
  %78 = load float, float* %arrayidx124.us269, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next126.us, i64 %indvars.iv127162.us
  %79 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %79
  %mul126.us = fmul float %mul16, %78
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us270
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.1159.us267, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next126.us, i64 %indvars.iv127162.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next126.us.1 = add nsw i64 %indvars.iv125157.us268, 2
  %80 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next126.us.1, i64 %indvars.iv127162.us
  %81 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %81
  %mul126.us.1 = fmul float %mul16, %80
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us270, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next126.us.1, i64 %indvars.iv127162.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond189.1 = icmp eq i64 %indvars.iv.next126.us.1, %73
  br i1 %exitcond189.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next128.us = add nuw nsw i64 %indvars.iv127162.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next128.us, %1
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %indvars.iv.next122152.us243 = add nsw i64 %2, -1
  %mul157.us244 = fmul float %mul21200217, 0.000000e+00
  %mul158.us245 = fmul float %mul25202215, 0.000000e+00
  %add159.us246 = fadd float %mul158.us245, %mul157.us244
  %mul160.us247 = fmul float %exp2, 0.000000e+00
  %add161.us248 = fadd float %mul160.us247, %add159.us246
  %mul162.us249 = fmul float %call29, -0.000000e+00
  %add163.us250 = fadd float %mul162.us249, %add161.us248
  %cmp155.us252 = icmp sgt i32 %w, 1
  %82 = and i64 %2, 1
  %lcmp.mod363 = icmp eq i64 %82, 0
  %indvars.iv.next122152.us.prol = add nsw i64 %2, -2
  %mul158.us.prol = fmul float %mul25202215, 0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us250
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %83 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv123154.us = phi i64 [ %indvars.iv.next124.us, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us251 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us243, i64 %indvars.iv123154.us
  store float %add163.us250, float* %arrayidx167.us251, align 4
  br i1 %cmp155.us252, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod363, label %for.body156.us.for.body156.us_crit_edge.prol, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us243, i64 %indvars.iv123154.us
  %84 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul21200217, %84
  %add159.us.prol = fadd float %mul158.us.prol, %mul157.us.prol
  %add161.us.prol = fadd float %mul160.us.prol, %add159.us.prol
  %add163.us.prol = fadd float %mul162.us.prol, %add161.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us.prol, i64 %indvars.iv123154.us
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol, %for.body156.us.for.body156.us_crit_edge.preheader
  %add163.us256.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us250, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next122152.us255.unr.ph = phi i64 [ %indvars.iv.next122152.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %indvars.iv.next122152.us243, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.1149.us254.unr.ph = phi float [ %add163.us250, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.0151.us253.unr.ph = phi float [ %84, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  br i1 %83, label %for.cond154.for.inc179_crit_edge.us, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us256 = phi float [ %add163.us256.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next122152.us255 = phi i64 [ %indvars.iv.next122152.us255.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next122152.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.1149.us254 = phi float [ %yp1.1149.us254.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.0151.us253 = phi float [ %tp1.0151.us253.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %86, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us255, i64 %indvars.iv123154.us
  %85 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next122152.us = add nsw i64 %indvars.iv.next122152.us255, -1
  %mul157.us = fmul float %mul21200217, %85
  %mul158.us = fmul float %tp1.0151.us253, %mul25202215
  %add159.us = fadd float %mul158.us, %mul157.us
  %mul160.us = fmul float %exp2, %add163.us256
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %yp1.1149.us254, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us, i64 %indvars.iv123154.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us, i64 %indvars.iv123154.us
  %86 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next122152.us.1 = add nsw i64 %indvars.iv.next122152.us255, -2
  %mul157.us.1 = fmul float %mul21200217, %86
  %mul158.us.1 = fmul float %85, %mul25202215
  %add159.us.1 = fadd float %mul158.us.1, %mul157.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %mul160.us.1, %add159.us.1
  %mul162.us.1 = fmul float %add163.us256, %sub30
  %add163.us.1 = fadd float %mul162.us.1, %add161.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us.1, i64 %indvars.iv123154.us
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next122152.us, 1
  br i1 %cmp155.us.1, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.body156.us.for.body156.us_crit_edge.prol.loopexit, %for.cond154.preheader.us
  %indvars.iv.next124.us = add nuw nsw i64 %indvars.iv123154.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next124.us, %1
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %87 = icmp sgt i32 %h, 0
  %88 = icmp sgt i32 %w, 0
  %or.cond = and i1 %88, %87
  br i1 %or.cond, label %for.cond185.preheader.lr.ph.for.cond185.preheader.us_crit_edge, label %for.end207

for.cond185.preheader.lr.ph.for.cond185.preheader.us_crit_edge: ; preds = %for.cond182.preheader
  %89 = add nsw i64 %1, -1
  %90 = add nsw i64 %1, -8
  %91 = lshr i64 %90, 3
  %92 = add nsw i64 %1, -1
  %min.iters.check320 = icmp ult i32 %h, 8
  %n.vec323 = and i64 %1, -8
  %cmp.zero324 = icmp eq i64 %n.vec323, 0
  %93 = and i64 %91, 1
  %lcmp.mod = icmp eq i64 %93, 0
  %94 = icmp eq i64 %91, 0
  %cmp.n351 = icmp eq i64 %1, %n.vec323
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.lr.ph.for.cond185.preheader.us_crit_edge
  %indvars.iv119144.us = phi i64 [ 0, %for.cond185.preheader.lr.ph.for.cond185.preheader.us_crit_edge ], [ %indvars.iv.next120.us, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep326 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 0
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %1
  %scevgep330 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 0
  %scevgep332 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %1
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 0
  %scevgep336 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %1
  br i1 %min.iters.check320, label %for.body187.us.preheader, label %min.iters.checked321

min.iters.checked321:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero324, label %for.body187.us.preheader, label %vector.memcheck346

vector.memcheck346:                               ; preds = %min.iters.checked321
  %bound0338 = icmp ult float* %scevgep326, %scevgep332
  %bound1339 = icmp ult float* %scevgep330, %scevgep328
  %found.conflict340 = and i1 %bound0338, %bound1339
  %bound0341 = icmp ult float* %scevgep326, %scevgep336
  %bound1342 = icmp ult float* %scevgep334, %scevgep328
  %found.conflict343 = and i1 %bound0341, %bound1342
  %conflict.rdx344 = or i1 %found.conflict340, %found.conflict343
  br i1 %conflict.rdx344, label %for.body187.us.preheader, label %vector.body317.preheader

vector.body317.preheader:                         ; preds = %vector.memcheck346
  br i1 %lcmp.mod, label %vector.body317.prol, label %vector.body317.prol.loopexit

vector.body317.prol:                              ; preds = %vector.body317.preheader
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 0
  %96 = bitcast float* %95 to <4 x float>*
  %wide.load356.prol = load <4 x float>, <4 x float>* %96, align 4, !alias.scope !16
  %97 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  %wide.load357.prol = load <4 x float>, <4 x float>* %98, align 4, !alias.scope !16
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 0
  %100 = bitcast float* %99 to <4 x float>*
  %wide.load358.prol = load <4 x float>, <4 x float>* %100, align 4, !alias.scope !19
  %101 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 4
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load359.prol = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !19
  %103 = fadd <4 x float> %wide.load356.prol, %wide.load358.prol
  %104 = fadd <4 x float> %wide.load357.prol, %wide.load359.prol
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 0
  %106 = bitcast float* %105 to <4 x float>*
  store <4 x float> %103, <4 x float>* %106, align 4, !alias.scope !21, !noalias !23
  %107 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  store <4 x float> %104, <4 x float>* %108, align 4, !alias.scope !21, !noalias !23
  br label %vector.body317.prol.loopexit

vector.body317.prol.loopexit:                     ; preds = %vector.body317.prol, %vector.body317.preheader
  %index348.unr.ph = phi i64 [ 8, %vector.body317.prol ], [ 0, %vector.body317.preheader ]
  br i1 %94, label %middle.block318, label %vector.body317.preheader.new

vector.body317.preheader.new:                     ; preds = %vector.body317.prol.loopexit
  br label %vector.body317

vector.body317:                                   ; preds = %vector.body317, %vector.body317.preheader.new
  %index348 = phi i64 [ %index348.unr.ph, %vector.body317.preheader.new ], [ %index.next349.1, %vector.body317 ]
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %index348
  %110 = bitcast float* %109 to <4 x float>*
  %wide.load356 = load <4 x float>, <4 x float>* %110, align 4, !alias.scope !16
  %111 = getelementptr float, float* %109, i64 4
  %112 = bitcast float* %111 to <4 x float>*
  %wide.load357 = load <4 x float>, <4 x float>* %112, align 4, !alias.scope !16
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %index348
  %114 = bitcast float* %113 to <4 x float>*
  %wide.load358 = load <4 x float>, <4 x float>* %114, align 4, !alias.scope !19
  %115 = getelementptr float, float* %113, i64 4
  %116 = bitcast float* %115 to <4 x float>*
  %wide.load359 = load <4 x float>, <4 x float>* %116, align 4, !alias.scope !19
  %117 = fadd <4 x float> %wide.load356, %wide.load358
  %118 = fadd <4 x float> %wide.load357, %wide.load359
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %index348
  %120 = bitcast float* %119 to <4 x float>*
  store <4 x float> %117, <4 x float>* %120, align 4, !alias.scope !21, !noalias !23
  %121 = getelementptr float, float* %119, i64 4
  %122 = bitcast float* %121 to <4 x float>*
  store <4 x float> %118, <4 x float>* %122, align 4, !alias.scope !21, !noalias !23
  %index.next349 = add i64 %index348, 8
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %index.next349
  %124 = bitcast float* %123 to <4 x float>*
  %wide.load356.1 = load <4 x float>, <4 x float>* %124, align 4, !alias.scope !16
  %125 = getelementptr float, float* %123, i64 4
  %126 = bitcast float* %125 to <4 x float>*
  %wide.load357.1 = load <4 x float>, <4 x float>* %126, align 4, !alias.scope !16
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %index.next349
  %128 = bitcast float* %127 to <4 x float>*
  %wide.load358.1 = load <4 x float>, <4 x float>* %128, align 4, !alias.scope !19
  %129 = getelementptr float, float* %127, i64 4
  %130 = bitcast float* %129 to <4 x float>*
  %wide.load359.1 = load <4 x float>, <4 x float>* %130, align 4, !alias.scope !19
  %131 = fadd <4 x float> %wide.load356.1, %wide.load358.1
  %132 = fadd <4 x float> %wide.load357.1, %wide.load359.1
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %index.next349
  %134 = bitcast float* %133 to <4 x float>*
  store <4 x float> %131, <4 x float>* %134, align 4, !alias.scope !21, !noalias !23
  %135 = getelementptr float, float* %133, i64 4
  %136 = bitcast float* %135 to <4 x float>*
  store <4 x float> %132, <4 x float>* %136, align 4, !alias.scope !21, !noalias !23
  %index.next349.1 = add i64 %index348, 16
  %137 = icmp eq i64 %index.next349.1, %n.vec323
  br i1 %137, label %middle.block318.loopexit, label %vector.body317, !llvm.loop !24

middle.block318.loopexit:                         ; preds = %vector.body317
  br label %middle.block318

middle.block318:                                  ; preds = %middle.block318.loopexit, %vector.body317.prol.loopexit
  br i1 %cmp.n351, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block318, %vector.memcheck346, %min.iters.checked321, %for.cond185.preheader.us
  %indvars.iv142.us.ph = phi i64 [ 0, %vector.memcheck346 ], [ 0, %min.iters.checked321 ], [ 0, %for.cond185.preheader.us ], [ %n.vec323, %middle.block318 ]
  %138 = sub nsw i64 %1, %indvars.iv142.us.ph
  %xtraiter360 = and i64 %138, 1
  %lcmp.mod361 = icmp eq i64 %xtraiter360, 0
  br i1 %lcmp.mod361, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %indvars.iv142.us.ph
  %139 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %indvars.iv142.us.ph
  %140 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %139, %140
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %indvars.iv142.us.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.us.prol = or i64 %indvars.iv142.us.ph, 1
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.body187.us.preheader
  %indvars.iv142.us.unr.ph = phi i64 [ %indvars.iv.next.us.prol, %for.body187.us.prol ], [ %indvars.iv142.us.ph, %for.body187.us.preheader ]
  %141 = icmp eq i64 %92, %indvars.iv142.us.ph
  br i1 %141, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv142.us = phi i64 [ %indvars.iv142.us.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.us.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  %142 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  %143 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %142, %143
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv142.us, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %indvars.iv.next.us
  %144 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %indvars.iv.next.us
  %145 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %144, %145
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %indvars.iv.next.us
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us, %89
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv142.us, 2
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.body187.us.prol.loopexit, %middle.block318
  %indvars.iv.next120.us = add nuw nsw i64 %indvars.iv119144.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next120.us, %2
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
  %cmp13 = icmp sgt i32 %w, 0
  %cmp311 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp13, %cmp311
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv814.us = phi i64 [ %indvars.iv.next9.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv814.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv12.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %6 = add nsw i64 %indvars.iv12.us, %5
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv814.us, i64 %indvars.iv12.us
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv12.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv814.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9.us, %4
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

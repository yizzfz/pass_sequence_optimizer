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
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = zext i32 %h to i64
  %1 = add nsw i64 %0, -1
  %wide.trip.count11 = zext i32 %w to i64
  %min.iters.check = icmp ult i32 %h, 4
  %2 = and i32 %h, 3
  %n.mod.vf = zext i32 %2 to i64
  %n.vec = sub nsw i64 %0, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %2, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
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
  %5 = add nuw nsw <4 x i64> %4, %broadcast.splat
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
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond14 = icmp eq i64 %indvars.iv, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond14, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end9.loopexit, label %for.cond1.preheader.us

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
  %cmp39 = icmp sgt i32 %w, 0
  br i1 %cmp39, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp3234 = icmp sgt i32 %h, 0
  br i1 %cmp3234, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %2 = zext i32 %h to i64
  %3 = add nsw i64 %2, -1
  %wide.trip.count90 = zext i32 %w to i64
  %mul37.us157 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us159 = fmul float %exp2, 0.000000e+00
  %mul41.us161 = fmul float %call29, -0.000000e+00
  %exitcond95164 = icmp eq i64 %3, 0
  %xtraiter238 = and i64 %3, 1
  %lcmp.mod239 = icmp eq i64 %xtraiter238, 0
  %4 = icmp eq i32 %h, 2
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv88 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next89, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us155 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv88, i64 0
  %5 = load float, float* %arrayidx35.us155, align 4
  %mul36.us156 = fmul float %div, %5
  %add38.us158 = fadd float %mul37.us157, %mul36.us156
  %add40.us160 = fadd float %mul39.us159, %add38.us158
  %add42.us162 = fadd float %mul41.us161, %add40.us160
  %arrayidx46.us163 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv88, i64 0
  store float %add42.us162, float* %arrayidx46.us163, align 4
  br i1 %exitcond95164, label %for.cond31.for.inc55_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge.preheader

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod239, label %for.inc.us.for.inc.us_crit_edge.prol.loopexit, label %for.inc.us.for.inc.us_crit_edge.prol

for.inc.us.for.inc.us_crit_edge.prol:             ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us155, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv88, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16.v.r1, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us162
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv88, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol.loopexit:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol, %for.inc.us.for.inc.us_crit_edge.preheader
  %add42.us168.unr.ph = phi float [ %add42.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %add42.us162, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %arrayidx35.us167.unr.ph = phi float* [ %arrayidx35.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %arrayidx35.us155, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %ym1.035.us166.unr.ph = phi float [ %add42.us162, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %indvars.iv84165.unr.ph = phi i64 [ 1, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0, %for.inc.us.for.inc.us_crit_edge.preheader ]
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge.preheader.new

for.inc.us.for.inc.us_crit_edge.preheader.new:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge, %for.inc.us.for.inc.us_crit_edge.preheader.new
  %add42.us168 = phi float [ %add42.us168.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %arrayidx35.us167 = phi float* [ %arrayidx35.us167.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %ym1.035.us166 = phi float [ %ym1.035.us166.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv84165 = phi i64 [ %indvars.iv84165.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %indvars.iv.next85.1, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84165, 1
  %8 = load float, float* %arrayidx35.us167, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv88, i64 %indvars.iv.next85
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16.v.r1, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us168
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us166, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv88, i64 %indvars.iv.next85
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84165, 2
  %10 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv88, i64 %indvars.iv.next85.1
  %11 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %11
  %mul37.us.1 = fmul float %mul16.v.r1, %10
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us168, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv88, i64 %indvars.iv.next85.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond95.1 = icmp eq i64 %indvars.iv.next85.1, %3
  br i1 %exitcond95.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.inc.us.for.inc.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.inc.us.for.inc.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next89 = add nuw nsw i64 %indvars.iv88, 1
  %exitcond91 = icmp eq i64 %indvars.iv.next89, %wide.trip.count90
  br i1 %exitcond91, label %for.cond62.preheader.us.preheader, label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %12 = sext i32 %h to i64
  %indvars.iv77141 = add nsw i64 %12, -1
  %mul65.us142 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us143 = fmul float %1, -0.000000e+00
  %add67.us144 = fadd float %mul65.us142, %mul66.us143
  %mul68.us145 = fmul float %exp2, 0.000000e+00
  %add69.us146 = fadd float %add67.us144, %mul68.us145
  %mul70.us147 = fmul float %call29, -0.000000e+00
  %add71.us148 = fadd float %add69.us146, %mul70.us147
  %cmp63.us150 = icmp sgt i32 %h, 1
  %13 = and i64 %12, 1
  %lcmp.mod237 = icmp eq i64 %13, 0
  %indvars.iv77.prol = add nsw i64 %12, -2
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us148
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  %14 = icmp eq i32 %h, 2
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv79 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next80, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us149 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv79, i64 %indvars.iv77141
  store float %add71.us148, float* %arrayidx75.us149, align 4
  br i1 %cmp63.us150, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod237, label %for.inc84.us.for.inc84.us_crit_edge.prol, label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol:         ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv79, i64 %indvars.iv77141
  %15 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %15
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv79, i64 %indvars.iv77.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol.loopexit: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol, %for.inc84.us.for.inc84.us_crit_edge.preheader
  %add71.us154.unr.ph = phi float [ %add71.us.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %add71.us148, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %indvars.iv77153.unr.ph = phi i64 [ %indvars.iv77.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %indvars.iv77141, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %xp1.027.us152.unr.ph = phi float [ %15, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %yp1.029.us151.unr.ph = phi float [ %add71.us148, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  br i1 %14, label %for.cond62.for.inc86_crit_edge.us, label %for.inc84.us.for.inc84.us_crit_edge.preheader.new

for.inc84.us.for.inc84.us_crit_edge.preheader.new: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge, %for.inc84.us.for.inc84.us_crit_edge.preheader.new
  %add71.us154 = phi float [ %add71.us154.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us.1, %for.inc84.us.for.inc84.us_crit_edge ]
  %indvars.iv77153 = phi i64 [ %indvars.iv77153.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %indvars.iv77.1, %for.inc84.us.for.inc84.us_crit_edge ]
  %xp1.027.us152 = phi float [ %xp1.027.us152.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %17, %for.inc84.us.for.inc84.us_crit_edge ]
  %yp1.029.us151 = phi float [ %yp1.029.us151.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv79, i64 %indvars.iv77153
  %16 = load float, float* %arrayidx79.us, align 4
  %indvars.iv77 = add nsw i64 %indvars.iv77153, -1
  %mul65.us = fmul float %mul16.v.r2, %16
  %mul66.us = fmul float %xp1.027.us152, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us154
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us151, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv79, i64 %indvars.iv77
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv79, i64 %indvars.iv77
  %17 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv77.1 = add nsw i64 %indvars.iv77153, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %17
  %mul66.us.1 = fmul float %16, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us154, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv79, i64 %indvars.iv77.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv77, 1
  br i1 %cmp63.us.1, label %for.inc84.us.for.inc84.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit, %for.cond62.preheader.us
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next80, %wide.trip.count90
  br i1 %exitcond82, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %18 = add nsw i64 %2, -1
  %min.iters.check = icmp ult i32 %h, 8
  %19 = and i32 %h, 7
  %n.mod.vf = zext i32 %19 to i64
  %n.vec = sub nsw i64 %2, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %19, 0
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 0
  %scevgep170 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 %2
  %scevgep172 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 0
  %scevgep174 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 %2
  %scevgep176 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 0
  %scevgep178 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 %2
  br i1 %min.iters.check, label %for.inc109.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.inc109.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep174
  %bound1 = icmp ult float* %scevgep172, %scevgep170
  %found.conflict = and i1 %bound0, %bound1
  %bound0180 = icmp ult float* %scevgep, %scevgep178
  %bound1181 = icmp ult float* %scevgep176, %scevgep170
  %found.conflict182 = and i1 %bound0180, %bound1181
  %conflict.rdx = or i1 %found.conflict, %found.conflict182
  br i1 %conflict.rdx, label %for.inc109.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %20 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 %index
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %21, align 4, !alias.scope !6
  %22 = getelementptr float, float* %20, i64 4
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load184 = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !6
  %24 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 %index
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load185 = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !9
  %26 = getelementptr float, float* %24, i64 4
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load186 = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !9
  %28 = fadd <4 x float> %wide.load, %wide.load185
  %29 = fadd <4 x float> %wide.load184, %wide.load186
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 %index
  %31 = bitcast float* %30 to <4 x float>*
  store <4 x float> %28, <4 x float>* %31, align 4, !alias.scope !11, !noalias !13
  %32 = getelementptr float, float* %30, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %29, <4 x float>* %33, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %34 = icmp eq i64 %index.next, %n.vec
  br i1 %34, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader

for.inc109.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv68.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %35 = sub nsw i64 %2, %indvars.iv68.ph
  %xtraiter234 = and i64 %35, 1
  %lcmp.mod235 = icmp eq i64 %xtraiter234, 0
  br i1 %lcmp.mod235, label %for.inc109.us.prol.loopexit, label %for.inc109.us.prol

for.inc109.us.prol:                               ; preds = %for.inc109.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 %indvars.iv68.ph
  %36 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 %indvars.iv68.ph
  %37 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %36, %37
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 %indvars.iv68.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.ph, 1
  br label %for.inc109.us.prol.loopexit

for.inc109.us.prol.loopexit:                      ; preds = %for.inc109.us.prol, %for.inc109.us.preheader
  %indvars.iv68.unr.ph = phi i64 [ %indvars.iv.next69.prol, %for.inc109.us.prol ], [ %indvars.iv68.ph, %for.inc109.us.preheader ]
  %38 = icmp eq i64 %18, %indvars.iv68.ph
  br i1 %38, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader.new

for.inc109.us.preheader.new:                      ; preds = %for.inc109.us.prol.loopexit
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us, %for.inc109.us.preheader.new
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr.ph, %for.inc109.us.preheader.new ], [ %indvars.iv.next69.1, %for.inc109.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 %indvars.iv68
  %39 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 %indvars.iv68
  %40 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %39, %40
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 %indvars.iv68
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv72, i64 %indvars.iv.next69
  %41 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv72, i64 %indvars.iv.next69
  %42 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %41, %42
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv72, i64 %indvars.iv.next69
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond94.1 = icmp eq i64 %indvars.iv.next69, %3
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  br i1 %exitcond94.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.inc109.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.inc109.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.inc109.us.prol.loopexit, %middle.block
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count90
  br i1 %exitcond75, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %43 = icmp sgt i32 %w, 0
  br i1 %43, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %44 = zext i32 %w to i64
  %45 = add nsw i64 %44, -1
  %wide.trip.count65 = zext i32 %h to i64
  %mul126.us129 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us131 = fmul float %exp2, 0.000000e+00
  %mul130.us133 = fmul float %call29, -0.000000e+00
  %exitcond136 = icmp eq i64 %45, 0
  %xtraiter232 = and i64 %45, 1
  %lcmp.mod233 = icmp eq i64 %xtraiter232, 0
  %46 = icmp eq i32 %w, 2
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv63 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next64, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us127 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv63
  %47 = load float, float* %arrayidx124.us127, align 4
  %mul125.us128 = fmul float %div, %47
  %add127.us130 = fadd float %mul126.us129, %mul125.us128
  %add129.us132 = fadd float %mul128.us131, %add127.us130
  %add131.us134 = fadd float %mul130.us133, %add129.us132
  %arrayidx135.us135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv63
  store float %add131.us134, float* %arrayidx135.us135, align 4
  br i1 %exitcond136, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod233, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  %sunkaddr240 = mul i64 %indvars.iv63, 4
  %sunkaddr241 = add i64 %sunkaddr, %sunkaddr240
  %sunkaddr242 = inttoptr i64 %sunkaddr241 to float*
  %48 = load float, float* %sunkaddr242, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv63
  %49 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %49
  %mul126.us.prol = fmul float %mul16.v.r1, %48
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us134
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv63
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol, %for.inc144.us.for.inc144.us_crit_edge.preheader
  %add131.us140.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us134, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %arrayidx124.us139.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us127, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %ym1.115.us138.unr.ph = phi float [ %add131.us134, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %indvars.iv59137.unr.ph = phi i64 [ 1, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  br i1 %46, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %add131.us140 = phi float [ %add131.us140.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %arrayidx124.us139 = phi float* [ %arrayidx124.us139.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %ym1.115.us138 = phi float [ %ym1.115.us138.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv59137 = phi i64 [ %indvars.iv59137.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next60.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59137, 1
  %50 = load float, float* %arrayidx124.us139, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next60, i64 %indvars.iv63
  %51 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %51
  %mul126.us = fmul float %mul16.v.r1, %50
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us140
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us138, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next60, i64 %indvars.iv63
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59137, 2
  %52 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next60.1, i64 %indvars.iv63
  %53 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %53
  %mul126.us.1 = fmul float %mul16.v.r1, %52
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us140, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next60.1, i64 %indvars.iv63
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next60.1, %45
  br i1 %exitcond.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond66, label %for.cond154.preheader.us.preheader, label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %54 = sext i32 %w to i64
  %indvars.iv52113 = add nsw i64 %54, -1
  %mul157.us114 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us115 = fmul float %1, -0.000000e+00
  %add159.us116 = fadd float %mul157.us114, %mul158.us115
  %mul160.us117 = fmul float %exp2, 0.000000e+00
  %add161.us118 = fadd float %add159.us116, %mul160.us117
  %mul162.us119 = fmul float %call29, -0.000000e+00
  %add163.us120 = fadd float %add161.us118, %mul162.us119
  %cmp155.us122 = icmp sgt i32 %w, 1
  %55 = and i64 %54, 1
  %lcmp.mod231 = icmp eq i64 %55, 0
  %indvars.iv52.prol = add nsw i64 %54, -2
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us120
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %56 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us121 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv52113, i64 %indvars.iv54
  store float %add163.us120, float* %arrayidx167.us121, align 4
  br i1 %cmp155.us122, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod231, label %for.inc176.us.for.inc176.us_crit_edge.prol, label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol:       ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv52113, i64 %indvars.iv54
  %57 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %57
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv52.prol, i64 %indvars.iv54
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol.loopexit: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol, %for.inc176.us.for.inc176.us_crit_edge.preheader
  %add163.us126.unr.ph = phi float [ %add163.us.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %add163.us120, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %indvars.iv52125.unr.ph = phi i64 [ %indvars.iv52.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %indvars.iv52113, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %tp1.07.us124.unr.ph = phi float [ %57, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %yp1.19.us123.unr.ph = phi float [ %add163.us120, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  br i1 %56, label %for.cond154.for.inc179_crit_edge.us, label %for.inc176.us.for.inc176.us_crit_edge.preheader.new

for.inc176.us.for.inc176.us_crit_edge.preheader.new: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge, %for.inc176.us.for.inc176.us_crit_edge.preheader.new
  %add163.us126 = phi float [ %add163.us126.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us.1, %for.inc176.us.for.inc176.us_crit_edge ]
  %indvars.iv52125 = phi i64 [ %indvars.iv52125.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %indvars.iv52.1, %for.inc176.us.for.inc176.us_crit_edge ]
  %tp1.07.us124 = phi float [ %tp1.07.us124.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %59, %for.inc176.us.for.inc176.us_crit_edge ]
  %yp1.19.us123 = phi float [ %yp1.19.us123.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv52125, i64 %indvars.iv54
  %58 = load float, float* %arrayidx171.us, align 4
  %indvars.iv52 = add nsw i64 %indvars.iv52125, -1
  %mul157.us = fmul float %mul16.v.r2, %58
  %mul158.us = fmul float %tp1.07.us124, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us126
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us123, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv52, i64 %indvars.iv54
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv52, i64 %indvars.iv54
  %59 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv52.1 = add nsw i64 %indvars.iv52125, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %59
  %mul158.us.1 = fmul float %58, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us126, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv52.1, i64 %indvars.iv54
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv52, 1
  br i1 %cmp155.us.1, label %for.inc176.us.for.inc176.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit, %for.cond154.preheader.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count65
  br i1 %exitcond57, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %60 = icmp sgt i32 %h, 0
  %61 = icmp sgt i32 %w, 0
  %or.cond = and i1 %61, %60
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %62 = zext i32 %h to i64
  %63 = add nsw i64 %62, -1
  %wide.trip.count49 = zext i32 %w to i64
  %64 = add nsw i64 %62, -1
  %min.iters.check190 = icmp ult i32 %h, 8
  %65 = and i32 %h, 7
  %n.mod.vf192 = zext i32 %65 to i64
  %n.vec193 = sub nsw i64 %62, %n.mod.vf192
  %cmp.zero194 = icmp eq i64 %n.vec193, 0
  %cmp.n221 = icmp eq i32 %65, 0
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next48, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep196 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  %scevgep198 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %62
  %scevgep200 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %scevgep202 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %62
  %scevgep204 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %scevgep206 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %62
  br i1 %min.iters.check190, label %for.inc202.us.preheader, label %min.iters.checked191

min.iters.checked191:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero194, label %for.inc202.us.preheader, label %vector.memcheck216

vector.memcheck216:                               ; preds = %min.iters.checked191
  %bound0208 = icmp ult float* %scevgep196, %scevgep202
  %bound1209 = icmp ult float* %scevgep200, %scevgep198
  %found.conflict210 = and i1 %bound0208, %bound1209
  %bound0211 = icmp ult float* %scevgep196, %scevgep206
  %bound1212 = icmp ult float* %scevgep204, %scevgep198
  %found.conflict213 = and i1 %bound0211, %bound1212
  %conflict.rdx214 = or i1 %found.conflict210, %found.conflict213
  br i1 %conflict.rdx214, label %for.inc202.us.preheader, label %vector.body187.preheader

vector.body187.preheader:                         ; preds = %vector.memcheck216
  br label %vector.body187

vector.body187:                                   ; preds = %vector.body187.preheader, %vector.body187
  %index218 = phi i64 [ %index.next219, %vector.body187 ], [ 0, %vector.body187.preheader ]
  %66 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %index218
  %67 = bitcast float* %66 to <4 x float>*
  %wide.load226 = load <4 x float>, <4 x float>* %67, align 4, !alias.scope !16
  %68 = getelementptr float, float* %66, i64 4
  %69 = bitcast float* %68 to <4 x float>*
  %wide.load227 = load <4 x float>, <4 x float>* %69, align 4, !alias.scope !16
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %index218
  %71 = bitcast float* %70 to <4 x float>*
  %wide.load228 = load <4 x float>, <4 x float>* %71, align 4, !alias.scope !19
  %72 = getelementptr float, float* %70, i64 4
  %73 = bitcast float* %72 to <4 x float>*
  %wide.load229 = load <4 x float>, <4 x float>* %73, align 4, !alias.scope !19
  %74 = fadd <4 x float> %wide.load226, %wide.load228
  %75 = fadd <4 x float> %wide.load227, %wide.load229
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %index218
  %77 = bitcast float* %76 to <4 x float>*
  store <4 x float> %74, <4 x float>* %77, align 4, !alias.scope !21, !noalias !23
  %78 = getelementptr float, float* %76, i64 4
  %79 = bitcast float* %78 to <4 x float>*
  store <4 x float> %75, <4 x float>* %79, align 4, !alias.scope !21, !noalias !23
  %index.next219 = add i64 %index218, 8
  %80 = icmp eq i64 %index.next219, %n.vec193
  br i1 %80, label %middle.block188, label %vector.body187, !llvm.loop !24

middle.block188:                                  ; preds = %vector.body187
  br i1 %cmp.n221, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader

for.inc202.us.preheader:                          ; preds = %middle.block188, %vector.memcheck216, %min.iters.checked191, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck216 ], [ 0, %min.iters.checked191 ], [ 0, %for.cond185.preheader.us ], [ %n.vec193, %middle.block188 ]
  %81 = sub nsw i64 %62, %indvars.iv.ph
  %xtraiter = and i64 %81, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc202.us.prol.loopexit, label %for.inc202.us.prol

for.inc202.us.prol:                               ; preds = %for.inc202.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.ph
  %82 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.ph
  %83 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %82, %83
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %for.inc202.us.prol.loopexit

for.inc202.us.prol.loopexit:                      ; preds = %for.inc202.us.prol, %for.inc202.us.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc202.us.prol ], [ %indvars.iv.ph, %for.inc202.us.preheader ]
  %84 = icmp eq i64 %64, %indvars.iv.ph
  br i1 %84, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader.new

for.inc202.us.preheader.new:                      ; preds = %for.inc202.us.prol.loopexit
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us, %for.inc202.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc202.us.preheader.new ], [ %indvars.iv.next.1, %for.inc202.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %85 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %86 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %85, %86
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.next
  %87 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.next
  %88 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %87, %88
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond93.1 = icmp eq i64 %indvars.iv.next, %63
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond93.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.inc202.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.inc202.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.inc202.us.prol.loopexit, %middle.block188
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.end207.loopexit, label %for.cond185.preheader.us

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp4 = icmp sgt i32 %w, 0
  %cmp31 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count11 = zext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %9 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
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

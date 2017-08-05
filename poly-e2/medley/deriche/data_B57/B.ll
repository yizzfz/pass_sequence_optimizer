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
  %0 = add i32 %h, -1
  %1 = sext i32 %w to i64
  %wide.trip.count8 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %wide.trip.count8, 1
  %min.iters.check = icmp ult i64 %2, 4
  %n.vec = and i64 %2, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %2, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond1.for.inc7_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv10, 313
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
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %index
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
  %14 = add nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond9 = icmp eq i64 %indvars.iv, %wide.trip.count8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond9, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next11 = add nuw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %1
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
  %2 = add i32 %h, -1
  %3 = sext i32 %w to i64
  %wide.trip.count73 = zext i32 %2 to i64
  %mul37.us138 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us140 = fmul float %exp2, 0.000000e+00
  %mul41.us142 = fmul float %call29, -0.000000e+00
  %exitcond74145 = icmp eq i32 %2, 0
  %xtraiter223 = and i64 %wide.trip.count73, 1
  %lcmp.mod224 = icmp eq i64 %xtraiter223, 0
  %4 = icmp eq i32 %2, 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next76, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us136 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 0
  %5 = load float, float* %arrayidx35.us136, align 4
  %mul36.us137 = fmul float %div, %5
  %add38.us139 = fadd float %mul37.us138, %mul36.us137
  %add40.us141 = fadd float %mul39.us140, %add38.us139
  %add42.us143 = fadd float %mul41.us142, %add40.us141
  %arrayidx46.us144 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 0
  store float %add42.us143, float* %arrayidx46.us144, align 4
  br i1 %exitcond74145, label %for.cond31.for.inc55_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge.preheader

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod224, label %for.inc.us.for.inc.us_crit_edge.prol.loopexit, label %for.inc.us.for.inc.us_crit_edge.prol

for.inc.us.for.inc.us_crit_edge.prol:             ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us136, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16.v.r1, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us143
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol.loopexit:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol, %for.inc.us.for.inc.us_crit_edge.preheader
  %add42.us149.unr.ph = phi float [ %add42.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %add42.us143, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %arrayidx35.us148.unr.ph = phi float* [ %arrayidx35.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %arrayidx35.us136, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %ym1.035.us147.unr.ph = phi float [ %add42.us143, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader ]
  %indvars.iv71146.unr.ph = phi i64 [ 1, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0, %for.inc.us.for.inc.us_crit_edge.preheader ]
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge.preheader.new

for.inc.us.for.inc.us_crit_edge.preheader.new:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge, %for.inc.us.for.inc.us_crit_edge.preheader.new
  %add42.us149 = phi float [ %add42.us149.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %arrayidx35.us148 = phi float* [ %arrayidx35.us148.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.inc.us.for.inc.us_crit_edge ]
  %ym1.035.us147 = phi float [ %ym1.035.us147.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv71146 = phi i64 [ %indvars.iv71146.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %indvars.iv.next72.1, %for.inc.us.for.inc.us_crit_edge ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71146, 1
  %8 = load float, float* %arrayidx35.us148, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 %indvars.iv.next72
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16.v.r1, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us149
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us147, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv.next72
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71146, 2
  %10 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 %indvars.iv.next72.1
  %11 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %11
  %mul37.us.1 = fmul float %mul16.v.r1, %10
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us149, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv.next72.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, %wide.trip.count73
  br i1 %exitcond74.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.inc.us.for.inc.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.inc.us.for.inc.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next76 = add nuw i64 %indvars.iv75, 1
  %cmp.us = icmp slt i64 %indvars.iv.next76, %3
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %12 = sext i32 %h to i64
  %indvars.iv.next68122 = add nsw i64 %12, -1
  %mul65.us123 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us124 = fmul float %1, -0.000000e+00
  %add67.us125 = fadd float %mul65.us123, %mul66.us124
  %mul68.us126 = fmul float %exp2, 0.000000e+00
  %add69.us127 = fadd float %add67.us125, %mul68.us126
  %mul70.us128 = fmul float %call29, -0.000000e+00
  %add71.us129 = fadd float %add69.us127, %mul70.us128
  %cmp63.us131 = icmp sgt i32 %h, 1
  %13 = and i64 %12, 1
  %lcmp.mod222 = icmp eq i64 %13, 0
  %indvars.iv.next68.prol = add nsw i64 %12, -2
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us129
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  %14 = icmp eq i32 %h, 2
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next70, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us130 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68122
  store float %add71.us129, float* %arrayidx75.us130, align 4
  br i1 %cmp63.us131, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod222, label %for.inc84.us.for.inc84.us_crit_edge.prol, label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol:         ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68122
  %15 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %15
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol.loopexit: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol, %for.inc84.us.for.inc84.us_crit_edge.preheader
  %add71.us135.unr.ph = phi float [ %add71.us.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %add71.us129, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %indvars.iv.next68134.unr.ph = phi i64 [ %indvars.iv.next68.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %indvars.iv.next68122, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %xp1.027.us133.unr.ph = phi float [ %15, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  %yp1.029.us132.unr.ph = phi float [ %add71.us129, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader ]
  br i1 %14, label %for.cond62.for.inc86_crit_edge.us, label %for.inc84.us.for.inc84.us_crit_edge.preheader.new

for.inc84.us.for.inc84.us_crit_edge.preheader.new: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge, %for.inc84.us.for.inc84.us_crit_edge.preheader.new
  %add71.us135 = phi float [ %add71.us135.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us.1, %for.inc84.us.for.inc84.us_crit_edge ]
  %indvars.iv.next68134 = phi i64 [ %indvars.iv.next68134.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %indvars.iv.next68.1, %for.inc84.us.for.inc84.us_crit_edge ]
  %xp1.027.us133 = phi float [ %xp1.027.us133.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %17, %for.inc84.us.for.inc84.us_crit_edge ]
  %yp1.029.us132 = phi float [ %yp1.029.us132.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68134
  %16 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next68 = add nsw i64 %indvars.iv.next68134, -1
  %mul65.us = fmul float %mul16.v.r2, %16
  %mul66.us = fmul float %xp1.027.us133, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us135
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us132, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68
  %17 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv.next68134, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %17
  %mul66.us.1 = fmul float %16, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us135, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next68, 1
  br i1 %cmp63.us.1, label %for.inc84.us.for.inc84.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit, %for.cond62.preheader.us
  %indvars.iv.next70 = add nuw i64 %indvars.iv69, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next70, %3
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %18 = add nuw nsw i64 %wide.trip.count73, 1
  %19 = and i64 %18, 8589934584
  %20 = add nsw i64 %19, -8
  %21 = lshr exact i64 %20, 3
  %22 = add nuw nsw i64 %wide.trip.count73, 1
  %min.iters.check = icmp ult i64 %18, 8
  %n.vec = and i64 %18, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %23 = and i64 %21, 1
  %lcmp.mod218 = icmp eq i64 %23, 0
  %24 = icmp eq i64 %21, 0
  %cmp.n = icmp eq i64 %18, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next66, %for.cond92.for.inc112_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 0
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %18
  %scevgep153 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 0
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %18
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 0
  %scevgep159 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %18
  br i1 %min.iters.check, label %for.inc109.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.inc109.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep155
  %bound1 = icmp ult float* %scevgep153, %scevgep151
  %found.conflict = and i1 %bound0, %bound1
  %bound0161 = icmp ult float* %scevgep, %scevgep159
  %bound1162 = icmp ult float* %scevgep157, %scevgep151
  %found.conflict163 = and i1 %bound0161, %bound1162
  %conflict.rdx = or i1 %found.conflict, %found.conflict163
  br i1 %conflict.rdx, label %for.inc109.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod218, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 0
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !6
  %27 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load165.prol = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !6
  %29 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 0
  %30 = bitcast float* %29 to <4 x float>*
  %wide.load166.prol = load <4 x float>, <4 x float>* %30, align 4, !alias.scope !9
  %31 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 4
  %32 = bitcast float* %31 to <4 x float>*
  %wide.load167.prol = load <4 x float>, <4 x float>* %32, align 4, !alias.scope !9
  %33 = fadd <4 x float> %wide.load.prol, %wide.load166.prol
  %34 = fadd <4 x float> %wide.load165.prol, %wide.load167.prol
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 0
  %36 = bitcast float* %35 to <4 x float>*
  store <4 x float> %33, <4 x float>* %36, align 4, !alias.scope !11, !noalias !13
  %37 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 4
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
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %index
  %40 = bitcast float* %39 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %40, align 4, !alias.scope !6
  %41 = getelementptr float, float* %39, i64 4
  %42 = bitcast float* %41 to <4 x float>*
  %wide.load165 = load <4 x float>, <4 x float>* %42, align 4, !alias.scope !6
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %index
  %44 = bitcast float* %43 to <4 x float>*
  %wide.load166 = load <4 x float>, <4 x float>* %44, align 4, !alias.scope !9
  %45 = getelementptr float, float* %43, i64 4
  %46 = bitcast float* %45 to <4 x float>*
  %wide.load167 = load <4 x float>, <4 x float>* %46, align 4, !alias.scope !9
  %47 = fadd <4 x float> %wide.load, %wide.load166
  %48 = fadd <4 x float> %wide.load165, %wide.load167
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %index
  %50 = bitcast float* %49 to <4 x float>*
  store <4 x float> %47, <4 x float>* %50, align 4, !alias.scope !11, !noalias !13
  %51 = getelementptr float, float* %49, i64 4
  %52 = bitcast float* %51 to <4 x float>*
  store <4 x float> %48, <4 x float>* %52, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %index.next
  %54 = bitcast float* %53 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %54, align 4, !alias.scope !6
  %55 = getelementptr float, float* %53, i64 4
  %56 = bitcast float* %55 to <4 x float>*
  %wide.load165.1 = load <4 x float>, <4 x float>* %56, align 4, !alias.scope !6
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %index.next
  %58 = bitcast float* %57 to <4 x float>*
  %wide.load166.1 = load <4 x float>, <4 x float>* %58, align 4, !alias.scope !9
  %59 = getelementptr float, float* %57, i64 4
  %60 = bitcast float* %59 to <4 x float>*
  %wide.load167.1 = load <4 x float>, <4 x float>* %60, align 4, !alias.scope !9
  %61 = fadd <4 x float> %wide.load.1, %wide.load166.1
  %62 = fadd <4 x float> %wide.load165.1, %wide.load167.1
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %index.next
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
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader

for.inc109.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv61.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %68 = sub nsw i64 %22, %indvars.iv61.ph
  %xtraiter219 = and i64 %68, 1
  %lcmp.mod220 = icmp eq i64 %xtraiter219, 0
  br i1 %lcmp.mod220, label %for.inc109.us.prol.loopexit, label %for.inc109.us.prol

for.inc109.us.prol:                               ; preds = %for.inc109.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %indvars.iv61.ph
  %69 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %indvars.iv61.ph
  %70 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %69, %70
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %indvars.iv61.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next62.prol = or i64 %indvars.iv61.ph, 1
  br label %for.inc109.us.prol.loopexit

for.inc109.us.prol.loopexit:                      ; preds = %for.inc109.us.prol, %for.inc109.us.preheader
  %indvars.iv61.unr.ph = phi i64 [ %indvars.iv.next62.prol, %for.inc109.us.prol ], [ %indvars.iv61.ph, %for.inc109.us.preheader ]
  %71 = icmp eq i64 %wide.trip.count73, %indvars.iv61.ph
  br i1 %71, label %for.cond92.for.inc112_crit_edge.us, label %for.inc109.us.preheader.new

for.inc109.us.preheader.new:                      ; preds = %for.inc109.us.prol.loopexit
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us, %for.inc109.us.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr.ph, %for.inc109.us.preheader.new ], [ %indvars.iv.next62.1, %for.inc109.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %indvars.iv61
  %72 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %indvars.iv61
  %73 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %72, %73
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %indvars.iv61
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %indvars.iv.next62
  %74 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %indvars.iv.next62
  %75 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %74, %75
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %indvars.iv.next62
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond64.1 = icmp eq i64 %indvars.iv.next62, %wide.trip.count73
  %indvars.iv.next62.1 = add nsw i64 %indvars.iv61, 2
  br i1 %exitcond64.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.inc109.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.inc109.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.inc109.us.prol.loopexit, %middle.block
  %indvars.iv.next66 = add nuw i64 %indvars.iv65, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next66, %3
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %76 = icmp sgt i32 %w, 0
  br i1 %76, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %77 = add i32 %w, -1
  %78 = sext i32 %h to i64
  %wide.trip.count57 = zext i32 %77 to i64
  %mul126.us110 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us112 = fmul float %exp2, 0.000000e+00
  %mul130.us114 = fmul float %call29, -0.000000e+00
  %exitcond58117 = icmp eq i32 %77, 0
  %xtraiter215 = and i64 %wide.trip.count57, 1
  %lcmp.mod216 = icmp eq i64 %xtraiter215, 0
  %79 = icmp eq i32 %77, 1
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %80 = load float, float* %arrayidx124.us108, align 4
  %mul125.us109 = fmul float %div, %80
  %add127.us111 = fadd float %mul126.us110, %mul125.us109
  %add129.us113 = fadd float %mul128.us112, %add127.us111
  %add131.us115 = fadd float %mul130.us114, %add129.us113
  %arrayidx135.us116 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us115, float* %arrayidx135.us116, align 4
  br i1 %exitcond58117, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod216, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  %sunkaddr225 = mul i64 %indvars.iv59, 4
  %sunkaddr226 = add i64 %sunkaddr, %sunkaddr225
  %sunkaddr227 = inttoptr i64 %sunkaddr226 to float*
  %81 = load float, float* %sunkaddr227, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv59
  %82 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %82
  %mul126.us.prol = fmul float %mul16.v.r1, %81
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us115
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv59
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol, %for.inc144.us.for.inc144.us_crit_edge.preheader
  %add131.us121.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us115, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %arrayidx124.us120.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us108, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %ym1.115.us119.unr.ph = phi float [ %add131.us115, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  %indvars.iv55118.unr.ph = phi i64 [ 1, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0, %for.inc144.us.for.inc144.us_crit_edge.preheader ]
  br i1 %79, label %for.cond118.for.inc147_crit_edge.us, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %add131.us121 = phi float [ %add131.us121.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %arrayidx124.us120 = phi float* [ %arrayidx124.us120.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %ym1.115.us119 = phi float [ %ym1.115.us119.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv55118 = phi i64 [ %indvars.iv55118.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next56.1, %for.inc144.us.for.inc144.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55118, 1
  %83 = load float, float* %arrayidx124.us120, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %84 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %84
  %mul126.us = fmul float %mul16.v.r1, %83
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us121
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us119, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55118, 2
  %85 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %86 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %86
  %mul126.us.1 = fmul float %mul16.v.r1, %85
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us121, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count57
  br i1 %exitcond58.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next60, %78
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %87 = sext i32 %w to i64
  %indvars.iv.next5294 = add nsw i64 %87, -1
  %mul157.us95 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us96 = fmul float %1, -0.000000e+00
  %add159.us97 = fadd float %mul157.us95, %mul158.us96
  %mul160.us98 = fmul float %exp2, 0.000000e+00
  %add161.us99 = fadd float %add159.us97, %mul160.us98
  %mul162.us100 = fmul float %call29, -0.000000e+00
  %add163.us101 = fadd float %add161.us99, %mul162.us100
  %cmp155.us103 = icmp sgt i32 %w, 1
  %88 = and i64 %87, 1
  %lcmp.mod214 = icmp eq i64 %88, 0
  %indvars.iv.next52.prol = add nsw i64 %87, -2
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us101
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %89 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next54, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next5294, i64 %indvars.iv53
  store float %add163.us101, float* %arrayidx167.us102, align 4
  br i1 %cmp155.us103, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod214, label %for.inc176.us.for.inc176.us_crit_edge.prol, label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol:       ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next5294, i64 %indvars.iv53
  %90 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %90
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52.prol, i64 %indvars.iv53
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol.loopexit: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol, %for.inc176.us.for.inc176.us_crit_edge.preheader
  %add163.us107.unr.ph = phi float [ %add163.us.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %add163.us101, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %indvars.iv.next52106.unr.ph = phi i64 [ %indvars.iv.next52.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %indvars.iv.next5294, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %tp1.07.us105.unr.ph = phi float [ %90, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  %yp1.19.us104.unr.ph = phi float [ %add163.us101, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader ]
  br i1 %89, label %for.cond154.for.inc179_crit_edge.us, label %for.inc176.us.for.inc176.us_crit_edge.preheader.new

for.inc176.us.for.inc176.us_crit_edge.preheader.new: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge, %for.inc176.us.for.inc176.us_crit_edge.preheader.new
  %add163.us107 = phi float [ %add163.us107.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us.1, %for.inc176.us.for.inc176.us_crit_edge ]
  %indvars.iv.next52106 = phi i64 [ %indvars.iv.next52106.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %indvars.iv.next52.1, %for.inc176.us.for.inc176.us_crit_edge ]
  %tp1.07.us105 = phi float [ %tp1.07.us105.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %92, %for.inc176.us.for.inc176.us_crit_edge ]
  %yp1.19.us104 = phi float [ %yp1.19.us104.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next52106, i64 %indvars.iv53
  %91 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next52 = add nsw i64 %indvars.iv.next52106, -1
  %mul157.us = fmul float %mul16.v.r2, %91
  %mul158.us = fmul float %tp1.07.us105, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us107
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us104, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52, i64 %indvars.iv53
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next52, i64 %indvars.iv53
  %92 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv.next52106, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %92
  %mul158.us.1 = fmul float %91, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us107, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52.1, i64 %indvars.iv53
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next52, 1
  br i1 %cmp155.us.1, label %for.inc176.us.for.inc176.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit, %for.cond154.preheader.us
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next54, %78
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %93 = icmp sgt i32 %h, 0
  %94 = icmp sgt i32 %w, 0
  %or.cond = and i1 %94, %93
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %95 = add i32 %h, -1
  %96 = sext i32 %w to i64
  %wide.trip.count47 = zext i32 %95 to i64
  %97 = add nuw nsw i64 %wide.trip.count47, 1
  %98 = and i64 %97, 8589934584
  %99 = add nsw i64 %98, -8
  %100 = lshr exact i64 %99, 3
  %101 = add nuw nsw i64 %wide.trip.count47, 1
  %min.iters.check171 = icmp ult i64 %97, 8
  %n.vec174 = and i64 %97, 8589934584
  %cmp.zero175 = icmp eq i64 %n.vec174, 0
  %102 = and i64 %100, 1
  %lcmp.mod = icmp eq i64 %102, 0
  %103 = icmp eq i64 %100, 0
  %cmp.n202 = icmp eq i64 %97, %n.vec174
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next50, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep177 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 0
  %scevgep179 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %97
  %scevgep181 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 0
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %97
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 0
  %scevgep187 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %97
  br i1 %min.iters.check171, label %for.inc202.us.preheader, label %min.iters.checked172

min.iters.checked172:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero175, label %for.inc202.us.preheader, label %vector.memcheck197

vector.memcheck197:                               ; preds = %min.iters.checked172
  %bound0189 = icmp ult float* %scevgep177, %scevgep183
  %bound1190 = icmp ult float* %scevgep181, %scevgep179
  %found.conflict191 = and i1 %bound0189, %bound1190
  %bound0192 = icmp ult float* %scevgep177, %scevgep187
  %bound1193 = icmp ult float* %scevgep185, %scevgep179
  %found.conflict194 = and i1 %bound0192, %bound1193
  %conflict.rdx195 = or i1 %found.conflict191, %found.conflict194
  br i1 %conflict.rdx195, label %for.inc202.us.preheader, label %vector.body168.preheader

vector.body168.preheader:                         ; preds = %vector.memcheck197
  br i1 %lcmp.mod, label %vector.body168.prol, label %vector.body168.prol.loopexit

vector.body168.prol:                              ; preds = %vector.body168.preheader
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 0
  %105 = bitcast float* %104 to <4 x float>*
  %wide.load207.prol = load <4 x float>, <4 x float>* %105, align 4, !alias.scope !16
  %106 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 4
  %107 = bitcast float* %106 to <4 x float>*
  %wide.load208.prol = load <4 x float>, <4 x float>* %107, align 4, !alias.scope !16
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 0
  %109 = bitcast float* %108 to <4 x float>*
  %wide.load209.prol = load <4 x float>, <4 x float>* %109, align 4, !alias.scope !19
  %110 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 4
  %111 = bitcast float* %110 to <4 x float>*
  %wide.load210.prol = load <4 x float>, <4 x float>* %111, align 4, !alias.scope !19
  %112 = fadd <4 x float> %wide.load207.prol, %wide.load209.prol
  %113 = fadd <4 x float> %wide.load208.prol, %wide.load210.prol
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 0
  %115 = bitcast float* %114 to <4 x float>*
  store <4 x float> %112, <4 x float>* %115, align 4, !alias.scope !21, !noalias !23
  %116 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 4
  %117 = bitcast float* %116 to <4 x float>*
  store <4 x float> %113, <4 x float>* %117, align 4, !alias.scope !21, !noalias !23
  br label %vector.body168.prol.loopexit

vector.body168.prol.loopexit:                     ; preds = %vector.body168.prol, %vector.body168.preheader
  %index199.unr.ph = phi i64 [ 8, %vector.body168.prol ], [ 0, %vector.body168.preheader ]
  br i1 %103, label %middle.block169, label %vector.body168.preheader.new

vector.body168.preheader.new:                     ; preds = %vector.body168.prol.loopexit
  br label %vector.body168

vector.body168:                                   ; preds = %vector.body168, %vector.body168.preheader.new
  %index199 = phi i64 [ %index199.unr.ph, %vector.body168.preheader.new ], [ %index.next200.1, %vector.body168 ]
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %index199
  %119 = bitcast float* %118 to <4 x float>*
  %wide.load207 = load <4 x float>, <4 x float>* %119, align 4, !alias.scope !16
  %120 = getelementptr float, float* %118, i64 4
  %121 = bitcast float* %120 to <4 x float>*
  %wide.load208 = load <4 x float>, <4 x float>* %121, align 4, !alias.scope !16
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %index199
  %123 = bitcast float* %122 to <4 x float>*
  %wide.load209 = load <4 x float>, <4 x float>* %123, align 4, !alias.scope !19
  %124 = getelementptr float, float* %122, i64 4
  %125 = bitcast float* %124 to <4 x float>*
  %wide.load210 = load <4 x float>, <4 x float>* %125, align 4, !alias.scope !19
  %126 = fadd <4 x float> %wide.load207, %wide.load209
  %127 = fadd <4 x float> %wide.load208, %wide.load210
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %index199
  %129 = bitcast float* %128 to <4 x float>*
  store <4 x float> %126, <4 x float>* %129, align 4, !alias.scope !21, !noalias !23
  %130 = getelementptr float, float* %128, i64 4
  %131 = bitcast float* %130 to <4 x float>*
  store <4 x float> %127, <4 x float>* %131, align 4, !alias.scope !21, !noalias !23
  %index.next200 = add i64 %index199, 8
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %index.next200
  %133 = bitcast float* %132 to <4 x float>*
  %wide.load207.1 = load <4 x float>, <4 x float>* %133, align 4, !alias.scope !16
  %134 = getelementptr float, float* %132, i64 4
  %135 = bitcast float* %134 to <4 x float>*
  %wide.load208.1 = load <4 x float>, <4 x float>* %135, align 4, !alias.scope !16
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %index.next200
  %137 = bitcast float* %136 to <4 x float>*
  %wide.load209.1 = load <4 x float>, <4 x float>* %137, align 4, !alias.scope !19
  %138 = getelementptr float, float* %136, i64 4
  %139 = bitcast float* %138 to <4 x float>*
  %wide.load210.1 = load <4 x float>, <4 x float>* %139, align 4, !alias.scope !19
  %140 = fadd <4 x float> %wide.load207.1, %wide.load209.1
  %141 = fadd <4 x float> %wide.load208.1, %wide.load210.1
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %index.next200
  %143 = bitcast float* %142 to <4 x float>*
  store <4 x float> %140, <4 x float>* %143, align 4, !alias.scope !21, !noalias !23
  %144 = getelementptr float, float* %142, i64 4
  %145 = bitcast float* %144 to <4 x float>*
  store <4 x float> %141, <4 x float>* %145, align 4, !alias.scope !21, !noalias !23
  %index.next200.1 = add i64 %index199, 16
  %146 = icmp eq i64 %index.next200.1, %n.vec174
  br i1 %146, label %middle.block169.loopexit, label %vector.body168, !llvm.loop !24

middle.block169.loopexit:                         ; preds = %vector.body168
  br label %middle.block169

middle.block169:                                  ; preds = %middle.block169.loopexit, %vector.body168.prol.loopexit
  br i1 %cmp.n202, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader

for.inc202.us.preheader:                          ; preds = %middle.block169, %vector.memcheck197, %min.iters.checked172, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck197 ], [ 0, %min.iters.checked172 ], [ 0, %for.cond185.preheader.us ], [ %n.vec174, %middle.block169 ]
  %147 = sub nsw i64 %101, %indvars.iv.ph
  %xtraiter211 = and i64 %147, 1
  %lcmp.mod212 = icmp eq i64 %xtraiter211, 0
  br i1 %lcmp.mod212, label %for.inc202.us.prol.loopexit, label %for.inc202.us.prol

for.inc202.us.prol:                               ; preds = %for.inc202.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv.ph
  %148 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv.ph
  %149 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %148, %149
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.inc202.us.prol.loopexit

for.inc202.us.prol.loopexit:                      ; preds = %for.inc202.us.prol, %for.inc202.us.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc202.us.prol ], [ %indvars.iv.ph, %for.inc202.us.preheader ]
  %150 = icmp eq i64 %wide.trip.count47, %indvars.iv.ph
  br i1 %150, label %for.cond185.for.inc205_crit_edge.us, label %for.inc202.us.preheader.new

for.inc202.us.preheader.new:                      ; preds = %for.inc202.us.prol.loopexit
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us, %for.inc202.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc202.us.preheader.new ], [ %indvars.iv.next.1, %for.inc202.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv
  %151 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv
  %152 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %151, %152
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv.next
  %153 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv.next
  %154 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %153, %154
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond48.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count47
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond48.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.inc202.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.inc202.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.inc202.us.prol.loopexit, %middle.block169
  %indvars.iv.next50 = add nuw i64 %indvars.iv49, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next50, %96
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp4 = icmp sgt i32 %w, 0
  %cmp31 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %3
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, %4
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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

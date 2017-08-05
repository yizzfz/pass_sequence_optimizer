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
  %3 = mul nuw nsw i64 %indvars.iv10, 313
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
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond9 = icmp eq i64 %indvars.iv, %wide.trip.count8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond9, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %1
  br i1 %exitcond, label %for.end9.loopexit, label %for.cond1.preheader.us

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
  %mul37.us143 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us145 = fmul float %exp2, 0.000000e+00
  %mul41.us147 = fmul float %call29, -0.000000e+00
  %exitcond74150 = icmp eq i32 %2, 0
  %xtraiter228 = and i64 %wide.trip.count73, 1
  %lcmp.mod229 = icmp eq i64 %xtraiter228, 0
  %4 = icmp eq i32 %2, 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next76, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us141 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 0
  %5 = load float, float* %arrayidx35.us141, align 4
  %mul36.us142 = fmul float %div, %5
  %add38.us144 = fadd float %mul37.us143, %mul36.us142
  %add40.us146 = fadd float %mul39.us145, %add38.us144
  %add42.us148 = fadd float %mul41.us147, %add40.us146
  %arrayidx46.us149 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 0
  store float %add42.us148, float* %arrayidx46.us149, align 4
  br i1 %exitcond74150, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod229, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body33.us.for.body33.us_crit_edge.prol.preheader

for.body33.us.for.body33.us_crit_edge.prol.preheader: ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  br label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.prol.preheader
  %6 = load float, float* %arrayidx35.us141, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16.v.r1, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us148
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa

for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body33.us.for.body33.us_crit_edge.preheader, %for.body33.us.for.body33.us_crit_edge.prol
  %add42.us154.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us148, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us153.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us141, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.035.us152.unr.ph = phi float [ %add42.us148, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv71151.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us154 = phi float [ %add42.us154.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us153 = phi float* [ %arrayidx35.us153.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %ym1.035.us152 = phi float [ %ym1.035.us152.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv71151 = phi i64 [ %indvars.iv71151.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next72.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71151, 1
  %8 = load float, float* %arrayidx35.us153, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 %indvars.iv.next72
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16.v.r1, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us154
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us152, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv.next72
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71151, 2
  %10 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv75, i64 %indvars.iv.next72.1
  %11 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %11
  %mul37.us.1 = fmul float %mul16.v.r1, %10
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us154, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv.next72.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond74.1 = icmp eq i64 %indvars.iv.next72.1, %wide.trip.count73
  br i1 %exitcond74.1, label %for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us.loopexit

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.cond31.preheader.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next76, %3
  br i1 %exitcond98, label %for.cond62.preheader.us.preheader, label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %12 = sext i32 %h to i64
  %indvars.iv.next68127 = add nsw i64 %12, -1
  %mul65.us128 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us129 = fmul float %1, -0.000000e+00
  %add67.us130 = fadd float %mul65.us128, %mul66.us129
  %mul68.us131 = fmul float %exp2, 0.000000e+00
  %add69.us132 = fadd float %add67.us130, %mul68.us131
  %mul70.us133 = fmul float %call29, -0.000000e+00
  %add71.us134 = fadd float %add69.us132, %mul70.us133
  %cmp63.us136 = icmp sgt i32 %h, 1
  %13 = and i64 %12, 1
  %lcmp.mod227 = icmp eq i64 %13, 0
  %indvars.iv.next68.prol = add nsw i64 %12, -2
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us134
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  %14 = icmp eq i32 %h, 2
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next70, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us135 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68127
  store float %add71.us134, float* %arrayidx75.us135, align 4
  br i1 %cmp63.us136, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod227, label %for.body64.us.for.body64.us_crit_edge.prol.preheader, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.preheader: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  br label %for.body64.us.for.body64.us_crit_edge.prol

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.prol.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68127
  %15 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %15
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader, %for.body64.us.for.body64.us_crit_edge.prol
  %add71.us140.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us134, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next68139.unr.ph = phi i64 [ %indvars.iv.next68.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %indvars.iv.next68127, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.027.us138.unr.ph = phi float [ %15, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.029.us137.unr.ph = phi float [ %add71.us134, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond62.for.inc86_crit_edge.us.loopexit, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us140 = phi float [ %add71.us140.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next68139 = phi i64 [ %indvars.iv.next68139.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next68.1, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.027.us138 = phi float [ %xp1.027.us138.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %17, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.029.us137 = phi float [ %yp1.029.us137.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68139
  %16 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next68 = add nsw i64 %indvars.iv.next68139, -1
  %mul65.us = fmul float %mul16.v.r2, %16
  %mul66.us = fmul float %xp1.027.us138, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us140
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us137, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv69, i64 %indvars.iv.next68
  %17 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv.next68139, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %17
  %mul66.us.1 = fmul float %16, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us140, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv69, i64 %indvars.iv.next68.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next68, 1
  br i1 %cmp63.us.1, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa

for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit, %for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond97 = icmp eq i64 %indvars.iv.next70, %3
  br i1 %exitcond97, label %for.cond92.preheader.us.preheader, label %for.cond62.preheader.us

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
  %lcmp.mod223 = icmp eq i64 %23, 0
  %24 = icmp eq i64 %21, 0
  %cmp.n = icmp eq i64 %18, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next66, %for.cond92.for.inc112_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 0
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %18
  %scevgep158 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 0
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %18
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 0
  %scevgep164 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %18
  br i1 %min.iters.check, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep160
  %bound1 = icmp ult float* %scevgep158, %scevgep156
  %found.conflict = and i1 %bound0, %bound1
  %bound0166 = icmp ult float* %scevgep, %scevgep164
  %bound1167 = icmp ult float* %scevgep162, %scevgep156
  %found.conflict168 = and i1 %bound0166, %bound1167
  %conflict.rdx = or i1 %found.conflict, %found.conflict168
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod223, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 0
  %26 = bitcast float* %25 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %26, align 4, !alias.scope !6
  %27 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 4
  %28 = bitcast float* %27 to <4 x float>*
  %wide.load170.prol = load <4 x float>, <4 x float>* %28, align 4, !alias.scope !6
  %29 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 0
  %30 = bitcast float* %29 to <4 x float>*
  %wide.load171.prol = load <4 x float>, <4 x float>* %30, align 4, !alias.scope !9
  %31 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 4
  %32 = bitcast float* %31 to <4 x float>*
  %wide.load172.prol = load <4 x float>, <4 x float>* %32, align 4, !alias.scope !9
  %33 = fadd <4 x float> %wide.load.prol, %wide.load171.prol
  %34 = fadd <4 x float> %wide.load170.prol, %wide.load172.prol
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 0
  %36 = bitcast float* %35 to <4 x float>*
  store <4 x float> %33, <4 x float>* %36, align 4, !alias.scope !11, !noalias !13
  %37 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 4
  %38 = bitcast float* %37 to <4 x float>*
  store <4 x float> %34, <4 x float>* %38, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
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
  %wide.load170 = load <4 x float>, <4 x float>* %42, align 4, !alias.scope !6
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %index
  %44 = bitcast float* %43 to <4 x float>*
  %wide.load171 = load <4 x float>, <4 x float>* %44, align 4, !alias.scope !9
  %45 = getelementptr float, float* %43, i64 4
  %46 = bitcast float* %45 to <4 x float>*
  %wide.load172 = load <4 x float>, <4 x float>* %46, align 4, !alias.scope !9
  %47 = fadd <4 x float> %wide.load, %wide.load171
  %48 = fadd <4 x float> %wide.load170, %wide.load172
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
  %wide.load170.1 = load <4 x float>, <4 x float>* %56, align 4, !alias.scope !6
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %index.next
  %58 = bitcast float* %57 to <4 x float>*
  %wide.load171.1 = load <4 x float>, <4 x float>* %58, align 4, !alias.scope !9
  %59 = getelementptr float, float* %57, i64 4
  %60 = bitcast float* %59 to <4 x float>*
  %wide.load172.1 = load <4 x float>, <4 x float>* %60, align 4, !alias.scope !9
  %61 = fadd <4 x float> %wide.load.1, %wide.load171.1
  %62 = fadd <4 x float> %wide.load170.1, %wide.load172.1
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %index.next
  %64 = bitcast float* %63 to <4 x float>*
  store <4 x float> %61, <4 x float>* %64, align 4, !alias.scope !11, !noalias !13
  %65 = getelementptr float, float* %63, i64 4
  %66 = bitcast float* %65 to <4 x float>*
  store <4 x float> %62, <4 x float>* %66, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.1, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !14

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv61.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %68 = sub nsw i64 %22, %indvars.iv61.ph
  %xtraiter224 = and i64 %68, 1
  %lcmp.mod225 = icmp eq i64 %xtraiter224, 0
  br i1 %lcmp.mod225, label %for.body94.us.prol.loopexit.unr-lcssa, label %for.body94.us.prol.preheader

for.body94.us.prol.preheader:                     ; preds = %for.body94.us.preheader
  br label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.prol.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv65, i64 %indvars.iv61.ph
  %69 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv65, i64 %indvars.iv61.ph
  %70 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %69, %70
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv65, i64 %indvars.iv61.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next62.prol = or i64 %indvars.iv61.ph, 1
  br label %for.body94.us.prol.loopexit.unr-lcssa

for.body94.us.prol.loopexit.unr-lcssa:            ; preds = %for.body94.us.preheader, %for.body94.us.prol
  %indvars.iv61.unr.ph = phi i64 [ %indvars.iv.next62.prol, %for.body94.us.prol ], [ %indvars.iv61.ph, %for.body94.us.preheader ]
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol.loopexit.unr-lcssa
  %71 = icmp eq i64 %wide.trip.count73, %indvars.iv61.ph
  br i1 %71, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv61 = phi i64 [ %indvars.iv61.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next62.1, %for.body94.us ]
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
  br i1 %exitcond64.1, label %for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us.loopexit

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us.prol.loopexit, %for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next66, %3
  br i1 %exitcond96, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 %cmp39, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %76 = add i32 %w, -1
  %77 = sext i32 %h to i64
  %wide.trip.count57 = zext i32 %76 to i64
  %mul126.us115 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us117 = fmul float %exp2, 0.000000e+00
  %mul130.us119 = fmul float %call29, -0.000000e+00
  %exitcond58122 = icmp eq i32 %76, 0
  %xtraiter220 = and i64 %wide.trip.count57, 1
  %lcmp.mod221 = icmp eq i64 %xtraiter220, 0
  %78 = icmp eq i32 %76, 1
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us113 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %79 = load float, float* %arrayidx124.us113, align 4
  %mul125.us114 = fmul float %div, %79
  %add127.us116 = fadd float %mul126.us115, %mul125.us114
  %add129.us118 = fadd float %mul128.us117, %add127.us116
  %add131.us120 = fadd float %mul130.us119, %add129.us118
  %arrayidx135.us121 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us120, float* %arrayidx135.us121, align 4
  br i1 %exitcond58122, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod221, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body120.us.for.body120.us_crit_edge.prol.preheader

for.body120.us.for.body120.us_crit_edge.prol.preheader: ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  br label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.prol.preheader
  %80 = load float, float* %arrayidx124.us113, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv59
  %81 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %81
  %mul126.us.prol = fmul float %mul16.v.r1, %80
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us120
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv59
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa

for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body120.us.for.body120.us_crit_edge.preheader, %for.body120.us.for.body120.us_crit_edge.prol
  %add131.us126.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us120, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us125.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us113, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %ym1.115.us124.unr.ph = phi float [ %add131.us120, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv55123.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %78, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us126 = phi float [ %add131.us126.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us125 = phi float* [ %arrayidx124.us125.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.115.us124 = phi float [ %ym1.115.us124.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv55123 = phi i64 [ %indvars.iv55123.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next56.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55123, 1
  %82 = load float, float* %arrayidx124.us125, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %83 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %83
  %mul126.us = fmul float %mul16.v.r1, %82
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us126
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us124, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55123, 2
  %84 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %85 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %85
  %mul126.us.1 = fmul float %mul16.v.r1, %84
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us126, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count57
  br i1 %exitcond58.1, label %for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us.loopexit

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.cond118.preheader.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next60, %77
  br i1 %exitcond95, label %for.cond154.preheader.us.preheader, label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %86 = sext i32 %w to i64
  %indvars.iv.next5299 = add nsw i64 %86, -1
  %mul157.us100 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us101 = fmul float %1, -0.000000e+00
  %add159.us102 = fadd float %mul157.us100, %mul158.us101
  %mul160.us103 = fmul float %exp2, 0.000000e+00
  %add161.us104 = fadd float %add159.us102, %mul160.us103
  %mul162.us105 = fmul float %call29, -0.000000e+00
  %add163.us106 = fadd float %add161.us104, %mul162.us105
  %cmp155.us108 = icmp sgt i32 %w, 1
  %87 = and i64 %86, 1
  %lcmp.mod219 = icmp eq i64 %87, 0
  %indvars.iv.next52.prol = add nsw i64 %86, -2
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us106
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %88 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next54, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us107 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next5299, i64 %indvars.iv53
  store float %add163.us106, float* %arrayidx167.us107, align 4
  br i1 %cmp155.us108, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod219, label %for.body156.us.for.body156.us_crit_edge.prol.preheader, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.preheader: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  br label %for.body156.us.for.body156.us_crit_edge.prol

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.prol.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next5299, i64 %indvars.iv53
  %89 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %89
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52.prol, i64 %indvars.iv53
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader, %for.body156.us.for.body156.us_crit_edge.prol
  %add163.us112.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us106, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next52111.unr.ph = phi i64 [ %indvars.iv.next52.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %indvars.iv.next5299, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.07.us110.unr.ph = phi float [ %89, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.19.us109.unr.ph = phi float [ %add163.us106, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %88, label %for.cond154.for.inc179_crit_edge.us.loopexit, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us112 = phi float [ %add163.us112.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next52111 = phi i64 [ %indvars.iv.next52111.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next52.1, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.07.us110 = phi float [ %tp1.07.us110.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %91, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.19.us109 = phi float [ %yp1.19.us109.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next52111, i64 %indvars.iv53
  %90 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next52 = add nsw i64 %indvars.iv.next52111, -1
  %mul157.us = fmul float %mul16.v.r2, %90
  %mul158.us = fmul float %tp1.07.us110, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us112
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us109, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52, i64 %indvars.iv53
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next52, i64 %indvars.iv53
  %91 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv.next52111, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %91
  %mul158.us.1 = fmul float %90, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us112, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52.1, i64 %indvars.iv53
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next52, 1
  br i1 %cmp155.us.1, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa

for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit, %for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next54, %77
  br i1 %exitcond94, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %or.cond = and i1 %cmp39, %cmp11619
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %92 = add i32 %h, -1
  %93 = sext i32 %w to i64
  %wide.trip.count47 = zext i32 %92 to i64
  %94 = add nuw nsw i64 %wide.trip.count47, 1
  %95 = and i64 %94, 8589934584
  %96 = add nsw i64 %95, -8
  %97 = lshr exact i64 %96, 3
  %98 = add nuw nsw i64 %wide.trip.count47, 1
  %min.iters.check176 = icmp ult i64 %94, 8
  %n.vec179 = and i64 %94, 8589934584
  %cmp.zero180 = icmp eq i64 %n.vec179, 0
  %99 = and i64 %97, 1
  %lcmp.mod = icmp eq i64 %99, 0
  %100 = icmp eq i64 %97, 0
  %cmp.n207 = icmp eq i64 %94, %n.vec179
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next50, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep182 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 0
  %scevgep184 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %94
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 0
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %94
  %scevgep190 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 0
  %scevgep192 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %94
  br i1 %min.iters.check176, label %for.body187.us.preheader, label %min.iters.checked177

min.iters.checked177:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero180, label %for.body187.us.preheader, label %vector.memcheck202

vector.memcheck202:                               ; preds = %min.iters.checked177
  %bound0194 = icmp ult float* %scevgep182, %scevgep188
  %bound1195 = icmp ult float* %scevgep186, %scevgep184
  %found.conflict196 = and i1 %bound0194, %bound1195
  %bound0197 = icmp ult float* %scevgep182, %scevgep192
  %bound1198 = icmp ult float* %scevgep190, %scevgep184
  %found.conflict199 = and i1 %bound0197, %bound1198
  %conflict.rdx200 = or i1 %found.conflict196, %found.conflict199
  br i1 %conflict.rdx200, label %for.body187.us.preheader, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck202
  br i1 %lcmp.mod, label %vector.body173.prol.preheader, label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.preheader:                    ; preds = %vector.body173.preheader
  br label %vector.body173.prol

vector.body173.prol:                              ; preds = %vector.body173.prol.preheader
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 0
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load212.prol = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !16
  %103 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 4
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load213.prol = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !16
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 0
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load214.prol = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !19
  %107 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load215.prol = load <4 x float>, <4 x float>* %108, align 4, !alias.scope !19
  %109 = fadd <4 x float> %wide.load212.prol, %wide.load214.prol
  %110 = fadd <4 x float> %wide.load213.prol, %wide.load215.prol
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 0
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %109, <4 x float>* %112, align 4, !alias.scope !21, !noalias !23
  %113 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 4
  %114 = bitcast float* %113 to <4 x float>*
  store <4 x float> %110, <4 x float>* %114, align 4, !alias.scope !21, !noalias !23
  br label %vector.body173.prol.loopexit.unr-lcssa

vector.body173.prol.loopexit.unr-lcssa:           ; preds = %vector.body173.preheader, %vector.body173.prol
  %index204.unr.ph = phi i64 [ 8, %vector.body173.prol ], [ 0, %vector.body173.preheader ]
  br label %vector.body173.prol.loopexit

vector.body173.prol.loopexit:                     ; preds = %vector.body173.prol.loopexit.unr-lcssa
  br i1 %100, label %middle.block174, label %vector.body173.preheader.new

vector.body173.preheader.new:                     ; preds = %vector.body173.prol.loopexit
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173, %vector.body173.preheader.new
  %index204 = phi i64 [ %index204.unr.ph, %vector.body173.preheader.new ], [ %index.next205.1, %vector.body173 ]
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %index204
  %116 = bitcast float* %115 to <4 x float>*
  %wide.load212 = load <4 x float>, <4 x float>* %116, align 4, !alias.scope !16
  %117 = getelementptr float, float* %115, i64 4
  %118 = bitcast float* %117 to <4 x float>*
  %wide.load213 = load <4 x float>, <4 x float>* %118, align 4, !alias.scope !16
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %index204
  %120 = bitcast float* %119 to <4 x float>*
  %wide.load214 = load <4 x float>, <4 x float>* %120, align 4, !alias.scope !19
  %121 = getelementptr float, float* %119, i64 4
  %122 = bitcast float* %121 to <4 x float>*
  %wide.load215 = load <4 x float>, <4 x float>* %122, align 4, !alias.scope !19
  %123 = fadd <4 x float> %wide.load212, %wide.load214
  %124 = fadd <4 x float> %wide.load213, %wide.load215
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %index204
  %126 = bitcast float* %125 to <4 x float>*
  store <4 x float> %123, <4 x float>* %126, align 4, !alias.scope !21, !noalias !23
  %127 = getelementptr float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  store <4 x float> %124, <4 x float>* %128, align 4, !alias.scope !21, !noalias !23
  %index.next205 = add i64 %index204, 8
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %index.next205
  %130 = bitcast float* %129 to <4 x float>*
  %wide.load212.1 = load <4 x float>, <4 x float>* %130, align 4, !alias.scope !16
  %131 = getelementptr float, float* %129, i64 4
  %132 = bitcast float* %131 to <4 x float>*
  %wide.load213.1 = load <4 x float>, <4 x float>* %132, align 4, !alias.scope !16
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %index.next205
  %134 = bitcast float* %133 to <4 x float>*
  %wide.load214.1 = load <4 x float>, <4 x float>* %134, align 4, !alias.scope !19
  %135 = getelementptr float, float* %133, i64 4
  %136 = bitcast float* %135 to <4 x float>*
  %wide.load215.1 = load <4 x float>, <4 x float>* %136, align 4, !alias.scope !19
  %137 = fadd <4 x float> %wide.load212.1, %wide.load214.1
  %138 = fadd <4 x float> %wide.load213.1, %wide.load215.1
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %index.next205
  %140 = bitcast float* %139 to <4 x float>*
  store <4 x float> %137, <4 x float>* %140, align 4, !alias.scope !21, !noalias !23
  %141 = getelementptr float, float* %139, i64 4
  %142 = bitcast float* %141 to <4 x float>*
  store <4 x float> %138, <4 x float>* %142, align 4, !alias.scope !21, !noalias !23
  %index.next205.1 = add i64 %index204, 16
  %143 = icmp eq i64 %index.next205.1, %n.vec179
  br i1 %143, label %middle.block174.unr-lcssa, label %vector.body173, !llvm.loop !24

middle.block174.unr-lcssa:                        ; preds = %vector.body173
  br label %middle.block174

middle.block174:                                  ; preds = %vector.body173.prol.loopexit, %middle.block174.unr-lcssa
  br i1 %cmp.n207, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block174, %vector.memcheck202, %min.iters.checked177, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck202 ], [ 0, %min.iters.checked177 ], [ 0, %for.cond185.preheader.us ], [ %n.vec179, %middle.block174 ]
  %144 = sub nsw i64 %98, %indvars.iv.ph
  %xtraiter216 = and i64 %144, 1
  %lcmp.mod217 = icmp eq i64 %xtraiter216, 0
  br i1 %lcmp.mod217, label %for.body187.us.prol.loopexit.unr-lcssa, label %for.body187.us.prol.preheader

for.body187.us.prol.preheader:                    ; preds = %for.body187.us.preheader
  br label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.prol.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv.ph
  %145 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv.ph
  %146 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %145, %146
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.body187.us.prol.loopexit.unr-lcssa

for.body187.us.prol.loopexit.unr-lcssa:           ; preds = %for.body187.us.preheader, %for.body187.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body187.us.prol ], [ %indvars.iv.ph, %for.body187.us.preheader ]
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol.loopexit.unr-lcssa
  %147 = icmp eq i64 %wide.trip.count47, %indvars.iv.ph
  br i1 %147, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv
  %148 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv
  %149 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %148, %149
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv49, i64 %indvars.iv.next
  %150 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv49, i64 %indvars.iv.next
  %151 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %150, %151
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv49, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond48.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count47
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond48.1, label %for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us.loopexit

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us.prol.loopexit, %for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %middle.block174
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp eq i64 %indvars.iv.next50, %93
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.preheader.us

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

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %indvars.iv, %5
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
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %4
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

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

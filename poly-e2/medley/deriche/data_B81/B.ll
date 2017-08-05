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
  %arraydecay1 = bitcast i8* %call to [2160 x float]*
  %arraydecay42 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay1)
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay75 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay86 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay1, [2160 x float]* %arraydecay42, [2160 x float]* %arraydecay75, [2160 x float]* %arraydecay86)
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
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %h, -1
  %1 = sext i32 %w to i64
  %2 = zext i32 %0 to i64
  %3 = add nuw nsw i64 %2, 1
  %min.iters.check = icmp ult i64 %3, 4
  %n.vec = and i64 %3, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %3, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, 313
  br i1 %min.iters.check, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nsw <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, %n.vec
  br i1 %13, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv, 991
  %15 = add nsw i64 %14, %4
  %16 = trunc i64 %15 to i32
  %rem.us = srem i32 %16, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond12 = icmp eq i64 %indvars.iv, %2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond12, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, %1
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
  %4 = zext i32 %2 to i64
  %mul37.us145 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us147 = fmul float %exp2, 0.000000e+00
  %mul41.us149 = fmul float %call29, -0.000000e+00
  %exitcond83152 = icmp eq i32 %2, 0
  %xtraiter230 = and i64 %4, 1
  %lcmp.mod231 = icmp eq i64 %xtraiter230, 0
  %5 = icmp eq i32 %2, 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next79, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us143 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 0
  %6 = load float, float* %arrayidx35.us143, align 4
  %mul36.us144 = fmul float %div, %6
  %add38.us146 = fadd float %mul37.us145, %mul36.us144
  %add40.us148 = fadd float %mul39.us147, %add38.us146
  %add42.us150 = fadd float %mul41.us149, %add40.us148
  %arrayidx46.us151 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 0
  store float %add42.us150, float* %arrayidx46.us151, align 4
  br i1 %exitcond83152, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod231, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit, label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  %7 = load float, float* %arrayidx35.us143, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 1
  %8 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %8
  %mul37.us.prol = fmul float %mul16.v.r1, %7
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us150
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol, %for.body33.us.for.body33.us_crit_edge.preheader
  %add42.us156.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us150, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us155.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us143, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.035.us154.unr.ph = phi float [ %add42.us150, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv74153.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  br i1 %5, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us156 = phi float [ %add42.us156.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us155 = phi float* [ %arrayidx35.us155.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %ym1.035.us154 = phi float [ %ym1.035.us154.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv74153 = phi i64 [ %indvars.iv74153.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next75.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74153, 1
  %9 = load float, float* %arrayidx35.us155, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75
  %10 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %10
  %mul37.us = fmul float %mul16.v.r1, %9
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us156
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us154, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74153, 2
  %11 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  %12 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %12
  %mul37.us.1 = fmul float %mul16.v.r1, %11
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us156, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond83.1 = icmp eq i64 %indvars.iv.next75.1, %4
  br i1 %exitcond83.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.preheader.us
  %indvars.iv.next79 = add nuw i64 %indvars.iv78, 1
  %cmp.us = icmp slt i64 %indvars.iv.next79, %3
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %13 = sext i32 %h to i64
  %indvars.iv.next70129 = add nsw i64 %13, -1
  %mul65.us130 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us131 = fmul float %1, -0.000000e+00
  %add67.us132 = fadd float %mul65.us130, %mul66.us131
  %mul68.us133 = fmul float %exp2, 0.000000e+00
  %add69.us134 = fadd float %add67.us132, %mul68.us133
  %mul70.us135 = fmul float %call29, -0.000000e+00
  %add71.us136 = fadd float %add69.us134, %mul70.us135
  %cmp63.us138 = icmp sgt i32 %h, 1
  %14 = and i64 %13, 1
  %lcmp.mod229 = icmp eq i64 %14, 0
  %indvars.iv.next70.prol = add nsw i64 %13, -2
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us136
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  %15 = icmp eq i32 %h, 2
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next72, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us137 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70129
  store float %add71.us136, float* %arrayidx75.us137, align 4
  br i1 %cmp63.us138, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod229, label %for.body64.us.for.body64.us_crit_edge.prol, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70129
  %16 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %16
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol, %for.body64.us.for.body64.us_crit_edge.preheader
  %add71.us142.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us136, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next70141.unr.ph = phi i64 [ %indvars.iv.next70.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %indvars.iv.next70129, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.027.us140.unr.ph = phi float [ %16, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.029.us139.unr.ph = phi float [ %add71.us136, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  br i1 %15, label %for.cond62.for.inc86_crit_edge.us, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us142 = phi float [ %add71.us142.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next70141 = phi i64 [ %indvars.iv.next70141.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next70.1, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.027.us140 = phi float [ %xp1.027.us140.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %18, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.029.us139 = phi float [ %yp1.029.us139.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70141
  %17 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next70 = add nsw i64 %indvars.iv.next70141, -1
  %mul65.us = fmul float %mul16.v.r2, %17
  %mul66.us = fmul float %xp1.027.us140, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us142
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us139, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70
  %18 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv.next70141, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %18
  %mul66.us.1 = fmul float %17, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us142, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next70, 1
  br i1 %cmp63.us.1, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.body64.us.for.body64.us_crit_edge.prol.loopexit, %for.cond62.preheader.us
  %indvars.iv.next72 = add nuw i64 %indvars.iv71, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next72, %3
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %19 = add nuw nsw i64 %4, 1
  %20 = and i64 %19, 8589934584
  %21 = add nsw i64 %20, -8
  %22 = lshr exact i64 %21, 3
  %23 = add nuw nsw i64 %4, 1
  %min.iters.check = icmp ult i64 %19, 8
  %n.vec = and i64 %19, 8589934584
  %cmp.zero = icmp eq i64 %n.vec, 0
  %24 = and i64 %22, 1
  %lcmp.mod225 = icmp eq i64 %24, 0
  %25 = icmp eq i64 %22, 0
  %cmp.n = icmp eq i64 %19, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next67, %for.cond92.for.inc112_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 0
  %scevgep158 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %19
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 0
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %19
  %scevgep164 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 0
  %scevgep166 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %19
  br i1 %min.iters.check, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep162
  %bound1 = icmp ult float* %scevgep160, %scevgep158
  %found.conflict = and i1 %bound0, %bound1
  %bound0168 = icmp ult float* %scevgep, %scevgep166
  %bound1169 = icmp ult float* %scevgep164, %scevgep158
  %found.conflict170 = and i1 %bound0168, %bound1169
  %conflict.rdx = or i1 %found.conflict, %found.conflict170
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod225, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %26 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 0
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !6
  %28 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 4
  %29 = bitcast float* %28 to <4 x float>*
  %wide.load172.prol = load <4 x float>, <4 x float>* %29, align 4, !alias.scope !6
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 0
  %31 = bitcast float* %30 to <4 x float>*
  %wide.load173.prol = load <4 x float>, <4 x float>* %31, align 4, !alias.scope !9
  %32 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  %wide.load174.prol = load <4 x float>, <4 x float>* %33, align 4, !alias.scope !9
  %34 = fadd <4 x float> %wide.load.prol, %wide.load173.prol
  %35 = fadd <4 x float> %wide.load172.prol, %wide.load174.prol
  %36 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 0
  %37 = bitcast float* %36 to <4 x float>*
  store <4 x float> %34, <4 x float>* %37, align 4, !alias.scope !11, !noalias !13
  %38 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 4
  %39 = bitcast float* %38 to <4 x float>*
  store <4 x float> %35, <4 x float>* %39, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.body.preheader
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br i1 %25, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %index
  %41 = bitcast float* %40 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %41, align 4, !alias.scope !6
  %42 = getelementptr float, float* %40, i64 4
  %43 = bitcast float* %42 to <4 x float>*
  %wide.load172 = load <4 x float>, <4 x float>* %43, align 4, !alias.scope !6
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %index
  %45 = bitcast float* %44 to <4 x float>*
  %wide.load173 = load <4 x float>, <4 x float>* %45, align 4, !alias.scope !9
  %46 = getelementptr float, float* %44, i64 4
  %47 = bitcast float* %46 to <4 x float>*
  %wide.load174 = load <4 x float>, <4 x float>* %47, align 4, !alias.scope !9
  %48 = fadd <4 x float> %wide.load, %wide.load173
  %49 = fadd <4 x float> %wide.load172, %wide.load174
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %index
  %51 = bitcast float* %50 to <4 x float>*
  store <4 x float> %48, <4 x float>* %51, align 4, !alias.scope !11, !noalias !13
  %52 = getelementptr float, float* %50, i64 4
  %53 = bitcast float* %52 to <4 x float>*
  store <4 x float> %49, <4 x float>* %53, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %index.next
  %55 = bitcast float* %54 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %55, align 4, !alias.scope !6
  %56 = getelementptr float, float* %54, i64 4
  %57 = bitcast float* %56 to <4 x float>*
  %wide.load172.1 = load <4 x float>, <4 x float>* %57, align 4, !alias.scope !6
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %index.next
  %59 = bitcast float* %58 to <4 x float>*
  %wide.load173.1 = load <4 x float>, <4 x float>* %59, align 4, !alias.scope !9
  %60 = getelementptr float, float* %58, i64 4
  %61 = bitcast float* %60 to <4 x float>*
  %wide.load174.1 = load <4 x float>, <4 x float>* %61, align 4, !alias.scope !9
  %62 = fadd <4 x float> %wide.load.1, %wide.load173.1
  %63 = fadd <4 x float> %wide.load172.1, %wide.load174.1
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %index.next
  %65 = bitcast float* %64 to <4 x float>*
  store <4 x float> %62, <4 x float>* %65, align 4, !alias.scope !11, !noalias !13
  %66 = getelementptr float, float* %64, i64 4
  %67 = bitcast float* %66 to <4 x float>*
  store <4 x float> %63, <4 x float>* %67, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.1, %n.vec
  br i1 %68, label %middle.block.loopexit, label %vector.body, !llvm.loop !14

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv62.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ %n.vec, %middle.block ]
  %69 = sub nsw i64 %23, %indvars.iv62.ph
  %xtraiter226 = and i64 %69, 1
  %lcmp.mod227 = icmp eq i64 %xtraiter226, 0
  br i1 %lcmp.mod227, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %70 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %71 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %70, %71
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next63.prol = or i64 %indvars.iv62.ph, 1
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.body94.us.preheader
  %indvars.iv62.unr.ph = phi i64 [ %indvars.iv.next63.prol, %for.body94.us.prol ], [ %indvars.iv62.ph, %for.body94.us.preheader ]
  %72 = icmp eq i64 %4, %indvars.iv62.ph
  br i1 %72, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next63.1, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62
  %73 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62
  %74 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %73, %74
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv.next63
  %75 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv.next63
  %76 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %75, %76
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv.next63
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond82.1 = icmp eq i64 %indvars.iv.next63, %4
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond82.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %for.body94.us.prol.loopexit, %middle.block
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next67, %3
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %77 = icmp sgt i32 %w, 0
  br i1 %77, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %78 = add i32 %w, -1
  %79 = sext i32 %h to i64
  %80 = zext i32 %78 to i64
  %mul126.us117 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us119 = fmul float %exp2, 0.000000e+00
  %mul130.us121 = fmul float %call29, -0.000000e+00
  %exitcond124 = icmp eq i32 %78, 0
  %xtraiter222 = and i64 %80, 1
  %lcmp.mod223 = icmp eq i64 %xtraiter222, 0
  %81 = icmp eq i32 %78, 1
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us115 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %82 = load float, float* %arrayidx124.us115, align 4
  %mul125.us116 = fmul float %div, %82
  %add127.us118 = fadd float %mul126.us117, %mul125.us116
  %add129.us120 = fadd float %mul128.us119, %add127.us118
  %add131.us122 = fadd float %mul130.us121, %add129.us120
  %arrayidx135.us123 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us122, float* %arrayidx135.us123, align 4
  br i1 %exitcond124, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod223, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit, label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  %sunkaddr232 = mul i64 %indvars.iv59, 4
  %sunkaddr233 = add i64 %sunkaddr, %sunkaddr232
  %sunkaddr234 = inttoptr i64 %sunkaddr233 to float*
  %83 = load float, float* %sunkaddr234, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv59
  %84 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %84
  %mul126.us.prol = fmul float %mul16.v.r1, %83
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us122
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv59
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol, %for.body120.us.for.body120.us_crit_edge.preheader
  %add131.us128.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us122, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us127.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us115, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %ym1.115.us126.unr.ph = phi float [ %add131.us122, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv55125.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  br i1 %81, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us128 = phi float [ %add131.us128.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us127 = phi float* [ %arrayidx124.us127.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.115.us126 = phi float [ %ym1.115.us126.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv55125 = phi i64 [ %indvars.iv55125.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next56.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55125, 1
  %85 = load float, float* %arrayidx124.us127, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %86 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %86
  %mul126.us = fmul float %mul16.v.r1, %85
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us128
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us126, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55125, 2
  %87 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %88 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %88
  %mul126.us.1 = fmul float %mul16.v.r1, %87
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us128, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next56.1, %80
  br i1 %exitcond.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.preheader.us
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next60, %79
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %89 = sext i32 %w to i64
  %indvars.iv.next51101 = add nsw i64 %89, -1
  %mul157.us102 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us103 = fmul float %1, -0.000000e+00
  %add159.us104 = fadd float %mul157.us102, %mul158.us103
  %mul160.us105 = fmul float %exp2, 0.000000e+00
  %add161.us106 = fadd float %add159.us104, %mul160.us105
  %mul162.us107 = fmul float %call29, -0.000000e+00
  %add163.us108 = fadd float %add161.us106, %mul162.us107
  %cmp155.us110 = icmp sgt i32 %w, 1
  %90 = and i64 %89, 1
  %lcmp.mod221 = icmp eq i64 %90, 0
  %indvars.iv.next51.prol = add nsw i64 %89, -2
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us108
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %91 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us109 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51101, i64 %indvars.iv52
  store float %add163.us108, float* %arrayidx167.us109, align 4
  br i1 %cmp155.us110, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod221, label %for.body156.us.for.body156.us_crit_edge.prol, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51101, i64 %indvars.iv52
  %92 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %92
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51.prol, i64 %indvars.iv52
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol, %for.body156.us.for.body156.us_crit_edge.preheader
  %add163.us114.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us108, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next51113.unr.ph = phi i64 [ %indvars.iv.next51.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %indvars.iv.next51101, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.07.us112.unr.ph = phi float [ %92, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.19.us111.unr.ph = phi float [ %add163.us108, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  br i1 %91, label %for.cond154.for.inc179_crit_edge.us, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us114 = phi float [ %add163.us114.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next51113 = phi i64 [ %indvars.iv.next51113.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next51.1, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.07.us112 = phi float [ %tp1.07.us112.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %94, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.19.us111 = phi float [ %yp1.19.us111.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51113, i64 %indvars.iv52
  %93 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next51 = add nsw i64 %indvars.iv.next51113, -1
  %mul157.us = fmul float %mul16.v.r2, %93
  %mul158.us = fmul float %tp1.07.us112, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us114
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us111, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51, i64 %indvars.iv52
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51, i64 %indvars.iv52
  %94 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv.next51113, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %94
  %mul158.us.1 = fmul float %93, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us114, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51.1, i64 %indvars.iv52
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next51, 1
  br i1 %cmp155.us.1, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.body156.us.for.body156.us_crit_edge.prol.loopexit, %for.cond154.preheader.us
  %indvars.iv.next53 = add nuw i64 %indvars.iv52, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next53, %79
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %95 = icmp sgt i32 %h, 0
  %96 = icmp sgt i32 %w, 0
  %or.cond = and i1 %96, %95
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %97 = add i32 %h, -1
  %98 = sext i32 %w to i64
  %99 = zext i32 %97 to i64
  %100 = add nuw nsw i64 %99, 1
  %101 = and i64 %100, 8589934584
  %102 = add nsw i64 %101, -8
  %103 = lshr exact i64 %102, 3
  %104 = add nuw nsw i64 %99, 1
  %min.iters.check178 = icmp ult i64 %100, 8
  %n.vec181 = and i64 %100, 8589934584
  %cmp.zero182 = icmp eq i64 %n.vec181, 0
  %105 = and i64 %103, 1
  %lcmp.mod = icmp eq i64 %105, 0
  %106 = icmp eq i64 %103, 0
  %cmp.n209 = icmp eq i64 %100, %n.vec181
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next48, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep184 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %100
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %scevgep190 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %100
  %scevgep192 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %scevgep194 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %100
  br i1 %min.iters.check178, label %for.body187.us.preheader, label %min.iters.checked179

min.iters.checked179:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero182, label %for.body187.us.preheader, label %vector.memcheck204

vector.memcheck204:                               ; preds = %min.iters.checked179
  %bound0196 = icmp ult float* %scevgep184, %scevgep190
  %bound1197 = icmp ult float* %scevgep188, %scevgep186
  %found.conflict198 = and i1 %bound0196, %bound1197
  %bound0199 = icmp ult float* %scevgep184, %scevgep194
  %bound1200 = icmp ult float* %scevgep192, %scevgep186
  %found.conflict201 = and i1 %bound0199, %bound1200
  %conflict.rdx202 = or i1 %found.conflict198, %found.conflict201
  br i1 %conflict.rdx202, label %for.body187.us.preheader, label %vector.body175.preheader

vector.body175.preheader:                         ; preds = %vector.memcheck204
  br i1 %lcmp.mod, label %vector.body175.prol, label %vector.body175.prol.loopexit

vector.body175.prol:                              ; preds = %vector.body175.preheader
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load214.prol = load <4 x float>, <4 x float>* %108, align 4, !alias.scope !16
  %109 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 4
  %110 = bitcast float* %109 to <4 x float>*
  %wide.load215.prol = load <4 x float>, <4 x float>* %110, align 4, !alias.scope !16
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %112 = bitcast float* %111 to <4 x float>*
  %wide.load216.prol = load <4 x float>, <4 x float>* %112, align 4, !alias.scope !19
  %113 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 4
  %114 = bitcast float* %113 to <4 x float>*
  %wide.load217.prol = load <4 x float>, <4 x float>* %114, align 4, !alias.scope !19
  %115 = fadd <4 x float> %wide.load214.prol, %wide.load216.prol
  %116 = fadd <4 x float> %wide.load215.prol, %wide.load217.prol
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  %118 = bitcast float* %117 to <4 x float>*
  store <4 x float> %115, <4 x float>* %118, align 4, !alias.scope !21, !noalias !23
  %119 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 4
  %120 = bitcast float* %119 to <4 x float>*
  store <4 x float> %116, <4 x float>* %120, align 4, !alias.scope !21, !noalias !23
  br label %vector.body175.prol.loopexit

vector.body175.prol.loopexit:                     ; preds = %vector.body175.prol, %vector.body175.preheader
  %index206.unr.ph = phi i64 [ 8, %vector.body175.prol ], [ 0, %vector.body175.preheader ]
  br i1 %106, label %middle.block176, label %vector.body175.preheader.new

vector.body175.preheader.new:                     ; preds = %vector.body175.prol.loopexit
  br label %vector.body175

vector.body175:                                   ; preds = %vector.body175, %vector.body175.preheader.new
  %index206 = phi i64 [ %index206.unr.ph, %vector.body175.preheader.new ], [ %index.next207.1, %vector.body175 ]
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %index206
  %122 = bitcast float* %121 to <4 x float>*
  %wide.load214 = load <4 x float>, <4 x float>* %122, align 4, !alias.scope !16
  %123 = getelementptr float, float* %121, i64 4
  %124 = bitcast float* %123 to <4 x float>*
  %wide.load215 = load <4 x float>, <4 x float>* %124, align 4, !alias.scope !16
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %index206
  %126 = bitcast float* %125 to <4 x float>*
  %wide.load216 = load <4 x float>, <4 x float>* %126, align 4, !alias.scope !19
  %127 = getelementptr float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  %wide.load217 = load <4 x float>, <4 x float>* %128, align 4, !alias.scope !19
  %129 = fadd <4 x float> %wide.load214, %wide.load216
  %130 = fadd <4 x float> %wide.load215, %wide.load217
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %index206
  %132 = bitcast float* %131 to <4 x float>*
  store <4 x float> %129, <4 x float>* %132, align 4, !alias.scope !21, !noalias !23
  %133 = getelementptr float, float* %131, i64 4
  %134 = bitcast float* %133 to <4 x float>*
  store <4 x float> %130, <4 x float>* %134, align 4, !alias.scope !21, !noalias !23
  %index.next207 = add i64 %index206, 8
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %index.next207
  %136 = bitcast float* %135 to <4 x float>*
  %wide.load214.1 = load <4 x float>, <4 x float>* %136, align 4, !alias.scope !16
  %137 = getelementptr float, float* %135, i64 4
  %138 = bitcast float* %137 to <4 x float>*
  %wide.load215.1 = load <4 x float>, <4 x float>* %138, align 4, !alias.scope !16
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %index.next207
  %140 = bitcast float* %139 to <4 x float>*
  %wide.load216.1 = load <4 x float>, <4 x float>* %140, align 4, !alias.scope !19
  %141 = getelementptr float, float* %139, i64 4
  %142 = bitcast float* %141 to <4 x float>*
  %wide.load217.1 = load <4 x float>, <4 x float>* %142, align 4, !alias.scope !19
  %143 = fadd <4 x float> %wide.load214.1, %wide.load216.1
  %144 = fadd <4 x float> %wide.load215.1, %wide.load217.1
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %index.next207
  %146 = bitcast float* %145 to <4 x float>*
  store <4 x float> %143, <4 x float>* %146, align 4, !alias.scope !21, !noalias !23
  %147 = getelementptr float, float* %145, i64 4
  %148 = bitcast float* %147 to <4 x float>*
  store <4 x float> %144, <4 x float>* %148, align 4, !alias.scope !21, !noalias !23
  %index.next207.1 = add i64 %index206, 16
  %149 = icmp eq i64 %index.next207.1, %n.vec181
  br i1 %149, label %middle.block176.loopexit, label %vector.body175, !llvm.loop !24

middle.block176.loopexit:                         ; preds = %vector.body175
  br label %middle.block176

middle.block176:                                  ; preds = %middle.block176.loopexit, %vector.body175.prol.loopexit
  br i1 %cmp.n209, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block176, %vector.memcheck204, %min.iters.checked179, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck204 ], [ 0, %min.iters.checked179 ], [ 0, %for.cond185.preheader.us ], [ %n.vec181, %middle.block176 ]
  %150 = sub nsw i64 %104, %indvars.iv.ph
  %xtraiter218 = and i64 %150, 1
  %lcmp.mod219 = icmp eq i64 %xtraiter218, 0
  br i1 %lcmp.mod219, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.ph
  %151 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.ph
  %152 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %151, %152
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.body187.us.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body187.us.prol ], [ %indvars.iv.ph, %for.body187.us.preheader ]
  %153 = icmp eq i64 %99, %indvars.iv.ph
  br i1 %153, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %154 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %155 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %154, %155
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.next
  %156 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.next
  %157 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %156, %157
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond81.1 = icmp eq i64 %indvars.iv.next, %99
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond81.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %for.body187.us.prol.loopexit, %middle.block176
  %indvars.iv.next48 = add nuw i64 %indvars.iv47, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next48, %98
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
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
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

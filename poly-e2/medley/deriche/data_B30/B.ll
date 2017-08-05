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
  %wide.trip.count = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
  %2 = mul nsw i64 %indvars.iv8, 313
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ], [ 0, %for.cond1.preheader.us ]
  %3 = mul nuw nsw i64 %indvars.iv, 991
  %4 = add nsw i64 %3, %2
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
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
  %wide.trip.count76 = zext i32 %2 to i64
  %mul37.us142 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us144 = fmul float %exp2, 0.000000e+00
  %mul41.us146 = fmul float %call29, -0.000000e+00
  %exitcond77149 = icmp eq i32 %2, 0
  %xtraiter162 = and i64 %wide.trip.count76, 1
  %lcmp.mod163 = icmp eq i64 %xtraiter162, 0
  %4 = icmp eq i32 %2, 1
  %mul36.us.1.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.1.v.i0.2 = insertelement <2 x float> %mul36.us.1.v.i0.1, float %div, i32 1
  %mul36.us.prol.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.prol.v.i0.2 = insertelement <2 x float> %mul36.us.prol.v.i0.1, float %div, i32 1
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next79, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us140 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 0
  %5 = load float, float* %arrayidx35.us140, align 4
  %mul36.us141 = fmul float %div, %5
  %add38.us143 = fadd float %mul37.us142, %mul36.us141
  %add40.us145 = fadd float %mul39.us144, %add38.us143
  %add42.us147 = fadd float %mul41.us146, %add40.us145
  %arrayidx46.us148 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 0
  store float %add42.us147, float* %arrayidx46.us148, align 4
  br i1 %exitcond77149, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod163, label %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body33.us.for.body33.us_crit_edge.prol.preheader

for.body33.us.for.body33.us_crit_edge.prol.preheader: ; preds = %for.body33.us.for.body33.us_crit_edge.preheader
  br label %for.body33.us.for.body33.us_crit_edge.prol

for.body33.us.for.body33.us_crit_edge.prol:       ; preds = %for.body33.us.for.body33.us_crit_edge.prol.preheader
  %6 = bitcast float* %arrayidx35.us140 to <2 x float>*
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 1
  %7 = load <2 x float>, <2 x float>* %6, align 4
  %mul37.us.prol = fmul <2 x float> %mul36.us.prol.v.i0.2, %7
  %mul37.us.prol.v.r1 = extractelement <2 x float> %mul37.us.prol, i32 0
  %mul37.us.prol.v.r2 = extractelement <2 x float> %mul37.us.prol, i32 1
  %add38.us.prol = fadd float %mul37.us.prol.v.r1, %mul37.us.prol.v.r2
  %mul39.us.prol = fmul float %exp2, %add42.us147
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa

for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body33.us.for.body33.us_crit_edge.preheader, %for.body33.us.for.body33.us_crit_edge.prol
  %add42.us153.unr.ph = phi float [ %add42.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %add42.us147, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us152.unr.ph = phi float* [ %arrayidx35.us.prol, %for.body33.us.for.body33.us_crit_edge.prol ], [ %arrayidx35.us140, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.035.us151.unr.ph = phi float [ %add42.us147, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv74150.unr.ph = phi i64 [ 1, %for.body33.us.for.body33.us_crit_edge.prol ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  br label %for.body33.us.for.body33.us_crit_edge.prol.loopexit

for.body33.us.for.body33.us_crit_edge.prol.loopexit: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %4, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge.preheader.new

for.body33.us.for.body33.us_crit_edge.preheader.new: ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.for.body33.us_crit_edge.preheader.new
  %add42.us153 = phi float [ %add42.us153.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %arrayidx35.us152 = phi float* [ %arrayidx35.us152.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge ]
  %ym1.035.us151 = phi float [ %ym1.035.us151.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv74150 = phi i64 [ %indvars.iv74150.unr.ph, %for.body33.us.for.body33.us_crit_edge.preheader.new ], [ %indvars.iv.next75.1, %for.body33.us.for.body33.us_crit_edge ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74150, 1
  %8 = load float, float* %arrayidx35.us152, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16.v.r1, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us153
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us151, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74150, 2
  %10 = bitcast float* %arrayidx35.us to <2 x float>*
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  %11 = load <2 x float>, <2 x float>* %10, align 4
  %mul37.us.1 = fmul <2 x float> %mul36.us.1.v.i0.2, %11
  %mul37.us.1.v.r1 = extractelement <2 x float> %mul37.us.1, i32 0
  %mul37.us.1.v.r2 = extractelement <2 x float> %mul37.us.1, i32 1
  %add38.us.1 = fadd float %mul37.us.1.v.r1, %mul37.us.1.v.r2
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us153, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond77.1 = icmp eq i64 %indvars.iv.next75.1, %wide.trip.count76
  br i1 %exitcond77.1, label %for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us.loopexit

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge.prol.loopexit, %for.cond31.for.inc55_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.cond31.preheader.us
  %indvars.iv.next79 = add nuw i64 %indvars.iv78, 1
  %cmp.us = icmp slt i64 %indvars.iv.next79, %3
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %12 = sext i32 %h to i64
  %indvars.iv.next70126 = add nsw i64 %12, -1
  %mul65.us127 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us128 = fmul float %1, -0.000000e+00
  %add67.us129 = fadd float %mul65.us127, %mul66.us128
  %mul68.us130 = fmul float %exp2, 0.000000e+00
  %add69.us131 = fadd float %add67.us129, %mul68.us130
  %mul70.us132 = fmul float %call29, -0.000000e+00
  %add71.us133 = fadd float %add69.us131, %mul70.us132
  %cmp63.us135 = icmp sgt i32 %h, 1
  %13 = and i64 %12, 1
  %lcmp.mod161 = icmp eq i64 %13, 0
  %indvars.iv.next70.prol = add nsw i64 %12, -2
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us133
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  %14 = icmp eq i32 %h, 2
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next72, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us134 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70126
  store float %add71.us133, float* %arrayidx75.us134, align 4
  br i1 %cmp63.us135, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod161, label %for.body64.us.for.body64.us_crit_edge.prol.preheader, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.preheader: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  br label %for.body64.us.for.body64.us_crit_edge.prol

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.prol.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70126
  %15 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %15
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader, %for.body64.us.for.body64.us_crit_edge.prol
  %add71.us139.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us133, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next70138.unr.ph = phi i64 [ %indvars.iv.next70.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %indvars.iv.next70126, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.027.us137.unr.ph = phi float [ %15, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.029.us136.unr.ph = phi float [ %add71.us133, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond62.for.inc86_crit_edge.us.loopexit, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us139 = phi float [ %add71.us139.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next70138 = phi i64 [ %indvars.iv.next70138.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next70.1, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.027.us137 = phi float [ %xp1.027.us137.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %17, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.029.us136 = phi float [ %yp1.029.us136.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70138
  %16 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next70 = add nsw i64 %indvars.iv.next70138, -1
  %mul65.us = fmul float %mul16.v.r2, %16
  %mul66.us = fmul float %xp1.027.us137, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us139
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us136, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70
  %17 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv.next70138, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %17
  %mul66.us.1 = fmul float %16, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us139, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next70, 1
  br i1 %cmp63.us.1, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa

for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body64.us.for.body64.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us.loopexit

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit, %for.cond62.for.inc86_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.cond62.for.inc86_crit_edge.us.loopexit, %for.cond62.preheader.us
  %indvars.iv.next72 = add nuw i64 %indvars.iv71, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next72, %3
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %xtraiter158 = and i64 %3, 1
  %lcmp.mod159 = icmp eq i64 %xtraiter158, 0
  br i1 %lcmp.mod159, label %for.cond92.preheader.us.prol.loopexit, label %for.cond92.preheader.us.prol.preheader

for.cond92.preheader.us.prol.preheader:           ; preds = %for.cond92.preheader.us.preheader
  br label %for.cond92.preheader.us.prol

for.cond92.preheader.us.prol:                     ; preds = %for.cond92.preheader.us.prol.preheader
  br label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.for.body94.us_crit_edge.prol, %for.cond92.preheader.us.prol
  %indvars.iv62.prol = phi i64 [ %indvars.iv.next63.prol, %for.body94.us.for.body94.us_crit_edge.prol ], [ 0, %for.cond92.preheader.us.prol ]
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv62.prol
  %18 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 0, i64 %indvars.iv62.prol
  %19 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %18, %19
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv62.prol
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %exitcond65.prol = icmp eq i64 %indvars.iv62.prol, %wide.trip.count76
  br i1 %exitcond65.prol, label %for.cond92.for.inc112_crit_edge.us.prol, label %for.body94.us.for.body94.us_crit_edge.prol

for.body94.us.for.body94.us_crit_edge.prol:       ; preds = %for.body94.us.prol
  %indvars.iv.next63.prol = add nuw nsw i64 %indvars.iv62.prol, 1
  br label %for.body94.us.prol

for.cond92.for.inc112_crit_edge.us.prol:          ; preds = %for.body94.us.prol
  br label %for.cond92.preheader.us.prol.loopexit

for.cond92.preheader.us.prol.loopexit:            ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us.prol
  %indvars.iv66.unr = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ 1, %for.cond92.for.inc112_crit_edge.us.prol ]
  %20 = icmp eq i32 %w, 1
  br i1 %20, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us.preheader.new

for.cond92.preheader.us.preheader.new:            ; preds = %for.cond92.preheader.us.prol.loopexit
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us.1, %for.cond92.preheader.us.preheader.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr, %for.cond92.preheader.us.preheader.new ], [ %indvars.iv.next67.1, %for.cond92.for.inc112_crit_edge.us.1 ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.for.body94.us_crit_edge, %for.cond92.preheader.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body94.us.for.body94.us_crit_edge ], [ 0, %for.cond92.preheader.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62
  %21 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62
  %22 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %21, %22
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62
  store float %add103.us, float* %arrayidx108.us, align 4
  %exitcond65 = icmp eq i64 %indvars.iv62, %wide.trip.count76
  br i1 %exitcond65, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.for.body94.us_crit_edge

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br label %for.body94.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.body94.us
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br label %for.body94.us.1

for.cond115.preheader.loopexit.unr-lcssa:         ; preds = %for.cond92.for.inc112_crit_edge.us.1
  br label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.preheader.us.prol.loopexit, %for.cond115.preheader.loopexit.unr-lcssa
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 %cmp39, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %23 = add i32 %w, -1
  %24 = sext i32 %h to i64
  %wide.trip.count57 = zext i32 %23 to i64
  %mul126.us114 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us116 = fmul float %exp2, 0.000000e+00
  %mul130.us118 = fmul float %call29, -0.000000e+00
  %exitcond58121 = icmp eq i32 %23, 0
  %xtraiter156 = and i64 %wide.trip.count57, 1
  %lcmp.mod157 = icmp eq i64 %xtraiter156, 0
  %25 = icmp eq i32 %23, 1
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us112 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %26 = load float, float* %arrayidx124.us112, align 4
  %mul125.us113 = fmul float %div, %26
  %add127.us115 = fadd float %mul126.us114, %mul125.us113
  %add129.us117 = fadd float %mul128.us116, %add127.us115
  %add131.us119 = fadd float %mul130.us118, %add129.us117
  %arrayidx135.us120 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us119, float* %arrayidx135.us120, align 4
  br i1 %exitcond58121, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod157, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body120.us.for.body120.us_crit_edge.prol.preheader

for.body120.us.for.body120.us_crit_edge.prol.preheader: ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  br label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.prol.preheader
  %27 = load float, float* %arrayidx124.us112, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv59
  %28 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %28
  %mul126.us.prol = fmul float %mul16.v.r1, %27
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us119
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv59
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa

for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body120.us.for.body120.us_crit_edge.preheader, %for.body120.us.for.body120.us_crit_edge.prol
  %add131.us125.unr.ph = phi float [ %add131.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %add131.us119, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %arrayidx124.us124.unr.ph = phi float* [ %arrayidx124.us.prol, %for.body120.us.for.body120.us_crit_edge.prol ], [ %arrayidx124.us112, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %ym1.115.us123.unr.ph = phi float [ %add131.us119, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0.000000e+00, %for.body120.us.for.body120.us_crit_edge.preheader ]
  %indvars.iv55122.unr.ph = phi i64 [ 1, %for.body120.us.for.body120.us_crit_edge.prol ], [ 0, %for.body120.us.for.body120.us_crit_edge.preheader ]
  br label %for.body120.us.for.body120.us_crit_edge.prol.loopexit

for.body120.us.for.body120.us_crit_edge.prol.loopexit: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %25, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us125 = phi float [ %add131.us125.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us124 = phi float* [ %arrayidx124.us124.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.115.us123 = phi float [ %ym1.115.us123.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv55122 = phi i64 [ %indvars.iv55122.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next56.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55122, 1
  %29 = load float, float* %arrayidx124.us124, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %30 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %30
  %mul126.us = fmul float %mul16.v.r1, %29
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us125
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us123, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55122, 2
  %31 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %32 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %32
  %mul126.us.1 = fmul float %mul16.v.r1, %31
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us125, %sub30
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
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next60, %24
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %33 = sext i32 %w to i64
  %indvars.iv.next5198 = add nsw i64 %33, -1
  %mul157.us99 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us100 = fmul float %1, -0.000000e+00
  %add159.us101 = fadd float %mul157.us99, %mul158.us100
  %mul160.us102 = fmul float %exp2, 0.000000e+00
  %add161.us103 = fadd float %add159.us101, %mul160.us102
  %mul162.us104 = fmul float %call29, -0.000000e+00
  %add163.us105 = fadd float %add161.us103, %mul162.us104
  %cmp155.us107 = icmp sgt i32 %w, 1
  %34 = and i64 %33, 1
  %lcmp.mod155 = icmp eq i64 %34, 0
  %indvars.iv.next51.prol = add nsw i64 %33, -2
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us105
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %35 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us106 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next5198, i64 %indvars.iv52
  store float %add163.us105, float* %arrayidx167.us106, align 4
  br i1 %cmp155.us107, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod155, label %for.body156.us.for.body156.us_crit_edge.prol.preheader, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.preheader: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  br label %for.body156.us.for.body156.us_crit_edge.prol

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.prol.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next5198, i64 %indvars.iv52
  %36 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %36
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51.prol, i64 %indvars.iv52
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader, %for.body156.us.for.body156.us_crit_edge.prol
  %add163.us111.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us105, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next51110.unr.ph = phi i64 [ %indvars.iv.next51.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %indvars.iv.next5198, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.07.us109.unr.ph = phi float [ %36, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.19.us108.unr.ph = phi float [ %add163.us105, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 %35, label %for.cond154.for.inc179_crit_edge.us.loopexit, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us111 = phi float [ %add163.us111.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next51110 = phi i64 [ %indvars.iv.next51110.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next51.1, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.07.us109 = phi float [ %tp1.07.us109.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %38, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.19.us108 = phi float [ %yp1.19.us108.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51110, i64 %indvars.iv52
  %37 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next51 = add nsw i64 %indvars.iv.next51110, -1
  %mul157.us = fmul float %mul16.v.r2, %37
  %mul158.us = fmul float %tp1.07.us109, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us111
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us108, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51, i64 %indvars.iv52
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51, i64 %indvars.iv52
  %38 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv.next51110, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %38
  %mul158.us.1 = fmul float %37, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us111, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51.1, i64 %indvars.iv52
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next51, 1
  br i1 %cmp155.us.1, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa

for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body156.us.for.body156.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us.loopexit

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit, %for.cond154.for.inc179_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.cond154.for.inc179_crit_edge.us.loopexit, %for.cond154.preheader.us
  %indvars.iv.next53 = add nuw i64 %indvars.iv52, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next53, %24
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader
  %or.cond = and i1 %cmp39, %cmp11619
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %39 = add i32 %h, -1
  %40 = sext i32 %w to i64
  %wide.trip.count = zext i32 %39 to i64
  %xtraiter = and i64 %40, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond185.preheader.us.prol.loopexit, label %for.cond185.preheader.us.prol.preheader

for.cond185.preheader.us.prol.preheader:          ; preds = %for.cond185.preheader.us.preheader
  br label %for.cond185.preheader.us.prol

for.cond185.preheader.us.prol:                    ; preds = %for.cond185.preheader.us.prol.preheader
  br label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.for.body187.us_crit_edge.prol, %for.cond185.preheader.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body187.us.for.body187.us_crit_edge.prol ], [ 0, %for.cond185.preheader.us.prol ]
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv.prol
  %41 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 0, i64 %indvars.iv.prol
  %42 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %41, %42
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv.prol
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %exitcond.prol = icmp eq i64 %indvars.iv.prol, %wide.trip.count
  br i1 %exitcond.prol, label %for.cond185.for.inc205_crit_edge.us.prol, label %for.body187.us.for.body187.us_crit_edge.prol

for.body187.us.for.body187.us_crit_edge.prol:     ; preds = %for.body187.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.body187.us.prol

for.cond185.for.inc205_crit_edge.us.prol:         ; preds = %for.body187.us.prol
  br label %for.cond185.preheader.us.prol.loopexit

for.cond185.preheader.us.prol.loopexit:           ; preds = %for.cond185.preheader.us.preheader, %for.cond185.for.inc205_crit_edge.us.prol
  %indvars.iv47.unr = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ 1, %for.cond185.for.inc205_crit_edge.us.prol ]
  %43 = icmp eq i32 %w, 1
  br i1 %43, label %for.end207.loopexit, label %for.cond185.preheader.us.preheader.new

for.cond185.preheader.us.preheader.new:           ; preds = %for.cond185.preheader.us.prol.loopexit
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us.1, %for.cond185.preheader.us.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %for.cond185.preheader.us.preheader.new ], [ %indvars.iv.next48.1, %for.cond185.for.inc205_crit_edge.us.1 ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.for.body187.us_crit_edge, %for.cond185.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body187.us.for.body187.us_crit_edge ], [ 0, %for.cond185.preheader.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %44 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %45 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %44, %45
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.for.body187.us_crit_edge

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body187.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.body187.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  br label %for.body187.us.1

for.end207.loopexit.unr-lcssa:                    ; preds = %for.cond185.for.inc205_crit_edge.us.1
  br label %for.end207.loopexit

for.end207.loopexit:                              ; preds = %for.cond185.preheader.us.prol.loopexit, %for.end207.loopexit.unr-lcssa
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond182.preheader, %for.cond118.preheader.lr.ph, %for.cond31.preheader.lr.ph
  ret void

for.body187.us.1:                                 ; preds = %for.body187.us.for.body187.us_crit_edge.1, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body187.us.for.body187.us_crit_edge.1 ], [ 0, %for.cond185.for.inc205_crit_edge.us ]
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %46 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %47 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %46, %47
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next48, i64 %indvars.iv.1
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.1, label %for.body187.us.for.body187.us_crit_edge.1

for.body187.us.for.body187.us_crit_edge.1:        ; preds = %for.body187.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body187.us.1

for.cond185.for.inc205_crit_edge.us.1:            ; preds = %for.body187.us.1
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %cmp183.us.1 = icmp slt i64 %indvars.iv.next48.1, %40
  br i1 %cmp183.us.1, label %for.cond185.preheader.us, label %for.end207.loopexit.unr-lcssa

for.body94.us.1:                                  ; preds = %for.body94.us.for.body94.us_crit_edge.1, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv62.1 = phi i64 [ %indvars.iv.next63.1, %for.body94.us.for.body94.us_crit_edge.1 ], [ 0, %for.cond92.for.inc112_crit_edge.us ]
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  %48 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  %49 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %48, %49
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond65.1 = icmp eq i64 %indvars.iv62.1, %wide.trip.count76
  br i1 %exitcond65.1, label %for.cond92.for.inc112_crit_edge.us.1, label %for.body94.us.for.body94.us_crit_edge.1

for.body94.us.for.body94.us_crit_edge.1:          ; preds = %for.body94.us.1
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62.1, 1
  br label %for.body94.us.1

for.cond92.for.inc112_crit_edge.us.1:             ; preds = %for.body94.us.1
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %cmp90.us.1 = icmp slt i64 %indvars.iv.next67.1, %3
  br i1 %cmp90.us.1, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit.unr-lcssa
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

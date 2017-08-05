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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #4
  %arraydecay = bitcast i8* %call to [2160 x float]*
  %arraydecay4 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay)
  call void (...) @polybench_timer_start() #4
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %w, i32 %h, float* %alpha, [2160 x float]* %imgIn) unnamed_addr #0 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
  %0 = mul nsw i64 %indvars.iv8, 313
  br i1 false, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 false, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 true, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ 2160, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %10 = mul nuw nsw i64 %indvars.iv, 991
  %11 = add nsw i64 %10, %0
  %12 = trunc i64 %11 to i32
  %rem.us = srem i32 %12, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2159
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, 4096
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9.loopexit

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut, [2160 x float]* %y1, [2160 x float]* %y2) unnamed_addr #0 {
entry:
  %sub = fsub float -0.000000e+00, %alpha
  %call = tail call float @expf(float %sub) #4
  %sub1 = fsub float 1.000000e+00, %call
  %call3 = tail call float @expf(float %sub) #4
  %sub4 = fsub float 1.000000e+00, %call3
  %mul = fmul float %sub1, %sub4
  %mul5 = fmul float %alpha, 2.000000e+00
  %call7 = tail call float @expf(float %sub) #4
  %mul8 = fmul float %mul5, %call7
  %add = fadd float %mul8, 1.000000e+00
  %call10 = tail call float @expf(float %mul5) #4
  %sub11 = fsub float %add, %call10
  %div = fdiv float %mul, %sub11
  %call13 = tail call float @expf(float %sub) #4
  %mul14 = fmul float %call13, %div
  %call18 = tail call float @expf(float %sub) #4
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
  %call24 = tail call float @expf(float %mul23) #4
  %1 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %1
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #4
  %sub30 = fsub float -0.000000e+00, %call29
  br i1 true, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %mul37.us142 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us144 = fmul float %exp2, 0.000000e+00
  %mul41.us146 = fmul float %call29, -0.000000e+00
  %mul36.us.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.us.v.i0.2 = insertelement <2 x float> %mul36.us.v.i0.1, float %div, i32 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv78 = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next79, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us140 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 0
  %2 = load float, float* %arrayidx35.us140, align 4
  %mul36.us141 = fmul float %div, %2
  %add38.us143 = fadd float %mul37.us142, %mul36.us141
  %add40.us145 = fadd float %mul39.us144, %add38.us143
  %add42.us147 = fadd float %mul41.us146, %add40.us145
  %arrayidx46.us148 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 0
  store float %add42.us147, float* %arrayidx46.us148, align 4
  br i1 false, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.preheader

for.body33.us.for.body33.us_crit_edge.preheader:  ; preds = %for.cond31.preheader.us
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge.preheader, %for.body33.us.for.body33.us_crit_edge
  %add42.us153 = phi float [ %add42.us, %for.body33.us.for.body33.us_crit_edge ], [ %add42.us147, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %arrayidx35.us152 = phi float* [ %arrayidx35.us, %for.body33.us.for.body33.us_crit_edge ], [ %arrayidx35.us140, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %ym1.035.us151 = phi float [ %add42.us153, %for.body33.us.for.body33.us_crit_edge ], [ 0.000000e+00, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv74150 = phi i64 [ %indvars.iv.next75, %for.body33.us.for.body33.us_crit_edge ], [ 0, %for.body33.us.for.body33.us_crit_edge.preheader ]
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74150, 1
  %3 = bitcast float* %arrayidx35.us152 to <2 x float>*
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75
  %4 = load <2 x float>, <2 x float>* %3, align 4
  %mul37.us = fmul <2 x float> %mul36.us.v.i0.2, %4
  %mul37.us.v.r1 = extractelement <2 x float> %mul37.us, i32 0
  %mul37.us.v.r2 = extractelement <2 x float> %mul37.us, i32 1
  %add38.us = fadd float %mul37.us.v.r1, %mul37.us.v.r2
  %mul39.us = fmul float %exp2, %add42.us153
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us151, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2159
  br i1 %exitcond77, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us.for.body33.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.cond31.preheader.us
  %indvars.iv.next79 = add nuw i64 %indvars.iv78, 1
  %cmp.us = icmp slt i64 %indvars.iv.next79, 4096
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond58.preheader

for.cond58.preheader:                             ; preds = %for.cond31.for.inc55_crit_edge.us
  br i1 true, label %for.cond62.preheader.lr.ph, label %for.cond115.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader
  br i1 true, label %for.cond62.preheader.us.preheader, label %for.end207

for.cond62.preheader.us.preheader:                ; preds = %for.cond62.preheader.lr.ph
  %mul65.us127 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us128 = fmul float %1, -0.000000e+00
  %add67.us129 = fadd float %mul65.us127, %mul66.us128
  %mul68.us130 = fmul float %exp2, 0.000000e+00
  %add69.us131 = fadd float %add67.us129, %mul68.us130
  %mul70.us132 = fmul float %call29, -0.000000e+00
  %add71.us133 = fadd float %add69.us131, %mul70.us132
  %mul66.us.prol = fmul float %1, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us133
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv71 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next72, %for.cond62.for.inc86_crit_edge.us ]
  %arrayidx75.us134 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 2159
  store float %add71.us133, float* %arrayidx75.us134, align 4
  br i1 true, label %for.body64.us.for.body64.us_crit_edge.preheader, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge.preheader:  ; preds = %for.cond62.preheader.us
  br i1 true, label %for.body64.us.for.body64.us_crit_edge.prol.preheader, label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.preheader: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader
  br label %for.body64.us.for.body64.us_crit_edge.prol

for.body64.us.for.body64.us_crit_edge.prol:       ; preds = %for.body64.us.for.body64.us_crit_edge.prol.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 2159
  %5 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul16.v.r2, %5
  %add67.us.prol = fadd float %mul65.us.prol, %mul66.us.prol
  %add69.us.prol = fadd float %add67.us.prol, %mul68.us.prol
  %add71.us.prol = fadd float %add69.us.prol, %mul70.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 2158
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa

for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body64.us.for.body64.us_crit_edge.preheader, %for.body64.us.for.body64.us_crit_edge.prol
  %add71.us139.unr.ph = phi float [ %add71.us.prol, %for.body64.us.for.body64.us_crit_edge.prol ], [ %add71.us133, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %indvars.iv.next70138.unr.ph = phi i64 [ 2158, %for.body64.us.for.body64.us_crit_edge.prol ], [ 2159, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %xp1.027.us137.unr.ph = phi float [ %5, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  %yp1.029.us136.unr.ph = phi float [ %add71.us133, %for.body64.us.for.body64.us_crit_edge.prol ], [ 0.000000e+00, %for.body64.us.for.body64.us_crit_edge.preheader ]
  br label %for.body64.us.for.body64.us_crit_edge.prol.loopexit

for.body64.us.for.body64.us_crit_edge.prol.loopexit: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %for.cond62.for.inc86_crit_edge.us.loopexit, label %for.body64.us.for.body64.us_crit_edge.preheader.new

for.body64.us.for.body64.us_crit_edge.preheader.new: ; preds = %for.body64.us.for.body64.us_crit_edge.prol.loopexit
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge, %for.body64.us.for.body64.us_crit_edge.preheader.new
  %add71.us139 = phi float [ %add71.us139.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next70138 = phi i64 [ %indvars.iv.next70138.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %indvars.iv.next70.1, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.027.us137 = phi float [ %xp1.027.us137.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %7, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.029.us136 = phi float [ %yp1.029.us136.unr.ph, %for.body64.us.for.body64.us_crit_edge.preheader.new ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70138
  %6 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next70 = add nsw i64 %indvars.iv.next70138, -1
  %mul65.us = fmul float %mul16.v.r2, %6
  %mul66.us = fmul float %xp1.027.us137, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us139
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us136, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70
  %7 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv.next70138, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %7
  %mul66.us.1 = fmul float %6, %mul25
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
  %cmp59.us = icmp slt i64 %indvars.iv.next72, 4096
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond89.preheader

for.cond89.preheader:                             ; preds = %for.cond62.for.inc86_crit_edge.us
  br i1 true, label %for.cond92.preheader.lr.ph, label %for.cond115.preheader

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  br i1 true, label %for.cond92.preheader.us.preheader, label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next67, %for.cond92.for.inc112_crit_edge.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 0
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 2160
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 0
  %scevgep159 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 2160
  %scevgep161 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 0
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 2160
  br i1 false, label %for.body94.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 false, label %for.body94.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep159
  %bound1 = icmp ult float* %scevgep157, %scevgep155
  %found.conflict = and i1 %bound0, %bound1
  %bound0165 = icmp ult float* %scevgep, %scevgep163
  %bound1166 = icmp ult float* %scevgep161, %scevgep155
  %found.conflict167 = and i1 %bound0165, %bound1166
  %conflict.rdx = or i1 %found.conflict, %found.conflict167
  br i1 %conflict.rdx, label %for.body94.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 false, label %vector.body.prol.preheader, label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.preheader
  %8 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 0
  %9 = bitcast float* %8 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %9, align 4, !alias.scope !6
  %10 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 4
  %11 = bitcast float* %10 to <4 x float>*
  %wide.load169.prol = load <4 x float>, <4 x float>* %11, align 4, !alias.scope !6
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 0
  %13 = bitcast float* %12 to <4 x float>*
  %wide.load170.prol = load <4 x float>, <4 x float>* %13, align 4, !alias.scope !9
  %14 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 4
  %15 = bitcast float* %14 to <4 x float>*
  %wide.load171.prol = load <4 x float>, <4 x float>* %15, align 4, !alias.scope !9
  %16 = fadd <4 x float> %wide.load.prol, %wide.load170.prol
  %17 = fadd <4 x float> %wide.load169.prol, %wide.load171.prol
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 0
  %19 = bitcast float* %18 to <4 x float>*
  store <4 x float> %16, <4 x float>* %19, align 4, !alias.scope !11, !noalias !13
  %20 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 4
  %21 = bitcast float* %20 to <4 x float>*
  store <4 x float> %17, <4 x float>* %21, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit.unr-lcssa

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.preheader, %vector.body.prol
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader ]
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa
  br i1 false, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body ]
  %22 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %index
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !6
  %24 = getelementptr float, float* %22, i64 4
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load169 = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !6
  %26 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %index
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load170 = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !9
  %28 = getelementptr float, float* %26, i64 4
  %29 = bitcast float* %28 to <4 x float>*
  %wide.load171 = load <4 x float>, <4 x float>* %29, align 4, !alias.scope !9
  %30 = fadd <4 x float> %wide.load, %wide.load170
  %31 = fadd <4 x float> %wide.load169, %wide.load171
  %32 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %index
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %30, <4 x float>* %33, align 4, !alias.scope !11, !noalias !13
  %34 = getelementptr float, float* %32, i64 4
  %35 = bitcast float* %34 to <4 x float>*
  store <4 x float> %31, <4 x float>* %35, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %36 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %index.next
  %37 = bitcast float* %36 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %37, align 4, !alias.scope !6
  %38 = getelementptr float, float* %36, i64 4
  %39 = bitcast float* %38 to <4 x float>*
  %wide.load169.1 = load <4 x float>, <4 x float>* %39, align 4, !alias.scope !6
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %index.next
  %41 = bitcast float* %40 to <4 x float>*
  %wide.load170.1 = load <4 x float>, <4 x float>* %41, align 4, !alias.scope !9
  %42 = getelementptr float, float* %40, i64 4
  %43 = bitcast float* %42 to <4 x float>*
  %wide.load171.1 = load <4 x float>, <4 x float>* %43, align 4, !alias.scope !9
  %44 = fadd <4 x float> %wide.load.1, %wide.load170.1
  %45 = fadd <4 x float> %wide.load169.1, %wide.load171.1
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %index.next
  %47 = bitcast float* %46 to <4 x float>*
  store <4 x float> %44, <4 x float>* %47, align 4, !alias.scope !11, !noalias !13
  %48 = getelementptr float, float* %46, i64 4
  %49 = bitcast float* %48 to <4 x float>*
  store <4 x float> %45, <4 x float>* %49, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %50 = icmp eq i64 %index.next.1, 2160
  br i1 %50, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !14

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 true, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond92.preheader.us
  %indvars.iv62.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond92.preheader.us ], [ 2160, %middle.block ]
  br i1 true, label %for.body94.us.prol.loopexit.unr-lcssa, label %for.body94.us.prol.preheader

for.body94.us.prol.preheader:                     ; preds = %for.body94.us.preheader
  br label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.body94.us.prol.preheader
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %51 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62.ph
  %52 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %51, %52
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62.ph
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  %indvars.iv.next63.prol = or i64 %indvars.iv62.ph, 1
  br label %for.body94.us.prol.loopexit.unr-lcssa

for.body94.us.prol.loopexit.unr-lcssa:            ; preds = %for.body94.us.preheader, %for.body94.us.prol
  %indvars.iv62.unr.ph = phi i64 [ %indvars.iv.next63.prol, %for.body94.us.prol ], [ %indvars.iv62.ph, %for.body94.us.preheader ]
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol.loopexit.unr-lcssa
  br i1 false, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us.preheader.new

for.body94.us.preheader.new:                      ; preds = %for.body94.us.prol.loopexit
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us, %for.body94.us.preheader.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.body94.us.preheader.new ], [ %indvars.iv.next63.1, %for.body94.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62
  %53 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62
  %54 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %53, %54
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv.next63
  %55 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv.next63
  %56 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %55, %56
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv.next63
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63, 2159
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond65.1, label %for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us.loopexit

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us.prol.loopexit, %for.cond92.for.inc112_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next67, 4096
  br i1 %cmp90.us, label %for.cond92.preheader.us, label %for.cond115.preheader.loopexit

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry, %for.cond58.preheader, %for.cond89.preheader
  br i1 true, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 true, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %mul126.us114 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us116 = fmul float %exp2, 0.000000e+00
  %mul130.us118 = fmul float %call29, -0.000000e+00
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ]
  %arrayidx124.us112 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %57 = load float, float* %arrayidx124.us112, align 4
  %mul125.us113 = fmul float %div, %57
  %add127.us115 = fadd float %mul126.us114, %mul125.us113
  %add129.us117 = fadd float %mul128.us116, %add127.us115
  %add131.us119 = fadd float %mul130.us118, %add129.us117
  %arrayidx135.us120 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us119, float* %arrayidx135.us120, align 4
  br i1 false, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.preheader

for.body120.us.for.body120.us_crit_edge.preheader: ; preds = %for.cond118.preheader.us
  br i1 false, label %for.body120.us.for.body120.us_crit_edge.prol.loopexit.unr-lcssa, label %for.body120.us.for.body120.us_crit_edge.prol.preheader

for.body120.us.for.body120.us_crit_edge.prol.preheader: ; preds = %for.body120.us.for.body120.us_crit_edge.preheader
  br label %for.body120.us.for.body120.us_crit_edge.prol

for.body120.us.for.body120.us_crit_edge.prol:     ; preds = %for.body120.us.for.body120.us_crit_edge.prol.preheader
  %58 = load float, float* %arrayidx124.us112, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv59
  %59 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %59
  %mul126.us.prol = fmul float %mul16.v.r1, %58
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
  br i1 false, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge.preheader.new

for.body120.us.for.body120.us_crit_edge.preheader.new: ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.for.body120.us_crit_edge.preheader.new
  %add131.us125 = phi float [ %add131.us125.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %arrayidx124.us124 = phi float* [ %arrayidx124.us124.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge ]
  %ym1.115.us123 = phi float [ %ym1.115.us123.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv55122 = phi i64 [ %indvars.iv55122.unr.ph, %for.body120.us.for.body120.us_crit_edge.preheader.new ], [ %indvars.iv.next56.1, %for.body120.us.for.body120.us_crit_edge ]
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55122, 1
  %60 = load float, float* %arrayidx124.us124, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %61 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %61
  %mul126.us = fmul float %mul16.v.r1, %60
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us125
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us123, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55122, 2
  %62 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %63 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %63
  %mul126.us.1 = fmul float %mul16.v.r1, %62
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us125, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 4095
  br i1 %exitcond58.1, label %for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa, label %for.body120.us.for.body120.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body120.us.for.body120.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us.loopexit

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us.for.body120.us_crit_edge.prol.loopexit, %for.cond118.for.inc147_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.cond118.preheader.us
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next60, 2160
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond150.preheader

for.cond150.preheader:                            ; preds = %for.cond118.for.inc147_crit_edge.us
  br i1 true, label %for.cond154.preheader.lr.ph, label %for.cond182.preheader

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader
  br i1 true, label %for.cond154.preheader.us.preheader, label %for.end207

for.cond154.preheader.us.preheader:               ; preds = %for.cond154.preheader.lr.ph
  %mul157.us99 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us100 = fmul float %1, -0.000000e+00
  %add159.us101 = fadd float %mul157.us99, %mul158.us100
  %mul160.us102 = fmul float %exp2, 0.000000e+00
  %add161.us103 = fadd float %add159.us101, %mul160.us102
  %mul162.us104 = fmul float %call29, -0.000000e+00
  %add163.us105 = fadd float %add161.us103, %mul162.us104
  %mul158.us.prol = fmul float %1, -0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us105
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond154.for.inc179_crit_edge.us ]
  %arrayidx167.us106 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv52
  store float %add163.us105, float* %arrayidx167.us106, align 4
  br i1 true, label %for.body156.us.for.body156.us_crit_edge.preheader, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge.preheader: ; preds = %for.cond154.preheader.us
  br i1 true, label %for.body156.us.for.body156.us_crit_edge.prol.preheader, label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.preheader: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader
  br label %for.body156.us.for.body156.us_crit_edge.prol

for.body156.us.for.body156.us_crit_edge.prol:     ; preds = %for.body156.us.for.body156.us_crit_edge.prol.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 4095, i64 %indvars.iv52
  %64 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul16.v.r2, %64
  %add159.us.prol = fadd float %mul157.us.prol, %mul158.us.prol
  %add161.us.prol = fadd float %add159.us.prol, %mul160.us.prol
  %add163.us.prol = fadd float %add161.us.prol, %mul162.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4094, i64 %indvars.iv52
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa

for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa: ; preds = %for.body156.us.for.body156.us_crit_edge.preheader, %for.body156.us.for.body156.us_crit_edge.prol
  %add163.us111.unr.ph = phi float [ %add163.us.prol, %for.body156.us.for.body156.us_crit_edge.prol ], [ %add163.us105, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %indvars.iv.next51110.unr.ph = phi i64 [ 4094, %for.body156.us.for.body156.us_crit_edge.prol ], [ 4095, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %tp1.07.us109.unr.ph = phi float [ %64, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  %yp1.19.us108.unr.ph = phi float [ %add163.us105, %for.body156.us.for.body156.us_crit_edge.prol ], [ 0.000000e+00, %for.body156.us.for.body156.us_crit_edge.preheader ]
  br label %for.body156.us.for.body156.us_crit_edge.prol.loopexit

for.body156.us.for.body156.us_crit_edge.prol.loopexit: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit.unr-lcssa
  br i1 false, label %for.cond154.for.inc179_crit_edge.us.loopexit, label %for.body156.us.for.body156.us_crit_edge.preheader.new

for.body156.us.for.body156.us_crit_edge.preheader.new: ; preds = %for.body156.us.for.body156.us_crit_edge.prol.loopexit
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge, %for.body156.us.for.body156.us_crit_edge.preheader.new
  %add163.us111 = phi float [ %add163.us111.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next51110 = phi i64 [ %indvars.iv.next51110.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %indvars.iv.next51.1, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.07.us109 = phi float [ %tp1.07.us109.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %66, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.19.us108 = phi float [ %yp1.19.us108.unr.ph, %for.body156.us.for.body156.us_crit_edge.preheader.new ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51110, i64 %indvars.iv52
  %65 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next51 = add nsw i64 %indvars.iv.next51110, -1
  %mul157.us = fmul float %mul16.v.r2, %65
  %mul158.us = fmul float %tp1.07.us109, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us111
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us108, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51, i64 %indvars.iv52
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51, i64 %indvars.iv52
  %66 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv.next51110, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %66
  %mul158.us.1 = fmul float %65, %mul25
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
  %cmp151.us = icmp slt i64 %indvars.iv.next53, 2160
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond182.preheader.loopexit

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader, %for.cond150.preheader
  br i1 true, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next48, %for.cond185.for.inc205_crit_edge.us ]
  %scevgep181 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 2160
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %scevgep187 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 2160
  %scevgep189 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %scevgep191 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 2160
  br i1 false, label %for.body187.us.preheader, label %min.iters.checked176

min.iters.checked176:                             ; preds = %for.cond185.preheader.us
  br i1 false, label %for.body187.us.preheader, label %vector.memcheck201

vector.memcheck201:                               ; preds = %min.iters.checked176
  %bound0193 = icmp ult float* %scevgep181, %scevgep187
  %bound1194 = icmp ult float* %scevgep185, %scevgep183
  %found.conflict195 = and i1 %bound0193, %bound1194
  %bound0196 = icmp ult float* %scevgep181, %scevgep191
  %bound1197 = icmp ult float* %scevgep189, %scevgep183
  %found.conflict198 = and i1 %bound0196, %bound1197
  %conflict.rdx199 = or i1 %found.conflict195, %found.conflict198
  br i1 %conflict.rdx199, label %for.body187.us.preheader, label %vector.body172.preheader

vector.body172.preheader:                         ; preds = %vector.memcheck201
  br i1 false, label %vector.body172.prol.preheader, label %vector.body172.prol.loopexit.unr-lcssa

vector.body172.prol.preheader:                    ; preds = %vector.body172.preheader
  br label %vector.body172.prol

vector.body172.prol:                              ; preds = %vector.body172.prol.preheader
  %67 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %68 = bitcast float* %67 to <4 x float>*
  %wide.load211.prol = load <4 x float>, <4 x float>* %68, align 4, !alias.scope !16
  %69 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 4
  %70 = bitcast float* %69 to <4 x float>*
  %wide.load212.prol = load <4 x float>, <4 x float>* %70, align 4, !alias.scope !16
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %72 = bitcast float* %71 to <4 x float>*
  %wide.load213.prol = load <4 x float>, <4 x float>* %72, align 4, !alias.scope !19
  %73 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 4
  %74 = bitcast float* %73 to <4 x float>*
  %wide.load214.prol = load <4 x float>, <4 x float>* %74, align 4, !alias.scope !19
  %75 = fadd <4 x float> %wide.load211.prol, %wide.load213.prol
  %76 = fadd <4 x float> %wide.load212.prol, %wide.load214.prol
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  %78 = bitcast float* %77 to <4 x float>*
  store <4 x float> %75, <4 x float>* %78, align 4, !alias.scope !21, !noalias !23
  %79 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 4
  %80 = bitcast float* %79 to <4 x float>*
  store <4 x float> %76, <4 x float>* %80, align 4, !alias.scope !21, !noalias !23
  br label %vector.body172.prol.loopexit.unr-lcssa

vector.body172.prol.loopexit.unr-lcssa:           ; preds = %vector.body172.preheader, %vector.body172.prol
  %index203.unr.ph = phi i64 [ 8, %vector.body172.prol ], [ 0, %vector.body172.preheader ]
  br label %vector.body172.prol.loopexit

vector.body172.prol.loopexit:                     ; preds = %vector.body172.prol.loopexit.unr-lcssa
  br i1 false, label %middle.block173, label %vector.body172.preheader.new

vector.body172.preheader.new:                     ; preds = %vector.body172.prol.loopexit
  br label %vector.body172

vector.body172:                                   ; preds = %vector.body172, %vector.body172.preheader.new
  %index203 = phi i64 [ %index203.unr.ph, %vector.body172.preheader.new ], [ %index.next204.1, %vector.body172 ]
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %index203
  %82 = bitcast float* %81 to <4 x float>*
  %wide.load211 = load <4 x float>, <4 x float>* %82, align 4, !alias.scope !16
  %83 = getelementptr float, float* %81, i64 4
  %84 = bitcast float* %83 to <4 x float>*
  %wide.load212 = load <4 x float>, <4 x float>* %84, align 4, !alias.scope !16
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %index203
  %86 = bitcast float* %85 to <4 x float>*
  %wide.load213 = load <4 x float>, <4 x float>* %86, align 4, !alias.scope !19
  %87 = getelementptr float, float* %85, i64 4
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load214 = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !19
  %89 = fadd <4 x float> %wide.load211, %wide.load213
  %90 = fadd <4 x float> %wide.load212, %wide.load214
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %index203
  %92 = bitcast float* %91 to <4 x float>*
  store <4 x float> %89, <4 x float>* %92, align 4, !alias.scope !21, !noalias !23
  %93 = getelementptr float, float* %91, i64 4
  %94 = bitcast float* %93 to <4 x float>*
  store <4 x float> %90, <4 x float>* %94, align 4, !alias.scope !21, !noalias !23
  %index.next204 = add i64 %index203, 8
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %index.next204
  %96 = bitcast float* %95 to <4 x float>*
  %wide.load211.1 = load <4 x float>, <4 x float>* %96, align 4, !alias.scope !16
  %97 = getelementptr float, float* %95, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  %wide.load212.1 = load <4 x float>, <4 x float>* %98, align 4, !alias.scope !16
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %index.next204
  %100 = bitcast float* %99 to <4 x float>*
  %wide.load213.1 = load <4 x float>, <4 x float>* %100, align 4, !alias.scope !19
  %101 = getelementptr float, float* %99, i64 4
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load214.1 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !19
  %103 = fadd <4 x float> %wide.load211.1, %wide.load213.1
  %104 = fadd <4 x float> %wide.load212.1, %wide.load214.1
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %index.next204
  %106 = bitcast float* %105 to <4 x float>*
  store <4 x float> %103, <4 x float>* %106, align 4, !alias.scope !21, !noalias !23
  %107 = getelementptr float, float* %105, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  store <4 x float> %104, <4 x float>* %108, align 4, !alias.scope !21, !noalias !23
  %index.next204.1 = add i64 %index203, 16
  %109 = icmp eq i64 %index.next204.1, 2160
  br i1 %109, label %middle.block173.unr-lcssa, label %vector.body172, !llvm.loop !24

middle.block173.unr-lcssa:                        ; preds = %vector.body172
  br label %middle.block173

middle.block173:                                  ; preds = %vector.body172.prol.loopexit, %middle.block173.unr-lcssa
  br i1 true, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %middle.block173, %vector.memcheck201, %min.iters.checked176, %for.cond185.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck201 ], [ 0, %min.iters.checked176 ], [ 0, %for.cond185.preheader.us ], [ 2160, %middle.block173 ]
  br i1 true, label %for.body187.us.prol.loopexit.unr-lcssa, label %for.body187.us.prol.preheader

for.body187.us.prol.preheader:                    ; preds = %for.body187.us.preheader
  br label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.body187.us.prol.preheader
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.ph
  %110 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.ph
  %111 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %110, %111
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.ph
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  %indvars.iv.next.prol = or i64 %indvars.iv.ph, 1
  br label %for.body187.us.prol.loopexit.unr-lcssa

for.body187.us.prol.loopexit.unr-lcssa:           ; preds = %for.body187.us.preheader, %for.body187.us.prol
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body187.us.prol ], [ %indvars.iv.ph, %for.body187.us.preheader ]
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol.loopexit.unr-lcssa
  br i1 false, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us.preheader.new

for.body187.us.preheader.new:                     ; preds = %for.body187.us.prol.loopexit
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us, %for.body187.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body187.us.preheader.new ], [ %indvars.iv.next.1, %for.body187.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %112 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %113 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %112, %113
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.next
  %114 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.next
  %115 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %114, %115
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2159
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa: ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us.loopexit

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us.prol.loopexit, %for.cond185.for.inc205_crit_edge.us.loopexit.unr-lcssa
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %middle.block173
  %indvars.iv.next48 = add nuw i64 %indvars.iv47, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next48, 4096
  br i1 %cmp183.us, label %for.cond185.preheader.us, label %for.end207.loopexit

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond62.preheader.lr.ph, %for.cond31.preheader.lr.ph, %for.cond92.preheader.lr.ph, %for.cond118.preheader.lr.ph, %for.cond154.preheader.lr.ph, %for.cond182.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %w, i32 %h, [2160 x float]* %imgOut) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv8, 2160
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, 4096
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind readnone }
attributes #4 = { nounwind }
attributes #5 = { cold }

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

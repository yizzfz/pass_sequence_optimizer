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
  call fastcc void @init_array(float* nonnull %alpha, [2160 x float]* %arraydecay)
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  call fastcc void @print_array([2160 x float]* %2)
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
define internal fastcc void @init_array(float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ]
  %0 = mul nsw i64 %indvars.iv8, 313
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ], [ 0, %for.cond1.preheader.us ]
  %1 = mul nuw nsw i64 %indvars.iv, 991
  %2 = add nsw i64 %1, %0
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2159
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, 4096
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(float %alpha, [2160 x float]* nocapture readonly %imgIn, [2160 x float]* nocapture %imgOut, [2160 x float]* nocapture %y1, [2160 x float]* nocapture %y2) unnamed_addr #0 {
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
  %mul37.us137 = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us139 = fmul float %exp2, 0.000000e+00
  %mul41.us141 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %entry
  %indvars.iv78 = phi i64 [ 0, %entry ], [ %indvars.iv.next79, %for.cond31.for.inc55_crit_edge.us ]
  %arrayidx35.us135 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 0
  %2 = load float, float* %arrayidx35.us135, align 4
  %mul36.us136 = fmul float %div, %2
  %add38.us138 = fadd float %mul37.us137, %mul36.us136
  %add40.us140 = fadd float %mul39.us139, %add38.us138
  %add42.us142 = fadd float %mul41.us141, %add40.us140
  %arrayidx46.us143 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 0
  store float %add42.us142, float* %arrayidx46.us143, align 4
  br label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us.for.body33.us_crit_edge.1, %for.cond31.preheader.us
  %add42.us147 = phi float [ %add42.us142, %for.cond31.preheader.us ], [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %arrayidx35.us146 = phi float* [ %arrayidx35.us135, %for.cond31.preheader.us ], [ %arrayidx35.us.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %ym1.035.us145 = phi float [ 0.000000e+00, %for.cond31.preheader.us ], [ %add42.us, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv74144 = phi i64 [ 0, %for.cond31.preheader.us ], [ %indvars.iv.next75.1, %for.body33.us.for.body33.us_crit_edge.1 ]
  %indvars.iv.next75 = or i64 %indvars.iv74144, 1
  %3 = load float, float* %arrayidx35.us146, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75
  %4 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %4
  %mul37.us = fmul float %mul16.v.r1, %3
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us147
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.035.us145, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75
  store float %add42.us, float* %arrayidx46.us, align 4
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 2159
  br i1 %exitcond77, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.for.body33.us_crit_edge.1

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next79 = add nuw i64 %indvars.iv78, 1
  %cmp.us = icmp slt i64 %indvars.iv.next79, 4096
  br i1 %cmp.us, label %for.cond31.preheader.us, label %for.cond62.preheader.us.preheader

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul65.us123 = fmul float %mul16.v.r2, 0.000000e+00
  %mul66.us124 = fmul float %1, -0.000000e+00
  %add67.us125 = fadd float %mul65.us123, %mul66.us124
  %mul68.us126 = fmul float %exp2, 0.000000e+00
  %add69.us127 = fadd float %add67.us125, %mul68.us126
  %mul70.us128 = fmul float %call29, -0.000000e+00
  %add71.us129 = fadd float %add69.us127, %mul70.us128
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.preheader.us.preheader, %for.cond62.for.inc86_crit_edge.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.cond62.for.inc86_crit_edge.us ], [ 0, %for.cond62.preheader.us.preheader ]
  %arrayidx75.us130 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 2159
  store float %add71.us129, float* %arrayidx75.us130, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us.for.body64.us_crit_edge.1, %for.cond62.preheader.us
  %add71.us134 = phi float [ %add71.us129, %for.cond62.preheader.us ], [ %add71.us.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %indvars.iv.next70133 = phi i64 [ 2159, %for.cond62.preheader.us ], [ %indvars.iv.next70.1, %for.body64.us.for.body64.us_crit_edge.1 ]
  %xp1.027.us132 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %21, %for.body64.us.for.body64.us_crit_edge.1 ]
  %yp1.029.us131 = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge.1 ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70133
  %5 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next70 = add nsw i64 %indvars.iv.next70133, -1
  %mul65.us = fmul float %mul16.v.r2, %5
  %mul66.us = fmul float %xp1.027.us132, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %add71.us134
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp1.029.us131, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70
  store float %add71.us, float* %arrayidx75.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv.next70133, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge.1, label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us.for.body64.us_crit_edge
  %indvars.iv.next72 = add nuw i64 %indvars.iv71, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next72, 4096
  br i1 %cmp59.us, label %for.cond62.preheader.us, label %for.cond92.preheader.us.preheader

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us.1, %for.cond92.preheader.us.preheader
  %indvars.iv66 = phi i64 [ 0, %for.cond92.preheader.us.preheader ], [ %indvars.iv.next67.1, %for.cond92.for.inc112_crit_edge.us.1 ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.for.body94.us_crit_edge, %for.cond92.preheader.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.body94.us.for.body94.us_crit_edge ], [ 0, %for.cond92.preheader.us ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv66, i64 %indvars.iv62
  %6 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv66, i64 %indvars.iv62
  %7 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %6, %7
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv66, i64 %indvars.iv62
  store float %add103.us, float* %arrayidx108.us, align 4
  %exitcond65 = icmp eq i64 %indvars.iv62, %indvars.iv.next75
  br i1 %exitcond65, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.for.body94.us_crit_edge

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br label %for.body94.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.body94.us
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  br label %for.body94.us.1

for.cond118.preheader.us.preheader:               ; preds = %for.cond92.for.inc112_crit_edge.us.1
  %mul126.us112 = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us114 = fmul float %exp2, 0.000000e+00
  %mul130.us116 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.cond118.for.inc147_crit_edge.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  %arrayidx124.us110 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv59
  %8 = load float, float* %arrayidx124.us110, align 4
  %mul125.us111 = fmul float %div, %8
  %add127.us113 = fadd float %mul126.us112, %mul125.us111
  %add129.us115 = fadd float %mul128.us114, %add127.us113
  %add131.us117 = fadd float %mul130.us116, %add129.us115
  %arrayidx135.us118 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv59
  store float %add131.us117, float* %arrayidx135.us118, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us.for.body120.us_crit_edge.1, %for.cond118.preheader.us
  %add131.us122 = phi float [ %add131.us117, %for.cond118.preheader.us ], [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %arrayidx124.us121 = phi float* [ %arrayidx124.us110, %for.cond118.preheader.us ], [ %arrayidx124.us.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %ym1.115.us120 = phi float [ 0.000000e+00, %for.cond118.preheader.us ], [ %add131.us, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv55119 = phi i64 [ 0, %for.cond118.preheader.us ], [ %indvars.iv.next56.1, %for.body120.us.for.body120.us_crit_edge.1 ]
  %indvars.iv.next56 = or i64 %indvars.iv55119, 1
  %9 = load float, float* %arrayidx124.us121, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56, i64 %indvars.iv59
  %10 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %10
  %mul126.us = fmul float %mul16.v.r1, %9
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us122
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.115.us120, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56, i64 %indvars.iv59
  store float %add131.us, float* %arrayidx135.us, align 4
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 4095
  br i1 %exitcond58, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.for.body120.us_crit_edge.1

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next60, 2160
  br i1 %cmp116.us, label %for.cond118.preheader.us, label %for.cond154.preheader.us.preheader

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %mul157.us98 = fmul float %mul16.v.r2, 0.000000e+00
  %mul158.us99 = fmul float %1, -0.000000e+00
  %add159.us100 = fadd float %mul157.us98, %mul158.us99
  %mul160.us101 = fmul float %exp2, 0.000000e+00
  %add161.us102 = fadd float %add159.us100, %mul160.us101
  %mul162.us103 = fmul float %call29, -0.000000e+00
  %add163.us104 = fadd float %add161.us102, %mul162.us103
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.preheader.us.preheader, %for.cond154.for.inc179_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond154.for.inc179_crit_edge.us ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us105 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv52
  store float %add163.us104, float* %arrayidx167.us105, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us.for.body156.us_crit_edge.1, %for.cond154.preheader.us
  %add163.us109 = phi float [ %add163.us104, %for.cond154.preheader.us ], [ %add163.us.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %indvars.iv.next51108 = phi i64 [ 4095, %for.cond154.preheader.us ], [ %indvars.iv.next51.1, %for.body156.us.for.body156.us_crit_edge.1 ]
  %tp1.07.us107 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %16, %for.body156.us.for.body156.us_crit_edge.1 ]
  %yp1.19.us106 = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge.1 ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51108, i64 %indvars.iv52
  %11 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next51 = add nsw i64 %indvars.iv.next51108, -1
  %mul157.us = fmul float %mul16.v.r2, %11
  %mul158.us = fmul float %tp1.07.us107, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %add163.us109
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp1.19.us106, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51, i64 %indvars.iv52
  store float %add163.us, float* %arrayidx167.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv.next51108, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge.1, label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us.for.body156.us_crit_edge
  %indvars.iv.next53 = add nuw i64 %indvars.iv52, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next53, 2160
  br i1 %cmp151.us, label %for.cond154.preheader.us, label %for.cond185.preheader.us.preheader

for.cond185.preheader.us.preheader:               ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us.1, %for.cond185.preheader.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next48.1, %for.cond185.for.inc205_crit_edge.us.1 ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.for.body187.us_crit_edge, %for.cond185.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body187.us.for.body187.us_crit_edge ], [ 0, %for.cond185.preheader.us ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %12 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %13 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %12, %13
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2159
  br i1 %exitcond, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.for.body187.us_crit_edge

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body187.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.body187.us
  %indvars.iv.next48 = or i64 %indvars.iv47, 1
  br label %for.body187.us.1

for.end207:                                       ; preds = %for.cond185.for.inc205_crit_edge.us.1
  ret void

for.body187.us.1:                                 ; preds = %for.body187.us.for.body187.us_crit_edge.1, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body187.us.for.body187.us_crit_edge.1 ], [ 0, %for.cond185.for.inc205_crit_edge.us ]
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %14 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next48, i64 %indvars.iv.1
  %15 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %14, %15
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next48, i64 %indvars.iv.1
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.1, 2159
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.1, label %for.body187.us.for.body187.us_crit_edge.1

for.body187.us.for.body187.us_crit_edge.1:        ; preds = %for.body187.us.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body187.us.1

for.cond185.for.inc205_crit_edge.us.1:            ; preds = %for.body187.us.1
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %cmp183.us.1 = icmp slt i64 %indvars.iv.next48.1, 4096
  br i1 %cmp183.us.1, label %for.cond185.preheader.us, label %for.end207

for.body156.us.for.body156.us_crit_edge.1:        ; preds = %for.body156.us.for.body156.us_crit_edge
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next51, i64 %indvars.iv52
  %16 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv.next51108, -2
  %mul157.us.1 = fmul float %mul16.v.r2, %16
  %mul158.us.1 = fmul float %11, %mul25
  %add159.us.1 = fadd float %mul157.us.1, %mul158.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %add159.us.1, %mul160.us.1
  %mul162.us.1 = fmul float %add163.us109, %sub30
  %add163.us.1 = fadd float %add161.us.1, %mul162.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next51.1, i64 %indvars.iv52
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  br label %for.body156.us.for.body156.us_crit_edge

for.body120.us.for.body120.us_crit_edge.1:        ; preds = %for.body120.us.for.body120.us_crit_edge
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55119, 2
  %17 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  %18 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %18
  %mul126.us.1 = fmul float %mul16.v.r1, %17
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us122, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next56.1, i64 %indvars.iv59
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  br label %for.body120.us.for.body120.us_crit_edge

for.body94.us.1:                                  ; preds = %for.body94.us.for.body94.us_crit_edge.1, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv62.1 = phi i64 [ %indvars.iv.next63.1, %for.body94.us.for.body94.us_crit_edge.1 ], [ 0, %for.cond92.for.inc112_crit_edge.us ]
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  %19 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  %20 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %19, %20
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next67, i64 %indvars.iv62.1
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %exitcond65.1 = icmp eq i64 %indvars.iv62.1, %indvars.iv.next75
  br i1 %exitcond65.1, label %for.cond92.for.inc112_crit_edge.us.1, label %for.body94.us.for.body94.us_crit_edge.1

for.body94.us.for.body94.us_crit_edge.1:          ; preds = %for.body94.us.1
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62.1, 1
  br label %for.body94.us.1

for.cond92.for.inc112_crit_edge.us.1:             ; preds = %for.body94.us.1
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %cmp90.us.1 = icmp slt i64 %indvars.iv.next67.1, 4096
  br i1 %cmp90.us.1, label %for.cond92.preheader.us, label %for.cond118.preheader.us.preheader

for.body64.us.for.body64.us_crit_edge.1:          ; preds = %for.body64.us.for.body64.us_crit_edge
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv71, i64 %indvars.iv.next70
  %21 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv.next70133, -2
  %mul65.us.1 = fmul float %mul16.v.r2, %21
  %mul66.us.1 = fmul float %5, %mul25
  %add67.us.1 = fadd float %mul65.us.1, %mul66.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %add67.us.1, %mul68.us.1
  %mul70.us.1 = fmul float %add71.us134, %sub30
  %add71.us.1 = fadd float %add69.us.1, %mul70.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv71, i64 %indvars.iv.next70.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  br label %for.body64.us.for.body64.us_crit_edge

for.body33.us.for.body33.us_crit_edge.1:          ; preds = %for.body33.us.for.body33.us_crit_edge
  %indvars.iv.next75.1 = add nsw i64 %indvars.iv74144, 2
  %22 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  %23 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %23
  %mul37.us.1 = fmul float %mul16.v.r1, %22
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us147, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv78, i64 %indvars.iv.next75.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  br label %for.body33.us.for.body33.us_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly %imgOut) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %8 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, 4096
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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

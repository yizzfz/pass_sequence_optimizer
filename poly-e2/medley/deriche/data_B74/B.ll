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
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  tail call fastcc void @print_array([2160 x float]* %2)
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
define internal fastcc void @init_array(float* nocapture %alpha, [2160 x float]* nocapture %imgIn) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc7 ]
  %0 = mul nsw i64 %indvars.iv5, 313
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.for.body3_crit_edge ], [ 0, %for.cond1.preheader ]
  %1 = mul nuw nsw i64 %indvars.iv, 991
  %2 = add nsw i64 %1, %0
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 65536
  %conv = sitofp i32 %rem to float
  %div = fdiv float %conv, 6.553500e+04
  %arrayidx6 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv5, i64 %indvars.iv
  store float %div, float* %arrayidx6, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2159
  br i1 %exitcond, label %for.inc7, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next6 = add nuw i64 %indvars.iv5, 1
  %cmp = icmp slt i64 %indvars.iv.next6, 4096
  br i1 %cmp, label %for.cond1.preheader, label %for.end9

for.end9:                                         ; preds = %for.inc7
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
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %1 = fmul float %div, %call24
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %mul3740 = fmul float %mul16.v.r1, 0.000000e+00
  %mul3942 = fmul float %exp2, 0.000000e+00
  %mul4144 = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.inc55, %entry
  %indvars.iv50 = phi i64 [ 0, %entry ], [ %indvars.iv.next51, %for.inc55 ]
  %arrayidx3538 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv50, i64 0
  %2 = load float, float* %arrayidx3538, align 4
  %mul3639 = fmul float %div, %2
  %add3841 = fadd float %mul3740, %mul3639
  %add4043 = fadd float %mul3942, %add3841
  %add4245 = fadd float %mul4144, %add4043
  %arrayidx4646 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv50, i64 0
  store float %add4245, float* %arrayidx4646, align 4
  br label %for.body33.for.body33_crit_edge

for.body33.for.body33_crit_edge:                  ; preds = %for.body33.for.body33_crit_edge.1, %for.cond31.preheader
  %add4250 = phi float [ %add4245, %for.cond31.preheader ], [ %add42.1, %for.body33.for.body33_crit_edge.1 ]
  %arrayidx3549 = phi float* [ %arrayidx3538, %for.cond31.preheader ], [ %arrayidx35.1, %for.body33.for.body33_crit_edge.1 ]
  %ym1.02248 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add42, %for.body33.for.body33_crit_edge.1 ]
  %indvars.iv4747 = phi i64 [ 0, %for.cond31.preheader ], [ %indvars.iv.next48.1, %for.body33.for.body33_crit_edge.1 ]
  %indvars.iv.next48 = or i64 %indvars.iv4747, 1
  %3 = bitcast float* %arrayidx3549 to <2 x float>*
  %arrayidx35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv50, i64 %indvars.iv.next48
  %4 = load <2 x float>, <2 x float>* %3, align 4
  %mul36.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.v.i0.2 = insertelement <2 x float> %mul36.v.i0.1, float %div, i32 1
  %mul37 = fmul <2 x float> %mul36.v.i0.2, %4
  %mul37.v.r1 = extractelement <2 x float> %mul37, i32 0
  %mul37.v.r2 = extractelement <2 x float> %mul37, i32 1
  %add38 = fadd float %mul37.v.r1, %mul37.v.r2
  %mul39 = fmul float %exp2, %add4250
  %add40 = fadd float %mul39, %add38
  %mul41 = fmul float %ym1.02248, %sub30
  %add42 = fadd float %mul41, %add40
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv50, i64 %indvars.iv.next48
  store float %add42, float* %arrayidx46, align 4
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 2159
  br i1 %exitcond49, label %for.inc55, label %for.body33.for.body33_crit_edge.1

for.inc55:                                        ; preds = %for.body33.for.body33_crit_edge
  %indvars.iv.next51 = add nuw i64 %indvars.iv50, 1
  %cmp = icmp slt i64 %indvars.iv.next51, 4096
  br i1 %cmp, label %for.cond31.preheader, label %for.cond62.preheader.preheader

for.cond62.preheader.preheader:                   ; preds = %for.inc55
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul25 = fsub float -0.000000e+00, %1
  %mul6526 = fmul float %mul16.v.r2, 0.000000e+00
  %mul6627 = fmul float %1, -0.000000e+00
  %add6728 = fadd float %mul6526, %mul6627
  %mul6829 = fmul float %exp2, 0.000000e+00
  %add6930 = fadd float %add6728, %mul6829
  %mul7031 = fmul float %call29, -0.000000e+00
  %add7132 = fadd float %add6930, %mul7031
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.inc86, %for.cond62.preheader.preheader
  %indvars.iv45 = phi i64 [ 0, %for.cond62.preheader.preheader ], [ %indvars.iv.next46, %for.inc86 ]
  %arrayidx7533 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv45, i64 2159
  store float %add7132, float* %arrayidx7533, align 4
  br label %for.body64.for.body64_crit_edge

for.body64.for.body64_crit_edge:                  ; preds = %for.body64.for.body64_crit_edge.1, %for.cond62.preheader
  %add7137 = phi float [ %add7132, %for.cond62.preheader ], [ %add71.1, %for.body64.for.body64_crit_edge.1 ]
  %xp1.01636 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %21, %for.body64.for.body64_crit_edge.1 ]
  %yp1.01835 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %add71, %for.body64.for.body64_crit_edge.1 ]
  %indvars.iv4334 = phi i64 [ 2159, %for.cond62.preheader ], [ %indvars.iv.next44.1, %for.body64.for.body64_crit_edge.1 ]
  %indvars.iv.next44 = add nsw i64 %indvars.iv4334, -1
  %arrayidx79 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv45, i64 %indvars.iv4334
  %5 = load float, float* %arrayidx79, align 4
  %mul65 = fmul float %mul16.v.r2, %5
  %mul66 = fmul float %xp1.01636, %mul25
  %add67 = fadd float %mul65, %mul66
  %mul68 = fmul float %exp2, %add7137
  %add69 = fadd float %add67, %mul68
  %mul70 = fmul float %yp1.01835, %sub30
  %add71 = fadd float %add69, %mul70
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv45, i64 %indvars.iv.next44
  store float %add71, float* %arrayidx75, align 4
  %cmp63 = icmp sgt i64 %indvars.iv4334, 1
  br i1 %cmp63, label %for.body64.for.body64_crit_edge.1, label %for.inc86

for.inc86:                                        ; preds = %for.body64.for.body64_crit_edge
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %cmp59 = icmp slt i64 %indvars.iv.next46, 4096
  br i1 %cmp59, label %for.cond62.preheader, label %for.cond92.preheader.preheader

for.cond92.preheader.preheader:                   ; preds = %for.inc86
  br label %for.cond92.preheader

for.cond92.preheader:                             ; preds = %for.inc112.1, %for.cond92.preheader.preheader
  %indvars.iv41 = phi i64 [ 0, %for.cond92.preheader.preheader ], [ %indvars.iv.next42.1, %for.inc112.1 ]
  br label %for.body94

for.body94:                                       ; preds = %for.body94.for.body94_crit_edge, %for.cond92.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.body94.for.body94_crit_edge ], [ 0, %for.cond92.preheader ]
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv41, i64 %indvars.iv38
  %6 = load float, float* %arrayidx98, align 4
  %arrayidx102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv41, i64 %indvars.iv38
  %7 = load float, float* %arrayidx102, align 4
  %add103 = fadd float %6, %7
  %arrayidx108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv41, i64 %indvars.iv38
  store float %add103, float* %arrayidx108, align 4
  %exitcond40 = icmp eq i64 %indvars.iv38, 2159
  br i1 %exitcond40, label %for.inc112, label %for.body94.for.body94_crit_edge

for.body94.for.body94_crit_edge:                  ; preds = %for.body94
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br label %for.body94

for.inc112:                                       ; preds = %for.body94
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  br label %for.body94.1

for.cond118.preheader.preheader:                  ; preds = %for.inc112.1
  %mul12615 = fmul float %mul16.v.r1, 0.000000e+00
  %mul12817 = fmul float %exp2, 0.000000e+00
  %mul13019 = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader

for.cond118.preheader:                            ; preds = %for.cond118.preheader.preheader, %for.inc147
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc147 ], [ 0, %for.cond118.preheader.preheader ]
  %arrayidx12413 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv36
  %8 = load float, float* %arrayidx12413, align 4
  %mul12514 = fmul float %div, %8
  %add12716 = fadd float %mul12615, %mul12514
  %add12918 = fadd float %mul12817, %add12716
  %add13120 = fadd float %mul13019, %add12918
  %arrayidx13521 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv36
  store float %add13120, float* %arrayidx13521, align 4
  br label %for.body120.for.body120_crit_edge

for.body120.for.body120_crit_edge:                ; preds = %for.body120.for.body120_crit_edge.1, %for.cond118.preheader
  %add13125 = phi float [ %add13120, %for.cond118.preheader ], [ %add131.1, %for.body120.for.body120_crit_edge.1 ]
  %arrayidx12424 = phi float* [ %arrayidx12413, %for.cond118.preheader ], [ %arrayidx124.1, %for.body120.for.body120_crit_edge.1 ]
  %ym1.1923 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131, %for.body120.for.body120_crit_edge.1 ]
  %indvars.iv3322 = phi i64 [ 0, %for.cond118.preheader ], [ %indvars.iv.next34.1, %for.body120.for.body120_crit_edge.1 ]
  %indvars.iv.next34 = or i64 %indvars.iv3322, 1
  %9 = load float, float* %arrayidx12424, align 4
  %arrayidx124 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next34, i64 %indvars.iv36
  %10 = load float, float* %arrayidx124, align 4
  %mul125 = fmul float %div, %10
  %mul126 = fmul float %mul16.v.r1, %9
  %add127 = fadd float %mul126, %mul125
  %mul128 = fmul float %exp2, %add13125
  %add129 = fadd float %mul128, %add127
  %mul130 = fmul float %ym1.1923, %sub30
  %add131 = fadd float %mul130, %add129
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next34, i64 %indvars.iv36
  store float %add131, float* %arrayidx135, align 4
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 4095
  br i1 %exitcond35, label %for.inc147, label %for.body120.for.body120_crit_edge.1

for.inc147:                                       ; preds = %for.body120.for.body120_crit_edge
  %indvars.iv.next37 = add nuw i64 %indvars.iv36, 1
  %cmp116 = icmp slt i64 %indvars.iv.next37, 2160
  br i1 %cmp116, label %for.cond118.preheader, label %for.cond154.preheader.preheader

for.cond154.preheader.preheader:                  ; preds = %for.inc147
  %mul1571 = fmul float %mul16.v.r2, 0.000000e+00
  %mul1582 = fmul float %1, -0.000000e+00
  %add1593 = fadd float %mul1571, %mul1582
  %mul1604 = fmul float %exp2, 0.000000e+00
  %add1615 = fadd float %add1593, %mul1604
  %mul1626 = fmul float %call29, -0.000000e+00
  %add1637 = fadd float %add1615, %mul1626
  br label %for.cond154.preheader

for.cond154.preheader:                            ; preds = %for.cond154.preheader.preheader, %for.inc179
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.inc179 ], [ 0, %for.cond154.preheader.preheader ]
  %arrayidx1678 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 4095, i64 %indvars.iv31
  store float %add1637, float* %arrayidx1678, align 4
  br label %for.body156.for.body156_crit_edge

for.body156.for.body156_crit_edge:                ; preds = %for.body156.for.body156_crit_edge.1, %for.cond154.preheader
  %add16312 = phi float [ %add1637, %for.cond154.preheader ], [ %add163.1, %for.body156.for.body156_crit_edge.1 ]
  %tp1.0311 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %16, %for.body156.for.body156_crit_edge.1 ]
  %yp1.1510 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %add163, %for.body156.for.body156_crit_edge.1 ]
  %indvars.iv299 = phi i64 [ 4095, %for.cond154.preheader ], [ %indvars.iv.next30.1, %for.body156.for.body156_crit_edge.1 ]
  %indvars.iv.next30 = add nsw i64 %indvars.iv299, -1
  %arrayidx171 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv299, i64 %indvars.iv31
  %11 = load float, float* %arrayidx171, align 4
  %mul157 = fmul float %mul16.v.r2, %11
  %mul158 = fmul float %tp1.0311, %mul25
  %add159 = fadd float %mul157, %mul158
  %mul160 = fmul float %exp2, %add16312
  %add161 = fadd float %add159, %mul160
  %mul162 = fmul float %yp1.1510, %sub30
  %add163 = fadd float %add161, %mul162
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next30, i64 %indvars.iv31
  store float %add163, float* %arrayidx167, align 4
  %cmp155 = icmp sgt i64 %indvars.iv299, 1
  br i1 %cmp155, label %for.body156.for.body156_crit_edge.1, label %for.inc179

for.inc179:                                       ; preds = %for.body156.for.body156_crit_edge
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %cmp151 = icmp slt i64 %indvars.iv.next32, 2160
  br i1 %cmp151, label %for.cond154.preheader, label %for.cond185.preheader.preheader

for.cond185.preheader.preheader:                  ; preds = %for.inc179
  br label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.inc205.1, %for.cond185.preheader.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond185.preheader.preheader ], [ %indvars.iv.next28.1, %for.inc205.1 ]
  br label %for.body187

for.body187:                                      ; preds = %for.body187.for.body187_crit_edge, %for.cond185.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body187.for.body187_crit_edge ], [ 0, %for.cond185.preheader ]
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv27, i64 %indvars.iv
  %12 = load float, float* %arrayidx191, align 4
  %arrayidx195 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv27, i64 %indvars.iv
  %13 = load float, float* %arrayidx195, align 4
  %add196 = fadd float %12, %13
  %arrayidx201 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv27, i64 %indvars.iv
  store float %add196, float* %arrayidx201, align 4
  %exitcond = icmp eq i64 %indvars.iv, 2159
  br i1 %exitcond, label %for.inc205, label %for.body187.for.body187_crit_edge

for.body187.for.body187_crit_edge:                ; preds = %for.body187
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body187

for.inc205:                                       ; preds = %for.body187
  %indvars.iv.next28 = or i64 %indvars.iv27, 1
  br label %for.body187.1

for.end207:                                       ; preds = %for.inc205.1
  ret void

for.body187.1:                                    ; preds = %for.body187.for.body187_crit_edge.1, %for.inc205
  %indvars.iv.1 = phi i64 [ %indvars.iv.next.1, %for.body187.for.body187_crit_edge.1 ], [ 0, %for.inc205 ]
  %arrayidx191.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next28, i64 %indvars.iv.1
  %14 = load float, float* %arrayidx191.1, align 4
  %arrayidx195.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next28, i64 %indvars.iv.1
  %15 = load float, float* %arrayidx195.1, align 4
  %add196.1 = fadd float %14, %15
  %arrayidx201.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next28, i64 %indvars.iv.1
  store float %add196.1, float* %arrayidx201.1, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.1, 2159
  br i1 %exitcond.1, label %for.inc205.1, label %for.body187.for.body187_crit_edge.1

for.body187.for.body187_crit_edge.1:              ; preds = %for.body187.1
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv.1, 1
  br label %for.body187.1

for.inc205.1:                                     ; preds = %for.body187.1
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %cmp183.1 = icmp slt i64 %indvars.iv.next28.1, 4096
  br i1 %cmp183.1, label %for.cond185.preheader, label %for.end207

for.body156.for.body156_crit_edge.1:              ; preds = %for.body156.for.body156_crit_edge
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv299, -2
  %arrayidx171.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next30, i64 %indvars.iv31
  %16 = load float, float* %arrayidx171.1, align 4
  %mul157.1 = fmul float %mul16.v.r2, %16
  %mul158.1 = fmul float %11, %mul25
  %add159.1 = fadd float %mul157.1, %mul158.1
  %mul160.1 = fmul float %exp2, %add163
  %add161.1 = fadd float %add159.1, %mul160.1
  %mul162.1 = fmul float %add16312, %sub30
  %add163.1 = fadd float %add161.1, %mul162.1
  %arrayidx167.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next30.1, i64 %indvars.iv31
  store float %add163.1, float* %arrayidx167.1, align 4
  br label %for.body156.for.body156_crit_edge

for.body120.for.body120_crit_edge.1:              ; preds = %for.body120.for.body120_crit_edge
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv3322, 2
  %17 = load float, float* %arrayidx124, align 4
  %arrayidx124.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next34.1, i64 %indvars.iv36
  %18 = load float, float* %arrayidx124.1, align 4
  %mul125.1 = fmul float %div, %18
  %mul126.1 = fmul float %mul16.v.r1, %17
  %add127.1 = fadd float %mul126.1, %mul125.1
  %mul128.1 = fmul float %exp2, %add131
  %add129.1 = fadd float %mul128.1, %add127.1
  %mul130.1 = fmul float %add13125, %sub30
  %add131.1 = fadd float %mul130.1, %add129.1
  %arrayidx135.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next34.1, i64 %indvars.iv36
  store float %add131.1, float* %arrayidx135.1, align 4
  br label %for.body120.for.body120_crit_edge

for.body94.1:                                     ; preds = %for.body94.for.body94_crit_edge.1, %for.inc112
  %indvars.iv38.1 = phi i64 [ %indvars.iv.next39.1, %for.body94.for.body94_crit_edge.1 ], [ 0, %for.inc112 ]
  %arrayidx98.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next42, i64 %indvars.iv38.1
  %19 = load float, float* %arrayidx98.1, align 4
  %arrayidx102.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next42, i64 %indvars.iv38.1
  %20 = load float, float* %arrayidx102.1, align 4
  %add103.1 = fadd float %19, %20
  %arrayidx108.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next42, i64 %indvars.iv38.1
  store float %add103.1, float* %arrayidx108.1, align 4
  %exitcond40.1 = icmp eq i64 %indvars.iv38.1, 2159
  br i1 %exitcond40.1, label %for.inc112.1, label %for.body94.for.body94_crit_edge.1

for.body94.for.body94_crit_edge.1:                ; preds = %for.body94.1
  %indvars.iv.next39.1 = add nuw nsw i64 %indvars.iv38.1, 1
  br label %for.body94.1

for.inc112.1:                                     ; preds = %for.body94.1
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %cmp90.1 = icmp slt i64 %indvars.iv.next42.1, 4096
  br i1 %cmp90.1, label %for.cond92.preheader, label %for.cond118.preheader.preheader

for.body64.for.body64_crit_edge.1:                ; preds = %for.body64.for.body64_crit_edge
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv4334, -2
  %arrayidx79.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv45, i64 %indvars.iv.next44
  %21 = load float, float* %arrayidx79.1, align 4
  %mul65.1 = fmul float %mul16.v.r2, %21
  %mul66.1 = fmul float %5, %mul25
  %add67.1 = fadd float %mul65.1, %mul66.1
  %mul68.1 = fmul float %exp2, %add71
  %add69.1 = fadd float %add67.1, %mul68.1
  %mul70.1 = fmul float %add7137, %sub30
  %add71.1 = fadd float %add69.1, %mul70.1
  %arrayidx75.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv45, i64 %indvars.iv.next44.1
  store float %add71.1, float* %arrayidx75.1, align 4
  br label %for.body64.for.body64_crit_edge

for.body33.for.body33_crit_edge.1:                ; preds = %for.body33.for.body33_crit_edge
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv4747, 2
  %22 = bitcast float* %arrayidx35 to <2 x float>*
  %arrayidx35.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv50, i64 %indvars.iv.next48.1
  %23 = load <2 x float>, <2 x float>* %22, align 4
  %mul36.1.v.i0.1 = insertelement <2 x float> undef, float %mul16.v.r1, i32 0
  %mul36.1.v.i0.2 = insertelement <2 x float> %mul36.1.v.i0.1, float %div, i32 1
  %mul37.1 = fmul <2 x float> %mul36.1.v.i0.2, %23
  %mul37.1.v.r1 = extractelement <2 x float> %mul37.1, i32 0
  %mul37.1.v.r2 = extractelement <2 x float> %mul37.1, i32 1
  %add38.1 = fadd float %mul37.1.v.r1, %mul37.1.v.r2
  %mul39.1 = fmul float %exp2, %add42
  %add40.1 = fadd float %mul39.1, %add38.1
  %mul41.1 = fmul float %add4250, %sub30
  %add42.1 = fadd float %mul41.1, %add40.1
  %arrayidx46.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv50, i64 %indvars.iv.next48.1
  store float %add42.1, float* %arrayidx46.1, align 4
  br label %for.body33.for.body33_crit_edge
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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv4, 2160
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load float, float* %arrayidx8, align 4
  %conv = fpext float %8 to double
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3 = icmp slt i64 %indvars.iv.next, 2160
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %cmp = icmp slt i64 %indvars.iv.next5, 4096
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
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

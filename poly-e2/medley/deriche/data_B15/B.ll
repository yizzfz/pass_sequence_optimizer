; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %arraydecay = bitcast i8* %call to [2160 x float]*
  %arraydecay4 = bitcast i8* %call1 to [2160 x float]*
  call void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay)
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  tail call void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* %imgIn) #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc7 ]
  %0 = mul nuw nsw i64 %indvars.iv10, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %0, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %for.cond1.preheader
  %index = phi i64 [ 0, %for.cond1.preheader ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %for.cond1.preheader ], [ %vec.ind.next, %vector.body ]
  %1 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %2 = add nuw nsw <4 x i64> %1, %broadcast.splat
  %3 = trunc <4 x i64> %2 to <4 x i32>
  %4 = srem <4 x i32> %3, <i32 65536, i32 65536, i32 65536, i32 65536>
  %5 = sitofp <4 x i32> %4 to <4 x float>
  %6 = fdiv <4 x float> %5, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %7 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv10, i64 %index
  %8 = bitcast float* %7 to <4 x float>*
  store <4 x float> %6, <4 x float>* %8, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %9 = icmp eq i64 %index.next, 2160
  br i1 %9, label %for.inc7, label %vector.body, !llvm.loop !1

for.inc7:                                         ; preds = %vector.body
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut, [2160 x float]* %y1, [2160 x float]* %y2) #0 {
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
  %mul16.v.i0.1 = insertelement <2 x float> undef, float %mul14, i32 0
  %mul16.v.i0.2 = insertelement <2 x float> %mul16.v.i0.1, float %mul19, i32 1
  %mul16 = fmul <2 x float> %sub15, %mul16.v.i0.2
  %mul16.v.r1 = extractelement <2 x float> %mul16, i32 0
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.inc55, %entry
  %indvars.iv149 = phi i64 [ 0, %entry ], [ %indvars.iv.next150, %for.inc55 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond31.preheader
  %indvars.iv146 = phi i64 [ 0, %for.cond31.preheader ], [ %indvars.iv.next147.1, %for.inc ]
  %1 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %7, %for.inc ]
  %2 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add42.1, %for.inc ]
  %3 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add42, %for.inc ]
  %arrayidx35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv149, i64 %indvars.iv146
  %4 = load float, float* %arrayidx35, align 4
  %mul36 = fmul float %div, %4
  %mul37 = fmul float %mul16.v.r1, %1
  %add38 = fadd float %mul37, %mul36
  %mul39 = fmul float %exp2, %2
  %add40 = fadd float %mul39, %add38
  %mul41 = fmul float %3, %sub30
  %add42 = fadd float %mul41, %add40
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv149, i64 %indvars.iv146
  store float %add42, float* %arrayidx46, align 4
  %5 = load float, float* %arrayidx35, align 4
  %indvars.iv.next147 = or i64 %indvars.iv146, 1
  %arrayidx35.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv149, i64 %indvars.iv.next147
  %6 = load float, float* %arrayidx35.1, align 4
  %mul36.1 = fmul float %div, %6
  %mul37.1 = fmul float %mul16.v.r1, %5
  %add38.1 = fadd float %mul37.1, %mul36.1
  %mul39.1 = fmul float %exp2, %add42
  %add40.1 = fadd float %mul39.1, %add38.1
  %mul41.1 = fmul float %2, %sub30
  %add42.1 = fadd float %mul41.1, %add40.1
  %arrayidx46.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv149, i64 %indvars.iv.next147
  store float %add42.1, float* %arrayidx46.1, align 4
  %7 = load float, float* %arrayidx35.1, align 4
  %indvars.iv.next147.1 = add nuw nsw i64 %indvars.iv146, 2
  %exitcond148.1 = icmp eq i64 %indvars.iv.next147.1, 2160
  br i1 %exitcond148.1, label %for.inc55, label %for.inc

for.inc55:                                        ; preds = %for.inc
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond151 = icmp eq i64 %indvars.iv.next150, 4096
  br i1 %exitcond151, label %for.cond62.preheader.preheader, label %for.cond31.preheader

for.cond62.preheader.preheader:                   ; preds = %for.inc55
  %8 = fmul float %div, %call24
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul25 = fsub float -0.000000e+00, %8
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.inc86, %for.cond62.preheader.preheader
  %indvars.iv143 = phi i64 [ 0, %for.cond62.preheader.preheader ], [ %indvars.iv.next144, %for.inc86 ]
  br label %for.inc84

for.inc84:                                        ; preds = %for.inc84, %for.cond62.preheader
  %indvars.iv141 = phi i64 [ 2159, %for.cond62.preheader ], [ %indvars.iv.next142, %for.inc84 ]
  %xp1.sroa.0.0117 = phi i32 [ 0, %for.cond62.preheader ], [ %14, %for.inc84 ]
  %9 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %15, %for.inc84 ]
  %xp2.sroa.0.0116 = phi i32 [ 0, %for.cond62.preheader ], [ %xp1.sroa.0.0117, %for.inc84 ]
  %10 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %add71, %for.inc84 ]
  %11 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %10, %for.inc84 ]
  %mul65 = fmul float %mul16.v.r2, %9
  %12 = bitcast i32 %xp2.sroa.0.0116 to float
  %mul66 = fmul float %12, %mul25
  %add67 = fadd float %mul65, %mul66
  %mul68 = fmul float %exp2, %10
  %add69 = fadd float %mul68, %add67
  %mul70 = fmul float %11, %sub30
  %add71 = fadd float %mul70, %add69
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv143, i64 %indvars.iv141
  store float %add71, float* %arrayidx75, align 4
  %arrayidx79 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv143, i64 %indvars.iv141
  %13 = bitcast float* %arrayidx79 to i32*
  %14 = load i32, i32* %13, align 4
  %15 = bitcast i32 %14 to float
  %indvars.iv.next142 = add nsw i64 %indvars.iv141, -1
  %cmp63 = icmp sgt i64 %indvars.iv141, 0
  br i1 %cmp63, label %for.inc84, label %for.inc86

for.inc86:                                        ; preds = %for.inc84
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond145 = icmp eq i64 %indvars.iv.next144, 4096
  br i1 %exitcond145, label %for.cond92.preheader.preheader, label %for.cond62.preheader

for.cond92.preheader.preheader:                   ; preds = %for.inc86
  br label %for.cond92.preheader

for.cond92.preheader:                             ; preds = %for.cond92.preheader.preheader, %for.inc112
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %for.inc112 ], [ 0, %for.cond92.preheader.preheader ]
  br label %for.inc109

for.inc109:                                       ; preds = %for.inc109, %for.cond92.preheader
  %indvars.iv135 = phi i64 [ 0, %for.cond92.preheader ], [ %indvars.iv.next136.2, %for.inc109 ]
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv138, i64 %indvars.iv135
  %16 = load float, float* %arrayidx98, align 4
  %arrayidx102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv138, i64 %indvars.iv135
  %17 = load float, float* %arrayidx102, align 4
  %add103 = fadd float %16, %17
  %arrayidx108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv138, i64 %indvars.iv135
  store float %add103, float* %arrayidx108, align 4
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %arrayidx98.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv138, i64 %indvars.iv.next136
  %18 = load float, float* %arrayidx98.1, align 4
  %arrayidx102.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv138, i64 %indvars.iv.next136
  %19 = load float, float* %arrayidx102.1, align 4
  %add103.1 = fadd float %18, %19
  %arrayidx108.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv138, i64 %indvars.iv.next136
  store float %add103.1, float* %arrayidx108.1, align 4
  %indvars.iv.next136.1 = add nuw nsw i64 %indvars.iv135, 2
  %arrayidx98.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv138, i64 %indvars.iv.next136.1
  %20 = load float, float* %arrayidx98.2, align 4
  %arrayidx102.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv138, i64 %indvars.iv.next136.1
  %21 = load float, float* %arrayidx102.2, align 4
  %add103.2 = fadd float %20, %21
  %arrayidx108.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv138, i64 %indvars.iv.next136.1
  store float %add103.2, float* %arrayidx108.2, align 4
  %indvars.iv.next136.2 = add nuw nsw i64 %indvars.iv135, 3
  %exitcond137.2 = icmp eq i64 %indvars.iv.next136.2, 2160
  br i1 %exitcond137.2, label %for.inc112, label %for.inc109

for.inc112:                                       ; preds = %for.inc109
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next139, 4096
  br i1 %exitcond140, label %for.cond118.preheader.preheader, label %for.cond92.preheader

for.cond118.preheader.preheader:                  ; preds = %for.inc112
  br label %for.cond118.preheader

for.cond118.preheader:                            ; preds = %for.cond118.preheader.preheader, %for.inc147
  %indvars.iv132 = phi i64 [ %indvars.iv.next133, %for.inc147 ], [ 0, %for.cond118.preheader.preheader ]
  br label %for.inc144

for.inc144:                                       ; preds = %for.inc144, %for.cond118.preheader
  %indvars.iv129 = phi i64 [ 0, %for.cond118.preheader ], [ %indvars.iv.next130.1, %for.inc144 ]
  %22 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %28, %for.inc144 ]
  %23 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131.1, %for.inc144 ]
  %24 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131, %for.inc144 ]
  %arrayidx124 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv129, i64 %indvars.iv132
  %25 = load float, float* %arrayidx124, align 4
  %mul125 = fmul float %div, %25
  %mul126 = fmul float %mul16.v.r1, %22
  %add127 = fadd float %mul126, %mul125
  %mul128 = fmul float %exp2, %23
  %add129 = fadd float %mul128, %add127
  %mul130 = fmul float %24, %sub30
  %add131 = fadd float %mul130, %add129
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv129, i64 %indvars.iv132
  store float %add131, float* %arrayidx135, align 4
  %26 = load float, float* %arrayidx124, align 4
  %indvars.iv.next130 = or i64 %indvars.iv129, 1
  %arrayidx124.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next130, i64 %indvars.iv132
  %27 = load float, float* %arrayidx124.1, align 4
  %mul125.1 = fmul float %div, %27
  %mul126.1 = fmul float %mul16.v.r1, %26
  %add127.1 = fadd float %mul126.1, %mul125.1
  %mul128.1 = fmul float %exp2, %add131
  %add129.1 = fadd float %mul128.1, %add127.1
  %mul130.1 = fmul float %23, %sub30
  %add131.1 = fadd float %mul130.1, %add129.1
  %arrayidx135.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next130, i64 %indvars.iv132
  store float %add131.1, float* %arrayidx135.1, align 4
  %28 = load float, float* %arrayidx124.1, align 4
  %indvars.iv.next130.1 = add nuw nsw i64 %indvars.iv129, 2
  %exitcond131.1 = icmp eq i64 %indvars.iv.next130.1, 4096
  br i1 %exitcond131.1, label %for.inc147, label %for.inc144

for.inc147:                                       ; preds = %for.inc144
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next133, 2160
  br i1 %exitcond134, label %for.cond154.preheader.preheader, label %for.cond118.preheader

for.cond154.preheader.preheader:                  ; preds = %for.inc147
  br label %for.cond154.preheader

for.cond154.preheader:                            ; preds = %for.cond154.preheader.preheader, %for.inc179
  %indvars.iv126 = phi i64 [ %indvars.iv.next127, %for.inc179 ], [ 0, %for.cond154.preheader.preheader ]
  br label %for.inc176

for.inc176:                                       ; preds = %for.inc176, %for.cond154.preheader
  %indvars.iv124 = phi i64 [ 4095, %for.cond154.preheader ], [ %indvars.iv.next125, %for.inc176 ]
  %tp1.sroa.0.0109 = phi i32 [ 0, %for.cond154.preheader ], [ %34, %for.inc176 ]
  %29 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %35, %for.inc176 ]
  %tp2.sroa.0.0108 = phi i32 [ 0, %for.cond154.preheader ], [ %tp1.sroa.0.0109, %for.inc176 ]
  %30 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %add163, %for.inc176 ]
  %31 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %30, %for.inc176 ]
  %mul157 = fmul float %mul16.v.r2, %29
  %32 = bitcast i32 %tp2.sroa.0.0108 to float
  %mul158 = fmul float %32, %mul25
  %add159 = fadd float %mul157, %mul158
  %mul160 = fmul float %exp2, %30
  %add161 = fadd float %mul160, %add159
  %mul162 = fmul float %31, %sub30
  %add163 = fadd float %mul162, %add161
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv124, i64 %indvars.iv126
  store float %add163, float* %arrayidx167, align 4
  %arrayidx171 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv124, i64 %indvars.iv126
  %33 = bitcast float* %arrayidx171 to i32*
  %34 = load i32, i32* %33, align 4
  %35 = bitcast i32 %34 to float
  %indvars.iv.next125 = add nsw i64 %indvars.iv124, -1
  %cmp155 = icmp sgt i64 %indvars.iv124, 0
  br i1 %cmp155, label %for.inc176, label %for.inc179

for.inc179:                                       ; preds = %for.inc176
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next127, 2160
  br i1 %exitcond128, label %for.cond185.preheader.preheader, label %for.cond154.preheader

for.cond185.preheader.preheader:                  ; preds = %for.inc179
  br label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.cond185.preheader.preheader, %for.inc205
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %for.inc205 ], [ 0, %for.cond185.preheader.preheader ]
  br label %for.inc202

for.inc202:                                       ; preds = %for.inc202, %for.cond185.preheader
  %indvars.iv = phi i64 [ 0, %for.cond185.preheader ], [ %indvars.iv.next.2, %for.inc202 ]
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv122, i64 %indvars.iv
  %36 = load float, float* %arrayidx191, align 4
  %arrayidx195 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv122, i64 %indvars.iv
  %37 = load float, float* %arrayidx195, align 4
  %add196 = fadd float %36, %37
  %arrayidx201 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv122, i64 %indvars.iv
  store float %add196, float* %arrayidx201, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv122, i64 %indvars.iv.next
  %38 = load float, float* %arrayidx191.1, align 4
  %arrayidx195.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv122, i64 %indvars.iv.next
  %39 = load float, float* %arrayidx195.1, align 4
  %add196.1 = fadd float %38, %39
  %arrayidx201.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv122, i64 %indvars.iv.next
  store float %add196.1, float* %arrayidx201.1, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx191.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv122, i64 %indvars.iv.next.1
  %40 = load float, float* %arrayidx191.2, align 4
  %arrayidx195.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv122, i64 %indvars.iv.next.1
  %41 = load float, float* %arrayidx195.2, align 4
  %add196.2 = fadd float %40, %41
  %arrayidx201.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv122, i64 %indvars.iv.next.1
  store float %add196.2, float* %arrayidx201.2, align 4
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %for.inc205, label %for.inc202

for.inc205:                                       ; preds = %for.inc202
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next123, 4096
  br i1 %exitcond, label %for.end207, label %for.cond185.preheader

for.end207:                                       ; preds = %for.inc205
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %w, i32 %h, [2160 x float]* %imgOut) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2160
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load float, float* %arrayidx8, align 4
  %conv = fpext float %8 to double
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

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

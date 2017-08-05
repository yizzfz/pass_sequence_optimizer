; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %arraydecay1 = bitcast i8* %call to [2160 x float]*
  %arraydecay42 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay1, [2160 x float]* %arraydecay42)
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay73 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay84 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay1, [2160 x float]* %arraydecay42, [2160 x float]* %arraydecay73, [2160 x float]* %arraydecay84)
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
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay42)
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
define internal fastcc void @init_array(i32 %w, i32 %h, float* nocapture %alpha, [2160 x float]* %imgIn, [2160 x float]* nocapture readnone %imgOut) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc7 ]
  %0 = mul nuw nsw i64 %indvars.iv5, 313
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %1 = mul nuw nsw i64 %indvars.iv, 991
  %2 = add nuw nsw i64 %1, %0
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 65536
  %conv = sitofp i32 %rem to float
  %div = fdiv float %conv, 6.553500e+04
  %arrayidx6 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv5, i64 %indvars.iv
  store float %div, float* %arrayidx6, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 4096
  br i1 %exitcond8, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32 %w, i32 %h, float %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut, [2160 x float]* %y1, [2160 x float]* %y2) unnamed_addr #0 {
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
  %1 = fmul float %div, %call24
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  br label %for.cond31.preheader

for.cond31.preheader:                             ; preds = %for.inc55, %entry
  %indvars.iv67 = phi i64 [ 0, %entry ], [ %indvars.iv.next68, %for.inc55 ]
  br label %for.body33

for.body33:                                       ; preds = %for.body33.for.body33_crit_edge, %for.cond31.preheader
  %indvars.iv64 = phi i64 [ 0, %for.cond31.preheader ], [ %indvars.iv.next65, %for.body33.for.body33_crit_edge ]
  %2 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %6, %for.body33.for.body33_crit_edge ]
  %3 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %4, %for.body33.for.body33_crit_edge ]
  %4 = phi float [ 0.000000e+00, %for.cond31.preheader ], [ %add42, %for.body33.for.body33_crit_edge ]
  %arrayidx35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv67, i64 %indvars.iv64
  %5 = load float, float* %arrayidx35, align 4
  %mul36 = fmul float %div, %5
  %mul37 = fmul float %mul16.v.r1, %2
  %add38 = fadd float %mul37, %mul36
  %mul39 = fmul float %exp2, %4
  %add40 = fadd float %mul39, %add38
  %mul41 = fmul float %3, %sub30
  %add42 = fadd float %mul41, %add40
  %arrayidx46 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv67, i64 %indvars.iv64
  store float %add42, float* %arrayidx46, align 4
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next65, 2160
  br i1 %exitcond66, label %for.inc55, label %for.body33.for.body33_crit_edge

for.body33.for.body33_crit_edge:                  ; preds = %for.body33
  %arrayidx50 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv67, i64 %indvars.iv64
  %6 = load float, float* %arrayidx50, align 4
  br label %for.body33

for.inc55:                                        ; preds = %for.body33
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next68, 4096
  br i1 %exitcond69, label %for.cond62.preheader.preheader, label %for.cond31.preheader

for.cond62.preheader.preheader:                   ; preds = %for.inc55
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul25 = fsub float -0.000000e+00, %1
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.inc86, %for.cond62.preheader.preheader
  %indvars.iv61 = phi i64 [ 0, %for.cond62.preheader.preheader ], [ %indvars.iv.next62, %for.inc86 ]
  br label %for.body64

for.body64:                                       ; preds = %for.body64.for.body64_crit_edge, %for.cond62.preheader
  %indvars.iv59 = phi i64 [ 2159, %for.cond62.preheader ], [ %indvars.iv.next60, %for.body64.for.body64_crit_edge ]
  %7 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %14, %for.body64.for.body64_crit_edge ]
  %8 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %13, %for.body64.for.body64_crit_edge ]
  %9 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %10, %for.body64.for.body64_crit_edge ]
  %xp1.sroa.0.036 = phi i32 [ 0, %for.cond62.preheader ], [ %12, %for.body64.for.body64_crit_edge ]
  %10 = phi float [ 0.000000e+00, %for.cond62.preheader ], [ %add71, %for.body64.for.body64_crit_edge ]
  %mul65 = fmul float %mul16.v.r2, %7
  %mul66 = fmul float %8, %mul25
  %add67 = fadd float %mul66, %mul65
  %mul68 = fmul float %exp2, %10
  %add69 = fadd float %mul68, %add67
  %mul70 = fmul float %9, %sub30
  %add71 = fadd float %mul70, %add69
  %arrayidx75 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv61, i64 %indvars.iv59
  store float %add71, float* %arrayidx75, align 4
  %arrayidx79 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv61, i64 %indvars.iv59
  %11 = bitcast float* %arrayidx79 to i32*
  %12 = load i32, i32* %11, align 4
  %cmp63 = icmp sgt i64 %indvars.iv59, 0
  br i1 %cmp63, label %for.body64.for.body64_crit_edge, label %for.inc86

for.body64.for.body64_crit_edge:                  ; preds = %for.body64
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, -1
  %13 = bitcast i32 %xp1.sroa.0.036 to float
  %14 = bitcast i32 %12 to float
  br label %for.body64

for.inc86:                                        ; preds = %for.body64
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next62, 4096
  br i1 %exitcond63, label %for.cond92.preheader.preheader, label %for.cond62.preheader

for.cond92.preheader.preheader:                   ; preds = %for.inc86
  br label %for.cond92.preheader

for.cond92.preheader:                             ; preds = %for.cond92.preheader.preheader, %for.inc112
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc112 ], [ 0, %for.cond92.preheader.preheader ]
  br label %for.body94

for.body94:                                       ; preds = %for.body94, %for.cond92.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond92.preheader ], [ %indvars.iv.next54.2, %for.body94 ]
  %arrayidx98 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv56, i64 %indvars.iv53
  %15 = load float, float* %arrayidx98, align 4
  %arrayidx102 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv56, i64 %indvars.iv53
  %16 = load float, float* %arrayidx102, align 4
  %add103 = fadd float %15, %16
  %arrayidx108 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv56, i64 %indvars.iv53
  store float %add103, float* %arrayidx108, align 4
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %arrayidx98.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv56, i64 %indvars.iv.next54
  %17 = load float, float* %arrayidx98.1, align 4
  %arrayidx102.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv56, i64 %indvars.iv.next54
  %18 = load float, float* %arrayidx102.1, align 4
  %add103.1 = fadd float %17, %18
  %arrayidx108.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv56, i64 %indvars.iv.next54
  store float %add103.1, float* %arrayidx108.1, align 4
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %arrayidx98.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv56, i64 %indvars.iv.next54.1
  %19 = load float, float* %arrayidx98.2, align 4
  %arrayidx102.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv56, i64 %indvars.iv.next54.1
  %20 = load float, float* %arrayidx102.2, align 4
  %add103.2 = fadd float %19, %20
  %arrayidx108.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv56, i64 %indvars.iv.next54.1
  store float %add103.2, float* %arrayidx108.2, align 4
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %exitcond55.2 = icmp eq i64 %indvars.iv.next54.2, 2160
  br i1 %exitcond55.2, label %for.inc112, label %for.body94

for.inc112:                                       ; preds = %for.body94
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next57, 4096
  br i1 %exitcond58, label %for.cond118.preheader.preheader, label %for.cond92.preheader

for.cond118.preheader.preheader:                  ; preds = %for.inc112
  br label %for.cond118.preheader

for.cond118.preheader:                            ; preds = %for.cond118.preheader.preheader, %for.inc147
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.inc147 ], [ 0, %for.cond118.preheader.preheader ]
  br label %for.body120

for.body120:                                      ; preds = %for.body120.for.body120_crit_edge, %for.cond118.preheader
  %indvars.iv47 = phi i64 [ 0, %for.cond118.preheader ], [ %indvars.iv.next48, %for.body120.for.body120_crit_edge ]
  %21 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %25, %for.body120.for.body120_crit_edge ]
  %22 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %23, %for.body120.for.body120_crit_edge ]
  %23 = phi float [ 0.000000e+00, %for.cond118.preheader ], [ %add131, %for.body120.for.body120_crit_edge ]
  %arrayidx124 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv50
  %24 = load float, float* %arrayidx124, align 4
  %mul125 = fmul float %div, %24
  %mul126 = fmul float %mul16.v.r1, %21
  %add127 = fadd float %mul126, %mul125
  %mul128 = fmul float %exp2, %23
  %add129 = fadd float %mul128, %add127
  %mul130 = fmul float %22, %sub30
  %add131 = fadd float %mul130, %add129
  %arrayidx135 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv50
  store float %add131, float* %arrayidx135, align 4
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 4096
  br i1 %exitcond49, label %for.inc147, label %for.body120.for.body120_crit_edge

for.body120.for.body120_crit_edge:                ; preds = %for.body120
  %arrayidx139 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv50
  %25 = load float, float* %arrayidx139, align 4
  br label %for.body120

for.inc147:                                       ; preds = %for.body120
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next51, 2160
  br i1 %exitcond52, label %for.cond154.preheader.preheader, label %for.cond118.preheader

for.cond154.preheader.preheader:                  ; preds = %for.inc147
  br label %for.cond154.preheader

for.cond154.preheader:                            ; preds = %for.cond154.preheader.preheader, %for.inc179
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc179 ], [ 0, %for.cond154.preheader.preheader ]
  br label %for.body156

for.body156:                                      ; preds = %for.body156.for.body156_crit_edge, %for.cond154.preheader
  %indvars.iv42 = phi i64 [ 4095, %for.cond154.preheader ], [ %indvars.iv.next43, %for.body156.for.body156_crit_edge ]
  %26 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %33, %for.body156.for.body156_crit_edge ]
  %27 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %32, %for.body156.for.body156_crit_edge ]
  %28 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %29, %for.body156.for.body156_crit_edge ]
  %tp1.sroa.0.031 = phi i32 [ 0, %for.cond154.preheader ], [ %31, %for.body156.for.body156_crit_edge ]
  %29 = phi float [ 0.000000e+00, %for.cond154.preheader ], [ %add163, %for.body156.for.body156_crit_edge ]
  %mul157 = fmul float %mul16.v.r2, %26
  %mul158 = fmul float %27, %mul25
  %add159 = fadd float %mul158, %mul157
  %mul160 = fmul float %exp2, %29
  %add161 = fadd float %mul160, %add159
  %mul162 = fmul float %28, %sub30
  %add163 = fadd float %mul162, %add161
  %arrayidx167 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv42, i64 %indvars.iv44
  store float %add163, float* %arrayidx167, align 4
  %arrayidx171 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv42, i64 %indvars.iv44
  %30 = bitcast float* %arrayidx171 to i32*
  %31 = load i32, i32* %30, align 4
  %cmp155 = icmp sgt i64 %indvars.iv42, 0
  br i1 %cmp155, label %for.body156.for.body156_crit_edge, label %for.inc179

for.body156.for.body156_crit_edge:                ; preds = %for.body156
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, -1
  %32 = bitcast i32 %tp1.sroa.0.031 to float
  %33 = bitcast i32 %31 to float
  br label %for.body156

for.inc179:                                       ; preds = %for.body156
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next45, 2160
  br i1 %exitcond46, label %for.cond185.preheader.preheader, label %for.cond154.preheader

for.cond185.preheader.preheader:                  ; preds = %for.inc179
  br label %for.cond185.preheader

for.cond185.preheader:                            ; preds = %for.cond185.preheader.preheader, %for.inc205
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.inc205 ], [ 0, %for.cond185.preheader.preheader ]
  br label %for.body187

for.body187:                                      ; preds = %for.body187, %for.cond185.preheader
  %indvars.iv = phi i64 [ 0, %for.cond185.preheader ], [ %indvars.iv.next.2, %for.body187 ]
  %arrayidx191 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv40, i64 %indvars.iv
  %34 = load float, float* %arrayidx191, align 4
  %arrayidx195 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv40, i64 %indvars.iv
  %35 = load float, float* %arrayidx195, align 4
  %add196 = fadd float %34, %35
  %arrayidx201 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv40, i64 %indvars.iv
  store float %add196, float* %arrayidx201, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv40, i64 %indvars.iv.next
  %36 = load float, float* %arrayidx191.1, align 4
  %arrayidx195.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv40, i64 %indvars.iv.next
  %37 = load float, float* %arrayidx195.1, align 4
  %add196.1 = fadd float %36, %37
  %arrayidx201.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv40, i64 %indvars.iv.next
  store float %add196.1, float* %arrayidx201.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx191.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv40, i64 %indvars.iv.next.1
  %38 = load float, float* %arrayidx191.2, align 4
  %arrayidx195.2 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv40, i64 %indvars.iv.next.1
  %39 = load float, float* %arrayidx195.2, align 4
  %add196.2 = fadd float %38, %39
  %arrayidx201.2 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv40, i64 %indvars.iv.next.1
  store float %add196.2, float* %arrayidx201.2, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %for.inc205, label %for.body187

for.inc205:                                       ; preds = %for.body187
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, 4096
  br i1 %exitcond, label %for.end207, label %for.cond185.preheader

for.end207:                                       ; preds = %for.inc205
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %w, i32 %h, [2160 x float]* %imgOut) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 2160
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 4096
  br i1 %exitcond7, label %for.end12, label %for.cond2.preheader

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

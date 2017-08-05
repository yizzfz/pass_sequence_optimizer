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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %cmp7 = icmp sgt i32 %w, 0
  %cmp25 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp7, %cmp25
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count7 = zext i32 %w to i64
  %min.iters.check = icmp ult i32 %h, 4
  %0 = and i32 %h, 3
  %n.mod.vf = zext i32 %0 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc7.us
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.inc7.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = mul nuw nsw i64 %indvars.iv4, 313
  br i1 %min.iters.check, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %1, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %2 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %3 = add nuw nsw <4 x i64> %2, %broadcast.splat
  %4 = trunc <4 x i64> %3 to <4 x i32>
  %5 = srem <4 x i32> %4, <i32 65536, i32 65536, i32 65536, i32 65536>
  %6 = sitofp <4 x i32> %5 to <4 x float>
  %7 = fdiv <4 x float> %6, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv4, i64 %index
  %9 = bitcast float* %8 to <4 x float>*
  store <4 x float> %7, <4 x float>* %9, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc7.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %11 = mul nuw nsw i64 %indvars.iv, 991
  %12 = add nuw nsw i64 %11, %1
  %13 = trunc i64 %12 to i32
  %rem.us = srem i32 %13, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv4, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc7.us.loopexit, label %for.body3.us, !llvm.loop !4

for.inc7.us.loopexit:                             ; preds = %for.body3.us
  br label %for.inc7.us

for.inc7.us:                                      ; preds = %for.inc7.us.loopexit, %middle.block
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next5, %wide.trip.count7
  br i1 %exitcond8, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.inc7.us
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
  %mul16.v.i0.1 = insertelement <2 x float> undef, float %mul14, i32 0
  %mul16.v.i0.2 = insertelement <2 x float> %mul16.v.i0.1, float %mul19, i32 1
  %mul16 = fmul <2 x float> %sub15, %mul16.v.i0.2
  %mul16.v.r1 = extractelement <2 x float> %mul16, i32 0
  %mul16.v.r2 = extractelement <2 x float> %mul16, i32 1
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %1 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %1
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %cmp136 = icmp sgt i32 %w, 0
  br i1 %cmp136, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32134 = icmp sgt i32 %h, 0
  br i1 %cmp32134, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter190 = and i32 %h, 1
  %lcmp.mod191 = icmp eq i32 %xtraiter190, 0
  %2 = icmp eq i32 %h, 1
  %wide.trip.count197 = zext i32 %w to i64
  %wide.trip.count188.1 = zext i32 %h to i64
  %mul37.us.prol = fmul float %mul16.v.r1, 0.000000e+00
  %mul39.us.prol = fmul float %exp2, 0.000000e+00
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.inc55.us
  %indvars.iv195 = phi i64 [ %indvars.iv.next196, %for.inc55.us ], [ 0, %for.cond31.preheader.us.preheader ]
  br i1 %lcmp.mod191, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv195, i64 0
  %3 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %3
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv195, i64 0
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  %4 = load float, float* %arrayidx35.us.prol, align 4
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv186.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr192.ph = phi float [ %4, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  %.unr193.ph = phi float [ %add42.us.prol, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  br i1 %2, label %for.inc55.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv186 = phi i64 [ %indvars.iv.next187.1, %for.body33.us ], [ %indvars.iv186.unr.ph, %for.body33.us.preheader ]
  %5 = phi float [ %11, %for.body33.us ], [ %.unr192.ph, %for.body33.us.preheader ]
  %6 = phi float [ %add42.us.1, %for.body33.us ], [ %.unr193.ph, %for.body33.us.preheader ]
  %7 = phi float [ %add42.us, %for.body33.us ], [ 0.000000e+00, %for.body33.us.preheader ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv195, i64 %indvars.iv186
  %8 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %8
  %mul37.us = fmul float %mul16.v.r1, %5
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %6
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %7, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv195, i64 %indvars.iv186
  store float %add42.us, float* %arrayidx46.us, align 4
  %9 = load float, float* %arrayidx35.us, align 4
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv195, i64 %indvars.iv.next187
  %10 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %10
  %mul37.us.1 = fmul float %mul16.v.r1, %9
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %6, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv195, i64 %indvars.iv.next187
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %11 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next187.1 = add nsw i64 %indvars.iv186, 2
  %exitcond189.1 = icmp eq i64 %indvars.iv.next187.1, %wide.trip.count188.1
  br i1 %exitcond189.1, label %for.inc55.us.loopexit, label %for.body33.us

for.inc55.us.loopexit:                            ; preds = %for.body33.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next196, %wide.trip.count197
  br i1 %exitcond198, label %for.cond58.preheader, label %for.cond31.preheader.us

for.cond58.preheader:                             ; preds = %for.inc55.us
  br i1 true, label %for.cond62.preheader.lr.ph, label %for.cond58.preheader.for.cond115.preheader_crit_edge

for.cond58.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond58.preheader
  br label %for.cond115.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader
  br i1 true, label %for.cond62.preheader.us.preheader, label %for.cond62.preheader.lr.ph.for.end207_crit_edge

for.cond62.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond62.preheader.lr.ph
  br label %for.end207

for.cond62.preheader.us.preheader:                ; preds = %for.cond62.preheader.lr.ph
  %12 = sext i32 %h to i64
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.inc86.us, %for.cond62.preheader.us.preheader
  %indvars.iv181 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next182, %for.inc86.us ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.body64.us, %for.cond62.preheader.us
  %indvars.iv179 = phi i64 [ %indvars.iv.next180, %for.body64.us ], [ %12, %for.cond62.preheader.us ]
  %xp1.sroa.0.0130.us = phi i32 [ %18, %for.body64.us ], [ 0, %for.cond62.preheader.us ]
  %13 = phi float [ %19, %for.body64.us ], [ 0.000000e+00, %for.cond62.preheader.us ]
  %xp2.sroa.0.0129.us = phi i32 [ %xp1.sroa.0.0130.us, %for.body64.us ], [ 0, %for.cond62.preheader.us ]
  %14 = phi float [ %add71.us, %for.body64.us ], [ 0.000000e+00, %for.cond62.preheader.us ]
  %15 = phi float [ %14, %for.body64.us ], [ 0.000000e+00, %for.cond62.preheader.us ]
  %indvars.iv.next180 = add nsw i64 %indvars.iv179, -1
  %mul65.us = fmul float %mul16.v.r2, %13
  %16 = bitcast i32 %xp2.sroa.0.0129.us to float
  %mul66.us = fmul float %16, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %14
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %15, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv181, i64 %indvars.iv.next180
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv181, i64 %indvars.iv.next180
  %17 = bitcast float* %arrayidx79.us to i32*
  %18 = load i32, i32* %17, align 4
  %19 = bitcast i32 %18 to float
  %cmp63.us = icmp sgt i64 %indvars.iv179, 1
  br i1 %cmp63.us, label %for.body64.us, label %for.inc86.us

for.inc86.us:                                     ; preds = %for.body64.us
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond184 = icmp eq i64 %indvars.iv.next182, %wide.trip.count197
  br i1 %exitcond184, label %for.cond89.preheader, label %for.cond62.preheader.us

for.cond89.preheader:                             ; preds = %for.inc86.us
  br i1 true, label %for.cond92.preheader.lr.ph, label %for.cond89.preheader.for.cond115.preheader_crit_edge

for.cond89.preheader.for.cond115.preheader_crit_edge: ; preds = %for.cond89.preheader
  br label %for.cond115.preheader

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  br i1 true, label %for.cond92.preheader.us.preheader, label %for.cond92.preheader.lr.ph.for.end207_crit_edge

for.cond92.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond92.preheader.lr.ph
  br label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  %20 = add nsw i64 %wide.trip.count188.1, -2
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.inc112.us
  %indvars.iv174 = phi i64 [ %indvars.iv.next175, %for.inc112.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep219 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 2
  %scevgep225 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 2
  %scevgep231 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 2
  br i1 %lcmp.mod191, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.cond92.preheader.us
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 0
  %21 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 0
  %22 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %21, %22
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 0
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.cond92.preheader.us
  %indvars.iv168.unr.ph = phi i64 [ 1, %for.body94.us.prol ], [ 0, %for.cond92.preheader.us ]
  br i1 %2, label %for.inc112.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %for.body94.us.prol.loopexit
  %23 = sub nsw i64 %20, %indvars.iv168.unr.ph
  %24 = lshr i64 %23, 1
  %25 = add nuw i64 %24, 1
  %min.iters.check = icmp ult i64 %25, 4
  br i1 %min.iters.check, label %for.body94.us.preheader295, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body94.us.preheader
  %n.mod.vf = and i64 %25, 3
  %n.vec = sub i64 %25, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body94.us.preheader295, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep217 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 %indvars.iv168.unr.ph
  %26 = and i64 %23, -2
  %27 = or i64 %indvars.iv168.unr.ph, %26
  %scevgep220 = getelementptr float, float* %scevgep219, i64 %27
  %scevgep223 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 %indvars.iv168.unr.ph
  %scevgep226 = getelementptr float, float* %scevgep225, i64 %27
  %scevgep229 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 %indvars.iv168.unr.ph
  %scevgep232 = getelementptr float, float* %scevgep231, i64 %27
  %bound0 = icmp ult float* %scevgep217, %scevgep226
  %bound1 = icmp ult float* %scevgep223, %scevgep220
  %found.conflict = and i1 %bound0, %bound1
  %bound0234 = icmp ult float* %scevgep217, %scevgep232
  %bound1235 = icmp ult float* %scevgep229, %scevgep220
  %found.conflict236 = and i1 %bound0234, %bound1235
  %conflict.rdx = or i1 %found.conflict, %found.conflict236
  %28 = or i64 %indvars.iv168.unr.ph, 2
  %29 = shl nuw i64 %24, 1
  %30 = add i64 %28, %29
  %31 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %30, %31
  br i1 %conflict.rdx, label %for.body94.us.preheader295, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %32 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv168.unr.ph, %32
  %33 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 %offset.idx
  %34 = bitcast float* %33 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %34, align 4, !alias.scope !6
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 %offset.idx
  %36 = bitcast float* %35 to <8 x float>*
  %wide.vec238 = load <8 x float>, <8 x float>* %36, align 4, !alias.scope !9
  %37 = fadd <8 x float> %wide.vec, %wide.vec238
  %38 = add nuw nsw i64 %offset.idx, 1
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 %38
  %40 = getelementptr float, float* %39, i64 -1
  %41 = bitcast float* %40 to <8 x float>*
  store <8 x float> %37, <8 x float>* %41, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc112.us, label %for.body94.us.preheader295

for.body94.us.preheader295:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body94.us.preheader
  %indvars.iv168.ph = phi i64 [ %indvars.iv168.unr.ph, %vector.memcheck ], [ %indvars.iv168.unr.ph, %min.iters.checked ], [ %indvars.iv168.unr.ph, %for.body94.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.preheader295, %for.body94.us
  %indvars.iv168 = phi i64 [ %indvars.iv.next169.1, %for.body94.us ], [ %indvars.iv168.ph, %for.body94.us.preheader295 ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 %indvars.iv168
  %43 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 %indvars.iv168
  %44 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %43, %44
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 %indvars.iv168
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next169 = add nuw nsw i64 %indvars.iv168, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv174, i64 %indvars.iv.next169
  %45 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv174, i64 %indvars.iv.next169
  %46 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %45, %46
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv174, i64 %indvars.iv.next169
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next169.1 = add nsw i64 %indvars.iv168, 2
  %exitcond171.1 = icmp eq i64 %indvars.iv.next169.1, %wide.trip.count188.1
  br i1 %exitcond171.1, label %for.inc112.us.loopexit, label %for.body94.us, !llvm.loop !15

for.inc112.us.loopexit:                           ; preds = %for.body94.us
  br label %for.inc112.us

for.inc112.us:                                    ; preds = %for.inc112.us.loopexit, %middle.block, %for.body94.us.prol.loopexit
  %indvars.iv.next175 = add nuw nsw i64 %indvars.iv174, 1
  %exitcond177 = icmp eq i64 %indvars.iv.next175, %wide.trip.count197
  br i1 %exitcond177, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.inc112.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond89.preheader.for.cond115.preheader_crit_edge, %for.cond58.preheader.for.cond115.preheader_crit_edge, %for.cond115.preheader.loopexit, %entry
  %cmp116121 = icmp sgt i32 %h, 0
  br i1 %cmp116121, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  br i1 %cmp136, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %xtraiter159 = and i32 %w, 1
  %lcmp.mod160 = icmp eq i32 %xtraiter159, 0
  %47 = icmp eq i32 %w, 1
  %wide.trip.count165 = zext i32 %h to i64
  %wide.trip.count157.1 = zext i32 %w to i64
  %mul126.us.prol = fmul float %mul16.v.r1, 0.000000e+00
  %mul128.us.prol = fmul float %exp2, 0.000000e+00
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.inc147.us
  %indvars.iv163 = phi i64 [ %indvars.iv.next164, %for.inc147.us ], [ 0, %for.cond118.preheader.us.preheader ]
  br i1 %lcmp.mod160, label %for.body120.us.prol.loopexit, label %for.body120.us.prol

for.body120.us.prol:                              ; preds = %for.cond118.preheader.us
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv163
  %48 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %48
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv163
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  %49 = load float, float* %arrayidx124.us.prol, align 4
  br label %for.body120.us.prol.loopexit

for.body120.us.prol.loopexit:                     ; preds = %for.body120.us.prol, %for.cond118.preheader.us
  %indvars.iv155.unr.ph = phi i64 [ 1, %for.body120.us.prol ], [ 0, %for.cond118.preheader.us ]
  %.unr.ph = phi float [ %49, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  %.unr161.ph = phi float [ %add131.us.prol, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  br i1 %47, label %for.inc147.us, label %for.body120.us.preheader

for.body120.us.preheader:                         ; preds = %for.body120.us.prol.loopexit
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us.preheader, %for.body120.us
  %indvars.iv155 = phi i64 [ %indvars.iv.next156.1, %for.body120.us ], [ %indvars.iv155.unr.ph, %for.body120.us.preheader ]
  %50 = phi float [ %56, %for.body120.us ], [ %.unr.ph, %for.body120.us.preheader ]
  %51 = phi float [ %add131.us.1, %for.body120.us ], [ %.unr161.ph, %for.body120.us.preheader ]
  %52 = phi float [ %add131.us, %for.body120.us ], [ 0.000000e+00, %for.body120.us.preheader ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv155, i64 %indvars.iv163
  %53 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %53
  %mul126.us = fmul float %mul16.v.r1, %50
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %51
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %52, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv155, i64 %indvars.iv163
  store float %add131.us, float* %arrayidx135.us, align 4
  %54 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next156 = add nuw nsw i64 %indvars.iv155, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next156, i64 %indvars.iv163
  %55 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %55
  %mul126.us.1 = fmul float %mul16.v.r1, %54
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %51, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next156, i64 %indvars.iv163
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %56 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next156.1 = add nsw i64 %indvars.iv155, 2
  %exitcond158.1 = icmp eq i64 %indvars.iv.next156.1, %wide.trip.count157.1
  br i1 %exitcond158.1, label %for.inc147.us.loopexit, label %for.body120.us

for.inc147.us.loopexit:                           ; preds = %for.body120.us
  br label %for.inc147.us

for.inc147.us:                                    ; preds = %for.inc147.us.loopexit, %for.body120.us.prol.loopexit
  %indvars.iv.next164 = add nuw nsw i64 %indvars.iv163, 1
  %exitcond166 = icmp eq i64 %indvars.iv.next164, %wide.trip.count165
  br i1 %exitcond166, label %for.cond150.preheader, label %for.cond118.preheader.us

for.cond150.preheader:                            ; preds = %for.inc147.us
  br i1 true, label %for.cond154.preheader.lr.ph, label %for.cond150.preheader.for.cond182.preheader_crit_edge

for.cond150.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond150.preheader
  br label %for.cond182.preheader

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader
  br i1 true, label %for.cond154.preheader.us.preheader, label %for.cond154.preheader.lr.ph.for.end207_crit_edge

for.cond154.preheader.lr.ph.for.end207_crit_edge: ; preds = %for.cond154.preheader.lr.ph
  br label %for.end207

for.cond154.preheader.us.preheader:               ; preds = %for.cond154.preheader.lr.ph
  %57 = sext i32 %w to i64
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.inc179.us, %for.cond154.preheader.us.preheader
  %indvars.iv150 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next151, %for.inc179.us ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.body156.us, %for.cond154.preheader.us
  %indvars.iv148 = phi i64 [ %indvars.iv.next149, %for.body156.us ], [ %57, %for.cond154.preheader.us ]
  %tp1.sroa.0.0115.us = phi i32 [ %63, %for.body156.us ], [ 0, %for.cond154.preheader.us ]
  %58 = phi float [ %64, %for.body156.us ], [ 0.000000e+00, %for.cond154.preheader.us ]
  %tp2.sroa.0.0114.us = phi i32 [ %tp1.sroa.0.0115.us, %for.body156.us ], [ 0, %for.cond154.preheader.us ]
  %59 = phi float [ %add163.us, %for.body156.us ], [ 0.000000e+00, %for.cond154.preheader.us ]
  %60 = phi float [ %59, %for.body156.us ], [ 0.000000e+00, %for.cond154.preheader.us ]
  %indvars.iv.next149 = add nsw i64 %indvars.iv148, -1
  %mul157.us = fmul float %mul16.v.r2, %58
  %61 = bitcast i32 %tp2.sroa.0.0114.us to float
  %mul158.us = fmul float %61, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %59
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %60, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next149, i64 %indvars.iv150
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next149, i64 %indvars.iv150
  %62 = bitcast float* %arrayidx171.us to i32*
  %63 = load i32, i32* %62, align 4
  %64 = bitcast i32 %63 to float
  %cmp155.us = icmp sgt i64 %indvars.iv148, 1
  br i1 %cmp155.us, label %for.body156.us, label %for.inc179.us

for.inc179.us:                                    ; preds = %for.body156.us
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, %wide.trip.count165
  br i1 %exitcond153, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.inc179.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond150.preheader.for.cond182.preheader_crit_edge, %for.cond182.preheader.loopexit, %for.cond115.preheader
  %or.cond = and i1 %cmp136, %cmp116121
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %xtraiter = and i32 %h, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %65 = icmp eq i32 %h, 1
  %wide.trip.count146 = zext i32 %w to i64
  %wide.trip.count.1 = zext i32 %h to i64
  %66 = add nsw i64 %wide.trip.count.1, -2
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.preheader.us.preheader, %for.inc205.us
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %for.inc205.us ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep253 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 2
  %scevgep259 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 2
  %scevgep265 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 2
  br i1 %lcmp.mod, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.cond185.preheader.us
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 0
  %67 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 0
  %68 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %67, %68
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 0
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.cond185.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body187.us.prol ], [ 0, %for.cond185.preheader.us ]
  br i1 %65, label %for.inc205.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %for.body187.us.prol.loopexit
  %69 = sub nsw i64 %66, %indvars.iv.unr.ph
  %70 = lshr i64 %69, 1
  %71 = add nuw i64 %70, 1
  %min.iters.check244 = icmp ult i64 %71, 4
  br i1 %min.iters.check244, label %for.body187.us.preheader294, label %min.iters.checked245

min.iters.checked245:                             ; preds = %for.body187.us.preheader
  %n.mod.vf246 = and i64 %71, 3
  %n.vec247 = sub i64 %71, %n.mod.vf246
  %cmp.zero248 = icmp eq i64 %n.vec247, 0
  br i1 %cmp.zero248, label %for.body187.us.preheader294, label %vector.memcheck276

vector.memcheck276:                               ; preds = %min.iters.checked245
  %scevgep251 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %indvars.iv.unr.ph
  %72 = and i64 %69, -2
  %73 = or i64 %indvars.iv.unr.ph, %72
  %scevgep254 = getelementptr float, float* %scevgep253, i64 %73
  %scevgep257 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %indvars.iv.unr.ph
  %scevgep260 = getelementptr float, float* %scevgep259, i64 %73
  %scevgep263 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %indvars.iv.unr.ph
  %scevgep266 = getelementptr float, float* %scevgep265, i64 %73
  %bound0268 = icmp ult float* %scevgep251, %scevgep260
  %bound1269 = icmp ult float* %scevgep257, %scevgep254
  %found.conflict270 = and i1 %bound0268, %bound1269
  %bound0271 = icmp ult float* %scevgep251, %scevgep266
  %bound1272 = icmp ult float* %scevgep263, %scevgep254
  %found.conflict273 = and i1 %bound0271, %bound1272
  %conflict.rdx274 = or i1 %found.conflict270, %found.conflict273
  %74 = or i64 %indvars.iv.unr.ph, 2
  %75 = shl nuw i64 %70, 1
  %76 = add i64 %74, %75
  %77 = shl nuw nsw i64 %n.mod.vf246, 1
  %ind.end281 = sub i64 %76, %77
  br i1 %conflict.rdx274, label %for.body187.us.preheader294, label %vector.body241.preheader

vector.body241.preheader:                         ; preds = %vector.memcheck276
  br label %vector.body241

vector.body241:                                   ; preds = %vector.body241.preheader, %vector.body241
  %index278 = phi i64 [ %index.next279, %vector.body241 ], [ 0, %vector.body241.preheader ]
  %78 = shl i64 %index278, 1
  %offset.idx283 = or i64 %indvars.iv.unr.ph, %78
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %offset.idx283
  %80 = bitcast float* %79 to <8 x float>*
  %wide.vec287 = load <8 x float>, <8 x float>* %80, align 4, !alias.scope !16
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %offset.idx283
  %82 = bitcast float* %81 to <8 x float>*
  %wide.vec290 = load <8 x float>, <8 x float>* %82, align 4, !alias.scope !19
  %83 = fadd <8 x float> %wide.vec287, %wide.vec290
  %84 = add nuw nsw i64 %offset.idx283, 1
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %84
  %86 = getelementptr float, float* %85, i64 -1
  %87 = bitcast float* %86 to <8 x float>*
  store <8 x float> %83, <8 x float>* %87, align 4, !alias.scope !21, !noalias !23
  %index.next279 = add i64 %index278, 4
  %88 = icmp eq i64 %index.next279, %n.vec247
  br i1 %88, label %middle.block242, label %vector.body241, !llvm.loop !24

middle.block242:                                  ; preds = %vector.body241
  %cmp.n282 = icmp eq i64 %n.mod.vf246, 0
  br i1 %cmp.n282, label %for.inc205.us, label %for.body187.us.preheader294

for.body187.us.preheader294:                      ; preds = %middle.block242, %vector.memcheck276, %min.iters.checked245, %for.body187.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck276 ], [ %indvars.iv.unr.ph, %min.iters.checked245 ], [ %indvars.iv.unr.ph, %for.body187.us.preheader ], [ %ind.end281, %middle.block242 ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.preheader294, %for.body187.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body187.us ], [ %indvars.iv.ph, %for.body187.us.preheader294 ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %indvars.iv
  %89 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %indvars.iv
  %90 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %89, %90
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv144, i64 %indvars.iv.next
  %91 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv144, i64 %indvars.iv.next
  %92 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %91, %92
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv144, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc205.us.loopexit, label %for.body187.us, !llvm.loop !25

for.inc205.us.loopexit:                           ; preds = %for.body187.us
  br label %for.inc205.us

for.inc205.us:                                    ; preds = %for.inc205.us.loopexit, %middle.block242, %for.body187.us.prol.loopexit
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond = icmp eq i64 %indvars.iv.next145, %wide.trip.count146
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.inc205.us
  br label %for.end207

for.end207:                                       ; preds = %for.cond154.preheader.lr.ph.for.end207_crit_edge, %for.cond92.preheader.lr.ph.for.end207_crit_edge, %for.cond62.preheader.lr.ph.for.end207_crit_edge, %for.end207.loopexit, %for.cond31.preheader.lr.ph, %for.cond118.preheader.lr.ph, %for.cond182.preheader
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
  %cmp8 = icmp sgt i32 %w, 0
  %cmp36 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp36
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count16 = zext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.inc10.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.cond2.preheader.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv13, i64 %indvars.iv
  %9 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %9 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
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

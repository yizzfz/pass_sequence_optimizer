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
  %arraydecay = bitcast i8* %call to [2160 x float]*
  %arraydecay4 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4)
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
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
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #5
  call void @free(i8* %call1) #5
  call void @free(i8* %call2) #5
  call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %w, i32 %h, float* %alpha, [2160 x float]* %imgIn, [2160 x float]* %imgOut) unnamed_addr #2 {
entry:
  store float 2.500000e-01, float* %alpha, align 4
  %cmp8 = icmp sgt i32 %w, 0
  %cmp26 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count16 = zext i32 %w to i64
  %min.iters.check = icmp ult i32 %h, 4
  %0 = and i32 %h, 3
  %n.mod.vf = zext i32 %0 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = mul nuw nsw i64 %indvars.iv13, 313
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
  %8 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv13, i64 %index
  %9 = bitcast float* %8 to <4 x float>*
  store <4 x float> %7, <4 x float>* %9, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

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
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv13, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us, !llvm.loop !4

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end9.loopexit, label %for.cond1.preheader.us

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
  %sub15 = fadd float %alpha, -1.000000e+00
  %mul16 = fmul float %sub15, %mul14
  %call18 = tail call float @expf(float %sub) #5
  %mul19 = fmul float %call18, %div
  %add20 = fadd float %alpha, 1.000000e+00
  %mul21 = fmul float %add20, %mul19
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %0 = fmul float %div, %call24
  %mul25 = fsub float -0.000000e+00, %0
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %cmp157 = icmp sgt i32 %w, 0
  br i1 %cmp157, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32152 = icmp sgt i32 %h, 0
  br i1 %cmp32152, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter209 = and i32 %h, 1
  %lcmp.mod210 = icmp eq i32 %xtraiter209, 0
  %1 = icmp eq i32 %h, 1
  %wide.trip.count213 = zext i32 %w to i64
  %wide.trip.count207.1 = zext i32 %h to i64
  %mul37.us.prol = fmul float %mul16, 0.000000e+00
  %mul39.us.prol = fmul float %exp2, 0.000000e+00
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc55_crit_edge.us
  %indvars.iv211 = phi i64 [ %indvars.iv.next212, %for.cond31.for.inc55_crit_edge.us ], [ 0, %for.cond31.preheader.us.preheader ]
  br i1 %lcmp.mod210, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv211, i64 0
  %2 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %2
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv211, i64 0
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  %3 = load float, float* %arrayidx35.us.prol, align 4
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv205.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %xm1.0155.us.unr.ph = phi float [ %3, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  %ym1.0154.us.unr.ph = phi float [ %add42.us.prol, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  br i1 %1, label %for.cond31.for.inc55_crit_edge.us, label %for.body33.us.preheader

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.body33.us
  %indvars.iv205 = phi i64 [ %indvars.iv.next206.1, %for.body33.us ], [ %indvars.iv205.unr.ph, %for.body33.us.preheader ]
  %xm1.0155.us = phi float [ %7, %for.body33.us ], [ %xm1.0155.us.unr.ph, %for.body33.us.preheader ]
  %ym1.0154.us = phi float [ %add42.us.1, %for.body33.us ], [ %ym1.0154.us.unr.ph, %for.body33.us.preheader ]
  %ym2.0153.us = phi float [ %add42.us, %for.body33.us ], [ 0.000000e+00, %for.body33.us.preheader ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv211, i64 %indvars.iv205
  %4 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %4
  %mul37.us = fmul float %mul16, %xm1.0155.us
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %ym1.0154.us
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym2.0153.us, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv211, i64 %indvars.iv205
  store float %add42.us, float* %arrayidx46.us, align 4
  %5 = load float, float* %arrayidx35.us, align 4
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv211, i64 %indvars.iv.next206
  %6 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %6
  %mul37.us.1 = fmul float %mul16, %5
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %ym1.0154.us, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv211, i64 %indvars.iv.next206
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %7 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next206.1 = add nsw i64 %indvars.iv205, 2
  %exitcond208.1 = icmp eq i64 %indvars.iv.next206.1, %wide.trip.count207.1
  br i1 %exitcond208.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.cond31.for.inc55_crit_edge.us.loopexit, %for.body33.us.prol.loopexit
  %indvars.iv.next212 = add nuw nsw i64 %indvars.iv211, 1
  %exitcond214 = icmp eq i64 %indvars.iv.next212, %wide.trip.count213
  br i1 %exitcond214, label %for.cond58.preheader, label %for.cond31.preheader.us

for.cond58.preheader:                             ; preds = %for.cond31.for.inc55_crit_edge.us
  %cmp59150 = icmp sgt i32 %w, 0
  br i1 %cmp59150, label %for.cond62.preheader.lr.ph, label %for.cond115.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader
  %cmp63144 = icmp sgt i32 %h, 0
  br i1 %cmp63144, label %for.cond62.preheader.us.preheader, label %for.end207

for.cond62.preheader.us.preheader:                ; preds = %for.cond62.preheader.lr.ph
  %8 = sext i32 %h to i64
  %wide.trip.count202 = zext i32 %w to i64
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv200 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next201, %for.cond62.for.inc86_crit_edge.us ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.cond62.preheader.us, %for.body64.us
  %indvars.iv198 = phi i64 [ %8, %for.cond62.preheader.us ], [ %indvars.iv.next199, %for.body64.us ]
  %xp1.0148.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %9, %for.body64.us ]
  %xp2.0147.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %xp1.0148.us, %for.body64.us ]
  %yp1.0146.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us ]
  %yp2.0145.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %yp1.0146.us, %for.body64.us ]
  %indvars.iv.next199 = add nsw i64 %indvars.iv198, -1
  %mul65.us = fmul float %mul21, %xp1.0148.us
  %mul66.us = fmul float %xp2.0147.us, %mul25
  %add67.us = fadd float %mul66.us, %mul65.us
  %mul68.us = fmul float %exp2, %yp1.0146.us
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %yp2.0145.us, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv200, i64 %indvars.iv.next199
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv200, i64 %indvars.iv.next199
  %9 = load float, float* %arrayidx79.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv198, 1
  br i1 %cmp63.us, label %for.body64.us, label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next201, %wide.trip.count202
  br i1 %exitcond203, label %for.cond89.preheader, label %for.cond62.preheader.us

for.cond89.preheader:                             ; preds = %for.cond62.for.inc86_crit_edge.us
  %cmp90141 = icmp sgt i32 %w, 0
  br i1 %cmp90141, label %for.cond92.preheader.lr.ph, label %for.cond115.preheader

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  %cmp93139 = icmp sgt i32 %h, 0
  br i1 %cmp93139, label %for.cond92.preheader.us.preheader, label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  %xtraiter191 = and i32 %h, 1
  %lcmp.mod192 = icmp eq i32 %xtraiter191, 0
  %10 = icmp eq i32 %h, 1
  %wide.trip.count195 = zext i32 %w to i64
  %wide.trip.count189.1 = zext i32 %h to i64
  %11 = add nsw i64 %wide.trip.count207.1, -2
  %12 = add nsw i64 %wide.trip.count207.1, -2
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.preheader.us.preheader, %for.cond92.for.inc112_crit_edge.us
  %indvars.iv193 = phi i64 [ %indvars.iv.next194, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep235 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 2
  %scevgep241 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 2
  %scevgep247 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 2
  br i1 %lcmp.mod192, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.cond92.preheader.us
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 0
  %13 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 0
  %14 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %13, %14
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 0
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.cond92.preheader.us
  %indvars.iv187.unr.ph = phi i64 [ 1, %for.body94.us.prol ], [ 0, %for.cond92.preheader.us ]
  br i1 %10, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader

for.body94.us.preheader:                          ; preds = %for.body94.us.prol.loopexit
  %15 = sub nsw i64 %11, %indvars.iv187.unr.ph
  %16 = lshr i64 %15, 1
  %17 = add nuw i64 %16, 1
  %min.iters.check = icmp ult i64 %17, 4
  br i1 %min.iters.check, label %for.body94.us.preheader311, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body94.us.preheader
  %n.mod.vf = and i64 %17, 3
  %n.vec = sub i64 %17, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body94.us.preheader311, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep233 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 %indvars.iv187.unr.ph
  %18 = sub nsw i64 %12, %indvars.iv187.unr.ph
  %19 = and i64 %18, -2
  %20 = or i64 %indvars.iv187.unr.ph, %19
  %scevgep236 = getelementptr float, float* %scevgep235, i64 %20
  %scevgep239 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 %indvars.iv187.unr.ph
  %scevgep242 = getelementptr float, float* %scevgep241, i64 %20
  %scevgep245 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 %indvars.iv187.unr.ph
  %scevgep248 = getelementptr float, float* %scevgep247, i64 %20
  %bound0 = icmp ult float* %scevgep233, %scevgep242
  %bound1 = icmp ult float* %scevgep239, %scevgep236
  %found.conflict = and i1 %bound0, %bound1
  %bound0250 = icmp ult float* %scevgep233, %scevgep248
  %bound1251 = icmp ult float* %scevgep245, %scevgep236
  %found.conflict252 = and i1 %bound0250, %bound1251
  %conflict.rdx = or i1 %found.conflict, %found.conflict252
  %21 = or i64 %indvars.iv187.unr.ph, 2
  %22 = shl nuw i64 %16, 1
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %23, %24
  br i1 %conflict.rdx, label %for.body94.us.preheader311, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %25 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv187.unr.ph, %25
  %26 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 %offset.idx
  %27 = bitcast float* %26 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %27, align 4, !alias.scope !6
  %28 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 %offset.idx
  %29 = bitcast float* %28 to <8 x float>*
  %wide.vec254 = load <8 x float>, <8 x float>* %29, align 4, !alias.scope !9
  %30 = fadd <8 x float> %wide.vec, %wide.vec254
  %31 = shufflevector <8 x float> %30, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %32 = add nuw nsw i64 %offset.idx, 1
  %33 = fadd <8 x float> %wide.vec, %wide.vec254
  %34 = shufflevector <8 x float> %33, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 %32
  %36 = getelementptr float, float* %35, i64 -1
  %37 = bitcast float* %36 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %31, <4 x float> %34, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %37, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %38 = icmp eq i64 %index.next, %n.vec
  br i1 %38, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader311

for.body94.us.preheader311:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body94.us.preheader
  %indvars.iv187.ph = phi i64 [ %indvars.iv187.unr.ph, %vector.memcheck ], [ %indvars.iv187.unr.ph, %min.iters.checked ], [ %indvars.iv187.unr.ph, %for.body94.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.preheader311, %for.body94.us
  %indvars.iv187 = phi i64 [ %indvars.iv.next188.1, %for.body94.us ], [ %indvars.iv187.ph, %for.body94.us.preheader311 ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 %indvars.iv187
  %39 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 %indvars.iv187
  %40 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %39, %40
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 %indvars.iv187
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv193, i64 %indvars.iv.next188
  %41 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv193, i64 %indvars.iv.next188
  %42 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %41, %42
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv193, i64 %indvars.iv.next188
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next188.1 = add nsw i64 %indvars.iv187, 2
  %exitcond190.1 = icmp eq i64 %indvars.iv.next188.1, %wide.trip.count189.1
  br i1 %exitcond190.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us, !llvm.loop !15

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.cond92.for.inc112_crit_edge.us.loopexit, %middle.block, %for.body94.us.prol.loopexit
  %indvars.iv.next194 = add nuw nsw i64 %indvars.iv193, 1
  %exitcond196 = icmp eq i64 %indvars.iv.next194, %wide.trip.count195
  br i1 %exitcond196, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %entry, %for.cond58.preheader, %for.cond89.preheader
  %cmp116137 = icmp sgt i32 %h, 0
  br i1 %cmp116137, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %cmp119132 = icmp sgt i32 %w, 0
  br i1 %cmp119132, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %xtraiter180 = and i32 %w, 1
  %lcmp.mod181 = icmp eq i32 %xtraiter180, 0
  %43 = icmp eq i32 %w, 1
  %wide.trip.count184 = zext i32 %h to i64
  %wide.trip.count178.1 = zext i32 %w to i64
  %mul126.us.prol = fmul float %mul16, 0.000000e+00
  %mul128.us.prol = fmul float %exp2, 0.000000e+00
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.preheader.us.preheader, %for.cond118.for.inc147_crit_edge.us
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  br i1 %lcmp.mod181, label %for.body120.us.prol.loopexit, label %for.body120.us.prol

for.body120.us.prol:                              ; preds = %for.cond118.preheader.us
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv182
  %44 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %44
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv182
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  %45 = load float, float* %arrayidx124.us.prol, align 4
  br label %for.body120.us.prol.loopexit

for.body120.us.prol.loopexit:                     ; preds = %for.body120.us.prol, %for.cond118.preheader.us
  %indvars.iv176.unr.ph = phi i64 [ 1, %for.body120.us.prol ], [ 0, %for.cond118.preheader.us ]
  %tm1.0135.us.unr.ph = phi float [ %45, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  %ym1.1134.us.unr.ph = phi float [ %add131.us.prol, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  br i1 %43, label %for.cond118.for.inc147_crit_edge.us, label %for.body120.us.preheader

for.body120.us.preheader:                         ; preds = %for.body120.us.prol.loopexit
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us.preheader, %for.body120.us
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %for.body120.us ], [ %indvars.iv176.unr.ph, %for.body120.us.preheader ]
  %tm1.0135.us = phi float [ %49, %for.body120.us ], [ %tm1.0135.us.unr.ph, %for.body120.us.preheader ]
  %ym1.1134.us = phi float [ %add131.us.1, %for.body120.us ], [ %ym1.1134.us.unr.ph, %for.body120.us.preheader ]
  %ym2.1133.us = phi float [ %add131.us, %for.body120.us ], [ 0.000000e+00, %for.body120.us.preheader ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv176, i64 %indvars.iv182
  %46 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %46
  %mul126.us = fmul float %mul16, %tm1.0135.us
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %ym1.1134.us
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym2.1133.us, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv176, i64 %indvars.iv182
  store float %add131.us, float* %arrayidx135.us, align 4
  %47 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next177, i64 %indvars.iv182
  %48 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %48
  %mul126.us.1 = fmul float %mul16, %47
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %ym1.1134.us, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next177, i64 %indvars.iv182
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %49 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, %wide.trip.count178.1
  br i1 %exitcond179.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.cond118.for.inc147_crit_edge.us.loopexit, %for.body120.us.prol.loopexit
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond185 = icmp eq i64 %indvars.iv.next183, %wide.trip.count184
  br i1 %exitcond185, label %for.cond150.preheader, label %for.cond118.preheader.us

for.cond150.preheader:                            ; preds = %for.cond118.for.inc147_crit_edge.us
  %cmp151130 = icmp sgt i32 %h, 0
  br i1 %cmp151130, label %for.cond154.preheader.lr.ph, label %for.cond182.preheader

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader
  %cmp155124 = icmp sgt i32 %w, 0
  br i1 %cmp155124, label %for.cond154.preheader.us.preheader, label %for.end207

for.cond154.preheader.us.preheader:               ; preds = %for.cond154.preheader.lr.ph
  %50 = sext i32 %w to i64
  %wide.trip.count173 = zext i32 %h to i64
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv171 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next172, %for.cond154.for.inc179_crit_edge.us ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.cond154.preheader.us, %for.body156.us
  %indvars.iv169 = phi i64 [ %50, %for.cond154.preheader.us ], [ %indvars.iv.next170, %for.body156.us ]
  %tp1.0128.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %51, %for.body156.us ]
  %tp2.0127.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %tp1.0128.us, %for.body156.us ]
  %yp1.1126.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us ]
  %yp2.1125.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %yp1.1126.us, %for.body156.us ]
  %indvars.iv.next170 = add nsw i64 %indvars.iv169, -1
  %mul157.us = fmul float %mul21, %tp1.0128.us
  %mul158.us = fmul float %tp2.0127.us, %mul25
  %add159.us = fadd float %mul158.us, %mul157.us
  %mul160.us = fmul float %exp2, %yp1.1126.us
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %yp2.1125.us, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next170, i64 %indvars.iv171
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next170, i64 %indvars.iv171
  %51 = load float, float* %arrayidx171.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv169, 1
  br i1 %cmp155.us, label %for.body156.us, label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, %wide.trip.count173
  br i1 %exitcond174, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond115.preheader, %for.cond150.preheader
  %cmp183121 = icmp sgt i32 %w, 0
  %cmp186119 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp183121, %cmp186119
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %xtraiter = and i32 %h, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %52 = icmp eq i32 %h, 1
  %wide.trip.count167 = zext i32 %w to i64
  %wide.trip.count.1 = zext i32 %h to i64
  %53 = add nsw i64 %wide.trip.count.1, -2
  %54 = add nsw i64 %wide.trip.count.1, -2
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.preheader.us.preheader, %for.cond185.for.inc205_crit_edge.us
  %indvars.iv165 = phi i64 [ %indvars.iv.next166, %for.cond185.for.inc205_crit_edge.us ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep269 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 2
  %scevgep275 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 2
  %scevgep281 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 2
  br i1 %lcmp.mod, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.cond185.preheader.us
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 0
  %55 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 0
  %56 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %55, %56
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 0
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.cond185.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body187.us.prol ], [ 0, %for.cond185.preheader.us ]
  br i1 %52, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader

for.body187.us.preheader:                         ; preds = %for.body187.us.prol.loopexit
  %57 = sub nsw i64 %53, %indvars.iv.unr.ph
  %58 = lshr i64 %57, 1
  %59 = add nuw i64 %58, 1
  %min.iters.check260 = icmp ult i64 %59, 4
  br i1 %min.iters.check260, label %for.body187.us.preheader310, label %min.iters.checked261

min.iters.checked261:                             ; preds = %for.body187.us.preheader
  %n.mod.vf262 = and i64 %59, 3
  %n.vec263 = sub i64 %59, %n.mod.vf262
  %cmp.zero264 = icmp eq i64 %n.vec263, 0
  br i1 %cmp.zero264, label %for.body187.us.preheader310, label %vector.memcheck292

vector.memcheck292:                               ; preds = %min.iters.checked261
  %scevgep267 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.unr.ph
  %60 = sub nsw i64 %54, %indvars.iv.unr.ph
  %61 = and i64 %60, -2
  %62 = or i64 %indvars.iv.unr.ph, %61
  %scevgep270 = getelementptr float, float* %scevgep269, i64 %62
  %scevgep273 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.unr.ph
  %scevgep276 = getelementptr float, float* %scevgep275, i64 %62
  %scevgep279 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.unr.ph
  %scevgep282 = getelementptr float, float* %scevgep281, i64 %62
  %bound0284 = icmp ult float* %scevgep267, %scevgep276
  %bound1285 = icmp ult float* %scevgep273, %scevgep270
  %found.conflict286 = and i1 %bound0284, %bound1285
  %bound0287 = icmp ult float* %scevgep267, %scevgep282
  %bound1288 = icmp ult float* %scevgep279, %scevgep270
  %found.conflict289 = and i1 %bound0287, %bound1288
  %conflict.rdx290 = or i1 %found.conflict286, %found.conflict289
  %63 = or i64 %indvars.iv.unr.ph, 2
  %64 = shl nuw i64 %58, 1
  %65 = add i64 %63, %64
  %66 = shl nuw nsw i64 %n.mod.vf262, 1
  %ind.end297 = sub i64 %65, %66
  br i1 %conflict.rdx290, label %for.body187.us.preheader310, label %vector.body257.preheader

vector.body257.preheader:                         ; preds = %vector.memcheck292
  br label %vector.body257

vector.body257:                                   ; preds = %vector.body257.preheader, %vector.body257
  %index294 = phi i64 [ %index.next295, %vector.body257 ], [ 0, %vector.body257.preheader ]
  %67 = shl i64 %index294, 1
  %offset.idx299 = or i64 %indvars.iv.unr.ph, %67
  %68 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %offset.idx299
  %69 = bitcast float* %68 to <8 x float>*
  %wide.vec303 = load <8 x float>, <8 x float>* %69, align 4, !alias.scope !16
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %offset.idx299
  %71 = bitcast float* %70 to <8 x float>*
  %wide.vec306 = load <8 x float>, <8 x float>* %71, align 4, !alias.scope !19
  %72 = fadd <8 x float> %wide.vec303, %wide.vec306
  %73 = shufflevector <8 x float> %72, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %74 = add nuw nsw i64 %offset.idx299, 1
  %75 = fadd <8 x float> %wide.vec303, %wide.vec306
  %76 = shufflevector <8 x float> %75, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %74
  %78 = getelementptr float, float* %77, i64 -1
  %79 = bitcast float* %78 to <8 x float>*
  %interleaved.vec309 = shufflevector <4 x float> %73, <4 x float> %76, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec309, <8 x float>* %79, align 4, !alias.scope !21, !noalias !23
  %index.next295 = add i64 %index294, 4
  %80 = icmp eq i64 %index.next295, %n.vec263
  br i1 %80, label %middle.block258, label %vector.body257, !llvm.loop !24

middle.block258:                                  ; preds = %vector.body257
  %cmp.n298 = icmp eq i64 %n.mod.vf262, 0
  br i1 %cmp.n298, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader310

for.body187.us.preheader310:                      ; preds = %middle.block258, %vector.memcheck292, %min.iters.checked261, %for.body187.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck292 ], [ %indvars.iv.unr.ph, %min.iters.checked261 ], [ %indvars.iv.unr.ph, %for.body187.us.preheader ], [ %ind.end297, %middle.block258 ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.preheader310, %for.body187.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body187.us ], [ %indvars.iv.ph, %for.body187.us.preheader310 ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv
  %81 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv
  %82 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %81, %82
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv165, i64 %indvars.iv.next
  %83 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv165, i64 %indvars.iv.next
  %84 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %83, %84
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv165, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us, !llvm.loop !25

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.cond185.for.inc205_crit_edge.us.loopexit, %middle.block258, %for.body187.us.prol.loopexit
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %exitcond = icmp eq i64 %indvars.iv.next166, %wide.trip.count167
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.preheader.us

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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp9 = icmp sgt i32 %w, 0
  %cmp37 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp9, %cmp37
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count16 = zext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv13, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
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
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
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

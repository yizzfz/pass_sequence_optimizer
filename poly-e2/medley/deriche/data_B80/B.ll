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
  call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay4, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  %0 = sext i32 %w to i64
  %cmp3 = icmp sgt i32 %w, 0
  %cmp21 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp3, %cmp21
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %entry.for.end9_crit_edge

entry.for.end9_crit_edge:                         ; preds = %entry
  br label %for.end9

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %1 = sext i32 %h to i64
  %2 = add nsw i64 %1, -1
  %min.iters.check = icmp ult i32 %h, 4
  %n.vec = and i64 %1, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv94.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv94.us, 313
  br i1 %min.iters.check, label %for.cond1.preheader.us.for.inc.us.preheader_crit_edge, label %min.iters.checked

for.cond1.preheader.us.for.inc.us.preheader_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.inc.us.preheader

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.for.inc.us.preheader_crit_edge, label %vector.ph

min.iters.checked.for.inc.us.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.inc.us.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %4 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %5 = add nuw nsw <4 x i64> %4, %broadcast.splat
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv94.us, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, label %middle.block.for.inc.us.preheader_crit_edge

middle.block.for.inc.us.preheader_crit_edge:      ; preds = %middle.block
  br label %for.inc.us.preheader

middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond1.for.inc7_crit_edge.us

for.inc.us.preheader:                             ; preds = %middle.block.for.inc.us.preheader_crit_edge, %min.iters.checked.for.inc.us.preheader_crit_edge, %for.cond1.preheader.us.for.inc.us.preheader_crit_edge
  %indvars.iv2.us.ph = phi i64 [ %n.vec, %middle.block.for.inc.us.preheader_crit_edge ], [ 0, %min.iters.checked.for.inc.us.preheader_crit_edge ], [ 0, %for.cond1.preheader.us.for.inc.us.preheader_crit_edge ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us.for.inc.us_crit_edge
  %indvars.iv2.us = phi i64 [ %indvars.iv.next.us, %for.inc.us.for.inc.us_crit_edge ], [ %indvars.iv2.us.ph, %for.inc.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv2.us, 991
  %14 = add nuw nsw i64 %13, %3
  %15 = trunc i64 %14 to i32
  %rem.us = srem i32 %15, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv94.us, i64 %indvars.iv2.us
  store float %div.us, float* %arrayidx6.us, align 4
  %exitcond = icmp eq i64 %indvars.iv2.us, %2
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us.for.inc.us_crit_edge, !llvm.loop !4

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv2.us, 1
  br label %for.inc.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, %for.cond1.for.inc7_crit_edge.us.loopexit
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv94.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next10.us, %0
  br i1 %cmp.us, label %for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge, label %for.end9.loopexit

for.cond1.for.inc7_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %entry.for.end9_crit_edge, %for.end9.loopexit
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
  %sub15 = fadd float %alpha, -1.000000e+00
  %mul16 = fmul float %sub15, %mul14
  %call18 = tail call float @expf(float %sub) #5
  %add20 = fadd float %alpha, 1.000000e+00
  %mul23 = fmul float %alpha, -2.000000e+00
  %call24 = tail call float @expf(float %mul23) #5
  %0 = fmul float %div, %call24
  %exp2 = tail call float @llvm.exp2.f32(float %sub)
  %call29 = tail call float @expf(float %mul23) #5
  %sub30 = fsub float -0.000000e+00, %call29
  %1 = sext i32 %h to i64
  %2 = sext i32 %w to i64
  %cmp184 = icmp sgt i32 %w, 0
  br i1 %cmp184, label %for.cond31.preheader.lr.ph, label %for.cond58.preheader.thread210

for.cond58.preheader.thread210:                   ; preds = %entry
  %mul19211 = fmul float %call18, %div
  %mul21212 = fmul float %add20, %mul19211
  %mul25213 = fsub float -0.000000e+00, %0
  br label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %cmp32179 = icmp sgt i32 %h, 0
  br i1 %cmp32179, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.end207_crit_edge

for.cond31.preheader.lr.ph.for.end207_crit_edge:  ; preds = %for.cond31.preheader.lr.ph
  br label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %3 = add nsw i64 %1, -1
  %mul37.us293 = fmul float %mul16, 0.000000e+00
  %mul39.us295 = fmul float %exp2, 0.000000e+00
  %mul41.us297 = fmul float %call29, -0.000000e+00
  %exitcond200300 = icmp eq i64 %3, 0
  %xtraiter374 = and i64 %3, 1
  %lcmp.mod375 = icmp eq i64 %xtraiter374, 0
  %4 = icmp eq i32 %h, 2
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge, %for.cond31.preheader.us.preheader
  %indvars.iv139185.us = phi i64 [ 0, %for.cond31.preheader.us.preheader ], [ %indvars.iv.next140.us, %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge ]
  %arrayidx35.us291 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 0
  %5 = load float, float* %arrayidx35.us291, align 4
  %mul36.us292 = fmul float %div, %5
  %add38.us294 = fadd float %mul37.us293, %mul36.us292
  %add40.us296 = fadd float %mul39.us295, %add38.us294
  %add42.us298 = fadd float %mul41.us297, %add40.us296
  %arrayidx46.us299 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 0
  store float %add42.us298, float* %arrayidx46.us299, align 4
  br i1 %exitcond200300, label %for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.inc.us.for.inc.us_crit_edge.preheader

for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.cond31.preheader.us
  br label %for.cond31.for.inc55_crit_edge.us

for.inc.us.for.inc.us_crit_edge.preheader:        ; preds = %for.cond31.preheader.us
  br i1 %lcmp.mod375, label %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge, label %for.inc.us.for.inc.us_crit_edge.prol

for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge: ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol:             ; preds = %for.inc.us.for.inc.us_crit_edge.preheader
  %6 = load float, float* %arrayidx35.us291, align 4
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 1
  %7 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %7
  %mul37.us.prol = fmul float %mul16, %6
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %mul39.us.prol = fmul float %exp2, %add42.us298
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 1
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  br label %for.inc.us.for.inc.us_crit_edge.prol.loopexit

for.inc.us.for.inc.us_crit_edge.prol.loopexit:    ; preds = %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge, %for.inc.us.for.inc.us_crit_edge.prol
  %add42.us304.unr.ph = phi float [ %add42.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %add42.us298, %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge ]
  %arrayidx35.us303.unr.ph = phi float* [ %arrayidx35.us.prol, %for.inc.us.for.inc.us_crit_edge.prol ], [ %arrayidx35.us291, %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge ]
  %indvars.iv137180.us302.unr.ph = phi i64 [ 1, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0, %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge ]
  %ym1.0182.us301.unr.ph = phi float [ %add42.us298, %for.inc.us.for.inc.us_crit_edge.prol ], [ 0.000000e+00, %for.inc.us.for.inc.us_crit_edge.preheader.for.inc.us.for.inc.us_crit_edge.prol.loopexit_crit_edge ]
  br i1 %4, label %for.inc.us.for.inc.us_crit_edge.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.inc.us.for.inc.us_crit_edge.preheader.new

for.inc.us.for.inc.us_crit_edge.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.cond31.for.inc55_crit_edge.us

for.inc.us.for.inc.us_crit_edge.preheader.new:    ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit
  br label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge, %for.inc.us.for.inc.us_crit_edge.preheader.new
  %add42.us304 = phi float [ %add42.us304.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us.1, %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge ]
  %arrayidx35.us303 = phi float* [ %arrayidx35.us303.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %arrayidx35.us.1, %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge ]
  %indvars.iv137180.us302 = phi i64 [ %indvars.iv137180.us302.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %indvars.iv.next138.us.1, %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge ]
  %ym1.0182.us301 = phi float [ %ym1.0182.us301.unr.ph, %for.inc.us.for.inc.us_crit_edge.preheader.new ], [ %add42.us, %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge ]
  %indvars.iv.next138.us = add nuw nsw i64 %indvars.iv137180.us302, 1
  %8 = load float, float* %arrayidx35.us303, align 4
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us
  %9 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %9
  %mul37.us = fmul float %mul16, %8
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %add42.us304
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym1.0182.us301, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us
  store float %add42.us, float* %arrayidx46.us, align 4
  %indvars.iv.next138.us.1 = add nsw i64 %indvars.iv137180.us302, 2
  %10 = load float, float* %arrayidx35.us, align 4
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us.1
  %11 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %11
  %mul37.us.1 = fmul float %mul16, %10
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %add42.us304, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv139185.us, i64 %indvars.iv.next138.us.1
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %exitcond200.1 = icmp eq i64 %indvars.iv.next138.us.1, %3
  br i1 %exitcond200.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge

for.inc.us.for.inc.us_crit_edge.for.inc.us.for.inc.us_crit_edge_crit_edge: ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.inc.us.for.inc.us_crit_edge

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.inc.us.for.inc.us_crit_edge
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.inc.us.for.inc.us_crit_edge.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, %for.cond31.preheader.us.for.cond31.for.inc55_crit_edge.us_crit_edge, %for.cond31.for.inc55_crit_edge.us.loopexit
  %indvars.iv.next140.us = add nuw nsw i64 %indvars.iv139185.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next140.us, %2
  br i1 %cmp.us, label %for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge, label %for.cond62.preheader.us.preheader

for.cond31.for.inc55_crit_edge.us.for.cond31.preheader.us_crit_edge: ; preds = %for.cond31.for.inc55_crit_edge.us
  br label %for.cond31.preheader.us

for.cond62.preheader.us.preheader:                ; preds = %for.cond31.for.inc55_crit_edge.us
  %mul19 = fmul float %call18, %div
  %mul21 = fmul float %add20, %mul19
  %mul25 = fsub float -0.000000e+00, %0
  %indvars.iv.next134175.us277 = add nsw i64 %1, -1
  %mul65.us278 = fmul float %mul21, 0.000000e+00
  %mul66.us279 = fmul float %0, -0.000000e+00
  %add67.us280 = fadd float %mul66.us279, %mul65.us278
  %mul68.us281 = fmul float %exp2, 0.000000e+00
  %add69.us282 = fadd float %mul68.us281, %add67.us280
  %mul70.us283 = fmul float %call29, -0.000000e+00
  %add71.us284 = fadd float %mul70.us283, %add69.us282
  %cmp63.us286 = icmp sgt i32 %h, 1
  %xtraiter372 = and i64 %3, 1
  %lcmp.mod373 = icmp eq i64 %xtraiter372, 0
  %12 = icmp eq i32 %h, 2
  %indvars.iv.next134175.us.prol = add nsw i64 %1, -2
  %mul66.us.prol = fmul float %0, -0.000000e+00
  %mul68.us.prol = fmul float %exp2, %add71.us284
  %mul70.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge, %for.cond62.preheader.us.preheader
  %indvars.iv135177.us = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next136.us, %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge ]
  %arrayidx75.us285 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us277
  store float %add71.us284, float* %arrayidx75.us285, align 4
  br i1 %cmp63.us286, label %for.inc84.us.for.inc84.us_crit_edge.preheader, label %for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge

for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge: ; preds = %for.cond62.preheader.us
  br label %for.cond62.for.inc86_crit_edge.us

for.inc84.us.for.inc84.us_crit_edge.preheader:    ; preds = %for.cond62.preheader.us
  br i1 %lcmp.mod373, label %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge, label %for.inc84.us.for.inc84.us_crit_edge.prol

for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge: ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader
  br label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol:         ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader
  %arrayidx79.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us277
  %13 = load float, float* %arrayidx79.us.prol, align 4
  %mul65.us.prol = fmul float %mul21, %13
  %add67.us.prol = fadd float %mul66.us.prol, %mul65.us.prol
  %add69.us.prol = fadd float %mul68.us.prol, %add67.us.prol
  %add71.us.prol = fadd float %mul70.us.prol, %add69.us.prol
  %arrayidx75.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us.prol
  store float %add71.us.prol, float* %arrayidx75.us.prol, align 4
  br label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit

for.inc84.us.for.inc84.us_crit_edge.prol.loopexit: ; preds = %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge, %for.inc84.us.for.inc84.us_crit_edge.prol
  %add71.us290.unr.ph = phi float [ %add71.us.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %add71.us284, %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge ]
  %indvars.iv.next134175.us289.unr.ph = phi i64 [ %indvars.iv.next134175.us.prol, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ %indvars.iv.next134175.us277, %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge ]
  %yp1.0172.us288.unr.ph = phi float [ %add71.us284, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge ]
  %xp1.0174.us287.unr.ph = phi float [ %13, %for.inc84.us.for.inc84.us_crit_edge.prol ], [ 0.000000e+00, %for.inc84.us.for.inc84.us_crit_edge.preheader.for.inc84.us.for.inc84.us_crit_edge.prol.loopexit_crit_edge ]
  br i1 %12, label %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit.for.cond62.for.inc86_crit_edge.us_crit_edge, label %for.inc84.us.for.inc84.us_crit_edge.preheader.new

for.inc84.us.for.inc84.us_crit_edge.prol.loopexit.for.cond62.for.inc86_crit_edge.us_crit_edge: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit
  br label %for.cond62.for.inc86_crit_edge.us

for.inc84.us.for.inc84.us_crit_edge.preheader.new: ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit
  br label %for.inc84.us.for.inc84.us_crit_edge

for.inc84.us.for.inc84.us_crit_edge:              ; preds = %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge, %for.inc84.us.for.inc84.us_crit_edge.preheader.new
  %add71.us290 = phi float [ %add71.us290.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us.1, %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge ]
  %indvars.iv.next134175.us289 = phi i64 [ %indvars.iv.next134175.us289.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %indvars.iv.next134175.us.1, %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge ]
  %yp1.0172.us288 = phi float [ %yp1.0172.us288.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %add71.us, %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge ]
  %xp1.0174.us287 = phi float [ %xp1.0174.us287.unr.ph, %for.inc84.us.for.inc84.us_crit_edge.preheader.new ], [ %15, %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge ]
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us289
  %14 = load float, float* %arrayidx79.us, align 4
  %indvars.iv.next134175.us = add nsw i64 %indvars.iv.next134175.us289, -1
  %mul65.us = fmul float %mul21, %14
  %mul66.us = fmul float %xp1.0174.us287, %mul25
  %add67.us = fadd float %mul66.us, %mul65.us
  %mul68.us = fmul float %exp2, %add71.us290
  %add69.us = fadd float %mul68.us, %add67.us
  %mul70.us = fmul float %yp1.0172.us288, %sub30
  %add71.us = fadd float %mul70.us, %add69.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us
  %15 = load float, float* %arrayidx79.us.1, align 4
  %indvars.iv.next134175.us.1 = add nsw i64 %indvars.iv.next134175.us289, -2
  %mul65.us.1 = fmul float %mul21, %15
  %mul66.us.1 = fmul float %14, %mul25
  %add67.us.1 = fadd float %mul66.us.1, %mul65.us.1
  %mul68.us.1 = fmul float %exp2, %add71.us
  %add69.us.1 = fadd float %mul68.us.1, %add67.us.1
  %mul70.us.1 = fmul float %add71.us290, %sub30
  %add71.us.1 = fadd float %mul70.us.1, %add69.us.1
  %arrayidx75.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv135177.us, i64 %indvars.iv.next134175.us.1
  store float %add71.us.1, float* %arrayidx75.us.1, align 4
  %cmp63.us.1 = icmp sgt i64 %indvars.iv.next134175.us, 1
  br i1 %cmp63.us.1, label %for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge, label %for.cond62.for.inc86_crit_edge.us.loopexit

for.inc84.us.for.inc84.us_crit_edge.for.inc84.us.for.inc84.us_crit_edge_crit_edge: ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.inc84.us.for.inc84.us_crit_edge

for.cond62.for.inc86_crit_edge.us.loopexit:       ; preds = %for.inc84.us.for.inc84.us_crit_edge
  br label %for.cond62.for.inc86_crit_edge.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.inc84.us.for.inc84.us_crit_edge.prol.loopexit.for.cond62.for.inc86_crit_edge.us_crit_edge, %for.cond62.preheader.us.for.cond62.for.inc86_crit_edge.us_crit_edge, %for.cond62.for.inc86_crit_edge.us.loopexit
  %indvars.iv.next136.us = add nuw nsw i64 %indvars.iv135177.us, 1
  %cmp59.us = icmp slt i64 %indvars.iv.next136.us, %2
  br i1 %cmp59.us, label %for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge, label %for.cond92.preheader.us.preheader

for.cond62.for.inc86_crit_edge.us.for.cond62.preheader.us_crit_edge: ; preds = %for.cond62.for.inc86_crit_edge.us
  br label %for.cond62.preheader.us

for.cond92.preheader.us.preheader:                ; preds = %for.cond62.for.inc86_crit_edge.us
  %16 = add nsw i64 %1, -8
  %17 = lshr i64 %16, 3
  %min.iters.check = icmp ult i32 %h, 8
  %n.vec = and i64 %1, -8
  %cmp.zero = icmp eq i64 %n.vec, 0
  %18 = and i64 %17, 1
  %lcmp.mod371 = icmp eq i64 %18, 0
  %19 = icmp eq i64 %17, 0
  %cmp.n = icmp eq i64 %1, %n.vec
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge, %for.cond92.preheader.us.preheader
  %indvars.iv131167.us = phi i64 [ %indvars.iv.next132.us, %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 0
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %1
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 0
  %scevgep310 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %1
  %scevgep312 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 0
  %scevgep314 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %1
  br i1 %min.iters.check, label %for.cond92.preheader.us.for.inc109.us.preheader_crit_edge, label %min.iters.checked

for.cond92.preheader.us.for.inc109.us.preheader_crit_edge: ; preds = %for.cond92.preheader.us
  br label %for.inc109.us.preheader

min.iters.checked:                                ; preds = %for.cond92.preheader.us
  br i1 %cmp.zero, label %min.iters.checked.for.inc109.us.preheader_crit_edge, label %vector.memcheck

min.iters.checked.for.inc109.us.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.inc109.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep310
  %bound1 = icmp ult float* %scevgep308, %scevgep306
  %found.conflict = and i1 %bound0, %bound1
  %bound0316 = icmp ult float* %scevgep, %scevgep314
  %bound1317 = icmp ult float* %scevgep312, %scevgep306
  %found.conflict318 = and i1 %bound0316, %bound1317
  %conflict.rdx = or i1 %found.conflict, %found.conflict318
  br i1 %conflict.rdx, label %vector.memcheck.for.inc109.us.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.for.inc109.us.preheader_crit_edge: ; preds = %vector.memcheck
  br label %for.inc109.us.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod371, label %vector.body.prol, label %vector.body.preheader.vector.body.prol.loopexit_crit_edge

vector.body.preheader.vector.body.prol.loopexit_crit_edge: ; preds = %vector.body.preheader
  br label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.body.preheader
  %20 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 0
  %21 = bitcast float* %20 to <4 x float>*
  %wide.load.prol = load <4 x float>, <4 x float>* %21, align 4, !alias.scope !6
  %22 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 4
  %23 = bitcast float* %22 to <4 x float>*
  %wide.load320.prol = load <4 x float>, <4 x float>* %23, align 4, !alias.scope !6
  %24 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 0
  %25 = bitcast float* %24 to <4 x float>*
  %wide.load321.prol = load <4 x float>, <4 x float>* %25, align 4, !alias.scope !9
  %26 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 4
  %27 = bitcast float* %26 to <4 x float>*
  %wide.load322.prol = load <4 x float>, <4 x float>* %27, align 4, !alias.scope !9
  %28 = fadd <4 x float> %wide.load.prol, %wide.load321.prol
  %29 = fadd <4 x float> %wide.load320.prol, %wide.load322.prol
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 0
  %31 = bitcast float* %30 to <4 x float>*
  store <4 x float> %28, <4 x float>* %31, align 4, !alias.scope !11, !noalias !13
  %32 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 4
  %33 = bitcast float* %32 to <4 x float>*
  store <4 x float> %29, <4 x float>* %33, align 4, !alias.scope !11, !noalias !13
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader.vector.body.prol.loopexit_crit_edge, %vector.body.prol
  %index.unr.ph = phi i64 [ 8, %vector.body.prol ], [ 0, %vector.body.preheader.vector.body.prol.loopexit_crit_edge ]
  br i1 %19, label %vector.body.prol.loopexit.middle.block_crit_edge, label %vector.body.preheader.new

vector.body.prol.loopexit.middle.block_crit_edge: ; preds = %vector.body.prol.loopexit
  br label %middle.block

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader.new
  %index = phi i64 [ %index.unr.ph, %vector.body.preheader.new ], [ %index.next.1, %vector.body.vector.body_crit_edge ]
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %index
  %35 = bitcast float* %34 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %35, align 4, !alias.scope !6
  %36 = getelementptr float, float* %34, i64 4
  %37 = bitcast float* %36 to <4 x float>*
  %wide.load320 = load <4 x float>, <4 x float>* %37, align 4, !alias.scope !6
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %index
  %39 = bitcast float* %38 to <4 x float>*
  %wide.load321 = load <4 x float>, <4 x float>* %39, align 4, !alias.scope !9
  %40 = getelementptr float, float* %38, i64 4
  %41 = bitcast float* %40 to <4 x float>*
  %wide.load322 = load <4 x float>, <4 x float>* %41, align 4, !alias.scope !9
  %42 = fadd <4 x float> %wide.load, %wide.load321
  %43 = fadd <4 x float> %wide.load320, %wide.load322
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %index
  %45 = bitcast float* %44 to <4 x float>*
  store <4 x float> %42, <4 x float>* %45, align 4, !alias.scope !11, !noalias !13
  %46 = getelementptr float, float* %44, i64 4
  %47 = bitcast float* %46 to <4 x float>*
  store <4 x float> %43, <4 x float>* %47, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 8
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %index.next
  %49 = bitcast float* %48 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %49, align 4, !alias.scope !6
  %50 = getelementptr float, float* %48, i64 4
  %51 = bitcast float* %50 to <4 x float>*
  %wide.load320.1 = load <4 x float>, <4 x float>* %51, align 4, !alias.scope !6
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %index.next
  %53 = bitcast float* %52 to <4 x float>*
  %wide.load321.1 = load <4 x float>, <4 x float>* %53, align 4, !alias.scope !9
  %54 = getelementptr float, float* %52, i64 4
  %55 = bitcast float* %54 to <4 x float>*
  %wide.load322.1 = load <4 x float>, <4 x float>* %55, align 4, !alias.scope !9
  %56 = fadd <4 x float> %wide.load.1, %wide.load321.1
  %57 = fadd <4 x float> %wide.load320.1, %wide.load322.1
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %index.next
  %59 = bitcast float* %58 to <4 x float>*
  store <4 x float> %56, <4 x float>* %59, align 4, !alias.scope !11, !noalias !13
  %60 = getelementptr float, float* %58, i64 4
  %61 = bitcast float* %60 to <4 x float>*
  store <4 x float> %57, <4 x float>* %61, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add i64 %index, 16
  %62 = icmp eq i64 %index.next.1, %n.vec
  br i1 %62, label %middle.block.loopexit, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit.middle.block_crit_edge, %middle.block.loopexit
  br i1 %cmp.n, label %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge, label %middle.block.for.inc109.us.preheader_crit_edge

middle.block.for.inc109.us.preheader_crit_edge:   ; preds = %middle.block
  br label %for.inc109.us.preheader

middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond92.for.inc112_crit_edge.us

for.inc109.us.preheader:                          ; preds = %middle.block.for.inc109.us.preheader_crit_edge, %vector.memcheck.for.inc109.us.preheader_crit_edge, %min.iters.checked.for.inc109.us.preheader_crit_edge, %for.cond92.preheader.us.for.inc109.us.preheader_crit_edge
  %indvars.iv129165.us.ph = phi i64 [ %n.vec, %middle.block.for.inc109.us.preheader_crit_edge ], [ 0, %vector.memcheck.for.inc109.us.preheader_crit_edge ], [ 0, %min.iters.checked.for.inc109.us.preheader_crit_edge ], [ 0, %for.cond92.preheader.us.for.inc109.us.preheader_crit_edge ]
  br label %for.inc109.us

for.inc109.us:                                    ; preds = %for.inc109.us.preheader, %for.inc109.us.for.inc109.us_crit_edge
  %indvars.iv129165.us = phi i64 [ %indvars.iv.next130.us, %for.inc109.us.for.inc109.us_crit_edge ], [ %indvars.iv129165.us.ph, %for.inc109.us.preheader ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  %63 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  %64 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %63, %64
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv131167.us, i64 %indvars.iv129165.us
  store float %add103.us, float* %arrayidx108.us, align 4
  %exitcond197 = icmp eq i64 %indvars.iv129165.us, %3
  br i1 %exitcond197, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.inc109.us.for.inc109.us_crit_edge, !llvm.loop !15

for.inc109.us.for.inc109.us_crit_edge:            ; preds = %for.inc109.us
  %indvars.iv.next130.us = add nuw nsw i64 %indvars.iv129165.us, 1
  br label %for.inc109.us

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.inc109.us
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %middle.block.for.cond92.for.inc112_crit_edge.us_crit_edge, %for.cond92.for.inc112_crit_edge.us.loopexit
  %indvars.iv.next132.us = add nuw nsw i64 %indvars.iv131167.us, 1
  %cmp90.us = icmp slt i64 %indvars.iv.next132.us, %2
  br i1 %cmp90.us, label %for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge, label %for.cond115.preheader.loopexit

for.cond92.for.inc112_crit_edge.us.for.cond92.preheader.us_crit_edge: ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %for.cond58.preheader.thread210
  %mul21206223 = phi float [ %mul21212, %for.cond58.preheader.thread210 ], [ %mul21, %for.cond115.preheader.loopexit ]
  %mul25208221 = phi float [ %mul25213, %for.cond58.preheader.thread210 ], [ %mul25, %for.cond115.preheader.loopexit ]
  %cmp116161 = icmp sgt i32 %h, 0
  br i1 %cmp116161, label %for.cond118.preheader.lr.ph, label %for.cond115.preheader.for.cond182.preheader_crit_edge

for.cond115.preheader.for.cond182.preheader_crit_edge: ; preds = %for.cond115.preheader
  br label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %65 = icmp sgt i32 %w, 0
  br i1 %65, label %for.cond118.preheader.us.preheader, label %for.cond118.preheader.lr.ph.for.end207_crit_edge

for.cond118.preheader.lr.ph.for.end207_crit_edge: ; preds = %for.cond118.preheader.lr.ph
  br label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %66 = add nsw i64 %2, -1
  %mul126.us265 = fmul float %mul16, 0.000000e+00
  %mul128.us267 = fmul float %exp2, 0.000000e+00
  %mul130.us269 = fmul float %call29, -0.000000e+00
  %exitcond195272 = icmp eq i64 %66, 0
  %xtraiter368 = and i64 %66, 1
  %lcmp.mod369 = icmp eq i64 %xtraiter368, 0
  %67 = icmp eq i32 %w, 2
  %sunkaddr = ptrtoint [2160 x float]* %imgOut to i64
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge, %for.cond118.preheader.us.preheader
  %indvars.iv127162.us = phi i64 [ 0, %for.cond118.preheader.us.preheader ], [ %indvars.iv.next128.us, %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge ]
  %arrayidx124.us263 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv127162.us
  %68 = load float, float* %arrayidx124.us263, align 4
  %mul125.us264 = fmul float %div, %68
  %add127.us266 = fadd float %mul126.us265, %mul125.us264
  %add129.us268 = fadd float %mul128.us267, %add127.us266
  %add131.us270 = fadd float %mul130.us269, %add129.us268
  %arrayidx135.us271 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv127162.us
  store float %add131.us270, float* %arrayidx135.us271, align 4
  br i1 %exitcond195272, label %for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.inc144.us.for.inc144.us_crit_edge.preheader

for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.cond118.preheader.us
  br label %for.cond118.for.inc147_crit_edge.us

for.inc144.us.for.inc144.us_crit_edge.preheader:  ; preds = %for.cond118.preheader.us
  br i1 %lcmp.mod369, label %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge, label %for.inc144.us.for.inc144.us_crit_edge.prol

for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge: ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol:       ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader
  %sunkaddr376 = mul i64 %indvars.iv127162.us, 4
  %sunkaddr377 = add i64 %sunkaddr, %sunkaddr376
  %sunkaddr378 = inttoptr i64 %sunkaddr377 to float*
  %69 = load float, float* %sunkaddr378, align 4
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 1, i64 %indvars.iv127162.us
  %70 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %70
  %mul126.us.prol = fmul float %mul16, %69
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %mul128.us.prol = fmul float %exp2, %add131.us270
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 1, i64 %indvars.iv127162.us
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  br label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit: ; preds = %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.prol
  %add131.us276.unr.ph = phi float [ %add131.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %add131.us270, %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge ]
  %arrayidx124.us275.unr.ph = phi float* [ %arrayidx124.us.prol, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ %arrayidx124.us263, %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge ]
  %indvars.iv125157.us274.unr.ph = phi i64 [ 1, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0, %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge ]
  %ym1.1159.us273.unr.ph = phi float [ %add131.us270, %for.inc144.us.for.inc144.us_crit_edge.prol ], [ 0.000000e+00, %for.inc144.us.for.inc144.us_crit_edge.preheader.for.inc144.us.for.inc144.us_crit_edge.prol.loopexit_crit_edge ]
  br i1 %67, label %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.inc144.us.for.inc144.us_crit_edge.preheader.new

for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.cond118.for.inc147_crit_edge.us

for.inc144.us.for.inc144.us_crit_edge.preheader.new: ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit
  br label %for.inc144.us.for.inc144.us_crit_edge

for.inc144.us.for.inc144.us_crit_edge:            ; preds = %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge, %for.inc144.us.for.inc144.us_crit_edge.preheader.new
  %add131.us276 = phi float [ %add131.us276.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us.1, %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge ]
  %arrayidx124.us275 = phi float* [ %arrayidx124.us275.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %arrayidx124.us.1, %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge ]
  %indvars.iv125157.us274 = phi i64 [ %indvars.iv125157.us274.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %indvars.iv.next126.us.1, %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge ]
  %ym1.1159.us273 = phi float [ %ym1.1159.us273.unr.ph, %for.inc144.us.for.inc144.us_crit_edge.preheader.new ], [ %add131.us, %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge ]
  %indvars.iv.next126.us = add nuw nsw i64 %indvars.iv125157.us274, 1
  %71 = load float, float* %arrayidx124.us275, align 4
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next126.us, i64 %indvars.iv127162.us
  %72 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %72
  %mul126.us = fmul float %mul16, %71
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %add131.us276
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym1.1159.us273, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next126.us, i64 %indvars.iv127162.us
  store float %add131.us, float* %arrayidx135.us, align 4
  %indvars.iv.next126.us.1 = add nsw i64 %indvars.iv125157.us274, 2
  %73 = load float, float* %arrayidx124.us, align 4
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next126.us.1, i64 %indvars.iv127162.us
  %74 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %74
  %mul126.us.1 = fmul float %mul16, %73
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %add131.us276, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next126.us.1, i64 %indvars.iv127162.us
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %exitcond195.1 = icmp eq i64 %indvars.iv.next126.us.1, %66
  br i1 %exitcond195.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge

for.inc144.us.for.inc144.us_crit_edge.for.inc144.us.for.inc144.us_crit_edge_crit_edge: ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.inc144.us.for.inc144.us_crit_edge

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.inc144.us.for.inc144.us_crit_edge
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.inc144.us.for.inc144.us_crit_edge.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, %for.cond118.preheader.us.for.cond118.for.inc147_crit_edge.us_crit_edge, %for.cond118.for.inc147_crit_edge.us.loopexit
  %indvars.iv.next128.us = add nuw nsw i64 %indvars.iv127162.us, 1
  %cmp116.us = icmp slt i64 %indvars.iv.next128.us, %1
  br i1 %cmp116.us, label %for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge, label %for.cond154.preheader.us.preheader

for.cond118.for.inc147_crit_edge.us.for.cond118.preheader.us_crit_edge: ; preds = %for.cond118.for.inc147_crit_edge.us
  br label %for.cond118.preheader.us

for.cond154.preheader.us.preheader:               ; preds = %for.cond118.for.inc147_crit_edge.us
  %indvars.iv.next122152.us249 = add nsw i64 %2, -1
  %mul157.us250 = fmul float %mul21206223, 0.000000e+00
  %mul158.us251 = fmul float %mul25208221, 0.000000e+00
  %add159.us252 = fadd float %mul158.us251, %mul157.us250
  %mul160.us253 = fmul float %exp2, 0.000000e+00
  %add161.us254 = fadd float %mul160.us253, %add159.us252
  %mul162.us255 = fmul float %call29, -0.000000e+00
  %add163.us256 = fadd float %mul162.us255, %add161.us254
  %cmp155.us258 = icmp sgt i32 %w, 1
  %75 = and i64 %2, 1
  %lcmp.mod367 = icmp eq i64 %75, 0
  %indvars.iv.next122152.us.prol = add nsw i64 %2, -2
  %mul158.us.prol = fmul float %mul25208221, 0.000000e+00
  %mul160.us.prol = fmul float %exp2, %add163.us256
  %mul162.us.prol = fmul float %call29, -0.000000e+00
  %76 = icmp eq i32 %w, 2
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge, %for.cond154.preheader.us.preheader
  %indvars.iv123154.us = phi i64 [ %indvars.iv.next124.us, %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge ], [ 0, %for.cond154.preheader.us.preheader ]
  %arrayidx167.us257 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us249, i64 %indvars.iv123154.us
  store float %add163.us256, float* %arrayidx167.us257, align 4
  br i1 %cmp155.us258, label %for.inc176.us.for.inc176.us_crit_edge.preheader, label %for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge

for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge: ; preds = %for.cond154.preheader.us
  br label %for.cond154.for.inc179_crit_edge.us

for.inc176.us.for.inc176.us_crit_edge.preheader:  ; preds = %for.cond154.preheader.us
  br i1 %lcmp.mod367, label %for.inc176.us.for.inc176.us_crit_edge.prol, label %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge

for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge: ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader
  br label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol:       ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader
  %arrayidx171.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us249, i64 %indvars.iv123154.us
  %77 = load float, float* %arrayidx171.us.prol, align 4
  %mul157.us.prol = fmul float %mul21206223, %77
  %add159.us.prol = fadd float %mul158.us.prol, %mul157.us.prol
  %add161.us.prol = fadd float %mul160.us.prol, %add159.us.prol
  %add163.us.prol = fadd float %mul162.us.prol, %add161.us.prol
  %arrayidx167.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us.prol, i64 %indvars.iv123154.us
  store float %add163.us.prol, float* %arrayidx167.us.prol, align 4
  br label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit

for.inc176.us.for.inc176.us_crit_edge.prol.loopexit: ; preds = %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge, %for.inc176.us.for.inc176.us_crit_edge.prol
  %add163.us262.unr.ph = phi float [ %add163.us.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %add163.us256, %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge ]
  %indvars.iv.next122152.us261.unr.ph = phi i64 [ %indvars.iv.next122152.us.prol, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ %indvars.iv.next122152.us249, %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge ]
  %yp1.1149.us260.unr.ph = phi float [ %add163.us256, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge ]
  %tp1.0151.us259.unr.ph = phi float [ %77, %for.inc176.us.for.inc176.us_crit_edge.prol ], [ 0.000000e+00, %for.inc176.us.for.inc176.us_crit_edge.preheader.for.inc176.us.for.inc176.us_crit_edge.prol.loopexit_crit_edge ]
  br i1 %76, label %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit.for.cond154.for.inc179_crit_edge.us_crit_edge, label %for.inc176.us.for.inc176.us_crit_edge.preheader.new

for.inc176.us.for.inc176.us_crit_edge.prol.loopexit.for.cond154.for.inc179_crit_edge.us_crit_edge: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit
  br label %for.cond154.for.inc179_crit_edge.us

for.inc176.us.for.inc176.us_crit_edge.preheader.new: ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit
  br label %for.inc176.us.for.inc176.us_crit_edge

for.inc176.us.for.inc176.us_crit_edge:            ; preds = %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge, %for.inc176.us.for.inc176.us_crit_edge.preheader.new
  %add163.us262 = phi float [ %add163.us262.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us.1, %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge ]
  %indvars.iv.next122152.us261 = phi i64 [ %indvars.iv.next122152.us261.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %indvars.iv.next122152.us.1, %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge ]
  %yp1.1149.us260 = phi float [ %yp1.1149.us260.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %add163.us, %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge ]
  %tp1.0151.us259 = phi float [ %tp1.0151.us259.unr.ph, %for.inc176.us.for.inc176.us_crit_edge.preheader.new ], [ %79, %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge ]
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us261, i64 %indvars.iv123154.us
  %78 = load float, float* %arrayidx171.us, align 4
  %indvars.iv.next122152.us = add nsw i64 %indvars.iv.next122152.us261, -1
  %mul157.us = fmul float %mul21206223, %78
  %mul158.us = fmul float %tp1.0151.us259, %mul25208221
  %add159.us = fadd float %mul158.us, %mul157.us
  %mul160.us = fmul float %exp2, %add163.us262
  %add161.us = fadd float %mul160.us, %add159.us
  %mul162.us = fmul float %yp1.1149.us260, %sub30
  %add163.us = fadd float %mul162.us, %add161.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us, i64 %indvars.iv123154.us
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next122152.us, i64 %indvars.iv123154.us
  %79 = load float, float* %arrayidx171.us.1, align 4
  %indvars.iv.next122152.us.1 = add nsw i64 %indvars.iv.next122152.us261, -2
  %mul157.us.1 = fmul float %mul21206223, %79
  %mul158.us.1 = fmul float %78, %mul25208221
  %add159.us.1 = fadd float %mul158.us.1, %mul157.us.1
  %mul160.us.1 = fmul float %exp2, %add163.us
  %add161.us.1 = fadd float %mul160.us.1, %add159.us.1
  %mul162.us.1 = fmul float %add163.us262, %sub30
  %add163.us.1 = fadd float %mul162.us.1, %add161.us.1
  %arrayidx167.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next122152.us.1, i64 %indvars.iv123154.us
  store float %add163.us.1, float* %arrayidx167.us.1, align 4
  %cmp155.us.1 = icmp sgt i64 %indvars.iv.next122152.us, 1
  br i1 %cmp155.us.1, label %for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge, label %for.cond154.for.inc179_crit_edge.us.loopexit

for.inc176.us.for.inc176.us_crit_edge.for.inc176.us.for.inc176.us_crit_edge_crit_edge: ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.inc176.us.for.inc176.us_crit_edge

for.cond154.for.inc179_crit_edge.us.loopexit:     ; preds = %for.inc176.us.for.inc176.us_crit_edge
  br label %for.cond154.for.inc179_crit_edge.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.inc176.us.for.inc176.us_crit_edge.prol.loopexit.for.cond154.for.inc179_crit_edge.us_crit_edge, %for.cond154.preheader.us.for.cond154.for.inc179_crit_edge.us_crit_edge, %for.cond154.for.inc179_crit_edge.us.loopexit
  %indvars.iv.next124.us = add nuw nsw i64 %indvars.iv123154.us, 1
  %cmp151.us = icmp slt i64 %indvars.iv.next124.us, %1
  br i1 %cmp151.us, label %for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge, label %for.cond182.preheader.loopexit

for.cond154.for.inc179_crit_edge.us.for.cond154.preheader.us_crit_edge: ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond115.preheader.for.cond182.preheader_crit_edge, %for.cond182.preheader.loopexit
  %80 = icmp sgt i32 %h, 0
  %81 = icmp sgt i32 %w, 0
  %or.cond = and i1 %81, %80
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.cond182.preheader.for.end207_crit_edge

for.cond182.preheader.for.end207_crit_edge:       ; preds = %for.cond182.preheader
  br label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %82 = add nsw i64 %1, -1
  %83 = add nsw i64 %1, -8
  %84 = lshr i64 %83, 3
  %min.iters.check326 = icmp ult i32 %h, 8
  %n.vec329 = and i64 %1, -8
  %cmp.zero330 = icmp eq i64 %n.vec329, 0
  %85 = and i64 %84, 1
  %lcmp.mod = icmp eq i64 %85, 0
  %86 = icmp eq i64 %84, 0
  %cmp.n357 = icmp eq i64 %1, %n.vec329
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge, %for.cond185.preheader.us.preheader
  %indvars.iv119144.us = phi i64 [ 0, %for.cond185.preheader.us.preheader ], [ %indvars.iv.next120.us, %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge ]
  %scevgep332 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 0
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %1
  %scevgep336 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 0
  %scevgep338 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %1
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 0
  %scevgep342 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %1
  br i1 %min.iters.check326, label %for.cond185.preheader.us.for.inc202.us.preheader_crit_edge, label %min.iters.checked327

for.cond185.preheader.us.for.inc202.us.preheader_crit_edge: ; preds = %for.cond185.preheader.us
  br label %for.inc202.us.preheader

min.iters.checked327:                             ; preds = %for.cond185.preheader.us
  br i1 %cmp.zero330, label %min.iters.checked327.for.inc202.us.preheader_crit_edge, label %vector.memcheck352

min.iters.checked327.for.inc202.us.preheader_crit_edge: ; preds = %min.iters.checked327
  br label %for.inc202.us.preheader

vector.memcheck352:                               ; preds = %min.iters.checked327
  %bound0344 = icmp ult float* %scevgep332, %scevgep338
  %bound1345 = icmp ult float* %scevgep336, %scevgep334
  %found.conflict346 = and i1 %bound0344, %bound1345
  %bound0347 = icmp ult float* %scevgep332, %scevgep342
  %bound1348 = icmp ult float* %scevgep340, %scevgep334
  %found.conflict349 = and i1 %bound0347, %bound1348
  %conflict.rdx350 = or i1 %found.conflict346, %found.conflict349
  br i1 %conflict.rdx350, label %vector.memcheck352.for.inc202.us.preheader_crit_edge, label %vector.body323.preheader

vector.memcheck352.for.inc202.us.preheader_crit_edge: ; preds = %vector.memcheck352
  br label %for.inc202.us.preheader

vector.body323.preheader:                         ; preds = %vector.memcheck352
  br i1 %lcmp.mod, label %vector.body323.prol, label %vector.body323.preheader.vector.body323.prol.loopexit_crit_edge

vector.body323.preheader.vector.body323.prol.loopexit_crit_edge: ; preds = %vector.body323.preheader
  br label %vector.body323.prol.loopexit

vector.body323.prol:                              ; preds = %vector.body323.preheader
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 0
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load362.prol = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !16
  %89 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 4
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load363.prol = load <4 x float>, <4 x float>* %90, align 4, !alias.scope !16
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 0
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load364.prol = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !19
  %93 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 4
  %94 = bitcast float* %93 to <4 x float>*
  %wide.load365.prol = load <4 x float>, <4 x float>* %94, align 4, !alias.scope !19
  %95 = fadd <4 x float> %wide.load362.prol, %wide.load364.prol
  %96 = fadd <4 x float> %wide.load363.prol, %wide.load365.prol
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 0
  %98 = bitcast float* %97 to <4 x float>*
  store <4 x float> %95, <4 x float>* %98, align 4, !alias.scope !21, !noalias !23
  %99 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 4
  %100 = bitcast float* %99 to <4 x float>*
  store <4 x float> %96, <4 x float>* %100, align 4, !alias.scope !21, !noalias !23
  br label %vector.body323.prol.loopexit

vector.body323.prol.loopexit:                     ; preds = %vector.body323.preheader.vector.body323.prol.loopexit_crit_edge, %vector.body323.prol
  %index354.unr.ph = phi i64 [ 8, %vector.body323.prol ], [ 0, %vector.body323.preheader.vector.body323.prol.loopexit_crit_edge ]
  br i1 %86, label %vector.body323.prol.loopexit.middle.block324_crit_edge, label %vector.body323.preheader.new

vector.body323.prol.loopexit.middle.block324_crit_edge: ; preds = %vector.body323.prol.loopexit
  br label %middle.block324

vector.body323.preheader.new:                     ; preds = %vector.body323.prol.loopexit
  br label %vector.body323

vector.body323:                                   ; preds = %vector.body323.vector.body323_crit_edge, %vector.body323.preheader.new
  %index354 = phi i64 [ %index354.unr.ph, %vector.body323.preheader.new ], [ %index.next355.1, %vector.body323.vector.body323_crit_edge ]
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %index354
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load362 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !16
  %103 = getelementptr float, float* %101, i64 4
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load363 = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !16
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %index354
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load364 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !19
  %107 = getelementptr float, float* %105, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load365 = load <4 x float>, <4 x float>* %108, align 4, !alias.scope !19
  %109 = fadd <4 x float> %wide.load362, %wide.load364
  %110 = fadd <4 x float> %wide.load363, %wide.load365
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %index354
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %109, <4 x float>* %112, align 4, !alias.scope !21, !noalias !23
  %113 = getelementptr float, float* %111, i64 4
  %114 = bitcast float* %113 to <4 x float>*
  store <4 x float> %110, <4 x float>* %114, align 4, !alias.scope !21, !noalias !23
  %index.next355 = add i64 %index354, 8
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %index.next355
  %116 = bitcast float* %115 to <4 x float>*
  %wide.load362.1 = load <4 x float>, <4 x float>* %116, align 4, !alias.scope !16
  %117 = getelementptr float, float* %115, i64 4
  %118 = bitcast float* %117 to <4 x float>*
  %wide.load363.1 = load <4 x float>, <4 x float>* %118, align 4, !alias.scope !16
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %index.next355
  %120 = bitcast float* %119 to <4 x float>*
  %wide.load364.1 = load <4 x float>, <4 x float>* %120, align 4, !alias.scope !19
  %121 = getelementptr float, float* %119, i64 4
  %122 = bitcast float* %121 to <4 x float>*
  %wide.load365.1 = load <4 x float>, <4 x float>* %122, align 4, !alias.scope !19
  %123 = fadd <4 x float> %wide.load362.1, %wide.load364.1
  %124 = fadd <4 x float> %wide.load363.1, %wide.load365.1
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %index.next355
  %126 = bitcast float* %125 to <4 x float>*
  store <4 x float> %123, <4 x float>* %126, align 4, !alias.scope !21, !noalias !23
  %127 = getelementptr float, float* %125, i64 4
  %128 = bitcast float* %127 to <4 x float>*
  store <4 x float> %124, <4 x float>* %128, align 4, !alias.scope !21, !noalias !23
  %index.next355.1 = add i64 %index354, 16
  %129 = icmp eq i64 %index.next355.1, %n.vec329
  br i1 %129, label %middle.block324.loopexit, label %vector.body323.vector.body323_crit_edge, !llvm.loop !24

vector.body323.vector.body323_crit_edge:          ; preds = %vector.body323
  br label %vector.body323

middle.block324.loopexit:                         ; preds = %vector.body323
  br label %middle.block324

middle.block324:                                  ; preds = %vector.body323.prol.loopexit.middle.block324_crit_edge, %middle.block324.loopexit
  br i1 %cmp.n357, label %middle.block324.for.cond185.for.inc205_crit_edge.us_crit_edge, label %middle.block324.for.inc202.us.preheader_crit_edge

middle.block324.for.inc202.us.preheader_crit_edge: ; preds = %middle.block324
  br label %for.inc202.us.preheader

middle.block324.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %middle.block324
  br label %for.cond185.for.inc205_crit_edge.us

for.inc202.us.preheader:                          ; preds = %middle.block324.for.inc202.us.preheader_crit_edge, %vector.memcheck352.for.inc202.us.preheader_crit_edge, %min.iters.checked327.for.inc202.us.preheader_crit_edge, %for.cond185.preheader.us.for.inc202.us.preheader_crit_edge
  %indvars.iv142.us.ph = phi i64 [ %n.vec329, %middle.block324.for.inc202.us.preheader_crit_edge ], [ 0, %vector.memcheck352.for.inc202.us.preheader_crit_edge ], [ 0, %min.iters.checked327.for.inc202.us.preheader_crit_edge ], [ 0, %for.cond185.preheader.us.for.inc202.us.preheader_crit_edge ]
  br label %for.inc202.us

for.inc202.us:                                    ; preds = %for.inc202.us.preheader, %for.inc202.us.for.inc202.us_crit_edge
  %indvars.iv142.us = phi i64 [ %indvars.iv.next.us, %for.inc202.us.for.inc202.us_crit_edge ], [ %indvars.iv142.us.ph, %for.inc202.us.preheader ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  %130 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  %131 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %130, %131
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv119144.us, i64 %indvars.iv142.us
  store float %add196.us, float* %arrayidx201.us, align 4
  %exitcond = icmp eq i64 %indvars.iv142.us, %82
  br i1 %exitcond, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.inc202.us.for.inc202.us_crit_edge, !llvm.loop !25

for.inc202.us.for.inc202.us_crit_edge:            ; preds = %for.inc202.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv142.us, 1
  br label %for.inc202.us

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.inc202.us
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %middle.block324.for.cond185.for.inc205_crit_edge.us_crit_edge, %for.cond185.for.inc205_crit_edge.us.loopexit
  %indvars.iv.next120.us = add nuw nsw i64 %indvars.iv119144.us, 1
  %cmp183.us = icmp slt i64 %indvars.iv.next120.us, %2
  br i1 %cmp183.us, label %for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge, label %for.end207.loopexit

for.cond185.for.inc205_crit_edge.us.for.cond185.preheader.us_crit_edge: ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  br label %for.end207

for.end207:                                       ; preds = %for.cond182.preheader.for.end207_crit_edge, %for.cond118.preheader.lr.ph.for.end207_crit_edge, %for.cond31.preheader.lr.ph.for.end207_crit_edge, %for.end207.loopexit
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
  %3 = sext i32 %h to i64
  %4 = sext i32 %w to i64
  %cmp14 = icmp sgt i32 %w, 0
  %cmp312 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp14, %cmp312
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv915.us = phi i64 [ %indvars.iv.next10.us, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv915.us, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv13.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us.for.body4.us_crit_edge ]
  %6 = add nsw i64 %indvars.iv13.us, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv915.us, i64 %indvars.iv13.us
  %10 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %10 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next.us, %3
  br i1 %cmp3.us, label %for.inc.us.for.body4.us_crit_edge, label %for.cond2.for.inc10_crit_edge.us

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv915.us, 1
  %cmp.us = icmp slt i64 %indvars.iv.next10.us, %4
  br i1 %cmp.us, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, label %for.end12.loopexit

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.end12.loopexit
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

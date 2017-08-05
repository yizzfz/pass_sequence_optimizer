; ModuleID = 'B.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_deriche = private constant [19 x i8] c"B.ll:kernel_deriche"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 92494392653, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_deriche = private global [42 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_deriche = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3963923321610283555, i64 471118697375, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i32 0, i32 0), i8* null, i8* null, i32 42, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_deriche\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_deriche to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca float, align 4
  %call = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %arraydecay = bitcast i8* %call to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %alpha, [2160 x float]* %arraydecay)
  tail call void (...) @polybench_timer_start() #5
  %0 = load float, float* %alpha, align 4
  %arraydecay6 = bitcast i8* %call1 to [2160 x float]*
  %arraydecay7 = bitcast i8* %call2 to [2160 x float]*
  %arraydecay8 = bitcast i8* %call3 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %0, [2160 x float]* %arraydecay, [2160 x float]* %arraydecay6, [2160 x float]* %arraydecay7, [2160 x float]* %arraydecay8)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %3 = add i64 %pgocount1, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %arraydecay6)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
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
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count11 = zext i32 %w to i64
  %min.iters.check = icmp ult i32 %h, 4
  %0 = and i32 %h, 3
  %n.mod.vf = zext i32 %0 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = mul nuw nsw i64 %indvars.iv8, 313
  br i1 %min.iters.check, label %for.body3.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br i1 %cmp.zero, label %for.body3.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %1, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %3 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %4 = add nuw nsw <4 x i64> %3, %broadcast.splat
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = srem <4 x i32> %5, <i32 65536, i32 65536, i32 65536, i32 65536>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  %8 = fdiv <4 x float> %7, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %9 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %index
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %8, <4 x float>* %10, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br i1 %cmp.n, label %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, label %for.body3.us.preheader

middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge: ; preds = %middle.block
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond1.for.inc7_crit_edge.us

for.body3.us.preheader:                           ; preds = %middle.block, %min.iters.checked, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.cond1.preheader.us ], [ %n.vec, %middle.block ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %15 = mul nuw nsw i64 %indvars.iv, 991
  %16 = add nuw nsw i64 %15, %1
  %17 = trunc i64 %16 to i32
  %rem.us = srem i32 %17, 65536
  %conv.us = sitofp i32 %rem.us to float
  %div.us = fdiv float %conv.us, 6.553500e+04
  %arrayidx6.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv8, i64 %indvars.iv
  store float %div.us, float* %arrayidx6.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !4

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %18 = add i64 %pgocount4, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %19 = add i64 %pgocount5, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %middle.block.for.cond1.for.inc7_crit_edge.us_crit_edge, %for.cond1.for.inc7_crit_edge.us.loopexit
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %20 = add i64 %pgocount6, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %21 = add i64 %pgocount7, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
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
  %cmp39 = icmp sgt i32 %w, 0
  br i1 %cmp39, label %for.cond31.preheader.lr.ph, label %for.cond115.preheader

for.cond31.preheader.lr.ph:                       ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 27)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 27)
  %cmp3234 = icmp sgt i32 %h, 0
  br i1 %cmp3234, label %for.cond31.preheader.us.preheader, label %for.end207

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 31)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 31)
  %xtraiter91 = and i32 %h, 1
  %lcmp.mod92 = icmp eq i32 %xtraiter91, 0
  %3 = icmp eq i32 %h, 1
  %wide.trip.count95 = zext i32 %w to i64
  %wide.trip.count89.1 = zext i32 %h to i64
  %mul37.us.prol = fmul float %mul16, 0.000000e+00
  %mul39.us.prol = fmul float %exp2, 0.000000e+00
  %mul41.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc55_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %for.cond31.for.inc55_crit_edge.us ], [ 0, %for.cond31.preheader.us.preheader ]
  br i1 %lcmp.mod92, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 12)
  %arrayidx35.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv93, i64 0
  %5 = load float, float* %arrayidx35.us.prol, align 4
  %mul36.us.prol = fmul float %div, %5
  %add38.us.prol = fadd float %mul37.us.prol, %mul36.us.prol
  %add40.us.prol = fadd float %mul39.us.prol, %add38.us.prol
  %add42.us.prol = fadd float %mul41.us.prol, %add40.us.prol
  %arrayidx46.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv93, i64 0
  store float %add42.us.prol, float* %arrayidx46.us.prol, align 4
  %6 = load float, float* %arrayidx35.us.prol, align 4
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv87.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  %xm1.036.us.unr.ph = phi float [ %6, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  %ym1.035.us.unr.ph = phi float [ %add42.us.prol, %for.body33.us.prol ], [ 0.000000e+00, %for.cond31.preheader.us ]
  br i1 %3, label %for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, label %for.body33.us.preheader

for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge: ; preds = %for.body33.us.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  %7 = add i64 %pgocount3, 1
  store i64 %7, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 7)
  br label %for.cond31.for.inc55_crit_edge.us

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.preheader
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %for.body33.us.for.body33.us_crit_edge ], [ %indvars.iv87.unr.ph, %for.body33.us.preheader ]
  %ym2.038.us = phi float [ %add42.us, %for.body33.us.for.body33.us_crit_edge ], [ 0.000000e+00, %for.body33.us.preheader ]
  %xm1.036.us = phi float [ %11, %for.body33.us.for.body33.us_crit_edge ], [ %xm1.036.us.unr.ph, %for.body33.us.preheader ]
  %ym1.035.us = phi float [ %add42.us.1, %for.body33.us.for.body33.us_crit_edge ], [ %ym1.035.us.unr.ph, %for.body33.us.preheader ]
  %arrayidx35.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv93, i64 %indvars.iv87
  %8 = load float, float* %arrayidx35.us, align 4
  %mul36.us = fmul float %div, %8
  %mul37.us = fmul float %mul16, %xm1.036.us
  %add38.us = fadd float %mul37.us, %mul36.us
  %mul39.us = fmul float %exp2, %ym1.035.us
  %add40.us = fadd float %mul39.us, %add38.us
  %mul41.us = fmul float %ym2.038.us, %sub30
  %add42.us = fadd float %mul41.us, %add40.us
  %arrayidx46.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv93, i64 %indvars.iv87
  store float %add42.us, float* %arrayidx46.us, align 4
  %9 = load float, float* %arrayidx35.us, align 4
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %arrayidx35.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv93, i64 %indvars.iv.next88
  %10 = load float, float* %arrayidx35.us.1, align 4
  %mul36.us.1 = fmul float %div, %10
  %mul37.us.1 = fmul float %mul16, %9
  %add38.us.1 = fadd float %mul37.us.1, %mul36.us.1
  %mul39.us.1 = fmul float %exp2, %add42.us
  %add40.us.1 = fadd float %mul39.us.1, %add38.us.1
  %mul41.us.1 = fmul float %ym1.035.us, %sub30
  %add42.us.1 = fadd float %mul41.us.1, %add40.us.1
  %arrayidx46.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv93, i64 %indvars.iv.next88
  store float %add42.us.1, float* %arrayidx46.us.1, align 4
  %11 = load float, float* %arrayidx35.us.1, align 4
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, %wide.trip.count89.1
  br i1 %exitcond90.1, label %for.cond31.for.inc55_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  %12 = add i64 %pgocount4, 1
  store i64 %12, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 0)
  br label %for.body33.us

for.cond31.for.inc55_crit_edge.us.loopexit:       ; preds = %for.body33.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 13)
  %13 = add i64 %pgocount5, 1
  store i64 %13, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 13)
  br label %for.cond31.for.inc55_crit_edge.us

for.cond31.for.inc55_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit.for.cond31.for.inc55_crit_edge.us_crit_edge, %for.cond31.for.inc55_crit_edge.us.loopexit
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %for.cond58.preheader, label %for.cond31.preheader.us

for.cond58.preheader:                             ; preds = %for.cond31.for.inc55_crit_edge.us
  %cmp5932 = icmp sgt i32 %w, 0
  br i1 %cmp5932, label %for.cond62.preheader.lr.ph, label %for.cond115.preheader

for.cond62.preheader.lr.ph:                       ; preds = %for.cond58.preheader
  %pgocount6 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 34)
  %14 = add i64 %pgocount6, 1
  store i64 %14, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 34)
  %cmp6326 = icmp sgt i32 %h, 0
  br i1 %cmp6326, label %for.cond62.preheader.us.preheader, label %for.end207

for.cond62.preheader.us.preheader:                ; preds = %for.cond62.preheader.lr.ph
  %15 = sext i32 %h to i64
  %wide.trip.count84 = zext i32 %w to i64
  br label %for.cond62.preheader.us

for.cond62.preheader.us:                          ; preds = %for.cond62.for.inc86_crit_edge.us, %for.cond62.preheader.us.preheader
  %indvars.iv82 = phi i64 [ 0, %for.cond62.preheader.us.preheader ], [ %indvars.iv.next83, %for.cond62.for.inc86_crit_edge.us ]
  br label %for.body64.us

for.body64.us:                                    ; preds = %for.body64.us.for.body64.us_crit_edge, %for.cond62.preheader.us
  %indvars.iv80 = phi i64 [ %15, %for.cond62.preheader.us ], [ %indvars.iv.next81, %for.body64.us.for.body64.us_crit_edge ]
  %yp2.030.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %yp1.029.us, %for.body64.us.for.body64.us_crit_edge ]
  %yp1.029.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %add71.us, %for.body64.us.for.body64.us_crit_edge ]
  %xp2.028.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %xp1.027.us, %for.body64.us.for.body64.us_crit_edge ]
  %xp1.027.us = phi float [ 0.000000e+00, %for.cond62.preheader.us ], [ %16, %for.body64.us.for.body64.us_crit_edge ]
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %mul65.us = fmul float %mul21, %xp1.027.us
  %mul66.us = fmul float %xp2.028.us, %mul25
  %add67.us = fadd float %mul65.us, %mul66.us
  %mul68.us = fmul float %exp2, %yp1.029.us
  %add69.us = fadd float %add67.us, %mul68.us
  %mul70.us = fmul float %yp2.030.us, %sub30
  %add71.us = fadd float %add69.us, %mul70.us
  %arrayidx75.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv82, i64 %indvars.iv.next81
  store float %add71.us, float* %arrayidx75.us, align 4
  %arrayidx79.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgIn, i64 %indvars.iv82, i64 %indvars.iv.next81
  %16 = load float, float* %arrayidx79.us, align 4
  %cmp63.us = icmp sgt i64 %indvars.iv80, 1
  br i1 %cmp63.us, label %for.body64.us.for.body64.us_crit_edge, label %for.cond62.for.inc86_crit_edge.us

for.body64.us.for.body64.us_crit_edge:            ; preds = %for.body64.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  %17 = add i64 %pgocount7, 1
  store i64 %17, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 1)
  br label %for.body64.us

for.cond62.for.inc86_crit_edge.us:                ; preds = %for.body64.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 14)
  %18 = add i64 %pgocount8, 1
  store i64 %18, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 14)
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %for.cond89.preheader, label %for.cond62.preheader.us

for.cond89.preheader:                             ; preds = %for.cond62.for.inc86_crit_edge.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 36)
  %19 = add i64 %pgocount9, 1
  store i64 %19, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 36)
  %cmp9023 = icmp sgt i32 %w, 0
  br i1 %cmp9023, label %for.cond92.preheader.lr.ph, label %for.cond115.preheader

for.cond92.preheader.lr.ph:                       ; preds = %for.cond89.preheader
  %pgocount10 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 39)
  %20 = add i64 %pgocount10, 1
  store i64 %20, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 39)
  %cmp9321 = icmp sgt i32 %h, 0
  br i1 %cmp9321, label %for.cond92.preheader.us.preheader, label %for.end207

for.cond92.preheader.us.preheader:                ; preds = %for.cond92.preheader.lr.ph
  %xtraiter73 = and i32 %h, 1
  %lcmp.mod74 = icmp eq i32 %xtraiter73, 0
  %21 = icmp eq i32 %h, 1
  %wide.trip.count77 = zext i32 %w to i64
  %wide.trip.count71.1 = zext i32 %h to i64
  %22 = add nsw i64 %wide.trip.count89.1, -2
  %23 = add nsw i64 %wide.trip.count89.1, -2
  br label %for.cond92.preheader.us

for.cond92.preheader.us:                          ; preds = %for.cond92.for.inc112_crit_edge.us, %for.cond92.preheader.us.preheader
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.cond92.for.inc112_crit_edge.us ], [ 0, %for.cond92.preheader.us.preheader ]
  %scevgep117 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 2
  %scevgep123 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 2
  %scevgep129 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 2
  br i1 %lcmp.mod74, label %for.body94.us.prol.loopexit, label %for.body94.us.prol

for.body94.us.prol:                               ; preds = %for.cond92.preheader.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 24)
  %24 = add i64 %pgocount11, 1
  store i64 %24, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 24)
  %arrayidx98.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 0
  %25 = load float, float* %arrayidx98.us.prol, align 4
  %arrayidx102.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 0
  %26 = load float, float* %arrayidx102.us.prol, align 4
  %add103.us.prol = fadd float %25, %26
  %arrayidx108.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 0
  store float %add103.us.prol, float* %arrayidx108.us.prol, align 4
  br label %for.body94.us.prol.loopexit

for.body94.us.prol.loopexit:                      ; preds = %for.body94.us.prol, %for.cond92.preheader.us
  %indvars.iv69.unr.ph = phi i64 [ 1, %for.body94.us.prol ], [ 0, %for.cond92.preheader.us ]
  br i1 %21, label %for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge, label %for.body94.us.preheader

for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge: ; preds = %for.body94.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  %27 = add i64 %pgocount12, 1
  store i64 %27, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 11)
  br label %for.cond92.for.inc112_crit_edge.us

for.body94.us.preheader:                          ; preds = %for.body94.us.prol.loopexit
  %pgocount13 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 25)
  %28 = add i64 %pgocount13, 1
  store i64 %28, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 25)
  %29 = sub nsw i64 %22, %indvars.iv69.unr.ph
  %30 = lshr i64 %29, 1
  %31 = add nuw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 4
  br i1 %min.iters.check, label %for.body94.us.preheader193, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body94.us.preheader
  %pgocount14 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 29)
  %32 = add i64 %pgocount14, 1
  store i64 %32, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 29)
  %n.mod.vf = and i64 %31, 3
  %n.vec = sub i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body94.us.preheader193, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount15 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 32)
  %33 = add i64 %pgocount15, 1
  store i64 %33, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 32)
  %scevgep115 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 %indvars.iv69.unr.ph
  %34 = sub nsw i64 %23, %indvars.iv69.unr.ph
  %35 = and i64 %34, -2
  %36 = or i64 %indvars.iv69.unr.ph, %35
  %scevgep118 = getelementptr float, float* %scevgep117, i64 %36
  %scevgep121 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv69.unr.ph
  %scevgep124 = getelementptr float, float* %scevgep123, i64 %36
  %scevgep127 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 %indvars.iv69.unr.ph
  %scevgep130 = getelementptr float, float* %scevgep129, i64 %36
  %bound0 = icmp ult float* %scevgep115, %scevgep124
  %bound1 = icmp ult float* %scevgep121, %scevgep118
  %found.conflict = and i1 %bound0, %bound1
  %bound0132 = icmp ult float* %scevgep115, %scevgep130
  %bound1133 = icmp ult float* %scevgep127, %scevgep118
  %found.conflict134 = and i1 %bound0132, %bound1133
  %conflict.rdx = or i1 %found.conflict, %found.conflict134
  %37 = or i64 %indvars.iv69.unr.ph, 2
  %38 = shl nuw i64 %30, 1
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %39, %40
  br i1 %conflict.rdx, label %for.body94.us.preheader193, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %41 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv69.unr.ph, %41
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %offset.idx
  %43 = bitcast float* %42 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %43, align 4, !alias.scope !6
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 %offset.idx
  %45 = bitcast float* %44 to <8 x float>*
  %wide.vec136 = load <8 x float>, <8 x float>* %45, align 4, !alias.scope !9
  %46 = fadd <8 x float> %wide.vec, %wide.vec136
  %47 = shufflevector <8 x float> %46, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %48 = add nuw nsw i64 %offset.idx, 1
  %49 = fadd <8 x float> %wide.vec, %wide.vec136
  %50 = shufflevector <8 x float> %49, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %51 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 %48
  %52 = getelementptr float, float* %51, i64 -1
  %53 = bitcast float* %52 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %47, <4 x float> %50, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %53, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %54 = icmp eq i64 %index.next, %n.vec
  br i1 %54, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount16 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  %55 = add i64 %pgocount16, 1
  store i64 %55, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 8)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount17 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 38)
  %56 = add i64 %pgocount17, 1
  store i64 %56, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 38)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond92.for.inc112_crit_edge.us, label %for.body94.us.preheader193

for.body94.us.preheader193:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body94.us.preheader
  %indvars.iv69.ph = phi i64 [ %indvars.iv69.unr.ph, %vector.memcheck ], [ %indvars.iv69.unr.ph, %min.iters.checked ], [ %indvars.iv69.unr.ph, %for.body94.us.preheader ], [ %ind.end, %middle.block ]
  br label %for.body94.us

for.body94.us:                                    ; preds = %for.body94.us.for.body94.us_crit_edge, %for.body94.us.preheader193
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.1, %for.body94.us.for.body94.us_crit_edge ], [ %indvars.iv69.ph, %for.body94.us.preheader193 ]
  %arrayidx98.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv69
  %57 = load float, float* %arrayidx98.us, align 4
  %arrayidx102.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 %indvars.iv69
  %58 = load float, float* %arrayidx102.us, align 4
  %add103.us = fadd float %57, %58
  %arrayidx108.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 %indvars.iv69
  store float %add103.us, float* %arrayidx108.us, align 4
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %arrayidx98.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv75, i64 %indvars.iv.next70
  %59 = load float, float* %arrayidx98.us.1, align 4
  %arrayidx102.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv75, i64 %indvars.iv.next70
  %60 = load float, float* %arrayidx102.us.1, align 4
  %add103.us.1 = fadd float %59, %60
  %arrayidx108.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv75, i64 %indvars.iv.next70
  store float %add103.us.1, float* %arrayidx108.us.1, align 4
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next70.1, %wide.trip.count71.1
  br i1 %exitcond72.1, label %for.cond92.for.inc112_crit_edge.us.loopexit, label %for.body94.us.for.body94.us_crit_edge, !llvm.loop !15

for.body94.us.for.body94.us_crit_edge:            ; preds = %for.body94.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  %61 = add i64 %pgocount18, 1
  store i64 %61, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 5)
  br label %for.body94.us

for.cond92.for.inc112_crit_edge.us.loopexit:      ; preds = %for.body94.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 26)
  %62 = add i64 %pgocount19, 1
  store i64 %62, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 26)
  br label %for.cond92.for.inc112_crit_edge.us

for.cond92.for.inc112_crit_edge.us:               ; preds = %for.body94.us.prol.loopexit.for.cond92.for.inc112_crit_edge.us_crit_edge, %for.cond92.for.inc112_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, %wide.trip.count77
  br i1 %exitcond78, label %for.cond115.preheader.loopexit, label %for.cond92.preheader.us

for.cond115.preheader.loopexit:                   ; preds = %for.cond92.for.inc112_crit_edge.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 41)
  %63 = add i64 %pgocount20, 1
  store i64 %63, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 41)
  br label %for.cond115.preheader

for.cond115.preheader:                            ; preds = %for.cond115.preheader.loopexit, %for.cond89.preheader, %for.cond58.preheader, %entry
  %cmp11619 = icmp sgt i32 %h, 0
  br i1 %cmp11619, label %for.cond118.preheader.lr.ph, label %for.cond182.preheader

for.cond118.preheader.lr.ph:                      ; preds = %for.cond115.preheader
  %pgocount21 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 30)
  %64 = add i64 %pgocount21, 1
  store i64 %64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 30)
  %cmp11914 = icmp sgt i32 %w, 0
  br i1 %cmp11914, label %for.cond118.preheader.us.preheader, label %for.end207

for.cond118.preheader.us.preheader:               ; preds = %for.cond118.preheader.lr.ph
  %xtraiter62 = and i32 %w, 1
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  %65 = icmp eq i32 %w, 1
  %wide.trip.count66 = zext i32 %h to i64
  %wide.trip.count60.1 = zext i32 %w to i64
  %mul126.us.prol = fmul float %mul16, 0.000000e+00
  %mul128.us.prol = fmul float %exp2, 0.000000e+00
  %mul130.us.prol = fmul float %call29, -0.000000e+00
  br label %for.cond118.preheader.us

for.cond118.preheader.us:                         ; preds = %for.cond118.for.inc147_crit_edge.us, %for.cond118.preheader.us.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond118.for.inc147_crit_edge.us ], [ 0, %for.cond118.preheader.us.preheader ]
  br i1 %lcmp.mod63, label %for.body120.us.prol.loopexit, label %for.body120.us.prol

for.body120.us.prol:                              ; preds = %for.cond118.preheader.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 15)
  %66 = add i64 %pgocount22, 1
  store i64 %66, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 15)
  %arrayidx124.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 0, i64 %indvars.iv64
  %67 = load float, float* %arrayidx124.us.prol, align 4
  %mul125.us.prol = fmul float %div, %67
  %add127.us.prol = fadd float %mul126.us.prol, %mul125.us.prol
  %add129.us.prol = fadd float %mul128.us.prol, %add127.us.prol
  %add131.us.prol = fadd float %mul130.us.prol, %add129.us.prol
  %arrayidx135.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 0, i64 %indvars.iv64
  store float %add131.us.prol, float* %arrayidx135.us.prol, align 4
  %68 = load float, float* %arrayidx124.us.prol, align 4
  br label %for.body120.us.prol.loopexit

for.body120.us.prol.loopexit:                     ; preds = %for.body120.us.prol, %for.cond118.preheader.us
  %indvars.iv58.unr.ph = phi i64 [ 1, %for.body120.us.prol ], [ 0, %for.cond118.preheader.us ]
  %tm1.016.us.unr.ph = phi float [ %68, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  %ym1.115.us.unr.ph = phi float [ %add131.us.prol, %for.body120.us.prol ], [ 0.000000e+00, %for.cond118.preheader.us ]
  br i1 %65, label %for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, label %for.body120.us.preheader

for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge: ; preds = %for.body120.us.prol.loopexit
  %pgocount23 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  %69 = add i64 %pgocount23, 1
  store i64 %69, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 9)
  br label %for.cond118.for.inc147_crit_edge.us

for.body120.us.preheader:                         ; preds = %for.body120.us.prol.loopexit
  br label %for.body120.us

for.body120.us:                                   ; preds = %for.body120.us.for.body120.us_crit_edge, %for.body120.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %for.body120.us.for.body120.us_crit_edge ], [ %indvars.iv58.unr.ph, %for.body120.us.preheader ]
  %ym2.118.us = phi float [ %add131.us, %for.body120.us.for.body120.us_crit_edge ], [ 0.000000e+00, %for.body120.us.preheader ]
  %tm1.016.us = phi float [ %73, %for.body120.us.for.body120.us_crit_edge ], [ %tm1.016.us.unr.ph, %for.body120.us.preheader ]
  %ym1.115.us = phi float [ %add131.us.1, %for.body120.us.for.body120.us_crit_edge ], [ %ym1.115.us.unr.ph, %for.body120.us.preheader ]
  %arrayidx124.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv58, i64 %indvars.iv64
  %70 = load float, float* %arrayidx124.us, align 4
  %mul125.us = fmul float %div, %70
  %mul126.us = fmul float %mul16, %tm1.016.us
  %add127.us = fadd float %mul126.us, %mul125.us
  %mul128.us = fmul float %exp2, %ym1.115.us
  %add129.us = fadd float %mul128.us, %add127.us
  %mul130.us = fmul float %ym2.118.us, %sub30
  %add131.us = fadd float %mul130.us, %add129.us
  %arrayidx135.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv58, i64 %indvars.iv64
  store float %add131.us, float* %arrayidx135.us, align 4
  %71 = load float, float* %arrayidx124.us, align 4
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx124.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next59, i64 %indvars.iv64
  %72 = load float, float* %arrayidx124.us.1, align 4
  %mul125.us.1 = fmul float %div, %72
  %mul126.us.1 = fmul float %mul16, %71
  %add127.us.1 = fadd float %mul126.us.1, %mul125.us.1
  %mul128.us.1 = fmul float %exp2, %add131.us
  %add129.us.1 = fadd float %mul128.us.1, %add127.us.1
  %mul130.us.1 = fmul float %ym1.115.us, %sub30
  %add131.us.1 = fadd float %mul130.us.1, %add129.us.1
  %arrayidx135.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv.next59, i64 %indvars.iv64
  store float %add131.us.1, float* %arrayidx135.us.1, align 4
  %73 = load float, float* %arrayidx124.us.1, align 4
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count60.1
  br i1 %exitcond61.1, label %for.cond118.for.inc147_crit_edge.us.loopexit, label %for.body120.us.for.body120.us_crit_edge

for.body120.us.for.body120.us_crit_edge:          ; preds = %for.body120.us
  %pgocount24 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  %74 = add i64 %pgocount24, 1
  store i64 %74, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 2)
  br label %for.body120.us

for.cond118.for.inc147_crit_edge.us.loopexit:     ; preds = %for.body120.us
  %pgocount25 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 16)
  %75 = add i64 %pgocount25, 1
  store i64 %75, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 16)
  br label %for.cond118.for.inc147_crit_edge.us

for.cond118.for.inc147_crit_edge.us:              ; preds = %for.body120.us.prol.loopexit.for.cond118.for.inc147_crit_edge.us_crit_edge, %for.cond118.for.inc147_crit_edge.us.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.cond150.preheader, label %for.cond118.preheader.us

for.cond150.preheader:                            ; preds = %for.cond118.for.inc147_crit_edge.us
  %pgocount26 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 33)
  %76 = add i64 %pgocount26, 1
  store i64 %76, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 33)
  %cmp15112 = icmp sgt i32 %h, 0
  br i1 %cmp15112, label %for.cond154.preheader.lr.ph, label %for.cond182.preheader

for.cond154.preheader.lr.ph:                      ; preds = %for.cond150.preheader
  %pgocount27 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 37)
  %77 = add i64 %pgocount27, 1
  store i64 %77, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 37)
  %cmp1556 = icmp sgt i32 %w, 0
  br i1 %cmp1556, label %for.cond154.preheader.us.preheader, label %for.end207

for.cond154.preheader.us.preheader:               ; preds = %for.cond154.preheader.lr.ph
  %pgocount28 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 40)
  %78 = add i64 %pgocount28, 1
  store i64 %78, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 40)
  %79 = sext i32 %w to i64
  %wide.trip.count55 = zext i32 %h to i64
  br label %for.cond154.preheader.us

for.cond154.preheader.us:                         ; preds = %for.cond154.for.inc179_crit_edge.us, %for.cond154.preheader.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond154.preheader.us.preheader ], [ %indvars.iv.next54, %for.cond154.for.inc179_crit_edge.us ]
  br label %for.body156.us

for.body156.us:                                   ; preds = %for.body156.us.for.body156.us_crit_edge, %for.cond154.preheader.us
  %indvars.iv51 = phi i64 [ %79, %for.cond154.preheader.us ], [ %indvars.iv.next52, %for.body156.us.for.body156.us_crit_edge ]
  %yp2.110.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %yp1.19.us, %for.body156.us.for.body156.us_crit_edge ]
  %yp1.19.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %add163.us, %for.body156.us.for.body156.us_crit_edge ]
  %tp2.08.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %tp1.07.us, %for.body156.us.for.body156.us_crit_edge ]
  %tp1.07.us = phi float [ 0.000000e+00, %for.cond154.preheader.us ], [ %80, %for.body156.us.for.body156.us_crit_edge ]
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %mul157.us = fmul float %mul21, %tp1.07.us
  %mul158.us = fmul float %tp2.08.us, %mul25
  %add159.us = fadd float %mul157.us, %mul158.us
  %mul160.us = fmul float %exp2, %yp1.19.us
  %add161.us = fadd float %add159.us, %mul160.us
  %mul162.us = fmul float %yp2.110.us, %sub30
  %add163.us = fadd float %add161.us, %mul162.us
  %arrayidx167.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv.next52, i64 %indvars.iv53
  store float %add163.us, float* %arrayidx167.us, align 4
  %arrayidx171.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv.next52, i64 %indvars.iv53
  %80 = load float, float* %arrayidx171.us, align 4
  %cmp155.us = icmp sgt i64 %indvars.iv51, 1
  br i1 %cmp155.us, label %for.body156.us.for.body156.us_crit_edge, label %for.cond154.for.inc179_crit_edge.us

for.body156.us.for.body156.us_crit_edge:          ; preds = %for.body156.us
  %pgocount29 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  %81 = add i64 %pgocount29, 1
  store i64 %81, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 4)
  br label %for.body156.us

for.cond154.for.inc179_crit_edge.us:              ; preds = %for.body156.us
  %pgocount30 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 20)
  %82 = add i64 %pgocount30, 1
  store i64 %82, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 20)
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.cond182.preheader.loopexit, label %for.cond154.preheader.us

for.cond182.preheader.loopexit:                   ; preds = %for.cond154.for.inc179_crit_edge.us
  br label %for.cond182.preheader

for.cond182.preheader:                            ; preds = %for.cond182.preheader.loopexit, %for.cond150.preheader, %for.cond115.preheader
  %cmp1833 = icmp sgt i32 %w, 0
  %cmp1861 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp1833, %cmp1861
  br i1 %or.cond, label %for.cond185.preheader.us.preheader, label %for.end207

for.cond185.preheader.us.preheader:               ; preds = %for.cond182.preheader
  %xtraiter = and i32 %h, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %83 = icmp eq i32 %h, 1
  %wide.trip.count49 = zext i32 %w to i64
  %wide.trip.count.1 = zext i32 %h to i64
  %84 = add nsw i64 %wide.trip.count.1, -2
  %85 = add nsw i64 %wide.trip.count.1, -2
  br label %for.cond185.preheader.us

for.cond185.preheader.us:                         ; preds = %for.cond185.for.inc205_crit_edge.us, %for.cond185.preheader.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond185.for.inc205_crit_edge.us ], [ 0, %for.cond185.preheader.us.preheader ]
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 2
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 2
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 2
  br i1 %lcmp.mod, label %for.body187.us.prol.loopexit, label %for.body187.us.prol

for.body187.us.prol:                              ; preds = %for.cond185.preheader.us
  %pgocount31 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 17)
  %86 = add i64 %pgocount31, 1
  store i64 %86, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 17)
  %arrayidx191.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 0
  %87 = load float, float* %arrayidx191.us.prol, align 4
  %arrayidx195.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 0
  %88 = load float, float* %arrayidx195.us.prol, align 4
  %add196.us.prol = fadd float %87, %88
  %arrayidx201.us.prol = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 0
  store float %add196.us.prol, float* %arrayidx201.us.prol, align 4
  br label %for.body187.us.prol.loopexit

for.body187.us.prol.loopexit:                     ; preds = %for.body187.us.prol, %for.cond185.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body187.us.prol ], [ 0, %for.cond185.preheader.us ]
  br i1 %83, label %for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge, label %for.body187.us.preheader

for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge: ; preds = %for.body187.us.prol.loopexit
  %pgocount32 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  %89 = add i64 %pgocount32, 1
  store i64 %89, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 10)
  br label %for.cond185.for.inc205_crit_edge.us

for.body187.us.preheader:                         ; preds = %for.body187.us.prol.loopexit
  %pgocount33 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 18)
  %90 = add i64 %pgocount33, 1
  store i64 %90, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 18)
  %91 = sub nsw i64 %84, %indvars.iv.unr.ph
  %92 = lshr i64 %91, 1
  %93 = add nuw i64 %92, 1
  %min.iters.check142 = icmp ult i64 %93, 4
  br i1 %min.iters.check142, label %for.body187.us.preheader192, label %min.iters.checked143

min.iters.checked143:                             ; preds = %for.body187.us.preheader
  %pgocount34 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 21)
  %94 = add i64 %pgocount34, 1
  store i64 %94, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 21)
  %n.mod.vf144 = and i64 %93, 3
  %n.vec145 = sub i64 %93, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  br i1 %cmp.zero146, label %for.body187.us.preheader192, label %vector.memcheck174

vector.memcheck174:                               ; preds = %min.iters.checked143
  %pgocount35 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 22)
  %95 = add i64 %pgocount35, 1
  store i64 %95, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 22)
  %scevgep149 = getelementptr [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.unr.ph
  %96 = sub nsw i64 %85, %indvars.iv.unr.ph
  %97 = and i64 %96, -2
  %98 = or i64 %indvars.iv.unr.ph, %97
  %scevgep152 = getelementptr float, float* %scevgep151, i64 %98
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.unr.ph
  %scevgep158 = getelementptr float, float* %scevgep157, i64 %98
  %scevgep161 = getelementptr [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.unr.ph
  %scevgep164 = getelementptr float, float* %scevgep163, i64 %98
  %bound0166 = icmp ult float* %scevgep149, %scevgep158
  %bound1167 = icmp ult float* %scevgep155, %scevgep152
  %found.conflict168 = and i1 %bound0166, %bound1167
  %bound0169 = icmp ult float* %scevgep149, %scevgep164
  %bound1170 = icmp ult float* %scevgep161, %scevgep152
  %found.conflict171 = and i1 %bound0169, %bound1170
  %conflict.rdx172 = or i1 %found.conflict168, %found.conflict171
  %99 = or i64 %indvars.iv.unr.ph, 2
  %100 = shl nuw i64 %92, 1
  %101 = add i64 %99, %100
  %102 = shl nuw nsw i64 %n.mod.vf144, 1
  %ind.end179 = sub i64 %101, %102
  br i1 %conflict.rdx172, label %for.body187.us.preheader192, label %vector.body139.preheader

vector.body139.preheader:                         ; preds = %vector.memcheck174
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139.vector.body139_crit_edge, %vector.body139.preheader
  %index176 = phi i64 [ %index.next177, %vector.body139.vector.body139_crit_edge ], [ 0, %vector.body139.preheader ]
  %103 = shl i64 %index176, 1
  %offset.idx181 = or i64 %indvars.iv.unr.ph, %103
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %offset.idx181
  %105 = bitcast float* %104 to <8 x float>*
  %wide.vec185 = load <8 x float>, <8 x float>* %105, align 4, !alias.scope !16
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %offset.idx181
  %107 = bitcast float* %106 to <8 x float>*
  %wide.vec188 = load <8 x float>, <8 x float>* %107, align 4, !alias.scope !19
  %108 = fadd <8 x float> %wide.vec185, %wide.vec188
  %109 = shufflevector <8 x float> %108, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %110 = add nuw nsw i64 %offset.idx181, 1
  %111 = fadd <8 x float> %wide.vec185, %wide.vec188
  %112 = shufflevector <8 x float> %111, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %110
  %114 = getelementptr float, float* %113, i64 -1
  %115 = bitcast float* %114 to <8 x float>*
  %interleaved.vec191 = shufflevector <4 x float> %109, <4 x float> %112, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec191, <8 x float>* %115, align 4, !alias.scope !21, !noalias !23
  %index.next177 = add i64 %index176, 4
  %116 = icmp eq i64 %index.next177, %n.vec145
  br i1 %116, label %middle.block140, label %vector.body139.vector.body139_crit_edge, !llvm.loop !24

vector.body139.vector.body139_crit_edge:          ; preds = %vector.body139
  %pgocount36 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  %117 = add i64 %pgocount36, 1
  store i64 %117, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 6)
  br label %vector.body139

middle.block140:                                  ; preds = %vector.body139
  %pgocount37 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 28)
  %118 = add i64 %pgocount37, 1
  store i64 %118, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 28)
  %cmp.n180 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n180, label %for.cond185.for.inc205_crit_edge.us, label %for.body187.us.preheader192

for.body187.us.preheader192:                      ; preds = %middle.block140, %vector.memcheck174, %min.iters.checked143, %for.body187.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck174 ], [ %indvars.iv.unr.ph, %min.iters.checked143 ], [ %indvars.iv.unr.ph, %for.body187.us.preheader ], [ %ind.end179, %middle.block140 ]
  br label %for.body187.us

for.body187.us:                                   ; preds = %for.body187.us.for.body187.us_crit_edge, %for.body187.us.preheader192
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body187.us.for.body187.us_crit_edge ], [ %indvars.iv.ph, %for.body187.us.preheader192 ]
  %arrayidx191.us = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv
  %119 = load float, float* %arrayidx191.us, align 4
  %arrayidx195.us = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv
  %120 = load float, float* %arrayidx195.us, align 4
  %add196.us = fadd float %119, %120
  %arrayidx201.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv
  store float %add196.us, float* %arrayidx201.us, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx191.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y1, i64 %indvars.iv47, i64 %indvars.iv.next
  %121 = load float, float* %arrayidx191.us.1, align 4
  %arrayidx195.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %y2, i64 %indvars.iv47, i64 %indvars.iv.next
  %122 = load float, float* %arrayidx195.us.1, align 4
  %add196.us.1 = fadd float %121, %122
  %arrayidx201.us.1 = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv47, i64 %indvars.iv.next
  store float %add196.us.1, float* %arrayidx201.us.1, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond185.for.inc205_crit_edge.us.loopexit, label %for.body187.us.for.body187.us_crit_edge, !llvm.loop !25

for.body187.us.for.body187.us_crit_edge:          ; preds = %for.body187.us
  %pgocount38 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  %123 = add i64 %pgocount38, 1
  store i64 %123, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 3)
  br label %for.body187.us

for.cond185.for.inc205_crit_edge.us.loopexit:     ; preds = %for.body187.us
  %pgocount39 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 19)
  %124 = add i64 %pgocount39, 1
  store i64 %124, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 19)
  br label %for.cond185.for.inc205_crit_edge.us

for.cond185.for.inc205_crit_edge.us:              ; preds = %for.body187.us.prol.loopexit.for.cond185.for.inc205_crit_edge.us_crit_edge, %for.cond185.for.inc205_crit_edge.us.loopexit, %middle.block140
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond, label %for.end207.loopexit, label %for.cond185.preheader.us

for.end207.loopexit:                              ; preds = %for.cond185.for.inc205_crit_edge.us
  %pgocount40 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 35)
  %125 = add i64 %pgocount40, 1
  store i64 %125, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 35)
  br label %for.end207

for.end207:                                       ; preds = %for.end207.loopexit, %for.cond182.preheader, %for.cond154.preheader.lr.ph, %for.cond118.preheader.lr.ph, %for.cond92.preheader.lr.ph, %for.cond62.preheader.lr.ph, %for.cond31.preheader.lr.ph
  %pgocount41 = load i64, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 23)
  %126 = add i64 %pgocount41, 1
  store i64 %126, i64* getelementptr inbounds ([42 x i64], [42 x i64]* @__profc_B.ll_kernel_deriche, i64 0, i64 23)
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %w, 0
  %cmp31 = icmp sgt i32 %h, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %h to i64
  %wide.trip.count = zext i32 %h to i64
  %wide.trip.count11 = zext i32 %w to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2160 x float], [2160 x float]* %imgOut, i64 %indvars.iv8, i64 %indvars.iv
  %11 = load float, float* %arrayidx8.us, align 4
  %conv.us = fpext float %11 to double
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %conv.us) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

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

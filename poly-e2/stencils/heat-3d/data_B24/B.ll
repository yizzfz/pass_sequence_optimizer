; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv8 = sitofp i32 %n to double
  %0 = add i32 %n, -1
  %1 = sext i32 %n to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %2, 0
  %3 = icmp eq i32 %0, 0
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.for.inc22_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv34 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next35, %for.cond1.for.inc22_crit_edge.us ]
  %4 = trunc i64 %indvars.iv34 to i32
  %sub.us = add i32 %4, %n
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next35 = add nuw i64 %indvars.iv34, 1
  %cmp.us = icmp slt i64 %indvars.iv.next35, %1
  br i1 %cmp.us, label %for.cond4.preheader.us.us.preheader, label %for.end24.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next33, %for.cond4.for.inc19_crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv32 to i32
  %add.us.us = add i32 %sub.us, %5
  br i1 %lcmp.mod, label %for.body6.us.us.prol, label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %3, label %for.cond4.for.inc19_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.cond4.for.inc19_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next33 = add nuw i64 %indvars.iv32, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next33, %1
  br i1 %cmp2.us.us, label %for.cond4.preheader.us.us, label %for.cond1.for.inc22_crit_edge.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next.1, %for.body6.us.us ]
  %6 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %6
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %7
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %0 = add i32 %n, -2
  %1 = sext i32 %sub to i64
  %wide.trip.count = zext i32 %0 to i64
  %2 = icmp sgt i32 %sub, 1
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.013 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %2, label %for.cond8.preheader.lr.ph.preheader, label %for.inc209

for.cond8.preheader.lr.ph.preheader:              ; preds = %for.cond1.preheader
  br label %for.cond8.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.cond8.preheader.lr.ph.preheader, %for.inc98
  %indvars.iv18 = phi i64 [ %3, %for.inc98 ], [ 1, %for.cond8.preheader.lr.ph.preheader ]
  %3 = add nuw nsw i64 %indvars.iv18, 1
  %4 = add nsw i64 %indvars.iv18, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 1, %for.cond8.preheader.lr.ph ], [ %indvars.iv.next16, %for.cond8.for.inc95_crit_edge.us ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %5 = add nsw i64 %indvars.iv15, -1
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ 1, %for.cond8.preheader.us ], [ %indvars.iv.next, %for.body11.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv15, i64 %indvars.iv
  %6 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv18, i64 %indvars.iv15, i64 %indvars.iv
  %7 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %7, 2.000000e+00
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %indvars.iv15, i64 %indvars.iv
  %8 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv18, i64 %indvars.iv.next16, i64 %indvars.iv
  %9 = load double, double* %arrayidx38.us, align 8
  %10 = insertelement <2 x double> undef, double %mul.us, i32 0
  %sub22.v.i1.2.us = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.v.i0.1.us = insertelement <2 x double> undef, double %6, i32 0
  %sub22.v.i0.2.us = insertelement <2 x double> %sub22.v.i0.1.us, double %9, i32 1
  %sub22.us = fsub <2 x double> %sub22.v.i0.2.us, %sub22.v.i1.2.us
  %sub22.v.r1.us = extractelement <2 x double> %sub22.us, i32 0
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv18, i64 %5, i64 %indvars.iv
  %11 = load double, double* %arrayidx53.us, align 8
  %add30.v.i1.1.us = insertelement <2 x double> undef, double %sub22.v.r1.us, i32 0
  %add30.v.i1.2.us = insertelement <2 x double> %add30.v.i1.1.us, double %11, i32 1
  %add30.v.i0.1.us = insertelement <2 x double> undef, double %8, i32 0
  %add30.v.i0.2.us = shufflevector <2 x double> %add30.v.i0.1.us, <2 x double> %sub22.us, <2 x i32> <i32 0, i32 3>
  %add30.us = fadd <2 x double> %add30.v.i0.2.us, %add30.v.i1.2.us
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1.us = extractelement <2 x double> %mul31.us, i32 0
  %mul31.v.r2.us = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.v.r1.us, %mul31.v.r2.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv18, i64 %indvars.iv15, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %12, %mul.us
  %13 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv18, i64 %indvars.iv15, i64 %13
  %14 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %14
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %7, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv18, i64 %indvars.iv15, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us, label %for.body11.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.body11.us
  %cmp6.us = icmp slt i64 %indvars.iv.next16, %1
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98

for.inc98:                                        ; preds = %for.cond8.for.inc95_crit_edge.us
  %cmp2 = icmp slt i64 %3, %1
  br i1 %cmp2, label %for.cond8.preheader.lr.ph, label %for.cond109.preheader.lr.ph.preheader

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.inc98
  br label %for.cond109.preheader.lr.ph

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.inc206
  %indvars.iv30 = phi i64 [ %15, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %15 = add nuw nsw i64 %indvars.iv30, 1
  %16 = add nsw i64 %indvars.iv30, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvars.iv27 = phi i64 [ 1, %for.cond109.preheader.lr.ph ], [ %indvars.iv.next28, %for.cond109.for.inc203_crit_edge.us ]
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %17 = add nsw i64 %indvars.iv27, -1
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us, %for.cond109.preheader.us
  %indvars.iv22 = phi i64 [ 1, %for.cond109.preheader.us ], [ %indvars.iv.next23, %for.body112.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %15, i64 %indvars.iv27, i64 %indvars.iv22
  %18 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv22
  %19 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %19, 2.000000e+00
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %16, i64 %indvars.iv27, i64 %indvars.iv22
  %20 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv30, i64 %indvars.iv.next28, i64 %indvars.iv22
  %21 = load double, double* %arrayidx143.us, align 8
  %22 = insertelement <2 x double> undef, double %mul126.us, i32 0
  %sub127.v.i1.2.us = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.v.i0.1.us = insertelement <2 x double> undef, double %18, i32 0
  %sub127.v.i0.2.us = insertelement <2 x double> %sub127.v.i0.1.us, double %21, i32 1
  %sub127.us = fsub <2 x double> %sub127.v.i0.2.us, %sub127.v.i1.2.us
  %sub127.v.r1.us = extractelement <2 x double> %sub127.us, i32 0
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv30, i64 %17, i64 %indvars.iv22
  %23 = load double, double* %arrayidx158.us, align 8
  %add135.v.i1.1.us = insertelement <2 x double> undef, double %sub127.v.r1.us, i32 0
  %add135.v.i1.2.us = insertelement <2 x double> %add135.v.i1.1.us, double %23, i32 1
  %add135.v.i0.1.us = insertelement <2 x double> undef, double %20, i32 0
  %add135.v.i0.2.us = shufflevector <2 x double> %add135.v.i0.1.us, <2 x double> %sub127.us, <2 x i32> <i32 0, i32 3>
  %add135.us = fadd <2 x double> %add135.v.i0.2.us, %add135.v.i1.2.us
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1.us = extractelement <2 x double> %mul136.us, i32 0
  %mul136.v.r2.us = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.v.r1.us, %mul136.v.r2.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv.next23
  %24 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %24, %mul126.us
  %25 = add nsw i64 %indvars.iv22, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv30, i64 %indvars.iv27, i64 %25
  %26 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %26
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %19, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv30, i64 %indvars.iv27, i64 %indvars.iv22
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond26 = icmp eq i64 %indvars.iv22, %wide.trip.count
  br i1 %exitcond26, label %for.cond109.for.inc203_crit_edge.us, label %for.body112.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.body112.us
  %cmp107.us = icmp slt i64 %indvars.iv.next28, %1
  br i1 %cmp107.us, label %for.cond109.preheader.us, label %for.inc206

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %cmp103 = icmp slt i64 %15, %1
  br i1 %cmp103, label %for.cond109.preheader.lr.ph, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond1.preheader
  %inc210 = add nuw nsw i32 %t.013, 1
  %cmp = icmp slt i32 %inc210, 501
  br i1 %cmp, label %for.cond1.preheader, label %for.end211

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.lr.ph
  %indvars.iv38 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next39, %for.cond2.for.inc21_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv38, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next39 = add nuw i64 %indvars.iv38, 1
  %cmp.us = icmp slt i64 %indvars.iv.next39, %3
  br i1 %cmp.us, label %for.cond5.preheader.us.us.preheader, label %for.end23.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next37, %for.cond5.for.inc18_crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv36 to i32
  %mul81.us.us = add i32 %6, %5
  %add.us.us = mul i32 %mul81.us.us, %n
  %7 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next37 = add nuw i64 %indvars.iv36, 1
  %cmp3.us.us = icmp slt i64 %indvars.iv.next37, %3
  br i1 %cmp3.us.us, label %for.cond5.preheader.us.us, label %for.cond2.for.inc21_crit_edge.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %if.end.us.us ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %rem.us.us = srem i32 %9, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us, %if.then.us.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv36, i64 %indvars.iv
  %12 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp6.us.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp6.us.us, label %for.body7.us.us, label %for.cond5.for.inc18_crit_edge.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

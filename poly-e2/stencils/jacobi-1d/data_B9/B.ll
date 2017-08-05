; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %min.iters.check = icmp eq i32 %n, 1
  br i1 %min.iters.check, label %for.body.lr.ph.for.body_crit_edge, label %min.iters.checked

for.body.lr.ph.for.body_crit_edge:                ; preds = %for.body.lr.ph
  br label %for.body.preheader

min.iters.checked:                                ; preds = %for.body.lr.ph
  %1 = and i32 %n, 1
  %n.mod.vf = zext i32 %1 to i64
  %n.vec = sub nsw i64 %0, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.for.body_crit_edge, label %vector.memcheck

min.iters.checked.for.body_crit_edge:             ; preds = %min.iters.checked
  br label %for.body.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %0
  %scevgep6 = getelementptr double, double* %B, i64 %0
  %bound0 = icmp ugt double* %scevgep6, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %vector.memcheck.for.body_crit_edge, label %vector.ph

vector.memcheck.for.body_crit_edge:               ; preds = %vector.memcheck
  br label %for.body.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind8 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next9, %vector.body.vector.body_crit_edge ]
  %2 = sitofp <2 x i32> %vec.ind8 to <2 x double>
  %3 = fadd <2 x double> %2, <double 2.000000e+00, double 2.000000e+00>
  %4 = fdiv <2 x double> %3, %broadcast.splat
  %5 = getelementptr inbounds double, double* %A, i64 %index
  %6 = bitcast double* %5 to <2 x double>*
  store <2 x double> %4, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = fadd <2 x double> %2, <double 3.000000e+00, double 3.000000e+00>
  %8 = fdiv <2 x double> %7, %broadcast.splat
  %9 = getelementptr inbounds double, double* %B, i64 %index
  %10 = bitcast double* %9 to <2 x double>*
  store <2 x double> %8, <2 x double>* %10, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %11 = icmp eq i64 %index.next, %n.vec
  br i1 %11, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next9 = add <2 x i32> %vec.ind8, <i32 2, i32 2>
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %1, 0
  br i1 %cmp.n, label %middle.block.for.end_crit_edge, label %middle.block.for.body_crit_edge

middle.block.for.body_crit_edge:                  ; preds = %middle.block
  br label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph.for.body_crit_edge, %min.iters.checked.for.body_crit_edge, %vector.memcheck.for.body_crit_edge, %middle.block.for.body_crit_edge
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck.for.body_crit_edge ], [ 0, %min.iters.checked.for.body_crit_edge ], [ 0, %for.body.lr.ph.for.body_crit_edge ], [ %n.vec, %middle.block.for.body_crit_edge ]
  br label %for.body

middle.block.for.end_crit_edge:                   ; preds = %middle.block
  br label %for.end

for.body:                                         ; preds = %for.body.preheader, %for.body.for.body_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body.for.body_crit_edge ], [ %indvars.iv.ph, %for.body.preheader ]
  %12 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %12 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond2, label %for.body.for.end_crit_edge, label %for.body.for.body_crit_edge, !llvm.loop !9

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

for.body.for.end_crit_edge:                       ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.body.for.end_crit_edge, %middle.block.for.end_crit_edge, %entry.for.end_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %tsteps, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp21 = icmp sgt i32 %sub, 1
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp eq i32 %n, 3
  br i1 %cmp21, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge

for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = and i32 %sub, 1
  %lcmp.mod19 = icmp eq i32 %1, 0
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %2 = icmp eq i32 %sub, 2
  %wide.trip.count9.1 = zext i32 %sub to i64
  %arrayidx9.us.prol = getelementptr double, double* %A, i64 2
  %3 = add nsw i64 %wide.trip.count9.1, -2
  %scevgep33 = getelementptr double, double* %B, i64 -1
  %scevgep36 = getelementptr double, double* %B, i64 3
  %scevgep60 = getelementptr double, double* %A, i64 -1
  %scevgep63 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.end32.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %4 = phi i32 [ %inc34.us, %for.end32.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, label %for.body3.us.prol

for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol.loopexit

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %5 = load double, double* %A, align 8
  %6 = load double, double* %arrayidx29.us.prol, align 8
  %add.us.prol = fadd double %5, %6
  %7 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %7
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx21.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 2, %for.body3.us.prol ], [ 1, %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge ]
  br i1 %0, label %for.body3.us.prol.loopexit.for.body16.us.preheader_crit_edge, label %for.body3.us.preheader

for.body3.us.prol.loopexit.for.body16.us.preheader_crit_edge: ; preds = %for.body3.us.prol.loopexit
  br label %for.body16.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %8 = sub nsw i64 %3, %indvars.iv.unr.ph
  %9 = lshr i64 %8, 1
  %10 = add nuw i64 %9, 1
  %min.iters.check49 = icmp ult i64 %10, 2
  br i1 %min.iters.check49, label %for.body3.us.preheader.for.body3.us_crit_edge, label %min.iters.checked50

for.body3.us.preheader.for.body3.us_crit_edge:    ; preds = %for.body3.us.preheader
  br label %for.body3.us.preheader92

min.iters.checked50:                              ; preds = %for.body3.us.preheader
  %n.mod.vf51 = and i64 %10, 1
  %n.vec52 = sub i64 %10, %n.mod.vf51
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  br i1 %cmp.zero53, label %min.iters.checked50.for.body3.us_crit_edge, label %vector.memcheck70

min.iters.checked50.for.body3.us_crit_edge:       ; preds = %min.iters.checked50
  br label %for.body3.us.preheader92

vector.memcheck70:                                ; preds = %min.iters.checked50
  %scevgep55 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %11 = shl nuw i64 %9, 1
  %12 = add i64 %indvars.iv.unr.ph, %11
  %scevgep58 = getelementptr double, double* %arrayidx25.us.prol, i64 %12
  %scevgep61 = getelementptr double, double* %scevgep60, i64 %indvars.iv.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %12
  %bound066 = icmp ult double* %scevgep55, %scevgep64
  %bound167 = icmp ult double* %scevgep61, %scevgep58
  %found.conflict68 = and i1 %bound066, %bound167
  %13 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %14 = add i64 %13, %11
  %15 = shl nuw nsw i64 %n.mod.vf51, 1
  %ind.end75 = sub i64 %14, %15
  br i1 %found.conflict68, label %vector.memcheck70.for.body3.us_crit_edge, label %vector.memcheck70.vector.body46_crit_edge

vector.memcheck70.vector.body46_crit_edge:        ; preds = %vector.memcheck70
  br label %vector.body46

vector.memcheck70.for.body3.us_crit_edge:         ; preds = %vector.memcheck70
  br label %for.body3.us.preheader92

vector.body46:                                    ; preds = %vector.body46.vector.body46_crit_edge, %vector.memcheck70.vector.body46_crit_edge
  %index72 = phi i64 [ %index.next73, %vector.body46.vector.body46_crit_edge ], [ 0, %vector.memcheck70.vector.body46_crit_edge ]
  %16 = shl i64 %index72, 1
  %offset.idx77 = or i64 %indvars.iv.unr.ph, %16
  %17 = add nsw i64 %offset.idx77, -1
  %18 = getelementptr inbounds double, double* %A, i64 %17
  %19 = bitcast double* %18 to <4 x double>*
  %wide.vec81 = load <4 x double>, <4 x double>* %19, align 8, !alias.scope !10
  %strided.vec82 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec83 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %20 = fadd <2 x double> %strided.vec82, %strided.vec83
  %21 = add nuw nsw i64 %offset.idx77, 1
  %22 = getelementptr inbounds double, double* %A, i64 %21
  %23 = getelementptr double, double* %22, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %wide.vec84 = load <4 x double>, <4 x double>* %24, align 8, !alias.scope !10
  %strided.vec86 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %25 = fadd <2 x double> %20, %strided.vec86
  %26 = fmul <2 x double> %25, <double 3.333300e-01, double 3.333300e-01>
  %27 = bitcast double* %22 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %27, align 8, !alias.scope !10
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %28 = fadd <4 x double> %wide.vec84, %wide.vec87
  %29 = shufflevector <4 x double> %28, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %30 = fadd <2 x double> %29, %strided.vec89
  %31 = fmul <2 x double> %30, <double 3.333300e-01, double 3.333300e-01>
  %32 = getelementptr inbounds double, double* %B, i64 %21
  %33 = getelementptr double, double* %32, i64 -1
  %34 = bitcast double* %33 to <4 x double>*
  %interleaved.vec90 = shufflevector <2 x double> %26, <2 x double> %31, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec90, <4 x double>* %34, align 8, !alias.scope !13, !noalias !10
  %index.next73 = add i64 %index72, 2
  %35 = icmp eq i64 %index.next73, %n.vec52
  br i1 %35, label %middle.block47, label %vector.body46.vector.body46_crit_edge, !llvm.loop !15

vector.body46.vector.body46_crit_edge:            ; preds = %vector.body46
  br label %vector.body46

middle.block47:                                   ; preds = %vector.body46
  %cmp.n76 = icmp eq i64 %n.mod.vf51, 0
  br i1 %cmp.n76, label %middle.block47.for.body16.us.preheader_crit_edge, label %middle.block47.for.body3.us_crit_edge

middle.block47.for.body3.us_crit_edge:            ; preds = %middle.block47
  br label %for.body3.us.preheader92

for.body3.us.preheader92:                         ; preds = %for.body3.us.preheader.for.body3.us_crit_edge, %min.iters.checked50.for.body3.us_crit_edge, %vector.memcheck70.for.body3.us_crit_edge, %middle.block47.for.body3.us_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck70.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %min.iters.checked50.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body3.us.preheader.for.body3.us_crit_edge ], [ %ind.end75, %middle.block47.for.body3.us_crit_edge ]
  br label %for.body3.us

middle.block47.for.body16.us.preheader_crit_edge: ; preds = %middle.block47
  br label %for.body16.us.preheader

for.end32.us:                                     ; preds = %middle.block.for.end32.us_crit_edge, %for.body16.us.prol.loopexit.for.end32.us_crit_edge, %for.body16.us.for.end32.us_crit_edge
  %inc34.us = add nuw nsw i32 %4, 1
  %exitcond11 = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond11, label %for.end32.us.for.end35_crit_edge, label %for.end32.us.for.cond1.preheader.us_crit_edge

for.end32.us.for.cond1.preheader.us_crit_edge:    ; preds = %for.end32.us
  br label %for.cond1.preheader.us

for.end32.us.for.end35_crit_edge:                 ; preds = %for.end32.us
  br label %for.end35

for.body16.us:                                    ; preds = %for.body16.us.preheader91, %for.body16.us.for.body16.us_crit_edge
  %indvars.iv6 = phi i64 [ %indvars.iv.next7.1, %for.body16.us.for.body16.us_crit_edge ], [ %indvars.iv6.ph, %for.body16.us.preheader91 ]
  %36 = add nsw i64 %indvars.iv6, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %36
  %37 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv6
  %38 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %37, %38
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next7
  %39 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %39
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv6
  store double %mul27.us, double* %arrayidx29.us, align 8
  %40 = load double, double* %arrayidx21.us, align 8
  %41 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %40, %41
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next7.1
  %42 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %42
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next7
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond10.1 = icmp eq i64 %indvars.iv.next7.1, %wide.trip.count9.1
  br i1 %exitcond10.1, label %for.body16.us.for.end32.us_crit_edge, label %for.body16.us.for.body16.us_crit_edge, !llvm.loop !16

for.body16.us.for.body16.us_crit_edge:            ; preds = %for.body16.us
  br label %for.body16.us

for.body16.us.for.end32.us_crit_edge:             ; preds = %for.body16.us
  br label %for.end32.us

for.body3.us:                                     ; preds = %for.body3.us.preheader92, %for.body3.us.for.body3.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader92 ]
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %43
  %44 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %45 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %44, %45
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %46 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %46
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %47 = load double, double* %arrayidx6.us, align 8
  %48 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %47, %48
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %49 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %49
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count9.1
  br i1 %exitcond.1, label %for.body3.us.for.body16.us.preheader_crit_edge, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !17

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.body3.us.for.body16.us.preheader_crit_edge:   ; preds = %for.body3.us
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %for.body3.us.for.body16.us.preheader_crit_edge, %middle.block47.for.body16.us.preheader_crit_edge, %for.body3.us.prol.loopexit.for.body16.us.preheader_crit_edge
  br i1 %lcmp.mod19, label %for.body16.us.prol, label %for.body16.us.preheader.for.body16.us.prol.loopexit_crit_edge

for.body16.us.preheader.for.body16.us.prol.loopexit_crit_edge: ; preds = %for.body16.us.preheader
  br label %for.body16.us.prol.loopexit

for.body16.us.prol:                               ; preds = %for.body16.us.preheader
  %50 = load double, double* %B, align 8
  %51 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %50, %51
  %52 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %52
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.body16.us.prol.loopexit

for.body16.us.prol.loopexit:                      ; preds = %for.body16.us.preheader.for.body16.us.prol.loopexit_crit_edge, %for.body16.us.prol
  %indvars.iv6.unr.ph = phi i64 [ 2, %for.body16.us.prol ], [ 1, %for.body16.us.preheader.for.body16.us.prol.loopexit_crit_edge ]
  br i1 %2, label %for.body16.us.prol.loopexit.for.end32.us_crit_edge, label %for.body16.us.preheader26

for.body16.us.prol.loopexit.for.end32.us_crit_edge: ; preds = %for.body16.us.prol.loopexit
  br label %for.end32.us

for.body16.us.preheader26:                        ; preds = %for.body16.us.prol.loopexit
  %53 = sub nsw i64 %3, %indvars.iv6.unr.ph
  %54 = lshr i64 %53, 1
  %55 = add nuw i64 %54, 1
  %min.iters.check = icmp ult i64 %55, 2
  br i1 %min.iters.check, label %for.body16.us.preheader26.for.body16.us_crit_edge, label %min.iters.checked

for.body16.us.preheader26.for.body16.us_crit_edge: ; preds = %for.body16.us.preheader26
  br label %for.body16.us.preheader91

min.iters.checked:                                ; preds = %for.body16.us.preheader26
  %n.mod.vf = and i64 %55, 1
  %n.vec = sub i64 %55, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.for.body16.us_crit_edge, label %vector.memcheck

min.iters.checked.for.body16.us_crit_edge:        ; preds = %min.iters.checked
  br label %for.body16.us.preheader91

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv6.unr.ph
  %56 = shl nuw i64 %54, 1
  %57 = add i64 %indvars.iv6.unr.ph, %56
  %scevgep31 = getelementptr double, double* %arrayidx9.us.prol, i64 %57
  %scevgep34 = getelementptr double, double* %scevgep33, i64 %indvars.iv6.unr.ph
  %scevgep37 = getelementptr double, double* %scevgep36, i64 %57
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep34, %scevgep31
  %found.conflict = and i1 %bound0, %bound1
  %58 = add nuw nsw i64 %indvars.iv6.unr.ph, 2
  %59 = add i64 %58, %56
  %60 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %59, %60
  br i1 %found.conflict, label %vector.memcheck.for.body16.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.for.body16.us_crit_edge:          ; preds = %vector.memcheck
  br label %for.body16.us.preheader91

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %61 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv6.unr.ph, %61
  %62 = add nsw i64 %offset.idx, -1
  %63 = getelementptr inbounds double, double* %B, i64 %62
  %64 = bitcast double* %63 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %64, align 8, !alias.scope !18
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec39 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %65 = fadd <2 x double> %strided.vec, %strided.vec39
  %66 = add nuw nsw i64 %offset.idx, 1
  %67 = getelementptr inbounds double, double* %B, i64 %66
  %68 = getelementptr double, double* %67, i64 -1
  %69 = bitcast double* %68 to <4 x double>*
  %wide.vec40 = load <4 x double>, <4 x double>* %69, align 8, !alias.scope !18
  %strided.vec42 = shufflevector <4 x double> %wide.vec40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %70 = fadd <2 x double> %65, %strided.vec42
  %71 = fmul <2 x double> %70, <double 3.333300e-01, double 3.333300e-01>
  %72 = bitcast double* %67 to <4 x double>*
  %wide.vec43 = load <4 x double>, <4 x double>* %72, align 8, !alias.scope !18
  %strided.vec45 = shufflevector <4 x double> %wide.vec43, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %73 = fadd <4 x double> %wide.vec40, %wide.vec43
  %74 = shufflevector <4 x double> %73, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %75 = fadd <2 x double> %74, %strided.vec45
  %76 = fmul <2 x double> %75, <double 3.333300e-01, double 3.333300e-01>
  %77 = getelementptr inbounds double, double* %A, i64 %66
  %78 = getelementptr double, double* %77, i64 -1
  %79 = bitcast double* %78 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %71, <2 x double> %76, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %79, align 8, !alias.scope !21, !noalias !18
  %index.next = add i64 %index, 2
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.for.end32.us_crit_edge, label %middle.block.for.body16.us_crit_edge

middle.block.for.body16.us_crit_edge:             ; preds = %middle.block
  br label %for.body16.us.preheader91

for.body16.us.preheader91:                        ; preds = %for.body16.us.preheader26.for.body16.us_crit_edge, %min.iters.checked.for.body16.us_crit_edge, %vector.memcheck.for.body16.us_crit_edge, %middle.block.for.body16.us_crit_edge
  %indvars.iv6.ph = phi i64 [ %indvars.iv6.unr.ph, %vector.memcheck.for.body16.us_crit_edge ], [ %indvars.iv6.unr.ph, %min.iters.checked.for.body16.us_crit_edge ], [ %indvars.iv6.unr.ph, %for.body16.us.preheader26.for.body16.us_crit_edge ], [ %ind.end, %middle.block.for.body16.us_crit_edge ]
  br label %for.body16.us

middle.block.for.end32.us_crit_edge:              ; preds = %middle.block
  br label %for.end32.us

for.cond1.preheader:                              ; preds = %for.cond1.preheader.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge
  %81 = phi i32 [ %inc34, %for.cond1.preheader.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge ]
  %inc34 = add nuw nsw i32 %81, 1
  %exitcond17 = icmp eq i32 %inc34, %tsteps
  br i1 %exitcond17, label %for.cond1.preheader.for.end35_crit_edge, label %for.cond1.preheader.for.cond1.preheader_crit_edge

for.cond1.preheader.for.cond1.preheader_crit_edge: ; preds = %for.cond1.preheader
  br label %for.cond1.preheader

for.cond1.preheader.for.end35_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.end35

for.end35:                                        ; preds = %for.cond1.preheader.for.end35_crit_edge, %for.end32.us.for.end35_crit_edge, %entry.for.end35_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond2, label %if.end.for.end_crit_edge, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

if.end.for.end_crit_edge:                         ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %if.end.for.end_crit_edge, %entry.for.end_crit_edge
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = distinct !{!17, !7, !8}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !7, !8}

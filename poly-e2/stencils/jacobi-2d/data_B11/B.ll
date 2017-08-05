; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  %1 = bitcast i8* %call to [1300 x double]*
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %0 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count9 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next8, %for.cond1.for.inc20_crit_edge.us ]
  %1 = trunc i64 %indvars.iv7 to i32
  %conv.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.v.i0.2.us = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv4.us = sitofp i32 %4 to double
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv11.us = sitofp i32 %6 to double
  %mul.v.i1.1.us = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.v.i1.2.us = insertelement <2 x double> %mul.v.i1.1.us, double %conv11.us, i32 1
  %mul.us = fmul <2 x double> %mul.v.i0.2.us, %mul.v.i1.2.us
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 3.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, %div.v.i1.2
  %div.v.r1.us = extractelement <2 x double> %div.us, i32 0
  %div.v.r2.us = extractelement <2 x double> %div.us, i32 1
  store double %div.v.r1.us, double* %arrayidx8.us, align 8
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %div.v.r2.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %tsteps, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %wide.trip.count18 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %wide.trip.count28 = zext i32 %sub to i64
  %wide.trip.count23 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count23, -1
  %1 = icmp sgt i32 %sub, 1
  %min.iters.check51 = icmp ult i64 %0, 4
  %n.vec54 = and i64 %0, -4
  %cmp.zero55 = icmp eq i64 %n.vec54, 0
  %ind.end76 = or i64 %n.vec54, 1
  %cmp.n77 = icmp eq i64 %0, %n.vec54
  %2 = icmp sgt i32 %sub, 1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %t.010 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %1, label %for.cond1.preheader.for.cond4.preheader.us_crit_edge, label %for.inc87

for.cond1.preheader.for.cond4.preheader.us_crit_edge: ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc37_crit_edge.us, %for.cond1.preheader.for.cond4.preheader.us_crit_edge
  %indvar57 = phi i64 [ 0, %for.cond1.preheader.for.cond4.preheader.us_crit_edge ], [ %indvar.next58, %for.cond4.for.inc37_crit_edge.us ]
  %indvars.iv15 = phi i64 [ 1, %for.cond1.preheader.for.cond4.preheader.us_crit_edge ], [ %indvars.iv.next16, %for.cond4.for.inc37_crit_edge.us ]
  %3 = add i64 %indvar57, 1
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 1
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %B, i64 %3, i64 %wide.trip.count23
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar57, i64 1
  %4 = add i64 %indvar57, 2
  %scevgep65 = getelementptr [1300 x double], [1300 x double]* %A, i64 %4, i64 %wide.trip.count23
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %5 = add nsw i64 %indvars.iv15, -1
  br i1 %min.iters.check51, label %for.body7.us.preheader, label %min.iters.checked52

min.iters.checked52:                              ; preds = %for.cond4.preheader.us
  br i1 %cmp.zero55, label %for.body7.us.preheader, label %vector.memcheck71

vector.memcheck71:                                ; preds = %min.iters.checked52
  %bound067 = icmp ult double* %scevgep59, %scevgep65
  %bound168 = icmp ult double* %scevgep63, %scevgep61
  %memcheck.conflict70 = and i1 %bound067, %bound168
  br i1 %memcheck.conflict70, label %for.body7.us.preheader, label %vector.memcheck71.vector.body48_crit_edge

vector.memcheck71.vector.body48_crit_edge:        ; preds = %vector.memcheck71
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48, %vector.memcheck71.vector.body48_crit_edge
  %index73 = phi i64 [ 0, %vector.memcheck71.vector.body48_crit_edge ], [ %index.next74, %vector.body48 ]
  %offset.idx78 = or i64 %index73, 1
  %6 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %offset.idx78
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = add nsw i64 %offset.idx78, -1
  %11 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %10
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load83, %wide.load85
  %16 = fadd <2 x double> %wide.load84, %wide.load86
  %17 = add nuw nsw i64 %offset.idx78, 1
  %18 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %17
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %15, %wide.load87
  %23 = fadd <2 x double> %16, %wide.load88
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next16, i64 %offset.idx78
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %22, %wide.load89
  %29 = fadd <2 x double> %23, %wide.load90
  %30 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %offset.idx78
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !1
  %34 = fadd <2 x double> %28, %wide.load91
  %35 = fadd <2 x double> %29, %wide.load92
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv15, i64 %offset.idx78
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %36, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  store <2 x double> %37, <2 x double>* %41, align 8, !alias.scope !4, !noalias !1
  %index.next74 = add i64 %index73, 4
  %42 = icmp eq i64 %index.next74, %n.vec54
  br i1 %42, label %middle.block49, label %vector.body48, !llvm.loop !6

middle.block49:                                   ; preds = %vector.body48
  br i1 %cmp.n77, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block49, %vector.memcheck71, %min.iters.checked52, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %for.cond4.preheader.us ], [ 1, %min.iters.checked52 ], [ 1, %vector.memcheck71 ], [ %ind.end76, %middle.block49 ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us, %for.body7.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.ph, %for.body7.us.preheader ], [ %indvars.iv.next, %for.body7.us ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %43 = load double, double* %arrayidx9.us, align 8
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %44
  %45 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %43, %45
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next
  %46 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %46
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next16, i64 %indvars.iv
  %47 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %47
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %5, i64 %indvars.iv
  %48 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %48
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv15, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.body7.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.body7.us
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block49
  %exitcond19 = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  %indvar.next58 = add i64 %indvar57, 1
  br i1 %exitcond19, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 %2, label %for.cond40.preheader.for.cond44.preheader.us_crit_edge, label %for.inc87

for.cond40.preheader.for.cond44.preheader.us_crit_edge: ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.for.inc84_crit_edge.us, %for.cond40.preheader.for.cond44.preheader.us_crit_edge
  %indvar = phi i64 [ 0, %for.cond40.preheader.for.cond44.preheader.us_crit_edge ], [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ]
  %indvars.iv25 = phi i64 [ 1, %for.cond40.preheader.for.cond44.preheader.us_crit_edge ], [ %indvars.iv.next26, %for.cond44.for.inc84_crit_edge.us ]
  %49 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %49, i64 1
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %A, i64 %49, i64 %wide.trip.count23
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %50 = add i64 %indvar, 2
  %scevgep36 = getelementptr [1300 x double], [1300 x double]* %B, i64 %50, i64 %wide.trip.count23
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %51 = add nsw i64 %indvars.iv25, -1
  br i1 %min.iters.check, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 %cmp.zero, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ 0, %vector.memcheck.vector.body_crit_edge ], [ %index.next, %vector.body ]
  %offset.idx = or i64 %index, 1
  %52 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = add nsw i64 %offset.idx, -1
  %57 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %56
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load, %wide.load40
  %62 = fadd <2 x double> %wide.load39, %wide.load41
  %63 = add nuw nsw i64 %offset.idx, 1
  %64 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %63
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %61, %wide.load42
  %69 = fadd <2 x double> %62, %wide.load43
  %70 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next26, i64 %offset.idx
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %68, %wide.load44
  %75 = fadd <2 x double> %69, %wide.load45
  %76 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !10
  %80 = fadd <2 x double> %74, %wide.load46
  %81 = fadd <2 x double> %75, %wide.load47
  %82 = fmul <2 x double> %80, <double 2.000000e-01, double 2.000000e-01>
  %83 = fmul <2 x double> %81, <double 2.000000e-01, double 2.000000e-01>
  %84 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv25, i64 %offset.idx
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %82, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x double>*
  store <2 x double> %83, <2 x double>* %87, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %88 = icmp eq i64 %index.next, %n.vec
  br i1 %88, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv20.ph = phi i64 [ 1, %for.cond44.preheader.us ], [ 1, %min.iters.checked ], [ 1, %vector.memcheck ], [ %ind.end, %middle.block ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us, %for.body47.us.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv20.ph, %for.body47.us.preheader ], [ %indvars.iv.next21, %for.body47.us ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv20
  %89 = load double, double* %arrayidx51.us, align 8
  %90 = add nsw i64 %indvars.iv20, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %90
  %91 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %89, %91
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv.next21
  %92 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %92
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next26, i64 %indvars.iv20
  %93 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %93
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %51, i64 %indvars.iv20
  %94 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %94
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv20
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond24 = icmp eq i64 %indvars.iv.next21, %wide.trip.count23
  br i1 %exitcond24, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.body47.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.body47.us
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond29 = icmp eq i64 %indvars.iv.next26, %wide.trip.count28
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond29, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond40.preheader, %for.cond1.preheader
  %inc88 = add nuw nsw i32 %t.010, 1
  %exitcond30 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond30, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1300 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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

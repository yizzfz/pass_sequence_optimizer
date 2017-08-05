; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  tail call void @print_array(i32 1300, [1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count9 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %0 = trunc i64 %indvars.iv7 to i32
  %conv.us = sitofp i32 %0 to double
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, %conv6
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11.us = sitofp i32 %4 to double
  %mul12.us = fmul double %conv.us, %conv11.us
  %add13.us = fadd double %mul12.us, 3.000000e+00
  %div15.us = fdiv double %add13.us, %conv6
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %div15.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) #2 {
entry:
  %cmp9 = icmp sgt i32 %tsteps, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp23 = icmp sgt i32 %sub, 1
  %wide.trip.count15 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %cmp427 = icmp sgt i32 %sub, 1
  %wide.trip.count25 = zext i32 %sub to i64
  %wide.trip.count20 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count20, -1
  %min.iters.check49 = icmp ult i64 %0, 4
  %n.vec52 = and i64 %0, -4
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  %ind.end74 = or i64 %n.vec52, 1
  %cmp.n75 = icmp eq i64 %0, %n.vec52
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %t.010 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp23, label %for.cond4.preheader.us.preheader, label %for.inc87

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvar55 = phi i64 [ %indvar.next56, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %1 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 %wide.trip.count20
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar55, i64 1
  %2 = add i64 %indvar55, 2
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %A, i64 %2, i64 %wide.trip.count20
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %3 = add nsw i64 %indvars.iv12, -1
  br i1 %min.iters.check49, label %for.inc.us.preheader, label %min.iters.checked50

min.iters.checked50:                              ; preds = %for.cond4.preheader.us
  br i1 %cmp.zero53, label %for.inc.us.preheader, label %vector.memcheck69

vector.memcheck69:                                ; preds = %min.iters.checked50
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %for.inc.us.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck69
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index71 = phi i64 [ %index.next72, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx76 = or i64 %index71, 1
  %4 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %offset.idx76
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = add nsw i64 %offset.idx76, -1
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %8
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load81, %wide.load83
  %14 = fadd <2 x double> %wide.load82, %wide.load84
  %15 = add nuw nsw i64 %offset.idx76, 1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %13, %wide.load85
  %21 = fadd <2 x double> %14, %wide.load86
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %offset.idx76
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %20, %wide.load87
  %27 = fadd <2 x double> %21, %wide.load88
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %offset.idx76
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %26, %wide.load89
  %33 = fadd <2 x double> %27, %wide.load90
  %34 = fmul <2 x double> %32, <double 2.000000e-01, double 2.000000e-01>
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %offset.idx76
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %34, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %35, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next72 = add i64 %index71, 4
  %40 = icmp eq i64 %index.next72, %n.vec52
  br i1 %40, label %middle.block47, label %vector.body46, !llvm.loop !6

middle.block47:                                   ; preds = %vector.body46
  br i1 %cmp.n75, label %for.cond4.for.inc37_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block47, %vector.memcheck69, %min.iters.checked50, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck69 ], [ 1, %min.iters.checked50 ], [ 1, %for.cond4.preheader.us ], [ %ind.end74, %middle.block47 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %41 = load double, double* %arrayidx9.us, align 8
  %42 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %42
  %43 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %41, %43
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %44
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %indvars.iv
  %45 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %45
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %indvars.iv
  %46 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %46
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.inc.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.inc.us
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block47
  %exitcond16 = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %exitcond16, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 %cmp427, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %47 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 1
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 %wide.trip.count20
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %48 = add i64 %indvar, 2
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %B, i64 %48, i64 %wide.trip.count20
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %49 = add nsw i64 %indvars.iv22, -1
  br i1 %min.iters.check, label %for.inc81.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 %cmp.zero, label %for.inc81.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc81.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load, %wide.load38
  %60 = fadd <2 x double> %wide.load37, %wide.load39
  %61 = add nuw nsw i64 %offset.idx, 1
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %59, %wide.load40
  %67 = fadd <2 x double> %60, %wide.load41
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %66, %wide.load42
  %73 = fadd <2 x double> %67, %wide.load43
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %72, %wide.load44
  %79 = fadd <2 x double> %73, %wide.load45
  %80 = fmul <2 x double> %78, <double 2.000000e-01, double 2.000000e-01>
  %81 = fmul <2 x double> %79, <double 2.000000e-01, double 2.000000e-01>
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %80, <2 x double>* %83, align 8, !alias.scope !13, !noalias !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %81, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %86 = icmp eq i64 %index.next, %n.vec
  br i1 %86, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond44.for.inc84_crit_edge.us, label %for.inc81.us.preheader

for.inc81.us.preheader:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv17.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc81.us

for.inc81.us:                                     ; preds = %for.inc81.us.preheader, %for.inc81.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.inc81.us ], [ %indvars.iv17.ph, %for.inc81.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv17
  %87 = load double, double* %arrayidx51.us, align 8
  %88 = add nsw i64 %indvars.iv17, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %88
  %89 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %87, %89
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv.next18
  %90 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %90
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %indvars.iv17
  %91 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %91
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %indvars.iv17
  %92 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %92
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv17
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond21 = icmp eq i64 %indvars.iv.next18, %wide.trip.count20
  br i1 %exitcond21, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.inc81.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.inc81.us
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond26 = icmp eq i64 %indvars.iv.next23, %wide.trip.count25
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond26, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond1.preheader, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %t.010, 1
  %exitcond27 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond27, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1300 x double]* nocapture readonly %A) #0 {
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

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
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
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

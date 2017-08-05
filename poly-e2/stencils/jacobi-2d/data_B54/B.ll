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
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %0 = trunc i64 %indvars.iv7 to i32
  %conv.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %2 = add nuw nsw i64 %indvars.iv, 2
  %3 = trunc i64 %2 to i32
  %conv4.us = sitofp i32 %3 to double
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %4 = add nuw nsw i64 %indvars.iv, 3
  %5 = trunc i64 %4 to i32
  %conv11.us = sitofp i32 %5 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv11.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 3.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, <double 1.300000e+03, double 1.300000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx8.us, align 8
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond12, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1300
  br i1 %exitcond, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %t.010 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 true, label %for.cond4.preheader.us.preheader, label %for.inc87

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvar57 = phi i64 [ %indvar.next58, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %0 = add i64 %indvar57, 1
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %B, i64 %0, i64 1299
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar57, i64 1
  %1 = add i64 %indvar57, 2
  %scevgep65 = getelementptr [1300 x double], [1300 x double]* %A, i64 %1, i64 1299
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %2 = add nsw i64 %indvars.iv12, -1
  br i1 false, label %for.body7.us.preheader, label %min.iters.checked52

min.iters.checked52:                              ; preds = %for.cond4.preheader.us
  br i1 false, label %for.body7.us.preheader, label %vector.memcheck71

vector.memcheck71:                                ; preds = %min.iters.checked52
  %bound067 = icmp ult double* %scevgep59, %scevgep65
  %bound168 = icmp ult double* %scevgep63, %scevgep61
  %memcheck.conflict70 = and i1 %bound067, %bound168
  br i1 %memcheck.conflict70, label %for.body7.us.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %vector.memcheck71
  br label %vector.body48

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index73 = phi i64 [ %index.next74, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %offset.idx78 = or i64 %index73, 1
  %3 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %offset.idx78
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = add nsw i64 %offset.idx78, -1
  %8 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = fadd <2 x double> %wide.load83, %wide.load85
  %13 = fadd <2 x double> %wide.load84, %wide.load86
  %14 = add nuw nsw i64 %offset.idx78, 1
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %12, %wide.load87
  %20 = fadd <2 x double> %13, %wide.load88
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %offset.idx78
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %19, %wide.load89
  %26 = fadd <2 x double> %20, %wide.load90
  %27 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %offset.idx78
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %25, %wide.load91
  %32 = fadd <2 x double> %26, %wide.load92
  %33 = fmul <2 x double> %31, <double 2.000000e-01, double 2.000000e-01>
  %34 = fmul <2 x double> %32, <double 2.000000e-01, double 2.000000e-01>
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %offset.idx78
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %33, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %34, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %index.next74 = add i64 %index73, 4
  %39 = icmp eq i64 %index.next74, 1296
  br i1 %39, label %middle.block49, label %vector.body48, !llvm.loop !6

middle.block49:                                   ; preds = %vector.body48
  br i1 false, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block49, %vector.memcheck71, %min.iters.checked52, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck71 ], [ 1, %min.iters.checked52 ], [ 1, %for.cond4.preheader.us ], [ 1297, %middle.block49 ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %40 = load double, double* %arrayidx9.us, align 8
  %41 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %41
  %42 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %40, %42
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %43
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %indvars.iv
  %44 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %44
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %2, i64 %indvars.iv
  %45 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %45
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond29 = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond29, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.body7.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.body7.us
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block49
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 1299
  %indvar.next58 = add i64 %indvar57, 1
  br i1 %exitcond16, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 true, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %46 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %46, i64 1
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %A, i64 %46, i64 1299
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %47 = add i64 %indvar, 2
  %scevgep36 = getelementptr [1300 x double], [1300 x double]* %B, i64 %47, i64 1299
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %48 = add nsw i64 %indvars.iv22, -1
  br i1 false, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 false, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep36
  %bound1 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %49 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %offset.idx
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = add nsw i64 %offset.idx, -1
  %54 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %53
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load, %wide.load40
  %59 = fadd <2 x double> %wide.load39, %wide.load41
  %60 = add nuw nsw i64 %offset.idx, 1
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %60
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %58, %wide.load42
  %66 = fadd <2 x double> %59, %wide.load43
  %67 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %offset.idx
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fadd <2 x double> %65, %wide.load44
  %72 = fadd <2 x double> %66, %wide.load45
  %73 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %48, i64 %offset.idx
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %71, %wide.load46
  %78 = fadd <2 x double> %72, %wide.load47
  %79 = fmul <2 x double> %77, <double 2.000000e-01, double 2.000000e-01>
  %80 = fmul <2 x double> %78, <double 2.000000e-01, double 2.000000e-01>
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %79, <2 x double>* %82, align 8, !alias.scope !13, !noalias !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> %80, <2 x double>* %84, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %85 = icmp eq i64 %index.next, 1296
  br i1 %85, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 false, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv17.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader.us ], [ 1297, %middle.block ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.body47.us ], [ %indvars.iv17.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv17
  %86 = load double, double* %arrayidx51.us, align 8
  %87 = add nsw i64 %indvars.iv17, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %87
  %88 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %86, %88
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv.next18
  %89 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %89
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %indvars.iv17
  %90 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %90
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %48, i64 %indvars.iv17
  %91 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %91
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv17
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next18, 1299
  br i1 %exitcond, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.body47.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.body47.us
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 1299
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond26, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond1.preheader, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %t.010, 1
  %exitcond27 = icmp eq i32 %inc88, 500
  br i1 %exitcond27, label %for.end89.loopexit, label %for.cond1.preheader

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
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv7, 1300
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1300
  br i1 %exitcond, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

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
define i32 @main(i32 %argc, i8** %argv) #0 {
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
define internal void @init_array(i32 %n, [1300 x double]* %A, [1300 x double]* %B) #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count8 = zext i32 %n to i64
  %0 = insertelement <2 x double> undef, double %conv6, i32 0
  %div.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %1 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %1 to double
  %2 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us ]
  %3 = add nuw nsw i64 %indvars.iv, 2
  %4 = trunc i64 %3 to i32
  %conv4.us = sitofp i32 %4 to double
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  %5 = add nuw nsw i64 %indvars.iv, 3
  %6 = trunc i64 %5 to i32
  %conv11.us = sitofp i32 %6 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv4.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv11.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %add5.us = fadd <2 x double> %mul.us, <double 2.000000e+00, double 3.000000e+00>
  %div.us = fdiv <2 x double> %add5.us, %div.us.v.i1.2
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx8.us, align 8
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* %A, [1300 x double]* %B) #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub, 1
  %sub5 = add nsw i32 %n, -1
  %cmp61 = icmp sgt i32 %sub5, 1
  %wide.trip.count21 = zext i32 %sub to i64
  %wide.trip.count16 = zext i32 %sub to i64
  %wide.trip.count11 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %cmp424 = icmp sgt i32 %sub, 1
  %0 = add nsw i64 %wide.trip.count16, -1
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  %min.iters.check47 = icmp ult i64 %0, 4
  %n.vec50 = and i64 %0, -4
  %cmp.zero51 = icmp eq i64 %n.vec50, 0
  %ind.end72 = or i64 %n.vec50, 1
  %cmp.n73 = icmp eq i64 %0, %n.vec50
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %1 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp22, label %for.cond4.preheader.lr.ph, label %for.inc87

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %cmp61, label %for.cond4.preheader.us.preheader, label %for.cond44.preheader.us.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.for.inc37_crit_edge.us
  %indvar53 = phi i64 [ %indvar.next54, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %2 = add i64 %indvar53, 1
  %scevgep55 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 1
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 %wide.trip.count16
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar53, i64 1
  %3 = add i64 %indvar53, 2
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %A, i64 %3, i64 %wide.trip.count16
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %4 = add nsw i64 %indvars.iv8, -1
  br i1 %min.iters.check47, label %for.body7.us.preheader, label %min.iters.checked48

min.iters.checked48:                              ; preds = %for.cond4.preheader.us
  br i1 %cmp.zero51, label %for.body7.us.preheader, label %vector.memcheck67

vector.memcheck67:                                ; preds = %min.iters.checked48
  %bound063 = icmp ult double* %scevgep55, %scevgep61
  %bound164 = icmp ult double* %scevgep59, %scevgep57
  %memcheck.conflict66 = and i1 %bound063, %bound164
  br i1 %memcheck.conflict66, label %for.body7.us.preheader, label %vector.body44.preheader

vector.body44.preheader:                          ; preds = %vector.memcheck67
  br label %vector.body44

vector.body44:                                    ; preds = %vector.body44.preheader, %vector.body44
  %index69 = phi i64 [ %index.next70, %vector.body44 ], [ 0, %vector.body44.preheader ]
  %offset.idx74 = or i64 %index69, 1
  %5 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %offset.idx74
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = add nsw i64 %offset.idx74, -1
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load79, %wide.load81
  %15 = fadd <2 x double> %wide.load80, %wide.load82
  %16 = add nuw nsw i64 %offset.idx74, 1
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %14, %wide.load83
  %22 = fadd <2 x double> %15, %wide.load84
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next9, i64 %offset.idx74
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %21, %wide.load85
  %28 = fadd <2 x double> %22, %wide.load86
  %29 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %offset.idx74
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %27, %wide.load87
  %34 = fadd <2 x double> %28, %wide.load88
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv8, i64 %offset.idx74
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %35, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %36, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next70 = add i64 %index69, 4
  %41 = icmp eq i64 %index.next70, %n.vec50
  br i1 %41, label %middle.block45, label %vector.body44, !llvm.loop !6

middle.block45:                                   ; preds = %vector.body44
  br i1 %cmp.n73, label %for.cond4.for.inc37_crit_edge.us, label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block45, %vector.memcheck67, %min.iters.checked48, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck67 ], [ 1, %min.iters.checked48 ], [ 1, %for.cond4.preheader.us ], [ %ind.end72, %middle.block45 ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %42 = load double, double* %arrayidx9.us, align 8
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %43
  %44 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %42, %44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv.next
  %45 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %45
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next9, i64 %indvars.iv
  %46 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %46
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %indvars.iv
  %47 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %47
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.body7.us, !llvm.loop !9

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.body7.us
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block45
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  %indvar.next54 = add i64 %indvar53, 1
  br i1 %exitcond12, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  br i1 %cmp424, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader, %for.cond4.preheader.lr.ph
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.preheader.us.preheader, %for.cond44.for.inc84_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %48 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 1
  %scevgep28 = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 %wide.trip.count16
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %49 = add i64 %indvar, 2
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %B, i64 %49, i64 %wide.trip.count16
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %50 = add nsw i64 %indvars.iv18, -1
  br i1 %min.iters.check, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 %cmp.zero, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = add nsw i64 %offset.idx, -1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %wide.load, %wide.load36
  %61 = fadd <2 x double> %wide.load35, %wide.load37
  %62 = add nuw nsw i64 %offset.idx, 1
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = fadd <2 x double> %60, %wide.load38
  %68 = fadd <2 x double> %61, %wide.load39
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next19, i64 %offset.idx
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %67, %wide.load40
  %74 = fadd <2 x double> %68, %wide.load41
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %73, %wide.load42
  %80 = fadd <2 x double> %74, %wide.load43
  %81 = fmul <2 x double> %79, <double 2.000000e-01, double 2.000000e-01>
  %82 = fmul <2 x double> %80, <double 2.000000e-01, double 2.000000e-01>
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv18, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> %81, <2 x double>* %84, align 8, !alias.scope !13, !noalias !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> %82, <2 x double>* %86, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %87 = icmp eq i64 %index.next, %n.vec
  br i1 %87, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond44.for.inc84_crit_edge.us, label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv13.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.body47.us ], [ %indvars.iv13.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv13
  %88 = load double, double* %arrayidx51.us, align 8
  %89 = add nsw i64 %indvars.iv13, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %89
  %90 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %88, %90
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv.next14
  %91 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %91
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next19, i64 %indvars.iv13
  %92 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %92
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %indvars.iv13
  %93 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %93
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv13
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond17 = icmp eq i64 %indvars.iv.next14, %wide.trip.count16
  br i1 %exitcond17, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.body47.us, !llvm.loop !16

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.body47.us
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond22 = icmp eq i64 %indvars.iv.next19, %wide.trip.count21
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond22, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  br label %for.inc87

for.inc87:                                        ; preds = %for.inc87.loopexit, %for.cond1.preheader, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %1, 1
  %exitcond23 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond23, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1300 x double]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count7 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next5, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv4, %3
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

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next5, %wide.trip.count7
  br i1 %exitcond8, label %for.end12.loopexit, label %for.cond2.preheader.us

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

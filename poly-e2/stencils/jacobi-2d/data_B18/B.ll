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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %arraydecay)
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
  br i1 %cmp3, label %for.cond.for.cond1_crit_edge.lr.ph, label %for.end22

for.cond.for.cond1_crit_edge.lr.ph:               ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count8 = zext i32 %n to i64
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %for.cond1.for.end_crit_edge.us, %for.cond.for.cond1_crit_edge.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond1.for.end_crit_edge.us ], [ 0, %for.cond.for.cond1_crit_edge.lr.ph ]
  %0 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %0 to double
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond.for.cond1_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond1_crit_edge.us ], [ %indvars.iv.next, %for.body3.us ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, %conv6
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11.us = sitofp i32 %4 to double
  %mul12.us = fmul double %conv.us, %conv11.us
  %add13.us = fadd double %mul12.us, 3.000000e+00
  %div15.us = fdiv double %add13.us, %conv6
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  store double %div15.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.end_crit_edge.us, label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %for.end22.loopexit, label %for.cond.for.cond1_crit_edge.us

for.end22.loopexit:                               ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.cond.for.cond1_crit_edge.lr.ph, label %for.end89

for.cond.for.cond1_crit_edge.lr.ph:               ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub, 1
  %wide.trip.count10 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %cmp424 = icmp sgt i32 %sub, 1
  %wide.trip.count20 = zext i32 %sub to i64
  %wide.trip.count15 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count15, -1
  %min.iters.check44 = icmp ult i64 %0, 4
  %n.vec47 = and i64 %0, -4
  %cmp.zero48 = icmp eq i64 %n.vec47, 0
  %ind.end69 = or i64 %n.vec47, 1
  %cmp.n70 = icmp eq i64 %0, %n.vec47
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.end86, %for.cond.for.cond1_crit_edge.lr.ph
  %1 = phi i32 [ 0, %for.cond.for.cond1_crit_edge.lr.ph ], [ %inc88, %for.end86 ]
  br i1 %cmp22, label %for.cond1.for.cond4_crit_edge.us.preheader, label %for.end86

for.cond1.for.cond4_crit_edge.us.preheader:       ; preds = %for.cond.for.cond1_crit_edge
  br label %for.cond1.for.cond4_crit_edge.us

for.cond1.for.cond4_crit_edge.us:                 ; preds = %for.cond1.for.cond4_crit_edge.us.preheader, %for.cond4.for.end_crit_edge.us
  %indvar50 = phi i64 [ %indvar.next51, %for.cond4.for.end_crit_edge.us ], [ 0, %for.cond1.for.cond4_crit_edge.us.preheader ]
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond4.for.end_crit_edge.us ], [ 1, %for.cond1.for.cond4_crit_edge.us.preheader ]
  %2 = add i64 %indvar50, 1
  %scevgep52 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 1
  %scevgep54 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 %wide.trip.count15
  %scevgep56 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar50, i64 1
  %3 = add i64 %indvar50, 2
  %scevgep58 = getelementptr [1300 x double], [1300 x double]* %A, i64 %3, i64 %wide.trip.count15
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %4 = add nsw i64 %indvars.iv7, -1
  br i1 %min.iters.check44, label %for.body7.us.preheader, label %min.iters.checked45

min.iters.checked45:                              ; preds = %for.cond1.for.cond4_crit_edge.us
  br i1 %cmp.zero48, label %for.body7.us.preheader, label %vector.memcheck64

vector.memcheck64:                                ; preds = %min.iters.checked45
  %bound060 = icmp ult double* %scevgep52, %scevgep58
  %bound161 = icmp ult double* %scevgep56, %scevgep54
  %memcheck.conflict63 = and i1 %bound060, %bound161
  br i1 %memcheck.conflict63, label %for.body7.us.preheader, label %vector.body41.preheader

vector.body41.preheader:                          ; preds = %vector.memcheck64
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41.preheader, %vector.body41
  %index66 = phi i64 [ %index.next67, %vector.body41 ], [ 0, %vector.body41.preheader ]
  %offset.idx71 = or i64 %index66, 1
  %5 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %offset.idx71
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr double, double* %5, i64 2
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = add nsw i64 %offset.idx71, -1
  %10 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %9
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load76, %wide.load78
  %15 = fadd <2 x double> %wide.load77, %wide.load79
  %16 = add nuw nsw i64 %offset.idx71, 1
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %14, %wide.load80
  %22 = fadd <2 x double> %15, %wide.load81
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next8, i64 %offset.idx71
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %21, %wide.load82
  %28 = fadd <2 x double> %22, %wide.load83
  %29 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %offset.idx71
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fadd <2 x double> %27, %wide.load84
  %34 = fadd <2 x double> %28, %wide.load85
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = fmul <2 x double> %34, <double 2.000000e-01, double 2.000000e-01>
  %37 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %offset.idx71
  %38 = bitcast double* %37 to <2 x double>*
  store <2 x double> %35, <2 x double>* %38, align 8, !alias.scope !4, !noalias !1
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %36, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next67 = add i64 %index66, 4
  %41 = icmp eq i64 %index.next67, %n.vec47
  br i1 %41, label %middle.block42, label %vector.body41, !llvm.loop !6

middle.block42:                                   ; preds = %vector.body41
  br i1 %cmp.n70, label %for.cond4.for.end_crit_edge.us, label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block42, %vector.memcheck64, %min.iters.checked45, %for.cond1.for.cond4_crit_edge.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck64 ], [ 1, %min.iters.checked45 ], [ 1, %for.cond1.for.cond4_crit_edge.us ], [ %ind.end69, %middle.block42 ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %42 = load double, double* %arrayidx9.us, align 8
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %43
  %44 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %42, %44
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv.next
  %45 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %45
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next8, i64 %indvars.iv
  %46 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %46
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %indvars.iv
  %47 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %47
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.end_crit_edge.us.loopexit, label %for.body7.us, !llvm.loop !9

for.cond4.for.end_crit_edge.us.loopexit:          ; preds = %for.body7.us
  br label %for.cond4.for.end_crit_edge.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.cond4.for.end_crit_edge.us.loopexit, %middle.block42
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  %indvar.next51 = add i64 %indvar50, 1
  br i1 %exitcond11, label %for.cond1.for.cond40_crit_edge, label %for.cond1.for.cond4_crit_edge.us

for.cond1.for.cond40_crit_edge:                   ; preds = %for.cond4.for.end_crit_edge.us
  br i1 %cmp424, label %for.cond40.for.cond44_crit_edge.us.preheader, label %for.end86

for.cond40.for.cond44_crit_edge.us.preheader:     ; preds = %for.cond1.for.cond40_crit_edge
  br label %for.cond40.for.cond44_crit_edge.us

for.cond40.for.cond44_crit_edge.us:               ; preds = %for.cond40.for.cond44_crit_edge.us.preheader, %for.cond44.for.end83_crit_edge.us
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.end83_crit_edge.us ], [ 0, %for.cond40.for.cond44_crit_edge.us.preheader ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond44.for.end83_crit_edge.us ], [ 1, %for.cond40.for.cond44_crit_edge.us.preheader ]
  %48 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 1
  %scevgep25 = getelementptr [1300 x double], [1300 x double]* %A, i64 %48, i64 %wide.trip.count15
  %scevgep27 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %49 = add i64 %indvar, 2
  %scevgep29 = getelementptr [1300 x double], [1300 x double]* %B, i64 %49, i64 %wide.trip.count15
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %50 = add nsw i64 %indvars.iv17, -1
  br i1 %min.iters.check, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond40.for.cond44_crit_edge.us
  br i1 %cmp.zero, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep29
  %bound1 = icmp ult double* %scevgep27, %scevgep25
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %51 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = add nsw i64 %offset.idx, -1
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %55
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %wide.load, %wide.load33
  %61 = fadd <2 x double> %wide.load32, %wide.load34
  %62 = add nuw nsw i64 %offset.idx, 1
  %63 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %62
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = fadd <2 x double> %60, %wide.load35
  %68 = fadd <2 x double> %61, %wide.load36
  %69 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next18, i64 %offset.idx
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %67, %wide.load37
  %74 = fadd <2 x double> %68, %wide.load38
  %75 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %offset.idx
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !10
  %79 = fadd <2 x double> %73, %wide.load39
  %80 = fadd <2 x double> %74, %wide.load40
  %81 = fmul <2 x double> %79, <double 2.000000e-01, double 2.000000e-01>
  %82 = fmul <2 x double> %80, <double 2.000000e-01, double 2.000000e-01>
  %83 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv17, i64 %offset.idx
  %84 = bitcast double* %83 to <2 x double>*
  store <2 x double> %81, <2 x double>* %84, align 8, !alias.scope !13, !noalias !10
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> %82, <2 x double>* %86, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %87 = icmp eq i64 %index.next, %n.vec
  br i1 %87, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond44.for.end83_crit_edge.us, label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond40.for.cond44_crit_edge.us
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond40.for.cond44_crit_edge.us ], [ %ind.end, %middle.block ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body47.us ], [ %indvars.iv12.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv12
  %88 = load double, double* %arrayidx51.us, align 8
  %89 = add nsw i64 %indvars.iv12, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %89
  %90 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %88, %90
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv.next13
  %91 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %91
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv12
  %92 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %92
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %50, i64 %indvars.iv12
  %93 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %93
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv12
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  br i1 %exitcond16, label %for.cond44.for.end83_crit_edge.us.loopexit, label %for.body47.us, !llvm.loop !16

for.cond44.for.end83_crit_edge.us.loopexit:       ; preds = %for.body47.us
  br label %for.cond44.for.end83_crit_edge.us

for.cond44.for.end83_crit_edge.us:                ; preds = %for.cond44.for.end83_crit_edge.us.loopexit, %middle.block
  %exitcond21 = icmp eq i64 %indvars.iv.next18, %wide.trip.count20
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond21, label %for.end86.loopexit, label %for.cond40.for.cond44_crit_edge.us

for.end86.loopexit:                               ; preds = %for.cond44.for.end83_crit_edge.us
  br label %for.end86

for.end86:                                        ; preds = %for.end86.loopexit, %for.cond.for.cond1_crit_edge, %for.cond1.for.cond40_crit_edge
  %inc88 = add nuw nsw i32 %1, 1
  %exitcond22 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond22, label %for.end89.loopexit, label %for.cond.for.cond1_crit_edge

for.end89.loopexit:                               ; preds = %for.end86
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.cond.for.cond2_crit_edge.us.preheader, label %for.end12

for.cond.for.cond2_crit_edge.us.preheader:        ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count7 = zext i32 %n to i64
  br label %for.cond.for.cond2_crit_edge.us

for.cond.for.cond2_crit_edge.us:                  ; preds = %for.cond2.for.end_crit_edge.us, %for.cond.for.cond2_crit_edge.us.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us.preheader ], [ %indvars.iv.next5, %for.cond2.for.end_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv4, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond.for.cond2_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us ], [ %indvars.iv.next, %if.end.us ]
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
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next5, %wide.trip.count7
  br i1 %exitcond8, label %for.end12.loopexit, label %for.cond.for.cond2_crit_edge.us

for.end12.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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

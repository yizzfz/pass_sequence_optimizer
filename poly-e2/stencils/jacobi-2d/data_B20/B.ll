; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* nocapture %A, [1300 x double]* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %entry.for.end22_crit_edge

entry.for.end22_crit_edge:                        ; preds = %entry
  br label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.end_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond1.for.end_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %0 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ]
  %2 = add nuw nsw i64 %indvars.iv, 2
  %3 = trunc i64 %2 to i32
  %conv4.us = sitofp i32 %3 to double
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
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
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  store double %div.us.v.r2, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond1.for.end_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 1300
  br i1 %exitcond9, label %for.cond1.for.end_crit_edge.us.for.end22_crit_edge, label %for.cond1.for.end_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.end_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.cond1.preheader.us

for.cond1.for.end_crit_edge.us.for.end22_crit_edge: ; preds = %for.cond1.for.end_crit_edge.us
  br label %for.end22

for.end22:                                        ; preds = %for.cond1.for.end_crit_edge.us.for.end22_crit_edge, %entry.for.end22_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %entry.for.end89_crit_edge

entry.for.end89_crit_edge:                        ; preds = %entry
  br label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end86.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %0 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.end86.for.cond1.preheader_crit_edge ]
  br i1 true, label %for.cond1.preheader.for.cond4.preheader.us_crit_edge, label %for.cond1.preheader.for.end86_crit_edge

for.cond1.preheader.for.end86_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.end86

for.cond1.preheader.for.cond4.preheader.us_crit_edge: ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.end_crit_edge.us.for.cond4.preheader.us_crit_edge, %for.cond1.preheader.for.cond4.preheader.us_crit_edge
  %indvar50 = phi i64 [ %indvar.next51, %for.cond4.for.end_crit_edge.us.for.cond4.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.for.cond4.preheader.us_crit_edge ]
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond4.for.end_crit_edge.us.for.cond4.preheader.us_crit_edge ], [ 1, %for.cond1.preheader.for.cond4.preheader.us_crit_edge ]
  %1 = add i64 %indvar50, 1
  %scevgep52 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1
  %scevgep54 = getelementptr [1300 x double], [1300 x double]* %B, i64 %1, i64 1299
  %scevgep56 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar50, i64 1
  %2 = add i64 %indvar50, 2
  %scevgep58 = getelementptr [1300 x double], [1300 x double]* %A, i64 %2, i64 1299
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %3 = add nsw i64 %indvars.iv7, -1
  br i1 false, label %for.cond4.preheader.us.for.body7.us_crit_edge, label %min.iters.checked45

for.cond4.preheader.us.for.body7.us_crit_edge:    ; preds = %for.cond4.preheader.us
  br label %for.body7.us.preheader

min.iters.checked45:                              ; preds = %for.cond4.preheader.us
  br i1 false, label %min.iters.checked45.for.body7.us_crit_edge, label %vector.memcheck64

min.iters.checked45.for.body7.us_crit_edge:       ; preds = %min.iters.checked45
  br label %for.body7.us.preheader

vector.memcheck64:                                ; preds = %min.iters.checked45
  %bound060 = icmp ult double* %scevgep52, %scevgep58
  %bound161 = icmp ult double* %scevgep56, %scevgep54
  %memcheck.conflict63 = and i1 %bound060, %bound161
  br i1 %memcheck.conflict63, label %vector.memcheck64.for.body7.us_crit_edge, label %vector.memcheck64.vector.body41_crit_edge

vector.memcheck64.vector.body41_crit_edge:        ; preds = %vector.memcheck64
  br label %vector.body41

vector.memcheck64.for.body7.us_crit_edge:         ; preds = %vector.memcheck64
  br label %for.body7.us.preheader

vector.body41:                                    ; preds = %vector.body41.vector.body41_crit_edge, %vector.memcheck64.vector.body41_crit_edge
  %index66 = phi i64 [ %index.next67, %vector.body41.vector.body41_crit_edge ], [ 0, %vector.memcheck64.vector.body41_crit_edge ]
  %offset.idx71 = or i64 %index66, 1
  %4 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %offset.idx71
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = add nsw i64 %offset.idx71, -1
  %9 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %8
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load76, %wide.load78
  %14 = fadd <2 x double> %wide.load77, %wide.load79
  %15 = add nuw nsw i64 %offset.idx71, 1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %15
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %13, %wide.load80
  %21 = fadd <2 x double> %14, %wide.load81
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next8, i64 %offset.idx71
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fadd <2 x double> %20, %wide.load82
  %27 = fadd <2 x double> %21, %wide.load83
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %offset.idx71
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %26, %wide.load84
  %33 = fadd <2 x double> %27, %wide.load85
  %34 = fmul <2 x double> %32, <double 2.000000e-01, double 2.000000e-01>
  %35 = fmul <2 x double> %33, <double 2.000000e-01, double 2.000000e-01>
  %36 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %offset.idx71
  %37 = bitcast double* %36 to <2 x double>*
  store <2 x double> %34, <2 x double>* %37, align 8, !alias.scope !4, !noalias !1
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  store <2 x double> %35, <2 x double>* %39, align 8, !alias.scope !4, !noalias !1
  %index.next67 = add i64 %index66, 4
  %40 = icmp eq i64 %index.next67, 1296
  br i1 %40, label %middle.block42, label %vector.body41.vector.body41_crit_edge, !llvm.loop !6

vector.body41.vector.body41_crit_edge:            ; preds = %vector.body41
  br label %vector.body41

middle.block42:                                   ; preds = %vector.body41
  br i1 false, label %middle.block42.for.cond4.for.end_crit_edge.us_crit_edge, label %middle.block42.for.body7.us_crit_edge

middle.block42.for.body7.us_crit_edge:            ; preds = %middle.block42
  br label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %for.cond4.preheader.us.for.body7.us_crit_edge, %min.iters.checked45.for.body7.us_crit_edge, %vector.memcheck64.for.body7.us_crit_edge, %middle.block42.for.body7.us_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck64.for.body7.us_crit_edge ], [ 1, %min.iters.checked45.for.body7.us_crit_edge ], [ 1, %for.cond4.preheader.us.for.body7.us_crit_edge ], [ 1297, %middle.block42.for.body7.us_crit_edge ]
  br label %for.body7.us

middle.block42.for.cond4.for.end_crit_edge.us_crit_edge: ; preds = %middle.block42
  br label %for.cond4.for.end_crit_edge.us

for.body7.us:                                     ; preds = %for.body7.us.preheader, %for.body7.us.for.body7.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us.for.body7.us_crit_edge ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %41 = load double, double* %arrayidx9.us, align 8
  %42 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %42
  %43 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %41, %43
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %44
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next8, i64 %indvars.iv
  %45 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %45
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %3, i64 %indvars.iv
  %46 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %46
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1299
  br i1 %exitcond, label %for.body7.us.for.cond4.for.end_crit_edge.us_crit_edge, label %for.body7.us.for.body7.us_crit_edge, !llvm.loop !9

for.body7.us.for.body7.us_crit_edge:              ; preds = %for.body7.us
  br label %for.body7.us

for.body7.us.for.cond4.for.end_crit_edge.us_crit_edge: ; preds = %for.body7.us
  br label %for.cond4.for.end_crit_edge.us

for.cond4.for.end_crit_edge.us:                   ; preds = %for.body7.us.for.cond4.for.end_crit_edge.us_crit_edge, %middle.block42.for.cond4.for.end_crit_edge.us_crit_edge
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1299
  br i1 %exitcond11, label %for.cond40.preheader, label %for.cond4.for.end_crit_edge.us.for.cond4.preheader.us_crit_edge

for.cond4.for.end_crit_edge.us.for.cond4.preheader.us_crit_edge: ; preds = %for.cond4.for.end_crit_edge.us
  %indvar.next51 = add i64 %indvar50, 1
  br label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.end_crit_edge.us
  br i1 true, label %for.cond40.preheader.for.cond44.preheader.us_crit_edge, label %for.cond40.preheader.for.end86_crit_edge

for.cond40.preheader.for.end86_crit_edge:         ; preds = %for.cond40.preheader
  br label %for.end86

for.cond40.preheader.for.cond44.preheader.us_crit_edge: ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.for.end83_crit_edge.us.for.cond44.preheader.us_crit_edge, %for.cond40.preheader.for.cond44.preheader.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.end83_crit_edge.us.for.cond44.preheader.us_crit_edge ], [ 0, %for.cond40.preheader.for.cond44.preheader.us_crit_edge ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond44.for.end83_crit_edge.us.for.cond44.preheader.us_crit_edge ], [ 1, %for.cond40.preheader.for.cond44.preheader.us_crit_edge ]
  %47 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 1
  %scevgep25 = getelementptr [1300 x double], [1300 x double]* %A, i64 %47, i64 1299
  %scevgep27 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %48 = add i64 %indvar, 2
  %scevgep29 = getelementptr [1300 x double], [1300 x double]* %B, i64 %48, i64 1299
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %49 = add nsw i64 %indvars.iv17, -1
  br i1 false, label %for.cond44.preheader.us.for.body47.us_crit_edge, label %min.iters.checked

for.cond44.preheader.us.for.body47.us_crit_edge:  ; preds = %for.cond44.preheader.us
  br label %for.body47.us.preheader

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  br i1 false, label %min.iters.checked.for.body47.us_crit_edge, label %vector.memcheck

min.iters.checked.for.body47.us_crit_edge:        ; preds = %min.iters.checked
  br label %for.body47.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep29
  %bound1 = icmp ult double* %scevgep27, %scevgep25
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.for.body47.us_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.for.body47.us_crit_edge:          ; preds = %vector.memcheck
  br label %for.body47.us.preheader

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load, %wide.load33
  %60 = fadd <2 x double> %wide.load32, %wide.load34
  %61 = add nuw nsw i64 %offset.idx, 1
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %61
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %59, %wide.load35
  %67 = fadd <2 x double> %60, %wide.load36
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next18, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fadd <2 x double> %66, %wide.load37
  %73 = fadd <2 x double> %67, %wide.load38
  %74 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %offset.idx
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fadd <2 x double> %72, %wide.load39
  %79 = fadd <2 x double> %73, %wide.load40
  %80 = fmul <2 x double> %78, <double 2.000000e-01, double 2.000000e-01>
  %81 = fmul <2 x double> %79, <double 2.000000e-01, double 2.000000e-01>
  %82 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv17, i64 %offset.idx
  %83 = bitcast double* %82 to <2 x double>*
  store <2 x double> %80, <2 x double>* %83, align 8, !alias.scope !13, !noalias !10
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x double>*
  store <2 x double> %81, <2 x double>* %85, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %86 = icmp eq i64 %index.next, 1296
  br i1 %86, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 false, label %middle.block.for.cond44.for.end83_crit_edge.us_crit_edge, label %middle.block.for.body47.us_crit_edge

middle.block.for.body47.us_crit_edge:             ; preds = %middle.block
  br label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %for.cond44.preheader.us.for.body47.us_crit_edge, %min.iters.checked.for.body47.us_crit_edge, %vector.memcheck.for.body47.us_crit_edge, %middle.block.for.body47.us_crit_edge
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck.for.body47.us_crit_edge ], [ 1, %min.iters.checked.for.body47.us_crit_edge ], [ 1, %for.cond44.preheader.us.for.body47.us_crit_edge ], [ 1297, %middle.block.for.body47.us_crit_edge ]
  br label %for.body47.us

middle.block.for.cond44.for.end83_crit_edge.us_crit_edge: ; preds = %middle.block
  br label %for.cond44.for.end83_crit_edge.us

for.body47.us:                                    ; preds = %for.body47.us.preheader, %for.body47.us.for.body47.us_crit_edge
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body47.us.for.body47.us_crit_edge ], [ %indvars.iv12.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv12
  %87 = load double, double* %arrayidx51.us, align 8
  %88 = add nsw i64 %indvars.iv12, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %88
  %89 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %87, %89
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv.next13
  %90 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %90
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv12
  %91 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %91
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %49, i64 %indvars.iv12
  %92 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %92
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv12
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 1299
  br i1 %exitcond16, label %for.body47.us.for.cond44.for.end83_crit_edge.us_crit_edge, label %for.body47.us.for.body47.us_crit_edge, !llvm.loop !16

for.body47.us.for.body47.us_crit_edge:            ; preds = %for.body47.us
  br label %for.body47.us

for.body47.us.for.cond44.for.end83_crit_edge.us_crit_edge: ; preds = %for.body47.us
  br label %for.cond44.for.end83_crit_edge.us

for.cond44.for.end83_crit_edge.us:                ; preds = %for.body47.us.for.cond44.for.end83_crit_edge.us_crit_edge, %middle.block.for.cond44.for.end83_crit_edge.us_crit_edge
  %exitcond21 = icmp eq i64 %indvars.iv.next18, 1299
  br i1 %exitcond21, label %for.cond44.for.end83_crit_edge.us.for.end86_crit_edge, label %for.cond44.for.end83_crit_edge.us.for.cond44.preheader.us_crit_edge

for.cond44.for.end83_crit_edge.us.for.cond44.preheader.us_crit_edge: ; preds = %for.cond44.for.end83_crit_edge.us
  %indvar.next = add i64 %indvar, 1
  br label %for.cond44.preheader.us

for.cond44.for.end83_crit_edge.us.for.end86_crit_edge: ; preds = %for.cond44.for.end83_crit_edge.us
  br label %for.end86

for.end86:                                        ; preds = %for.cond44.for.end83_crit_edge.us.for.end86_crit_edge, %for.cond40.preheader.for.end86_crit_edge, %for.cond1.preheader.for.end86_crit_edge
  %inc88 = add nuw nsw i32 %0, 1
  %exitcond22 = icmp eq i32 %inc88, 500
  br i1 %exitcond22, label %for.end86.for.end89_crit_edge, label %for.end86.for.cond1.preheader_crit_edge

for.end86.for.cond1.preheader_crit_edge:          ; preds = %for.end86
  br label %for.cond1.preheader

for.end86.for.end89_crit_edge:                    ; preds = %for.end86
  br label %for.end89

for.end89:                                        ; preds = %for.end86.for.end89_crit_edge, %entry.for.end89_crit_edge
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
  br i1 true, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next5, %for.cond2.for.end_crit_edge.us.for.cond2.preheader.us_crit_edge ]
  %3 = mul nsw i64 %indvars.iv4, 1300
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond2.for.end_crit_edge.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next5, 1300
  br i1 %exitcond8, label %for.cond2.for.end_crit_edge.us.for.end12_crit_edge, label %for.cond2.for.end_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.end_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.cond2.preheader.us

for.cond2.for.end_crit_edge.us.for.end12_crit_edge: ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us.for.end12_crit_edge, %entry.for.end12_crit_edge
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

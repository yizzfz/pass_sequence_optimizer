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
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  br label %for.body

for.body:                                         ; preds = %for.end21, %entry
  %indvars.iv813 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end21 ]
  %0 = add nuw nsw i64 %indvars.iv813, 120
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.body
  %indvars.iv311 = phi i64 [ 0, %for.body ], [ %indvars.iv.next4, %for.end ]
  %1 = add nuw nsw i64 %0, %indvars.iv311
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body3
  %indvars.iv10 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next.1, %for.body6 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv10
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv813, i64 %indvars.iv311, i64 %indvars.iv10
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv813, i64 %indvars.iv311, i64 %indvars.iv10
  %indvars.iv.next = or i64 %indvars.iv10, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 1.000000e+01, double 1.000000e+01>
  %div = fdiv <2 x double> %mul, <double 1.200000e+02, double 1.200000e+02>
  %6 = bitcast double* %arrayidx12 to <2 x double>*
  %7 = bitcast double* %arrayidx18 to <2 x double>*
  store <2 x double> %div, <2 x double>* %6, align 8
  store <2 x double> %div, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv311, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond7, label %for.end21, label %for.body3

for.end21:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv813, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond15, label %for.end24, label %for.body

for.end24:                                        ; preds = %for.end21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.end208, %entry
  %inc21072 = phi i32 [ 1, %entry ], [ %inc210, %for.end208 ]
  br label %for.body3

for.body3:                                        ; preds = %for.end97, %for.body3.preheader
  %indvars.iv1345 = phi i64 [ 1, %for.body3.preheader ], [ %indvars.iv.next14, %for.end97 ]
  %0 = add nuw nsw i64 %indvars.iv1345, 1
  %1 = add nsw i64 %indvars.iv1345, -1
  br label %for.body7

for.body7:                                        ; preds = %for.end, %for.body3
  %indvars.iv941 = phi i64 [ 1, %for.body3 ], [ %indvars.iv.next10, %for.end ]
  %2 = add nuw nsw i64 %indvars.iv941, 1
  %3 = add nsw i64 %indvars.iv941, -1
  br label %for.body11

for.body11:                                       ; preds = %for.body11, %for.body7
  %indvars.iv39 = phi i64 [ 1, %for.body7 ], [ %indvars.iv.next, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv941, i64 %indvars.iv39
  %4 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1345, i64 %indvars.iv941, i64 %indvars.iv39
  %5 = load double, double* %arrayidx21, align 8
  %mul = fmul double %5, 2.000000e+00
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv941, i64 %indvars.iv39
  %6 = load double, double* %arrayidx29, align 8
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1345, i64 %2, i64 %indvars.iv39
  %7 = load double, double* %arrayidx38, align 8
  %8 = insertelement <2 x double> undef, double %mul, i32 0
  %sub22.v.i1.2 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.v.i0.1 = insertelement <2 x double> undef, double %4, i32 0
  %sub22.v.i0.2 = insertelement <2 x double> %sub22.v.i0.1, double %7, i32 1
  %sub22 = fsub <2 x double> %sub22.v.i0.2, %sub22.v.i1.2
  %sub22.v.r1 = extractelement <2 x double> %sub22, i32 0
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1345, i64 %3, i64 %indvars.iv39
  %9 = load double, double* %arrayidx53, align 8
  %add30.v.i1.1 = insertelement <2 x double> undef, double %sub22.v.r1, i32 0
  %add30.v.i1.2 = insertelement <2 x double> %add30.v.i1.1, double %9, i32 1
  %add30.v.i0.1 = insertelement <2 x double> undef, double %6, i32 0
  %add30.v.i0.2 = shufflevector <2 x double> %add30.v.i0.1, <2 x double> %sub22, <2 x i32> <i32 0, i32 3>
  %add30 = fadd <2 x double> %add30.v.i0.2, %add30.v.i1.2
  %mul31 = fmul <2 x double> %add30, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1 = extractelement <2 x double> %mul31, i32 0
  %mul31.v.r2 = extractelement <2 x double> %mul31, i32 1
  %add56 = fadd double %mul31.v.r1, %mul31.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv39, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1345, i64 %indvars.iv941, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %10, %mul
  %11 = add nsw i64 %indvars.iv39, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv1345, i64 %indvars.iv941, i64 %11
  %12 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %12
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %5, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv1345, i64 %indvars.iv941, i64 %indvars.iv39
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.end, label %for.body11

for.end:                                          ; preds = %for.body11
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv941, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next10, 119
  br i1 %exitcond74, label %for.end97, label %for.body7

for.end97:                                        ; preds = %for.end
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1345, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond75, label %for.body108.lr.ph.preheader, label %for.body3

for.body108.lr.ph.preheader:                      ; preds = %for.end97
  br label %for.body108.lr.ph

for.body108.lr.ph:                                ; preds = %for.body108.lr.ph.preheader, %for.end205
  %indvars.iv2859 = phi i64 [ %indvars.iv.next29, %for.end205 ], [ 1, %for.body108.lr.ph.preheader ]
  %13 = add nuw nsw i64 %indvars.iv2859, 1
  %14 = add nsw i64 %indvars.iv2859, -1
  br label %for.body108.us

for.body108.us:                                   ; preds = %for.cond109.for.end202_crit_edge.us, %for.body108.lr.ph
  %indvars.iv2255.us = phi i64 [ 1, %for.body108.lr.ph ], [ %indvars.iv.next23.us, %for.cond109.for.end202_crit_edge.us ]
  %15 = add nuw nsw i64 %indvars.iv2255.us, 1
  %16 = add nsw i64 %indvars.iv2255.us, -1
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us, %for.body108.us
  %indvars.iv1752.us = phi i64 [ 1, %for.body108.us ], [ %indvars.iv.next18.us, %for.body112.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %13, i64 %indvars.iv2255.us, i64 %indvars.iv1752.us
  %17 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2859, i64 %indvars.iv2255.us, i64 %indvars.iv1752.us
  %18 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %18, 2.000000e+00
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %14, i64 %indvars.iv2255.us, i64 %indvars.iv1752.us
  %19 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2859, i64 %15, i64 %indvars.iv1752.us
  %20 = load double, double* %arrayidx143.us, align 8
  %21 = insertelement <2 x double> undef, double %mul126.us, i32 0
  %sub127.v.i1.2.us = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.v.i0.1.us = insertelement <2 x double> undef, double %17, i32 0
  %sub127.v.i0.2.us = insertelement <2 x double> %sub127.v.i0.1.us, double %20, i32 1
  %sub127.us = fsub <2 x double> %sub127.v.i0.2.us, %sub127.v.i1.2.us
  %sub127.v.r1.us = extractelement <2 x double> %sub127.us, i32 0
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2859, i64 %16, i64 %indvars.iv1752.us
  %22 = load double, double* %arrayidx158.us, align 8
  %add135.v.i1.1.us = insertelement <2 x double> undef, double %sub127.v.r1.us, i32 0
  %add135.v.i1.2.us = insertelement <2 x double> %add135.v.i1.1.us, double %22, i32 1
  %add135.v.i0.1.us = insertelement <2 x double> undef, double %19, i32 0
  %add135.v.i0.2.us = shufflevector <2 x double> %add135.v.i0.1.us, <2 x double> %sub127.us, <2 x i32> <i32 0, i32 3>
  %add135.us = fadd <2 x double> %add135.v.i0.2.us, %add135.v.i1.2.us
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1.us = extractelement <2 x double> %mul136.us, i32 0
  %mul136.v.r2.us = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.v.r1.us, %mul136.v.r2.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1752.us, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2859, i64 %indvars.iv2255.us, i64 %indvars.iv.next18.us
  %23 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %23, %mul126.us
  %24 = add nsw i64 %indvars.iv1752.us, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2859, i64 %indvars.iv2255.us, i64 %24
  %25 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %25
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %18, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2859, i64 %indvars.iv2255.us, i64 %indvars.iv1752.us
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond21.us = icmp eq i64 %indvars.iv.next18.us, 119
  br i1 %exitcond21.us, label %for.cond109.for.end202_crit_edge.us, label %for.body112.us

for.cond109.for.end202_crit_edge.us:              ; preds = %for.body112.us
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv2255.us, 1
  %exitcond27.us = icmp eq i64 %indvars.iv.next23.us, 119
  br i1 %exitcond27.us, label %for.end205, label %for.body108.us

for.end205:                                       ; preds = %for.cond109.for.end202_crit_edge.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2859, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next29, 119
  br i1 %exitcond76, label %for.end208, label %for.body108.lr.ph

for.end208:                                       ; preds = %for.end205
  %inc210 = add nuw nsw i32 %inc21072, 1
  %exitcond77 = icmp eq i32 %inc210, 501
  br i1 %exitcond77, label %for.end211, label %for.body3.preheader

for.end211:                                       ; preds = %for.end208
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end20, %entry
  %indvars.iv816 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv816, 120
  br label %for.body4

for.body4:                                        ; preds = %for.end, %for.body
  %indvars.iv214 = phi i64 [ 0, %for.body ], [ %indvars.iv.next3, %for.end ]
  %tmp = add nuw nsw i64 %indvars.iv214, %3
  %tmp12 = mul nuw nsw i64 %tmp, 120
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.body4
  %indvars.iv13 = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv13, %tmp12
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv816, i64 %indvars.iv214, i64 %indvars.iv13
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next3, 120
  br i1 %exitcond7, label %for.end20, label %for.body4

for.end20:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv816, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond18, label %for.end23, label %for.body

for.end23:                                        ; preds = %for.end20
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

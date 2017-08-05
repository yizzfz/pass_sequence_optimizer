; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array([1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture %A, [1100 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc7 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next14, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv13, %indvars.iv18
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv18, i64 %indvars.iv13
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 1100
  br i1 %exitcond17, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond20, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next7.1, %for.body17 ]
  %indvars.iv.next7 = or i64 %indvars.iv6, 1
  %3 = mul nuw nsw i64 %indvars.iv.next7, %indvars.iv10
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 1200
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.200000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv6
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv6, 2
  %5 = mul nuw nsw i64 %indvars.iv.next7.1, %indvars.iv10
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 1200
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.1 = fdiv double %conv21.1, 1.200000e+03
  %arrayidx27.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv.next7
  store double %div23.1, double* %arrayidx27.1, align 8
  %exitcond9.1 = icmp eq i64 %indvars.iv.next7.1, 1200
  br i1 %exitcond9.1, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond12, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.cond38.preheader.preheader, %for.inc55
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc55 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.body41

for.body41:                                       ; preds = %for.body41, %for.cond38.preheader
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next, %for.body41 ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %7, %indvars.iv3
  %9 = trunc i64 %8 to i32
  %rem44 = srem i32 %9, 1100
  %conv45 = sitofp i32 %rem44 to double
  %div47 = fdiv double %conv45, 1.100000e+03
  %arrayidx51 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc55, label %for.body41

for.inc55:                                        ; preds = %for.body41
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond5, label %for.end57, label %for.cond38.preheader

for.end57:                                        ; preds = %for.inc55
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert19 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv5 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc32 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 0
  %0 = add i64 %indvars.iv5, 1
  %scevgep9 = getelementptr [1100 x double], [1100 x double]* %C, i64 %0, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv
  %1 = load double, double* %arrayidx5, align 8
  %mul = fmul double %1, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv.next
  %2 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %2, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv.next.1
  %3 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %3, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv.next.2
  %4 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %4, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx5.4 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv.next.3
  %5 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %5, %beta
  store double %mul.4, double* %arrayidx5.4, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %for.cond9.preheader.preheader, label %for.body3

for.cond9.preheader.preheader:                    ; preds = %for.body3
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep11 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv3, i64 0
  %6 = add i64 %indvars.iv3, 1
  %scevgep13 = getelementptr [1100 x double], [1100 x double]* %B, i64 %6, i64 0
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv3
  %bound0 = icmp ult double* %scevgep, %arrayidx15
  %bound1 = icmp ult double* %arrayidx15, %scevgep9
  %found.conflict = and i1 %bound0, %bound1
  %bound016 = icmp ult double* %scevgep, %scevgep13
  %bound117 = icmp ult double* %scevgep11, %scevgep9
  %found.conflict18 = and i1 %bound016, %bound117
  %conflict.rdx = or i1 %found.conflict, %found.conflict18
  br i1 %conflict.rdx, label %for.body11.preheader, label %vector.ph

for.body11.preheader:                             ; preds = %for.cond9.preheader
  br label %for.body11

vector.ph:                                        ; preds = %for.cond9.preheader
  %7 = load double, double* %arrayidx15, align 8, !alias.scope !1
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %9 = fmul <2 x double> %8, %broadcast.splatinsert19
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  %11 = insertelement <2 x double> undef, double %7, i32 0
  %12 = fmul <2 x double> %11, %broadcast.splatinsert19
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv3, i64 %offset.idx
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec21 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %16 = fmul <2 x double> %10, %strided.vec
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %offset.idx
  %18 = bitcast double* %17 to <4 x double>*
  %wide.vec22 = load <4 x double>, <4 x double>* %18, align 8, !alias.scope !6, !noalias !8
  %strided.vec23 = shufflevector <4 x double> %wide.vec22, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec24 = shufflevector <4 x double> %wide.vec22, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %19 = fadd <2 x double> %strided.vec23, %16
  %20 = or i64 %offset.idx, 1
  %21 = fmul <2 x double> %13, %strided.vec21
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %20
  %23 = fadd <2 x double> %strided.vec24, %21
  %24 = getelementptr double, double* %22, i64 -1
  %25 = bitcast double* %24 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %19, <2 x double> %23, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %25, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %26 = icmp eq i64 %index.next, 550
  br i1 %26, label %for.inc29.loopexit25, label %vector.body, !llvm.loop !9

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.1, %for.body11 ], [ 0, %for.body11.preheader ]
  %27 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %27, %alpha
  %arrayidx20 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv1
  %28 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %28
  %arrayidx25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv1
  %29 = load double, double* %arrayidx25, align 8
  %add = fadd double %29, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next2 = or i64 %indvars.iv1, 1
  %30 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %30, %alpha
  %arrayidx20.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv.next2
  %31 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %31
  %arrayidx25.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv5, i64 %indvars.iv.next2
  %32 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %32, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next2.1 = add nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next2.1, 1100
  br i1 %exitcond.1, label %for.inc29.loopexit, label %for.body11, !llvm.loop !12

for.inc29.loopexit:                               ; preds = %for.body11
  br label %for.inc29

for.inc29.loopexit25:                             ; preds = %vector.body
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit25, %for.inc29.loopexit
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %for.end34, label %for.cond1.preheader

for.end34:                                        ; preds = %for.inc32
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv2, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv2, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}

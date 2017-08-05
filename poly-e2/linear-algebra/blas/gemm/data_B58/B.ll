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
  %arraydecay1 = bitcast i8* %call to [1100 x double]*
  %arraydecay32 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1100 x double]* %arraydecay43)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(double %0, double %1, [1100 x double]* %arraydecay1, [1200 x double]* %arraydecay32, [1100 x double]* %arraydecay43)
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
  %3 = bitcast i8* %call to [1100 x double]*
  tail call fastcc void @print_array([1100 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %indvars.iv22 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv17 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next18, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv17, %indvars.iv22
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv22, i64 %indvars.iv17
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond21 = icmp eq i64 %indvars.iv17, 1099
  br i1 %exitcond21, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond3, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next12.1, %for.inc28 ]
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %3 = mul nuw nsw i64 %indvars.iv.next12, %indvars.iv15
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 1200
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.200000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv11
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv11, 2
  %5 = mul nuw nsw i64 %indvars.iv.next12.1, %indvars.iv15
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 1200
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.1 = fdiv double %conv21.1, 1.200000e+03
  %arrayidx27.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv.next12
  store double %div23.1, double* %arrayidx27.1, align 8
  %exitcond14.1 = icmp eq i64 %indvars.iv.next12, 1199
  br i1 %exitcond14.1, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond2, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.cond38.preheader.preheader, %for.inc55
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.inc55 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.inc52

for.inc52:                                        ; preds = %for.inc52, %for.cond38.preheader
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next, %for.inc52 ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %7, %indvars.iv9
  %9 = trunc i64 %8 to i32
  %rem44 = srem i32 %9, 1100
  %conv45 = sitofp i32 %rem44 to double
  %div47 = fdiv double %conv45, 1.100000e+03
  %arrayidx51 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, 1099
  br i1 %exitcond, label %for.inc55, label %for.inc52

for.inc55:                                        ; preds = %for.inc52
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next10, 1200
  br i1 %exitcond1, label %for.end57, label %for.cond38.preheader

for.end57:                                        ; preds = %for.inc55
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert35 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat36 = shufflevector <2 x double> %broadcast.splatinsert35, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert15 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %vector.ph24

vector.ph24:                                      ; preds = %for.inc32, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc32 ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 0
  %0 = add i64 %indvars.iv10, 1
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %C, i64 %0, i64 0
  br label %vector.body20

vector.body20:                                    ; preds = %vector.body20.1, %vector.ph24
  %index25 = phi i64 [ 0, %vector.ph24 ], [ %index.next26.1, %vector.body20.1 ]
  %1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %index25
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %2, align 8
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %4, align 8
  %5 = fmul <2 x double> %wide.load33, %broadcast.splat36
  %6 = fmul <2 x double> %wide.load34, %broadcast.splat36
  %7 = bitcast double* %1 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8
  %8 = bitcast double* %3 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8
  %index.next26 = or i64 %index25, 4
  %9 = icmp eq i64 %index.next26, 1100
  br i1 %9, label %vector.memcheck.preheader, label %vector.body20.1, !llvm.loop !1

vector.memcheck.preheader:                        ; preds = %vector.body20
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %for.inc29
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.inc29 ], [ 0, %vector.memcheck.preheader ]
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv8, i64 0
  %10 = add i64 %indvars.iv8, 1
  %scevgep8 = getelementptr [1100 x double], [1100 x double]* %B, i64 %10, i64 0
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv8
  %bound0 = icmp ult double* %scevgep, %arrayidx15
  %bound1 = icmp ult double* %arrayidx15, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound011 = icmp ult double* %scevgep, %scevgep8
  %bound112 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict13 = and i1 %bound011, %bound112
  %conflict.rdx = or i1 %found.conflict, %found.conflict13
  br i1 %conflict.rdx, label %for.inc26.preheader, label %vector.ph

for.inc26.preheader:                              ; preds = %vector.memcheck
  br label %for.inc26

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = load double, double* %arrayidx15, align 8, !alias.scope !4
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = fmul <2 x double> %12, %broadcast.splatinsert15
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %13, %broadcast.splatinsert15
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv8, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !7
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !7
  %22 = fmul <2 x double> %15, %wide.load
  %23 = fmul <2 x double> %17, %wide.load17
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !9, !noalias !11
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !9, !noalias !11
  %28 = fadd <2 x double> %wide.load18, %22
  %29 = fadd <2 x double> %wide.load19, %23
  %30 = bitcast double* %24 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8, !alias.scope !9, !noalias !11
  %31 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %32 = icmp eq i64 %index.next, 1100
  br i1 %32, label %for.inc29.loopexit37, label %vector.body, !llvm.loop !12

for.inc26:                                        ; preds = %for.inc26, %for.inc26.preheader
  %indvars.iv5 = phi i64 [ 0, %for.inc26.preheader ], [ %indvars.iv.next6.1, %for.inc26 ]
  %33 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %33, %alpha
  %arrayidx20 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv5
  %34 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %34
  %arrayidx25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv5
  %35 = load double, double* %arrayidx25, align 8
  %add = fadd double %35, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next6 = or i64 %indvars.iv5, 1
  %36 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %36, %alpha
  %arrayidx20.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv.next6
  %37 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %37
  %arrayidx25.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv.next6
  %38 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %38, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next6, 1099
  br i1 %exitcond7.1, label %for.inc29.loopexit, label %for.inc26, !llvm.loop !13

for.inc29.loopexit:                               ; preds = %for.inc26
  br label %for.inc29

for.inc29.loopexit37:                             ; preds = %vector.body
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit37, %for.inc29.loopexit
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond1, label %for.inc32, label %vector.memcheck

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond2, label %for.end34, label %vector.ph24

for.end34:                                        ; preds = %for.inc32
  ret void

vector.body20.1:                                  ; preds = %vector.body20
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %index.next26
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load33.1 = load <2 x double>, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load34.1 = load <2 x double>, <2 x double>* %42, align 8
  %43 = fmul <2 x double> %wide.load33.1, %broadcast.splat36
  %44 = fmul <2 x double> %wide.load34.1, %broadcast.splat36
  %45 = bitcast double* %39 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8
  %46 = bitcast double* %41 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8
  %index.next26.1 = add nsw i64 %index25, 8
  br label %vector.body20
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
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}

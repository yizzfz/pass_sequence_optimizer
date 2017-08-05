; ModuleID = 'B.ll'
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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemm(double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
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
  %indvars.iv50 = phi i64 [ 0, %entry ], [ %indvars.iv.next51, %for.inc7 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.body3 ], [ 0, %for.cond1.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv45, %indvars.iv50
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv50, i64 %indvars.iv45
  store double %div, double* %arrayidx6, align 8
  %exitcond49 = icmp eq i64 %indvars.iv45, 1099
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  br i1 %exitcond49, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next51, 1000
  br i1 %exitcond3, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.inc31, %for.cond14.preheader.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.body17

for.body17:                                       ; preds = %for.body17, %for.cond14.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next40.1, %for.body17 ]
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %3 = mul nuw nsw i64 %indvars.iv.next40, %indvars.iv43
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 1200
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 1.200000e+03
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv39
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next40.1 = add nuw nsw i64 %indvars.iv39, 2
  %5 = mul nuw nsw i64 %indvars.iv.next40.1, %indvars.iv43
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 1200
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.1 = fdiv double %conv21.1, 1.200000e+03
  %arrayidx27.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv.next40
  store double %div23.1, double* %arrayidx27.1, align 8
  %exitcond42.1 = icmp eq i64 %indvars.iv.next40, 1199
  br i1 %exitcond42.1, label %for.inc31, label %for.body17

for.inc31:                                        ; preds = %for.body17
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond2, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.inc55, %for.cond38.preheader.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.inc55 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.body41

for.body41:                                       ; preds = %for.body41, %for.cond38.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body41 ], [ 0, %for.cond38.preheader ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %7, %indvars.iv37
  %9 = trunc i64 %8 to i32
  %rem44 = srem i32 %9, 1100
  %conv45 = sitofp i32 %rem44 to double
  %div47 = fdiv double %conv45, 1.100000e+03
  %arrayidx51 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv37, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc55, label %for.body41

for.inc55:                                        ; preds = %for.body41
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond1, label %for.end57, label %for.cond38.preheader

for.end57:                                        ; preds = %for.inc55
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert33 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat34 = shufflevector <2 x double> %broadcast.splatinsert33, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv25 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.inc32 ]
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18.1, %for.cond1.preheader
  %index23 = phi i64 [ 0, %for.cond1.preheader ], [ %index.next24.1, %vector.body18.1 ]
  %0 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 %index23
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %1, align 8
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %3, align 8
  %4 = fmul <2 x double> %wide.load31, %broadcast.splat34
  %5 = fmul <2 x double> %wide.load32, %broadcast.splat34
  %6 = bitcast double* %0 to <2 x double>*
  store <2 x double> %4, <2 x double>* %6, align 8
  %7 = bitcast double* %2 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8
  %index.next24 = or i64 %index23, 4
  %8 = icmp eq i64 %index.next24, 1100
  br i1 %8, label %for.cond9.preheader.preheader, label %vector.body18.1, !llvm.loop !1

for.cond9.preheader.preheader:                    ; preds = %vector.body18
  %9 = add nuw nsw i64 %indvars.iv25, 1
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 0
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %C, i64 %9, i64 0
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.inc29, %for.cond9.preheader.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 0
  %10 = add nuw nsw i64 %indvars.iv23, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %B, i64 %10, i64 0
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv23
  %bound0 = icmp ult double* %scevgep, %arrayidx15
  %bound1 = icmp ult double* %arrayidx15, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.body11.preheader, label %vector.ph

for.body11.preheader:                             ; preds = %for.cond9.preheader
  br label %for.body11

vector.ph:                                        ; preds = %for.cond9.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = load double, double* %arrayidx15, align 8, !alias.scope !4
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = fmul <2 x double> %12, %broadcast.splatinsert13
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %13, %broadcast.splatinsert13
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !7
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !7
  %22 = fmul <2 x double> %15, %wide.load
  %23 = fmul <2 x double> %17, %wide.load15
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 %index
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !9, !noalias !11
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !9, !noalias !11
  %28 = fadd <2 x double> %wide.load16, %22
  %29 = fadd <2 x double> %wide.load17, %23
  %30 = bitcast double* %24 to <2 x double>*
  store <2 x double> %28, <2 x double>* %30, align 8, !alias.scope !9, !noalias !11
  %31 = bitcast double* %26 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %32 = icmp eq i64 %index.next, 1100
  br i1 %32, label %for.inc29.loopexit37, label %vector.body, !llvm.loop !12

for.body11:                                       ; preds = %for.body11, %for.body11.preheader
  %indvars.iv20 = phi i64 [ 0, %for.body11.preheader ], [ %indvars.iv.next21.1, %for.body11 ]
  %33 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %33, %alpha
  %arrayidx20 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv20
  %34 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %34
  %arrayidx25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv20
  %35 = load double, double* %arrayidx25, align 8
  %add = fadd double %35, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %36 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %36, %alpha
  %arrayidx20.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv.next21
  %37 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %37
  %arrayidx25.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 %indvars.iv.next21
  %38 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %38, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21, 1099
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  br i1 %exitcond22.1, label %for.inc29.loopexit, label %for.body11, !llvm.loop !13

for.inc29.loopexit:                               ; preds = %for.body11
  br label %for.inc29

for.inc29.loopexit37:                             ; preds = %vector.body
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit37, %for.inc29.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond35, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond36, label %for.end34, label %for.cond1.preheader

for.end34:                                        ; preds = %for.inc32
  ret void

vector.body18.1:                                  ; preds = %vector.body18
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv25, i64 %index.next24
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load31.1 = load <2 x double>, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load32.1 = load <2 x double>, <2 x double>* %42, align 8
  %43 = fmul <2 x double> %wide.load31.1, %broadcast.splat34
  %44 = fmul <2 x double> %wide.load32.1, %broadcast.splat34
  %45 = bitcast double* %39 to <2 x double>*
  store <2 x double> %43, <2 x double>* %45, align 8
  %46 = bitcast double* %41 to <2 x double>*
  store <2 x double> %44, <2 x double>* %46, align 8
  %index.next24.1 = add nuw nsw i64 %index23, 8
  br label %vector.body18
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1000
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
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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

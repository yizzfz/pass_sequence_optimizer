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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv65 = phi i64 [ 0, %entry ], [ %indvars.iv.next66, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv59, %indvars.iv65
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv59
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond64 = icmp eq i64 %indvars.iv59, 1099
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  br i1 %exitcond64, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond3 = icmp ne i64 %indvars.iv.next66, 1000
  br i1 %exitcond3, label %for.cond1.preheader.us, label %for.cond14.preheader.us.preheader

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us, %for.cond14.preheader.us
  %indvars.iv51 = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next52.1, %for.inc28.us ]
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %3 = mul nuw nsw i64 %indvars.iv.next52, %indvars.iv56
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 1200
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.200000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv51
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %5 = mul nuw nsw i64 %indvars.iv.next52.1, %indvars.iv56
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 1200
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, 1.200000e+03
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv.next52
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond55.1 = icmp eq i64 %indvars.iv.next52, 1199
  br i1 %exitcond55.1, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.inc28.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond2 = icmp ne i64 %indvars.iv.next57, 1000
  br i1 %exitcond2, label %for.cond14.preheader.us, label %for.cond38.preheader.us.preheader

for.cond38.preheader.us.preheader:                ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc55_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc52.us

for.inc52.us:                                     ; preds = %for.inc52.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc52.us ], [ 0, %for.cond38.preheader.us ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %7, %indvars.iv48
  %9 = trunc i64 %8 to i32
  %rem44.us = srem i32 %9, 1100
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, 1.100000e+03
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv48, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.inc52.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.inc52.us
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next49, 1200
  br i1 %exitcond1, label %for.cond38.preheader.us, label %for.end57

for.end57:                                        ; preds = %for.cond38.for.inc55_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert33 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat34 = shufflevector <2 x double> %broadcast.splatinsert33, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert13 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %entry
  %indvars.iv51 = phi i64 [ 0, %entry ], [ %indvars.iv.next52, %for.inc32.us ]
  %0 = add nuw nsw i64 %indvars.iv51, 1
  br label %vector.body18

vector.body18:                                    ; preds = %vector.body18.1, %for.cond1.preheader.us
  %index23 = phi i64 [ 0, %for.cond1.preheader.us ], [ %index.next24.1, %vector.body18.1 ]
  %1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 %index23
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %2, align 8
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %4, align 8
  %5 = fmul <2 x double> %wide.load31, %broadcast.splat34
  %6 = fmul <2 x double> %wide.load32, %broadcast.splat34
  %7 = bitcast double* %1 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8
  %8 = bitcast double* %3 to <2 x double>*
  store <2 x double> %6, <2 x double>* %8, align 8
  %index.next24 = or i64 %index23, 4
  %9 = icmp eq i64 %index.next24, 1100
  br i1 %9, label %for.cond9.preheader.us.us.preheader, label %vector.body18.1, !llvm.loop !1

for.cond9.preheader.us.us.preheader:              ; preds = %vector.body18
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 0
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %C, i64 %0, i64 0
  br label %for.cond9.preheader.us.us

for.inc32.us:                                     ; preds = %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond36 = icmp ne i64 %indvars.iv.next52, 1000
  br i1 %exitcond36, label %for.cond1.preheader.us, label %for.end34

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 0
  %10 = add nuw nsw i64 %indvars.iv49, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %B, i64 %10, i64 0
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49
  %bound0 = icmp ult double* %scevgep, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.inc26.us.us.preheader, label %vector.ph

for.inc26.us.us.preheader:                        ; preds = %for.cond9.preheader.us.us
  br label %for.inc26.us.us

vector.ph:                                        ; preds = %for.cond9.preheader.us.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !4
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = insertelement <2 x double> undef, double %11, i32 0
  %14 = fmul <2 x double> %12, %broadcast.splatinsert13
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %13, %broadcast.splatinsert13
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %index
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !7
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !7
  %22 = fmul <2 x double> %15, %wide.load
  %23 = fmul <2 x double> %17, %wide.load15
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 %index
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
  br i1 %32, label %for.cond9.for.inc29_crit_edge.us.us.loopexit35, label %vector.body, !llvm.loop !12

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.inc26.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us.loopexit35:   ; preds = %vector.body
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit35, %for.cond9.for.inc29_crit_edge.us.us.loopexit
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond = icmp ne i64 %indvars.iv.next50, 1200
  br i1 %exitcond, label %for.cond9.preheader.us.us, label %for.inc32.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us, %for.inc26.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.inc26.us.us.preheader ], [ %indvars.iv.next46.1, %for.inc26.us.us ]
  %33 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %33, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv45
  %34 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %34
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv45
  %35 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %35, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %36 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %36, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv.next46
  %37 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %37
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next46
  %38 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %38, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next46, 1099
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  br i1 %exitcond48.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.inc26.us.us, !llvm.loop !13

for.end34:                                        ; preds = %for.inc32.us
  ret void

vector.body18.1:                                  ; preds = %vector.body18
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv51, i64 %index.next24
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
define internal fastcc void @print_array([1100 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond1 = icmp ne i64 %indvars.iv.next14, 1000
  br i1 %exitcond1, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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

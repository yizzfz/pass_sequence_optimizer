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
  %0 = bitcast i8* %call to [1100 x double]*
  %1 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay43 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %0, [1200 x double]* %1, [1100 x double]* %arraydecay43)
  call void (...) @polybench_timer_start() #4
  %2 = load double, double* %alpha, align 8
  %3 = load double, double* %beta, align 8
  call fastcc void @kernel_gemm(double %2, double %3, [1100 x double]* %0, [1200 x double]* %1, [1100 x double]* %arraydecay43)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call to [1100 x double]*
  call fastcc void @print_array([1100 x double]* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* %alpha, double* %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %entry
  %indvars.iv55 = phi i64 [ 0, %entry ], [ %indvars.iv.next56, %for.inc7.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv55, %indvars.iv49
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv49
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next50, 1100
  br i1 %exitcond63, label %for.inc7.us, label %for.inc.us

for.inc7.us:                                      ; preds = %for.inc.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond64, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.inc7.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.inc31.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.inc31.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us, %for.cond14.preheader.us
  %indvars.iv39 = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next40.1, %for.inc28.us ]
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %3 = mul nuw nsw i64 %indvars.iv44, %indvars.iv.next40
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 1200
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, 1.200000e+03
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv39
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %5 = mul nuw nsw i64 %indvars.iv44, %indvars.iv.next40.1
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 1200
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, 1.200000e+03
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next40
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond61.1 = icmp eq i64 %indvars.iv.next40.1, 1200
  br i1 %exitcond61.1, label %for.inc31.us, label %for.inc28.us

for.inc31.us:                                     ; preds = %for.inc28.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond62, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.inc31.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.inc55.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc55.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc52.us

for.inc52.us:                                     ; preds = %for.inc52.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc52.us ], [ 0, %for.cond38.preheader.us ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = mul nuw nsw i64 %indvars.iv34, %7
  %9 = trunc i64 %8 to i32
  %rem44.us = srem i32 %9, 1100
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, 1.100000e+03
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv34, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond60, label %for.inc55.us, label %for.inc52.us

for.inc55.us:                                     ; preds = %for.inc52.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond, label %for.end57, label %for.cond38.preheader.us

for.end57:                                        ; preds = %for.inc55.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert16 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc29.us.us.for.inc32.us_crit_edge, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.inc29.us.us.for.inc32.us_crit_edge ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5.us to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul.us = fmul <2 x double> %3, %mul.us.v.i1.2
  %4 = bitcast double* %arrayidx5.us to <2 x double>*
  store <2 x double> %mul.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul.us.2 = fmul <2 x double> %6, %mul.us.2.v.i1.2
  %7 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  store <2 x double> %mul.us.2, <2 x double>* %7, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond.3, label %for.cond9.preheader.us.us.preheader, label %for.inc.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.inc.us
  %scevgep1 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 0
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 1100
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.inc26.us.us.for.inc29.us.us_crit_edge
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc26.us.us.for.inc29.us.us_crit_edge ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv55
  %scevgep7 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv55, i64 0
  %scevgep10 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv55, i64 1100
  %bound0 = icmp ult double* %scevgep1, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep1, %scevgep10
  %bound114 = icmp ult double* %scevgep7, %scevgep4
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  br i1 %conflict.rdx, label %for.inc26.us.us.preheader, label %vector.ph

for.inc26.us.us.preheader:                        ; preds = %for.cond9.preheader.us.us
  br label %for.inc26.us.us

vector.ph:                                        ; preds = %for.cond9.preheader.us.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %8 = shl i64 %index, 1
  %9 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = fmul <2 x double> %10, %broadcast.splatinsert16
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv55, i64 %8
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec18 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fmul <2 x double> %12, %strided.vec
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %8
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec19 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6, !noalias !8
  %strided.vec20 = shufflevector <4 x double> %wide.vec19, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec21 = shufflevector <4 x double> %wide.vec19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %18 = fadd <2 x double> %15, %strided.vec20
  %19 = or i64 %8, 1
  %20 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = fmul <2 x double> %21, %broadcast.splatinsert16
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = fmul <2 x double> %23, %strided.vec18
  %25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %19
  %26 = fadd <2 x double> %24, %strided.vec21
  %27 = getelementptr double, double* %25, i64 -1
  %28 = bitcast double* %27 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %18, <2 x double> %26, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %28, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %29 = icmp eq i64 %index.next, 550
  br i1 %29, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br label %for.inc26.us.us.for.inc29.us.us_crit_edge

for.inc29.us.us.for.inc32.us_crit_edge:           ; preds = %for.inc26.us.us.for.inc29.us.us_crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond, label %for.end34, label %for.cond1.preheader.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us.preheader, %for.inc26.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %for.inc26.us.us ], [ 0, %for.inc26.us.us.preheader ]
  %30 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %30, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv49
  %31 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %31
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv49
  %32 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %mul21.us.us, %32
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %33 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %33, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv55, i64 %indvars.iv.next50
  %34 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %34
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv.next50
  %35 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %mul21.us.us.1, %35
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next50.1, 1100
  br i1 %exitcond.1, label %for.inc26.us.us.for.inc29.us.us_crit_edge.loopexit, label %for.inc26.us.us, !llvm.loop !12

for.inc26.us.us.for.inc29.us.us_crit_edge.loopexit: ; preds = %for.inc26.us.us
  br label %for.inc26.us.us.for.inc29.us.us_crit_edge

for.inc26.us.us.for.inc29.us.us_crit_edge:        ; preds = %for.inc26.us.us.for.inc29.us.us_crit_edge.loopexit, %middle.block
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond64, label %for.inc29.us.us.for.inc32.us_crit_edge, label %for.cond9.preheader.us.us

for.end34:                                        ; preds = %for.inc29.us.us.for.inc32.us_crit_edge
  ret void
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

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv11, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond17, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

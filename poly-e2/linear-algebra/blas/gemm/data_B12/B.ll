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
  %3 = bitcast i8* %call to [1100 x double]*
  call fastcc void @print_array([1100 x double]* %3)
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

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv73 = phi i64 [ 0, %entry ], [ %indvars.iv.next74, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv67 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next68, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv67, %indvars.iv73
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1000
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv73, i64 %indvars.iv67
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next68, 1100
  br i1 %exitcond72, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond76, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us, %for.cond14.preheader.us
  %indvars.iv57 = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next58.1, %for.inc28.us ]
  %indvars.iv.next58 = or i64 %indvars.iv57, 1
  %3 = mul nuw nsw i64 %indvars.iv.next58, %indvars.iv62
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 1200
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv62, i64 %indvars.iv57
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %5 = mul nuw nsw i64 %indvars.iv.next58.1, %indvars.iv62
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 1200
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %7 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %7, align 8
  %exitcond61.1 = icmp eq i64 %indvars.iv.next58.1, 1200
  br i1 %exitcond61.1, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.inc28.us
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 1000
  br i1 %exitcond65, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc55_crit_edge.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc52.us

for.inc52.us:                                     ; preds = %for.inc52.us, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.inc52.us ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = mul nuw nsw i64 %8, %indvars.iv52
  %10 = trunc i64 %9 to i32
  %rem44.us = srem i32 %10, 1100
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, 1.100000e+03
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.inc52.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.inc52.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond55, label %for.end57, label %for.cond38.preheader.us

for.end57:                                        ; preds = %for.cond38.for.inc55_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.us.v.i1.2.1 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert17 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %entry
  %indvars.iv55 = phi i64 [ 0, %entry ], [ %indvars.iv.next56, %for.inc32.us ]
  br label %for.inc.us

for.inc32.us:                                     ; preds = %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %for.end34, label %for.cond1.preheader.us

for.inc.us:                                       ; preds = %for.inc.us.1, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.3.1, %for.inc.us.1 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5.us to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul.us = fmul <2 x double> %3, %mul.us.v.i1.2
  store <2 x double> %mul.us, <2 x double>* %2, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.1
  %4 = bitcast double* %arrayidx5.us.2 to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul.us.2 = fmul <2 x double> %5, %mul.us.v.i1.2
  store <2 x double> %mul.us.2, <2 x double>* %4, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, 1100
  br i1 %exitcond.3, label %for.cond9.preheader.us.us.preheader, label %for.inc.us.1

for.cond9.preheader.us.us.preheader:              ; preds = %for.inc.us
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 0
  %scevgep5 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 1100
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.preheader.us.us.preheader, %for.cond9.for.inc29_crit_edge.us.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv51
  %scevgep8 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv51, i64 0
  %scevgep11 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv51, i64 1100
  %bound0 = icmp ult double* %scevgep2, %arrayidx15.us.us
  %bound1 = icmp ult double* %arrayidx15.us.us, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound014 = icmp ult double* %scevgep2, %scevgep11
  %bound115 = icmp ult double* %scevgep8, %scevgep5
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %for.inc26.us.us.preheader, label %vector.ph

for.inc26.us.us.preheader:                        ; preds = %middle.block, %for.cond9.preheader.us.us
  %indvars.iv47.ph = phi i64 [ 1100, %middle.block ], [ 0, %for.cond9.preheader.us.us ]
  br label %for.inc26.us.us

vector.ph:                                        ; preds = %for.cond9.preheader.us.us
  %6 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %7 = insertelement <2 x double> undef, double %6, i32 0
  %8 = fmul <2 x double> %7, %broadcast.splatinsert17
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !1
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = fmul <2 x double> %11, %broadcast.splatinsert17
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %14 = shl i64 %index, 1
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv51, i64 %14
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec19 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fmul <2 x double> %9, %strided.vec
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %14
  %19 = bitcast double* %18 to <4 x double>*
  %wide.vec20 = load <4 x double>, <4 x double>* %19, align 8, !alias.scope !6, !noalias !8
  %strided.vec21 = shufflevector <4 x double> %wide.vec20, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec22 = shufflevector <4 x double> %wide.vec20, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %20 = fadd <2 x double> %strided.vec21, %17
  %21 = or i64 %14, 1
  %22 = fmul <2 x double> %13, %strided.vec19
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %21
  %24 = fadd <2 x double> %strided.vec22, %22
  %25 = getelementptr double, double* %23, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %20, <2 x double> %24, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %26, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 2
  %27 = icmp eq i64 %index.next, 550
  br i1 %27, label %middle.block, label %vector.body, !llvm.loop !9

middle.block:                                     ; preds = %vector.body
  br i1 true, label %for.cond9.for.inc29_crit_edge.us.us, label %for.inc26.us.us.preheader

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.inc26.us.us
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond54, label %for.inc32.us, label %for.cond9.preheader.us.us

for.inc26.us.us:                                  ; preds = %for.inc26.us.us.preheader, %for.inc26.us.us
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.inc26.us.us ], [ %indvars.iv47.ph, %for.inc26.us.us.preheader ]
  %28 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %28, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv47
  %29 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %29
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv47
  %30 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %30, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next48 = or i64 %indvars.iv47, 1
  %31 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %31, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv51, i64 %indvars.iv.next48
  %32 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %32
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next48
  %33 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %33, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next48.1, 1100
  br i1 %exitcond50.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.inc26.us.us, !llvm.loop !12

for.end34:                                        ; preds = %for.inc32.us
  ret void

for.inc.us.1:                                     ; preds = %for.inc.us
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.3
  %34 = bitcast double* %arrayidx5.us.1 to <2 x double>*
  %35 = load <2 x double>, <2 x double>* %34, align 8
  %mul.us.1 = fmul <2 x double> %35, %mul.us.v.i1.2.1
  store <2 x double> %mul.us.1, <2 x double>* %34, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %arrayidx5.us.2.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv.next.1.1
  %36 = bitcast double* %arrayidx5.us.2.1 to <2 x double>*
  %37 = load <2 x double>, <2 x double>* %36, align 8
  %mul.us.2.1 = fmul <2 x double> %37, %mul.us.v.i1.2.1
  store <2 x double> %mul.us.2.1, <2 x double>* %36, align 8
  %indvars.iv.next.3.1 = add nuw nsw i64 %indvars.iv, 8
  br label %for.inc.us
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv14, 1000
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !5}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}

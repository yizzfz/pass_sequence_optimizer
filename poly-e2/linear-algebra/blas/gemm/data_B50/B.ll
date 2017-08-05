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
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv55 = phi i64 [ 0, %entry ], [ %indvars.iv.next56, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv50 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next51, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv50, %indvars.iv55
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 1000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv55, i64 %indvars.iv50
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next51, 1100
  br i1 %exitcond54, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond57, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next44.1, %for.inc28 ]
  %indvars.iv.next44 = or i64 %indvars.iv43, 1
  %3 = mul nuw nsw i64 %indvars.iv.next44, %indvars.iv47
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 1200
  %conv21 = sitofp i32 %rem20 to double
  %arrayidx27 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv43
  %indvars.iv.next44.1 = add nuw nsw i64 %indvars.iv43, 2
  %5 = mul nuw nsw i64 %indvars.iv.next44.1, %indvars.iv47
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 1200
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.v.i0.1 = insertelement <2 x double> undef, double %conv21, i32 0
  %div23.v.i0.2 = insertelement <2 x double> %div23.v.i0.1, double %conv21.1, i32 1
  %div23 = fdiv <2 x double> %div23.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %7 = bitcast double* %arrayidx27 to <2 x double>*
  store <2 x double> %div23, <2 x double>* %7, align 8
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44.1, 1200
  br i1 %exitcond46.1, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next48, 1000
  br i1 %exitcond49, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.cond38.preheader.preheader, %for.inc55
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.inc55 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.inc52

for.inc52:                                        ; preds = %for.inc52, %for.cond38.preheader
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next, %for.inc52 ]
  %8 = add nuw nsw i64 %indvars.iv, 2
  %9 = mul nuw nsw i64 %8, %indvars.iv40
  %10 = trunc i64 %9 to i32
  %rem44 = srem i32 %10, 1100
  %conv45 = sitofp i32 %rem44 to double
  %div47 = fdiv double %conv45, 1.100000e+03
  %arrayidx51 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv
  store double %div47, double* %arrayidx51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc55, label %for.inc52

for.inc55:                                        ; preds = %for.inc52
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next41, 1200
  br i1 %exitcond42, label %for.end57, label %for.cond38.preheader

for.end57:                                        ; preds = %for.inc55
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(double %alpha, double %beta, [1100 x double]* %C, [1200 x double]* %A, [1100 x double]* %B) unnamed_addr #2 {
entry:
  %0 = insertelement <2 x double> undef, double %beta, i32 0
  %mul.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert12 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc32, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next27, %for.inc32 ]
  %1 = add nuw nsw i64 %indvars.iv26, 1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.inc ]
  %arrayidx5 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv
  %2 = bitcast double* %arrayidx5 to <2 x double>*
  %3 = load <2 x double>, <2 x double>* %2, align 8
  %mul = fmul <2 x double> %3, %mul.v.i1.2
  store <2 x double> %mul, <2 x double>* %2, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx5.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv.next.1
  %4 = bitcast double* %arrayidx5.2 to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul.2 = fmul <2 x double> %5, %mul.v.i1.2
  store <2 x double> %mul.2, <2 x double>* %4, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx5.4 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv.next.3
  %6 = load double, double* %arrayidx5.4, align 8
  %mul.4 = fmul double %6, %beta
  store double %mul.4, double* %arrayidx5.4, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %for.cond9.preheader.preheader, label %for.inc

for.cond9.preheader.preheader:                    ; preds = %for.inc
  %scevgep = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 0
  %scevgep2 = getelementptr [1100 x double], [1100 x double]* %C, i64 %1, i64 0
  br label %for.cond9.preheader

for.cond9.preheader:                              ; preds = %for.cond9.preheader.preheader, %for.inc29
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc29 ], [ 0, %for.cond9.preheader.preheader ]
  %scevgep4 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 0
  %7 = add nuw nsw i64 %indvars.iv23, 1
  %scevgep6 = getelementptr [1100 x double], [1100 x double]* %B, i64 %7, i64 0
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv23
  %bound0 = icmp ult double* %scevgep, %arrayidx15
  %bound1 = icmp ult double* %arrayidx15, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound09 = icmp ult double* %scevgep, %scevgep6
  %bound110 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %for.inc26.preheader, label %vector.ph

for.inc26.preheader:                              ; preds = %for.cond9.preheader
  br label %for.inc26

vector.ph:                                        ; preds = %for.cond9.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %8 = load double, double* %arrayidx15, align 8, !alias.scope !1
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = fmul <2 x double> %9, %broadcast.splatinsert12
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %offset.idx
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec14 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = fmul <2 x double> %11, %strided.vec
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %offset.idx
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec15 = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !6, !noalias !8
  %strided.vec16 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec17 = shufflevector <4 x double> %wide.vec15, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %17 = fadd <2 x double> %strided.vec16, %14
  %18 = or i64 %offset.idx, 1
  %19 = load double, double* %arrayidx15, align 8, !alias.scope !1
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = fmul <2 x double> %20, %broadcast.splatinsert12
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = fmul <2 x double> %22, %strided.vec14
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %18
  %25 = fadd <2 x double> %strided.vec17, %23
  %26 = getelementptr double, double* %24, i64 -1
  %27 = bitcast double* %26 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %17, <2 x double> %25, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %27, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 2
  %28 = icmp eq i64 %index.next, 550
  br i1 %28, label %for.inc29.loopexit18, label %vector.body, !llvm.loop !9

for.inc26:                                        ; preds = %for.inc26.preheader, %for.inc26
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %for.inc26 ], [ 0, %for.inc26.preheader ]
  %29 = load double, double* %arrayidx15, align 8
  %mul16 = fmul double %29, %alpha
  %arrayidx20 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv20
  %30 = load double, double* %arrayidx20, align 8
  %mul21 = fmul double %mul16, %30
  %arrayidx25 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv20
  %31 = load double, double* %arrayidx25, align 8
  %add = fadd double %31, %mul21
  store double %add, double* %arrayidx25, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %32 = load double, double* %arrayidx15, align 8
  %mul16.1 = fmul double %32, %alpha
  %arrayidx20.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv.next21
  %33 = load double, double* %arrayidx20.1, align 8
  %mul21.1 = fmul double %mul16.1, %33
  %arrayidx25.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv.next21
  %34 = load double, double* %arrayidx25.1, align 8
  %add.1 = fadd double %34, %mul21.1
  store double %add.1, double* %arrayidx25.1, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21.1, 1100
  br i1 %exitcond22.1, label %for.inc29.loopexit, label %for.inc26, !llvm.loop !12

for.inc29.loopexit:                               ; preds = %for.inc26
  br label %for.inc29

for.inc29.loopexit18:                             ; preds = %vector.body
  br label %for.inc29

for.inc29:                                        ; preds = %for.inc29.loopexit18, %for.inc29.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond25, label %for.inc32, label %for.cond9.preheader

for.inc32:                                        ; preds = %for.inc29
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond28, label %for.end34, label %for.cond1.preheader

for.end34:                                        ; preds = %for.inc32
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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1000
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
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond14, label %for.end12, label %for.cond2.preheader

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

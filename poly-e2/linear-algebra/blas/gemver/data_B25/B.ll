; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay9 = bitcast i8* %call1 to double*
  %arraydecay10 = bitcast i8* %call2 to double*
  %arraydecay11 = bitcast i8* %call3 to double*
  %arraydecay12 = bitcast i8* %call4 to double*
  %arraydecay13 = bitcast i8* %call5 to double*
  %arraydecay14 = bitcast i8* %call6 to double*
  %arraydecay15 = bitcast i8* %call7 to double*
  %arraydecay16 = bitcast i8* %call8 to double*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
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
  tail call fastcc void @print_array(double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call7) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.cond.loopexit:                                ; preds = %for.inc
  %exitcond = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond, label %for.end48, label %for.body

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %for.cond.loopexit ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv27 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %u1, i64 %indvars.iv27
  store double %conv2, double* %arrayidx, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %1 = trunc i64 %indvars.iv.next3 to i32
  %conv3 = sitofp i32 %1 to double
  %div = fdiv double %conv3, 2.000000e+03
  %div4 = fmul double %div, 5.000000e-01
  %arrayidx6 = getelementptr inbounds double, double* %u2, i64 %indvars.iv27
  store double %div4, double* %arrayidx6, align 8
  %div10 = fmul double %div, 2.500000e-01
  %arrayidx12 = getelementptr inbounds double, double* %v1, i64 %indvars.iv27
  store double %div10, double* %arrayidx12, align 8
  %div16 = fdiv double %div, 6.000000e+00
  %arrayidx18 = getelementptr inbounds double, double* %v2, i64 %indvars.iv27
  store double %div16, double* %arrayidx18, align 8
  %div22 = fmul double %div, 1.250000e-01
  %arrayidx24 = getelementptr inbounds double, double* %y, i64 %indvars.iv27
  store double %div22, double* %arrayidx24, align 8
  %div28 = fdiv double %div, 9.000000e+00
  %arrayidx30 = getelementptr inbounds double, double* %z, i64 %indvars.iv27
  store double %div28, double* %arrayidx30, align 8
  %arrayidx32 = getelementptr inbounds double, double* %x, i64 %indvars.iv27
  store double 0.000000e+00, double* %arrayidx32, align 8
  %arrayidx34 = getelementptr inbounds double, double* %w, i64 %indvars.iv27
  store double 0.000000e+00, double* %arrayidx34, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body, %for.inc
  %indvars.iv5 = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.body ]
  %2 = mul nuw nsw i64 %indvars.iv5, %indvars.iv27
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv39 = sitofp i32 %rem to double
  %div41 = fdiv double %conv39, 2.000000e+03
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv5
  store double %div41, double* %arrayidx45, align 8
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %4 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %5 = trunc i64 %4 to i32
  %rem.1 = srem i32 %5, 2000
  %conv39.1 = sitofp i32 %rem.1 to double
  %div41.1 = fdiv double %conv39.1, 2.000000e+03
  %arrayidx45.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %div41.1, double* %arrayidx45.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond.loopexit, label %for.inc

for.end48:                                        ; preds = %for.cond.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) unnamed_addr #2 {
entry:
  %scevgep7 = getelementptr double, double* %v1, i64 2000
  %scevgep10 = getelementptr double, double* %v2, i64 2000
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %entry
  %indvars.iv1532 = phi i64 [ %0, %for.inc20 ], [ 0, %entry ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv1532, i64 0
  %0 = add i64 %indvars.iv1532, 1
  %scevgep4 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7 = getelementptr inbounds double, double* %u1, i64 %indvars.iv1532
  %arrayidx11 = getelementptr inbounds double, double* %u2, i64 %indvars.iv1532
  %bound0 = icmp ult double* %scevgep, %arrayidx7
  %bound1 = icmp ult double* %arrayidx7, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult double* %scevgep, %scevgep7
  %bound114 = icmp ugt double* %scevgep4, %v1
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  %bound018 = icmp ult double* %scevgep, %arrayidx11
  %bound119 = icmp ult double* %arrayidx11, %scevgep4
  %found.conflict20 = and i1 %bound018, %bound119
  %conflict.rdx21 = or i1 %conflict.rdx, %found.conflict20
  %bound022 = icmp ult double* %scevgep, %scevgep10
  %bound123 = icmp ugt double* %scevgep4, %v2
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx25 = or i1 %conflict.rdx21, %found.conflict24
  br i1 %conflict.rdx25, label %for.inc.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond1.preheader
  %1 = load double, double* %arrayidx7, align 8, !alias.scope !1
  %2 = insertelement <2 x double> undef, double %1, i32 0
  %3 = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %4 = load double, double* %arrayidx11, align 8, !alias.scope !4
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

for.inc.preheader:                                ; preds = %for.cond1.preheader
  br label %for.inc

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1532, i64 %offset.idx
  %8 = bitcast double* %7 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %8, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec26 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %9 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec27 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !11
  %strided.vec28 = shufflevector <4 x double> %wide.vec27, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec29 = shufflevector <4 x double> %wide.vec27, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = fmul <2 x double> %3, %strided.vec28
  %12 = fadd <2 x double> %strided.vec, %11
  %13 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec30 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !12
  %strided.vec31 = shufflevector <4 x double> %wide.vec30, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec32 = shufflevector <4 x double> %wide.vec30, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fmul <2 x double> %6, %strided.vec31
  %16 = fadd <2 x double> %12, %15
  %17 = or i64 %offset.idx, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1532, i64 %17
  %19 = fmul <2 x double> %3, %strided.vec29
  %20 = fadd <2 x double> %strided.vec26, %19
  %21 = fmul <2 x double> %6, %strided.vec32
  %22 = fadd <2 x double> %20, %21
  %23 = getelementptr double, double* %18, i64 -1
  %24 = bitcast double* %23 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %16, <2 x double> %22, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %24, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %25 = icmp eq i64 %index.next, 1000
  br i1 %25, label %for.inc20.loopexit70, label %vector.body, !llvm.loop !13

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv1130 = phi i64 [ %indvars.iv.next12.1, %for.inc ], [ 0, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1532, i64 %indvars.iv1130
  %26 = load double, double* %arrayidx5, align 8
  %27 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %v1, i64 %indvars.iv1130
  %28 = load double, double* %arrayidx9, align 8
  %mul = fmul double %27, %28
  %add = fadd double %26, %mul
  %29 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %v2, i64 %indvars.iv1130
  %30 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %29, %30
  %add15 = fadd double %add, %mul14
  store double %add15, double* %arrayidx5, align 8
  %indvars.iv.next12 = or i64 %indvars.iv1130, 1
  %arrayidx5.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1532, i64 %indvars.iv.next12
  %31 = load double, double* %arrayidx5.1, align 8
  %32 = load double, double* %arrayidx7, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next12
  %33 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %32, %33
  %add.1 = fadd double %31, %mul.1
  %34 = load double, double* %arrayidx11, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next12
  %35 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %34, %35
  %add15.1 = fadd double %add.1, %mul14.1
  store double %add15.1, double* %arrayidx5.1, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1130, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next12.1, 2000
  br i1 %exitcond14.1, label %for.inc20.loopexit, label %for.inc, !llvm.loop !16

for.inc20.loopexit:                               ; preds = %for.inc
  br label %for.inc20

for.inc20.loopexit70:                             ; preds = %vector.body
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit70, %for.inc20.loopexit
  %exitcond47 = icmp eq i64 %0, 2000
  br i1 %exitcond47, label %for.cond26.preheader.preheader, label %for.cond1.preheader

for.cond26.preheader.preheader:                   ; preds = %for.inc20
  br label %for.cond26.preheader

for.cond26.preheader:                             ; preds = %for.cond26.preheader.preheader, %for.inc45
  %indvars.iv927 = phi i64 [ %indvars.iv.next10, %for.inc45 ], [ 0, %for.cond26.preheader.preheader ]
  %arrayidx30 = getelementptr inbounds double, double* %x, i64 %indvars.iv927
  %.pre = load double, double* %arrayidx30, align 8
  br label %for.inc42

vector.memcheck48:                                ; preds = %for.inc45
  %scevgep39 = getelementptr double, double* %x, i64 2000
  %scevgep42 = getelementptr double, double* %z, i64 2000
  %bound044 = icmp ugt double* %scevgep42, %x
  %bound145 = icmp ugt double* %scevgep39, %z
  %memcheck.conflict47 = and i1 %bound044, %bound145
  br i1 %memcheck.conflict47, label %for.inc58.preheader, label %vector.body33.preheader

vector.body33.preheader:                          ; preds = %vector.memcheck48
  br label %vector.body33

for.inc58.preheader:                              ; preds = %vector.memcheck48
  br label %for.inc58

vector.body33:                                    ; preds = %vector.body33.preheader, %vector.body33
  %index50 = phi i64 [ %index.next51, %vector.body33 ], [ 0, %vector.body33.preheader ]
  %offset.idx54 = shl i64 %index50, 2
  %36 = getelementptr inbounds double, double* %x, i64 %offset.idx54
  %37 = bitcast double* %36 to <8 x double>*
  %wide.vec58 = load <8 x double>, <8 x double>* %37, align 8, !alias.scope !17, !noalias !20
  %38 = getelementptr inbounds double, double* %z, i64 %offset.idx54
  %39 = bitcast double* %38 to <8 x double>*
  %wide.vec63 = load <8 x double>, <8 x double>* %39, align 8, !alias.scope !20
  %40 = fadd <8 x double> %wide.vec58, %wide.vec63
  %41 = shufflevector <8 x double> %40, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %42 = shufflevector <8 x double> %40, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %43 = shufflevector <8 x double> %40, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %44 = or i64 %offset.idx54, 3
  %45 = getelementptr inbounds double, double* %x, i64 %44
  %46 = shufflevector <8 x double> %40, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %47 = getelementptr double, double* %45, i64 -3
  %48 = bitcast double* %47 to <8 x double>*
  %49 = shufflevector <2 x double> %41, <2 x double> %42, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %50 = shufflevector <2 x double> %43, <2 x double> %46, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec68 = shufflevector <4 x double> %49, <4 x double> %50, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec68, <8 x double>* %48, align 8, !alias.scope !17, !noalias !20
  %index.next51 = add i64 %index50, 2
  %51 = icmp eq i64 %index.next51, 500
  br i1 %51, label %for.cond64.preheader.preheader.loopexit69, label %vector.body33, !llvm.loop !22

for.inc42:                                        ; preds = %for.cond26.preheader, %for.inc42
  %52 = phi double [ %add39.1, %for.inc42 ], [ %.pre, %for.cond26.preheader ]
  %indvars.iv525 = phi i64 [ %indvars.iv.next6.1, %for.inc42 ], [ 0, %for.cond26.preheader ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv525, i64 %indvars.iv927
  %53 = load double, double* %arrayidx34, align 8
  %mul35 = fmul double %53, %beta
  %arrayidx37 = getelementptr inbounds double, double* %y, i64 %indvars.iv525
  %54 = load double, double* %arrayidx37, align 8
  %mul38 = fmul double %mul35, %54
  %add39 = fadd double %52, %mul38
  store double %add39, double* %arrayidx30, align 8
  %indvars.iv.next6 = or i64 %indvars.iv525, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next6, i64 %indvars.iv927
  %55 = load double, double* %arrayidx34.1, align 8
  %mul35.1 = fmul double %55, %beta
  %arrayidx37.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6
  %56 = load double, double* %arrayidx37.1, align 8
  %mul38.1 = fmul double %mul35.1, %56
  %add39.1 = fadd double %add39, %mul38.1
  store double %add39.1, double* %arrayidx30, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv525, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 2000
  br i1 %exitcond8.1, label %for.inc45, label %for.inc42

for.inc45:                                        ; preds = %for.inc42
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv927, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond44, label %vector.memcheck48, label %for.cond26.preheader

for.inc58:                                        ; preds = %for.inc58.preheader, %for.inc58
  %indvars.iv323 = phi i64 [ %indvars.iv.next4.3, %for.inc58 ], [ 0, %for.inc58.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv323
  %57 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv323
  %58 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %57, %58
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next4 = or i64 %indvars.iv323, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next4
  %59 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next4
  %60 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %59, %60
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next4.1 = or i64 %indvars.iv323, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next4.1
  %61 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next4.1
  %62 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %61, %62
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next4.2 = or i64 %indvars.iv323, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next4.2
  %63 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next4.2
  %64 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %63, %64
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv323, 4
  %exitcond38.3 = icmp eq i64 %indvars.iv.next4.3, 2000
  br i1 %exitcond38.3, label %for.cond64.preheader.preheader.loopexit, label %for.inc58, !llvm.loop !23

for.cond64.preheader.preheader.loopexit:          ; preds = %for.inc58
  br label %for.cond64.preheader.preheader

for.cond64.preheader.preheader.loopexit69:        ; preds = %vector.body33
  br label %for.cond64.preheader.preheader

for.cond64.preheader.preheader:                   ; preds = %for.cond64.preheader.preheader.loopexit69, %for.cond64.preheader.preheader.loopexit
  br label %for.cond64.preheader

for.cond64.preheader:                             ; preds = %for.cond64.preheader.preheader, %for.inc83
  %indvars.iv120 = phi i64 [ %indvars.iv.next2, %for.inc83 ], [ 0, %for.cond64.preheader.preheader ]
  %arrayidx68 = getelementptr inbounds double, double* %w, i64 %indvars.iv120
  %.pre34 = load double, double* %arrayidx68, align 8
  br label %for.inc80

for.inc80:                                        ; preds = %for.cond64.preheader, %for.inc80
  %65 = phi double [ %add77.1, %for.inc80 ], [ %.pre34, %for.cond64.preheader ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next.1, %for.inc80 ], [ 0, %for.cond64.preheader ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv18
  %66 = load double, double* %arrayidx72, align 8
  %mul73 = fmul double %66, %alpha
  %arrayidx75 = getelementptr inbounds double, double* %x, i64 %indvars.iv18
  %67 = load double, double* %arrayidx75, align 8
  %mul76 = fmul double %mul73, %67
  %add77 = fadd double %65, %mul76
  store double %add77, double* %arrayidx68, align 8
  %indvars.iv.next = or i64 %indvars.iv18, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv.next
  %68 = load double, double* %arrayidx72.1, align 8
  %mul73.1 = fmul double %68, %alpha
  %arrayidx75.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %69 = load double, double* %arrayidx75.1, align 8
  %mul76.1 = fmul double %mul73.1, %69
  %add77.1 = fadd double %add77, %mul76.1
  store double %add77.1, double* %arrayidx68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv18, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.inc83, label %for.inc80

for.inc83:                                        ; preds = %for.inc80
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.preheader

for.end85:                                        ; preds = %for.inc83
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %w) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc
  %indvars.iv2 = phi i64 [ %indvars.iv.next, %for.inc ], [ 0, %entry ]
  %3 = trunc i64 %indvars.iv2 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv2
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}

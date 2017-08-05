; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
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
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
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
  call void @print_array(double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call5) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call7) #4
  call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.body:                                         ; preds = %for.cond35.for.cond_crit_edge, %entry
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.cond35.for.cond_crit_edge ]
  %0 = trunc i64 %indvars.iv32 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %u1, i64 %indvars.iv32
  store double %conv2, double* %arrayidx, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %1 = trunc i64 %indvars.iv.next33 to i32
  %conv3 = sitofp i32 %1 to double
  %div = fdiv double %conv3, 2.000000e+03
  %div4 = fmul double %div, 5.000000e-01
  %arrayidx6 = getelementptr inbounds double, double* %u2, i64 %indvars.iv32
  store double %div4, double* %arrayidx6, align 8
  %div10 = fmul double %div, 2.500000e-01
  %arrayidx12 = getelementptr inbounds double, double* %v1, i64 %indvars.iv32
  store double %div10, double* %arrayidx12, align 8
  %div16 = fdiv double %div, 6.000000e+00
  %arrayidx18 = getelementptr inbounds double, double* %v2, i64 %indvars.iv32
  store double %div16, double* %arrayidx18, align 8
  %div22 = fmul double %div, 1.250000e-01
  %arrayidx24 = getelementptr inbounds double, double* %y, i64 %indvars.iv32
  store double %div22, double* %arrayidx24, align 8
  %div28 = fdiv double %div, 9.000000e+00
  %arrayidx30 = getelementptr inbounds double, double* %z, i64 %indvars.iv32
  store double %div28, double* %arrayidx30, align 8
  %arrayidx32 = getelementptr inbounds double, double* %x, i64 %indvars.iv32
  store double 0.000000e+00, double* %arrayidx32, align 8
  %arrayidx34 = getelementptr inbounds double, double* %w, i64 %indvars.iv32
  store double 0.000000e+00, double* %arrayidx34, align 8
  br label %for.inc

for.cond35.for.cond_crit_edge:                    ; preds = %for.inc
  %exitcond = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond, label %for.end48, label %for.body

for.inc:                                          ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next.1, %for.inc ]
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv32
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv39 = sitofp i32 %rem to double
  %div41 = fdiv double %conv39, 2.000000e+03
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv
  store double %div41, double* %arrayidx45, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv32
  %5 = trunc i64 %4 to i32
  %rem.1 = srem i32 %5, 2000
  %conv39.1 = sitofp i32 %rem.1 to double
  %div41.1 = fdiv double %conv39.1, 2.000000e+03
  %arrayidx45.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div41.1, double* %arrayidx45.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.cond_crit_edge, label %for.inc

for.end48:                                        ; preds = %for.cond35.for.cond_crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) #2 {
entry:
  %scevgep6 = getelementptr double, double* %v1, i64 2000
  %scevgep9 = getelementptr double, double* %v2, i64 2000
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge:                     ; preds = %for.inc20, %entry
  %indvars.iv69 = phi i64 [ 0, %entry ], [ %indvars.iv.next70, %for.inc20 ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 0
  %0 = add i64 %indvars.iv69, 1
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7 = getelementptr inbounds double, double* %u1, i64 %indvars.iv69
  %arrayidx11 = getelementptr inbounds double, double* %u2, i64 %indvars.iv69
  %bound0 = icmp ult double* %scevgep, %arrayidx7
  %bound1 = icmp ult double* %arrayidx7, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep6
  %bound113 = icmp ugt double* %scevgep3, %v1
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  %bound017 = icmp ult double* %scevgep, %arrayidx11
  %bound118 = icmp ult double* %arrayidx11, %scevgep3
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx20 = or i1 %conflict.rdx, %found.conflict19
  %bound021 = icmp ult double* %scevgep, %scevgep9
  %bound122 = icmp ugt double* %scevgep3, %v2
  %found.conflict23 = and i1 %bound021, %bound122
  %conflict.rdx24 = or i1 %conflict.rdx20, %found.conflict23
  br i1 %conflict.rdx24, label %for.inc.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond.for.cond1_crit_edge
  br label %vector.body

for.inc.preheader:                                ; preds = %for.cond.for.cond1_crit_edge
  br label %for.inc

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %offset.idx
  %2 = bitcast double* %1 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %2, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec25 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %3 = load double, double* %arrayidx7, align 8, !alias.scope !9
  %4 = insertelement <2 x double> undef, double %3, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %6 = getelementptr inbounds double, double* %v1, i64 %offset.idx
  %7 = bitcast double* %6 to <4 x double>*
  %wide.vec26 = load <4 x double>, <4 x double>* %7, align 8, !alias.scope !10
  %strided.vec27 = shufflevector <4 x double> %wide.vec26, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec28 = shufflevector <4 x double> %wide.vec26, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %8 = fmul <2 x double> %5, %strided.vec27
  %9 = fadd <2 x double> %strided.vec, %8
  %10 = load double, double* %arrayidx11, align 8, !alias.scope !11
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  %13 = getelementptr inbounds double, double* %v2, i64 %offset.idx
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec29 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !12
  %strided.vec30 = shufflevector <4 x double> %wide.vec29, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec31 = shufflevector <4 x double> %wide.vec29, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = fmul <2 x double> %12, %strided.vec30
  %16 = fadd <2 x double> %9, %15
  %17 = or i64 %offset.idx, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %17
  %19 = load double, double* %arrayidx7, align 8, !alias.scope !9
  %20 = insertelement <2 x double> undef, double %19, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  %22 = fmul <2 x double> %21, %strided.vec28
  %23 = fadd <2 x double> %strided.vec25, %22
  %24 = load double, double* %arrayidx11, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %24, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  %27 = fmul <2 x double> %26, %strided.vec31
  %28 = fadd <2 x double> %23, %27
  %29 = getelementptr double, double* %18, i64 -1
  %30 = bitcast double* %29 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %16, <2 x double> %28, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %30, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %31 = icmp eq i64 %index.next, 1000
  br i1 %31, label %for.inc20.loopexit32, label %vector.body, !llvm.loop !13

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.inc ], [ 0, %for.inc.preheader ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv66
  %32 = load double, double* %arrayidx5, align 8
  %33 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %v1, i64 %indvars.iv66
  %34 = load double, double* %arrayidx9, align 8
  %mul = fmul double %33, %34
  %add = fadd double %32, %mul
  %35 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %v2, i64 %indvars.iv66
  %36 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %35, %36
  %add15 = fadd double %add, %mul14
  store double %add15, double* %arrayidx5, align 8
  %indvars.iv.next67 = or i64 %indvars.iv66, 1
  %arrayidx5.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv69, i64 %indvars.iv.next67
  %37 = load double, double* %arrayidx5.1, align 8
  %38 = load double, double* %arrayidx7, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next67
  %39 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %38, %39
  %add.1 = fadd double %37, %mul.1
  %40 = load double, double* %arrayidx11, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next67
  %41 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %40, %41
  %add15.1 = fadd double %add.1, %mul14.1
  store double %add15.1, double* %arrayidx5.1, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next67.1, 2000
  br i1 %exitcond68.1, label %for.inc20.loopexit, label %for.inc, !llvm.loop !16

for.inc20.loopexit:                               ; preds = %for.inc
  br label %for.inc20

for.inc20.loopexit32:                             ; preds = %vector.body
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit32, %for.inc20.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond71, label %for.cond23.for.cond26_crit_edge.preheader, label %for.cond.for.cond1_crit_edge

for.cond23.for.cond26_crit_edge.preheader:        ; preds = %for.inc20
  br label %for.cond23.for.cond26_crit_edge

for.cond23.for.cond26_crit_edge:                  ; preds = %for.cond23.for.cond26_crit_edge.preheader, %for.inc45
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc45 ], [ 0, %for.cond23.for.cond26_crit_edge.preheader ]
  %arrayidx30 = getelementptr inbounds double, double* %x, i64 %indvars.iv63
  %.pre = load double, double* %arrayidx30, align 8
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42, %for.cond23.for.cond26_crit_edge
  %42 = phi double [ %.pre, %for.cond23.for.cond26_crit_edge ], [ %add39.1, %for.inc42 ]
  %indvars.iv60 = phi i64 [ 0, %for.cond23.for.cond26_crit_edge ], [ %indvars.iv.next61.1, %for.inc42 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv63
  %43 = load double, double* %arrayidx34, align 8
  %mul35 = fmul double %43, %beta
  %arrayidx37 = getelementptr inbounds double, double* %y, i64 %indvars.iv60
  %44 = load double, double* %arrayidx37, align 8
  %mul38 = fmul double %mul35, %44
  %add39 = fadd double %42, %mul38
  store double %add39, double* %arrayidx30, align 8
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv63
  %45 = load double, double* %arrayidx34.1, align 8
  %mul35.1 = fmul double %45, %beta
  %arrayidx37.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next61
  %46 = load double, double* %arrayidx37.1, align 8
  %mul38.1 = fmul double %mul35.1, %46
  %add39.1 = fadd double %add39, %mul38.1
  store double %add39.1, double* %arrayidx30, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next61.1, 2000
  br i1 %exitcond62.1, label %for.inc45, label %for.inc42

for.inc45:                                        ; preds = %for.inc42
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond65, label %for.inc58.preheader, label %for.cond23.for.cond26_crit_edge

for.inc58.preheader:                              ; preds = %for.inc45
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.preheader, %for.inc58
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.4, %for.inc58 ], [ 0, %for.inc58.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv57
  %47 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv57
  %48 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %47, %48
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58
  %49 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58
  %50 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %49, %50
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.1
  %51 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.1
  %52 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %51, %52
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next58.2 = add nsw i64 %indvars.iv57, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.2
  %53 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.2
  %54 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %53, %54
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next58.3 = add nsw i64 %indvars.iv57, 4
  %arrayidx52.4 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.3
  %55 = load double, double* %arrayidx52.4, align 8
  %arrayidx54.4 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.3
  %56 = load double, double* %arrayidx54.4, align 8
  %add55.4 = fadd double %55, %56
  store double %add55.4, double* %arrayidx52.4, align 8
  %indvars.iv.next58.4 = add nsw i64 %indvars.iv57, 5
  %exitcond59.4 = icmp eq i64 %indvars.iv.next58.4, 2000
  br i1 %exitcond59.4, label %for.cond61.for.cond64_crit_edge.preheader, label %for.inc58

for.cond61.for.cond64_crit_edge.preheader:        ; preds = %for.inc58
  br label %for.cond61.for.cond64_crit_edge

for.cond61.for.cond64_crit_edge:                  ; preds = %for.cond61.for.cond64_crit_edge.preheader, %for.inc83
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc83 ], [ 0, %for.cond61.for.cond64_crit_edge.preheader ]
  %arrayidx68 = getelementptr inbounds double, double* %w, i64 %indvars.iv55
  %.pre1 = load double, double* %arrayidx68, align 8
  br label %for.inc80

for.inc80:                                        ; preds = %for.inc80, %for.cond61.for.cond64_crit_edge
  %57 = phi double [ %.pre1, %for.cond61.for.cond64_crit_edge ], [ %add77.1, %for.inc80 ]
  %indvars.iv = phi i64 [ 0, %for.cond61.for.cond64_crit_edge ], [ %indvars.iv.next.1, %for.inc80 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv
  %58 = load double, double* %arrayidx72, align 8
  %mul73 = fmul double %58, %alpha
  %arrayidx75 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %59 = load double, double* %arrayidx75, align 8
  %mul76 = fmul double %mul73, %59
  %add77 = fadd double %57, %mul76
  store double %add77, double* %arrayidx68, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv.next
  %60 = load double, double* %arrayidx72.1, align 8
  %mul73.1 = fmul double %60, %alpha
  %arrayidx75.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %61 = load double, double* %arrayidx75.1, align 8
  %mul76.1 = fmul double %mul73.1, %61
  %add77.1 = fadd double %add77, %mul76.1
  store double %add77.1, double* %arrayidx68, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.inc83, label %for.inc80

for.inc83:                                        ; preds = %for.inc80
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond, label %for.end85, label %for.cond61.for.cond64_crit_edge

for.end85:                                        ; preds = %for.inc83
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %w) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}

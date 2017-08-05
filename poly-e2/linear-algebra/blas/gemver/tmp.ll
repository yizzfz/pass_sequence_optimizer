; ModuleID = 'B.ll'
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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemver(double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
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
  call fastcc void @print_array(double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.cond.loopexit:                                ; preds = %for.body38
  %exitcond1 = icmp eq i64 %indvars.iv.next32, 2000
  br i1 %exitcond1, label %for.end48, label %for.body

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv31 = phi i64 [ 0, %entry ], [ %indvars.iv.next32, %for.cond.loopexit ]
  %0 = trunc i64 %indvars.iv31 to i32
  %conv2 = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %u1, i64 %indvars.iv31
  store double %conv2, double* %arrayidx, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %1 = trunc i64 %indvars.iv.next32 to i32
  %conv3 = sitofp i32 %1 to double
  %div = fdiv double %conv3, 2.000000e+03
  %div4 = fmul double %div, 5.000000e-01
  %arrayidx6 = getelementptr inbounds double, double* %u2, i64 %indvars.iv31
  store double %div4, double* %arrayidx6, align 8
  %div10 = fmul double %div, 2.500000e-01
  %arrayidx12 = getelementptr inbounds double, double* %v1, i64 %indvars.iv31
  store double %div10, double* %arrayidx12, align 8
  %div16 = fdiv double %div, 6.000000e+00
  %arrayidx18 = getelementptr inbounds double, double* %v2, i64 %indvars.iv31
  store double %div16, double* %arrayidx18, align 8
  %div22 = fmul double %div, 1.250000e-01
  %arrayidx24 = getelementptr inbounds double, double* %y, i64 %indvars.iv31
  store double %div22, double* %arrayidx24, align 8
  %div28 = fdiv double %div, 9.000000e+00
  %arrayidx30 = getelementptr inbounds double, double* %z, i64 %indvars.iv31
  store double %div28, double* %arrayidx30, align 8
  %arrayidx32 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  store double 0.000000e+00, double* %arrayidx32, align 8
  %arrayidx34 = getelementptr inbounds double, double* %w, i64 %indvars.iv31
  store double 0.000000e+00, double* %arrayidx34, align 8
  br label %for.body38

for.body38:                                       ; preds = %for.body38, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next.1, %for.body38 ]
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv31
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv39 = sitofp i32 %rem to double
  %div41 = fdiv double %conv39, 2.000000e+03
  %arrayidx45 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv
  store double %div41, double* %arrayidx45, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv31
  %5 = trunc i64 %4 to i32
  %rem.1 = srem i32 %5, 2000
  %conv39.1 = sitofp i32 %rem.1 to double
  %div41.1 = fdiv double %conv39.1, 2.000000e+03
  %arrayidx45.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %div41.1, double* %arrayidx45.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond.loopexit, label %for.body38

for.end48:                                        ; preds = %for.cond.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) unnamed_addr #2 {
entry:
  %scevgep6 = getelementptr double, double* %v1, i64 2000
  %scevgep9 = getelementptr double, double* %v2, i64 2000
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc20, %entry
  %indvars.iv68 = phi i64 [ 0, %entry ], [ %indvars.iv.next69, %for.inc20 ]
  %scevgep = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 0
  %0 = add nuw nsw i64 %indvars.iv68, 1
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 %0, i64 0
  %arrayidx7 = getelementptr inbounds double, double* %u1, i64 %indvars.iv68
  %arrayidx11 = getelementptr inbounds double, double* %u2, i64 %indvars.iv68
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
  br i1 %conflict.rdx24, label %for.body3.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond1.preheader
  br label %vector.body

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %index
  %2 = bitcast double* %1 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %2, align 8, !alias.scope !1, !noalias !4
  %3 = getelementptr double, double* %1, i64 2
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %5 = load double, double* %arrayidx7, align 8, !alias.scope !9
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %5, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %10 = getelementptr inbounds double, double* %v1, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !10
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !10
  %14 = fmul <2 x double> %7, %wide.load27
  %15 = fmul <2 x double> %9, %wide.load28
  %16 = fadd <2 x double> %wide.load, %14
  %17 = fadd <2 x double> %wide.load26, %15
  %18 = load double, double* %arrayidx11, align 8, !alias.scope !11
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %18, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds double, double* %v2, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !12
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !12
  %27 = fmul <2 x double> %20, %wide.load29
  %28 = fmul <2 x double> %22, %wide.load30
  %29 = fadd <2 x double> %16, %27
  %30 = fadd <2 x double> %17, %28
  %31 = bitcast double* %1 to <2 x double>*
  store <2 x double> %29, <2 x double>* %31, align 8, !alias.scope !1, !noalias !4
  %32 = bitcast double* %3 to <2 x double>*
  store <2 x double> %30, <2 x double>* %32, align 8, !alias.scope !1, !noalias !4
  %index.next = add nuw nsw i64 %index, 4
  %33 = icmp eq i64 %index.next, 2000
  br i1 %33, label %for.inc20.loopexit65, label %vector.body, !llvm.loop !13

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv65 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next66.1, %for.body3 ]
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv65
  %34 = load double, double* %arrayidx5, align 8
  %35 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %v1, i64 %indvars.iv65
  %36 = load double, double* %arrayidx9, align 8
  %mul = fmul double %35, %36
  %add = fadd double %34, %mul
  %37 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %v2, i64 %indvars.iv65
  %38 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %37, %38
  %add15 = fadd double %add, %mul14
  store double %add15, double* %arrayidx5, align 8
  %indvars.iv.next66 = or i64 %indvars.iv65, 1
  %arrayidx5.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv68, i64 %indvars.iv.next66
  %39 = load double, double* %arrayidx5.1, align 8
  %40 = load double, double* %arrayidx7, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next66
  %41 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %40, %41
  %add.1 = fadd double %39, %mul.1
  %42 = load double, double* %arrayidx11, align 8
  %arrayidx13.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next66
  %43 = load double, double* %arrayidx13.1, align 8
  %mul14.1 = fmul double %42, %43
  %add15.1 = fadd double %add.1, %mul14.1
  store double %add15.1, double* %arrayidx5.1, align 8
  %exitcond67.1 = icmp eq i64 %indvars.iv.next66, 1999
  %indvars.iv.next66.1 = add nuw nsw i64 %indvars.iv65, 2
  br i1 %exitcond67.1, label %for.inc20.loopexit, label %for.body3, !llvm.loop !16

for.inc20.loopexit:                               ; preds = %for.body3
  br label %for.inc20

for.inc20.loopexit65:                             ; preds = %vector.body
  br label %for.inc20

for.inc20:                                        ; preds = %for.inc20.loopexit65, %for.inc20.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next69, 2000
  br i1 %exitcond63, label %for.cond26.preheader.preheader, label %for.cond1.preheader

for.cond26.preheader.preheader:                   ; preds = %for.inc20
  br label %for.cond26.preheader

for.cond26.preheader:                             ; preds = %for.inc45, %for.cond26.preheader.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc45 ], [ 0, %for.cond26.preheader.preheader ]
  %arrayidx30 = getelementptr inbounds double, double* %x, i64 %indvars.iv63
  %.pre = load double, double* %arrayidx30, align 8
  br label %for.body28

for.body28:                                       ; preds = %for.body28, %for.cond26.preheader
  %44 = phi double [ %.pre, %for.cond26.preheader ], [ %add39.1, %for.body28 ]
  %indvars.iv60 = phi i64 [ 0, %for.cond26.preheader ], [ %indvars.iv.next61.1, %for.body28 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv63
  %45 = load double, double* %arrayidx34, align 8
  %mul35 = fmul double %45, %beta
  %arrayidx37 = getelementptr inbounds double, double* %y, i64 %indvars.iv60
  %46 = load double, double* %arrayidx37, align 8
  %mul38 = fmul double %mul35, %46
  %add39 = fadd double %44, %mul38
  store double %add39, double* %arrayidx30, align 8
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next61, i64 %indvars.iv63
  %47 = load double, double* %arrayidx34.1, align 8
  %mul35.1 = fmul double %47, %beta
  %arrayidx37.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next61
  %48 = load double, double* %arrayidx37.1, align 8
  %mul38.1 = fmul double %mul35.1, %48
  %add39.1 = fadd double %add39, %mul38.1
  store double %add39.1, double* %arrayidx30, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next61, 1999
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  br i1 %exitcond62.1, label %for.inc45, label %for.body28

for.inc45:                                        ; preds = %for.body28
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond61, label %vector.memcheck46, label %for.cond26.preheader

vector.memcheck46:                                ; preds = %for.inc45
  %scevgep37 = getelementptr double, double* %x, i64 2000
  %scevgep40 = getelementptr double, double* %z, i64 2000
  %bound042 = icmp ugt double* %scevgep40, %x
  %bound143 = icmp ugt double* %scevgep37, %z
  %memcheck.conflict45 = and i1 %bound042, %bound143
  br i1 %memcheck.conflict45, label %for.body50.preheader, label %vector.body31.preheader

vector.body31.preheader:                          ; preds = %vector.memcheck46
  br label %vector.body31

for.body50.preheader:                             ; preds = %vector.memcheck46
  br label %for.body50

vector.body31:                                    ; preds = %vector.body31, %vector.body31.preheader
  %index48 = phi i64 [ 0, %vector.body31.preheader ], [ %index.next49.1, %vector.body31 ]
  %49 = getelementptr inbounds double, double* %x, i64 %index48
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !17, !noalias !20
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !17, !noalias !20
  %53 = getelementptr inbounds double, double* %z, i64 %index48
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !20
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !20
  %57 = fadd <2 x double> %wide.load56, %wide.load58
  %58 = fadd <2 x double> %wide.load57, %wide.load59
  %59 = bitcast double* %49 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !17, !noalias !20
  %60 = bitcast double* %51 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !17, !noalias !20
  %index.next49 = or i64 %index48, 4
  %61 = getelementptr inbounds double, double* %x, i64 %index.next49
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load56.1 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !17, !noalias !20
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load57.1 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !17, !noalias !20
  %65 = getelementptr inbounds double, double* %z, i64 %index.next49
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load58.1 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !20
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load59.1 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !20
  %69 = fadd <2 x double> %wide.load56.1, %wide.load58.1
  %70 = fadd <2 x double> %wide.load57.1, %wide.load59.1
  %71 = bitcast double* %61 to <2 x double>*
  store <2 x double> %69, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  %72 = bitcast double* %63 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !alias.scope !17, !noalias !20
  %index.next49.1 = add nuw nsw i64 %index48, 8
  %73 = icmp eq i64 %index.next49.1, 2000
  br i1 %73, label %for.cond64.preheader.preheader.loopexit64, label %vector.body31, !llvm.loop !22

for.body50:                                       ; preds = %for.body50, %for.body50.preheader
  %indvars.iv57 = phi i64 [ 0, %for.body50.preheader ], [ %indvars.iv.next58.4, %for.body50 ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv57
  %74 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv57
  %75 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %74, %75
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58
  %76 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58
  %77 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %76, %77
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.1
  %78 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.1
  %79 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %78, %79
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next58.2 = add nuw nsw i64 %indvars.iv57, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.2
  %80 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.2
  %81 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %80, %81
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next58.3 = add nuw nsw i64 %indvars.iv57, 4
  %arrayidx52.4 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next58.3
  %82 = load double, double* %arrayidx52.4, align 8
  %arrayidx54.4 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next58.3
  %83 = load double, double* %arrayidx54.4, align 8
  %add55.4 = fadd double %82, %83
  store double %add55.4, double* %arrayidx52.4, align 8
  %exitcond59.4 = icmp eq i64 %indvars.iv.next58.3, 1999
  %indvars.iv.next58.4 = add nuw nsw i64 %indvars.iv57, 5
  br i1 %exitcond59.4, label %for.cond64.preheader.preheader.loopexit, label %for.body50, !llvm.loop !23

for.cond64.preheader.preheader.loopexit:          ; preds = %for.body50
  br label %for.cond64.preheader.preheader

for.cond64.preheader.preheader.loopexit64:        ; preds = %vector.body31
  br label %for.cond64.preheader.preheader

for.cond64.preheader.preheader:                   ; preds = %for.cond64.preheader.preheader.loopexit64, %for.cond64.preheader.preheader.loopexit
  br label %for.cond64.preheader

for.cond64.preheader:                             ; preds = %for.inc83, %for.cond64.preheader.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc83 ], [ 0, %for.cond64.preheader.preheader ]
  %arrayidx68 = getelementptr inbounds double, double* %w, i64 %indvars.iv55
  %.pre1 = load double, double* %arrayidx68, align 8
  br label %for.body66

for.body66:                                       ; preds = %for.body66, %for.cond64.preheader
  %84 = phi double [ %.pre1, %for.cond64.preheader ], [ %add77.1, %for.body66 ]
  %indvars.iv = phi i64 [ 0, %for.cond64.preheader ], [ %indvars.iv.next.1, %for.body66 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv
  %85 = load double, double* %arrayidx72, align 8
  %mul73 = fmul double %85, %alpha
  %arrayidx75 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %86 = load double, double* %arrayidx75, align 8
  %mul76 = fmul double %mul73, %86
  %add77 = fadd double %84, %mul76
  store double %add77, double* %arrayidx68, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv.next
  %87 = load double, double* %arrayidx72.1, align 8
  %mul73.1 = fmul double %87, %alpha
  %arrayidx75.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %88 = load double, double* %arrayidx75.1, align 8
  %mul76.1 = fmul double %mul73.1, %88
  %add77.1 = fadd double %add77, %mul76.1
  store double %add77.1, double* %arrayidx68, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc83, label %for.body66

for.inc83:                                        ; preds = %for.body66
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond60, label %for.end85, label %for.cond64.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}

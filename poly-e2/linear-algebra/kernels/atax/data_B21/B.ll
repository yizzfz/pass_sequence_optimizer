; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %0 = bitcast i8* %call to [2100 x double]*
  %1 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array([2100 x double]* %0, double* %1)
  tail call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call2 to double*
  %3 = bitcast i8* %call3 to double*
  tail call fastcc void @kernel_atax([2100 x double]* %0, double* %1, double* %2, double* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to double*
  tail call fastcc void @print_array(double* %5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.inc

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br label %for.inc19.us

for.inc19.us:                                     ; preds = %for.inc19.us.for.inc19.us_crit_edge, %for.cond7.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us ], [ %indvars.iv.next, %for.inc19.us.for.inc19.us_crit_edge ]
  %0 = add nuw nsw i64 %indvars.iv16, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, 9.500000e+03
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %exitcond1 = icmp eq i64 %indvars.iv, 2099
  br i1 %exitcond1, label %for.cond7.for.inc22_crit_edge.us, label %for.inc19.us.for.inc19.us_crit_edge

for.inc19.us.for.inc19.us_crit_edge:              ; preds = %for.inc19.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc19.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.inc19.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %cmp4.us = icmp slt i64 %indvars.iv.next17, 1900
  br i1 %cmp4.us, label %for.cond7.preheader.us, label %for.end24

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc.for.inc_crit_edge ], [ 0, %entry ]
  %2 = trunc i64 %indvars.iv2 to i32
  %conv2 = sitofp i32 %2 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv2
  store double %add, double* %arrayidx, align 8
  %exitcond = icmp eq i64 %indvars.iv2, 2099
  br i1 %exitcond, label %for.cond7.preheader.us.preheader, label %for.inc.for.inc_crit_edge

for.cond7.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond7.preheader.us

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  br label %for.inc

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* readonly %A, double* nocapture readonly %x, double* %y, double* %tmp) unnamed_addr #2 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.6, %vector.body ]
  %0 = getelementptr inbounds double, double* %y, i64 %index
  %1 = bitcast double* %0 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %3, align 8
  %index.next = add nuw nsw i64 %index, 4
  %4 = getelementptr inbounds double, double* %y, i64 %index.next
  %5 = bitcast double* %4 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %index.next.1 = add nsw i64 %index, 8
  %8 = getelementptr inbounds double, double* %y, i64 %index.next.1
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.2 = add nsw i64 %index, 12
  %12 = getelementptr inbounds double, double* %y, i64 %index.next.2
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %index.next.3 = add nsw i64 %index, 16
  %16 = getelementptr inbounds double, double* %y, i64 %index.next.3
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %index.next.4 = add nsw i64 %index, 20
  %20 = getelementptr inbounds double, double* %y, i64 %index.next.4
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %index.next.5 = add nsw i64 %index, 24
  %24 = getelementptr inbounds double, double* %y, i64 %index.next.5
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.6 = add nsw i64 %index, 28
  %28 = icmp eq i64 %index.next.6, 2100
  br i1 %28, label %for.body5.us.preheader, label %vector.body, !llvm.loop !1

for.body5.us.preheader:                           ; preds = %vector.body
  %scevgep = getelementptr double, double* %y, i64 1
  %scevgep20 = getelementptr double, double* %y, i64 2100
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv65 = phi i64 [ 0, %for.body5.us.preheader ], [ %29, %for.inc42.us ]
  %scevgep22 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 1
  %29 = add i64 %indvars.iv65, 1
  %scevgep24 = getelementptr [2100 x double], [2100 x double]* %A, i64 %29, i64 0
  %sext = shl i64 %indvars.iv65, 32
  %idxprom6.us = ashr exact i64 %sext, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv65
  %.pre = load double, double* %arrayidx12.us, align 8
  br label %for.inc21.us

for.inc42.us:                                     ; preds = %for.inc39.us.for.inc39.us_crit_edge
  %cmp4.us = icmp slt i64 %29, 1900
  br i1 %cmp4.us, label %for.body5.us, label %for.end44

for.inc39.us.for.inc39.us_crit_edge:              ; preds = %for.inc39.us.for.inc39.us_crit_edge, %for.inc39.us.for.inc39.us_crit_edge.preheader.new
  %indvars.iv6312 = phi i64 [ %indvars.iv6312.ph, %for.inc39.us.for.inc39.us_crit_edge.preheader.new ], [ %indvars.iv.next64.1, %for.inc39.us.for.inc39.us_crit_edge ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6312, 1
  %.pre71 = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64
  %30 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next64
  %31 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %31, %.pre71
  %add36.us = fadd double %30, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv6312, 2
  %.pre71.1 = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64.1
  %32 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next64.1
  %33 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %33, %.pre71.1
  %add36.us.1 = fadd double %32, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %exitcond1.1 = icmp eq i64 %indvars.iv.next64.1, 2099
  br i1 %exitcond1.1, label %for.inc42.us, label %for.inc39.us.for.inc39.us_crit_edge, !llvm.loop !4

for.inc21.us:                                     ; preds = %for.inc21.us.for.inc21.us_crit_edge, %for.body5.us
  %34 = phi double [ %.pre, %for.body5.us ], [ %add.us, %for.inc21.us.for.inc21.us_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next, %for.inc21.us.for.inc21.us_crit_edge ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %35 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %36 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %35, %36
  %add.us = fadd double %34, %mul.us
  store double %add.us, double* %arrayidx12.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, 2099
  br i1 %exitcond, label %for.inc39.us.preheader, label %for.inc21.us.for.inc21.us_crit_edge

for.inc21.us.for.inc21.us_crit_edge:              ; preds = %for.inc21.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.inc21.us

for.inc39.us.preheader:                           ; preds = %for.inc21.us
  %37 = load double, double* %y, align 8
  %arrayidx32.us9 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 0
  %38 = load double, double* %arrayidx32.us9, align 8
  %mul35.us10 = fmul double %38, %add.us
  %add36.us11 = fadd double %37, %mul35.us10
  store double %add36.us11, double* %y, align 8
  %bound0 = icmp ult double* %scevgep, %arrayidx12.us
  %bound1 = icmp ult double* %arrayidx12.us, %scevgep20
  %found.conflict = and i1 %bound0, %bound1
  %bound027 = icmp ult double* %scevgep, %scevgep24
  %bound128 = icmp ult double* %scevgep22, %scevgep20
  %found.conflict29 = and i1 %bound027, %bound128
  %conflict.rdx = or i1 %found.conflict, %found.conflict29
  br i1 %conflict.rdx, label %for.inc39.us.for.inc39.us_crit_edge.preheader.new, label %vector.body14.preheader

vector.body14.preheader:                          ; preds = %for.inc39.us.preheader
  br label %vector.body14

for.inc39.us.for.inc39.us_crit_edge.preheader.new.loopexit: ; preds = %vector.body14
  br label %for.inc39.us.for.inc39.us_crit_edge.preheader.new

for.inc39.us.for.inc39.us_crit_edge.preheader.new: ; preds = %for.inc39.us.for.inc39.us_crit_edge.preheader.new.loopexit, %for.inc39.us.preheader
  %indvars.iv6312.ph = phi i64 [ 1, %for.inc39.us.preheader ], [ 2097, %for.inc39.us.for.inc39.us_crit_edge.preheader.new.loopexit ]
  %.pre71.prol = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv6312.ph
  %39 = load double, double* %arrayidx28.us.prol, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv6312.ph
  %40 = load double, double* %arrayidx32.us.prol, align 8
  %mul35.us.prol = fmul double %40, %.pre71.prol
  %add36.us.prol = fadd double %39, %mul35.us.prol
  store double %add36.us.prol, double* %arrayidx28.us.prol, align 8
  br label %for.inc39.us.for.inc39.us_crit_edge

vector.body14:                                    ; preds = %vector.body14.preheader, %vector.body14
  %index31 = phi i64 [ %index.next32, %vector.body14 ], [ 0, %vector.body14.preheader ]
  %41 = or i64 %index31, 1
  %42 = load double, double* %arrayidx12.us, align 8, !alias.scope !5
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = getelementptr inbounds double, double* %y, i64 %41
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !8, !noalias !10
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !8, !noalias !10
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %41
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !12
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !12
  %53 = fmul <2 x double> %wide.load40, %44
  %54 = fmul <2 x double> %wide.load41, %44
  %55 = fadd <2 x double> %wide.load, %53
  %56 = fadd <2 x double> %wide.load39, %54
  store <2 x double> %55, <2 x double>* %46, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %56, <2 x double>* %48, align 8, !alias.scope !8, !noalias !10
  %index.next32 = add i64 %index31, 4
  %57 = icmp eq i64 %index.next32, 2096
  br i1 %57, label %for.inc39.us.for.inc39.us_crit_edge.preheader.new.loopexit, label %vector.body14, !llvm.loop !13

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %storemerge2 = phi i32 [ 0, %entry ], [ %6, %for.inc.for.body_crit_edge ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2100
  br i1 %cmp, label %for.inc.for.body_crit_edge, label %for.end

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  %6 = trunc i64 %indvars.iv.next to i32
  br label %for.body

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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !2, !3}
!5 = !{!6}
!6 = distinct !{!6, !7}
!7 = distinct !{!7, !"LVerDomain"}
!8 = !{!9}
!9 = distinct !{!9, !7}
!10 = !{!6, !11}
!11 = distinct !{!11, !7}
!12 = !{!11}
!13 = distinct !{!13, !2, !3}

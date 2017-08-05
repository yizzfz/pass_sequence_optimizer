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
  %call = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(i32 2100, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, [2100 x double]* nocapture %A, double* nocapture %x) unnamed_addr #2 {
entry:
  br label %for.body

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br label %for.body10.us

for.body10.us:                                    ; preds = %for.body10.us, %for.cond7.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us ], [ %indvars.iv.next.1, %for.body10.us ]
  %0 = add nuw nsw i64 %indvars.iv16, %indvars.iv
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = add nuw nsw i64 %indvars.iv16, %indvars.iv.next
  %3 = trunc i64 %2 to i32
  %rem.us.1 = srem i32 %3, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.v.i0.1 = insertelement <2 x double> undef, double %conv12.us, i32 0
  %div14.us.v.i0.2 = insertelement <2 x double> %div14.us.v.i0.1, double %conv12.us.1, i32 1
  %div14.us = fdiv <2 x double> %div14.us.v.i0.2, <double 9.500000e+03, double 9.500000e+03>
  %4 = bitcast double* %arrayidx18.us to <2 x double>*
  store <2 x double> %div14.us, <2 x double>* %4, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us, label %for.body10.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.body10.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1900
  br i1 %exitcond19, label %for.end24, label %for.cond7.preheader.us

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21.2, %for.body ]
  %5 = trunc i64 %indvars.iv20 to i32
  %conv2 = sitofp i32 %5 to double
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv20
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %6 = trunc i64 %indvars.iv.next21 to i32
  %conv2.1 = sitofp i32 %6 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv2, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv2.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %add = fadd <2 x double> %div, <double 1.000000e+00, double 1.000000e+00>
  %7 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %add, <2 x double>* %7, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %8 = trunc i64 %indvars.iv.next21.1 to i32
  %conv2.2 = sitofp i32 %8 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next21.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %exitcond22.2 = icmp eq i64 %indvars.iv.next21.2, 2100
  br i1 %exitcond22.2, label %for.cond7.preheader.us.preheader, label %for.body

for.cond7.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond7.preheader.us

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32 %m, i32 %n, [2100 x double]* readonly %A, double* nocapture readonly %x, double* %y, double* %tmp) unnamed_addr #2 {
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

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv65 = phi i64 [ %29, %for.inc42.us ], [ 0, %for.body5.us.preheader ]
  %scevgep90 = getelementptr [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 1
  %29 = add i64 %indvars.iv65, 1
  %scevgep92 = getelementptr [2100 x double], [2100 x double]* %A, i64 %29, i64 0
  %sext = shl i64 %indvars.iv65, 32
  %idxprom6.us = ashr exact i64 %sext, 32
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %idxprom6.us
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv65
  %.pre = load double, double* %arrayidx12.us, align 8
  br label %for.body10.us

for.inc42.us:                                     ; preds = %for.body26.us.for.body26.us_crit_edge
  %exitcond77 = icmp eq i64 %29, 1900
  br i1 %exitcond77, label %for.end44, label %for.body5.us

for.body26.us.for.body26.us_crit_edge:            ; preds = %for.body26.us.for.body26.us_crit_edge, %for.body26.us.for.body26.us_crit_edge.preheader.new
  %indvars.iv.next6475 = phi i64 [ %indvars.iv.next64.prol, %for.body26.us.for.body26.us_crit_edge.preheader.new ], [ %indvars.iv.next64.1, %for.body26.us.for.body26.us_crit_edge ]
  %.pre71 = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6475
  %30 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next6475
  %31 = load double, double* %arrayidx32.us, align 8
  %mul35.us = fmul double %31, %.pre71
  %add36.us = fadd double %30, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv.next6475, 1
  %.pre71.1 = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next64
  %32 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next64
  %33 = load double, double* %arrayidx32.us.1, align 8
  %mul35.us.1 = fmul double %33, %.pre71.1
  %add36.us.1 = fadd double %32, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv.next6475, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next64.1, 2100
  br i1 %exitcond76.1, label %for.inc42.us, label %for.body26.us.for.body26.us_crit_edge, !llvm.loop !4

for.body10.us:                                    ; preds = %for.body10.us, %for.body5.us
  %34 = phi double [ %.pre, %for.body5.us ], [ %add.us.2, %for.body10.us ]
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.2, %for.body10.us ]
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv
  %35 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %36 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %35, %36
  %add.us = fadd double %34, %mul.us
  store double %add.us, double* %arrayidx12.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next
  %37 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %37, %38
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx12.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx16.us.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %39 = load double, double* %arrayidx16.us.2, align 8
  %arrayidx18.us.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next.1
  %40 = load double, double* %arrayidx18.us.2, align 8
  %mul.us.2 = fmul double %39, %40
  %add.us.2 = fadd double %add.us.1, %mul.us.2
  store double %add.us.2, double* %arrayidx12.us, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %for.body26.us.preheader, label %for.body10.us

for.body26.us.preheader:                          ; preds = %for.body10.us
  %41 = load double, double* %y, align 8
  %arrayidx32.us72 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 0
  %42 = load double, double* %arrayidx32.us72, align 8
  %mul35.us73 = fmul double %42, %add.us.2
  %add36.us74 = fadd double %41, %mul35.us73
  store double %add36.us74, double* %y, align 8
  %bound0 = icmp ult double* %scevgep, %arrayidx12.us
  %bound1 = icmp ult double* %arrayidx12.us, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep, %scevgep92
  %bound196 = icmp ult double* %scevgep90, %scevgep88
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  br i1 %conflict.rdx, label %for.body26.us.for.body26.us_crit_edge.preheader.new, label %vector.body82.preheader

vector.body82.preheader:                          ; preds = %for.body26.us.preheader
  br label %vector.body82

for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit: ; preds = %vector.body82
  br label %for.body26.us.for.body26.us_crit_edge.preheader.new

for.body26.us.for.body26.us_crit_edge.preheader.new: ; preds = %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, %for.body26.us.preheader
  %indvars.iv.next6475.ph = phi i64 [ 1, %for.body26.us.preheader ], [ 2097, %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit ]
  %.pre71.prol = load double, double* %arrayidx12.us, align 8
  %arrayidx28.us.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.next6475.ph
  %43 = load double, double* %arrayidx28.us.prol, align 8
  %arrayidx32.us.prol = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %indvars.iv.next6475.ph
  %44 = load double, double* %arrayidx32.us.prol, align 8
  %mul35.us.prol = fmul double %44, %.pre71.prol
  %add36.us.prol = fadd double %43, %mul35.us.prol
  store double %add36.us.prol, double* %arrayidx28.us.prol, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv.next6475.ph, 1
  br label %for.body26.us.for.body26.us_crit_edge

vector.body82:                                    ; preds = %vector.body82.preheader, %vector.body82
  %index99 = phi i64 [ %index.next100, %vector.body82 ], [ 0, %vector.body82.preheader ]
  %offset.idx = or i64 %index99, 1
  %45 = load double, double* %arrayidx12.us, align 8, !alias.scope !5
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = getelementptr inbounds double, double* %y, i64 %offset.idx
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !8, !noalias !10
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %52 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv65, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !12
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !12
  %56 = fmul <2 x double> %wide.load108, %47
  %57 = fmul <2 x double> %wide.load109, %47
  %58 = fadd <2 x double> %wide.load, %56
  %59 = fadd <2 x double> %wide.load107, %57
  store <2 x double> %58, <2 x double>* %49, align 8, !alias.scope !8, !noalias !10
  store <2 x double> %59, <2 x double>* %51, align 8, !alias.scope !8, !noalias !10
  %index.next100 = add i64 %index99, 4
  %60 = icmp eq i64 %index.next100, 2096
  br i1 %60, label %for.body26.us.for.body26.us_crit_edge.preheader.new.loopexit, label %vector.body82, !llvm.loop !13

for.body5.us.preheader:                           ; preds = %vector.body
  %scevgep = getelementptr double, double* %y, i64 1
  %scevgep88 = getelementptr double, double* %y, i64 2100
  br label %for.body5.us

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %storemerge2 = phi i32 [ 0, %entry ], [ %6, %if.end ]
  %rem = srem i32 %storemerge2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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

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
  call fastcc void @init_array(i32 2000, double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  call fastcc void @kernel_gemver(i32 2000, double %0, double %1, [2000 x double]* %arraydecay, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11, double* %arraydecay12, double* %arraydecay13, double* %arraydecay14, double* %arraydecay15, double* %arraydecay16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call5 to double*
  call fastcc void @print_array(i32 2000, double* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [2000 x double]* nocapture %A, double* nocapture %u1, double* nocapture %v1, double* nocapture %u2, double* nocapture %v2, double* nocapture %w, double* nocapture %x, double* nocapture %y, double* nocapture %z) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.inc46_crit_edge.us.for.body.us_crit_edge, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond35.for.inc46_crit_edge.us.for.body.us_crit_edge ]
  %0 = trunc i64 %indvars.iv10 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv10
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %1 = trunc i64 %indvars.iv.next11 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv10
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %3 = fdiv <2 x double> %2, <double 2.000000e+03, double undef>
  %4 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %div4.us = fmul <2 x double> %4, <double 5.000000e-01, double 2.500000e-01>
  %div4.us.v.r1 = extractelement <2 x double> %div4.us, i32 0
  %div4.us.v.r2 = extractelement <2 x double> %div4.us, i32 1
  store double %div4.us.v.r1, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv10
  store double %div4.us.v.r2, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv10
  %div21.us = fdiv double %conv3.us, 2.000000e+03
  %div22.us = fmul double %div21.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv10
  store double %div22.us, double* %arrayidx24.us, align 8
  %div16.us = fdiv <2 x double> %4, <double 6.000000e+00, double 9.000000e+00>
  %div16.us.v.r1 = extractelement <2 x double> %div16.us, i32 0
  %div16.us.v.r2 = extractelement <2 x double> %div16.us, i32 1
  store double %div16.us.v.r1, double* %arrayidx18.us, align 8
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv10
  store double %div16.us.v.r2, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.for.inc.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us.for.inc.us_crit_edge ], [ 0, %for.body.us ]
  %5 = mul nsw i64 %indvars.iv, %indvars.iv10
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nsw i64 %indvars.iv.next, %indvars.iv10
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.v.i0.1 = insertelement <2 x double> undef, double %conv39.us, i32 0
  %div41.us.v.i0.2 = insertelement <2 x double> %div41.us.v.i0.1, double %conv39.us.1, i32 1
  %div41.us = fdiv <2 x double> %div41.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %9 = bitcast double* %arrayidx45.us to <2 x double>*
  store <2 x double> %div41.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.inc46_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.cond35.for.inc46_crit_edge.us:                ; preds = %for.inc.us
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end48, label %for.cond35.for.inc46_crit_edge.us.for.body.us_crit_edge

for.cond35.for.inc46_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond35.for.inc46_crit_edge.us
  br label %for.body.us

for.end48:                                        ; preds = %for.cond35.for.inc46_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32 %n, double %alpha, double %beta, [2000 x double]* nocapture %A, double* %u1, double* nocapture readonly %v1, double* %u2, double* nocapture readonly %v2, double* %w, double* %x, double* nocapture readonly %y, double* readonly %z) unnamed_addr #2 {
entry:
  %sunkaddr = ptrtoint double* %u1 to i64
  %sunkaddr70 = ptrtoint double* %u2 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us.for.cond1.preheader.us_crit_edge, %entry
  %indvars.iv51 = phi i64 [ 0, %entry ], [ %indvars.iv.next52, %for.cond1.for.inc20_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %sunkaddr67 = shl i64 %indvars.iv51, 3
  %sunkaddr68 = add i64 %sunkaddr, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %sunkaddr71 = shl i64 %indvars.iv51, 3
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.for.inc.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv49 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next50, %for.inc.us.for.inc.us_crit_edge ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv49
  %0 = load double, double* %arrayidx5.us, align 8
  %1 = load double, double* %sunkaddr69, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv49
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  %3 = load double, double* %sunkaddr73, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv49
  %4 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %3, %4
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next50, 2000
  br i1 %exitcond65, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next52, 2000
  br i1 %exitcond66, label %for.cond1.for.inc20_crit_edge.us.for.cond26.preheader.us_crit_edge, label %for.cond1.for.inc20_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc20_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc20_crit_edge.us
  br label %for.cond1.preheader.us

for.cond1.for.inc20_crit_edge.us.for.cond26.preheader.us_crit_edge: ; preds = %for.cond1.for.inc20_crit_edge.us
  %sunkaddr78 = ptrtoint double* %x to i64
  %sunkaddr82 = ptrtoint double* %x to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.for.inc45_crit_edge.us.for.cond26.preheader.us_crit_edge, %for.cond1.for.inc20_crit_edge.us.for.cond26.preheader.us_crit_edge
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond26.for.inc45_crit_edge.us.for.cond26.preheader.us_crit_edge ], [ 0, %for.cond1.for.inc20_crit_edge.us.for.cond26.preheader.us_crit_edge ]
  %sunkaddr79 = shl i64 %indvars.iv45, 3
  %sunkaddr80 = add i64 %sunkaddr78, %sunkaddr79
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to double*
  %.pre = load double, double* %sunkaddr81, align 8
  %sunkaddr83 = shl i64 %indvars.iv45, 3
  %sunkaddr84 = add i64 %sunkaddr82, %sunkaddr83
  %sunkaddr85 = inttoptr i64 %sunkaddr84 to double*
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us.for.inc42.us_crit_edge, %for.cond26.preheader.us
  %5 = phi double [ %add39.us.1, %for.inc42.us.for.inc42.us_crit_edge ], [ %.pre, %for.cond26.preheader.us ]
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %for.inc42.us.for.inc42.us_crit_edge ], [ 0, %for.cond26.preheader.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv45
  %6 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %6, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv41
  %7 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %7
  %add39.us = fadd double %5, %mul38.us
  store double %add39.us, double* %sunkaddr85, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv45
  %8 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %8, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next42
  %9 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %9
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr85, align 8
  %indvars.iv.next42.1 = add nuw nsw i64 %indvars.iv41, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next42.1, 2000
  br i1 %exitcond44.1, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us.for.inc42.us_crit_edge

for.inc42.us.for.inc42.us_crit_edge:              ; preds = %for.inc42.us
  br label %for.inc42.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.inc42.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next46, 2000
  br i1 %exitcond64, label %vector.memcheck, label %for.cond26.for.inc45_crit_edge.us.for.cond26.preheader.us_crit_edge

for.cond26.for.inc45_crit_edge.us.for.cond26.preheader.us_crit_edge: ; preds = %for.cond26.for.inc45_crit_edge.us
  br label %for.cond26.preheader.us

vector.memcheck:                                  ; preds = %for.cond26.for.inc45_crit_edge.us
  %scevgep = getelementptr double, double* %x, i64 2000
  %scevgep101 = getelementptr double, double* %z, i64 2000
  %bound0 = icmp ugt double* %scevgep101, %x
  %bound1 = icmp ugt double* %scevgep, %z
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck.for.inc58_crit_edge, label %vector.memcheck.vector.body_crit_edge

vector.memcheck.vector.body_crit_edge:            ; preds = %vector.memcheck
  br label %vector.body

vector.memcheck.for.inc58_crit_edge:              ; preds = %vector.memcheck
  br label %for.inc58

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.memcheck.vector.body_crit_edge
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.memcheck.vector.body_crit_edge ]
  %10 = getelementptr inbounds double, double* %x, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1, !noalias !4
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1, !noalias !4
  %14 = getelementptr inbounds double, double* %z, i64 %index
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !4
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !4
  %18 = fadd <2 x double> %wide.load, %wide.load105
  %19 = fadd <2 x double> %wide.load104, %wide.load106
  %20 = bitcast double* %10 to <2 x double>*
  store <2 x double> %18, <2 x double>* %20, align 8, !alias.scope !1, !noalias !4
  %21 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %21, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %22 = icmp eq i64 %index.next, 2000
  br i1 %22, label %vector.body.for.cond64.preheader.us_crit_edge, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

vector.body.for.cond64.preheader.us_crit_edge:    ; preds = %vector.body
  br label %for.cond64.preheader.us.preheader

for.cond64.preheader.us.preheader:                ; preds = %vector.body.for.cond64.preheader.us_crit_edge, %for.inc58.for.cond64.preheader.us_crit_edge
  %sunkaddr90 = ptrtoint double* %w to i64
  %sunkaddr94 = ptrtoint double* %w to i64
  br label %for.cond64.preheader.us

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc83_crit_edge.us.for.cond64.preheader.us_crit_edge
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.cond64.for.inc83_crit_edge.us.for.cond64.preheader.us_crit_edge ], [ 0, %for.cond64.preheader.us.preheader ]
  %sunkaddr91 = shl i64 %indvars.iv36, 3
  %sunkaddr92 = add i64 %sunkaddr90, %sunkaddr91
  %sunkaddr93 = inttoptr i64 %sunkaddr92 to double*
  %.pre62 = load double, double* %sunkaddr93, align 8
  %sunkaddr95 = shl i64 %indvars.iv36, 3
  %sunkaddr96 = add i64 %sunkaddr94, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to double*
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us.for.inc80.us_crit_edge, %for.cond64.preheader.us
  %23 = phi double [ %add77.us.1, %for.inc80.us.for.inc80.us_crit_edge ], [ %.pre62, %for.cond64.preheader.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc80.us.for.inc80.us_crit_edge ], [ 0, %for.cond64.preheader.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv
  %24 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %24, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %25 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %25
  %add77.us = fadd double %23, %mul76.us
  store double %add77.us, double* %sunkaddr97, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv36, i64 %indvars.iv.next
  %26 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %26, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %27 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %27
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr97, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us.for.inc80.us_crit_edge

for.inc80.us.for.inc80.us_crit_edge:              ; preds = %for.inc80.us
  br label %for.inc80.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.inc80.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.for.inc83_crit_edge.us.for.cond64.preheader.us_crit_edge

for.cond64.for.inc83_crit_edge.us.for.cond64.preheader.us_crit_edge: ; preds = %for.cond64.for.inc83_crit_edge.us
  br label %for.cond64.preheader.us

for.inc58:                                        ; preds = %for.inc58.for.inc58_crit_edge, %vector.memcheck.for.inc58_crit_edge
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.inc58.for.inc58_crit_edge ], [ 0, %vector.memcheck.for.inc58_crit_edge ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv38
  %28 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv38
  %29 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %28, %29
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond63, label %for.inc58.for.cond64.preheader.us_crit_edge, label %for.inc58.for.inc58_crit_edge, !llvm.loop !9

for.inc58.for.inc58_crit_edge:                    ; preds = %for.inc58
  br label %for.inc58

for.inc58.for.cond64.preheader.us_crit_edge:      ; preds = %for.inc58
  br label %for.cond64.preheader.us.preheader

for.end85:                                        ; preds = %for.cond64.for.inc83_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %w) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.for.inc_crit_edge

for.body.for.inc_crit_edge:                       ; preds = %for.body
  br label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body.for.inc_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}

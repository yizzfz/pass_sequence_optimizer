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
  %0 = bitcast i8* %call to [2000 x double]*
  %1 = bitcast i8* %call1 to double*
  %2 = bitcast i8* %call2 to double*
  %3 = bitcast i8* %call3 to double*
  %4 = bitcast i8* %call4 to double*
  %5 = bitcast i8* %call5 to double*
  %6 = bitcast i8* %call6 to double*
  %7 = bitcast i8* %call7 to double*
  %8 = bitcast i8* %call8 to double*
  call void @init_array(double* nonnull %alpha, double* nonnull %beta, [2000 x double]* %0, double* %1, double* %2, double* %3, double* %4, double* %5, double* %6, double* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = load double, double* %alpha, align 8
  %10 = load double, double* %beta, align 8
  call void @kernel_gemver(double %9, double %10, [2000 x double]* %0, double* %1, double* %2, double* %3, double* %4, double* %5, double* %6, double* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %11 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %11, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(double* %5)
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
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond35.for.inc46_crit_edge.us, %for.body.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next11, %for.cond35.for.inc46_crit_edge.us ]
  %0 = trunc i64 %indvars.iv10 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv10
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %1 = trunc i64 %indvars.iv.next11 to i32
  %conv3.us = sitofp i32 %1 to double
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv10
  %2 = insertelement <2 x double> undef, double %conv3.us, i32 0
  %div.v.i0.2.us = shufflevector <2 x double> %2, <2 x double> undef, <2 x i32> zeroinitializer
  %div.us = fdiv <2 x double> %div.v.i0.2.us, <double 2.000000e+03, double 2.000000e+03>
  %div4.us = fdiv <2 x double> %div.us, <double 2.000000e+00, double 4.000000e+00>
  %div4.v.r1.us = extractelement <2 x double> %div4.us, i32 0
  %div4.v.r2.us = extractelement <2 x double> %div4.us, i32 1
  store double %div4.v.r1.us, double* %arrayidx6.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv10
  store double %div4.v.r2.us, double* %arrayidx12.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv10
  %div16.us = fdiv <2 x double> %div.us, <double 6.000000e+00, double 8.000000e+00>
  %div16.v.r1.us = extractelement <2 x double> %div16.us, i32 0
  %div16.v.r2.us = extractelement <2 x double> %div16.us, i32 1
  store double %div16.v.r1.us, double* %arrayidx18.us, align 8
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv10
  store double %div16.v.r2.us, double* %arrayidx24.us, align 8
  %div27.us = fdiv double %conv3.us, 2.000000e+03
  %div28.us = fdiv double %div27.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv10
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv10
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.1, %for.inc.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, %indvars.iv
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %5 = mul nuw nsw i64 %indvars.iv10, %indvars.iv.next
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.v.i0.1 = insertelement <2 x double> undef, double %conv39.us, i32 0
  %div41.us.v.i0.2 = insertelement <2 x double> %div41.us.v.i0.1, double %conv39.us.1, i32 1
  %div41.us = fdiv <2 x double> %div41.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %7 = bitcast double* %arrayidx45.us to <2 x double>*
  store <2 x double> %div41.us, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond35.for.inc46_crit_edge.us, label %for.inc.us

for.cond35.for.inc46_crit_edge.us:                ; preds = %for.inc.us
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond13, label %for.end48, label %for.body.us

for.end48:                                        ; preds = %for.cond35.for.inc46_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) #2 {
for.cond1.preheader.us.preheader:
  %sunkaddr = ptrtoint double* %u1 to i64
  %sunkaddr69 = ptrtoint double* %u2 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv59 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next60, %for.cond1.for.inc20_crit_edge.us ]
  %sunkaddr66 = shl i64 %indvars.iv59, 3
  %sunkaddr67 = add i64 %sunkaddr, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  %sunkaddr71 = add i64 %sunkaddr69, %sunkaddr66
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv55 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next56.1, %for.inc.us ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv55
  %0 = load double, double* %arrayidx5.us, align 8
  %1 = load double, double* %sunkaddr68, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv55
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  %3 = load double, double* %sunkaddr72, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv55
  %4 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %3, %4
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv.next56
  %5 = load double, double* %arrayidx5.us.1, align 8
  %6 = load double, double* %sunkaddr68, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next56
  %7 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %6, %7
  %add.us.1 = fadd double %5, %mul.us.1
  %8 = load double, double* %sunkaddr72, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next56
  %9 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %8, %9
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 2000
  br i1 %exitcond58.1, label %for.cond1.for.inc20_crit_edge.us, label %for.inc.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next60, 2000
  br i1 %exitcond65, label %for.cond26.preheader.us.preheader, label %for.cond1.preheader.us

for.cond26.preheader.us.preheader:                ; preds = %for.cond1.for.inc20_crit_edge.us
  %sunkaddr73 = ptrtoint double* %x to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.cond26.preheader.us.preheader, %for.cond26.for.inc45_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond26.for.inc45_crit_edge.us ], [ 0, %for.cond26.preheader.us.preheader ]
  %arrayidx30.us = getelementptr inbounds double, double* %x, i64 %indvars.iv50
  %.pre = load double, double* %arrayidx30.us, align 8
  %sunkaddr74 = shl i64 %indvars.iv50, 3
  %sunkaddr75 = add i64 %sunkaddr73, %sunkaddr74
  %sunkaddr76 = inttoptr i64 %sunkaddr75 to double*
  br label %for.inc42.us

for.inc42.us:                                     ; preds = %for.inc42.us, %for.cond26.preheader.us
  %indvars.iv46 = phi i64 [ 0, %for.cond26.preheader.us ], [ %indvars.iv.next47.1, %for.inc42.us ]
  %10 = phi double [ %.pre, %for.cond26.preheader.us ], [ %add39.us.1, %for.inc42.us ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv50
  %11 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %11, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv46
  %12 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %12
  %add39.us = fadd double %10, %mul38.us
  store double %add39.us, double* %sunkaddr76, align 8
  %indvars.iv.next47 = or i64 %indvars.iv46, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next47, i64 %indvars.iv50
  %13 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %13, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next47
  %14 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %14
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr76, align 8
  %indvars.iv.next47.1 = add nuw nsw i64 %indvars.iv46, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next47.1, 2000
  br i1 %exitcond49.1, label %for.cond26.for.inc45_crit_edge.us, label %for.inc42.us

for.cond26.for.inc45_crit_edge.us:                ; preds = %for.inc42.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next51, 2000
  br i1 %exitcond64, label %for.inc58.preheader, label %for.cond26.preheader.us

for.inc58.preheader:                              ; preds = %for.cond26.for.inc45_crit_edge.us
  br label %for.inc58

for.cond64.preheader.us:                          ; preds = %for.cond64.preheader.us.preheader, %for.cond64.for.inc83_crit_edge.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.cond64.for.inc83_crit_edge.us ], [ 0, %for.cond64.preheader.us.preheader ]
  %arrayidx68.us = getelementptr inbounds double, double* %w, i64 %indvars.iv37
  %.pre36 = load double, double* %arrayidx68.us, align 8
  %sunkaddr78 = shl i64 %indvars.iv37, 3
  %sunkaddr79 = add i64 %sunkaddr77, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  br label %for.inc80.us

for.inc80.us:                                     ; preds = %for.inc80.us, %for.cond64.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond64.preheader.us ], [ %indvars.iv.next.1, %for.inc80.us ]
  %15 = phi double [ %.pre36, %for.cond64.preheader.us ], [ %add77.us.1, %for.inc80.us ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %16 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %16, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %17 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %17
  %add77.us = fadd double %15, %mul76.us
  store double %add77.us, double* %sunkaddr80, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %18, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %19
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr80, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond64.for.inc83_crit_edge.us, label %for.inc80.us

for.cond64.for.inc83_crit_edge.us:                ; preds = %for.inc80.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond, label %for.end85, label %for.cond64.preheader.us

for.inc58:                                        ; preds = %for.inc58.preheader, %for.inc58
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.4, %for.inc58 ], [ 0, %for.inc58.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv42
  %20 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv42
  %21 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %20, %21
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43
  %22 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43
  %23 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %22, %23
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next43.1 = add nuw nsw i64 %indvars.iv42, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.1
  %24 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43.1
  %25 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %24, %25
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next43.2 = add nuw nsw i64 %indvars.iv42, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.2
  %26 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43.2
  %27 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %26, %27
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next43.3 = add nuw nsw i64 %indvars.iv42, 4
  %arrayidx52.4 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next43.3
  %28 = load double, double* %arrayidx52.4, align 8
  %arrayidx54.4 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next43.3
  %29 = load double, double* %arrayidx54.4, align 8
  %add55.4 = fadd double %28, %29
  store double %add55.4, double* %arrayidx52.4, align 8
  %indvars.iv.next43.4 = add nuw nsw i64 %indvars.iv42, 5
  %exitcond45.4 = icmp eq i64 %indvars.iv.next43.4, 2000
  br i1 %exitcond45.4, label %for.cond64.preheader.us.preheader, label %for.inc58

for.cond64.preheader.us.preheader:                ; preds = %for.inc58
  %sunkaddr77 = ptrtoint double* %w to i64
  br label %for.cond64.preheader.us

for.end85:                                        ; preds = %for.cond64.for.inc83_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %w) #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond3, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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

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
  tail call fastcc void @print_array(double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond.loopexit.us.for.body.us_crit_edge, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.cond.loopexit.us.for.body.us_crit_edge ]
  %0 = trunc i64 %indvars.iv6 to i32
  %conv2.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %u1, i64 %indvars.iv6
  store double %conv2.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %1 = trunc i64 %indvars.iv.next7 to i32
  %conv3.us = sitofp i32 %1 to double
  %div.us = fdiv double %conv3.us, 2.000000e+03
  %div4.us = fmul double %div.us, 5.000000e-01
  %arrayidx6.us = getelementptr inbounds double, double* %u2, i64 %indvars.iv6
  store double %div4.us, double* %arrayidx6.us, align 8
  %div10.us = fmul double %div.us, 2.500000e-01
  %arrayidx12.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv6
  store double %div10.us, double* %arrayidx12.us, align 8
  %div16.us = fdiv double %div.us, 6.000000e+00
  %arrayidx18.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv6
  store double %div16.us, double* %arrayidx18.us, align 8
  %div22.us = fmul double %div.us, 1.250000e-01
  %arrayidx24.us = getelementptr inbounds double, double* %y, i64 %indvars.iv6
  store double %div22.us, double* %arrayidx24.us, align 8
  %div28.us = fdiv double %div.us, 9.000000e+00
  %arrayidx30.us = getelementptr inbounds double, double* %z, i64 %indvars.iv6
  store double %div28.us, double* %arrayidx30.us, align 8
  %arrayidx32.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx32.us, align 8
  %arrayidx34.us = getelementptr inbounds double, double* %w, i64 %indvars.iv6
  store double 0.000000e+00, double* %arrayidx34.us, align 8
  %sext = shl i64 %indvars.iv6, 32
  %2 = ashr exact i64 %sext, 32
  br label %for.body38.us

for.body38.us:                                    ; preds = %for.body38.us.for.body38.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.1, %for.body38.us.for.body38.us_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv, %2
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, 2000
  %conv39.us = sitofp i32 %rem.us to double
  %div41.us = fdiv double %conv39.us, 2.000000e+03
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div41.us, double* %arrayidx45.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %5 = mul nuw nsw i64 %indvars.iv.next, %2
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, 2000
  %conv39.us.1 = sitofp i32 %rem.us.1 to double
  %div41.us.1 = fdiv double %conv39.us.1, 2.000000e+03
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div41.us.1, double* %arrayidx45.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond.loopexit.us, label %for.body38.us.for.body38.us_crit_edge

for.body38.us.for.body38.us_crit_edge:            ; preds = %for.body38.us
  br label %for.body38.us

for.cond.loopexit.us:                             ; preds = %for.body38.us
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %for.end48, label %for.cond.loopexit.us.for.body.us_crit_edge

for.cond.loopexit.us.for.body.us_crit_edge:       ; preds = %for.cond.loopexit.us
  br label %for.body.us

for.end48:                                        ; preds = %for.cond.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double %alpha, double %beta, [2000 x double]* nocapture %A, double* nocapture readonly %u1, double* nocapture readonly %v1, double* nocapture readonly %u2, double* nocapture readonly %v2, double* nocapture %w, double* nocapture %x, double* nocapture readonly %y, double* nocapture readonly %z) unnamed_addr #2 {
entry:
  %sunkaddr = ptrtoint double* %u1 to i64
  %sunkaddr18 = ptrtoint double* %u2 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc20.us.for.cond1.preheader.us_crit_edge, %entry
  %i.014.us = phi i32 [ 0, %entry ], [ %inc21.us, %for.inc20.us.for.cond1.preheader.us_crit_edge ]
  %idxprom.us = sext i32 %i.014.us to i64
  %sunkaddr15 = shl nsw i64 %idxprom.us, 3
  %sunkaddr16 = add i64 %sunkaddr, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  %sunkaddr20 = add i64 %sunkaddr18, %sunkaddr15
  %sunkaddr21 = inttoptr i64 %sunkaddr20 to double*
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next37.1, %for.body3.us.for.body3.us_crit_edge ]
  %arrayidx5.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv36
  %0 = load double, double* %arrayidx5.us, align 8
  %1 = load double, double* %sunkaddr17, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %v1, i64 %indvars.iv36
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  %3 = load double, double* %sunkaddr21, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %v2, i64 %indvars.iv36
  %4 = load double, double* %arrayidx13.us, align 8
  %mul14.us = fmul double %3, %4
  %add15.us = fadd double %add.us, %mul14.us
  store double %add15.us, double* %arrayidx5.us, align 8
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %arrayidx5.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv.next37
  %5 = load double, double* %arrayidx5.us.1, align 8
  %6 = load double, double* %sunkaddr17, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %v1, i64 %indvars.iv.next37
  %7 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %6, %7
  %add.us.1 = fadd double %5, %mul.us.1
  %8 = load double, double* %sunkaddr21, align 8
  %arrayidx13.us.1 = getelementptr inbounds double, double* %v2, i64 %indvars.iv.next37
  %9 = load double, double* %arrayidx13.us.1, align 8
  %mul14.us.1 = fmul double %8, %9
  %add15.us.1 = fadd double %add.us.1, %mul14.us.1
  store double %add15.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next37.1, 2000
  br i1 %exitcond38.1, label %for.inc20.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.inc20.us:                                     ; preds = %for.body3.us
  %inc21.us = add nsw i32 %i.014.us, 1
  %cmp.us = icmp slt i32 %inc21.us, 2000
  br i1 %cmp.us, label %for.inc20.us.for.cond1.preheader.us_crit_edge, label %for.cond26.preheader.us.preheader

for.inc20.us.for.cond1.preheader.us_crit_edge:    ; preds = %for.inc20.us
  br label %for.cond1.preheader.us

for.cond26.preheader.us.preheader:                ; preds = %for.inc20.us
  %sunkaddr22 = ptrtoint double* %x to i64
  br label %for.cond26.preheader.us

for.cond26.preheader.us:                          ; preds = %for.inc45.us.for.cond26.preheader.us_crit_edge, %for.cond26.preheader.us.preheader
  %i.110.us = phi i32 [ 0, %for.cond26.preheader.us.preheader ], [ %inc46.us, %for.inc45.us.for.cond26.preheader.us_crit_edge ]
  %idxprom29.us = sext i32 %i.110.us to i64
  %sunkaddr23 = shl nsw i64 %idxprom29.us, 3
  %sunkaddr24 = add i64 %sunkaddr22, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  %.pre = load double, double* %sunkaddr25, align 8
  br label %for.body28.us

for.body28.us:                                    ; preds = %for.body28.us.for.body28.us_crit_edge, %for.cond26.preheader.us
  %10 = phi double [ %.pre, %for.cond26.preheader.us ], [ %add39.us.1, %for.body28.us.for.body28.us_crit_edge ]
  %indvars.iv33 = phi i64 [ 0, %for.cond26.preheader.us ], [ %indvars.iv.next34.1, %for.body28.us.for.body28.us_crit_edge ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %idxprom29.us
  %11 = load double, double* %arrayidx34.us, align 8
  %mul35.us = fmul double %11, %beta
  %arrayidx37.us = getelementptr inbounds double, double* %y, i64 %indvars.iv33
  %12 = load double, double* %arrayidx37.us, align 8
  %mul38.us = fmul double %mul35.us, %12
  %add39.us = fadd double %10, %mul38.us
  store double %add39.us, double* %sunkaddr25, align 8
  %indvars.iv.next34 = or i64 %indvars.iv33, 1
  %arrayidx34.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %idxprom29.us
  %13 = load double, double* %arrayidx34.us.1, align 8
  %mul35.us.1 = fmul double %13, %beta
  %arrayidx37.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %14 = load double, double* %arrayidx37.us.1, align 8
  %mul38.us.1 = fmul double %mul35.us.1, %14
  %add39.us.1 = fadd double %add39.us, %mul38.us.1
  store double %add39.us.1, double* %sunkaddr25, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34.1, 2000
  br i1 %exitcond35.1, label %for.inc45.us, label %for.body28.us.for.body28.us_crit_edge

for.body28.us.for.body28.us_crit_edge:            ; preds = %for.body28.us
  br label %for.body28.us

for.inc45.us:                                     ; preds = %for.body28.us
  %inc46.us = add nsw i32 %i.110.us, 1
  %cmp24.us = icmp slt i32 %inc46.us, 2000
  br i1 %cmp24.us, label %for.inc45.us.for.cond26.preheader.us_crit_edge, label %for.body50.preheader

for.inc45.us.for.cond26.preheader.us_crit_edge:   ; preds = %for.inc45.us
  br label %for.cond26.preheader.us

for.body50.preheader:                             ; preds = %for.inc45.us
  br label %for.body50

for.cond64.preheader.us:                          ; preds = %for.inc83.us.for.cond64.preheader.us_crit_edge, %for.cond64.preheader.us.preheader
  %i.34.us = phi i32 [ 0, %for.cond64.preheader.us.preheader ], [ %inc84.us, %for.inc83.us.for.cond64.preheader.us_crit_edge ]
  %idxprom67.us = sext i32 %i.34.us to i64
  %sunkaddr27 = shl nsw i64 %idxprom67.us, 3
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %.pre1 = load double, double* %sunkaddr29, align 8
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us.for.body66.us_crit_edge, %for.cond64.preheader.us
  %15 = phi double [ %.pre1, %for.cond64.preheader.us ], [ %add77.us.1, %for.body66.us.for.body66.us_crit_edge ]
  %indvars.iv = phi i64 [ 0, %for.cond64.preheader.us ], [ %indvars.iv.next.1, %for.body66.us.for.body66.us_crit_edge ]
  %arrayidx72.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom67.us, i64 %indvars.iv
  %16 = load double, double* %arrayidx72.us, align 8
  %mul73.us = fmul double %16, %alpha
  %arrayidx75.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %17 = load double, double* %arrayidx75.us, align 8
  %mul76.us = fmul double %mul73.us, %17
  %add77.us = fadd double %15, %mul76.us
  store double %add77.us, double* %sunkaddr29, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx72.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %idxprom67.us, i64 %indvars.iv.next
  %18 = load double, double* %arrayidx72.us.1, align 8
  %mul73.us.1 = fmul double %18, %alpha
  %arrayidx75.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx75.us.1, align 8
  %mul76.us.1 = fmul double %mul73.us.1, %19
  %add77.us.1 = fadd double %add77.us, %mul76.us.1
  store double %add77.us.1, double* %sunkaddr29, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.inc83.us, label %for.body66.us.for.body66.us_crit_edge

for.body66.us.for.body66.us_crit_edge:            ; preds = %for.body66.us
  br label %for.body66.us

for.inc83.us:                                     ; preds = %for.body66.us
  %inc84.us = add nsw i32 %i.34.us, 1
  %cmp62.us = icmp slt i32 %inc84.us, 2000
  br i1 %cmp62.us, label %for.inc83.us.for.cond64.preheader.us_crit_edge, label %for.end85

for.inc83.us.for.cond64.preheader.us_crit_edge:   ; preds = %for.inc83.us
  br label %for.cond64.preheader.us

for.body50:                                       ; preds = %for.body50.for.body50_crit_edge, %for.body50.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.4, %for.body50.for.body50_crit_edge ], [ 0, %for.body50.preheader ]
  %arrayidx52 = getelementptr inbounds double, double* %x, i64 %indvars.iv30
  %20 = load double, double* %arrayidx52, align 8
  %arrayidx54 = getelementptr inbounds double, double* %z, i64 %indvars.iv30
  %21 = load double, double* %arrayidx54, align 8
  %add55 = fadd double %20, %21
  store double %add55, double* %arrayidx52, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %arrayidx52.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next31
  %22 = load double, double* %arrayidx52.1, align 8
  %arrayidx54.1 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next31
  %23 = load double, double* %arrayidx54.1, align 8
  %add55.1 = fadd double %22, %23
  store double %add55.1, double* %arrayidx52.1, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %arrayidx52.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next31.1
  %24 = load double, double* %arrayidx52.2, align 8
  %arrayidx54.2 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next31.1
  %25 = load double, double* %arrayidx54.2, align 8
  %add55.2 = fadd double %24, %25
  store double %add55.2, double* %arrayidx52.2, align 8
  %indvars.iv.next31.2 = add nsw i64 %indvars.iv30, 3
  %arrayidx52.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next31.2
  %26 = load double, double* %arrayidx52.3, align 8
  %arrayidx54.3 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next31.2
  %27 = load double, double* %arrayidx54.3, align 8
  %add55.3 = fadd double %26, %27
  store double %add55.3, double* %arrayidx52.3, align 8
  %indvars.iv.next31.3 = add nsw i64 %indvars.iv30, 4
  %arrayidx52.4 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next31.3
  %28 = load double, double* %arrayidx52.4, align 8
  %arrayidx54.4 = getelementptr inbounds double, double* %z, i64 %indvars.iv.next31.3
  %29 = load double, double* %arrayidx54.4, align 8
  %add55.4 = fadd double %28, %29
  store double %add55.4, double* %arrayidx52.4, align 8
  %indvars.iv.next31.4 = add nsw i64 %indvars.iv30, 5
  %exitcond32.4 = icmp eq i64 %indvars.iv.next31.4, 2000
  br i1 %exitcond32.4, label %for.cond64.preheader.us.preheader, label %for.body50.for.body50_crit_edge

for.body50.for.body50_crit_edge:                  ; preds = %for.body50
  br label %for.body50

for.cond64.preheader.us.preheader:                ; preds = %for.body50
  %sunkaddr26 = ptrtoint double* %w to i64
  br label %for.cond64.preheader.us

for.end85:                                        ; preds = %for.inc83.us
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

for.body:                                         ; preds = %if.end.for.body_crit_edge, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %w, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

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

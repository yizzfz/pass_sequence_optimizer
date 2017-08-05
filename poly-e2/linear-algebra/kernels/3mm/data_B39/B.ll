; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %0 = bitcast i8* %call1 to [1000 x double]*
  %1 = bitcast i8* %call2 to [900 x double]*
  %2 = bitcast i8* %call4 to [1200 x double]*
  %3 = bitcast i8* %call5 to [1100 x double]*
  tail call void @init_array([1000 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1100 x double]* %3)
  tail call void (...) @polybench_timer_start() #4
  %4 = bitcast i8* %call to [900 x double]*
  %5 = bitcast i8* %call3 to [1100 x double]*
  %6 = bitcast i8* %call6 to [1100 x double]*
  tail call void @kernel_3mm([900 x double]* %4, [1000 x double]* %0, [900 x double]* %1, [1100 x double]* %5, [1200 x double]* %2, [1100 x double]* %3, [1100 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %7, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = bitcast i8* %call6 to [1100 x double]*
  tail call void @print_array([1100 x double]* %8)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %entry
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.cond1.for.inc8_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv73 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next74, %for.inc.us ]
  %0 = mul nsw i64 %indvars.iv79, %indvars.iv73
  %1 = add nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv73
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next74, 1000
  br i1 %exitcond78, label %for.cond1.for.inc8_crit_edge.us, label %for.inc.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next80 = add nsw i64 %indvars.iv79, 1
  %cmp.us = icmp slt i64 %indvars.iv.next80, 800
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond15.preheader.us.preheader

for.cond15.preheader.us.preheader:                ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.preheader.us.preheader, %for.cond15.for.inc34_crit_edge.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.cond15.preheader.us.preheader ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond15.preheader.us
  %indvars.iv65 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next66, %for.inc31.us ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %3 = mul nsw i64 %indvars.iv69, %indvars.iv.next66
  %4 = add nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv69, i64 %indvars.iv65
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next66, 900
  br i1 %exitcond, label %for.cond15.for.inc34_crit_edge.us, label %for.inc31.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next70 = add nsw i64 %indvars.iv69, 1
  %cmp12.us = icmp slt i64 %indvars.iv.next70, 1000
  br i1 %cmp12.us, label %for.cond15.preheader.us, label %for.cond41.preheader.us.preheader

for.cond41.preheader.us.preheader:                ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.preheader.us.preheader, %for.cond41.for.inc59_crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond41.for.inc59_crit_edge.us ], [ 0, %for.cond41.preheader.us.preheader ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.cond41.preheader.us
  %indvars.iv57 = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next58, %for.inc56.us ]
  %6 = add nuw nsw i64 %indvars.iv57, 3
  %7 = mul nsw i64 %indvars.iv61, %6
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv61, i64 %indvars.iv57
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %cmp42.us = icmp slt i64 %indvars.iv.next58, 1200
  br i1 %cmp42.us, label %for.inc56.us, label %for.cond41.for.inc59_crit_edge.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.inc56.us
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next62, 900
  br i1 %cmp38.us, label %for.cond41.preheader.us, label %for.cond66.preheader.us.preheader

for.cond66.preheader.us.preheader:                ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond66.for.inc85_crit_edge.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.cond66.for.inc85_crit_edge.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next, %for.inc82.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nsw i64 %indvars.iv55, %9
  %11 = add nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv55, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp67.us = icmp slt i64 %indvars.iv.next, 1100
  br i1 %cmp67.us, label %for.inc82.us, label %for.cond66.for.inc85_crit_edge.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.inc82.us
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %cmp63.us = icmp slt i64 %indvars.iv.next56, 1200
  br i1 %cmp63.us, label %for.cond66.preheader.us, label %for.end87

for.end87:                                        ; preds = %for.cond66.for.inc85_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond6.for.inc21_crit_edge.us.us.for.cond1.for.inc24_crit_edge.us_crit_edge, %entry
  %indvars.iv190 = phi i64 [ %indvars.iv.next191, %for.cond6.for.inc21_crit_edge.us.us.for.cond1.for.inc24_crit_edge.us_crit_edge ], [ 0, %entry ]
  br label %for.body3.us.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv186 = phi i64 [ %indvars.iv.next187, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv190, i64 %indvars.iv186
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %exitcond189 = icmp eq i64 %indvars.iv.next187, 900
  br i1 %exitcond189, label %for.cond6.for.inc21_crit_edge.us.us.for.cond1.for.inc24_crit_edge.us_crit_edge, label %for.body3.us.us

for.cond6.for.inc21_crit_edge.us.us.for.cond1.for.inc24_crit_edge.us_crit_edge: ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv.next191 = add nsw i64 %indvars.iv190, 1
  %cmp.us = icmp slt i64 %indvars.iv.next191, 800
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond30.preheader.us.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond6.for.inc21_crit_edge.us.us.for.cond1.for.inc24_crit_edge.us_crit_edge
  br label %for.cond30.preheader.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body3.us.us
  %0 = phi double [ 0.000000e+00, %for.body3.us.us ], [ %add.us.us.1, %for.inc.us.us ]
  %indvars.iv182 = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next183.1, %for.inc.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv190, i64 %indvars.iv182
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv182, i64 %indvars.iv186
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %mul.us.us, %0
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next183 = or i64 %indvars.iv182, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv190, i64 %indvars.iv.next183
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next183, i64 %indvars.iv186
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next183.1 = add nsw i64 %indvars.iv182, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next183.1, 1000
  br i1 %exitcond185.1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.inc.us.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us.preheader, %for.cond37.for.inc57_crit_edge.us.us.for.cond30.for.inc60_crit_edge.us_crit_edge
  %indvars.iv173 = phi i64 [ %indvars.iv.next174, %for.cond37.for.inc57_crit_edge.us.us.for.cond30.for.inc60_crit_edge.us_crit_edge ], [ 0, %for.cond30.preheader.us.preheader ]
  br label %for.body32.us.us

for.body32.us.us:                                 ; preds = %for.cond37.for.inc57_crit_edge.us.us, %for.cond30.preheader.us
  %indvars.iv169 = phi i64 [ %indvars.iv.next170, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.cond30.preheader.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv173, i64 %indvars.iv169
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.inc54.us.us
  %indvars.iv.next170 = add nuw nsw i64 %indvars.iv169, 1
  %exitcond172 = icmp eq i64 %indvars.iv.next170, 1100
  br i1 %exitcond172, label %for.cond37.for.inc57_crit_edge.us.us.for.cond30.for.inc60_crit_edge.us_crit_edge, label %for.body32.us.us

for.cond37.for.inc57_crit_edge.us.us.for.cond30.for.inc60_crit_edge.us_crit_edge: ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv.next174 = add nsw i64 %indvars.iv173, 1
  %cmp28.us = icmp slt i64 %indvars.iv.next174, 900
  br i1 %cmp28.us, label %for.cond30.preheader.us, label %for.cond66.preheader.us.preheader

for.cond66.preheader.us.preheader:                ; preds = %for.cond37.for.inc57_crit_edge.us.us.for.cond30.for.inc60_crit_edge.us_crit_edge
  br label %for.cond66.preheader.us

for.inc54.us.us:                                  ; preds = %for.inc54.us.us, %for.body32.us.us
  %5 = phi double [ 0.000000e+00, %for.body32.us.us ], [ %add53.us.us.2, %for.inc54.us.us ]
  %indvars.iv165 = phi i64 [ 0, %for.body32.us.us ], [ %indvars.iv.next166.2, %for.inc54.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv173, i64 %indvars.iv165
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv165, i64 %indvars.iv169
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %mul48.us.us, %5
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next166 = add nuw nsw i64 %indvars.iv165, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv173, i64 %indvars.iv.next166
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next166, i64 %indvars.iv169
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  %arrayidx43.us.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv173, i64 %indvars.iv.next166.1
  %10 = load double, double* %arrayidx43.us.us.2, align 8
  %arrayidx47.us.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next166.1, i64 %indvars.iv169
  %11 = load double, double* %arrayidx47.us.us.2, align 8
  %mul48.us.us.2 = fmul double %10, %11
  %add53.us.us.2 = fadd double %mul48.us.us.2, %add53.us.us.1
  store double %add53.us.us.2, double* %arrayidx36.us.us, align 8
  %indvars.iv.next166.2 = add nsw i64 %indvars.iv165, 3
  %exitcond168.2 = icmp eq i64 %indvars.iv.next166.2, 1200
  br i1 %exitcond168.2, label %for.cond37.for.inc57_crit_edge.us.us, label %for.inc54.us.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond73.for.inc93_crit_edge.us.us.for.cond66.for.inc96_crit_edge.us_crit_edge
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %for.cond73.for.inc93_crit_edge.us.us.for.cond66.for.inc96_crit_edge.us_crit_edge ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.body68.us.us

for.body68.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond66.preheader.us
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.cond66.preheader.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv158, i64 %indvars.iv154
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.inc90.us.us
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 1100
  br i1 %exitcond157, label %for.cond73.for.inc93_crit_edge.us.us.for.cond66.for.inc96_crit_edge.us_crit_edge, label %for.body68.us.us

for.cond73.for.inc93_crit_edge.us.us.for.cond66.for.inc96_crit_edge.us_crit_edge: ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next159 = add nsw i64 %indvars.iv158, 1
  %cmp64.us = icmp slt i64 %indvars.iv.next159, 800
  br i1 %cmp64.us, label %for.cond66.preheader.us, label %for.end98

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.body68.us.us
  %12 = phi double [ 0.000000e+00, %for.body68.us.us ], [ %add89.us.us.2, %for.inc90.us.us ]
  %indvars.iv150 = phi i64 [ 0, %for.body68.us.us ], [ %indvars.iv.next151.2, %for.inc90.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv158, i64 %indvars.iv150
  %13 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv150, i64 %indvars.iv154
  %14 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %13, %14
  %add89.us.us = fadd double %mul84.us.us, %12
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv158, i64 %indvars.iv.next151
  %15 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next151, i64 %indvars.iv154
  %16 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %15, %16
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next151.1 = add nsw i64 %indvars.iv150, 2
  %arrayidx79.us.us.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv158, i64 %indvars.iv.next151.1
  %17 = load double, double* %arrayidx79.us.us.2, align 8
  %arrayidx83.us.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next151.1, i64 %indvars.iv154
  %18 = load double, double* %arrayidx83.us.us.2, align 8
  %mul84.us.us.2 = fmul double %17, %18
  %add89.us.us.2 = fadd double %mul84.us.us.2, %add89.us.us.1
  store double %add89.us.us.2, double* %arrayidx72.us.us, align 8
  %indvars.iv.next151.2 = add nsw i64 %indvars.iv150, 3
  %exitcond153.2 = icmp eq i64 %indvars.iv.next151.2, 900
  br i1 %exitcond153.2, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.cond73.for.inc93_crit_edge.us.us.for.cond66.for.inc96_crit_edge.us_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* %G) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ], [ 0, %entry ]
  %3 = mul nsw i64 %indvars.iv12, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 800
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

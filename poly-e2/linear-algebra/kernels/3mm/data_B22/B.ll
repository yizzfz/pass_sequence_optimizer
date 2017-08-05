; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  tail call fastcc void @init_array([1000 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1100 x double]* %3)
  tail call void (...) @polybench_timer_start() #4
  %4 = bitcast i8* %call to [900 x double]*
  %5 = bitcast i8* %call3 to [1100 x double]*
  %6 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %4, [1000 x double]* %0, [900 x double]* %1, [1100 x double]* %5, [1200 x double]* %2, [1100 x double]* %3, [1100 x double]* %6)
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
  tail call fastcc void @print_array([1100 x double]* %6)
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc8, %entry
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %for.inc8 ], [ 0, %entry ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next19, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv32
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 4.000000e+03
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv18
  store double %div, double* %arrayidx7, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond22, label %for.inc8, label %for.inc

for.inc8:                                         ; preds = %for.inc
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next33, 800
  br i1 %exitcond34, label %for.cond15.preheader.preheader, label %for.cond1.preheader

for.cond15.preheader.preheader:                   ; preds = %for.inc8
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc34, %for.cond15.preheader.preheader
  %indvars.iv29 = phi i64 [ 0, %for.cond15.preheader.preheader ], [ %indvars.iv.next30, %for.inc34 ]
  br label %for.inc31

for.inc31:                                        ; preds = %for.inc31, %for.cond15.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next14, %for.inc31 ]
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %3 = mul nuw nsw i64 %indvars.iv.next14, %indvars.iv29
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22 = srem i32 %5, 900
  %conv23 = sitofp i32 %rem22 to double
  %div26 = fdiv double %conv23, 4.500000e+03
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv29, i64 %indvars.iv13
  store double %div26, double* %arrayidx30, align 8
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 900
  br i1 %exitcond17, label %for.inc34, label %for.inc31

for.inc34:                                        ; preds = %for.inc31
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond31, label %for.cond41.preheader.preheader, label %for.cond15.preheader

for.cond41.preheader.preheader:                   ; preds = %for.inc34
  br label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %for.inc59, %for.cond41.preheader.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond41.preheader.preheader ], [ %indvars.iv.next27, %for.inc59 ]
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56, %for.cond41.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond41.preheader ], [ %indvars.iv.next9, %for.inc56 ]
  %6 = add nuw nsw i64 %indvars.iv8, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv26
  %8 = trunc i64 %7 to i32
  %rem47 = srem i32 %8, 1100
  %conv48 = sitofp i32 %rem47 to double
  %div51 = fdiv double %conv48, 5.500000e+03
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv26, i64 %indvars.iv8
  store double %div51, double* %arrayidx55, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond12, label %for.inc59, label %for.inc56

for.inc59:                                        ; preds = %for.inc56
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 900
  br i1 %exitcond28, label %for.cond66.preheader.preheader, label %for.cond41.preheader

for.cond66.preheader.preheader:                   ; preds = %for.inc59
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.inc85, %for.cond66.preheader.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond66.preheader.preheader ], [ %indvars.iv.next24, %for.inc85 ]
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82, %for.cond66.preheader
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next, %for.inc82 ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv23
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73 = srem i32 %12, 1000
  %conv74 = sitofp i32 %rem73 to double
  %div77 = fdiv double %conv74, 5.000000e+03
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv23, i64 %indvars.iv
  store double %div77, double* %arrayidx81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc85, label %for.inc82

for.inc85:                                        ; preds = %for.inc82
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond25, label %for.end87, label %for.cond66.preheader

for.end87:                                        ; preds = %for.inc85
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc24.for.cond1.preheader_crit_edge, %entry
  %indvar15 = phi i64 [ 0, %entry ], [ %indvar.next16, %for.inc24.for.cond1.preheader_crit_edge ]
  %storemerge3 = phi i64 [ 0, %entry ], [ %inc25, %for.inc24.for.cond1.preheader_crit_edge ]
  %sext = shl i64 %storemerge3, 32
  %idxprom = ashr exact i64 %sext, 32
  br label %for.body3

for.body3:                                        ; preds = %for.inc21, %for.cond1.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc21 ], [ 0, %for.cond1.preheader ]
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom, i64 %indvars.iv27
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body3
  %indvars.iv12 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next13.1, %for.inc ]
  %0 = phi double [ 0.000000e+00, %for.body3 ], [ %add.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom, i64 %indvars.iv12
  %1 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv12, i64 %indvars.iv27
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx5, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %arrayidx12.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom, i64 %indvars.iv.next13
  %3 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next13, i64 %indvars.iv27
  %4 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx5, align 8
  %indvars.iv.next13.1 = add nuw nsw i64 %indvars.iv12, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13.1, 1000
  br i1 %exitcond14.1, label %for.inc21, label %for.inc

for.inc21:                                        ; preds = %for.inc
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 900
  br i1 %exitcond29, label %for.inc24, label %for.body3

for.inc24:                                        ; preds = %for.inc21
  %indvar.next16 = add nuw nsw i64 %indvar15, 1
  %exitcond18 = icmp eq i64 %indvar.next16, 800
  br i1 %exitcond18, label %for.cond30.preheader.preheader, label %for.inc24.for.cond1.preheader_crit_edge

for.cond30.preheader.preheader:                   ; preds = %for.inc24
  br label %for.cond30.preheader

for.inc24.for.cond1.preheader_crit_edge:          ; preds = %for.inc24
  %inc25 = add nsw i64 %idxprom, 1
  br label %for.cond1.preheader

for.cond30.preheader:                             ; preds = %for.cond30.preheader.preheader, %for.inc60.for.cond30.preheader_crit_edge
  %indvar8 = phi i64 [ %indvar.next9, %for.inc60.for.cond30.preheader_crit_edge ], [ 0, %for.cond30.preheader.preheader ]
  %storemerge12 = phi i64 [ %inc61, %for.inc60.for.cond30.preheader_crit_edge ], [ 0, %for.cond30.preheader.preheader ]
  %sext19 = shl i64 %storemerge12, 32
  %idxprom33 = ashr exact i64 %sext19, 32
  br label %for.body32

for.body32:                                       ; preds = %for.inc57, %for.cond30.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.inc57 ], [ 0, %for.cond30.preheader ]
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %idxprom33, i64 %indvars.iv24
  store double 0.000000e+00, double* %arrayidx36, align 8
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54, %for.body32
  %indvars.iv5 = phi i64 [ 0, %for.body32 ], [ %indvars.iv.next6.2, %for.inc54 ]
  %5 = phi double [ 0.000000e+00, %for.body32 ], [ %add53.2, %for.inc54 ]
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33, i64 %indvars.iv5
  %6 = load double, double* %arrayidx43, align 8
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv5, i64 %indvars.iv24
  %7 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %6, %7
  %add53 = fadd double %5, %mul48
  store double %add53, double* %arrayidx36, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %arrayidx43.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33, i64 %indvars.iv.next6
  %8 = load double, double* %arrayidx43.1, align 8
  %arrayidx47.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next6, i64 %indvars.iv24
  %9 = load double, double* %arrayidx47.1, align 8
  %mul48.1 = fmul double %8, %9
  %add53.1 = fadd double %add53, %mul48.1
  store double %add53.1, double* %arrayidx36, align 8
  %indvars.iv.next6.1 = add nuw nsw i64 %indvars.iv5, 2
  %arrayidx43.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33, i64 %indvars.iv.next6.1
  %10 = load double, double* %arrayidx43.2, align 8
  %arrayidx47.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next6.1, i64 %indvars.iv24
  %11 = load double, double* %arrayidx47.2, align 8
  %mul48.2 = fmul double %10, %11
  %add53.2 = fadd double %add53.1, %mul48.2
  store double %add53.2, double* %arrayidx36, align 8
  %indvars.iv.next6.2 = add nuw nsw i64 %indvars.iv5, 3
  %exitcond7.2 = icmp eq i64 %indvars.iv.next6.2, 1200
  br i1 %exitcond7.2, label %for.inc57, label %for.inc54

for.inc57:                                        ; preds = %for.inc54
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1100
  br i1 %exitcond26, label %for.inc60, label %for.body32

for.inc60:                                        ; preds = %for.inc57
  %indvar.next9 = add nuw nsw i64 %indvar8, 1
  %exitcond11 = icmp eq i64 %indvar.next9, 900
  br i1 %exitcond11, label %for.cond66.preheader.preheader, label %for.inc60.for.cond30.preheader_crit_edge

for.cond66.preheader.preheader:                   ; preds = %for.inc60
  br label %for.cond66.preheader

for.inc60.for.cond30.preheader_crit_edge:         ; preds = %for.inc60
  %inc61 = add nsw i64 %idxprom33, 1
  br label %for.cond30.preheader

for.cond66.preheader:                             ; preds = %for.cond66.preheader.preheader, %for.inc96.for.cond66.preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc96.for.cond66.preheader_crit_edge ], [ 0, %for.cond66.preheader.preheader ]
  %storemerge21 = phi i64 [ %inc97, %for.inc96.for.cond66.preheader_crit_edge ], [ 0, %for.cond66.preheader.preheader ]
  %sext20 = shl i64 %storemerge21, 32
  %idxprom69 = ashr exact i64 %sext20, 32
  br label %for.body68

for.body68:                                       ; preds = %for.inc93, %for.cond66.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.inc93 ], [ 0, %for.cond66.preheader ]
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %idxprom69, i64 %indvars.iv21
  store double 0.000000e+00, double* %arrayidx72, align 8
  br label %for.inc90

for.inc90:                                        ; preds = %for.inc90, %for.body68
  %indvars.iv = phi i64 [ 0, %for.body68 ], [ %indvars.iv.next.2, %for.inc90 ]
  %12 = phi double [ 0.000000e+00, %for.body68 ], [ %add89.2, %for.inc90 ]
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69, i64 %indvars.iv
  %13 = load double, double* %arrayidx79, align 8
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv21
  %14 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %13, %14
  %add89 = fadd double %12, %mul84
  store double %add89, double* %arrayidx72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.1, align 8
  %arrayidx83.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv21
  %16 = load double, double* %arrayidx83.1, align 8
  %mul84.1 = fmul double %15, %16
  %add89.1 = fadd double %add89, %mul84.1
  store double %add89.1, double* %arrayidx72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx79.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx79.2, align 8
  %arrayidx83.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next.1, i64 %indvars.iv21
  %18 = load double, double* %arrayidx83.2, align 8
  %mul84.2 = fmul double %17, %18
  %add89.2 = fadd double %add89.1, %mul84.2
  store double %add89.2, double* %arrayidx72, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %for.inc93, label %for.inc90

for.inc93:                                        ; preds = %for.inc90
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1100
  br i1 %exitcond23, label %for.inc96, label %for.body68

for.inc96:                                        ; preds = %for.inc93
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 800
  br i1 %exitcond, label %for.end98, label %for.inc96.for.cond66.preheader_crit_edge

for.inc96.for.cond66.preheader_crit_edge:         ; preds = %for.inc96
  %inc97 = add nsw i64 %idxprom69, 1
  br label %for.cond66.preheader

for.end98:                                        ; preds = %for.inc96
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.inc10 ], [ 0, %entry ]
  %3 = mul nuw nsw i64 %indvars.iv3, 800
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
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv3, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond6, label %for.end12, label %for.cond2.preheader

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

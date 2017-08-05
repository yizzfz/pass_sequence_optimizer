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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call void @init_array([1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call void @kernel_3mm([900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call6 to [1100 x double]*
  tail call void @print_array([1100 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
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
define internal void @init_array([1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end.for.cond1.preheader_crit_edge, %entry
  %indvars.iv2838 = phi i64 [ 0, %entry ], [ %indvars.iv.next29, %for.end.for.cond1.preheader_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv2337 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next24, %for.body3.for.body3_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv2337, %indvars.iv2838
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 4.000000e+03
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2838, i64 %indvars.iv2337
  store double %div, double* %arrayidx7, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2337, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond27, label %for.end, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv2838, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 800
  br i1 %exitcond30, label %for.cond15.preheader.preheader, label %for.end.for.cond1.preheader_crit_edge

for.end.for.cond1.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond1.preheader

for.cond15.preheader.preheader:                   ; preds = %for.end
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.end33.for.cond15.preheader_crit_edge, %for.cond15.preheader.preheader
  %indvars.iv2036 = phi i64 [ 0, %for.cond15.preheader.preheader ], [ %indvars.iv.next21, %for.end33.for.cond15.preheader_crit_edge ]
  br label %for.body18

for.body18:                                       ; preds = %for.body18.for.body18_crit_edge, %for.cond15.preheader
  %indvars.iv1535 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next16, %for.body18.for.body18_crit_edge ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1535, 1
  %3 = mul nuw nsw i64 %indvars.iv.next16, %indvars.iv2036
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22 = srem i32 %5, 900
  %conv23 = sitofp i32 %rem22 to double
  %div26 = fdiv double %conv23, 4.500000e+03
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv2036, i64 %indvars.iv1535
  store double %div26, double* %arrayidx30, align 8
  %exitcond19 = icmp eq i64 %indvars.iv.next16, 900
  br i1 %exitcond19, label %for.end33, label %for.body18.for.body18_crit_edge

for.body18.for.body18_crit_edge:                  ; preds = %for.body18
  br label %for.body18

for.end33:                                        ; preds = %for.body18
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2036, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %for.cond41.preheader.preheader, label %for.end33.for.cond15.preheader_crit_edge

for.end33.for.cond15.preheader_crit_edge:         ; preds = %for.end33
  br label %for.cond15.preheader

for.cond41.preheader.preheader:                   ; preds = %for.end33
  br label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %for.end58.for.cond41.preheader_crit_edge, %for.cond41.preheader.preheader
  %indvars.iv1234 = phi i64 [ 0, %for.cond41.preheader.preheader ], [ %indvars.iv.next13, %for.end58.for.cond41.preheader_crit_edge ]
  br label %for.body44

for.body44:                                       ; preds = %for.body44.for.body44_crit_edge, %for.cond41.preheader
  %indvars.iv733 = phi i64 [ 0, %for.cond41.preheader ], [ %indvars.iv.next8, %for.body44.for.body44_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv733, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv1234
  %8 = trunc i64 %7 to i32
  %rem47 = srem i32 %8, 1100
  %conv48 = sitofp i32 %rem47 to double
  %div51 = fdiv double %conv48, 5.500000e+03
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1234, i64 %indvars.iv733
  store double %div51, double* %arrayidx55, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv733, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %for.end58, label %for.body44.for.body44_crit_edge

for.body44.for.body44_crit_edge:                  ; preds = %for.body44
  br label %for.body44

for.end58:                                        ; preds = %for.body44
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1234, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 900
  br i1 %exitcond14, label %for.cond66.preheader.preheader, label %for.end58.for.cond41.preheader_crit_edge

for.end58.for.cond41.preheader_crit_edge:         ; preds = %for.end58
  br label %for.cond41.preheader

for.cond66.preheader.preheader:                   ; preds = %for.end58
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.end84.for.cond66.preheader_crit_edge, %for.cond66.preheader.preheader
  %indvars.iv432 = phi i64 [ 0, %for.cond66.preheader.preheader ], [ %indvars.iv.next5, %for.end84.for.cond66.preheader_crit_edge ]
  br label %for.body69

for.body69:                                       ; preds = %for.body69.for.body69_crit_edge, %for.cond66.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next, %for.body69.for.body69_crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv31, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv432
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73 = srem i32 %12, 1000
  %conv74 = sitofp i32 %rem73 to double
  %div77 = fdiv double %conv74, 5.000000e+03
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv432, i64 %indvars.iv31
  store double %div77, double* %arrayidx81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end84, label %for.body69.for.body69_crit_edge

for.body69.for.body69_crit_edge:                  ; preds = %for.body69
  br label %for.body69

for.end84:                                        ; preds = %for.body69
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv432, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %for.end87, label %for.end84.for.cond66.preheader_crit_edge

for.end84.for.cond66.preheader_crit_edge:         ; preds = %for.end84
  br label %for.cond66.preheader

for.end87:                                        ; preds = %for.end84
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end23.for.cond1.preheader_crit_edge, %entry
  %indvars.iv2233 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end23.for.cond1.preheader_crit_edge ]
  br label %for.body3

for.body3:                                        ; preds = %for.end.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv1932 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.end.for.body3_crit_edge ]
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv2233, i64 %indvars.iv1932
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8.for.body8_crit_edge, %for.body3
  %0 = phi double [ 0.000000e+00, %for.body3 ], [ %add.1, %for.body8.for.body8_crit_edge ]
  %indvars.iv1631 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next17.1, %for.body8.for.body8_crit_edge ]
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2233, i64 %indvars.iv1631
  %1 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1631, i64 %indvars.iv1932
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx5, align 8
  %indvars.iv.next17 = or i64 %indvars.iv1631, 1
  %arrayidx12.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2233, i64 %indvars.iv.next17
  %3 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next17, i64 %indvars.iv1932
  %4 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx5, align 8
  %indvars.iv.next17.1 = add nuw nsw i64 %indvars.iv1631, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next17.1, 1000
  br i1 %exitcond18.1, label %for.end, label %for.body8.for.body8_crit_edge

for.body8.for.body8_crit_edge:                    ; preds = %for.body8
  br label %for.body8

for.end:                                          ; preds = %for.body8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1932, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 900
  br i1 %exitcond21, label %for.end23, label %for.end.for.body3_crit_edge

for.end.for.body3_crit_edge:                      ; preds = %for.end
  br label %for.body3

for.end23:                                        ; preds = %for.end
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2233, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 800
  br i1 %exitcond24, label %for.cond30.preheader.preheader, label %for.end23.for.cond1.preheader_crit_edge

for.end23.for.cond1.preheader_crit_edge:          ; preds = %for.end23
  br label %for.cond1.preheader

for.cond30.preheader.preheader:                   ; preds = %for.end23
  br label %for.cond30.preheader

for.cond30.preheader:                             ; preds = %for.end59.for.cond30.preheader_crit_edge, %for.cond30.preheader.preheader
  %indvars.iv1330 = phi i64 [ 0, %for.cond30.preheader.preheader ], [ %indvars.iv.next14, %for.end59.for.cond30.preheader_crit_edge ]
  br label %for.body32

for.body32:                                       ; preds = %for.end56.for.body32_crit_edge, %for.cond30.preheader
  %indvars.iv1029 = phi i64 [ 0, %for.cond30.preheader ], [ %indvars.iv.next11, %for.end56.for.body32_crit_edge ]
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv1330, i64 %indvars.iv1029
  store double 0.000000e+00, double* %arrayidx36, align 8
  br label %for.body39

for.body39:                                       ; preds = %for.body39.for.body39_crit_edge, %for.body32
  %5 = phi double [ 0.000000e+00, %for.body32 ], [ %add53.2, %for.body39.for.body39_crit_edge ]
  %indvars.iv728 = phi i64 [ 0, %for.body32 ], [ %indvars.iv.next8.2, %for.body39.for.body39_crit_edge ]
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1330, i64 %indvars.iv728
  %6 = load double, double* %arrayidx43, align 8
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv728, i64 %indvars.iv1029
  %7 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %6, %7
  %add53 = fadd double %5, %mul48
  store double %add53, double* %arrayidx36, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv728, 1
  %arrayidx43.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1330, i64 %indvars.iv.next8
  %8 = load double, double* %arrayidx43.1, align 8
  %arrayidx47.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next8, i64 %indvars.iv1029
  %9 = load double, double* %arrayidx47.1, align 8
  %mul48.1 = fmul double %8, %9
  %add53.1 = fadd double %add53, %mul48.1
  store double %add53.1, double* %arrayidx36, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv728, 2
  %arrayidx43.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1330, i64 %indvars.iv.next8.1
  %10 = load double, double* %arrayidx43.2, align 8
  %arrayidx47.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next8.1, i64 %indvars.iv1029
  %11 = load double, double* %arrayidx47.2, align 8
  %mul48.2 = fmul double %10, %11
  %add53.2 = fadd double %add53.1, %mul48.2
  store double %add53.2, double* %arrayidx36, align 8
  %indvars.iv.next8.2 = add nuw nsw i64 %indvars.iv728, 3
  %exitcond9.2 = icmp eq i64 %indvars.iv.next8.2, 1200
  br i1 %exitcond9.2, label %for.end56, label %for.body39.for.body39_crit_edge

for.body39.for.body39_crit_edge:                  ; preds = %for.body39
  br label %for.body39

for.end56:                                        ; preds = %for.body39
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1029, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1100
  br i1 %exitcond12, label %for.end59, label %for.end56.for.body32_crit_edge

for.end56.for.body32_crit_edge:                   ; preds = %for.end56
  br label %for.body32

for.end59:                                        ; preds = %for.end56
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1330, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 900
  br i1 %exitcond15, label %for.cond66.preheader.preheader, label %for.end59.for.cond30.preheader_crit_edge

for.end59.for.cond30.preheader_crit_edge:         ; preds = %for.end59
  br label %for.cond30.preheader

for.cond66.preheader.preheader:                   ; preds = %for.end59
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.end95.for.cond66.preheader_crit_edge, %for.cond66.preheader.preheader
  %indvars.iv427 = phi i64 [ 0, %for.cond66.preheader.preheader ], [ %indvars.iv.next5, %for.end95.for.cond66.preheader_crit_edge ]
  br label %for.body68

for.body68:                                       ; preds = %for.end92.for.body68_crit_edge, %for.cond66.preheader
  %indvars.iv126 = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next2, %for.end92.for.body68_crit_edge ]
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv427, i64 %indvars.iv126
  store double 0.000000e+00, double* %arrayidx72, align 8
  br label %for.body75

for.body75:                                       ; preds = %for.body75.for.body75_crit_edge, %for.body68
  %12 = phi double [ 0.000000e+00, %for.body68 ], [ %add89.2, %for.body75.for.body75_crit_edge ]
  %indvars.iv25 = phi i64 [ 0, %for.body68 ], [ %indvars.iv.next.2, %for.body75.for.body75_crit_edge ]
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv427, i64 %indvars.iv25
  %13 = load double, double* %arrayidx79, align 8
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv25, i64 %indvars.iv126
  %14 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %13, %14
  %add89 = fadd double %12, %mul84
  store double %add89, double* %arrayidx72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv25, 1
  %arrayidx79.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv427, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.1, align 8
  %arrayidx83.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv126
  %16 = load double, double* %arrayidx83.1, align 8
  %mul84.1 = fmul double %15, %16
  %add89.1 = fadd double %add89, %mul84.1
  store double %add89.1, double* %arrayidx72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv25, 2
  %arrayidx79.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv427, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx79.2, align 8
  %arrayidx83.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next.1, i64 %indvars.iv126
  %18 = load double, double* %arrayidx83.2, align 8
  %mul84.2 = fmul double %17, %18
  %add89.2 = fadd double %add89.1, %mul84.2
  store double %add89.2, double* %arrayidx72, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv25, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %for.end92, label %for.body75.for.body75_crit_edge

for.body75.for.body75_crit_edge:                  ; preds = %for.body75
  br label %for.body75

for.end92:                                        ; preds = %for.body75
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv126, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1100
  br i1 %exitcond3, label %for.end95, label %for.end92.for.body68_crit_edge

for.end92.for.body68_crit_edge:                   ; preds = %for.end92
  br label %for.body68

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv427, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %for.end98, label %for.end95.for.cond66.preheader_crit_edge

for.end95.for.cond66.preheader_crit_edge:         ; preds = %for.end95
  br label %for.cond66.preheader

for.end98:                                        ; preds = %for.end95
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly %G) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end.for.cond2.preheader_crit_edge, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv27, 800
  br label %for.body4

for.body4:                                        ; preds = %if.end.for.body4_crit_edge, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end.for.body4_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.body4.if.end_crit_edge

for.body4.if.end_crit_edge:                       ; preds = %for.body4
  br label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv27, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end, label %if.end.for.body4_crit_edge

if.end.for.body4_crit_edge:                       ; preds = %if.end
  br label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 800
  br i1 %exitcond5, label %for.end12, label %for.end.for.cond2.preheader_crit_edge

for.end.for.cond2.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

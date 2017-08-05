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
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array([1100 x double]* %arraydecay16)
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
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %entry, %for.inc8.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.inc8.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond.for.cond1_crit_edge.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc.us ], [ 0, %for.cond.for.cond1_crit_edge.us ]
  %0 = mul nuw nsw i64 %indvars.iv85, %indvars.iv79
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv79
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next80, 1000
  br i1 %exitcond84, label %for.inc8.us, label %for.inc.us

for.inc8.us:                                      ; preds = %for.inc.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, 800
  br i1 %exitcond88, label %for.cond11.for.cond15_crit_edge.us.preheader, label %for.cond.for.cond1_crit_edge.us

for.cond11.for.cond15_crit_edge.us.preheader:     ; preds = %for.inc8.us
  br label %for.cond11.for.cond15_crit_edge.us

for.cond11.for.cond15_crit_edge.us:               ; preds = %for.cond11.for.cond15_crit_edge.us.preheader, %for.inc34.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.inc34.us ], [ 0, %for.cond11.for.cond15_crit_edge.us.preheader ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond11.for.cond15_crit_edge.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc31.us ], [ 0, %for.cond11.for.cond15_crit_edge.us ]
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %3 = mul nuw nsw i64 %indvars.iv74, %indvars.iv.next69
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv74, i64 %indvars.iv68
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond73 = icmp eq i64 %indvars.iv.next69, 900
  br i1 %exitcond73, label %for.inc34.us, label %for.inc31.us

for.inc34.us:                                     ; preds = %for.inc31.us
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 1000
  br i1 %exitcond77, label %for.cond37.for.cond41_crit_edge.us.preheader, label %for.cond11.for.cond15_crit_edge.us

for.cond37.for.cond41_crit_edge.us.preheader:     ; preds = %for.inc34.us
  br label %for.cond37.for.cond41_crit_edge.us

for.cond37.for.cond41_crit_edge.us:               ; preds = %for.cond37.for.cond41_crit_edge.us.preheader, %for.inc59.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc59.us ], [ 0, %for.cond37.for.cond41_crit_edge.us.preheader ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.cond37.for.cond41_crit_edge.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.inc56.us ], [ 0, %for.cond37.for.cond41_crit_edge.us ]
  %6 = add nuw nsw i64 %indvars.iv57, 3
  %7 = mul nuw nsw i64 %indvars.iv63, %6
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv63, i64 %indvars.iv57
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, 1200
  br i1 %exitcond62, label %for.inc59.us, label %for.inc56.us

for.inc59.us:                                     ; preds = %for.inc56.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 900
  br i1 %exitcond66, label %for.cond62.for.cond66_crit_edge.us.preheader, label %for.cond37.for.cond41_crit_edge.us

for.cond62.for.cond66_crit_edge.us.preheader:     ; preds = %for.inc59.us
  br label %for.cond62.for.cond66_crit_edge.us

for.cond62.for.cond66_crit_edge.us:               ; preds = %for.cond62.for.cond66_crit_edge.us.preheader, %for.inc85.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.inc85.us ], [ 0, %for.cond62.for.cond66_crit_edge.us.preheader ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.cond62.for.cond66_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc82.us ], [ 0, %for.cond62.for.cond66_crit_edge.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %indvars.iv52, %9
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv52, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc85.us, label %for.inc82.us

for.inc85.us:                                     ; preds = %for.inc82.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 1200
  br i1 %exitcond55, label %for.end87, label %for.cond62.for.cond66_crit_edge.us

for.end87:                                        ; preds = %for.inc85.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #2 {
entry:
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %for.inc24.us, %entry
  %indvars.iv206 = phi i64 [ 0, %entry ], [ %indvars.iv.next207, %for.inc24.us ]
  br label %for.body3.us.us

for.inc24.us:                                     ; preds = %for.inc21.us.us
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1
  %exitcond209 = icmp eq i64 %indvars.iv.next207, 800
  br i1 %exitcond209, label %for.cond27.for.cond30_crit_edge.us.preheader, label %for.cond.for.cond1_crit_edge.us

for.cond27.for.cond30_crit_edge.us.preheader:     ; preds = %for.inc24.us
  br label %for.cond27.for.cond30_crit_edge.us

for.body3.us.us:                                  ; preds = %for.cond.for.cond1_crit_edge.us, %for.inc21.us.us
  %indvars.iv200 = phi i64 [ %indvars.iv.next201, %for.inc21.us.us ], [ 0, %for.cond.for.cond1_crit_edge.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv206, i64 %indvars.iv200
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.inc21.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next201, 900
  br i1 %exitcond203, label %for.inc24.us, label %for.body3.us.us

for.inc.us.us:                                    ; preds = %for.body3.us.us, %for.inc.us.us
  %indvars.iv193 = phi i64 [ %indvars.iv.next194.1, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %0 = phi double [ %add.us.us.1, %for.inc.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv206, i64 %indvars.iv193
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv193, i64 %indvars.iv200
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %mul.us.us, %0
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next194 = or i64 %indvars.iv193, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv206, i64 %indvars.iv.next194
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next194, i64 %indvars.iv200
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next194.1 = add nsw i64 %indvars.iv193, 2
  %exitcond196.1 = icmp eq i64 %indvars.iv.next194.1, 1000
  br i1 %exitcond196.1, label %for.inc21.us.us, label %for.inc.us.us

for.cond27.for.cond30_crit_edge.us:               ; preds = %for.cond27.for.cond30_crit_edge.us.preheader, %for.inc60.us
  %indvars.iv182 = phi i64 [ %indvars.iv.next183, %for.inc60.us ], [ 0, %for.cond27.for.cond30_crit_edge.us.preheader ]
  br label %for.body32.us.us

for.inc60.us:                                     ; preds = %for.inc57.us.us
  %indvars.iv.next183 = add nuw nsw i64 %indvars.iv182, 1
  %exitcond185 = icmp eq i64 %indvars.iv.next183, 900
  br i1 %exitcond185, label %for.cond63.for.cond66_crit_edge.us.preheader, label %for.cond27.for.cond30_crit_edge.us

for.cond63.for.cond66_crit_edge.us.preheader:     ; preds = %for.inc60.us
  br label %for.cond63.for.cond66_crit_edge.us

for.body32.us.us:                                 ; preds = %for.cond27.for.cond30_crit_edge.us, %for.inc57.us.us
  %indvars.iv176 = phi i64 [ %indvars.iv.next177, %for.inc57.us.us ], [ 0, %for.cond27.for.cond30_crit_edge.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv182, i64 %indvars.iv176
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.inc57.us.us:                                  ; preds = %for.inc54.us.us
  %indvars.iv.next177 = add nuw nsw i64 %indvars.iv176, 1
  %exitcond179 = icmp eq i64 %indvars.iv.next177, 1100
  br i1 %exitcond179, label %for.inc60.us, label %for.body32.us.us

for.inc54.us.us:                                  ; preds = %for.body32.us.us, %for.inc54.us.us
  %indvars.iv169 = phi i64 [ %indvars.iv.next170.1, %for.inc54.us.us ], [ 0, %for.body32.us.us ]
  %5 = phi double [ %add53.us.us.1, %for.inc54.us.us ], [ 0.000000e+00, %for.body32.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv182, i64 %indvars.iv169
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv169, i64 %indvars.iv176
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %mul48.us.us, %5
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next170 = or i64 %indvars.iv169, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv182, i64 %indvars.iv.next170
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next170, i64 %indvars.iv176
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next170.1 = add nsw i64 %indvars.iv169, 2
  %exitcond172.1 = icmp eq i64 %indvars.iv.next170.1, 1200
  br i1 %exitcond172.1, label %for.inc57.us.us, label %for.inc54.us.us

for.cond63.for.cond66_crit_edge.us:               ; preds = %for.cond63.for.cond66_crit_edge.us.preheader, %for.inc96.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %for.inc96.us ], [ 0, %for.cond63.for.cond66_crit_edge.us.preheader ]
  br label %for.body68.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 800
  br i1 %exitcond161, label %for.end98, label %for.cond63.for.cond66_crit_edge.us

for.body68.us.us:                                 ; preds = %for.cond63.for.cond66_crit_edge.us, %for.inc93.us.us
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %for.inc93.us.us ], [ 0, %for.cond63.for.cond66_crit_edge.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv158, i64 %indvars.iv153
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.inc93.us.us:                                  ; preds = %for.inc90.us.us
  %indvars.iv.next154 = add nuw nsw i64 %indvars.iv153, 1
  %exitcond = icmp eq i64 %indvars.iv.next154, 1100
  br i1 %exitcond, label %for.inc96.us, label %for.body68.us.us

for.inc90.us.us:                                  ; preds = %for.body68.us.us, %for.inc90.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc90.us.us ], [ 0, %for.body68.us.us ]
  %10 = phi double [ %add89.us.us.1, %for.inc90.us.us ], [ 0.000000e+00, %for.body68.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv158, i64 %indvars.iv
  %11 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv153
  %12 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %11, %12
  %add89.us.us = fadd double %mul84.us.us, %10
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv158, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv153
  %14 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %13, %14
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %for.inc93.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.inc96.us
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond.for.cond2_crit_edge.us

for.cond.for.cond2_crit_edge.us:                  ; preds = %for.inc10.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10.us ]
  %3 = mul nsw i64 %indvars.iv11, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond.for.cond2_crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond.for.cond2_crit_edge.us ]
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, 800
  br i1 %exitcond15, label %for.end12, label %for.cond.for.cond2_crit_edge.us

for.end12:                                        ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

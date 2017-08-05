; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #3
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call6 to [1100 x double]*
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  tail call void @free(i8* %call4) #3
  tail call void @free(i8* %call5) #3
  tail call void @free(i8* %call6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc8_crit_edge.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.cond1.for.inc8_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv96 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next97, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv96, %indvars.iv102
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv102, i64 %indvars.iv96
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next97, 1000
  br i1 %exitcond101, label %for.cond1.for.inc8_crit_edge.us, label %for.inc.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 800
  br i1 %exitcond105, label %for.cond15.preheader.us.preheader, label %for.cond1.preheader.us

for.cond15.preheader.us.preheader:                ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.preheader.us.preheader, %for.cond15.for.inc34_crit_edge.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.cond15.preheader.us.preheader ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond15.preheader.us
  %indvars.iv85 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next86, %for.inc31.us ]
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %3 = mul nuw nsw i64 %indvars.iv.next86, %indvars.iv91
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv91, i64 %indvars.iv85
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond90 = icmp eq i64 %indvars.iv.next86, 900
  br i1 %exitcond90, label %for.cond15.for.inc34_crit_edge.us, label %for.inc31.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 1000
  br i1 %exitcond94, label %for.cond41.preheader.us.preheader, label %for.cond15.preheader.us

for.cond41.preheader.us.preheader:                ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.preheader.us.preheader, %for.cond41.for.inc59_crit_edge.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for.cond41.for.inc59_crit_edge.us ], [ 0, %for.cond41.preheader.us.preheader ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.cond41.preheader.us
  %indvars.iv74 = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next75, %for.inc56.us ]
  %6 = add nuw nsw i64 %indvars.iv74, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv80
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv80, i64 %indvars.iv74
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond79, label %for.cond41.for.inc59_crit_edge.us, label %for.inc56.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.inc56.us
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond83, label %for.cond66.preheader.us.preheader, label %for.cond41.preheader.us

for.cond66.preheader.us.preheader:                ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond66.for.inc85_crit_edge.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond66.for.inc85_crit_edge.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next, %for.inc82.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv69
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.inc82.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.inc82.us
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond72, label %for.end87, label %for.cond66.preheader.us

for.end87:                                        ; preds = %for.cond66.for.inc85_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc24_crit_edge.us, %entry
  %indvars.iv200 = phi i64 [ 0, %entry ], [ %indvars.iv.next201, %for.cond1.for.inc24_crit_edge.us ]
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next201, 800
  br i1 %exitcond203, label %for.cond30.preheader.us.preheader, label %for.cond1.preheader.us

for.cond30.preheader.us.preheader:                ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.cond30.preheader.us

for.body3.us.us:                                  ; preds = %for.cond1.preheader.us, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv194 = phi i64 [ %indvars.iv.next195, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv200, i64 %indvars.iv194
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next195 = add nuw nsw i64 %indvars.iv194, 1
  %exitcond197 = icmp eq i64 %indvars.iv.next195, 900
  br i1 %exitcond197, label %for.cond1.for.inc24_crit_edge.us, label %for.body3.us.us

for.inc.us.us:                                    ; preds = %for.body3.us.us, %for.inc.us.us
  %0 = phi double [ %add.us.us.1, %for.inc.us.us ], [ 0.000000e+00, %for.body3.us.us ]
  %indvars.iv188 = phi i64 [ %indvars.iv.next189.1, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv200, i64 %indvars.iv188
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv188, i64 %indvars.iv194
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %0, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next189 = or i64 %indvars.iv188, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv200, i64 %indvars.iv.next189
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next189, i64 %indvars.iv194
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next189.1 = add nsw i64 %indvars.iv188, 2
  %exitcond191.1 = icmp eq i64 %indvars.iv.next189.1, 1000
  br i1 %exitcond191.1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.inc.us.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.inc60_crit_edge.us
  %indvars.iv177 = phi i64 [ %indvars.iv.next178, %for.cond30.for.inc60_crit_edge.us ], [ 0, %for.cond30.preheader.us.preheader ]
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv.next178 = add nuw nsw i64 %indvars.iv177, 1
  %exitcond180 = icmp eq i64 %indvars.iv.next178, 900
  br i1 %exitcond180, label %for.cond66.preheader.us.preheader, label %for.cond30.preheader.us

for.cond66.preheader.us.preheader:                ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.cond66.preheader.us

for.body32.us.us:                                 ; preds = %for.cond30.preheader.us, %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.cond30.preheader.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv177, i64 %indvars.iv171
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.inc54.us.us
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 1100
  br i1 %exitcond174, label %for.cond30.for.inc60_crit_edge.us, label %for.body32.us.us

for.inc54.us.us:                                  ; preds = %for.body32.us.us, %for.inc54.us.us
  %5 = phi double [ %add53.us.us.1, %for.inc54.us.us ], [ 0.000000e+00, %for.body32.us.us ]
  %indvars.iv165 = phi i64 [ %indvars.iv.next166.1, %for.inc54.us.us ], [ 0, %for.body32.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv177, i64 %indvars.iv165
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv165, i64 %indvars.iv171
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %5, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next166 = or i64 %indvars.iv165, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv177, i64 %indvars.iv.next166
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next166, i64 %indvars.iv171
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %add53.us.us, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next166.1 = add nsw i64 %indvars.iv165, 2
  %exitcond168.1 = icmp eq i64 %indvars.iv.next166.1, 1200
  br i1 %exitcond168.1, label %for.cond37.for.inc57_crit_edge.us.us, label %for.inc54.us.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond66.for.inc96_crit_edge.us
  %indvars.iv154 = phi i64 [ %indvars.iv.next155, %for.cond66.for.inc96_crit_edge.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next155 = add nuw nsw i64 %indvars.iv154, 1
  %exitcond157 = icmp eq i64 %indvars.iv.next155, 800
  br i1 %exitcond157, label %for.end98, label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.cond66.preheader.us, %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.cond66.preheader.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv154, i64 %indvars.iv149
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.inc90.us.us
  %indvars.iv.next150 = add nuw nsw i64 %indvars.iv149, 1
  %exitcond = icmp eq i64 %indvars.iv.next150, 1100
  br i1 %exitcond, label %for.cond66.for.inc96_crit_edge.us, label %for.body68.us.us

for.inc90.us.us:                                  ; preds = %for.body68.us.us, %for.inc90.us.us
  %10 = phi double [ %add89.us.us.1, %for.inc90.us.us ], [ 0.000000e+00, %for.body68.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc90.us.us ], [ 0, %for.body68.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv154, i64 %indvars.iv
  %11 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv149
  %12 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %11, %12
  %add89.us.us = fadd double %10, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv154, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv149
  %14 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %13, %14
  %add89.us.us.1 = fadd double %add89.us.us, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.cond66.for.inc96_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv14, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

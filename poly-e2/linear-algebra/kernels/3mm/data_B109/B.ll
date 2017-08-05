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
  %arraydecay1 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay72 = bitcast i8* %call2 to [900 x double]*
  %arraydecay83 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay94 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay1, [900 x double]* %arraydecay72, [1200 x double]* %arraydecay83, [1100 x double]* %arraydecay94)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay105 = bitcast i8* %call to [900 x double]*
  %arraydecay138 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay1611 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay105, [1000 x double]* %arraydecay1, [900 x double]* %arraydecay72, [1100 x double]* %arraydecay138, [1200 x double]* %arraydecay83, [1100 x double]* %arraydecay94, [1100 x double]* %arraydecay1611)
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %arraydecay1611)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.inc8.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %for.inc8.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv91 = phi i64 [ %indvars.iv.next92, %for.inc.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nuw nsw i64 %indvars.iv91, %indvars.iv97
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv97, i64 %indvars.iv91
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next92, 1000
  br i1 %exitcond96, label %for.inc8.us, label %for.inc.us

for.inc8.us:                                      ; preds = %for.inc.us
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 800
  br i1 %exitcond100, label %for.cond15.preheader.us.preheader, label %for.cond1.preheader.us

for.cond15.preheader.us.preheader:                ; preds = %for.inc8.us
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.preheader.us.preheader, %for.inc34.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc34.us ], [ 0, %for.cond15.preheader.us.preheader ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond15.preheader.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for.inc31.us ], [ 0, %for.cond15.preheader.us ]
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %3 = mul nuw nsw i64 %indvars.iv.next81, %indvars.iv86
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv86, i64 %indvars.iv80
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond85 = icmp eq i64 %indvars.iv.next81, 900
  br i1 %exitcond85, label %for.inc34.us, label %for.inc31.us

for.inc34.us:                                     ; preds = %for.inc31.us
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, 1000
  br i1 %exitcond89, label %for.cond41.preheader.us.preheader, label %for.cond15.preheader.us

for.cond41.preheader.us.preheader:                ; preds = %for.inc34.us
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.preheader.us.preheader, %for.inc59.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc59.us ], [ 0, %for.cond41.preheader.us.preheader ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.cond41.preheader.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.inc56.us ], [ 0, %for.cond41.preheader.us ]
  %6 = add nuw nsw i64 %indvars.iv69, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv75
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv75, i64 %indvars.iv69
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond74, label %for.inc59.us, label %for.inc56.us

for.inc59.us:                                     ; preds = %for.inc56.us
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 900
  br i1 %exitcond78, label %for.cond66.preheader.us.preheader, label %for.cond41.preheader.us

for.cond66.preheader.us.preheader:                ; preds = %for.inc59.us
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.inc85.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc85.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc82.us ], [ 0, %for.cond66.preheader.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv64
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv64, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc85.us, label %for.inc82.us

for.inc85.us:                                     ; preds = %for.inc82.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond67, label %for.end87, label %for.cond66.preheader.us

for.end87:                                        ; preds = %for.inc85.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc24.us, %entry
  %indvars.iv181 = phi i64 [ 0, %entry ], [ %indvars.iv.next182, %for.inc24.us ]
  br label %for.body3.us.us

for.inc24.us:                                     ; preds = %for.inc21.us.us
  %indvars.iv.next182 = add nuw nsw i64 %indvars.iv181, 1
  %exitcond184 = icmp eq i64 %indvars.iv.next182, 800
  br i1 %exitcond184, label %for.cond30.preheader.us.preheader, label %for.cond1.preheader.us

for.cond30.preheader.us.preheader:                ; preds = %for.inc24.us
  br label %for.cond30.preheader.us

for.body3.us.us:                                  ; preds = %for.cond1.preheader.us, %for.inc21.us.us
  %indvars.iv175 = phi i64 [ %indvars.iv.next176, %for.inc21.us.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv181, i64 %indvars.iv175
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.inc21.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next176 = add nuw nsw i64 %indvars.iv175, 1
  %exitcond178 = icmp eq i64 %indvars.iv.next176, 900
  br i1 %exitcond178, label %for.inc24.us, label %for.body3.us.us

for.inc.us.us:                                    ; preds = %for.body3.us.us, %for.inc.us.us
  %indvars.iv169 = phi i64 [ %indvars.iv.next170.1, %for.inc.us.us ], [ 0, %for.body3.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv181, i64 %indvars.iv169
  %0 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv169, i64 %indvars.iv175
  %1 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %0, %1
  %2 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us = fadd double %2, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next170 = or i64 %indvars.iv169, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv181, i64 %indvars.iv.next170
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next170, i64 %indvars.iv175
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %5 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us.1 = fadd double %5, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next170.1 = add nuw nsw i64 %indvars.iv169, 2
  %exitcond172.1 = icmp eq i64 %indvars.iv.next170.1, 1000
  br i1 %exitcond172.1, label %for.inc21.us.us, label %for.inc.us.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us.preheader, %for.inc60.us
  %indvars.iv158 = phi i64 [ %indvars.iv.next159, %for.inc60.us ], [ 0, %for.cond30.preheader.us.preheader ]
  br label %for.body32.us.us

for.inc60.us:                                     ; preds = %for.inc57.us.us
  %indvars.iv.next159 = add nuw nsw i64 %indvars.iv158, 1
  %exitcond161 = icmp eq i64 %indvars.iv.next159, 900
  br i1 %exitcond161, label %for.cond66.preheader.us.preheader, label %for.cond30.preheader.us

for.cond66.preheader.us.preheader:                ; preds = %for.inc60.us
  br label %for.cond66.preheader.us

for.body32.us.us:                                 ; preds = %for.cond30.preheader.us, %for.inc57.us.us
  %indvars.iv152 = phi i64 [ %indvars.iv.next153, %for.inc57.us.us ], [ 0, %for.cond30.preheader.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv158, i64 %indvars.iv152
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.inc57.us.us:                                  ; preds = %for.inc54.us.us
  %indvars.iv.next153 = add nuw nsw i64 %indvars.iv152, 1
  %exitcond155 = icmp eq i64 %indvars.iv.next153, 1100
  br i1 %exitcond155, label %for.inc60.us, label %for.body32.us.us

for.inc54.us.us:                                  ; preds = %for.body32.us.us, %for.inc54.us.us
  %indvars.iv146 = phi i64 [ %indvars.iv.next147.1, %for.inc54.us.us ], [ 0, %for.body32.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv158, i64 %indvars.iv146
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv146, i64 %indvars.iv152
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %8 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us = fadd double %8, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147 = or i64 %indvars.iv146, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv158, i64 %indvars.iv.next147
  %9 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next147, i64 %indvars.iv152
  %10 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %9, %10
  %11 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us.1 = fadd double %11, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147.1 = add nuw nsw i64 %indvars.iv146, 2
  %exitcond149.1 = icmp eq i64 %indvars.iv.next147.1, 1200
  br i1 %exitcond149.1, label %for.inc57.us.us, label %for.inc54.us.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.inc96.us
  %indvars.iv135 = phi i64 [ %indvars.iv.next136, %for.inc96.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.body68.us.us

for.inc96.us:                                     ; preds = %for.inc93.us.us
  %indvars.iv.next136 = add nuw nsw i64 %indvars.iv135, 1
  %exitcond138 = icmp eq i64 %indvars.iv.next136, 800
  br i1 %exitcond138, label %for.end98, label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.cond66.preheader.us, %for.inc93.us.us
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %for.inc93.us.us ], [ 0, %for.cond66.preheader.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv135, i64 %indvars.iv130
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.inc93.us.us:                                  ; preds = %for.inc90.us.us
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond = icmp eq i64 %indvars.iv.next131, 1100
  br i1 %exitcond, label %for.inc96.us, label %for.body68.us.us

for.inc90.us.us:                                  ; preds = %for.body68.us.us, %for.inc90.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc90.us.us ], [ 0, %for.body68.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv135, i64 %indvars.iv
  %12 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv130
  %13 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %12, %13
  %14 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us = fadd double %14, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv135, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv130
  %16 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %15, %16
  %17 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us.1 = fadd double %17, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %for.inc93.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.inc96.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv13, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv13, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond17, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

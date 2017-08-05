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
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  %1 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %1)
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
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) unnamed_addr #2 {
for.body.lr.ph.for.body.us_crit_edge:
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc8_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv63 = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next64, %for.cond1.for.inc8_crit_edge.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv57 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next58, %for.inc.us ]
  %0 = mul nsw i64 %indvars.iv57, %indvars.iv63
  %1 = add nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv57
  store double %div.us, double* %arrayidx7.us, align 8
  %exitcond62 = icmp eq i64 %indvars.iv57, 999
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br i1 %exitcond62, label %for.cond1.for.inc8_crit_edge.us, label %for.inc.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next64 = add i64 %indvars.iv63, 1
  %cmp.us = icmp slt i64 %indvars.iv.next64, 800
  br i1 %cmp.us, label %for.body.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.cond15.for.inc34_crit_edge.us, %for.body14.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.body14.us.preheader ], [ %indvars.iv.next55, %for.cond15.for.inc34_crit_edge.us ]
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body14.us
  %indvars.iv48 = phi i64 [ 0, %for.body14.us ], [ %indvars.iv.next49, %for.inc31.us ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %3 = mul nsw i64 %indvars.iv.next49, %indvars.iv54
  %4 = add nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond53 = icmp eq i64 %indvars.iv48, 899
  br i1 %exitcond53, label %for.cond15.for.inc34_crit_edge.us, label %for.inc31.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next55 = add i64 %indvars.iv54, 1
  %cmp12.us = icmp slt i64 %indvars.iv.next55, 1000
  br i1 %cmp12.us, label %for.body14.us, label %for.body40.us.preheader

for.body40.us.preheader:                          ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.body40.us

for.body40.us:                                    ; preds = %for.cond41.for.inc59_crit_edge.us, %for.body40.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.body40.us.preheader ], [ %indvars.iv.next46, %for.cond41.for.inc59_crit_edge.us ]
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.body40.us
  %indvars.iv39 = phi i64 [ 0, %for.body40.us ], [ %indvars.iv.next40, %for.inc56.us ]
  %6 = add nuw nsw i64 %indvars.iv39, 3
  %7 = mul nsw i64 %6, %indvars.iv45
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv45, i64 %indvars.iv39
  store double %div51.us, double* %arrayidx55.us, align 8
  %exitcond44 = icmp eq i64 %indvars.iv39, 1199
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  br i1 %exitcond44, label %for.cond41.for.inc59_crit_edge.us, label %for.inc56.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.inc56.us
  %indvars.iv.next46 = add i64 %indvars.iv45, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next46, 900
  br i1 %cmp38.us, label %for.body40.us, label %for.body65.us.preheader

for.body65.us.preheader:                          ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.body65.us

for.body65.us:                                    ; preds = %for.cond66.for.inc85_crit_edge.us, %for.body65.us.preheader
  %indvars.iv37 = phi i64 [ 0, %for.body65.us.preheader ], [ %indvars.iv.next38, %for.cond66.for.inc85_crit_edge.us ]
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.body65.us
  %indvars.iv = phi i64 [ 0, %for.body65.us ], [ %indvars.iv.next, %for.inc82.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nsw i64 %9, %indvars.iv37
  %11 = add nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv37, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.inc82.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.inc82.us
  %indvars.iv.next38 = add i64 %indvars.iv37, 1
  %cmp63.us = icmp slt i64 %indvars.iv.next38, 1200
  br i1 %cmp63.us, label %for.body65.us, label %for.end87

for.end87:                                        ; preds = %for.cond66.for.inc85_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #0 {
for.body.lr.ph.for.body.us_crit_edge:
  br label %for.body3.us.us.preheader

for.body3.us.us.preheader:                        ; preds = %for.cond1.for.inc24_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv169 = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next170, %for.cond1.for.inc24_crit_edge.us ]
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv.next170 = add i64 %indvars.iv169, 1
  %cmp.us = icmp slt i64 %indvars.iv.next170, 800
  br i1 %cmp.us, label %for.body3.us.us.preheader, label %for.body32.us.us.preheader.preheader

for.body32.us.us.preheader.preheader:             ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.body32.us.us.preheader

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.body3.us.us.preheader
  %indvars.iv167 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next168, %for.cond6.for.inc21_crit_edge.us.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv169, i64 %indvars.iv167
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next168 = add nuw i64 %indvars.iv167, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next168, 900
  br i1 %cmp2.us.us, label %for.body3.us.us, label %for.cond1.for.inc24_crit_edge.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body3.us.us
  %0 = phi double [ 0.000000e+00, %for.body3.us.us ], [ %add.us.us.1, %for.inc.us.us ]
  %indvars.iv163 = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next164.1, %for.inc.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv169, i64 %indvars.iv163
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv163, i64 %indvars.iv167
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %mul.us.us, %0
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next164 = or i64 %indvars.iv163, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv169, i64 %indvars.iv.next164
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next164, i64 %indvars.iv167
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %exitcond166.1 = icmp eq i64 %indvars.iv.next164, 999
  %indvars.iv.next164.1 = add nuw nsw i64 %indvars.iv163, 2
  br i1 %exitcond166.1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.inc.us.us

for.body32.us.us.preheader:                       ; preds = %for.cond30.for.inc60_crit_edge.us, %for.body32.us.us.preheader.preheader
  %indvars.iv152 = phi i64 [ 0, %for.body32.us.us.preheader.preheader ], [ %indvars.iv.next153, %for.cond30.for.inc60_crit_edge.us ]
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv.next153 = add i64 %indvars.iv152, 1
  %cmp28.us = icmp slt i64 %indvars.iv.next153, 900
  br i1 %cmp28.us, label %for.body32.us.us.preheader, label %for.body68.us.us.preheader.preheader

for.body68.us.us.preheader.preheader:             ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.body68.us.us.preheader

for.body32.us.us:                                 ; preds = %for.cond37.for.inc57_crit_edge.us.us, %for.body32.us.us.preheader
  %indvars.iv150 = phi i64 [ 0, %for.body32.us.us.preheader ], [ %indvars.iv.next151, %for.cond37.for.inc57_crit_edge.us.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv152, i64 %indvars.iv150
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.inc54.us.us
  %indvars.iv.next151 = add nuw i64 %indvars.iv150, 1
  %cmp31.us.us = icmp slt i64 %indvars.iv.next151, 1100
  br i1 %cmp31.us.us, label %for.body32.us.us, label %for.cond30.for.inc60_crit_edge.us

for.inc54.us.us:                                  ; preds = %for.inc54.us.us, %for.body32.us.us
  %5 = phi double [ 0.000000e+00, %for.body32.us.us ], [ %add53.us.us.2, %for.inc54.us.us ]
  %indvars.iv146 = phi i64 [ 0, %for.body32.us.us ], [ %indvars.iv.next147.2, %for.inc54.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv152, i64 %indvars.iv146
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv146, i64 %indvars.iv150
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %mul48.us.us, %5
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv152, i64 %indvars.iv.next147
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next147, i64 %indvars.iv150
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next147.1 = add nuw nsw i64 %indvars.iv146, 2
  %arrayidx43.us.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv152, i64 %indvars.iv.next147.1
  %10 = load double, double* %arrayidx43.us.us.2, align 8
  %arrayidx47.us.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next147.1, i64 %indvars.iv150
  %11 = load double, double* %arrayidx47.us.us.2, align 8
  %mul48.us.us.2 = fmul double %10, %11
  %add53.us.us.2 = fadd double %mul48.us.us.2, %add53.us.us.1
  store double %add53.us.us.2, double* %arrayidx36.us.us, align 8
  %exitcond149.2 = icmp eq i64 %indvars.iv.next147.1, 1199
  %indvars.iv.next147.2 = add nuw nsw i64 %indvars.iv146, 3
  br i1 %exitcond149.2, label %for.cond37.for.inc57_crit_edge.us.us, label %for.inc54.us.us

for.body68.us.us.preheader:                       ; preds = %for.cond66.for.inc96_crit_edge.us, %for.body68.us.us.preheader.preheader
  %indvars.iv136 = phi i64 [ 0, %for.body68.us.us.preheader.preheader ], [ %indvars.iv.next137, %for.cond66.for.inc96_crit_edge.us ]
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv.next137 = add i64 %indvars.iv136, 1
  %cmp64.us = icmp slt i64 %indvars.iv.next137, 800
  br i1 %cmp64.us, label %for.body68.us.us.preheader, label %for.end98

for.body68.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.body68.us.us.preheader
  %indvars.iv134 = phi i64 [ 0, %for.body68.us.us.preheader ], [ %indvars.iv.next135, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv136, i64 %indvars.iv134
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.inc90.us.us
  %indvars.iv.next135 = add nuw i64 %indvars.iv134, 1
  %cmp67.us.us = icmp slt i64 %indvars.iv.next135, 1100
  br i1 %cmp67.us.us, label %for.body68.us.us, label %for.cond66.for.inc96_crit_edge.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.body68.us.us
  %12 = phi double [ 0.000000e+00, %for.body68.us.us ], [ %add89.us.us.2, %for.inc90.us.us ]
  %indvars.iv = phi i64 [ 0, %for.body68.us.us ], [ %indvars.iv.next.2, %for.inc90.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv136, i64 %indvars.iv
  %13 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv134
  %14 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %13, %14
  %add89.us.us = fadd double %mul84.us.us, %12
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv136, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv134
  %16 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %15, %16
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx79.us.us.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv136, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx79.us.us.2, align 8
  %arrayidx83.us.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next.1, i64 %indvars.iv134
  %18 = load double, double* %arrayidx83.us.us.2, align 8
  %mul84.us.us.2 = fmul double %17, %18
  %add89.us.us.2 = fadd double %mul84.us.us.2, %add89.us.us.1
  store double %add89.us.us.2, double* %arrayidx72.us.us, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 899
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.cond66.for.inc96_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) unnamed_addr #0 {
for.body.lr.ph.for.body.us_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.lr.ph.for.body.us_crit_edge
  %indvars.iv9 = phi i64 [ 0, %for.body.lr.ph.for.body.us_crit_edge ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv9, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, 1100
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10 = add i64 %indvars.iv9, 1
  %cmp.us = icmp slt i64 %indvars.iv.next10, 800
  br i1 %cmp.us, label %for.body.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

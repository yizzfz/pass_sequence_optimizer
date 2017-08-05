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
  %0 = bitcast i8* %call1 to [1000 x double]*
  %1 = bitcast i8* %call2 to [900 x double]*
  %2 = bitcast i8* %call4 to [1200 x double]*
  %3 = bitcast i8* %call5 to [1100 x double]*
  tail call void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1100 x double]* %3)
  tail call void (...) @polybench_timer_start() #4
  %4 = bitcast i8* %call to [900 x double]*
  %5 = bitcast i8* %call3 to [1100 x double]*
  %6 = bitcast i8* %call6 to [1100 x double]*
  tail call void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %4, [1000 x double]* %0, [900 x double]* %1, [1100 x double]* %5, [1200 x double]* %2, [1100 x double]* %3, [1100 x double]* %6)
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
  tail call void @print_array(i32 800, i32 1100, [1100 x double]* %8)
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
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %entry
  %indvars.iv64 = phi i64 [ 0, %entry ], [ %indvars.iv.next65, %for.cond1.for.inc8_crit_edge.us ]
  %0 = trunc i64 %indvars.iv64 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv1733.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next18.us, %for.inc.us ]
  %1 = trunc i64 %indvars.iv1733.us to i32
  %mul.us = mul nsw i32 %0, %1
  %add.us = add nsw i32 %mul.us, 1
  %rem.us = srem i32 %add.us, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv1733.us
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1733.us, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next18.us, 1000
  br i1 %exitcond63, label %for.cond1.for.inc8_crit_edge.us, label %for.inc.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 800
  br i1 %exitcond67, label %for.cond15.preheader.us.preheader, label %for.cond1.preheader.us

for.cond15.preheader.us.preheader:                ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.for.inc34_crit_edge.us, %for.cond15.preheader.us.preheader
  %indvars.iv58 = phi i64 [ 0, %for.cond15.preheader.us.preheader ], [ %indvars.iv.next59, %for.cond15.for.inc34_crit_edge.us ]
  %2 = trunc i64 %indvars.iv58 to i32
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.cond15.preheader.us
  %indvars.iv1528.us = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next16.us, %for.inc31.us ]
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1528.us, 1
  %3 = trunc i64 %indvars.iv.next16.us to i32
  %mul20.us = mul nsw i32 %2, %3
  %add21.us = add nsw i32 %mul20.us, 2
  %rem22.us = srem i32 %add21.us, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv58, i64 %indvars.iv1528.us
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond57 = icmp eq i64 %indvars.iv.next16.us, 900
  br i1 %exitcond57, label %for.cond15.for.inc34_crit_edge.us, label %for.inc31.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.inc31.us
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, 1000
  br i1 %exitcond61, label %for.cond41.preheader.us.preheader, label %for.cond15.preheader.us

for.cond41.preheader.us.preheader:                ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.for.inc59_crit_edge.us, %for.cond41.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 0, %for.cond41.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond41.for.inc59_crit_edge.us ]
  %4 = trunc i64 %indvars.iv52 to i32
  br label %for.inc56.us

for.inc56.us:                                     ; preds = %for.inc56.us, %for.cond41.preheader.us
  %indvars.iv1223.us = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next13.us, %for.inc56.us ]
  %5 = add nuw nsw i64 %indvars.iv1223.us, 3
  %6 = trunc i64 %5 to i32
  %mul46.us = mul nsw i32 %4, %6
  %rem47.us = srem i32 %mul46.us, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv52, i64 %indvars.iv1223.us
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1223.us, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next13.us, 1200
  br i1 %exitcond51, label %for.cond41.for.inc59_crit_edge.us, label %for.inc56.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.inc56.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 900
  br i1 %exitcond55, label %for.cond66.preheader.us.preheader, label %for.cond41.preheader.us

for.cond66.preheader.us.preheader:                ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc85_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next, %for.cond66.for.inc85_crit_edge.us ]
  %7 = trunc i64 %indvars.iv to i32
  br label %for.inc82.us

for.inc82.us:                                     ; preds = %for.inc82.us, %for.cond66.preheader.us
  %indvars.iv20.us = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next.us, %for.inc82.us ]
  %8 = add nuw nsw i64 %indvars.iv20.us, 2
  %9 = trunc i64 %8 to i32
  %mul71.us = mul nsw i32 %7, %9
  %add72.us = add nsw i32 %mul71.us, 2
  %rem73.us = srem i32 %add72.us, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv, i64 %indvars.iv20.us
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv20.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1100
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.inc82.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.inc82.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond49, label %for.end87, label %for.cond66.preheader.us

for.end87:                                        ; preds = %for.cond66.for.inc85_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc24_crit_edge.us.for.cond1.preheader.us_crit_edge, %entry
  %indvar189 = phi i64 [ 0, %entry ], [ %indvar.next190, %for.cond1.for.inc24_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %inc25107.us = phi i64 [ 0, %entry ], [ %inc25.us, %for.cond1.for.inc24_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %sext204 = shl i64 %inc25107.us, 32
  %idxprom.us = ashr exact i64 %sext204, 32
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvar.next190 = add nuw nsw i64 %indvar189, 1
  %exitcond201 = icmp eq i64 %indvar.next190, 800
  br i1 %exitcond201, label %for.cond30.preheader.us.preheader, label %for.cond1.for.inc24_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond30.preheader.us.preheader:                ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.cond30.preheader.us

for.cond1.for.inc24_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc24_crit_edge.us
  %inc25.us = add nsw i64 %idxprom.us, 1
  br label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv211 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next212, %for.cond6.for.inc21_crit_edge.us.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom.us, i64 %indvars.iv211
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.inc.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next212 = add nuw i64 %indvars.iv211, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next212, 900
  br i1 %cmp2.us.us, label %for.body3.us.us, label %for.cond1.for.inc24_crit_edge.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body3.us.us
  %indvars.iv193 = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next194.1, %for.inc.us.us ]
  %0 = phi double [ 0.000000e+00, %for.body3.us.us ], [ %add.us.us.1, %for.inc.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv193
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv193, i64 %indvars.iv211
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %mul.us.us, %0
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next194 = or i64 %indvars.iv193, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv.next194
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next194, i64 %indvars.iv211
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next194.1 = add nuw nsw i64 %indvars.iv193, 2
  %exitcond196.1 = icmp eq i64 %indvars.iv.next194.1, 1000
  br i1 %exitcond196.1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.inc.us.us

for.cond30.preheader.us:                          ; preds = %for.cond30.preheader.us.preheader, %for.cond30.for.inc60_crit_edge.us.for.cond30.preheader.us_crit_edge
  %indvar171 = phi i64 [ %indvar.next172, %for.cond30.for.inc60_crit_edge.us.for.cond30.preheader.us_crit_edge ], [ 0, %for.cond30.preheader.us.preheader ]
  %inc6162.us = phi i64 [ %inc61.us, %for.cond30.for.inc60_crit_edge.us.for.cond30.preheader.us_crit_edge ], [ 0, %for.cond30.preheader.us.preheader ]
  %sext203 = shl i64 %inc6162.us, 32
  %idxprom33.us = ashr exact i64 %sext203, 32
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %indvar.next172 = add nuw nsw i64 %indvar171, 1
  %exitcond183 = icmp eq i64 %indvar.next172, 900
  br i1 %exitcond183, label %for.cond66.preheader.us.preheader, label %for.cond30.for.inc60_crit_edge.us.for.cond30.preheader.us_crit_edge

for.cond66.preheader.us.preheader:                ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.cond66.preheader.us

for.cond30.for.inc60_crit_edge.us.for.cond30.preheader.us_crit_edge: ; preds = %for.cond30.for.inc60_crit_edge.us
  %inc61.us = add nsw i64 %idxprom33.us, 1
  br label %for.cond30.preheader.us

for.body32.us.us:                                 ; preds = %for.cond37.for.inc57_crit_edge.us.us, %for.cond30.preheader.us
  %indvars.iv209 = phi i64 [ 0, %for.cond30.preheader.us ], [ %indvars.iv.next210, %for.cond37.for.inc57_crit_edge.us.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %idxprom33.us, i64 %indvars.iv209
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.inc54.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.inc54.us.us
  %indvars.iv.next210 = add nuw i64 %indvars.iv209, 1
  %cmp31.us.us = icmp slt i64 %indvars.iv.next210, 1100
  br i1 %cmp31.us.us, label %for.body32.us.us, label %for.cond30.for.inc60_crit_edge.us

for.inc54.us.us:                                  ; preds = %for.inc54.us.us, %for.body32.us.us
  %indvars.iv175 = phi i64 [ 0, %for.body32.us.us ], [ %indvars.iv.next176.1, %for.inc54.us.us ]
  %5 = phi double [ 0.000000e+00, %for.body32.us.us ], [ %add53.us.us.1, %for.inc54.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33.us, i64 %indvars.iv175
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv175, i64 %indvars.iv209
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %mul48.us.us, %5
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next176 = or i64 %indvars.iv175, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33.us, i64 %indvars.iv.next176
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next176, i64 %indvars.iv209
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next176.1 = add nuw nsw i64 %indvars.iv175, 2
  %exitcond178.1 = icmp eq i64 %indvars.iv.next176.1, 1200
  br i1 %exitcond178.1, label %for.cond37.for.inc57_crit_edge.us.us, label %for.inc54.us.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond66.for.inc96_crit_edge.us.for.cond66.preheader.us_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.cond66.for.inc96_crit_edge.us.for.cond66.preheader.us_crit_edge ], [ 0, %for.cond66.preheader.us.preheader ]
  %inc9718.us = phi i64 [ %inc97.us, %for.cond66.for.inc96_crit_edge.us.for.cond66.preheader.us_crit_edge ], [ 0, %for.cond66.preheader.us.preheader ]
  %sext = shl i64 %inc9718.us, 32
  %idxprom69.us = ashr exact i64 %sext, 32
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 800
  br i1 %exitcond, label %for.end98, label %for.cond66.for.inc96_crit_edge.us.for.cond66.preheader.us_crit_edge

for.cond66.for.inc96_crit_edge.us.for.cond66.preheader.us_crit_edge: ; preds = %for.cond66.for.inc96_crit_edge.us
  %inc97.us = add nsw i64 %idxprom69.us, 1
  br label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond66.preheader.us
  %indvars.iv207 = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next208, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %idxprom69.us, i64 %indvars.iv207
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.inc90.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.inc90.us.us
  %indvars.iv.next208 = add nuw i64 %indvars.iv207, 1
  %cmp67.us.us = icmp slt i64 %indvars.iv.next208, 1100
  br i1 %cmp67.us.us, label %for.body68.us.us, label %for.cond66.for.inc96_crit_edge.us

for.inc90.us.us:                                  ; preds = %for.inc90.us.us, %for.body68.us.us
  %indvars.iv = phi i64 [ 0, %for.body68.us.us ], [ %indvars.iv.next.1, %for.inc90.us.us ]
  %10 = phi double [ 0.000000e+00, %for.body68.us.us ], [ %add89.us.us.1, %for.inc90.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69.us, i64 %indvars.iv
  %11 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv207
  %12 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %11, %12
  %add89.us.us = fadd double %mul84.us.us, %10
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69.us, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv207
  %14 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %13, %14
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %for.cond73.for.inc93_crit_edge.us.us, label %for.inc90.us.us

for.end98:                                        ; preds = %for.cond66.for.inc96_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv14, 800
  %4 = trunc i64 %3 to i32
  %5 = zext i32 %4 to i64
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv14, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %cmp.us = icmp slt i64 %indvars.iv.next15, 800
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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

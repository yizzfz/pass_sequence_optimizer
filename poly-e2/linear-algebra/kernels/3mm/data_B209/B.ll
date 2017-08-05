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
  tail call fastcc void @init_array([1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  tail call fastcc void @print_array([1100 x double]* %1)
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
for.cond1.preheader.us.preheader:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond1.for.inc8_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv57 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next58, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv57, %indvars.iv7
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 4.000000e+03
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv57
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond62, label %for.cond1.for.inc8_crit_edge.us, label %for.body3.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next8 = add nuw i64 %indvars.iv7, 1
  %cmp.us = icmp slt i64 %indvars.iv.next8, 800
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond15.preheader.us.preheader

for.cond15.preheader.us.preheader:                ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.for.inc34_crit_edge.us, %for.cond15.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond15.preheader.us.preheader ], [ %indvars.iv.next6, %for.cond15.for.inc34_crit_edge.us ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.cond15.preheader.us
  %indvars.iv50 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next51, %for.body18.us ]
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %3 = mul nuw nsw i64 %indvars.iv.next51, %indvars.iv5
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, 900
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, 4.500000e+03
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv5, i64 %indvars.iv50
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond55 = icmp eq i64 %indvars.iv.next51, 900
  br i1 %exitcond55, label %for.cond15.for.inc34_crit_edge.us, label %for.body18.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.body18.us
  %indvars.iv.next6 = add nuw i64 %indvars.iv5, 1
  %cmp12.us = icmp slt i64 %indvars.iv.next6, 1000
  br i1 %cmp12.us, label %for.cond15.preheader.us, label %for.cond41.preheader.us.preheader

for.cond41.preheader.us.preheader:                ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.for.inc59_crit_edge.us, %for.cond41.preheader.us.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond41.preheader.us.preheader ], [ %indvars.iv.next4, %for.cond41.for.inc59_crit_edge.us ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us, %for.cond41.preheader.us
  %indvars.iv43 = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next44, %for.body44.us ]
  %6 = add nuw nsw i64 %indvars.iv43, 3
  %7 = mul nsw i64 %6, %indvars.iv3
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, 1100
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, 5.500000e+03
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv3, i64 %indvars.iv43
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond48, label %for.cond41.for.inc59_crit_edge.us, label %for.body44.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.body44.us
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next4, 900
  br i1 %cmp38.us, label %for.cond41.preheader.us, label %for.cond66.preheader.us.preheader

for.cond66.preheader.us.preheader:                ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc85_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next2, %for.cond66.for.inc85_crit_edge.us ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next, %for.body69.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nsw i64 %9, %indvars.iv1
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, 1000
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, 5.000000e+03
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv1, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.body69.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.body69.us
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %cmp63.us = icmp slt i64 %indvars.iv.next2, 1200
  br i1 %cmp63.us, label %for.cond66.preheader.us, label %for.end87

for.end87:                                        ; preds = %for.cond66.for.inc85_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  br label %for.body3.us.us.preheader

for.body3.us.us.preheader:                        ; preds = %for.cond1.for.inc24_crit_edge.us.for.body3.us.us.preheader_crit_edge, %for.cond1.preheader.us.preheader
  %indvar156 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next157, %for.cond1.for.inc24_crit_edge.us.for.body3.us.us.preheader_crit_edge ]
  %storemerge78.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %inc25.us, %for.cond1.for.inc24_crit_edge.us.for.body3.us.us.preheader_crit_edge ]
  %sext176 = shl i64 %storemerge78.us, 32
  %idxprom.us = ashr exact i64 %sext176, 32
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %indvar.next157 = add nuw nsw i64 %indvar156, 1
  %exitcond167 = icmp eq i64 %indvar.next157, 800
  br i1 %exitcond167, label %for.body32.us.us.preheader.preheader, label %for.cond1.for.inc24_crit_edge.us.for.body3.us.us.preheader_crit_edge

for.body32.us.us.preheader.preheader:             ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.body32.us.us.preheader

for.cond1.for.inc24_crit_edge.us.for.body3.us.us.preheader_crit_edge: ; preds = %for.cond1.for.inc24_crit_edge.us
  %inc25.us = add nsw i64 %idxprom.us, 1
  br label %for.body3.us.us.preheader

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.body3.us.us.preheader
  %indvars.iv3 = phi i64 [ 0, %for.body3.us.us.preheader ], [ %indvars.iv.next4, %for.cond6.for.inc21_crit_edge.us.us ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom.us, i64 %indvars.iv3
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body8.us.us
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next4, 900
  br i1 %cmp2.us.us, label %for.body3.us.us, label %for.cond1.for.inc24_crit_edge.us

for.body8.us.us:                                  ; preds = %for.body8.us.us, %for.body3.us.us
  %indvars.iv160 = phi i64 [ 0, %for.body3.us.us ], [ %indvars.iv.next161.1, %for.body8.us.us ]
  %0 = phi double [ 0.000000e+00, %for.body3.us.us ], [ %add.us.us.1, %for.body8.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv160
  %1 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv160, i64 %indvars.iv3
  %2 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %1, %2
  %add.us.us = fadd double %mul.us.us, %0
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next161 = or i64 %indvars.iv160, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %idxprom.us, i64 %indvars.iv.next161
  %3 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next161, i64 %indvars.iv3
  %4 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %4
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next161.1 = add nuw nsw i64 %indvars.iv160, 2
  %exitcond163.1 = icmp eq i64 %indvars.iv.next161.1, 1000
  br i1 %exitcond163.1, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body8.us.us

for.body32.us.us.preheader:                       ; preds = %for.body32.us.us.preheader.preheader, %for.cond30.for.inc60_crit_edge.us.for.body32.us.us.preheader_crit_edge
  %indvar139 = phi i64 [ %indvar.next140, %for.cond30.for.inc60_crit_edge.us.for.body32.us.us.preheader_crit_edge ], [ 0, %for.body32.us.us.preheader.preheader ]
  %storemerge145.us = phi i64 [ %inc61.us, %for.cond30.for.inc60_crit_edge.us.for.body32.us.us.preheader_crit_edge ], [ 0, %for.body32.us.us.preheader.preheader ]
  %sext175 = shl i64 %storemerge145.us, 32
  %idxprom33.us = ashr exact i64 %sext175, 32
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %indvar.next140 = add nuw nsw i64 %indvar139, 1
  %exitcond150 = icmp eq i64 %indvar.next140, 900
  br i1 %exitcond150, label %for.body68.us.us.preheader.preheader, label %for.cond30.for.inc60_crit_edge.us.for.body32.us.us.preheader_crit_edge

for.body68.us.us.preheader.preheader:             ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.body68.us.us.preheader

for.cond30.for.inc60_crit_edge.us.for.body32.us.us.preheader_crit_edge: ; preds = %for.cond30.for.inc60_crit_edge.us
  %inc61.us = add nsw i64 %idxprom33.us, 1
  br label %for.body32.us.us.preheader

for.body32.us.us:                                 ; preds = %for.cond37.for.inc57_crit_edge.us.us, %for.body32.us.us.preheader
  %indvars.iv1 = phi i64 [ 0, %for.body32.us.us.preheader ], [ %indvars.iv.next2, %for.cond37.for.inc57_crit_edge.us.us ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %idxprom33.us, i64 %indvars.iv1
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.body39.us.us
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %cmp31.us.us = icmp slt i64 %indvars.iv.next2, 1100
  br i1 %cmp31.us.us, label %for.body32.us.us, label %for.cond30.for.inc60_crit_edge.us

for.body39.us.us:                                 ; preds = %for.body39.us.us, %for.body32.us.us
  %indvars.iv143 = phi i64 [ 0, %for.body32.us.us ], [ %indvars.iv.next144.1, %for.body39.us.us ]
  %5 = phi double [ 0.000000e+00, %for.body32.us.us ], [ %add53.us.us.1, %for.body39.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33.us, i64 %indvars.iv143
  %6 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv143, i64 %indvars.iv1
  %7 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %6, %7
  %add53.us.us = fadd double %mul48.us.us, %5
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next144 = or i64 %indvars.iv143, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %idxprom33.us, i64 %indvars.iv.next144
  %8 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next144, i64 %indvars.iv1
  %9 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %8, %9
  %add53.us.us.1 = fadd double %mul48.us.us.1, %add53.us.us
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next144.1 = add nuw nsw i64 %indvars.iv143, 2
  %exitcond146.1 = icmp eq i64 %indvars.iv.next144.1, 1200
  br i1 %exitcond146.1, label %for.cond37.for.inc57_crit_edge.us.us, label %for.body39.us.us

for.body68.us.us.preheader:                       ; preds = %for.body68.us.us.preheader.preheader, %for.cond66.for.inc96_crit_edge.us.for.body68.us.us.preheader_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.cond66.for.inc96_crit_edge.us.for.body68.us.us.preheader_crit_edge ], [ 0, %for.body68.us.us.preheader.preheader ]
  %storemerge213.us = phi i64 [ %inc97.us, %for.cond66.for.inc96_crit_edge.us.for.body68.us.us.preheader_crit_edge ], [ 0, %for.body68.us.us.preheader.preheader ]
  %sext = shl i64 %storemerge213.us, 32
  %idxprom69.us = ashr exact i64 %sext, 32
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond133 = icmp eq i64 %indvar.next, 800
  br i1 %exitcond133, label %for.end98, label %for.cond66.for.inc96_crit_edge.us.for.body68.us.us.preheader_crit_edge

for.cond66.for.inc96_crit_edge.us.for.body68.us.us.preheader_crit_edge: ; preds = %for.cond66.for.inc96_crit_edge.us
  %inc97.us = add nsw i64 %idxprom69.us, 1
  br label %for.body68.us.us.preheader

for.body68.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.body68.us.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body68.us.us.preheader ], [ %indvars.iv.next, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %idxprom69.us, i64 %indvars.iv
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.body75.us.us
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp67.us.us = icmp slt i64 %indvars.iv.next, 1100
  br i1 %cmp67.us.us, label %for.body68.us.us, label %for.cond66.for.inc96_crit_edge.us

for.body75.us.us:                                 ; preds = %for.body75.us.us, %for.body68.us.us
  %indvars.iv126 = phi i64 [ 0, %for.body68.us.us ], [ %indvars.iv.next127.1, %for.body75.us.us ]
  %10 = phi double [ 0.000000e+00, %for.body68.us.us ], [ %add89.us.us.1, %for.body75.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69.us, i64 %indvars.iv126
  %11 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv126, i64 %indvars.iv
  %12 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %11, %12
  %add89.us.us = fadd double %mul84.us.us, %10
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %idxprom69.us, i64 %indvars.iv.next127
  %13 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next127, i64 %indvars.iv
  %14 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %13, %14
  %add89.us.us.1 = fadd double %mul84.us.us.1, %add89.us.us
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next127.1 = add nuw nsw i64 %indvars.iv126, 2
  %exitcond129.1 = icmp eq i64 %indvars.iv.next127.1, 900
  br i1 %exitcond129.1, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body75.us.us

for.end98:                                        ; preds = %for.cond66.for.inc96_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly %G) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next2, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv1, 800
  %4 = trunc i64 %3 to i32
  %5 = zext i32 %4 to i64
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv1, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %cmp.us = icmp slt i64 %indvars.iv.next2, 800
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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

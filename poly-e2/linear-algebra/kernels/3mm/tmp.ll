; ModuleID = 'B.ll'
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
  tail call fastcc void @print_array([1100 x double]* %arraydecay16)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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
  %indvars.iv70 = phi i64 [ 0, %entry ], [ %indvars.iv.next71, %for.inc8 ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.body3 ], [ 0, %for.cond1.preheader ]
  %0 = mul nuw nsw i64 %indvars.iv65, %indvars.iv70
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 4.000000e+03
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv65
  store double %div, double* %arrayidx7, align 8
  %exitcond69 = icmp eq i64 %indvars.iv65, 999
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  br i1 %exitcond69, label %for.inc8, label %for.body3

for.inc8:                                         ; preds = %for.body3
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next71, 800
  br i1 %exitcond4, label %for.cond15.preheader.preheader, label %for.cond1.preheader

for.cond15.preheader.preheader:                   ; preds = %for.inc8
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc34, %for.cond15.preheader.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc34 ], [ 0, %for.cond15.preheader.preheader ]
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.cond15.preheader
  %indvars.iv58 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next59, %for.body18 ]
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %3 = mul nuw nsw i64 %indvars.iv.next59, %indvars.iv63
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22 = srem i32 %5, 900
  %conv23 = sitofp i32 %rem22 to double
  %div26 = fdiv double %conv23, 4.500000e+03
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv63, i64 %indvars.iv58
  store double %div26, double* %arrayidx30, align 8
  %exitcond62 = icmp eq i64 %indvars.iv58, 899
  br i1 %exitcond62, label %for.inc34, label %for.body18

for.inc34:                                        ; preds = %for.body18
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond3, label %for.cond41.preheader.preheader, label %for.cond15.preheader

for.cond41.preheader.preheader:                   ; preds = %for.inc34
  br label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %for.inc59, %for.cond41.preheader.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.inc59 ], [ 0, %for.cond41.preheader.preheader ]
  br label %for.body44

for.body44:                                       ; preds = %for.body44, %for.cond41.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.body44 ], [ 0, %for.cond41.preheader ]
  %6 = add nuw nsw i64 %indvars.iv51, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv56
  %8 = trunc i64 %7 to i32
  %rem47 = srem i32 %8, 1100
  %conv48 = sitofp i32 %rem47 to double
  %div51 = fdiv double %conv48, 5.500000e+03
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv56, i64 %indvars.iv51
  store double %div51, double* %arrayidx55, align 8
  %exitcond55 = icmp eq i64 %indvars.iv51, 1199
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br i1 %exitcond55, label %for.inc59, label %for.body44

for.inc59:                                        ; preds = %for.body44
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next57, 900
  br i1 %exitcond2, label %for.cond66.preheader.preheader, label %for.cond41.preheader

for.cond66.preheader.preheader:                   ; preds = %for.inc59
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.inc85, %for.cond66.preheader.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc85 ], [ 0, %for.cond66.preheader.preheader ]
  br label %for.body69

for.body69:                                       ; preds = %for.body69, %for.cond66.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body69 ], [ 0, %for.cond66.preheader ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv49
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73 = srem i32 %12, 1000
  %conv74 = sitofp i32 %rem73 to double
  %div77 = fdiv double %conv74, 5.000000e+03
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv49, i64 %indvars.iv
  store double %div77, double* %arrayidx81, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.inc85, label %for.body69

for.inc85:                                        ; preds = %for.body69
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond1, label %for.end87, label %for.cond66.preheader

for.end87:                                        ; preds = %for.inc85
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc24, %entry
  %indvars.iv74 = phi i64 [ 0, %entry ], [ %indvars.iv.next75, %for.inc24 ]
  br label %for.body3

for.body3:                                        ; preds = %for.inc21, %for.cond1.preheader
  %indvars.iv72 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next73, %for.inc21 ]
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv74, i64 %indvars.iv72
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body3
  %0 = phi double [ 0.000000e+00, %for.body3 ], [ %add.1, %for.body8 ]
  %indvars.iv69 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next70.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv69
  %1 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv69, i64 %indvars.iv72
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx5, align 8
  %indvars.iv.next70 = or i64 %indvars.iv69, 1
  %arrayidx12.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv74, i64 %indvars.iv.next70
  %3 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next70, i64 %indvars.iv72
  %4 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx5, align 8
  %exitcond71.1 = icmp eq i64 %indvars.iv.next70, 999
  %indvars.iv.next70.1 = add nuw nsw i64 %indvars.iv69, 2
  br i1 %exitcond71.1, label %for.inc21, label %for.body8

for.inc21:                                        ; preds = %for.body8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next73, 900
  br i1 %exitcond5, label %for.inc24, label %for.body3

for.inc24:                                        ; preds = %for.inc21
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next75, 800
  br i1 %exitcond6, label %for.cond30.preheader.preheader, label %for.cond1.preheader

for.cond30.preheader.preheader:                   ; preds = %for.inc24
  br label %for.cond30.preheader

for.cond30.preheader:                             ; preds = %for.inc60, %for.cond30.preheader.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc60 ], [ 0, %for.cond30.preheader.preheader ]
  br label %for.body32

for.body32:                                       ; preds = %for.inc57, %for.cond30.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond30.preheader ], [ %indvars.iv.next66, %for.inc57 ]
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv67, i64 %indvars.iv65
  store double 0.000000e+00, double* %arrayidx36, align 8
  br label %for.body39

for.body39:                                       ; preds = %for.body39, %for.body32
  %5 = phi double [ 0.000000e+00, %for.body32 ], [ %add53.2, %for.body39 ]
  %indvars.iv62 = phi i64 [ 0, %for.body32 ], [ %indvars.iv.next63.2, %for.body39 ]
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv62
  %6 = load double, double* %arrayidx43, align 8
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv62, i64 %indvars.iv65
  %7 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %6, %7
  %add53 = fadd double %5, %mul48
  store double %add53, double* %arrayidx36, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx43.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next63
  %8 = load double, double* %arrayidx43.1, align 8
  %arrayidx47.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next63, i64 %indvars.iv65
  %9 = load double, double* %arrayidx47.1, align 8
  %mul48.1 = fmul double %8, %9
  %add53.1 = fadd double %add53, %mul48.1
  store double %add53.1, double* %arrayidx36, align 8
  %indvars.iv.next63.1 = add nuw nsw i64 %indvars.iv62, 2
  %arrayidx43.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv67, i64 %indvars.iv.next63.1
  %10 = load double, double* %arrayidx43.2, align 8
  %arrayidx47.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next63.1, i64 %indvars.iv65
  %11 = load double, double* %arrayidx47.2, align 8
  %mul48.2 = fmul double %10, %11
  %add53.2 = fadd double %add53.1, %mul48.2
  store double %add53.2, double* %arrayidx36, align 8
  %exitcond64.2 = icmp eq i64 %indvars.iv.next63.1, 1199
  %indvars.iv.next63.2 = add nuw nsw i64 %indvars.iv62, 3
  br i1 %exitcond64.2, label %for.inc57, label %for.body39

for.inc57:                                        ; preds = %for.body39
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next66, 1100
  br i1 %exitcond3, label %for.inc60, label %for.body32

for.inc60:                                        ; preds = %for.inc57
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next68, 900
  br i1 %exitcond4, label %for.cond66.preheader.preheader, label %for.cond30.preheader

for.cond66.preheader.preheader:                   ; preds = %for.inc60
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.inc96, %for.cond66.preheader.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc96 ], [ 0, %for.cond66.preheader.preheader ]
  br label %for.body68

for.body68:                                       ; preds = %for.inc93, %for.cond66.preheader
  %indvars.iv58 = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next59, %for.inc93 ]
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv60, i64 %indvars.iv58
  store double 0.000000e+00, double* %arrayidx72, align 8
  br label %for.body75

for.body75:                                       ; preds = %for.body75, %for.body68
  %12 = phi double [ 0.000000e+00, %for.body68 ], [ %add89.2, %for.body75 ]
  %indvars.iv = phi i64 [ 0, %for.body68 ], [ %indvars.iv.next.2, %for.body75 ]
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv60, i64 %indvars.iv
  %13 = load double, double* %arrayidx79, align 8
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv58
  %14 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %13, %14
  %add89 = fadd double %12, %mul84
  store double %add89, double* %arrayidx72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv60, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.1, align 8
  %arrayidx83.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv58
  %16 = load double, double* %arrayidx83.1, align 8
  %mul84.1 = fmul double %15, %16
  %add89.1 = fadd double %add89, %mul84.1
  store double %add89.1, double* %arrayidx72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx79.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv60, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx79.2, align 8
  %arrayidx83.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next.1, i64 %indvars.iv58
  %18 = load double, double* %arrayidx83.2, align 8
  %mul84.2 = fmul double %17, %18
  %add89.2 = fadd double %add89.1, %mul84.2
  store double %add89.2, double* %arrayidx72, align 8
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 899
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %for.inc93, label %for.body75

for.inc93:                                        ; preds = %for.body75
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next59, 1100
  br i1 %exitcond1, label %for.inc96, label %for.body68

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next61, 800
  br i1 %exitcond2, label %for.end98, label %for.cond66.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 800
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

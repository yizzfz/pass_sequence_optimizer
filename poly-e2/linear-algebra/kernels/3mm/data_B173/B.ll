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
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv358 = phi i64 [ 0, %entry ], [ %indvars.iv.next36, %for.end ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv307 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next31, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv307, %indvars.iv358
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 4.000000e+03
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv358, i64 %indvars.iv307
  store double %div, double* %arrayidx7, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv307, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond34, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv358, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 800
  br i1 %exitcond37, label %for.cond15.preheader.preheader, label %for.cond1.preheader

for.cond15.preheader.preheader:                   ; preds = %for.end
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.end33, %for.cond15.preheader.preheader
  %indvars.iv276 = phi i64 [ 0, %for.cond15.preheader.preheader ], [ %indvars.iv.next28, %for.end33 ]
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.cond15.preheader
  %indvars.iv225 = phi i64 [ 0, %for.cond15.preheader ], [ %indvars.iv.next23, %for.body18 ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv225, 1
  %3 = mul nuw nsw i64 %indvars.iv.next23, %indvars.iv276
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22 = srem i32 %5, 900
  %conv23 = sitofp i32 %rem22 to double
  %div26 = fdiv double %conv23, 4.500000e+03
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv276, i64 %indvars.iv225
  store double %div26, double* %arrayidx30, align 8
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 900
  br i1 %exitcond26, label %for.end33, label %for.body18

for.end33:                                        ; preds = %for.body18
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv276, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond29, label %for.cond41.preheader.preheader, label %for.cond15.preheader

for.cond41.preheader.preheader:                   ; preds = %for.end33
  br label %for.cond41.preheader

for.cond41.preheader:                             ; preds = %for.end58, %for.cond41.preheader.preheader
  %indvars.iv194 = phi i64 [ 0, %for.cond41.preheader.preheader ], [ %indvars.iv.next20, %for.end58 ]
  br label %for.body44

for.body44:                                       ; preds = %for.body44, %for.cond41.preheader
  %indvars.iv143 = phi i64 [ 0, %for.cond41.preheader ], [ %indvars.iv.next15, %for.body44 ]
  %6 = add nuw nsw i64 %indvars.iv143, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv194
  %8 = trunc i64 %7 to i32
  %rem47 = srem i32 %8, 1100
  %conv48 = sitofp i32 %rem47 to double
  %div51 = fdiv double %conv48, 5.500000e+03
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv194, i64 %indvars.iv143
  store double %div51, double* %arrayidx55, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv143, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond18, label %for.end58, label %for.body44

for.end58:                                        ; preds = %for.body44
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv194, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 900
  br i1 %exitcond21, label %for.cond66.preheader.preheader, label %for.cond41.preheader

for.cond66.preheader.preheader:                   ; preds = %for.end58
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.end84, %for.cond66.preheader.preheader
  %indvars.iv112 = phi i64 [ 0, %for.cond66.preheader.preheader ], [ %indvars.iv.next12, %for.end84 ]
  br label %for.body69

for.body69:                                       ; preds = %for.body69, %for.cond66.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next, %for.body69 ]
  %9 = add nuw nsw i64 %indvars.iv1, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv112
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73 = srem i32 %12, 1000
  %conv74 = sitofp i32 %rem73 to double
  %div77 = fdiv double %conv74, 5.000000e+03
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv112, i64 %indvars.iv1
  store double %div77, double* %arrayidx81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end84, label %for.body69

for.end84:                                        ; preds = %for.body69
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond13, label %for.end87, label %for.cond66.preheader

for.end87:                                        ; preds = %for.end84
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end23, %entry
  %indvars.iv309 = phi i64 [ 0, %entry ], [ %indvars.iv.next31, %for.end23 ]
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.cond1.preheader
  %indvars.iv278 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next28, %for.end ]
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv309, i64 %indvars.iv278
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body3
  %0 = phi double [ 0.000000e+00, %for.body3 ], [ %add.1, %for.body8 ]
  %indvars.iv247 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next25.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv309, i64 %indvars.iv247
  %1 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv247, i64 %indvars.iv278
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx5, align 8
  %indvars.iv.next25 = or i64 %indvars.iv247, 1
  %arrayidx12.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv309, i64 %indvars.iv.next25
  %3 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next25, i64 %indvars.iv278
  %4 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx5, align 8
  %indvars.iv.next25.1 = add nuw nsw i64 %indvars.iv247, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next25.1, 1000
  br i1 %exitcond26.1, label %for.end, label %for.body8

for.end:                                          ; preds = %for.body8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv278, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 900
  br i1 %exitcond29, label %for.end23, label %for.body3

for.end23:                                        ; preds = %for.end
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv309, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 800
  br i1 %exitcond32, label %for.cond30.preheader.preheader, label %for.cond1.preheader

for.cond30.preheader.preheader:                   ; preds = %for.end23
  br label %for.cond30.preheader

for.cond30.preheader:                             ; preds = %for.end59, %for.cond30.preheader.preheader
  %indvars.iv216 = phi i64 [ 0, %for.cond30.preheader.preheader ], [ %indvars.iv.next22, %for.end59 ]
  br label %for.body32

for.body32:                                       ; preds = %for.end56, %for.cond30.preheader
  %indvars.iv185 = phi i64 [ 0, %for.cond30.preheader ], [ %indvars.iv.next19, %for.end56 ]
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv216, i64 %indvars.iv185
  store double 0.000000e+00, double* %arrayidx36, align 8
  br label %for.body39

for.body39:                                       ; preds = %for.body39, %for.body32
  %5 = phi double [ 0.000000e+00, %for.body32 ], [ %add53.2, %for.body39 ]
  %indvars.iv154 = phi i64 [ 0, %for.body32 ], [ %indvars.iv.next16.2, %for.body39 ]
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv216, i64 %indvars.iv154
  %6 = load double, double* %arrayidx43, align 8
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv154, i64 %indvars.iv185
  %7 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %6, %7
  %add53 = fadd double %5, %mul48
  store double %add53, double* %arrayidx36, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv154, 1
  %arrayidx43.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv216, i64 %indvars.iv.next16
  %8 = load double, double* %arrayidx43.1, align 8
  %arrayidx47.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next16, i64 %indvars.iv185
  %9 = load double, double* %arrayidx47.1, align 8
  %mul48.1 = fmul double %8, %9
  %add53.1 = fadd double %add53, %mul48.1
  store double %add53.1, double* %arrayidx36, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv154, 2
  %arrayidx43.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv216, i64 %indvars.iv.next16.1
  %10 = load double, double* %arrayidx43.2, align 8
  %arrayidx47.2 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next16.1, i64 %indvars.iv185
  %11 = load double, double* %arrayidx47.2, align 8
  %mul48.2 = fmul double %10, %11
  %add53.2 = fadd double %add53.1, %mul48.2
  store double %add53.2, double* %arrayidx36, align 8
  %indvars.iv.next16.2 = add nuw nsw i64 %indvars.iv154, 3
  %exitcond17.2 = icmp eq i64 %indvars.iv.next16.2, 1200
  br i1 %exitcond17.2, label %for.end56, label %for.body39

for.end56:                                        ; preds = %for.body39
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1100
  br i1 %exitcond20, label %for.end59, label %for.body32

for.end59:                                        ; preds = %for.end56
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv216, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 900
  br i1 %exitcond23, label %for.cond66.preheader.preheader, label %for.cond30.preheader

for.cond66.preheader.preheader:                   ; preds = %for.end59
  br label %for.cond66.preheader

for.cond66.preheader:                             ; preds = %for.end95, %for.cond66.preheader.preheader
  %indvars.iv123 = phi i64 [ 0, %for.cond66.preheader.preheader ], [ %indvars.iv.next13, %for.end95 ]
  br label %for.body68

for.body68:                                       ; preds = %for.end92, %for.cond66.preheader
  %indvars.iv92 = phi i64 [ 0, %for.cond66.preheader ], [ %indvars.iv.next10, %for.end92 ]
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv123, i64 %indvars.iv92
  store double 0.000000e+00, double* %arrayidx72, align 8
  br label %for.body75

for.body75:                                       ; preds = %for.body75, %for.body68
  %12 = phi double [ 0.000000e+00, %for.body68 ], [ %add89.2, %for.body75 ]
  %indvars.iv1 = phi i64 [ 0, %for.body68 ], [ %indvars.iv.next.2, %for.body75 ]
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv123, i64 %indvars.iv1
  %13 = load double, double* %arrayidx79, align 8
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv1, i64 %indvars.iv92
  %14 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %13, %14
  %add89 = fadd double %12, %mul84
  store double %add89, double* %arrayidx72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %arrayidx79.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv123, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx79.1, align 8
  %arrayidx83.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv92
  %16 = load double, double* %arrayidx83.1, align 8
  %mul84.1 = fmul double %15, %16
  %add89.1 = fadd double %add89, %mul84.1
  store double %add89.1, double* %arrayidx72, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %arrayidx79.2 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv123, i64 %indvars.iv.next.1
  %17 = load double, double* %arrayidx79.2, align 8
  %arrayidx83.2 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next.1, i64 %indvars.iv92
  %18 = load double, double* %arrayidx83.2, align 8
  %mul84.2 = fmul double %17, %18
  %add89.2 = fadd double %add89.1, %mul84.2
  store double %add89.2, double* %arrayidx72, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv1, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %for.end92, label %for.body75

for.end92:                                        ; preds = %for.body75
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1100
  br i1 %exitcond11, label %for.end95, label %for.body68

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv123, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 800
  br i1 %exitcond14, label %for.end98, label %for.cond66.preheader

for.end98:                                        ; preds = %for.end95
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

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv32, 800
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv1 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv1, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv32, i64 %indvars.iv1
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond6, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
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

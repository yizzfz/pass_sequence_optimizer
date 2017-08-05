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
entry:
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv2237 = phi i64 [ 0, %entry ], [ %indvars.iv.next23, %for.end ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv1835 = phi i64 [ 0, %for.body ], [ %indvars.iv.next19, %for.body3 ]
  %0 = mul nuw nsw i64 %indvars.iv1835, %indvars.iv2237
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 4.000000e+03
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv2237, i64 %indvars.iv1835
  store double %div, double* %arrayidx7, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1835, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond44, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2237, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next23, 800
  br i1 %exitcond45, label %for.body14.preheader, label %for.body

for.body14.preheader:                             ; preds = %for.end
  br label %for.body14

for.body14:                                       ; preds = %for.body14.preheader, %for.end33
  %indvars.iv1633 = phi i64 [ %indvars.iv.next17, %for.end33 ], [ 0, %for.body14.preheader ]
  br label %for.body18

for.body18:                                       ; preds = %for.body18, %for.body14
  %indvars.iv1231 = phi i64 [ 0, %for.body14 ], [ %indvars.iv.next13, %for.body18 ]
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1231, 1
  %3 = mul nuw nsw i64 %indvars.iv.next13, %indvars.iv1633
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22 = srem i32 %5, 900
  %conv23 = sitofp i32 %rem22 to double
  %div26 = fdiv double %conv23, 4.500000e+03
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1633, i64 %indvars.iv1231
  store double %div26, double* %arrayidx30, align 8
  %exitcond42 = icmp eq i64 %indvars.iv.next13, 900
  br i1 %exitcond42, label %for.end33, label %for.body18

for.end33:                                        ; preds = %for.body18
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1633, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond43, label %for.body40.preheader, label %for.body14

for.body40.preheader:                             ; preds = %for.end33
  br label %for.body40

for.body40:                                       ; preds = %for.body40.preheader, %for.end58
  %indvars.iv1029 = phi i64 [ %indvars.iv.next11, %for.end58 ], [ 0, %for.body40.preheader ]
  br label %for.body44

for.body44:                                       ; preds = %for.body44, %for.body40
  %indvars.iv627 = phi i64 [ 0, %for.body40 ], [ %indvars.iv.next7, %for.body44 ]
  %6 = add nuw nsw i64 %indvars.iv627, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv1029
  %8 = trunc i64 %7 to i32
  %rem47 = srem i32 %8, 1100
  %conv48 = sitofp i32 %rem47 to double
  %div51 = fdiv double %conv48, 5.500000e+03
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1029, i64 %indvars.iv627
  store double %div51, double* %arrayidx55, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv627, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond40, label %for.end58, label %for.body44

for.end58:                                        ; preds = %for.body44
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1029, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond41, label %for.body65.preheader, label %for.body40

for.body65.preheader:                             ; preds = %for.end58
  br label %for.body65

for.body65:                                       ; preds = %for.body65.preheader, %for.end84
  %indvars.iv425 = phi i64 [ %indvars.iv.next5, %for.end84 ], [ 0, %for.body65.preheader ]
  br label %for.body69

for.body69:                                       ; preds = %for.body69, %for.body65
  %indvars.iv24 = phi i64 [ 0, %for.body65 ], [ %indvars.iv.next, %for.body69 ]
  %9 = add nuw nsw i64 %indvars.iv24, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv425
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73 = srem i32 %12, 1000
  %conv74 = sitofp i32 %rem73 to double
  %div77 = fdiv double %conv74, 5.000000e+03
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv425, i64 %indvars.iv24
  store double %div77, double* %arrayidx81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end84, label %for.body69

for.end84:                                        ; preds = %for.body69
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv425, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond39, label %for.end87, label %for.body65

for.end87:                                        ; preds = %for.end84
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  %E.addr = alloca [900 x double]*, align 8
  %F.addr = alloca [1100 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1100 x double]*, align 8
  store [900 x double]* %E, [900 x double]** %E.addr, align 8
  store [1100 x double]* %F, [1100 x double]** %F.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1100 x double]* %D, [1100 x double]** %D.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.end23, %entry
  %indvars.iv1532 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.end23 ]
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.body
  %indvars.iv1330 = phi i64 [ 0, %for.body ], [ %indvars.iv.next14, %for.end ]
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv1532, i64 %indvars.iv1330
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body3
  %0 = phi double [ 0.000000e+00, %for.body3 ], [ %add.1, %for.body8 ]
  %indvars.iv1128 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next12.1, %for.body8 ]
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1532, i64 %indvars.iv1128
  %1 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1128, i64 %indvars.iv1330
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx5, align 8
  %indvars.iv.next12 = or i64 %indvars.iv1128, 1
  %arrayidx12.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1532, i64 %indvars.iv.next12
  %3 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next12, i64 %indvars.iv1330
  %4 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx5, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1128, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next12.1, 1000
  br i1 %exitcond41.1, label %for.end, label %for.body8

for.end:                                          ; preds = %for.body8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1330, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next14, 900
  br i1 %exitcond42, label %for.end23, label %for.body3

for.end23:                                        ; preds = %for.end
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1532, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next16, 800
  br i1 %exitcond44, label %for.end26, label %for.body

for.end26:                                        ; preds = %for.end23
  %5 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %6 = load [1100 x double]*, [1100 x double]** %D.addr, align 8
  br label %for.body29

for.body29:                                       ; preds = %for.end59, %for.end26
  %indvars.iv926 = phi i64 [ 0, %for.end26 ], [ %indvars.iv.next10, %for.end59 ]
  br label %for.body32

for.body32:                                       ; preds = %for.end56, %for.body29
  %indvars.iv724 = phi i64 [ 0, %for.body29 ], [ %indvars.iv.next8, %for.end56 ]
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv926, i64 %indvars.iv724
  store double 0.000000e+00, double* %arrayidx36, align 8
  br label %for.body39

for.body39:                                       ; preds = %for.body39, %for.body32
  %7 = phi double [ 0.000000e+00, %for.body32 ], [ %add53.2, %for.body39 ]
  %indvars.iv522 = phi i64 [ 0, %for.body32 ], [ %indvars.iv.next6.2, %for.body39 ]
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv926, i64 %indvars.iv522
  %8 = load double, double* %arrayidx43, align 8
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv522, i64 %indvars.iv724
  %9 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %8, %9
  %add53 = fadd double %7, %mul48
  store double %add53, double* %arrayidx36, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv522, 1
  %arrayidx43.1 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv926, i64 %indvars.iv.next6
  %10 = load double, double* %arrayidx43.1, align 8
  %arrayidx47.1 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv.next6, i64 %indvars.iv724
  %11 = load double, double* %arrayidx47.1, align 8
  %mul48.1 = fmul double %10, %11
  %add53.1 = fadd double %add53, %mul48.1
  store double %add53.1, double* %arrayidx36, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv522, 2
  %arrayidx43.2 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv926, i64 %indvars.iv.next6.1
  %12 = load double, double* %arrayidx43.2, align 8
  %arrayidx47.2 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv.next6.1, i64 %indvars.iv724
  %13 = load double, double* %arrayidx47.2, align 8
  %mul48.2 = fmul double %12, %13
  %add53.2 = fadd double %add53.1, %mul48.2
  store double %add53.2, double* %arrayidx36, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv522, 3
  %exitcond37.2 = icmp eq i64 %indvars.iv.next6.2, 1200
  br i1 %exitcond37.2, label %for.end56, label %for.body39

for.end56:                                        ; preds = %for.body39
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv724, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next8, 1100
  br i1 %exitcond38, label %for.end59, label %for.body32

for.end59:                                        ; preds = %for.end56
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv926, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next10, 900
  br i1 %exitcond40, label %for.end62, label %for.body29

for.end62:                                        ; preds = %for.end59
  %14 = load [900 x double]*, [900 x double]** %E.addr, align 8
  %15 = load [1100 x double]*, [1100 x double]** %F.addr, align 8
  br label %for.body65

for.body65:                                       ; preds = %for.end95, %for.end62
  %indvars.iv320 = phi i64 [ 0, %for.end62 ], [ %indvars.iv.next4, %for.end95 ]
  br label %for.body68

for.body68:                                       ; preds = %for.end92, %for.body65
  %indvars.iv118 = phi i64 [ 0, %for.body65 ], [ %indvars.iv.next2, %for.end92 ]
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv320, i64 %indvars.iv118
  store double 0.000000e+00, double* %arrayidx72, align 8
  br label %for.body75

for.body75:                                       ; preds = %for.body75, %for.body68
  %16 = phi double [ 0.000000e+00, %for.body68 ], [ %add89.2, %for.body75 ]
  %indvars.iv17 = phi i64 [ 0, %for.body68 ], [ %indvars.iv.next.2, %for.body75 ]
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %14, i64 %indvars.iv320, i64 %indvars.iv17
  %17 = load double, double* %arrayidx79, align 8
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %15, i64 %indvars.iv17, i64 %indvars.iv118
  %18 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %17, %18
  %add89 = fadd double %16, %mul84
  store double %add89, double* %arrayidx72, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx79.1 = getelementptr inbounds [900 x double], [900 x double]* %14, i64 %indvars.iv320, i64 %indvars.iv.next
  %19 = load double, double* %arrayidx79.1, align 8
  %arrayidx83.1 = getelementptr inbounds [1100 x double], [1100 x double]* %15, i64 %indvars.iv.next, i64 %indvars.iv118
  %20 = load double, double* %arrayidx83.1, align 8
  %mul84.1 = fmul double %19, %20
  %add89.1 = fadd double %add89, %mul84.1
  store double %add89.1, double* %arrayidx72, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv17, 2
  %arrayidx79.2 = getelementptr inbounds [900 x double], [900 x double]* %14, i64 %indvars.iv320, i64 %indvars.iv.next.1
  %21 = load double, double* %arrayidx79.2, align 8
  %arrayidx83.2 = getelementptr inbounds [1100 x double], [1100 x double]* %15, i64 %indvars.iv.next.1, i64 %indvars.iv118
  %22 = load double, double* %arrayidx83.2, align 8
  %mul84.2 = fmul double %21, %22
  %add89.2 = fadd double %add89.1, %mul84.2
  store double %add89.2, double* %arrayidx72, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv17, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %for.end92, label %for.body75

for.end92:                                        ; preds = %for.body75
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next2, 1100
  br i1 %exitcond34, label %for.end95, label %for.body68

for.end95:                                        ; preds = %for.end92
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv320, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond36, label %for.end98, label %for.body65

for.end98:                                        ; preds = %for.end95
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv26, 800
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 800
  br i1 %exitcond8, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
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

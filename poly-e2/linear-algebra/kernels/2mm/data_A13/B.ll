; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %arraydecay1 = bitcast i8* %call2 to [1100 x double]*
  %arraydecay92 = bitcast i8* %call4 to [900 x double]*
  %arraydecay103 = bitcast i8* %call6 to [1200 x double]*
  %arraydecay114 = bitcast i8* %call8 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay1, [900 x double]* %arraydecay92, [1200 x double]* %arraydecay103, [1200 x double]* %arraydecay114)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay125 = bitcast i8* %call to [900 x double]*
  tail call fastcc void @kernel_2mm(double %0, double %1, [900 x double]* %arraydecay125, [1100 x double]* %arraydecay1, [900 x double]* %arraydecay92, [1200 x double]* %arraydecay103, [1200 x double]* %arraydecay114)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call8 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv32 = phi i64 [ 0, %entry ], [ %indvars.iv.next33, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next28, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv27, %indvars.iv32
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 8.000000e+02
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv32, i64 %indvars.iv27
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond31 = icmp eq i64 %indvars.iv27, 1099
  br i1 %exitcond31, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next33, 800
  br i1 %exitcond4, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next22.1, %for.inc28 ]
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %3 = mul nuw nsw i64 %indvars.iv.next22, %indvars.iv25
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 900
  %conv21 = sitofp i32 %rem20 to double
  %div23 = fdiv double %conv21, 9.000000e+02
  %arrayidx27 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv21
  store double %div23, double* %arrayidx27, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %5 = mul nuw nsw i64 %indvars.iv.next22.1, %indvars.iv25
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 900
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.1 = fdiv double %conv21.1, 9.000000e+02
  %arrayidx27.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv.next22
  store double %div23.1, double* %arrayidx27.1, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22, 899
  br i1 %exitcond24.1, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next26, 1100
  br i1 %exitcond3, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.cond38.preheader.preheader, %for.inc56
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc56 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53, %for.cond38.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next14, %for.inc53 ]
  %7 = add nuw nsw i64 %indvars.iv13, 3
  %8 = mul nuw nsw i64 %7, %indvars.iv19
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %rem45 = srem i32 %10, 1200
  %conv46 = sitofp i32 %rem45 to double
  %div48 = fdiv double %conv46, 1.200000e+03
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv19, i64 %indvars.iv13
  store double %div48, double* %arrayidx52, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond18 = icmp eq i64 %indvars.iv13, 1199
  br i1 %exitcond18, label %for.inc56, label %for.inc53

for.inc56:                                        ; preds = %for.inc53
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next20, 900
  br i1 %exitcond2, label %for.cond63.preheader.preheader, label %for.cond38.preheader

for.cond63.preheader.preheader:                   ; preds = %for.inc56
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.preheader, %for.inc80
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.inc80 ], [ 0, %for.cond63.preheader.preheader ]
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.cond63.preheader
  %indvars.iv = phi i64 [ 0, %for.cond63.preheader ], [ %indvars.iv.next, %for.inc77 ]
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = mul nuw nsw i64 %11, %indvars.iv11
  %13 = trunc i64 %12 to i32
  %rem69 = srem i32 %13, 1100
  %conv70 = sitofp i32 %rem69 to double
  %div72 = fdiv double %conv70, 1.100000e+03
  %arrayidx76 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv11, i64 %indvars.iv
  store double %div72, double* %arrayidx76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %for.inc80, label %for.inc77

for.inc80:                                        ; preds = %for.inc77
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 800
  br i1 %exitcond1, label %for.end82, label %for.cond63.preheader

for.end82:                                        ; preds = %for.inc80
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv23 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc28 ]
  %arrayidx = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv23
  %0 = ptrtoint [900 x double]* %arrayidx to i64
  %sunkaddr = ptrtoint [900 x double]* %arrayidx to i64
  %sunkaddr.1 = ptrtoint [900 x double]* %arrayidx to i64
  br label %for.body6

for.body6:                                        ; preds = %for.inc25, %for.cond4.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next22, %for.inc25 ]
  %arrayidx8 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv23, i64 %indvars.iv21
  store double 0.000000e+00, double* %arrayidx8, align 8
  %sunkaddr1 = shl i64 %indvars.iv21, 3
  %sunkaddr2 = add i64 %sunkaddr1, %0
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  %.pre = load double, double* %sunkaddr3, align 8
  %sunkaddr8 = shl i64 %indvars.iv21, 3
  %sunkaddr9 = add i64 %sunkaddr, %sunkaddr8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  %sunkaddr8.1 = shl i64 %indvars.iv21, 3
  %sunkaddr9.1 = add i64 %sunkaddr.1, %sunkaddr8.1
  %sunkaddr10.1 = inttoptr i64 %sunkaddr9.1 to double*
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body6
  %1 = phi double [ %.pre, %for.body6 ], [ %add.1, %for.inc ]
  %indvars.iv18 = phi i64 [ 0, %for.body6 ], [ %indvars.iv.next19.1, %for.inc ]
  %arrayidx15 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv18
  %2 = load double, double* %arrayidx15, align 8
  %mul = fmul double %2, %alpha
  %arrayidx19 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv18, i64 %indvars.iv21
  %3 = load double, double* %arrayidx19, align 8
  %mul20 = fmul double %mul, %3
  %add = fadd double %1, %mul20
  store double %add, double* %sunkaddr10, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %arrayidx15.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv.next19
  %4 = load double, double* %arrayidx15.1, align 8
  %mul.1 = fmul double %4, %alpha
  %arrayidx19.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next19, i64 %indvars.iv21
  %5 = load double, double* %arrayidx19.1, align 8
  %mul20.1 = fmul double %mul.1, %5
  %add.1 = fadd double %add, %mul20.1
  store double %add.1, double* %sunkaddr10.1, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19, 1099
  br i1 %exitcond20.1, label %for.inc25, label %for.inc

for.inc25:                                        ; preds = %for.inc
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next22, 900
  br i1 %exitcond3, label %for.inc28, label %for.body6

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next24, 800
  br i1 %exitcond4, label %for.cond34.preheader.preheader, label %for.cond4.preheader

for.cond34.preheader.preheader:                   ; preds = %for.inc28
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.preheader, %for.inc65
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc65 ], [ 0, %for.cond34.preheader.preheader ]
  %arrayidx38 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv16
  %6 = ptrtoint [1200 x double]* %arrayidx38 to i64
  %sunkaddr11 = ptrtoint [1200 x double]* %arrayidx38 to i64
  %sunkaddr11.1 = ptrtoint [1200 x double]* %arrayidx38 to i64
  br label %for.body36

for.body36:                                       ; preds = %for.inc62, %for.cond34.preheader
  %indvars.iv14 = phi i64 [ 0, %for.cond34.preheader ], [ %indvars.iv.next15, %for.inc62 ]
  %arrayidx40 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv16, i64 %indvars.iv14
  %7 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %7, %beta
  store double %mul41, double* %arrayidx40, align 8
  %sunkaddr5 = shl i64 %indvars.iv14, 3
  %sunkaddr6 = add i64 %sunkaddr5, %6
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  %.pre25 = load double, double* %sunkaddr7, align 8
  %sunkaddr12 = shl i64 %indvars.iv14, 3
  %sunkaddr13 = add i64 %sunkaddr11, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  %sunkaddr12.1 = shl i64 %indvars.iv14, 3
  %sunkaddr13.1 = add i64 %sunkaddr11.1, %sunkaddr12.1
  %sunkaddr14.1 = inttoptr i64 %sunkaddr13.1 to double*
  br label %for.inc59

for.inc59:                                        ; preds = %for.inc59, %for.body36
  %8 = phi double [ %.pre25, %for.body36 ], [ %add58.1, %for.inc59 ]
  %indvars.iv = phi i64 [ 0, %for.body36 ], [ %indvars.iv.next.1, %for.inc59 ]
  %arrayidx48 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv16, i64 %indvars.iv
  %9 = load double, double* %arrayidx48, align 8
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv, i64 %indvars.iv14
  %10 = load double, double* %arrayidx52, align 8
  %mul53 = fmul double %9, %10
  %add58 = fadd double %8, %mul53
  store double %add58, double* %sunkaddr14, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx48.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv16, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx48.1, align 8
  %arrayidx52.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next, i64 %indvars.iv14
  %12 = load double, double* %arrayidx52.1, align 8
  %mul53.1 = fmul double %11, %12
  %add58.1 = fadd double %add58, %mul53.1
  store double %add58.1, double* %sunkaddr14.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 899
  br i1 %exitcond.1, label %for.inc62, label %for.inc59

for.inc62:                                        ; preds = %for.inc59
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond1, label %for.inc65, label %for.body36

for.inc65:                                        ; preds = %for.inc62
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next17, 800
  br i1 %exitcond2, label %for.end67, label %for.cond34.preheader

for.end67:                                        ; preds = %for.inc65
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %D) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 800
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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

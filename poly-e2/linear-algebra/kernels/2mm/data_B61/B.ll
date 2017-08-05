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
  %arraydecay = bitcast i8* %call2 to [1100 x double]*
  %arraydecay9 = bitcast i8* %call4 to [900 x double]*
  %arraydecay10 = bitcast i8* %call6 to [1200 x double]*
  %arraydecay11 = bitcast i8* %call8 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay12 = bitcast i8* %call to [900 x double]*
  call fastcc void @kernel_2mm(double %0, double %1, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array([1200 x double]* %arraydecay11)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call8) #4
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
  %indvars.iv2737 = phi i64 [ 0, %entry ], [ %indvars.iv.next28, %for.inc7 ]
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv2236 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next23, %for.inc ]
  %0 = mul nuw nsw i64 %indvars.iv2236, %indvars.iv2737
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 800
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 8.000000e+02
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv2737, i64 %indvars.iv2236
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2236, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next23, 1100
  br i1 %exitcond26, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv2737, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 800
  br i1 %exitcond29, label %for.cond14.preheader.preheader, label %for.cond1.preheader

for.cond14.preheader.preheader:                   ; preds = %for.inc7
  br label %for.cond14.preheader

for.cond14.preheader:                             ; preds = %for.cond14.preheader.preheader, %for.inc31
  %indvars.iv1935 = phi i64 [ %indvars.iv.next20, %for.inc31 ], [ 0, %for.cond14.preheader.preheader ]
  br label %for.inc28

for.inc28:                                        ; preds = %for.inc28, %for.cond14.preheader
  %indvars.iv1534 = phi i64 [ 0, %for.cond14.preheader ], [ %indvars.iv.next16.1, %for.inc28 ]
  %indvars.iv.next16 = or i64 %indvars.iv1534, 1
  %3 = mul nuw nsw i64 %indvars.iv.next16, %indvars.iv1935
  %4 = trunc i64 %3 to i32
  %rem20 = srem i32 %4, 900
  %conv21 = sitofp i32 %rem20 to double
  %arrayidx27 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1935, i64 %indvars.iv1534
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv1534, 2
  %5 = mul nuw nsw i64 %indvars.iv.next16.1, %indvars.iv1935
  %6 = trunc i64 %5 to i32
  %rem20.1 = srem i32 %6, 900
  %conv21.1 = sitofp i32 %rem20.1 to double
  %div23.v.i0.1 = insertelement <2 x double> undef, double %conv21, i32 0
  %div23.v.i0.2 = insertelement <2 x double> %div23.v.i0.1, double %conv21.1, i32 1
  %div23 = fdiv <2 x double> %div23.v.i0.2, <double 9.000000e+02, double 9.000000e+02>
  %7 = bitcast double* %arrayidx27 to <2 x double>*
  store <2 x double> %div23, <2 x double>* %7, align 8
  %exitcond18.1 = icmp eq i64 %indvars.iv.next16.1, 900
  br i1 %exitcond18.1, label %for.inc31, label %for.inc28

for.inc31:                                        ; preds = %for.inc28
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1935, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1100
  br i1 %exitcond21, label %for.cond38.preheader.preheader, label %for.cond14.preheader

for.cond38.preheader.preheader:                   ; preds = %for.inc31
  br label %for.cond38.preheader

for.cond38.preheader:                             ; preds = %for.cond38.preheader.preheader, %for.inc56
  %indvars.iv1233 = phi i64 [ %indvars.iv.next13, %for.inc56 ], [ 0, %for.cond38.preheader.preheader ]
  br label %for.inc53

for.inc53:                                        ; preds = %for.inc53, %for.cond38.preheader
  %indvars.iv632 = phi i64 [ 0, %for.cond38.preheader ], [ %indvars.iv.next7, %for.inc53 ]
  %8 = add nuw nsw i64 %indvars.iv632, 3
  %9 = mul nuw nsw i64 %8, %indvars.iv1233
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %rem45 = srem i32 %11, 1200
  %conv46 = sitofp i32 %rem45 to double
  %div48 = fdiv double %conv46, 1.200000e+03
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1233, i64 %indvars.iv632
  store double %div48, double* %arrayidx52, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv632, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next7, 1200
  br i1 %exitcond11, label %for.inc56, label %for.inc53

for.inc56:                                        ; preds = %for.inc53
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1233, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 900
  br i1 %exitcond14, label %for.cond63.preheader.preheader, label %for.cond38.preheader

for.cond63.preheader.preheader:                   ; preds = %for.inc56
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.preheader, %for.inc80
  %indvars.iv331 = phi i64 [ %indvars.iv.next4, %for.inc80 ], [ 0, %for.cond63.preheader.preheader ]
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.cond63.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond63.preheader ], [ %indvars.iv.next, %for.inc77 ]
  %12 = add nuw nsw i64 %indvars.iv30, 2
  %13 = mul nuw nsw i64 %12, %indvars.iv331
  %14 = trunc i64 %13 to i32
  %rem69 = srem i32 %14, 1100
  %conv70 = sitofp i32 %rem69 to double
  %div72 = fdiv double %conv70, 1.100000e+03
  %arrayidx76 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv331, i64 %indvars.iv30
  store double %div72, double* %arrayidx76, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc80, label %for.inc77

for.inc80:                                        ; preds = %for.inc77
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv331, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond5, label %for.end82, label %for.cond63.preheader

for.end82:                                        ; preds = %for.inc80
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc28, %entry
  %indvars.iv1321 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.inc28 ]
  br label %for.body6

for.body6:                                        ; preds = %for.inc25, %for.cond4.preheader
  %indvars.iv1020 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next11, %for.inc25 ]
  %arrayidx8 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv1321, i64 %indvars.iv1020
  store double 0.000000e+00, double* %arrayidx8, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body6
  %0 = phi double [ 0.000000e+00, %for.body6 ], [ %add.1, %for.inc ]
  %indvars.iv719 = phi i64 [ 0, %for.body6 ], [ %indvars.iv.next8.1, %for.inc ]
  %arrayidx15 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv1321, i64 %indvars.iv719
  %1 = load double, double* %arrayidx15, align 8
  %mul = fmul double %1, %alpha
  %arrayidx19 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv719, i64 %indvars.iv1020
  %2 = load double, double* %arrayidx19, align 8
  %mul20 = fmul double %mul, %2
  %add = fadd double %0, %mul20
  store double %add, double* %arrayidx8, align 8
  %indvars.iv.next8 = or i64 %indvars.iv719, 1
  %arrayidx15.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv1321, i64 %indvars.iv.next8
  %3 = load double, double* %arrayidx15.1, align 8
  %mul.1 = fmul double %3, %alpha
  %arrayidx19.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next8, i64 %indvars.iv1020
  %4 = load double, double* %arrayidx19.1, align 8
  %mul20.1 = fmul double %mul.1, %4
  %add.1 = fadd double %add, %mul20.1
  store double %add.1, double* %arrayidx8, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv719, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 1100
  br i1 %exitcond9.1, label %for.inc25, label %for.inc

for.inc25:                                        ; preds = %for.inc
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1020, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond12, label %for.inc28, label %for.body6

for.inc28:                                        ; preds = %for.inc25
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1321, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond15, label %for.cond34.preheader.preheader, label %for.cond4.preheader

for.cond34.preheader.preheader:                   ; preds = %for.inc28
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.preheader, %for.inc65
  %indvars.iv418 = phi i64 [ %indvars.iv.next5, %for.inc65 ], [ 0, %for.cond34.preheader.preheader ]
  br label %for.body36

for.body36:                                       ; preds = %for.inc62, %for.cond34.preheader
  %indvars.iv117 = phi i64 [ 0, %for.cond34.preheader ], [ %indvars.iv.next2, %for.inc62 ]
  %arrayidx40 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv418, i64 %indvars.iv117
  %5 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %5, %beta
  store double %mul41, double* %arrayidx40, align 8
  br label %for.inc59

for.inc59:                                        ; preds = %for.inc59, %for.body36
  %6 = phi double [ %mul41, %for.body36 ], [ %add58.2, %for.inc59 ]
  %indvars.iv16 = phi i64 [ 0, %for.body36 ], [ %indvars.iv.next.2, %for.inc59 ]
  %arrayidx48 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv418, i64 %indvars.iv16
  %7 = load double, double* %arrayidx48, align 8
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv16, i64 %indvars.iv117
  %8 = load double, double* %arrayidx52, align 8
  %mul53 = fmul double %7, %8
  %add58 = fadd double %6, %mul53
  store double %add58, double* %arrayidx40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv16, 1
  %arrayidx48.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv418, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx48.1, align 8
  %arrayidx52.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next, i64 %indvars.iv117
  %10 = load double, double* %arrayidx52.1, align 8
  %mul53.1 = fmul double %9, %10
  %add58.1 = fadd double %add58, %mul53.1
  store double %add58.1, double* %arrayidx40, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv16, 2
  %arrayidx48.2 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv418, i64 %indvars.iv.next.1
  %11 = load double, double* %arrayidx48.2, align 8
  %arrayidx52.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next.1, i64 %indvars.iv117
  %12 = load double, double* %arrayidx52.2, align 8
  %mul53.2 = fmul double %11, %12
  %add58.2 = fadd double %add58.1, %mul53.2
  store double %add58.2, double* %arrayidx40, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv16, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %for.inc62, label %for.inc59

for.inc62:                                        ; preds = %for.inc59
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %for.inc65, label %for.body36

for.inc65:                                        ; preds = %for.inc62
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv418, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %for.end67, label %for.cond34.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv27 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv27, 800
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
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
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv27, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 800
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

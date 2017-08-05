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
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay12 = bitcast i8* %call to [900 x double]*
  tail call fastcc void @kernel_2mm(double %0, double %1, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
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
  tail call fastcc void @print_array([1200 x double]* %arraydecay11)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.inc7_crit_edge.us ], [ 0, %entry ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next55, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv54, %indvars.iv60
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 8.000000e+02
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, 1100
  br i1 %exitcond59, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, 800
  br i1 %exitcond63, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.cond14.preheader.us, %for.body17.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %for.body17.us ], [ 0, %for.cond14.preheader.us ]
  %indvars.iv.next45 = or i64 %indvars.iv44, 1
  %3 = mul nuw nsw i64 %indvars.iv.next45, %indvars.iv49
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 900
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv44
  %indvars.iv.next45.1 = add nuw nsw i64 %indvars.iv44, 2
  %5 = mul nuw nsw i64 %indvars.iv.next45.1, %indvars.iv49
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 900
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 9.000000e+02, double 9.000000e+02>
  %7 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %7, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next45.1, 900
  br i1 %exitcond48.1, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, 1100
  br i1 %exitcond52, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv32 = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next33, %for.body41.us ]
  %8 = add nuw nsw i64 %indvars.iv32, 3
  %9 = mul nuw nsw i64 %8, %indvars.iv39
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %rem45.us = srem i32 %11, 1200
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, 1.200000e+03
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv32
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond38, label %for.cond38.for.inc56_crit_edge.us, label %for.body41.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 900
  br i1 %exitcond42, label %for.cond63.preheader.us.preheader, label %for.cond38.preheader.us

for.cond63.preheader.us.preheader:                ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.preheader.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.cond63.preheader.us.preheader ]
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us, %for.cond63.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond63.preheader.us ], [ %indvars.iv.next, %for.body66.us ]
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = mul nuw nsw i64 %12, %indvars.iv27
  %14 = trunc i64 %13 to i32
  %rem69.us = srem i32 %14, 1100
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, 1.100000e+03
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv27, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.body66.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 800
  br i1 %exitcond30, label %for.end82, label %for.cond63.preheader.us

for.end82:                                        ; preds = %for.cond63.for.inc80_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc28_crit_edge.us, %entry
  %indvars.iv85 = phi i64 [ 0, %entry ], [ %indvars.iv.next86, %for.cond4.for.inc28_crit_edge.us ]
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, 800
  br i1 %exitcond88, label %for.cond34.preheader.us.preheader, label %for.cond4.preheader.us

for.cond34.preheader.us.preheader:                ; preds = %for.cond4.for.inc28_crit_edge.us
  br label %for.cond34.preheader.us

for.body6.us.us:                                  ; preds = %for.cond4.preheader.us, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.cond4.preheader.us ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv85, i64 %indvars.iv81
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br label %for.body11.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.body11.us.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 900
  br i1 %exitcond84, label %for.cond4.for.inc28_crit_edge.us, label %for.body6.us.us

for.body11.us.us:                                 ; preds = %for.body6.us.us, %for.body11.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78.1, %for.body11.us.us ], [ 0, %for.body6.us.us ]
  %0 = phi double [ %add.us.us.1, %for.body11.us.us ], [ 0.000000e+00, %for.body6.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv77
  %1 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %1, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv77, i64 %indvars.iv81
  %2 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %2
  %add.us.us = fadd double %0, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next78
  %3 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next78, i64 %indvars.iv81
  %4 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %4
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next78.1 = add nuw nsw i64 %indvars.iv77, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next78.1, 1100
  br i1 %exitcond80.1, label %for.cond9.for.inc25_crit_edge.us.us, label %for.body11.us.us

for.cond34.preheader.us:                          ; preds = %for.cond34.preheader.us.preheader, %for.cond34.for.inc65_crit_edge.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond34.for.inc65_crit_edge.us ], [ 0, %for.cond34.preheader.us.preheader ]
  br label %for.body36.us.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 800
  br i1 %exitcond71, label %for.end67, label %for.cond34.preheader.us

for.body36.us.us:                                 ; preds = %for.cond34.preheader.us, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.cond34.preheader.us ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv68, i64 %indvars.iv64
  %5 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %5, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br label %for.body44.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.body44.us.us
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond67, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us.us

for.body44.us.us:                                 ; preds = %for.body36.us.us, %for.body44.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %for.body44.us.us ], [ 0, %for.body36.us.us ]
  %6 = phi double [ %add58.us.us.1, %for.body44.us.us ], [ %mul41.us.us, %for.body36.us.us ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv68, i64 %indvars.iv60
  %7 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv64
  %8 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %7, %8
  %add58.us.us = fadd double %6, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next61 = or i64 %indvars.iv60, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv68, i64 %indvars.iv.next61
  %9 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next61, i64 %indvars.iv64
  %10 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %9, %10
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, 900
  br i1 %exitcond63.1, label %for.cond42.for.inc62_crit_edge.us.us, label %for.body44.us.us

for.end67:                                        ; preds = %for.cond34.for.inc65_crit_edge.us
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
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 800
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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

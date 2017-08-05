; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %call4 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %call6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %call8 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #3
  %arraydecay = bitcast i8* %call2 to [1100 x double]*
  %arraydecay9 = bitcast i8* %call4 to [900 x double]*
  %arraydecay10 = bitcast i8* %call6 to [1200 x double]*
  %arraydecay11 = bitcast i8* %call8 to [1200 x double]*
  call void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay12 = bitcast i8* %call to [900 x double]*
  call void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %0, double %1, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call8 to [1200 x double]*
  call void @print_array(i32 800, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call2) #3
  call void @free(i8* %call4) #3
  call void @free(i8* %call6) #3
  call void @free(i8* %call8) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %entry, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv103 = phi i64 [ %indvars.iv.next104, %for.cond1.for.inc7_crit_edge.us ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv97 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next98, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv97, %indvars.iv103
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 8.000000e+02
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv103, i64 %indvars.iv97
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next98, 1100
  br i1 %exitcond102, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 800
  br i1 %exitcond106, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.cond14.preheader.us, %for.inc28.us
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %for.inc28.us ], [ 0, %for.cond14.preheader.us ]
  %indvars.iv.next88 = or i64 %indvars.iv87, 1
  %3 = mul nuw nsw i64 %indvars.iv.next88, %indvars.iv92
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 900
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv92, i64 %indvars.iv87
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %5 = mul nuw nsw i64 %indvars.iv.next88.1, %indvars.iv92
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 900
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 9.000000e+02, double 9.000000e+02>
  %7 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %7, align 8
  %exitcond91.1 = icmp eq i64 %indvars.iv.next88.1, 900
  br i1 %exitcond91.1, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.inc28.us
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 1100
  br i1 %exitcond95, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc53.us

for.inc53.us:                                     ; preds = %for.inc53.us, %for.cond38.preheader.us
  %indvars.iv75 = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next76, %for.inc53.us ]
  %8 = add nuw nsw i64 %indvars.iv75, 3
  %9 = mul nuw nsw i64 %8, %indvars.iv82
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %rem45.us = srem i32 %11, 1200
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, 1.200000e+03
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv82, i64 %indvars.iv75
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next76, 1200
  br i1 %exitcond81, label %for.cond38.for.inc56_crit_edge.us, label %for.inc53.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.inc53.us
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 900
  br i1 %exitcond85, label %for.cond63.preheader.us.preheader, label %for.cond38.preheader.us

for.cond63.preheader.us.preheader:                ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.preheader.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.cond63.preheader.us.preheader ]
  br label %for.inc77.us

for.inc77.us:                                     ; preds = %for.inc77.us, %for.cond63.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond63.preheader.us ], [ %indvars.iv.next, %for.inc77.us ]
  %12 = add nuw nsw i64 %indvars.iv, 2
  %13 = mul nuw nsw i64 %12, %indvars.iv70
  %14 = trunc i64 %13 to i32
  %rem69.us = srem i32 %14, 1100
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, 1.100000e+03
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv70, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.inc77.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.inc77.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 800
  br i1 %exitcond73, label %for.end82, label %for.cond63.preheader.us

for.end82:                                        ; preds = %for.cond63.for.inc80_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* %tmp, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc28_crit_edge.us, %entry
  %indvars.iv130 = phi i64 [ 0, %entry ], [ %indvars.iv.next131, %for.cond4.for.inc28_crit_edge.us ]
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next131, 800
  br i1 %exitcond133, label %for.cond34.preheader.us.preheader, label %for.cond4.preheader.us

for.cond34.preheader.us.preheader:                ; preds = %for.cond4.for.inc28_crit_edge.us
  br label %for.cond34.preheader.us

for.body6.us.us:                                  ; preds = %for.cond4.preheader.us, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.cond4.preheader.us ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv130, i64 %indvars.iv124
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br label %for.inc.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 900
  br i1 %exitcond127, label %for.cond4.for.inc28_crit_edge.us, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.body6.us.us, %for.inc.us.us
  %0 = phi double [ %add.us.us.1, %for.inc.us.us ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %for.inc.us.us ], [ 0, %for.body6.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv130, i64 %indvars.iv118
  %1 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %1, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv118, i64 %indvars.iv124
  %2 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %2
  %add.us.us = fadd double %0, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next119 = or i64 %indvars.iv118, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv130, i64 %indvars.iv.next119
  %3 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next119, i64 %indvars.iv124
  %4 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %4
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next119.1, 1100
  br i1 %exitcond121.1, label %for.cond9.for.inc25_crit_edge.us.us, label %for.inc.us.us

for.cond34.preheader.us:                          ; preds = %for.cond34.preheader.us.preheader, %for.cond34.for.inc65_crit_edge.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond34.for.inc65_crit_edge.us ], [ 0, %for.cond34.preheader.us.preheader ]
  br label %for.body36.us.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 800
  br i1 %exitcond111, label %for.end67, label %for.cond34.preheader.us

for.body36.us.us:                                 ; preds = %for.cond34.preheader.us, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.cond34.preheader.us ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv108, i64 %indvars.iv105
  %5 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %5, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br label %for.inc59.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.inc59.us.us
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond = icmp eq i64 %indvars.iv.next106, 1200
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us.us

for.inc59.us.us:                                  ; preds = %for.body36.us.us, %for.inc59.us.us
  %6 = phi double [ %add58.us.us.1, %for.inc59.us.us ], [ %mul41.us.us, %for.body36.us.us ]
  %indvars.iv99 = phi i64 [ %indvars.iv.next100.1, %for.inc59.us.us ], [ 0, %for.body36.us.us ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv108, i64 %indvars.iv99
  %7 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv99, i64 %indvars.iv105
  %8 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %7, %8
  %add58.us.us = fadd double %6, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next100 = or i64 %indvars.iv99, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv108, i64 %indvars.iv.next100
  %9 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next100, i64 %indvars.iv105
  %10 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %9, %10
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next100.1 = add nsw i64 %indvars.iv99, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next100.1, 900
  br i1 %exitcond.1, label %for.cond42.for.inc62_crit_edge.us.us, label %for.inc59.us.us

for.end67:                                        ; preds = %for.cond34.for.inc65_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1200 x double]* %D) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv14, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv14, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next15, 800
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

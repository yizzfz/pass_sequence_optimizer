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
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us, %for.cond1.preheader.us.preheader
  %indvars.iv6383.us = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next64.us, %for.inc7.us ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv5981.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next60.us, %for.inc.us ]
  %0 = mul nuw nsw i64 %indvars.iv5981.us, %indvars.iv6383.us
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 800
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 8.000000e+02
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv6383.us, i64 %indvars.iv5981.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next60.us = add nuw nsw i64 %indvars.iv5981.us, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next60.us, 1100
  br i1 %exitcond10, label %for.inc7.us, label %for.inc.us

for.inc7.us:                                      ; preds = %for.inc.us
  %indvars.iv.next64.us = add nuw nsw i64 %indvars.iv6383.us, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next64.us, 800
  br i1 %exitcond11, label %for.cond14.preheader.us.preheader, label %for.cond1.preheader.us

for.cond14.preheader.us.preheader:                ; preds = %for.inc7.us
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.inc31.us
  %indvars.iv5778.us = phi i64 [ %indvars.iv.next58.us, %for.inc31.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us, %for.cond14.preheader.us
  %indvars.iv5476.us = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next55.us.1, %for.inc28.us ]
  %indvars.iv.next55.us = or i64 %indvars.iv5476.us, 1
  %3 = mul nuw nsw i64 %indvars.iv.next55.us, %indvars.iv5778.us
  %4 = trunc i64 %3 to i32
  %rem20.us = srem i32 %4, 900
  %conv21.us = sitofp i32 %rem20.us to double
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv5778.us, i64 %indvars.iv5476.us
  %indvars.iv.next55.us.1 = add nsw i64 %indvars.iv5476.us, 2
  %5 = mul nuw nsw i64 %indvars.iv.next55.us.1, %indvars.iv5778.us
  %6 = trunc i64 %5 to i32
  %rem20.us.1 = srem i32 %6, 900
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.v.i0.1 = insertelement <2 x double> undef, double %conv21.us, i32 0
  %div23.us.v.i0.2 = insertelement <2 x double> %div23.us.v.i0.1, double %conv21.us.1, i32 1
  %div23.us = fdiv <2 x double> %div23.us.v.i0.2, <double 9.000000e+02, double 9.000000e+02>
  %7 = bitcast double* %arrayidx27.us to <2 x double>*
  store <2 x double> %div23.us, <2 x double>* %7, align 8
  %exitcond8.1 = icmp eq i64 %indvars.iv.next55.us.1, 900
  br i1 %exitcond8.1, label %for.inc31.us, label %for.inc28.us

for.inc31.us:                                     ; preds = %for.inc28.us
  %indvars.iv.next58.us = add nuw nsw i64 %indvars.iv5778.us, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next58.us, 1100
  br i1 %exitcond9, label %for.cond38.preheader.us.preheader, label %for.cond14.preheader.us

for.cond38.preheader.us.preheader:                ; preds = %for.inc31.us
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.inc56.us
  %indvars.iv5273.us = phi i64 [ %indvars.iv.next53.us, %for.inc56.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.inc53.us

for.inc53.us:                                     ; preds = %for.inc53.us, %for.cond38.preheader.us
  %indvars.iv4771.us = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next48.us, %for.inc53.us ]
  %8 = add nuw nsw i64 %indvars.iv4771.us, 3
  %9 = mul nuw nsw i64 %8, %indvars.iv5273.us
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %rem45.us = srem i32 %11, 1200
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, 1.200000e+03
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv5273.us, i64 %indvars.iv4771.us
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next48.us = add nuw nsw i64 %indvars.iv4771.us, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next48.us, 1200
  br i1 %exitcond6, label %for.inc56.us, label %for.inc53.us

for.inc56.us:                                     ; preds = %for.inc53.us
  %indvars.iv.next53.us = add nuw nsw i64 %indvars.iv5273.us, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next53.us, 900
  br i1 %exitcond7, label %for.cond63.preheader.us.preheader, label %for.cond38.preheader.us

for.cond63.preheader.us.preheader:                ; preds = %for.inc56.us
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.preheader.us.preheader, %for.inc80.us
  %indvars.iv4568.us = phi i64 [ %indvars.iv.next46.us, %for.inc80.us ], [ 0, %for.cond63.preheader.us.preheader ]
  br label %for.inc77.us

for.inc77.us:                                     ; preds = %for.inc77.us, %for.cond63.preheader.us
  %indvars.iv66.us = phi i64 [ 0, %for.cond63.preheader.us ], [ %indvars.iv.next.us, %for.inc77.us ]
  %12 = add nuw nsw i64 %indvars.iv66.us, 2
  %13 = mul nuw nsw i64 %12, %indvars.iv4568.us
  %14 = trunc i64 %13 to i32
  %rem69.us = srem i32 %14, 1100
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, 1.100000e+03
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv4568.us, i64 %indvars.iv66.us
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv66.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.inc80.us, label %for.inc77.us

for.inc80.us:                                     ; preds = %for.inc77.us
  %indvars.iv.next46.us = add nuw nsw i64 %indvars.iv4568.us, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next46.us, 800
  br i1 %exitcond5, label %for.end82, label %for.cond63.preheader.us

for.end82:                                        ; preds = %for.inc80.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
for.cond4.preheader.us.preheader:
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.inc28.us, %for.cond4.preheader.us.preheader
  %indvars.iv3955.us = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next40.us, %for.inc28.us ]
  br label %for.body6.us.us

for.inc28.us:                                     ; preds = %for.inc25.us.us
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv3955.us, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next40.us, 800
  br i1 %exitcond10, label %for.body36.us.us.preheader.preheader, label %for.body6.us.us.preheader

for.body36.us.us.preheader.preheader:             ; preds = %for.inc28.us
  br label %for.body36.us.us.preheader

for.body6.us.us:                                  ; preds = %for.inc25.us.us, %for.body6.us.us.preheader
  %indvars.iv3752.us.us = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next38.us.us, %for.inc25.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv3955.us, i64 %indvars.iv3752.us.us
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br label %for.inc.us.us

for.inc25.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next38.us.us = add nuw nsw i64 %indvars.iv3752.us.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next38.us.us, 900
  br i1 %exitcond8, label %for.inc28.us, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body6.us.us
  %0 = phi double [ 0.000000e+00, %for.body6.us.us ], [ %add.us.us.1, %for.inc.us.us ]
  %indvars.iv3550.us.us = phi i64 [ 0, %for.body6.us.us ], [ %indvars.iv.next36.us.us.1, %for.inc.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv3955.us, i64 %indvars.iv3550.us.us
  %1 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %1, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv3550.us.us, i64 %indvars.iv3752.us.us
  %2 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %2
  %add.us.us = fadd double %0, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next36.us.us = or i64 %indvars.iv3550.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv3955.us, i64 %indvars.iv.next36.us.us
  %3 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %3, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next36.us.us, i64 %indvars.iv3752.us.us
  %4 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %4
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next36.us.us.1 = add nsw i64 %indvars.iv3550.us.us, 2
  %exitcond7.1 = icmp eq i64 %indvars.iv.next36.us.us.1, 1100
  br i1 %exitcond7.1, label %for.inc25.us.us, label %for.inc.us.us

for.body36.us.us.preheader:                       ; preds = %for.body36.us.us.preheader.preheader, %for.inc65.us
  %indvars.iv3347.us = phi i64 [ %indvars.iv.next34.us, %for.inc65.us ], [ 0, %for.body36.us.us.preheader.preheader ]
  br label %for.body36.us.us

for.inc65.us:                                     ; preds = %for.inc62.us.us
  %indvars.iv.next34.us = add nuw nsw i64 %indvars.iv3347.us, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next34.us, 800
  br i1 %exitcond6, label %for.end67, label %for.body36.us.us.preheader

for.body36.us.us:                                 ; preds = %for.inc62.us.us, %for.body36.us.us.preheader
  %indvars.iv3144.us.us = phi i64 [ 0, %for.body36.us.us.preheader ], [ %indvars.iv.next32.us.us, %for.inc62.us.us ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv3347.us, i64 %indvars.iv3144.us.us
  %5 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %5, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br label %for.inc59.us.us

for.inc62.us.us:                                  ; preds = %for.inc59.us.us
  %indvars.iv.next32.us.us = add nuw nsw i64 %indvars.iv3144.us.us, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next32.us.us, 1200
  br i1 %exitcond5, label %for.inc65.us, label %for.body36.us.us

for.inc59.us.us:                                  ; preds = %for.inc59.us.us, %for.body36.us.us
  %6 = phi double [ %mul41.us.us, %for.body36.us.us ], [ %add58.us.us.2, %for.inc59.us.us ]
  %indvars.iv42.us.us = phi i64 [ 0, %for.body36.us.us ], [ %indvars.iv.next.us.us.2, %for.inc59.us.us ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv3347.us, i64 %indvars.iv42.us.us
  %7 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv42.us.us, i64 %indvars.iv3144.us.us
  %8 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %7, %8
  %add58.us.us = fadd double %6, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv42.us.us, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv3347.us, i64 %indvars.iv.next.us.us
  %9 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next.us.us, i64 %indvars.iv3144.us.us
  %10 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %9, %10
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv42.us.us, 2
  %arrayidx48.us.us.2 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv3347.us, i64 %indvars.iv.next.us.us.1
  %11 = load double, double* %arrayidx48.us.us.2, align 8
  %arrayidx52.us.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next.us.us.1, i64 %indvars.iv3144.us.us
  %12 = load double, double* %arrayidx52.us.us.2, align 8
  %mul53.us.us.2 = fmul double %11, %12
  %add58.us.us.2 = fadd double %add58.us.us.1, %mul53.us.us.2
  store double %add58.us.us.2, double* %arrayidx40.us.us, align 8
  %indvars.iv.next.us.us.2 = add nsw i64 %indvars.iv42.us.us, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.us.us.2, 900
  br i1 %exitcond.2, label %for.inc62.us.us, label %for.inc59.us.us

for.end67:                                        ; preds = %for.inc65.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %D) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %for.cond2.preheader.us.preheader
  %indvars.iv915.us = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next10.us, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv915.us, 800
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv13.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv13.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv915.us, i64 %indvars.iv13.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv13.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv915.us, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next10.us, 800
  br i1 %exitcond2, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
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

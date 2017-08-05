; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc27, %entry
  %indvars.iv1015 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc27 ]
  %exitcond12 = icmp eq i64 %indvars.iv1015, 0
  br i1 %exitcond12, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %xtraiter = and i64 %indvars.iv1015, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.preheader
  %0 = trunc i64 %indvars.iv1015 to i32
  %rem.prol = srem i32 %0, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1015, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.preheader
  %indvars.iv13.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.preheader ]
  %1 = icmp eq i64 %indvars.iv1015, 1
  br i1 %1, label %for.end, label %for.body3.preheader3

for.body3.preheader3:                             ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader3, %for.body3
  %indvars.iv13 = phi i64 [ %indvars.iv.next.1, %for.body3 ], [ %indvars.iv13.unr.ph, %for.body3.preheader3 ]
  %2 = add nuw nsw i64 %indvars.iv13, %indvars.iv1015
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1015, i64 %indvars.iv13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %4 = add nuw nsw i64 %indvars.iv.next, %indvars.iv1015
  %5 = trunc i64 %4 to i32
  %rem.1 = srem i32 %5, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %6 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv1015
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv1015, i64 %indvars.iv1015
  store double 1.000000e+00, double* %arrayidx10, align 8
  %7 = add nuw nsw i64 %indvars.iv1015, 1200
  br label %for.body14

for.body14:                                       ; preds = %for.body14, %for.end
  %indvars.iv614 = phi i64 [ 0, %for.end ], [ %indvars.iv.next7.1, %for.body14 ]
  %8 = sub nuw nsw i64 %7, %indvars.iv614
  %9 = trunc i64 %8 to i32
  %rem16 = srem i32 %9, 1200
  %conv17 = sitofp i32 %rem16 to double
  %arrayidx23 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv1015, i64 %indvars.iv614
  %indvars.iv.next7 = or i64 %indvars.iv614, 1
  %10 = sub nuw nsw i64 %7, %indvars.iv.next7
  %11 = trunc i64 %10 to i32
  %rem16.1 = srem i32 %11, 1200
  %conv17.1 = sitofp i32 %rem16.1 to double
  %div19.v.i0.1 = insertelement <2 x double> undef, double %conv17, i32 0
  %div19.v.i0.2 = insertelement <2 x double> %div19.v.i0.1, double %conv17.1, i32 1
  %div19 = fdiv <2 x double> %div19.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %12 = bitcast double* %arrayidx23 to <2 x double>*
  store <2 x double> %div19, <2 x double>* %12, align 8
  %indvars.iv.next7.1 = add nsw i64 %indvars.iv614, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next7.1, 1200
  br i1 %exitcond16.1, label %for.inc27, label %for.body14

for.inc27:                                        ; preds = %for.body14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1015, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond17, label %for.end29, label %for.cond1.preheader

for.end29:                                        ; preds = %for.inc27
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us.2.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc30, %entry
  %indvars.iv713 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.inc30 ]
  %exitcond10 = icmp eq i64 %indvars.iv713, 999
  br i1 %exitcond10, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %2 = sub i64 999, %indvars.iv713
  %xtraiter = and i64 %2, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %3 = icmp eq i64 %indvars.iv713, 998
  %indvars.iv.next411.prol = add nuw nsw i64 %indvars.iv713, 1
  %arrayidx8.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next411.prol, i64 %indvars.iv713
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.cond4.preheader.us
  %indvars.iv512.us = phi i64 [ %indvars.iv.next6.us.4, %for.cond4.preheader.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx21.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv713, i64 %indvars.iv512.us
  %4 = bitcast double* %arrayidx21.us to <2 x double>*
  %5 = load <2 x double>, <2 x double>* %4, align 8
  %mul22.us = fmul <2 x double> %5, %mul22.us.v.i1.2
  %6 = bitcast double* %arrayidx21.us to <2 x double>*
  store <2 x double> %mul22.us, <2 x double>* %6, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv512.us, 2
  %arrayidx21.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv713, i64 %indvars.iv.next6.us.1
  %7 = bitcast double* %arrayidx21.us.2 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul22.us.2 = fmul <2 x double> %8, %mul22.us.2.v.i1.2
  %9 = bitcast double* %arrayidx21.us.2 to <2 x double>*
  store <2 x double> %mul22.us.2, <2 x double>* %9, align 8
  %indvars.iv.next6.us.3 = add nsw i64 %indvars.iv512.us, 4
  %arrayidx21.us.4 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv713, i64 %indvars.iv.next6.us.3
  %10 = load double, double* %arrayidx21.us.4, align 8
  %mul22.us.4 = fmul double %10, %alpha
  store double %mul22.us.4, double* %arrayidx21.us.4, align 8
  %indvars.iv.next6.us.4 = add nsw i64 %indvars.iv512.us, 5
  %exitcond17.4 = icmp eq i64 %indvars.iv.next6.us.4, 1200
  br i1 %exitcond17.4, label %for.inc30.loopexit, label %for.cond4.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv512 = phi i64 [ %indvars.iv.next6, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv713, i64 %indvars.iv512
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.cond4.preheader
  %11 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next411.prol, i64 %indvars.iv512
  %12 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %11, %12
  %13 = load double, double* %arrayidx16, align 8
  %add17.prol = fadd double %13, %mul.prol
  store double %add17.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.cond4.preheader
  %indvars.iv.next411.in.unr.ph = phi i64 [ %indvars.iv.next411.prol, %for.body6.prol ], [ %indvars.iv713, %for.cond4.preheader ]
  br i1 %3, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.preheader, %for.body6
  %indvars.iv.next411.in = phi i64 [ %indvars.iv.next411.1, %for.body6 ], [ %indvars.iv.next411.in.unr.ph, %for.body6.preheader ]
  %indvars.iv.next411 = add nuw nsw i64 %indvars.iv.next411.in, 1
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next411, i64 %indvars.iv713
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next411, i64 %indvars.iv512
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %add17 = fadd double %16, %mul
  store double %add17, double* %arrayidx16, align 8
  %indvars.iv.next411.1 = add nsw i64 %indvars.iv.next411.in, 2
  %arrayidx8.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next411.1, i64 %indvars.iv713
  %17 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next411.1, i64 %indvars.iv512
  %18 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %17, %18
  %19 = load double, double* %arrayidx16, align 8
  %add17.1 = fadd double %19, %mul.1
  store double %add17.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next411.1, 999
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body6.prol.loopexit
  %arrayidx21 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv713, i64 %indvars.iv512
  %20 = load double, double* %arrayidx21, align 8
  %mul22 = fmul double %20, %alpha
  store double %mul22, double* %arrayidx21, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond16, label %for.inc30.loopexit3, label %for.cond4.preheader

for.inc30.loopexit:                               ; preds = %for.cond4.preheader.us
  br label %for.inc30

for.inc30.loopexit3:                              ; preds = %for.end
  br label %for.inc30

for.inc30:                                        ; preds = %for.inc30.loopexit3, %for.inc30.loopexit
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv713, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond18, label %for.end32, label %for.cond1.preheader

for.end32:                                        ; preds = %for.inc30
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv37, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond8, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

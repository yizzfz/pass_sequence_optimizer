; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %0 = bitcast i8* %call to [1900 x double]*
  %arraydecay52 = bitcast i8* %call4 to double*
  %1 = bitcast i8* %call3 to double*
  tail call void @init_array([1900 x double]* %0, double* %arraydecay52, double* %1)
  tail call void (...) @polybench_timer_start() #4
  %2 = bitcast i8* %call1 to double*
  %3 = bitcast i8* %call2 to double*
  %4 = bitcast i8* %call4 to double*
  tail call void @kernel_bicg([1900 x double]* %0, double* %2, double* %3, double* %1, double* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %5 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %5, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %6 = bitcast i8* %call2 to double*
  %7 = bitcast i8* %call1 to double*
  tail call void @print_array(double* %7, double* %6)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1900 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) #2 {
entry:
  br label %for.inc

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %0 = trunc i64 %indvars.iv24 to i32
  %rem6.us = srem i32 %0, 2100
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, 2.100000e+03
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv24
  store double %div9.us, double* %arrayidx11.us, align 8
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.body5.us, %for.inc24.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc24.us ], [ 0, %for.body5.us ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %1 = mul nsw i64 %indvars.iv24, %indvars.iv.next
  %2 = trunc i64 %1 to i32
  %rem16.us = srem i32 %2, 2100
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %3 = mul nsw i64 %indvars.iv24, %indvars.iv.next.1
  %4 = trunc i64 %3 to i32
  %rem16.us.1 = srem i32 %4, 2100
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %5 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %5, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.inc24.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 2100
  br i1 %exitcond, label %for.end29, label %for.body5.us

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30.1, %for.inc ]
  %6 = trunc i64 %indvars.iv29 to i32
  %conv = sitofp i32 %6 to double
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv29
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %7 = trunc i64 %indvars.iv.next30 to i32
  %conv.1 = sitofp i32 %7 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.900000e+03, double 1.900000e+03>
  %8 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %8, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1900
  br i1 %exitcond32.1, label %for.body5.us.preheader, label %for.inc

for.body5.us.preheader:                           ; preds = %for.inc
  br label %for.body5.us

for.end29:                                        ; preds = %for.cond12.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg([1900 x double]* nocapture readonly %A, double* nocapture %s, double* %q, double* nocapture readonly %p, double* %r) #2 {
entry:
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %entry
  %index = phi i64 [ 0, %entry ], [ %index.next.4, %vector.body ]
  %0 = getelementptr inbounds double, double* %s, i64 %index
  %1 = bitcast double* %0 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %3, align 8
  %index.next = add nuw nsw i64 %index, 4
  %4 = getelementptr inbounds double, double* %s, i64 %index.next
  %5 = bitcast double* %4 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %5, align 8
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %index.next.1 = add nsw i64 %index, 8
  %8 = getelementptr inbounds double, double* %s, i64 %index.next.1
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.2 = add nsw i64 %index, 12
  %12 = getelementptr inbounds double, double* %s, i64 %index.next.2
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %index.next.3 = add nsw i64 %index, 16
  %16 = getelementptr inbounds double, double* %s, i64 %index.next.3
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %19, align 8
  %index.next.4 = add nsw i64 %index, 20
  %20 = icmp eq i64 %index.next.4, 1900
  br i1 %20, label %for.body3.us.preheader, label %vector.body, !llvm.loop !1

for.body3.us.preheader:                           ; preds = %vector.body
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.cond6.for.inc34_crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %sext = shl i64 %indvars.iv17, 32
  %idxprom4.us = ashr exact i64 %sext, 32
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %idxprom4.us
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %21 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr23 = mul i64 %indvars.iv17, 8
  %sunkaddr24 = add i64 %sunkaddr, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  %22 = load double, double* %sunkaddr25, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv
  %23 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %22, %23
  %add.us = fadd double %21, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %sunkaddr26 = ptrtoint double* %q to i64
  %sunkaddr27 = mul i64 %indvars.iv17, 8
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %24 = load double, double* %sunkaddr29, align 8
  %25 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %26 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %25, %26
  %add28.us = fadd double %24, %mul27.us
  store double %add28.us, double* %sunkaddr29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.inc31.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next18, 2100
  br i1 %exitcond30, label %for.end36, label %for.body3.us

for.end36:                                        ; preds = %for.cond6.for.inc34_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %s, double* nocapture readonly %q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.inc ]
  %storemerge10 = phi i32 [ 0, %entry ], [ %6, %for.inc ]
  %rem = srem i32 %storemerge10, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %for.inc

for.inc:                                          ; preds = %if.then, %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv13
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %6 = trunc i64 %indvars.iv.next14 to i32
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1900
  br i1 %exitcond16, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.body9

for.body9:                                        ; preds = %for.inc18, %for.end
  %indvars.iv = phi i64 [ 0, %for.end ], [ %indvars.iv.next, %for.inc18 ]
  %storemerge16 = phi i32 [ 0, %for.end ], [ %12, %for.inc18 ]
  %rem10 = srem i32 %storemerge16, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %for.inc18

for.inc18:                                        ; preds = %if.then12, %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %11 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end20, label %for.body9

for.end20:                                        ; preds = %for.inc18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}

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
  %arraydecay = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call void @init_array([1900 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay7 = bitcast i8* %call to [1900 x double]*
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  %arraydecay10 = bitcast i8* %call3 to double*
  %arraydecay11 = bitcast i8* %call4 to double*
  tail call void @kernel_bicg([1900 x double]* %arraydecay7, double* %arraydecay8, double* %arraydecay9, double* %arraydecay10, double* %arraydecay11)
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
  %arraydecay13 = bitcast i8* %call1 to double*
  %arraydecay14 = bitcast i8* %call2 to double*
  tail call void @print_array(double* %arraydecay13, double* %arraydecay14)
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
for.inc.lr.ph:
  br label %for.inc

for.body5.us:                                     ; preds = %for.body5.us.preheader, %for.cond12.for.inc27_crit_edge.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %0 = trunc i64 %indvars.iv35 to i32
  %conv7.us = sitofp i32 %0 to double
  %div9.us = fdiv double %conv7.us, 2.100000e+03
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv35
  store double %div9.us, double* %arrayidx11.us, align 8
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.body5.us
  %indvars.iv.us = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.us.1, %for.inc24.us ]
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %1 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv35
  %2 = trunc i64 %1 to i32
  %rem16.us = srem i32 %2, 2100
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv.us
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %3 = mul nuw nsw i64 %indvars.iv.next.us.1, %indvars.iv35
  %4 = trunc i64 %3 to i32
  %rem16.us.1 = srem i32 %4, 2100
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %5 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %5, align 8
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1900
  br i1 %exitcond.us.1, label %for.cond12.for.inc27_crit_edge.us, label %for.inc24.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.inc24.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 2100
  br i1 %exitcond38, label %for.end29, label %for.body5.us

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv31 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next32.1.1, %for.inc ]
  %6 = trunc i64 %indvars.iv31 to i32
  %conv = sitofp i32 %6 to double
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv31
  %7 = trunc i64 %indvars.iv31 to i32
  %8 = or i32 %7, 1
  %conv.1 = sitofp i32 %8 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.900000e+03, double 1.900000e+03>
  %9 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %9, align 8
  %indvars.iv.next32.1 = or i64 %indvars.iv31, 2
  %10 = trunc i64 %indvars.iv.next32.1 to i32
  %conv.11 = sitofp i32 %10 to double
  %arrayidx.1 = getelementptr inbounds double, double* %p, i64 %indvars.iv.next32.1
  %11 = trunc i64 %indvars.iv.next32.1 to i32
  %12 = or i32 %11, 1
  %conv.1.1 = sitofp i32 %12 to double
  %div.v.i0.1.1 = insertelement <2 x double> undef, double %conv.11, i32 0
  %div.v.i0.2.1 = insertelement <2 x double> %div.v.i0.1.1, double %conv.1.1, i32 1
  %div.1 = fdiv <2 x double> %div.v.i0.2.1, <double 1.900000e+03, double 1.900000e+03>
  %13 = bitcast double* %arrayidx.1 to <2 x double>*
  store <2 x double> %div.1, <2 x double>* %13, align 8
  %indvars.iv.next32.1.1 = add nsw i64 %indvars.iv31, 4
  %exitcond34.1.1 = icmp eq i64 %indvars.iv.next32.1.1, 1900
  br i1 %exitcond34.1.1, label %for.body5.us.preheader, label %for.inc

for.body5.us.preheader:                           ; preds = %for.inc
  br label %for.body5.us

for.end29:                                        ; preds = %for.cond12.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg([1900 x double]* nocapture readonly %A, double* nocapture %s, double* %q, double* nocapture readonly %p, double* %r) #2 {
for.body3.lr.ph.split.us:
  %s2 = bitcast double* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %s2, i8 0, i64 15200, i32 8, i1 false)
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.lr.ph.split.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.lr.ph.split.us ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv37
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  br label %for.inc31.us

for.inc31.us:                                     ; preds = %for.inc31.us, %for.body3.us
  %indvars.iv.us = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next.us, %for.inc31.us ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv.us
  %0 = load double, double* %arrayidx10.us, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr14 = mul i64 %indvars.iv37, 8
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  %1 = load double, double* %sunkaddr16, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.us
  %2 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  %arrayidx18.us = getelementptr inbounds double, double* %s, i64 %indvars.iv.us
  store double %add.us, double* %arrayidx18.us, align 8
  %sunkaddr17 = ptrtoint double* %q to i64
  %sunkaddr18 = mul i64 %indvars.iv37, 8
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  %3 = load double, double* %sunkaddr20, align 8
  %arrayidx24.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.us
  %4 = load double, double* %arrayidx24.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv.us
  %5 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %4, %5
  %add28.us = fadd double %3, %mul27.us
  %sunkaddr21 = ptrtoint double* %q to i64
  %sunkaddr22 = mul i64 %indvars.iv37, 8
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  store double %add28.us, double* %sunkaddr24, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1900
  br i1 %exitcond.us, label %for.cond6.for.inc34_crit_edge.us, label %for.inc31.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.inc31.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 2100
  br i1 %exitcond40, label %for.end36, label %for.body3.us

for.end36:                                        ; preds = %for.cond6.for.inc34_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %s, double* nocapture readonly %q) #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.inc ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv15 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc10 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv15
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1900
  br i1 %exitcond18, label %for.body9.preheader, label %for.body

for.body9.preheader:                              ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.body9

for.body9:                                        ; preds = %for.inc18, %for.body9.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc18 ], [ 0, %for.body9.preheader ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.inc18

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %for.inc18

for.inc18:                                        ; preds = %for.body9, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end20, label %for.body9

for.end20:                                        ; preds = %for.inc18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv2429 = phi i64 [ 0, %entry ], [ %indvars.iv.next25.1, %for.body ]
  %0 = trunc i64 %indvars.iv2429 to i32
  %rem = srem i32 %0, 1900
  %conv = sitofp i32 %rem to double
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv2429
  %1 = trunc i64 %indvars.iv2429 to i32
  %2 = or i32 %1, 1
  %rem.1 = srem i32 %2, 1900
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.900000e+03, double 1.900000e+03>
  %3 = bitcast double* %arrayidx to <2 x double>*
  store <2 x double> %div, <2 x double>* %3, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv2429, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next25.1, 1900
  br i1 %exitcond26.1, label %for.body5.preheader, label %for.body

for.body5.preheader:                              ; preds = %for.body
  br label %for.body5

for.body5:                                        ; preds = %for.body5.preheader, %for.inc27
  %indvars.iv2128 = phi i64 [ %indvars.iv.next22, %for.inc27 ], [ 0, %for.body5.preheader ]
  %4 = trunc i64 %indvars.iv2128 to i32
  %rem6 = srem i32 %4, 2100
  %conv7 = sitofp i32 %rem6 to double
  %div9 = fdiv double %conv7, 2.100000e+03
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv2128
  store double %div9, double* %arrayidx11, align 8
  br label %for.body15

for.body15:                                       ; preds = %for.body15, %for.body5
  %indvars.iv27 = phi i64 [ 0, %for.body5 ], [ %indvars.iv.next.1, %for.body15 ]
  %indvars.iv.next = or i64 %indvars.iv27, 1
  %5 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2128
  %6 = trunc i64 %5 to i32
  %rem16 = srem i32 %6, 2100
  %conv17 = sitofp i32 %rem16 to double
  %arrayidx23 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv2128, i64 %indvars.iv27
  %indvars.iv.next.1 = add nsw i64 %indvars.iv27, 2
  %7 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv2128
  %8 = trunc i64 %7 to i32
  %rem16.1 = srem i32 %8, 2100
  %conv17.1 = sitofp i32 %rem16.1 to double
  %div19.v.i0.1 = insertelement <2 x double> undef, double %conv17, i32 0
  %div19.v.i0.2 = insertelement <2 x double> %div19.v.i0.1, double %conv17.1, i32 1
  %div19 = fdiv <2 x double> %div19.v.i0.2, <double 2.100000e+03, double 2.100000e+03>
  %9 = bitcast double* %arrayidx23 to <2 x double>*
  store <2 x double> %div19, <2 x double>* %9, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %for.inc27, label %for.body15

for.inc27:                                        ; preds = %for.body15
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2128, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 2100
  br i1 %exitcond23, label %for.end29, label %for.body5

for.end29:                                        ; preds = %for.inc27
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_bicg([1900 x double]* nocapture readonly %A, double* nocapture %s, double* %q, double* nocapture readonly %p, double* %r) #0 {
for.body3.preheader:
  %s2 = bitcast double* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %s2, i8 0, i64 15200, i32 8, i1 false)
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc34
  %indvars.iv2330 = phi i64 [ %indvars.iv.next24, %for.inc34 ], [ 0, %for.body3.preheader ]
  %arrayidx5 = getelementptr inbounds double, double* %q, i64 %indvars.iv2330
  store double 0.000000e+00, double* %arrayidx5, align 8
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.body3
  %indvars.iv29 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next, %for.body8 ]
  %arrayidx10 = getelementptr inbounds double, double* %s, i64 %indvars.iv29
  %0 = load double, double* %arrayidx10, align 8
  %sunkaddr = ptrtoint double* %r to i64
  %sunkaddr14 = mul i64 %indvars.iv2330, 8
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  %1 = load double, double* %sunkaddr16, align 8
  %arrayidx16 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv2330, i64 %indvars.iv29
  %2 = load double, double* %arrayidx16, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  %arrayidx18 = getelementptr inbounds double, double* %s, i64 %indvars.iv29
  store double %add, double* %arrayidx18, align 8
  %sunkaddr17 = ptrtoint double* %q to i64
  %sunkaddr18 = mul i64 %indvars.iv2330, 8
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  %3 = load double, double* %sunkaddr20, align 8
  %arrayidx24 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv2330, i64 %indvars.iv29
  %4 = load double, double* %arrayidx24, align 8
  %arrayidx26 = getelementptr inbounds double, double* %p, i64 %indvars.iv29
  %5 = load double, double* %arrayidx26, align 8
  %mul27 = fmul double %4, %5
  %add28 = fadd double %3, %mul27
  %sunkaddr21 = ptrtoint double* %q to i64
  %sunkaddr22 = mul i64 %indvars.iv2330, 8
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  store double %add28, double* %sunkaddr24, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond, label %for.inc34, label %for.body8

for.inc34:                                        ; preds = %for.body8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2330, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 2100
  br i1 %exitcond25, label %for.end36, label %for.body3

for.end36:                                        ; preds = %for.inc34
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %s, double* nocapture readonly %q) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1115 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %if.end ]
  %3 = trunc i64 %indvars.iv1115 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc10 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv1115
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1115, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1900
  br i1 %exitcond13, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.end
  %indvars.iv14 = phi i64 [ 0, %for.end ], [ %indvars.iv.next, %if.end14 ]
  %9 = trunc i64 %indvars.iv14 to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %if.end14

if.end14:                                         ; preds = %if.then12, %for.body9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv14
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end20, label %for.body9

for.end20:                                        ; preds = %if.end14
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

; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay7 = bitcast i8* %call1 to [1300 x double]*
  %arraydecay8 = bitcast i8* %call4 to double*
  call void @init_array(i32 1300, double* nonnull %alpha, double* nonnull %beta, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay11 = bitcast i8* %call2 to double*
  %arraydecay13 = bitcast i8* %call6 to double*
  tail call void @kernel_gesummv(i32 1300, double %0, double %1, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay11, double* %arraydecay8, double* %arraydecay13)
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
  %3 = bitcast i8* %call6 to double*
  tail call void @print_array(i32 1300, double* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B, double* nocapture %x) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc24, %entry
  %indvars.iv59 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc24 ]
  %0 = trunc i64 %indvars.iv59 to i32
  %rem = srem i32 %0, 1300
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.300000e+03
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv59
  store double %div, double* %arrayidx, align 8
  br label %for.body5

for.body5:                                        ; preds = %for.body5, %for.body
  %indvars.iv8 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body5 ]
  %1 = mul nuw nsw i64 %indvars.iv8, %indvars.iv59
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem6 = srem i32 %3, 1300
  %conv7 = sitofp i32 %rem6 to double
  %div9 = fdiv double %conv7, 1.300000e+03
  %arrayidx13 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv8
  store double %div9, double* %arrayidx13, align 8
  %4 = add nuw nsw i64 %1, 2
  %5 = trunc i64 %4 to i32
  %rem16 = srem i32 %5, 1300
  %conv17 = sitofp i32 %rem16 to double
  %div19 = fdiv double %conv17, 1.300000e+03
  %arrayidx23 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv59, i64 %indvars.iv8
  store double %div19, double* %arrayidx23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.inc24, label %for.body5

for.inc24:                                        ; preds = %for.body5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1300
  br i1 %exitcond7, label %for.end26, label %for.body

for.end26:                                        ; preds = %for.inc24
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gesummv(i32 %n, double %alpha, double %beta, [1300 x double]* nocapture readonly %A, [1300 x double]* nocapture readonly %B, double* nocapture %tmp, double* nocapture readonly %x, double* nocapture %y) #2 {
entry:
  %sunkaddr31 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr27 = ptrtoint double* %y to i64
  %sunkaddr35 = ptrtoint double* %y to i64
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv221 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %arrayidx = getelementptr inbounds double, double* %tmp, i64 %indvars.iv221
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx4 = getelementptr inbounds double, double* %y, i64 %indvars.iv221
  store double 0.000000e+00, double* %arrayidx4, align 8
  %sunkaddr24 = shl i64 %indvars.iv221, 3
  %sunkaddr25 = add i64 %sunkaddr, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %sunkaddr28 = shl i64 %indvars.iv221, 3
  %sunkaddr29 = add i64 %sunkaddr27, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  br label %for.body7

for.body7:                                        ; preds = %for.body7, %for.body
  %indvars.iv20 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %for.body7 ]
  %arrayidx11 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv221, i64 %indvars.iv20
  %0 = load double, double* %arrayidx11, align 8
  %arrayidx13 = getelementptr inbounds double, double* %x, i64 %indvars.iv20
  %1 = load double, double* %arrayidx13, align 8
  %mul = fmul double %0, %1
  %2 = load double, double* %sunkaddr26, align 8
  %add = fadd double %mul, %2
  store double %add, double* %sunkaddr26, align 8
  %arrayidx21 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv221, i64 %indvars.iv20
  %3 = load double, double* %arrayidx21, align 8
  %4 = load double, double* %arrayidx13, align 8
  %mul24 = fmul double %3, %4
  %5 = load double, double* %sunkaddr30, align 8
  %add27 = fadd double %mul24, %5
  store double %add27, double* %sunkaddr30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %for.body7
  %sunkaddr32 = shl i64 %indvars.iv221, 3
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %6 = load double, double* %sunkaddr34, align 8
  %mul32 = fmul double %6, %alpha
  %mul35 = fmul double %add27, %beta
  %add36 = fadd double %mul32, %mul35
  %sunkaddr36 = shl i64 %indvars.iv221, 3
  %sunkaddr37 = add i64 %sunkaddr35, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  store double %add36, double* %sunkaddr38, align 8
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv221, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1300
  br i1 %exitcond4, label %for.end41, label %for.body

for.end41:                                        ; preds = %for.end
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* nocapture readonly %y) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv1 = phi i64 [ 0, %entry ], [ %indvars.iv.next, %if.end ]
  %3 = trunc i64 %indvars.iv1 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv1
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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

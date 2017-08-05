; ModuleID = 'A.ll'
source_filename = "atax.c"
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
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #5
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #5
  %arraydecay = bitcast i8* %call to [2100 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  tail call void @init_array(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4)
  tail call void (...) @polybench_timer_start() #5
  %arraydecay7 = bitcast i8* %call2 to double*
  %arraydecay8 = bitcast i8* %call3 to double*
  tail call void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay7, double* %arraydecay8)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 2100, double* %arraydecay7)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  tail call void @free(i8* %call3) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, [2100 x double]* %A, double* %x) #2 {
for.inc.preheader:
  br label %for.inc

for.cond7.preheader.us:                           ; preds = %for.cond7.preheader.us.preheader, %for.cond7.for.inc22_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond7.for.inc22_crit_edge.us ], [ 0, %for.cond7.preheader.us.preheader ]
  br label %for.inc19.us

for.inc19.us:                                     ; preds = %for.inc19.us, %for.cond7.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond7.preheader.us ], [ %indvars.iv.next.1, %for.inc19.us ]
  %0 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %1 = trunc i64 %0 to i32
  %rem.us = srem i32 %1, 2100
  %conv12.us = sitofp i32 %rem.us to double
  %div14.us = fdiv double %conv12.us, 9.500000e+03
  %arrayidx18.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  store double %div14.us, double* %arrayidx18.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %3 = trunc i64 %2 to i32
  %rem.us.1 = srem i32 %3, 2100
  %conv12.us.1 = sitofp i32 %rem.us.1 to double
  %div14.us.1 = fdiv double %conv12.us.1, 9.500000e+03
  %arrayidx18.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %div14.us.1, double* %arrayidx18.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us, label %for.inc19.us

for.cond7.for.inc22_crit_edge.us:                 ; preds = %for.inc19.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1900
  br i1 %exitcond27, label %for.end24, label %for.cond7.preheader.us

for.inc:                                          ; preds = %for.inc, %for.inc.preheader
  %indvars.iv29 = phi i64 [ 0, %for.inc.preheader ], [ %indvars.iv.next30.2, %for.inc ]
  %4 = trunc i64 %indvars.iv29 to i32
  %conv2 = sitofp i32 %4 to double
  %div = fdiv double %conv2, 2.100000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv29
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %5 = trunc i64 %indvars.iv.next30 to i32
  %conv2.1 = sitofp i32 %5 to double
  %div.1 = fdiv double %conv2.1, 2.100000e+03
  %add.1 = fadd double %div.1, 1.000000e+00
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30
  store double %add.1, double* %arrayidx.1, align 8
  %indvars.iv.next30.1 = add nuw nsw i64 %indvars.iv29, 2
  %6 = trunc i64 %indvars.iv.next30.1 to i32
  %conv2.2 = sitofp i32 %6 to double
  %div.2 = fdiv double %conv2.2, 2.100000e+03
  %add.2 = fadd double %div.2, 1.000000e+00
  %arrayidx.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next30.1
  store double %add.2, double* %arrayidx.2, align 8
  %indvars.iv.next30.2 = add nuw nsw i64 %indvars.iv29, 3
  %exitcond32.2 = icmp eq i64 %indvars.iv.next30.2, 2100
  br i1 %exitcond32.2, label %for.cond7.preheader.us.preheader, label %for.inc

for.cond7.preheader.us.preheader:                 ; preds = %for.inc
  br label %for.cond7.preheader.us

for.end24:                                        ; preds = %for.cond7.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32 %m, i32 %n, [2100 x double]* %A, double* %x, double* %y, double* %tmp) #2 {
for.body5.us.preheader:
  %y84 = bitcast double* %y to i8*
  call void @llvm.memset.p0i8.i64(i8* %y84, i8 0, i64 16800, i32 8, i1 false)
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.inc42.us, %for.body5.us.preheader
  %indvars.iv70 = phi i64 [ 0, %for.body5.us.preheader ], [ %indvars.iv.next71, %for.inc42.us ]
  %arrayidx7.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv70
  store double 0.000000e+00, double* %arrayidx7.us, align 8
  br label %for.inc21.us

for.inc42.us:                                     ; preds = %for.inc39.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, 1900
  br i1 %exitcond73, label %for.end44, label %for.body5.us

for.inc39.us:                                     ; preds = %for.inc39.us.preheader, %for.inc39.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.2, %for.inc39.us ], [ 0, %for.inc39.us.preheader ]
  %arrayidx28.us = getelementptr inbounds double, double* %y, i64 %indvars.iv66
  %0 = load double, double* %arrayidx28.us, align 8
  %arrayidx32.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv66
  %1 = load double, double* %arrayidx32.us, align 8
  %2 = load double, double* %arrayidx7.us, align 8
  %mul35.us = fmul double %1, %2
  %add36.us = fadd double %0, %mul35.us
  store double %add36.us, double* %arrayidx28.us, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next67
  %3 = load double, double* %arrayidx28.us.1, align 8
  %arrayidx32.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next67
  %4 = load double, double* %arrayidx32.us.1, align 8
  %5 = load double, double* %arrayidx7.us, align 8
  %mul35.us.1 = fmul double %4, %5
  %add36.us.1 = fadd double %3, %mul35.us.1
  store double %add36.us.1, double* %arrayidx28.us.1, align 8
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  %arrayidx28.us.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next67.1
  %6 = load double, double* %arrayidx28.us.2, align 8
  %arrayidx32.us.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next67.1
  %7 = load double, double* %arrayidx32.us.2, align 8
  %8 = load double, double* %arrayidx7.us, align 8
  %mul35.us.2 = fmul double %7, %8
  %add36.us.2 = fadd double %6, %mul35.us.2
  store double %add36.us.2, double* %arrayidx28.us.2, align 8
  %indvars.iv.next67.2 = add nuw nsw i64 %indvars.iv66, 3
  %exitcond69.2 = icmp eq i64 %indvars.iv.next67.2, 2100
  br i1 %exitcond69.2, label %for.inc42.us, label %for.inc39.us

for.inc21.us:                                     ; preds = %for.inc21.us, %for.body5.us
  %indvars.iv = phi i64 [ 0, %for.body5.us ], [ %indvars.iv.next.2, %for.inc21.us ]
  %9 = load double, double* %arrayidx7.us, align 8
  %arrayidx16.us = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us, align 8
  %arrayidx18.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %11 = load double, double* %arrayidx18.us, align 8
  %mul.us = fmul double %10, %11
  %add.us = fadd double %9, %mul.us
  store double %add.us, double* %arrayidx7.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx16.us.1 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next
  %12 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx18.us.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx18.us.1, align 8
  %mul.us.1 = fmul double %12, %13
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx7.us, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx16.us.2 = getelementptr inbounds [2100 x double], [2100 x double]* %A, i64 %indvars.iv70, i64 %indvars.iv.next.1
  %14 = load double, double* %arrayidx16.us.2, align 8
  %arrayidx18.us.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next.1
  %15 = load double, double* %arrayidx18.us.2, align 8
  %mul.us.2 = fmul double %14, %15
  %add.us.2 = fadd double %add.us.1, %mul.us.2
  store double %add.us.2, double* %arrayidx7.us, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %for.inc39.us.preheader, label %for.inc21.us

for.inc39.us.preheader:                           ; preds = %for.inc21.us
  br label %for.inc39.us

for.end44:                                        ; preds = %for.inc42.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* %y) #0 {
for.body.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

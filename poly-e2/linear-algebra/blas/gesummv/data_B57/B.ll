; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call4 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %call6 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %0 = bitcast i8* %call to [1300 x double]*
  %1 = bitcast i8* %call1 to [1300 x double]*
  %2 = bitcast i8* %call4 to double*
  call fastcc void @init_array(i32 1300, double* nonnull %alpha, double* nonnull %beta, [1300 x double]* %0, [1300 x double]* %1, double* %2)
  call void (...) @polybench_timer_start() #4
  %3 = load double, double* %alpha, align 8
  %4 = load double, double* %beta, align 8
  %5 = bitcast i8* %call2 to double*
  %6 = bitcast i8* %call6 to double*
  call fastcc void @kernel_gesummv(i32 1300, double %3, double %4, [1300 x double]* %0, [1300 x double]* %1, double* %5, double* %2, double* %6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %7, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %8 = bitcast i8* %call6 to double*
  call fastcc void @print_array(i32 1300, double* %8)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [1300 x double]* %A, [1300 x double]* %B, double* %x) unnamed_addr #2 {
for.body.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc24_crit_edge.us, %for.body.us.preheader
  %indvars.iv16 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next17, %for.cond2.for.inc24_crit_edge.us ]
  %0 = trunc i64 %indvars.iv16 to i32
  %rem.us = srem i32 %0, 1300
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.300000e+03
  %arrayidx.us = getelementptr inbounds double, double* %x, i64 %indvars.iv16
  store double %div.us, double* %arrayidx.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %1 = trunc i64 %indvars.iv to i32
  %mul.us = mul nsw i32 %0, %1
  %add.us = add nsw i32 %mul.us, 1
  %rem6.us = srem i32 %add.us, 1300
  %conv7.us = sitofp i32 %rem6.us to double
  %div9.us = fdiv double %conv7.us, 1.300000e+03
  %arrayidx13.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv
  store double %div9.us, double* %arrayidx13.us, align 8
  %2 = mul nuw nsw i64 %indvars.iv, %indvars.iv16
  %3 = add nuw nsw i64 %2, 2
  %4 = trunc i64 %3 to i32
  %rem16.us = srem i32 %4, 1300
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, 1.300000e+03
  %arrayidx23.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv16, i64 %indvars.iv
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond2.for.inc24_crit_edge.us, label %for.inc.us

for.cond2.for.inc24_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 1300
  br i1 %exitcond19, label %for.end26, label %for.body.us

for.end26:                                        ; preds = %for.cond2.for.inc24_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32 %n, double %alpha, double %beta, [1300 x double]* %A, [1300 x double]* %B, double* %tmp, double* %x, double* %y) unnamed_addr #2 {
for.body.us.preheader:
  %0 = ptrtoint double* %y to i64
  %1 = ptrtoint double* %tmp to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr57 = ptrtoint double* %y to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond5.for.inc39_crit_edge.us, %for.body.us.preheader
  %indvars.iv15 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next16, %for.cond5.for.inc39_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv15
  store double 0.000000e+00, double* %arrayidx.us, align 8
  %arrayidx4.us = getelementptr inbounds double, double* %y, i64 %indvars.iv15
  store double 0.000000e+00, double* %arrayidx4.us, align 8
  %sunkaddr54 = shl i64 %indvars.iv15, 3
  %sunkaddr55 = add i64 %sunkaddr, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %sunkaddr58 = shl i64 %indvars.iv15, 3
  %sunkaddr59 = add i64 %sunkaddr57, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx11.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %2 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %3 = load double, double* %arrayidx13.us, align 8
  %mul.us = fmul double %2, %3
  %4 = load double, double* %sunkaddr56, align 8
  %add.us = fadd double %mul.us, %4
  store double %add.us, double* %sunkaddr56, align 8
  %arrayidx21.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv15, i64 %indvars.iv
  %5 = load double, double* %arrayidx21.us, align 8
  %6 = load double, double* %arrayidx13.us, align 8
  %mul24.us = fmul double %5, %6
  %7 = load double, double* %sunkaddr60, align 8
  %add27.us = fadd double %mul24.us, %7
  store double %add27.us, double* %sunkaddr60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.inc.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.inc.us
  %sunkaddr47 = shl i64 %indvars.iv15, 3
  %sunkaddr48 = add i64 %1, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %8 = load double, double* %sunkaddr49, align 8
  %mul32.us = fmul double %8, %alpha
  %mul35.us = fmul double %add27.us, %beta
  %add36.us = fadd double %mul32.us, %mul35.us
  %sunkaddr51 = shl i64 %indvars.iv15, 3
  %sunkaddr52 = add i64 %0, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  store double %add36.us, double* %sunkaddr53, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1300
  br i1 %exitcond18, label %for.end41, label %for.body.us

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %y) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.inc.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc.for.body_crit_edge ]
  %inc2 = phi i32 [ 0, %for.body.lr.ph ], [ %inc, %for.inc.for.body_crit_edge ]
  %rem = srem i32 %inc2, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %3) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %5 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %for.end, label %for.inc.for.body_crit_edge

for.inc.for.body_crit_edge:                       ; preds = %for.inc
  %inc = add nuw nsw i32 %inc2, 1
  br label %for.body

for.end:                                          ; preds = %for.inc
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %7) #5
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

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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  call fastcc void @init_array(i32 1300, double* nonnull %alpha, double* nonnull %beta, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay8)
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay11 = bitcast i8* %call2 to double*
  %arraydecay13 = bitcast i8* %call6 to double*
  call fastcc void @kernel_gesummv(i32 1300, double %0, double %1, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay7, double* %arraydecay11, double* %arraydecay8, double* %arraydecay13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1300, double* %arraydecay13)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %alpha, double* nocapture %beta, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B, double* nocapture %x) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.lr.ph, label %entry.for.end26_crit_edge

entry.for.end26_crit_edge:                        ; preds = %entry
  br label %for.end26

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div9.us.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge, %for.body.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge ], [ 0, %for.body.lr.ph ]
  %2 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %2 to double
  %div.us = fdiv double %conv.us, %conv1
  %arrayidx.us = getelementptr inbounds double, double* %x, i64 %indvars.iv6
  store double %div.us, double* %arrayidx.us, align 8
  br label %for.body5.us

for.body5.us:                                     ; preds = %for.body5.us.for.body5.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5.us.for.body5.us_crit_edge ], [ 0, %for.body.us ]
  %3 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %4 = add nuw nsw i64 %3, 1
  %5 = trunc i64 %4 to i32
  %rem6.us = srem i32 %5, %n
  %conv7.us = sitofp i32 %rem6.us to double
  %arrayidx13.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  %6 = add nuw nsw i64 %3, 2
  %7 = trunc i64 %6 to i32
  %rem16.us = srem i32 %7, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div9.us.v.i0.1 = insertelement <2 x double> undef, double %conv7.us, i32 0
  %div9.us.v.i0.2 = insertelement <2 x double> %div9.us.v.i0.1, double %conv17.us, i32 1
  %div9.us = fdiv <2 x double> %div9.us.v.i0.2, %div9.us.v.i1.2
  %div9.us.v.r1 = extractelement <2 x double> %div9.us, i32 0
  %div9.us.v.r2 = extractelement <2 x double> %div9.us, i32 1
  store double %div9.us.v.r1, double* %arrayidx13.us, align 8
  %arrayidx23.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv6, i64 %indvars.iv
  store double %div9.us.v.r2, double* %arrayidx23.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond10, label %for.cond2.for.end_crit_edge.us, label %for.body5.us.for.body5.us_crit_edge

for.body5.us.for.body5.us_crit_edge:              ; preds = %for.body5.us
  br label %for.body5.us

for.cond2.for.end_crit_edge.us:                   ; preds = %for.body5.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %0
  br i1 %exitcond9, label %for.end26.loopexit, label %for.cond2.for.end_crit_edge.us.for.body.us_crit_edge

for.cond2.for.end_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.body.us

for.end26.loopexit:                               ; preds = %for.cond2.for.end_crit_edge.us
  br label %for.end26

for.end26:                                        ; preds = %entry.for.end26_crit_edge, %for.end26.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32 %n, double %alpha, double %beta, [1300 x double]* %A, [1300 x double]* %B, double* %tmp, double* %x, double* %y) unnamed_addr #2 {
entry:
  %cmp2 = icmp sgt i32 %n, 0
  br i1 %cmp2, label %for.body.lr.ph, label %entry.for.end41_crit_edge

entry.for.end41_crit_edge:                        ; preds = %entry
  br label %for.end41

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %n to i64
  %sunkaddr = ptrtoint double* %tmp to i64
  %sunkaddr12 = ptrtoint double* %y to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond5.for.end_crit_edge.us.for.body.us_crit_edge, %for.body.lr.ph
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %for.cond5.for.end_crit_edge.us.for.body.us_crit_edge ], [ 0, %for.body.lr.ph ]
  %arrayidx.us = getelementptr inbounds double, double* %tmp, i64 %indvars.iv3
  store double 0.000000e+00, double* %arrayidx.us, align 8
  %arrayidx4.us = getelementptr inbounds double, double* %y, i64 %indvars.iv3
  store double 0.000000e+00, double* %arrayidx4.us, align 8
  %sunkaddr9 = shl i64 %indvars.iv3, 3
  %sunkaddr10 = add i64 %sunkaddr, %sunkaddr9
  %sunkaddr11 = inttoptr i64 %sunkaddr10 to double*
  %sunkaddr14 = add i64 %sunkaddr12, %sunkaddr9
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to double*
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.for.body7.us_crit_edge, %for.body.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us.for.body7.us_crit_edge ], [ 0, %for.body.us ]
  %arrayidx11.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv3, i64 %indvars.iv
  %1 = load double, double* %arrayidx11.us, align 8
  %arrayidx13.us = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %2 = load double, double* %arrayidx13.us, align 8
  %mul.us = fmul double %1, %2
  %3 = load double, double* %sunkaddr11, align 8
  %add.us = fadd double %mul.us, %3
  store double %add.us, double* %sunkaddr11, align 8
  %arrayidx21.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv3, i64 %indvars.iv
  %4 = load double, double* %arrayidx21.us, align 8
  %5 = load double, double* %arrayidx13.us, align 8
  %mul24.us = fmul double %4, %5
  %6 = load double, double* %sunkaddr15, align 8
  %add27.us = fadd double %mul24.us, %6
  store double %add27.us, double* %sunkaddr15, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next, %0
  br i1 %exitcond24, label %for.cond5.for.end_crit_edge.us, label %for.body7.us.for.body7.us_crit_edge

for.body7.us.for.body7.us_crit_edge:              ; preds = %for.body7.us
  br label %for.body7.us

for.cond5.for.end_crit_edge.us:                   ; preds = %for.body7.us
  %7 = load double, double* %sunkaddr11, align 8
  %mul32.us = fmul double %7, %alpha
  %mul35.us = fmul double %add27.us, %beta
  %add36.us = fadd double %mul35.us, %mul32.us
  store double %add36.us, double* %sunkaddr15, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next4, %0
  br i1 %exitcond6, label %for.end41.loopexit, label %for.cond5.for.end_crit_edge.us.for.body.us_crit_edge

for.cond5.for.end_crit_edge.us.for.body.us_crit_edge: ; preds = %for.cond5.for.end_crit_edge.us
  br label %for.body.us

for.end41.loopexit:                               ; preds = %for.cond5.for.end_crit_edge.us
  br label %for.end41

for.end41:                                        ; preds = %entry.for.end41_crit_edge, %for.end41.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %y) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.for.body_crit_edge ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond2, label %for.end.loopexit, label %if.end.for.body_crit_edge

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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

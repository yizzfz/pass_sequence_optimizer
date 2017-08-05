; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %arraydecay7 = bitcast i8* %call4 to double*
  %arraydecay8 = bitcast i8* %call to [2000 x double]*
  tail call void @init_array(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_mvt(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
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
  %1 = bitcast i8* %call2 to double*
  %2 = bitcast i8* %call1 to double*
  tail call void @print_array(double* %2, double* %1)
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
define internal void @init_array(double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [2000 x double]* nocapture %A) #2 {
entry:
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond22.for.cond.loopexit_crit_edge.us, %entry
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond22.for.cond.loopexit_crit_edge.us ], [ 0, %entry ]
  %0 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %0 to double
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %1 = icmp eq i64 %indvars.iv.next7, 2000
  %2 = trunc i64 %indvars.iv.next7 to i32
  %3 = sitofp i32 %2 to double
  %conv3.us = select i1 %1, double 0.000000e+00, double %3
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv3.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx.us, align 8
  %arrayidx7.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv6
  store double %div.us.v.r2, double* %arrayidx7.us, align 8
  %4 = add nuw nsw i64 %indvars.iv6, 3
  %5 = trunc i64 %4 to i32
  %rem9.us = srem i32 %5, 2000
  %conv10.us = sitofp i32 %rem9.us to double
  %arrayidx14.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv6
  %6 = add nuw nsw i64 %indvars.iv6, 4
  %7 = trunc i64 %6 to i32
  %rem16.us = srem i32 %7, 2000
  %conv17.us = sitofp i32 %rem16.us to double
  %div12.us.v.i0.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %div12.us.v.i0.2 = insertelement <2 x double> %div12.us.v.i0.1, double %conv17.us, i32 1
  %div12.us = fdiv <2 x double> %div12.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div12.us.v.r1 = extractelement <2 x double> %div12.us, i32 0
  %div12.us.v.r2 = extractelement <2 x double> %div12.us, i32 1
  store double %div12.us.v.r1, double* %arrayidx14.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv6
  store double %div12.us.v.r2, double* %arrayidx21.us, align 8
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body.us, %for.body25.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us ], [ 0, %for.body.us ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %9 = trunc i64 %8 to i32
  %rem26.us = srem i32 %9, 2000
  %conv27.us = sitofp i32 %rem26.us to double
  %arrayidx33.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %11 = trunc i64 %10 to i32
  %rem26.us.1 = srem i32 %11, 2000
  %conv27.us.1 = sitofp i32 %rem26.us.1 to double
  %div29.us.v.i0.1 = insertelement <2 x double> undef, double %conv27.us, i32 0
  %div29.us.v.i0.2 = insertelement <2 x double> %div29.us.v.i0.1, double %conv27.us.1, i32 1
  %div29.us = fdiv <2 x double> %div29.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %12 = bitcast double* %arrayidx33.us to <2 x double>*
  store <2 x double> %div29.us, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond22.for.cond.loopexit_crit_edge.us, label %for.body25.us

for.cond22.for.cond.loopexit_crit_edge.us:        ; preds = %for.body25.us
  %13 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %13, label %for.end36, label %for.body.us

for.end36:                                        ; preds = %for.cond22.for.cond.loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_mvt(double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) #2 {
entry:
  %sunkaddr = ptrtoint double* %x1 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %entry
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.cond1.for.inc12_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv18
  %.pre = load double, double* %arrayidx.us, align 8
  %sunkaddr1 = mul i64 %indvars.iv18, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond1.preheader.us, %for.body3.us
  %0 = phi double [ %add.us.1, %for.body3.us ], [ %.pre, %for.cond1.preheader.us ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %arrayidx7.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12
  %1 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv12
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  store double %add.us, double* %sunkaddr3, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %arrayidx7.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv.next13
  %3 = load double, double* %arrayidx7.us.1, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next13
  %4 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %3, %4
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %sunkaddr3, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13.1, 2000
  br i1 %exitcond15.1, label %for.cond1.for.inc12_crit_edge.us, label %for.body3.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, 2000
  br i1 %exitcond, label %for.cond18.preheader.us.preheader, label %for.cond1.preheader.us

for.cond18.preheader.us.preheader:                ; preds = %for.cond1.for.inc12_crit_edge.us
  %sunkaddr4 = ptrtoint double* %x2 to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.cond18.for.inc36_crit_edge.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.cond18.for.inc36_crit_edge.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %arrayidx22.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv9
  %.pre24 = load double, double* %arrayidx22.us, align 8
  %sunkaddr5 = mul i64 %indvars.iv9, 8
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.cond18.preheader.us, %for.body20.us
  %5 = phi double [ %add30.us.1, %for.body20.us ], [ %.pre24, %for.cond18.preheader.us ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body20.us ], [ 0, %for.cond18.preheader.us ]
  %arrayidx26.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv9
  %6 = load double, double* %arrayidx26.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %7 = load double, double* %arrayidx28.us, align 8
  %mul29.us = fmul double %6, %7
  %add30.us = fadd double %5, %mul29.us
  store double %add30.us, double* %sunkaddr7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx26.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv9
  %8 = load double, double* %arrayidx26.us.1, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx28.us.1, align 8
  %mul29.us.1 = fmul double %8, %9
  %add30.us.1 = fadd double %add30.us, %mul29.us.1
  store double %add30.us.1, double* %sunkaddr7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond18.for.inc36_crit_edge.us, label %for.body20.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.body20.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond22, label %for.end38, label %for.cond18.preheader.us

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly %x1, double* nocapture readonly %x2) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %if.end ]
  %3 = trunc i64 %indvars.iv8 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv8
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.end
  %indvars.iv = phi i64 [ 0, %for.end ], [ %indvars.iv.next, %if.end14 ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %if.end14

if.end14:                                         ; preds = %for.body9, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond12, label %for.end20, label %for.body9

for.end20:                                        ; preds = %if.end14
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  tail call fastcc void @init_array(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
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
  tail call fastcc void @print_array(double* %2, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond22.for.inc34_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond22.for.inc34_crit_edge.us ]
  %storemerge6.us = phi i32 [ 0, %entry ], [ %8, %for.cond22.for.inc34_crit_edge.us ]
  %rem.us = srem i32 %storemerge6.us, 2000
  %conv.us = sitofp i32 %rem.us to double
  %idxprom.us = sext i32 %storemerge6.us to i64
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %idxprom.us
  %add.us = add nsw i32 %storemerge6.us, 1
  %rem2.us = srem i32 %add.us, 2000
  %conv3.us = sitofp i32 %rem2.us to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv3.us, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx.us, align 8
  %arrayidx7.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv12
  store double %div.us.v.r2, double* %arrayidx7.us, align 8
  %0 = add nsw i64 %indvars.iv12, 3
  %1 = trunc i64 %0 to i32
  %rem9.us = srem i32 %1, 2000
  %conv10.us = sitofp i32 %rem9.us to double
  %arrayidx14.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv12
  %2 = add nsw i64 %indvars.iv12, 4
  %3 = trunc i64 %2 to i32
  %rem16.us = srem i32 %3, 2000
  %conv17.us = sitofp i32 %rem16.us to double
  %div12.us.v.i0.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %div12.us.v.i0.2 = insertelement <2 x double> %div12.us.v.i0.1, double %conv17.us, i32 1
  %div12.us = fdiv <2 x double> %div12.us.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div12.us.v.r1 = extractelement <2 x double> %div12.us, i32 0
  %div12.us.v.r2 = extractelement <2 x double> %div12.us, i32 1
  store double %div12.us.v.r1, double* %arrayidx14.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv12
  store double %div12.us.v.r2, double* %arrayidx21.us, align 8
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next.1, %for.inc.us ]
  %4 = mul nuw nsw i64 %indvars.iv12, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem26.us = srem i32 %5, 2000
  %conv27.us = sitofp i32 %rem26.us to double
  %div29.us = fdiv double %conv27.us, 2.000000e+03
  %arrayidx33.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  store double %div29.us, double* %arrayidx33.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %6 = mul nuw nsw i64 %indvars.iv12, %indvars.iv.next
  %7 = trunc i64 %6 to i32
  %rem26.us.1 = srem i32 %7, 2000
  %conv27.us.1 = sitofp i32 %rem26.us.1 to double
  %div29.us.1 = fdiv double %conv27.us.1, 2.000000e+03
  %arrayidx33.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %div29.us.1, double* %arrayidx33.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond20.1, label %for.cond22.for.inc34_crit_edge.us, label %for.inc.us

for.cond22.for.inc34_crit_edge.us:                ; preds = %for.inc.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 2000
  %8 = trunc i64 %indvars.iv.next13 to i32
  br i1 %cmp.us, label %for.body.us, label %for.end36

for.end36:                                        ; preds = %for.cond22.for.inc34_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %sunkaddr = ptrtoint double* %x1 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %entry
  %indvars.iv33 = phi i64 [ 0, %entry ], [ %indvars.iv.next34, %for.cond1.for.inc12_crit_edge.us ]
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv33
  %.pre = load double, double* %arrayidx.us, align 8
  %sunkaddr1 = mul i64 %indvars.iv33, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %0 = phi double [ %.pre, %for.cond1.preheader.us ], [ %add.us.1, %for.inc.us ]
  %indvars.iv26 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next27.1, %for.inc.us ]
  %arrayidx7.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv26
  %1 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv26
  %2 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %1, %2
  %add.us = fadd double %0, %mul.us
  store double %add.us, double* %sunkaddr3, align 8
  %indvars.iv.next27 = or i64 %indvars.iv26, 1
  %arrayidx7.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next27
  %3 = load double, double* %arrayidx7.us.1, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next27
  %4 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %3, %4
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %sunkaddr3, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %exitcond.132 = icmp eq i64 %indvars.iv.next27.1, 2000
  br i1 %exitcond.132, label %for.cond1.for.inc12_crit_edge.us, label %for.inc.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %cmp.us = icmp slt i64 %indvars.iv.next34, 2000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond18.preheader.us.preheader

for.cond18.preheader.us.preheader:                ; preds = %for.cond1.for.inc12_crit_edge.us
  %sunkaddr4 = ptrtoint double* %x2 to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.preheader.us.preheader, %for.cond18.for.inc36_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond18.for.inc36_crit_edge.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %arrayidx22.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv24
  %.pre39 = load double, double* %arrayidx22.us, align 8
  %sunkaddr5 = mul i64 %indvars.iv24, 8
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us, %for.cond18.preheader.us
  %5 = phi double [ %.pre39, %for.cond18.preheader.us ], [ %add30.us.1, %for.inc33.us ]
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader.us ], [ %indvars.iv.next.1, %for.inc33.us ]
  %arrayidx26.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv24
  %6 = load double, double* %arrayidx26.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %7 = load double, double* %arrayidx28.us, align 8
  %mul29.us = fmul double %6, %7
  %add30.us = fadd double %5, %mul29.us
  store double %add30.us, double* %sunkaddr7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx26.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv24
  %8 = load double, double* %arrayidx26.us.1, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx28.us.1, align 8
  %mul29.us.1 = fmul double %8, %9
  %add30.us.1 = fadd double %add30.us, %mul29.us.1
  store double %add30.us.1, double* %sunkaddr7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.cond18.for.inc36_crit_edge.us, label %for.inc33.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.inc33.us
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, 1
  %cmp16.us = icmp slt i64 %indvars.iv.next25, 2000
  br i1 %cmp16.us, label %for.cond18.preheader.us, label %for.end38

for.end38:                                        ; preds = %for.cond18.for.inc36_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x1, double* nocapture readonly %x2) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
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

for.inc:                                          ; preds = %for.body, %if.then
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv13
  %5 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %5) #6
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %cmp = icmp slt i64 %indvars.iv.next14, 2000
  %6 = trunc i64 %indvars.iv.next14 to i32
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
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

for.inc18:                                        ; preds = %for.body9, %if.then12
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %11 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, 2000
  %12 = trunc i64 %indvars.iv.next to i32
  br i1 %cmp8, label %for.body9, label %for.end20

for.end20:                                        ; preds = %for.inc18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
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

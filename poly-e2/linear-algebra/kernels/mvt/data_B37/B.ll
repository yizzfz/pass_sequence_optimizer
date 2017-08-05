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
  %0 = bitcast i8* %call1 to double*
  %1 = bitcast i8* %call2 to double*
  %2 = bitcast i8* %call3 to double*
  %arraydecay74 = bitcast i8* %call4 to double*
  %3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(double* %0, double* %1, double* %2, double* %arraydecay74, [2000 x double]* %3)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %0, double* %1, double* %2, double* %arraydecay74, [2000 x double]* %3)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %4 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %4, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %5 = bitcast i8* %call2 to double*
  %6 = bitcast i8* %call1 to double*
  tail call fastcc void @print_array(double* %6, double* %5)
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
  br label %for.body

for.body:                                         ; preds = %for.inc34, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc34 ]
  %0 = trunc i64 %indvars.iv11 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv11
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %1 = icmp eq i64 %indvars.iv.next12, 2000
  %2 = trunc i64 %indvars.iv.next12 to i32
  %3 = sitofp i32 %2 to double
  %conv3 = select i1 %1, double 0.000000e+00, double %3
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv3, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %x2, i64 %indvars.iv11
  store double %div.v.r2, double* %arrayidx7, align 8
  %4 = add nuw nsw i64 %indvars.iv11, 3
  %5 = trunc i64 %4 to i32
  %rem9 = srem i32 %5, 2000
  %conv10 = sitofp i32 %rem9 to double
  %arrayidx14 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv11
  %6 = add nuw nsw i64 %indvars.iv11, 4
  %7 = trunc i64 %6 to i32
  %rem16 = srem i32 %7, 2000
  %conv17 = sitofp i32 %rem16 to double
  %div12.v.i0.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %div12.v.i0.2 = insertelement <2 x double> %div12.v.i0.1, double %conv17, i32 1
  %div12 = fdiv <2 x double> %div12.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div12.v.r1 = extractelement <2 x double> %div12, i32 0
  %div12.v.r2 = extractelement <2 x double> %div12, i32 1
  store double %div12.v.r1, double* %arrayidx14, align 8
  %arrayidx21 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv11
  store double %div12.v.r2, double* %arrayidx21, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.body ]
  %8 = mul nuw nsw i64 %indvars.iv11, %indvars.iv
  %9 = trunc i64 %8 to i32
  %rem26 = srem i32 %9, 2000
  %conv27 = sitofp i32 %rem26 to double
  %arrayidx33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv11, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %rem26.1 = srem i32 %11, 2000
  %conv27.1 = sitofp i32 %rem26.1 to double
  %div29.v.i0.1 = insertelement <2 x double> undef, double %conv27, i32 0
  %div29.v.i0.2 = insertelement <2 x double> %div29.v.i0.1, double %conv27.1, i32 1
  %div29 = fdiv <2 x double> %div29.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %12 = bitcast double* %arrayidx33 to <2 x double>*
  store <2 x double> %div29, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.inc34, label %for.inc

for.inc34:                                        ; preds = %for.inc
  %13 = icmp eq i64 %indvars.iv.next12, 2000
  br i1 %13, label %for.end36, label %for.body

for.end36:                                        ; preds = %for.inc34
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %sunkaddr = ptrtoint double* %x1 to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc12, %entry
  %indvars.iv29 = phi i64 [ 0, %entry ], [ %indvars.iv.next30, %for.inc12 ]
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv29
  %.pre = load double, double* %arrayidx, align 8
  %sunkaddr1 = mul i64 %indvars.iv29, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to double*
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %for.inc ], [ 0, %for.cond1.preheader ]
  %0 = phi double [ %add.1, %for.inc ], [ %.pre, %for.cond1.preheader ]
  %arrayidx7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv25
  %1 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv25
  %2 = load double, double* %arrayidx9, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %sunkaddr3, align 8
  %indvars.iv.next26 = or i64 %indvars.iv25, 1
  %arrayidx7.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv.next26
  %3 = load double, double* %arrayidx7.1, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next26
  %4 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %sunkaddr3, align 8
  %indvars.iv.next26.1 = add nuw nsw i64 %indvars.iv25, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next26.1, 2000
  br i1 %exitcond28.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next30, 2000
  br i1 %exitcond36, label %for.cond18.preheader.preheader, label %for.cond1.preheader

for.cond18.preheader.preheader:                   ; preds = %for.inc12
  %sunkaddr4 = ptrtoint double* %x2 to i64
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.preheader, %for.inc36
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.inc36 ], [ 0, %for.cond18.preheader.preheader ]
  %arrayidx22 = getelementptr inbounds double, double* %x2, i64 %indvars.iv21
  %.pre20 = load double, double* %arrayidx22, align 8
  %sunkaddr5 = mul i64 %indvars.iv21, 8
  %sunkaddr6 = add i64 %sunkaddr4, %sunkaddr5
  %sunkaddr7 = inttoptr i64 %sunkaddr6 to double*
  br label %for.inc33

for.inc33:                                        ; preds = %for.inc33, %for.cond18.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc33 ], [ 0, %for.cond18.preheader ]
  %5 = phi double [ %add30.1, %for.inc33 ], [ %.pre20, %for.cond18.preheader ]
  %arrayidx26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv21
  %6 = load double, double* %arrayidx26, align 8
  %arrayidx28 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %7 = load double, double* %arrayidx28, align 8
  %mul29 = fmul double %6, %7
  %add30 = fadd double %5, %mul29
  store double %add30, double* %sunkaddr7, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx26.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv21
  %8 = load double, double* %arrayidx26.1, align 8
  %arrayidx28.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx28.1, align 8
  %mul29.1 = fmul double %8, %9
  %add30.1 = fadd double %add30, %mul29.1
  store double %add30.1, double* %sunkaddr7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.inc36, label %for.inc33

for.inc36:                                        ; preds = %for.inc33
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 2000
  br i1 %exitcond, label %for.end38, label %for.cond18.preheader

for.end38:                                        ; preds = %for.inc36
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

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %if.end ]
  %3 = trunc i64 %indvars.iv13 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv13
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond, label %for.cond.for.end_crit_edge, label %for.body

for.cond.for.end_crit_edge:                       ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.cond.for.end_crit_edge
  %indvars.iv = phi i64 [ 0, %for.cond.for.end_crit_edge ], [ %indvars.iv.next, %if.end14 ]
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
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond17, label %for.end20, label %for.body9

for.end20:                                        ; preds = %if.end14
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

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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %arraydecay = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %arraydecay7 = bitcast i8* %call4 to double*
  %arraydecay8 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_mvt(double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(double* %arraydecay, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  tail call void @free(i8* %call4) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(double* %x1, double* %x2, double* %y_1, double* %y_2, [2000 x double]* %A) unnamed_addr #0 {
entry:
  br label %for.body

for.cond.loopexit:                                ; preds = %for.body25
  %cmp = icmp slt i64 %indvars.iv.next3, 2000
  br i1 %cmp, label %for.body, label %for.end36

for.body:                                         ; preds = %for.cond.loopexit, %entry
  %indvars.iv2 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.cond.loopexit ]
  %0 = trunc i64 %indvars.iv2 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv2
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %1 = trunc i64 %indvars.iv.next3 to i32
  %2 = icmp eq i32 %1, 2000
  %3 = sitofp i32 %1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %3, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %div5 = select i1 %2, double 0.000000e+00, double %div.v.r2
  %arrayidx7 = getelementptr inbounds double, double* %x2, i64 %indvars.iv2
  store double %div5, double* %arrayidx7, align 8
  %4 = add nuw nsw i64 %indvars.iv2, 3
  %5 = trunc i64 %4 to i32
  %rem9 = srem i32 %5, 2000
  %conv10 = sitofp i32 %rem9 to double
  %arrayidx14 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv2
  %6 = add nuw nsw i64 %indvars.iv2, 4
  %7 = trunc i64 %6 to i32
  %rem16 = srem i32 %7, 2000
  %conv17 = sitofp i32 %rem16 to double
  %div12.v.i0.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %div12.v.i0.2 = insertelement <2 x double> %div12.v.i0.1, double %conv17, i32 1
  %div12 = fdiv <2 x double> %div12.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div12.v.r1 = extractelement <2 x double> %div12, i32 0
  %div12.v.r2 = extractelement <2 x double> %div12, i32 1
  store double %div12.v.r1, double* %arrayidx14, align 8
  %arrayidx21 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv2
  store double %div12.v.r2, double* %arrayidx21, align 8
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.body
  %indvars.iv = phi i64 [ 0, %for.body ], [ %indvars.iv.next.1, %for.body25 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %rem26 = srem i32 %9, 2000
  %conv27 = sitofp i32 %rem26 to double
  %div29 = fdiv double %conv27, 2.000000e+03
  %arrayidx33 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv
  store double %div29, double* %arrayidx33, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %11 = trunc i64 %10 to i32
  %rem26.1 = srem i32 %11, 2000
  %conv27.1 = sitofp i32 %rem26.1 to double
  %div29.1 = fdiv double %conv27.1, 2.000000e+03
  %arrayidx33.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv.next
  store double %div29.1, double* %arrayidx33.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond.loopexit, label %for.body25

for.end36:                                        ; preds = %for.cond.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_mvt(double* %x1, double* %x2, double* %y_1, double* %y_2, [2000 x double]* %A) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end ]
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv6
  %.pre = load double, double* %arrayidx, align 8
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %0 = phi double [ %.pre, %for.cond1.preheader ], [ %add.1, %for.body3 ]
  %indvars.iv3 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next4.1, %for.body3 ]
  %arrayidx7 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv3
  %1 = load double, double* %arrayidx7, align 8
  %arrayidx9 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv3
  %2 = load double, double* %arrayidx9, align 8
  %mul = fmul double %1, %2
  %add = fadd double %0, %mul
  store double %add, double* %arrayidx, align 8
  %indvars.iv.next4 = or i64 %indvars.iv3, 1
  %arrayidx7.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next4
  %3 = load double, double* %arrayidx7.1, align 8
  %arrayidx9.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next4
  %4 = load double, double* %arrayidx9.1, align 8
  %mul.1 = fmul double %3, %4
  %add.1 = fadd double %add, %mul.1
  store double %add.1, double* %arrayidx, align 8
  %exitcond5.1 = icmp eq i64 %indvars.iv.next4, 1999
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv3, 2
  br i1 %exitcond5.1, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %cmp = icmp slt i64 %indvars.iv.next7, 2000
  br i1 %cmp, label %for.cond1.preheader, label %for.cond18.preheader.preheader

for.cond18.preheader.preheader:                   ; preds = %for.end
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.preheader, %for.end35
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.end35 ], [ 0, %for.cond18.preheader.preheader ]
  %arrayidx22 = getelementptr inbounds double, double* %x2, i64 %indvars.iv1
  %.pre1 = load double, double* %arrayidx22, align 8
  br label %for.body20

for.body20:                                       ; preds = %for.body20, %for.cond18.preheader
  %5 = phi double [ %.pre1, %for.cond18.preheader ], [ %add30.1, %for.body20 ]
  %indvars.iv = phi i64 [ 0, %for.cond18.preheader ], [ %indvars.iv.next.1, %for.body20 ]
  %arrayidx26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv1
  %6 = load double, double* %arrayidx26, align 8
  %arrayidx28 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %7 = load double, double* %arrayidx28, align 8
  %mul29 = fmul double %6, %7
  %add30 = fadd double %5, %mul29
  store double %add30, double* %arrayidx22, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %arrayidx26.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv1
  %8 = load double, double* %arrayidx26.1, align 8
  %arrayidx28.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx28.1, align 8
  %mul29.1 = fmul double %8, %9
  %add30.1 = fadd double %add30, %mul29.1
  store double %add30.1, double* %arrayidx22, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.end35, label %for.body20

for.end35:                                        ; preds = %for.body20
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %cmp16 = icmp slt i64 %indvars.iv.next2, 2000
  br i1 %cmp16, label %for.cond18.preheader, label %for.end38

for.end38:                                        ; preds = %for.end35
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* %x1, double* %x2) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  br label %for.body

for.body:                                         ; preds = %if.end, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %if.end ]
  %3 = trunc i64 %indvars.iv4 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #4
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv4
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #4
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %cmp = icmp slt i64 %indvars.iv.next5, 2000
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %if.end
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #4
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.end
  %indvars.iv = phi i64 [ 0, %for.end ], [ %indvars.iv.next, %if.end14 ]
  %9 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %9, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %if.end14

if.then12:                                        ; preds = %for.body9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #4
  br label %if.end14

if.end14:                                         ; preds = %for.body9, %if.then12
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %12 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #4
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp8 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp8, label %for.body9, label %for.end20

for.end20:                                        ; preds = %if.end14
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #4
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

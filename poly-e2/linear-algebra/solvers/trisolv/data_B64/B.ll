; ModuleID = 'A.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %0 = bitcast i8* %call to [2000 x double]*
  %1 = bitcast i8* %call1 to double*
  %arraydecay4 = bitcast i8* %call2 to double*
  call fastcc void @init_array(i32 2000, [2000 x double]* %0, double* %1, double* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %0, double* %1, double* %arraydecay4)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 2000, double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %conv9 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc14.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.inc14.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv8 = phi i32 [ %indvars.iv.next9, %for.inc14.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv10
  store double -9.990000e+02, double* %arrayidx, align 8
  %1 = trunc i64 %indvars.iv10 to i32
  %conv = sitofp i32 %1 to double
  %arrayidx2 = getelementptr inbounds double, double* %b, i64 %indvars.iv10
  store double %conv, double* %arrayidx2, align 8
  %cmp42 = icmp slt i64 %indvars.iv10, 0
  br i1 %cmp42, label %for.inc14, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body
  %add = add i32 %1, 1
  %sub = add i32 %add, %n
  %wide.trip.count = zext i32 %indvars.iv8 to i64
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.for.body6_crit_edge ], [ 0, %for.body6.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %sub, %2
  %conv8 = sitofp i32 %add7 to double
  %mul = fmul double %conv8, 2.000000e+00
  %div = fdiv double %mul, %conv9
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv10, i64 %indvars.iv
  store double %div, double* %arrayidx13, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.inc14.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6

for.inc14.loopexit:                               ; preds = %for.body6
  br label %for.inc14

for.inc14:                                        ; preds = %for.inc14.loopexit, %for.body
  %indvars.iv.next11 = add i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, %0
  br i1 %cmp, label %for.inc14.for.body_crit_edge, label %for.end16.loopexit

for.inc14.for.body_crit_edge:                     ; preds = %for.inc14
  %indvars.iv.next9 = add i32 %indvars.iv8, 1
  br label %for.body

for.end16.loopexit:                               ; preds = %for.inc14
  br label %for.end16

for.end16:                                        ; preds = %for.end16.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end24

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.end.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %indvars.iv7 = phi i32 [ %indvars.iv.next8, %for.end.for.body_crit_edge ], [ -1, %for.body.lr.ph ]
  %arrayidx = getelementptr inbounds double, double* %b, i64 %indvars.iv9
  %1 = bitcast double* %arrayidx to i64*
  %2 = load i64, i64* %1, align 8
  %arrayidx2 = getelementptr inbounds double, double* %x, i64 %indvars.iv9
  %3 = bitcast double* %arrayidx2 to i64*
  store i64 %2, i64* %3, align 8
  %cmp42 = icmp sgt i64 %indvars.iv9, 0
  %4 = bitcast i64 %2 to double
  br i1 %cmp42, label %for.body5.lr.ph, label %for.end

for.body5.lr.ph:                                  ; preds = %for.body
  %wide.trip.count = zext i32 %indvars.iv7 to i64
  br label %for.body5

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.lr.ph
  %5 = phi double [ %sub, %for.body5.for.body5_crit_edge ], [ %4, %for.body5.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5.for.body5_crit_edge ], [ 0, %for.body5.lr.ph ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv
  %6 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %7 = load double, double* %arrayidx11, align 8
  %mul = fmul double %6, %7
  %sub = fsub double %5, %mul
  store double %sub, double* %arrayidx2, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body5

for.end.loopexit:                                 ; preds = %for.body5
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %8 = phi double [ %4, %for.body ], [ %sub, %for.end.loopexit ]
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %L, i64 %indvars.iv9, i64 %indvars.iv9
  %9 = load double, double* %arrayidx19, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx2, align 8
  %indvars.iv.next10 = add i64 %indvars.iv9, 1
  %cmp = icmp slt i64 %indvars.iv.next10, %0
  br i1 %cmp, label %for.end.for.body_crit_edge, label %for.end24.loopexit

for.end.for.body_crit_edge:                       ; preds = %for.end
  %indvars.iv.next8 = add i32 %indvars.iv7, 1
  br label %for.body

for.end24.loopexit:                               ; preds = %for.end
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp1 = icmp sgt i32 %n, 0
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %4 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %5 = phi %struct._IO_FILE* [ %3, %for.body.lr.ph ], [ %9, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %6) #5
  %7 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %7, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %8) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp ne i64 %indvars.iv.next, %4
  br i1 %exitcond, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %.lcssa = phi %struct._IO_FILE* [ %3, %entry ], [ %9, %for.end.loopexit ]
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

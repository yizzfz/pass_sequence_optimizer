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
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %L = alloca [2000 x [2000 x double]]*, align 8
  %x = alloca [2000 x double]*, align 8
  %b = alloca [2000 x double]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %0 = bitcast [2000 x [2000 x double]]** %L to i8**
  store i8* %call, i8** %0, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %1 = bitcast [2000 x double]** %x to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #3
  %2 = bitcast [2000 x double]** %b to i8**
  store i8* %call2, i8** %2, align 8
  %3 = load i32, i32* %n, align 4
  %4 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %L, align 8
  %arraydecay = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %4, i64 0, i64 0
  %5 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay3 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  %arraydecay4 = bitcast i8* %call2 to double*
  call fastcc void @init_array(i32 %3, [2000 x double]* %arraydecay, double* %arraydecay3, double* %arraydecay4)
  call void (...) @polybench_timer_start() #3
  %6 = load i32, i32* %n, align 4
  %7 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %L, align 8
  %arraydecay5 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 0
  %8 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay6 = getelementptr inbounds [2000 x double], [2000 x double]* %8, i64 0, i64 0
  %9 = load [2000 x double]*, [2000 x double]** %b, align 8
  %arraydecay7 = getelementptr inbounds [2000 x double], [2000 x double]* %9, i64 0, i64 0
  call fastcc void @kernel_trisolv(i32 %6, [2000 x double]* %arraydecay5, double* %arraydecay6, double* %arraydecay7)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %10 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %10, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %11 = load i8**, i8*** %argv.addr, align 8
  %12 = load i8*, i8** %11, align 8
  %strcmpload = load i8, i8* %12, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %13 = load i32, i32* %n, align 4
  %14 = load [2000 x double]*, [2000 x double]** %x, align 8
  %arraydecay9 = getelementptr inbounds [2000 x double], [2000 x double]* %14, i64 0, i64 0
  call fastcc void @print_array(i32 %13, double* %arraydecay9)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  %15 = bitcast [2000 x [2000 x double]]** %L to i8**
  %16 = load i8*, i8** %15, align 8
  call void @free(i8* %16) #3
  %17 = bitcast [2000 x double]** %x to i8**
  %18 = load i8*, i8** %17, align 8
  call void @free(i8* %18) #3
  %19 = bitcast [2000 x double]** %b to i8**
  %20 = load i8*, i8** %19, align 8
  call void @free(i8* %20) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %L.addr = alloca [2000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %L, [2000 x double]** %L.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %b, double** %b.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp5 = icmp sgt i32 %n, 0
  br i1 %cmp5, label %for.body.lr.ph, label %for.end16

for.body.lr.ph:                                   ; preds = %entry
  %0 = load double*, double** %x.addr, align 8
  %1 = load double*, double** %b.addr, align 8
  %2 = load i32, i32* %n.addr, align 4
  %conv9 = sitofp i32 %2 to double
  %3 = load [2000 x double]*, [2000 x double]** %L.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  %4 = sext i32 %i.promoted to i64
  %5 = zext i32 %2 to i64
  %6 = sext i32 %2 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc14.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc14.for.body_crit_edge ], [ %4, %for.body.lr.ph ]
  %indvars.iv10 = phi i32 [ %indvars.iv.next11, %for.inc14.for.body_crit_edge ], [ %i.promoted, %for.body.lr.ph ]
  %arrayidx = getelementptr inbounds double, double* %0, i64 %indvars.iv12
  store double -9.990000e+02, double* %arrayidx, align 8
  %7 = trunc i64 %indvars.iv12 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx2 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  store double %conv, double* %arrayidx2, align 8
  %cmp42 = icmp slt i64 %indvars.iv12, 0
  br i1 %cmp42, label %for.inc14, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body
  %8 = add i64 %indvars.iv12, %5
  %wide.trip.count = zext i32 %indvars.iv10 to i64
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body6.for.body6_crit_edge ], [ 0, %for.body6.preheader ]
  %9 = sub i64 %8, %indvars.iv
  %10 = add i64 %9, 1
  %11 = trunc i64 %10 to i32
  %conv8 = sitofp i32 %11 to double
  %mul = fmul double %conv8, 2.000000e+00
  %div = fdiv double %mul, %conv9
  %arrayidx13 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv12, i64 %indvars.iv
  store double %div, double* %arrayidx13, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.inc14.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body6

for.inc14.loopexit:                               ; preds = %for.body6
  br label %for.inc14

for.inc14:                                        ; preds = %for.inc14.loopexit, %for.body
  %indvars.iv.next13 = add i64 %indvars.iv12, 1
  %cmp = icmp slt i64 %indvars.iv.next13, %6
  br i1 %cmp, label %for.inc14.for.body_crit_edge, label %for.cond.for.end16_crit_edge

for.inc14.for.body_crit_edge:                     ; preds = %for.inc14
  %indvars.iv.next11 = add i32 %indvars.iv10, 1
  br label %for.body

for.cond.for.end16_crit_edge:                     ; preds = %for.inc14
  %12 = trunc i64 %indvars.iv.next13 to i32
  store i32 %12, i32* %i, align 4
  br label %for.end16

for.end16:                                        ; preds = %entry, %for.cond.for.end16_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trisolv(i32 %n, [2000 x double]* %L, double* %x, double* %b) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %L.addr = alloca [2000 x double]*, align 8
  %x.addr = alloca double*, align 8
  %b.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store [2000 x double]* %L, [2000 x double]** %L.addr, align 8
  store double* %x, double** %x.addr, align 8
  store double* %b, double** %b.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp5 = icmp sgt i32 %n, 0
  br i1 %cmp5, label %for.body.lr.ph, label %for.end24

for.body.lr.ph:                                   ; preds = %entry
  %0 = load double*, double** %b.addr, align 8
  %1 = load double*, double** %x.addr, align 8
  %2 = load [2000 x double]*, [2000 x double]** %L.addr, align 8
  %3 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %4 = add i32 %i.promoted, -1
  %5 = sext i32 %i.promoted to i64
  %6 = sext i32 %3 to i64
  br label %for.body

for.body:                                         ; preds = %for.end.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.end.for.body_crit_edge ], [ %5, %for.body.lr.ph ]
  %indvars.iv8 = phi i32 [ %indvars.iv.next9, %for.end.for.body_crit_edge ], [ %4, %for.body.lr.ph ]
  %arrayidx = getelementptr inbounds double, double* %0, i64 %indvars.iv10
  %7 = bitcast double* %arrayidx to i64*
  %8 = load i64, i64* %7, align 8
  %arrayidx2 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %9 = bitcast double* %arrayidx2 to i64*
  store i64 %8, i64* %9, align 8
  %cmp42 = icmp sgt i64 %indvars.iv10, 0
  br i1 %cmp42, label %for.body5.lr.ph, label %for.end

for.body5.lr.ph:                                  ; preds = %for.body
  %arrayidx13 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %wide.trip.count = zext i32 %indvars.iv8 to i64
  br label %for.body5

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body5.for.body5_crit_edge ], [ 0, %for.body5.lr.ph ]
  %arrayidx9 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx9, align 8
  %arrayidx11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %arrayidx11, align 8
  %mul = fmul double %10, %11
  %12 = load double, double* %arrayidx13, align 8
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx13, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %for.body5

for.end.loopexit:                                 ; preds = %for.body5
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body
  %arrayidx15 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  %13 = load double, double* %arrayidx15, align 8
  %arrayidx19 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv10
  %14 = load double, double* %arrayidx19, align 8
  %div = fdiv double %13, %14
  %arrayidx21 = getelementptr inbounds double, double* %1, i64 %indvars.iv10
  store double %div, double* %arrayidx21, align 8
  %indvars.iv.next11 = add i64 %indvars.iv10, 1
  %cmp = icmp slt i64 %indvars.iv.next11, %6
  br i1 %cmp, label %for.end.for.body_crit_edge, label %for.cond.for.end24_crit_edge

for.end.for.body_crit_edge:                       ; preds = %for.end
  %indvars.iv.next9 = add i32 %indvars.iv8, 1
  br label %for.body

for.cond.for.end24_crit_edge:                     ; preds = %for.end
  %15 = trunc i64 %indvars.iv.next11 to i32
  store i32 %15, i32* %i, align 4
  br label %for.end24

for.end24:                                        ; preds = %entry, %for.cond.for.end24_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %x) unnamed_addr #0 {
entry:
  %n.addr = alloca i32, align 4
  %x.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %x, double** %x.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp1 = icmp sgt i32 %3, 0
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %5 = load double*, double** %x.addr, align 8
  %6 = load i32, i32* %n.addr, align 4
  %i.promoted = load i32, i32* %i, align 4
  %7 = sext i32 %i.promoted to i64
  %8 = sext i32 %6 to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ %7, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %9 = phi %struct._IO_FILE* [ %4, %for.body.lr.ph ], [ %13, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %10 = load double, double* %arrayidx, align 8
  %call2 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %10) #5
  %11 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %11, 20
  %cmp3 = icmp eq i32 %rem, 0
  br i1 %cmp3, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #4
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %8
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %cmp, label %for.body, label %for.cond.for.end_crit_edge

for.cond.for.end_crit_edge:                       ; preds = %for.inc
  %14 = trunc i64 %indvars.iv.next to i32
  store i32 %14, i32* %i, align 4
  br label %for.end

for.end:                                          ; preds = %entry, %for.cond.for.end_crit_edge
  %.lcssa = phi %struct._IO_FILE* [ %13, %for.cond.for.end_crit_edge ], [ %4, %entry ]
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %15) #4
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

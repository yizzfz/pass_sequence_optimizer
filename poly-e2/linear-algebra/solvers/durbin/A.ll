; ModuleID = 'durbin.c'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %n = alloca i32, align 4
  %r = alloca [2000 x double]*, align 8
  %y = alloca [2000 x double]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 2000, i32* %n, align 4
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %0 = bitcast i8* %call to [2000 x double]*
  store [2000 x double]* %0, [2000 x double]** %r, align 8
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8)
  %1 = bitcast i8* %call1 to [2000 x double]*
  store [2000 x double]* %1, [2000 x double]** %y, align 8
  %2 = load i32, i32* %n, align 4
  %3 = load [2000 x double]*, [2000 x double]** %r, align 8
  %arraydecay = getelementptr inbounds [2000 x double], [2000 x double]* %3, i32 0, i32 0
  call void @init_array(i32 %2, double* %arraydecay)
  call void (...) @polybench_timer_start()
  %4 = load i32, i32* %n, align 4
  %5 = load [2000 x double]*, [2000 x double]** %r, align 8
  %arraydecay2 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i32 0, i32 0
  %6 = load [2000 x double]*, [2000 x double]** %y, align 8
  %arraydecay3 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i32 0, i32 0
  call void @kernel_durbin(i32 %4, double* %arraydecay2, double* %arraydecay3)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %7 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %7, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %8 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %8, i64 0
  %9 = load i8*, i8** %arrayidx, align 8
  %call4 = call i32 @strcmp(i8* %9, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %tobool = icmp ne i32 %call4, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %10 = load i32, i32* %n, align 4
  %11 = load [2000 x double]*, [2000 x double]** %y, align 8
  %arraydecay5 = getelementptr inbounds [2000 x double], [2000 x double]* %11, i32 0, i32 0
  call void @print_array(i32 %10, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %12 = load [2000 x double]*, [2000 x double]** %r, align 8
  %13 = bitcast [2000 x double]* %12 to i8*
  call void @free(i8* %13) #5
  %14 = load [2000 x double]*, [2000 x double]** %y, align 8
  %15 = bitcast [2000 x double]* %14 to i8*
  call void @free(i8* %15) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %n, double* %r) #0 {
entry:
  %n.addr = alloca i32, align 4
  %r.addr = alloca double*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %r, double** %r.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32, i32* %n.addr, align 4
  %add = add nsw i32 %2, 1
  %3 = load i32, i32* %i, align 4
  %sub = sub nsw i32 %add, %3
  %conv = sitofp i32 %sub to double
  %4 = load double*, double** %r.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds double, double* %4, i64 %idxprom
  store double %conv, double* %arrayidx, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32, i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_durbin(i32 %n, double* %r, double* %y) #0 {
entry:
  %n.addr = alloca i32, align 4
  %r.addr = alloca double*, align 8
  %y.addr = alloca double*, align 8
  %z = alloca [2000 x double], align 16
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %sum = alloca double, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %r, double** %r.addr, align 8
  store double* %y, double** %y.addr, align 8
  %0 = load double*, double** %r.addr, align 8
  %arrayidx = getelementptr inbounds double, double* %0, i64 0
  %1 = load double, double* %arrayidx, align 8
  %sub = fsub double -0.000000e+00, %1
  %2 = load double*, double** %y.addr, align 8
  %arrayidx1 = getelementptr inbounds double, double* %2, i64 0
  store double %sub, double* %arrayidx1, align 8
  store double 1.000000e+00, double* %beta, align 8
  %3 = load double*, double** %r.addr, align 8
  %arrayidx2 = getelementptr inbounds double, double* %3, i64 0
  %4 = load double, double* %arrayidx2, align 8
  %sub3 = fsub double -0.000000e+00, %4
  store double %sub3, double* %alpha, align 8
  store i32 1, i32* %k, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc47, %entry
  %5 = load i32, i32* %k, align 4
  %6 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %5, %6
  br i1 %cmp, label %for.body, label %for.end49

for.body:                                         ; preds = %for.cond
  %7 = load double, double* %alpha, align 8
  %8 = load double, double* %alpha, align 8
  %mul = fmul double %7, %8
  %sub4 = fsub double 1.000000e+00, %mul
  %9 = load double, double* %beta, align 8
  %mul5 = fmul double %sub4, %9
  store double %mul5, double* %beta, align 8
  store double 0.000000e+00, double* %sum, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body
  %10 = load i32, i32* %i, align 4
  %11 = load i32, i32* %k, align 4
  %cmp7 = icmp slt i32 %10, %11
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %12 = load double*, double** %r.addr, align 8
  %13 = load i32, i32* %k, align 4
  %14 = load i32, i32* %i, align 4
  %sub9 = sub nsw i32 %13, %14
  %sub10 = sub nsw i32 %sub9, 1
  %idxprom = sext i32 %sub10 to i64
  %arrayidx11 = getelementptr inbounds double, double* %12, i64 %idxprom
  %15 = load double, double* %arrayidx11, align 8
  %16 = load double*, double** %y.addr, align 8
  %17 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %17 to i64
  %arrayidx13 = getelementptr inbounds double, double* %16, i64 %idxprom12
  %18 = load double, double* %arrayidx13, align 8
  %mul14 = fmul double %15, %18
  %19 = load double, double* %sum, align 8
  %add = fadd double %19, %mul14
  store double %add, double* %sum, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %20 = load i32, i32* %i, align 4
  %inc = add nsw i32 %20, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  %21 = load double*, double** %r.addr, align 8
  %22 = load i32, i32* %k, align 4
  %idxprom15 = sext i32 %22 to i64
  %arrayidx16 = getelementptr inbounds double, double* %21, i64 %idxprom15
  %23 = load double, double* %arrayidx16, align 8
  %24 = load double, double* %sum, align 8
  %add17 = fadd double %23, %24
  %sub18 = fsub double -0.000000e+00, %add17
  %25 = load double, double* %beta, align 8
  %div = fdiv double %sub18, %25
  store double %div, double* %alpha, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond19

for.cond19:                                       ; preds = %for.inc32, %for.end
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %k, align 4
  %cmp20 = icmp slt i32 %26, %27
  br i1 %cmp20, label %for.body21, label %for.end34

for.body21:                                       ; preds = %for.cond19
  %28 = load double*, double** %y.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom22 = sext i32 %29 to i64
  %arrayidx23 = getelementptr inbounds double, double* %28, i64 %idxprom22
  %30 = load double, double* %arrayidx23, align 8
  %31 = load double, double* %alpha, align 8
  %32 = load double*, double** %y.addr, align 8
  %33 = load i32, i32* %k, align 4
  %34 = load i32, i32* %i, align 4
  %sub24 = sub nsw i32 %33, %34
  %sub25 = sub nsw i32 %sub24, 1
  %idxprom26 = sext i32 %sub25 to i64
  %arrayidx27 = getelementptr inbounds double, double* %32, i64 %idxprom26
  %35 = load double, double* %arrayidx27, align 8
  %mul28 = fmul double %31, %35
  %add29 = fadd double %30, %mul28
  %36 = load i32, i32* %i, align 4
  %idxprom30 = sext i32 %36 to i64
  %arrayidx31 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %idxprom30
  store double %add29, double* %arrayidx31, align 8
  br label %for.inc32

for.inc32:                                        ; preds = %for.body21
  %37 = load i32, i32* %i, align 4
  %inc33 = add nsw i32 %37, 1
  store i32 %inc33, i32* %i, align 4
  br label %for.cond19

for.end34:                                        ; preds = %for.cond19
  store i32 0, i32* %i, align 4
  br label %for.cond35

for.cond35:                                       ; preds = %for.inc42, %for.end34
  %38 = load i32, i32* %i, align 4
  %39 = load i32, i32* %k, align 4
  %cmp36 = icmp slt i32 %38, %39
  br i1 %cmp36, label %for.body37, label %for.end44

for.body37:                                       ; preds = %for.cond35
  %40 = load i32, i32* %i, align 4
  %idxprom38 = sext i32 %40 to i64
  %arrayidx39 = getelementptr inbounds [2000 x double], [2000 x double]* %z, i64 0, i64 %idxprom38
  %41 = load double, double* %arrayidx39, align 8
  %42 = load double*, double** %y.addr, align 8
  %43 = load i32, i32* %i, align 4
  %idxprom40 = sext i32 %43 to i64
  %arrayidx41 = getelementptr inbounds double, double* %42, i64 %idxprom40
  store double %41, double* %arrayidx41, align 8
  br label %for.inc42

for.inc42:                                        ; preds = %for.body37
  %44 = load i32, i32* %i, align 4
  %inc43 = add nsw i32 %44, 1
  store i32 %inc43, i32* %i, align 4
  br label %for.cond35

for.end44:                                        ; preds = %for.cond35
  %45 = load double, double* %alpha, align 8
  %46 = load double*, double** %y.addr, align 8
  %47 = load i32, i32* %k, align 4
  %idxprom45 = sext i32 %47 to i64
  %arrayidx46 = getelementptr inbounds double, double* %46, i64 %idxprom45
  store double %45, double* %arrayidx46, align 8
  br label %for.inc47

for.inc47:                                        ; preds = %for.end44
  %48 = load i32, i32* %k, align 4
  %inc48 = add nsw i32 %48, 1
  store i32 %inc48, i32* %k, align 4
  br label %for.cond

for.end49:                                        ; preds = %for.cond
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, double* %y) #0 {
entry:
  %n.addr = alloca i32, align 4
  %y.addr = alloca double*, align 8
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  store double* %y, double** %y.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %n.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %4 = load i32, i32* %i, align 4
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call3 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = load double*, double** %y.addr, align 8
  %8 = load i32, i32* %i, align 4
  %idxprom = sext i32 %8 to i64
  %arrayidx = getelementptr inbounds double, double* %7, i64 %idxprom
  %9 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %9)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %10 = load i32, i32* %i, align 4
  %inc = add nsw i32 %10, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readonly "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readonly }
attributes #5 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

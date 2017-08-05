; ModuleID = '3mm.c'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
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
  %ni = alloca i32, align 4
  %nj = alloca i32, align 4
  %nk = alloca i32, align 4
  %nl = alloca i32, align 4
  %nm = alloca i32, align 4
  %E = alloca [800 x [900 x double]]*, align 8
  %A = alloca [800 x [1000 x double]]*, align 8
  %B = alloca [1000 x [900 x double]]*, align 8
  %F = alloca [900 x [1100 x double]]*, align 8
  %C = alloca [900 x [1200 x double]]*, align 8
  %D = alloca [1200 x [1100 x double]]*, align 8
  %G = alloca [800 x [1100 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 800, i32* %ni, align 4
  store i32 900, i32* %nj, align 4
  store i32 1000, i32* %nk, align 4
  store i32 1100, i32* %nl, align 4
  store i32 1200, i32* %nm, align 4
  %call = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %0 = bitcast i8* %call to [800 x [900 x double]]*
  store [800 x [900 x double]]* %0, [800 x [900 x double]]** %E, align 8
  %call1 = call i8* @polybench_alloc_data(i64 800000, i32 8)
  %1 = bitcast i8* %call1 to [800 x [1000 x double]]*
  store [800 x [1000 x double]]* %1, [800 x [1000 x double]]** %A, align 8
  %call2 = call i8* @polybench_alloc_data(i64 900000, i32 8)
  %2 = bitcast i8* %call2 to [1000 x [900 x double]]*
  store [1000 x [900 x double]]* %2, [1000 x [900 x double]]** %B, align 8
  %call3 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %3 = bitcast i8* %call3 to [900 x [1100 x double]]*
  store [900 x [1100 x double]]* %3, [900 x [1100 x double]]** %F, align 8
  %call4 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %4 = bitcast i8* %call4 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %4, [900 x [1200 x double]]** %C, align 8
  %call5 = call i8* @polybench_alloc_data(i64 1320000, i32 8)
  %5 = bitcast i8* %call5 to [1200 x [1100 x double]]*
  store [1200 x [1100 x double]]* %5, [1200 x [1100 x double]]** %D, align 8
  %call6 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %6 = bitcast i8* %call6 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %6, [800 x [1100 x double]]** %G, align 8
  %7 = load i32, i32* %ni, align 4
  %8 = load i32, i32* %nj, align 4
  %9 = load i32, i32* %nk, align 4
  %10 = load i32, i32* %nl, align 4
  %11 = load i32, i32* %nm, align 4
  %12 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8
  %arraydecay = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %12, i32 0, i32 0
  %13 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8
  %arraydecay7 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %13, i32 0, i32 0
  %14 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %arraydecay8 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %14, i32 0, i32 0
  %15 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8
  %arraydecay9 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %15, i32 0, i32 0
  call void @init_array(i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  call void (...) @polybench_timer_start()
  %16 = load i32, i32* %ni, align 4
  %17 = load i32, i32* %nj, align 4
  %18 = load i32, i32* %nk, align 4
  %19 = load i32, i32* %nl, align 4
  %20 = load i32, i32* %nm, align 4
  %21 = load [800 x [900 x double]]*, [800 x [900 x double]]** %E, align 8
  %arraydecay10 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %21, i32 0, i32 0
  %22 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8
  %arraydecay11 = getelementptr inbounds [800 x [1000 x double]], [800 x [1000 x double]]* %22, i32 0, i32 0
  %23 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8
  %arraydecay12 = getelementptr inbounds [1000 x [900 x double]], [1000 x [900 x double]]* %23, i32 0, i32 0
  %24 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %F, align 8
  %arraydecay13 = getelementptr inbounds [900 x [1100 x double]], [900 x [1100 x double]]* %24, i32 0, i32 0
  %25 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %arraydecay14 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %25, i32 0, i32 0
  %26 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8
  %arraydecay15 = getelementptr inbounds [1200 x [1100 x double]], [1200 x [1100 x double]]* %26, i32 0, i32 0
  %27 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8
  %arraydecay16 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %27, i32 0, i32 0
  call void @kernel_3mm(i32 %16, i32 %17, i32 %18, i32 %19, i32 %20, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay11, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay14, [1100 x double]* %arraydecay15, [1100 x double]* %arraydecay16)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %28 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %28, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %29 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %29, i64 0
  %30 = load i8*, i8** %arrayidx, align 8
  %call17 = call i32 @strcmp(i8* %30, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %tobool = icmp ne i32 %call17, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %31 = load i32, i32* %ni, align 4
  %32 = load i32, i32* %nl, align 4
  %33 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8
  %arraydecay18 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %33, i32 0, i32 0
  call void @print_array(i32 %31, i32 %32, [1100 x double]* %arraydecay18)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %34 = load [800 x [900 x double]]*, [800 x [900 x double]]** %E, align 8
  %35 = bitcast [800 x [900 x double]]* %34 to i8*
  call void @free(i8* %35) #5
  %36 = load [800 x [1000 x double]]*, [800 x [1000 x double]]** %A, align 8
  %37 = bitcast [800 x [1000 x double]]* %36 to i8*
  call void @free(i8* %37) #5
  %38 = load [1000 x [900 x double]]*, [1000 x [900 x double]]** %B, align 8
  %39 = bitcast [1000 x [900 x double]]* %38 to i8*
  call void @free(i8* %39) #5
  %40 = load [900 x [1100 x double]]*, [900 x [1100 x double]]** %F, align 8
  %41 = bitcast [900 x [1100 x double]]* %40 to i8*
  call void @free(i8* %41) #5
  %42 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %43 = bitcast [900 x [1200 x double]]* %42 to i8*
  call void @free(i8* %43) #5
  %44 = load [1200 x [1100 x double]]*, [1200 x [1100 x double]]** %D, align 8
  %45 = bitcast [1200 x [1100 x double]]* %44 to i8*
  call void @free(i8* %45) #5
  %46 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %G, align 8
  %47 = bitcast [800 x [1100 x double]]* %46 to i8*
  call void @free(i8* %47) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1100 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store i32 %nm, i32* %nm.addr, align 4
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [900 x double]* %B, [900 x double]** %B.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1100 x double]* %D, [1100 x double]** %D.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc8, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end10

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %nk.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %4 = load i32, i32* %i, align 4
  %5 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %4, %5
  %add = add nsw i32 %mul, 1
  %6 = load i32, i32* %ni.addr, align 4
  %rem = srem i32 %add, %6
  %conv = sitofp i32 %rem to double
  %7 = load i32, i32* %ni.addr, align 4
  %mul4 = mul nsw i32 5, %7
  %conv5 = sitofp i32 %mul4 to double
  %div = fdiv double %conv, %conv5
  %8 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %9 = load i32, i32* %i, align 4
  %idxprom = sext i32 %9 to i64
  %arrayidx = getelementptr inbounds [1000 x double], [1000 x double]* %8, i64 %idxprom
  %10 = load i32, i32* %j, align 4
  %idxprom6 = sext i32 %10 to i64
  %arrayidx7 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx, i64 0, i64 %idxprom6
  store double %div, double* %arrayidx7, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %11 = load i32, i32* %j, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc8

for.inc8:                                         ; preds = %for.end
  %12 = load i32, i32* %i, align 4
  %inc9 = add nsw i32 %12, 1
  store i32 %inc9, i32* %i, align 4
  br label %for.cond

for.end10:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond11

for.cond11:                                       ; preds = %for.inc34, %for.end10
  %13 = load i32, i32* %i, align 4
  %14 = load i32, i32* %nk.addr, align 4
  %cmp12 = icmp slt i32 %13, %14
  br i1 %cmp12, label %for.body14, label %for.end36

for.body14:                                       ; preds = %for.cond11
  store i32 0, i32* %j, align 4
  br label %for.cond15

for.cond15:                                       ; preds = %for.inc31, %for.body14
  %15 = load i32, i32* %j, align 4
  %16 = load i32, i32* %nj.addr, align 4
  %cmp16 = icmp slt i32 %15, %16
  br i1 %cmp16, label %for.body18, label %for.end33

for.body18:                                       ; preds = %for.cond15
  %17 = load i32, i32* %i, align 4
  %18 = load i32, i32* %j, align 4
  %add19 = add nsw i32 %18, 1
  %mul20 = mul nsw i32 %17, %add19
  %add21 = add nsw i32 %mul20, 2
  %19 = load i32, i32* %nj.addr, align 4
  %rem22 = srem i32 %add21, %19
  %conv23 = sitofp i32 %rem22 to double
  %20 = load i32, i32* %nj.addr, align 4
  %mul24 = mul nsw i32 5, %20
  %conv25 = sitofp i32 %mul24 to double
  %div26 = fdiv double %conv23, %conv25
  %21 = load [900 x double]*, [900 x double]** %B.addr, align 8
  %22 = load i32, i32* %i, align 4
  %idxprom27 = sext i32 %22 to i64
  %arrayidx28 = getelementptr inbounds [900 x double], [900 x double]* %21, i64 %idxprom27
  %23 = load i32, i32* %j, align 4
  %idxprom29 = sext i32 %23 to i64
  %arrayidx30 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx28, i64 0, i64 %idxprom29
  store double %div26, double* %arrayidx30, align 8
  br label %for.inc31

for.inc31:                                        ; preds = %for.body18
  %24 = load i32, i32* %j, align 4
  %inc32 = add nsw i32 %24, 1
  store i32 %inc32, i32* %j, align 4
  br label %for.cond15

for.end33:                                        ; preds = %for.cond15
  br label %for.inc34

for.inc34:                                        ; preds = %for.end33
  %25 = load i32, i32* %i, align 4
  %inc35 = add nsw i32 %25, 1
  store i32 %inc35, i32* %i, align 4
  br label %for.cond11

for.end36:                                        ; preds = %for.cond11
  store i32 0, i32* %i, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc59, %for.end36
  %26 = load i32, i32* %i, align 4
  %27 = load i32, i32* %nj.addr, align 4
  %cmp38 = icmp slt i32 %26, %27
  br i1 %cmp38, label %for.body40, label %for.end61

for.body40:                                       ; preds = %for.cond37
  store i32 0, i32* %j, align 4
  br label %for.cond41

for.cond41:                                       ; preds = %for.inc56, %for.body40
  %28 = load i32, i32* %j, align 4
  %29 = load i32, i32* %nm.addr, align 4
  %cmp42 = icmp slt i32 %28, %29
  br i1 %cmp42, label %for.body44, label %for.end58

for.body44:                                       ; preds = %for.cond41
  %30 = load i32, i32* %i, align 4
  %31 = load i32, i32* %j, align 4
  %add45 = add nsw i32 %31, 3
  %mul46 = mul nsw i32 %30, %add45
  %32 = load i32, i32* %nl.addr, align 4
  %rem47 = srem i32 %mul46, %32
  %conv48 = sitofp i32 %rem47 to double
  %33 = load i32, i32* %nl.addr, align 4
  %mul49 = mul nsw i32 5, %33
  %conv50 = sitofp i32 %mul49 to double
  %div51 = fdiv double %conv48, %conv50
  %34 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %35 = load i32, i32* %i, align 4
  %idxprom52 = sext i32 %35 to i64
  %arrayidx53 = getelementptr inbounds [1200 x double], [1200 x double]* %34, i64 %idxprom52
  %36 = load i32, i32* %j, align 4
  %idxprom54 = sext i32 %36 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx53, i64 0, i64 %idxprom54
  store double %div51, double* %arrayidx55, align 8
  br label %for.inc56

for.inc56:                                        ; preds = %for.body44
  %37 = load i32, i32* %j, align 4
  %inc57 = add nsw i32 %37, 1
  store i32 %inc57, i32* %j, align 4
  br label %for.cond41

for.end58:                                        ; preds = %for.cond41
  br label %for.inc59

for.inc59:                                        ; preds = %for.end58
  %38 = load i32, i32* %i, align 4
  %inc60 = add nsw i32 %38, 1
  store i32 %inc60, i32* %i, align 4
  br label %for.cond37

for.end61:                                        ; preds = %for.cond37
  store i32 0, i32* %i, align 4
  br label %for.cond62

for.cond62:                                       ; preds = %for.inc85, %for.end61
  %39 = load i32, i32* %i, align 4
  %40 = load i32, i32* %nm.addr, align 4
  %cmp63 = icmp slt i32 %39, %40
  br i1 %cmp63, label %for.body65, label %for.end87

for.body65:                                       ; preds = %for.cond62
  store i32 0, i32* %j, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc82, %for.body65
  %41 = load i32, i32* %j, align 4
  %42 = load i32, i32* %nl.addr, align 4
  %cmp67 = icmp slt i32 %41, %42
  br i1 %cmp67, label %for.body69, label %for.end84

for.body69:                                       ; preds = %for.cond66
  %43 = load i32, i32* %i, align 4
  %44 = load i32, i32* %j, align 4
  %add70 = add nsw i32 %44, 2
  %mul71 = mul nsw i32 %43, %add70
  %add72 = add nsw i32 %mul71, 2
  %45 = load i32, i32* %nk.addr, align 4
  %rem73 = srem i32 %add72, %45
  %conv74 = sitofp i32 %rem73 to double
  %46 = load i32, i32* %nk.addr, align 4
  %mul75 = mul nsw i32 5, %46
  %conv76 = sitofp i32 %mul75 to double
  %div77 = fdiv double %conv74, %conv76
  %47 = load [1100 x double]*, [1100 x double]** %D.addr, align 8
  %48 = load i32, i32* %i, align 4
  %idxprom78 = sext i32 %48 to i64
  %arrayidx79 = getelementptr inbounds [1100 x double], [1100 x double]* %47, i64 %idxprom78
  %49 = load i32, i32* %j, align 4
  %idxprom80 = sext i32 %49 to i64
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx79, i64 0, i64 %idxprom80
  store double %div77, double* %arrayidx81, align 8
  br label %for.inc82

for.inc82:                                        ; preds = %for.body69
  %50 = load i32, i32* %j, align 4
  %inc83 = add nsw i32 %50, 1
  store i32 %inc83, i32* %j, align 4
  br label %for.cond66

for.end84:                                        ; preds = %for.cond66
  br label %for.inc85

for.inc85:                                        ; preds = %for.end84
  %51 = load i32, i32* %i, align 4
  %inc86 = add nsw i32 %51, 1
  store i32 %inc86, i32* %i, align 4
  br label %for.cond62

for.end87:                                        ; preds = %for.cond62
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* %E, [1000 x double]* %A, [900 x double]* %B, [1100 x double]* %F, [1200 x double]* %C, [1100 x double]* %D, [1100 x double]* %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %nm.addr = alloca i32, align 4
  %E.addr = alloca [900 x double]*, align 8
  %A.addr = alloca [1000 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %F.addr = alloca [1100 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1100 x double]*, align 8
  %G.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store i32 %nm, i32* %nm.addr, align 4
  store [900 x double]* %E, [900 x double]** %E.addr, align 8
  store [1000 x double]* %A, [1000 x double]** %A.addr, align 8
  store [900 x double]* %B, [900 x double]** %B.addr, align 8
  store [1100 x double]* %F, [1100 x double]** %F.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1100 x double]* %D, [1100 x double]** %D.addr, align 8
  store [1100 x double]* %G, [1100 x double]** %G.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc24, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end26

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc21, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %nj.addr, align 4
  %cmp2 = icmp slt i32 %2, %3
  br i1 %cmp2, label %for.body3, label %for.end23

for.body3:                                        ; preds = %for.cond1
  %4 = load [900 x double]*, [900 x double]** %E.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %idxprom
  %6 = load i32, i32* %j, align 4
  %idxprom4 = sext i32 %6 to i64
  %arrayidx5 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx, i64 0, i64 %idxprom4
  store double 0.000000e+00, double* %arrayidx5, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond6

for.cond6:                                        ; preds = %for.inc, %for.body3
  %7 = load i32, i32* %k, align 4
  %8 = load i32, i32* %nk.addr, align 4
  %cmp7 = icmp slt i32 %7, %8
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond6
  %9 = load [1000 x double]*, [1000 x double]** %A.addr, align 8
  %10 = load i32, i32* %i, align 4
  %idxprom9 = sext i32 %10 to i64
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %9, i64 %idxprom9
  %11 = load i32, i32* %k, align 4
  %idxprom11 = sext i32 %11 to i64
  %arrayidx12 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx10, i64 0, i64 %idxprom11
  %12 = load double, double* %arrayidx12, align 8
  %13 = load [900 x double]*, [900 x double]** %B.addr, align 8
  %14 = load i32, i32* %k, align 4
  %idxprom13 = sext i32 %14 to i64
  %arrayidx14 = getelementptr inbounds [900 x double], [900 x double]* %13, i64 %idxprom13
  %15 = load i32, i32* %j, align 4
  %idxprom15 = sext i32 %15 to i64
  %arrayidx16 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx14, i64 0, i64 %idxprom15
  %16 = load double, double* %arrayidx16, align 8
  %mul = fmul double %12, %16
  %17 = load [900 x double]*, [900 x double]** %E.addr, align 8
  %18 = load i32, i32* %i, align 4
  %idxprom17 = sext i32 %18 to i64
  %arrayidx18 = getelementptr inbounds [900 x double], [900 x double]* %17, i64 %idxprom17
  %19 = load i32, i32* %j, align 4
  %idxprom19 = sext i32 %19 to i64
  %arrayidx20 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx18, i64 0, i64 %idxprom19
  %20 = load double, double* %arrayidx20, align 8
  %add = fadd double %20, %mul
  store double %add, double* %arrayidx20, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %21 = load i32, i32* %k, align 4
  %inc = add nsw i32 %21, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond6

for.end:                                          ; preds = %for.cond6
  br label %for.inc21

for.inc21:                                        ; preds = %for.end
  %22 = load i32, i32* %j, align 4
  %inc22 = add nsw i32 %22, 1
  store i32 %inc22, i32* %j, align 4
  br label %for.cond1

for.end23:                                        ; preds = %for.cond1
  br label %for.inc24

for.inc24:                                        ; preds = %for.end23
  %23 = load i32, i32* %i, align 4
  %inc25 = add nsw i32 %23, 1
  store i32 %inc25, i32* %i, align 4
  br label %for.cond

for.end26:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond27

for.cond27:                                       ; preds = %for.inc60, %for.end26
  %24 = load i32, i32* %i, align 4
  %25 = load i32, i32* %nj.addr, align 4
  %cmp28 = icmp slt i32 %24, %25
  br i1 %cmp28, label %for.body29, label %for.end62

for.body29:                                       ; preds = %for.cond27
  store i32 0, i32* %j, align 4
  br label %for.cond30

for.cond30:                                       ; preds = %for.inc57, %for.body29
  %26 = load i32, i32* %j, align 4
  %27 = load i32, i32* %nl.addr, align 4
  %cmp31 = icmp slt i32 %26, %27
  br i1 %cmp31, label %for.body32, label %for.end59

for.body32:                                       ; preds = %for.cond30
  %28 = load [1100 x double]*, [1100 x double]** %F.addr, align 8
  %29 = load i32, i32* %i, align 4
  %idxprom33 = sext i32 %29 to i64
  %arrayidx34 = getelementptr inbounds [1100 x double], [1100 x double]* %28, i64 %idxprom33
  %30 = load i32, i32* %j, align 4
  %idxprom35 = sext i32 %30 to i64
  %arrayidx36 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx34, i64 0, i64 %idxprom35
  store double 0.000000e+00, double* %arrayidx36, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond37

for.cond37:                                       ; preds = %for.inc54, %for.body32
  %31 = load i32, i32* %k, align 4
  %32 = load i32, i32* %nm.addr, align 4
  %cmp38 = icmp slt i32 %31, %32
  br i1 %cmp38, label %for.body39, label %for.end56

for.body39:                                       ; preds = %for.cond37
  %33 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %34 = load i32, i32* %i, align 4
  %idxprom40 = sext i32 %34 to i64
  %arrayidx41 = getelementptr inbounds [1200 x double], [1200 x double]* %33, i64 %idxprom40
  %35 = load i32, i32* %k, align 4
  %idxprom42 = sext i32 %35 to i64
  %arrayidx43 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx41, i64 0, i64 %idxprom42
  %36 = load double, double* %arrayidx43, align 8
  %37 = load [1100 x double]*, [1100 x double]** %D.addr, align 8
  %38 = load i32, i32* %k, align 4
  %idxprom44 = sext i32 %38 to i64
  %arrayidx45 = getelementptr inbounds [1100 x double], [1100 x double]* %37, i64 %idxprom44
  %39 = load i32, i32* %j, align 4
  %idxprom46 = sext i32 %39 to i64
  %arrayidx47 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx45, i64 0, i64 %idxprom46
  %40 = load double, double* %arrayidx47, align 8
  %mul48 = fmul double %36, %40
  %41 = load [1100 x double]*, [1100 x double]** %F.addr, align 8
  %42 = load i32, i32* %i, align 4
  %idxprom49 = sext i32 %42 to i64
  %arrayidx50 = getelementptr inbounds [1100 x double], [1100 x double]* %41, i64 %idxprom49
  %43 = load i32, i32* %j, align 4
  %idxprom51 = sext i32 %43 to i64
  %arrayidx52 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx50, i64 0, i64 %idxprom51
  %44 = load double, double* %arrayidx52, align 8
  %add53 = fadd double %44, %mul48
  store double %add53, double* %arrayidx52, align 8
  br label %for.inc54

for.inc54:                                        ; preds = %for.body39
  %45 = load i32, i32* %k, align 4
  %inc55 = add nsw i32 %45, 1
  store i32 %inc55, i32* %k, align 4
  br label %for.cond37

for.end56:                                        ; preds = %for.cond37
  br label %for.inc57

for.inc57:                                        ; preds = %for.end56
  %46 = load i32, i32* %j, align 4
  %inc58 = add nsw i32 %46, 1
  store i32 %inc58, i32* %j, align 4
  br label %for.cond30

for.end59:                                        ; preds = %for.cond30
  br label %for.inc60

for.inc60:                                        ; preds = %for.end59
  %47 = load i32, i32* %i, align 4
  %inc61 = add nsw i32 %47, 1
  store i32 %inc61, i32* %i, align 4
  br label %for.cond27

for.end62:                                        ; preds = %for.cond27
  store i32 0, i32* %i, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc96, %for.end62
  %48 = load i32, i32* %i, align 4
  %49 = load i32, i32* %ni.addr, align 4
  %cmp64 = icmp slt i32 %48, %49
  br i1 %cmp64, label %for.body65, label %for.end98

for.body65:                                       ; preds = %for.cond63
  store i32 0, i32* %j, align 4
  br label %for.cond66

for.cond66:                                       ; preds = %for.inc93, %for.body65
  %50 = load i32, i32* %j, align 4
  %51 = load i32, i32* %nl.addr, align 4
  %cmp67 = icmp slt i32 %50, %51
  br i1 %cmp67, label %for.body68, label %for.end95

for.body68:                                       ; preds = %for.cond66
  %52 = load [1100 x double]*, [1100 x double]** %G.addr, align 8
  %53 = load i32, i32* %i, align 4
  %idxprom69 = sext i32 %53 to i64
  %arrayidx70 = getelementptr inbounds [1100 x double], [1100 x double]* %52, i64 %idxprom69
  %54 = load i32, i32* %j, align 4
  %idxprom71 = sext i32 %54 to i64
  %arrayidx72 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx70, i64 0, i64 %idxprom71
  store double 0.000000e+00, double* %arrayidx72, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond73

for.cond73:                                       ; preds = %for.inc90, %for.body68
  %55 = load i32, i32* %k, align 4
  %56 = load i32, i32* %nj.addr, align 4
  %cmp74 = icmp slt i32 %55, %56
  br i1 %cmp74, label %for.body75, label %for.end92

for.body75:                                       ; preds = %for.cond73
  %57 = load [900 x double]*, [900 x double]** %E.addr, align 8
  %58 = load i32, i32* %i, align 4
  %idxprom76 = sext i32 %58 to i64
  %arrayidx77 = getelementptr inbounds [900 x double], [900 x double]* %57, i64 %idxprom76
  %59 = load i32, i32* %k, align 4
  %idxprom78 = sext i32 %59 to i64
  %arrayidx79 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx77, i64 0, i64 %idxprom78
  %60 = load double, double* %arrayidx79, align 8
  %61 = load [1100 x double]*, [1100 x double]** %F.addr, align 8
  %62 = load i32, i32* %k, align 4
  %idxprom80 = sext i32 %62 to i64
  %arrayidx81 = getelementptr inbounds [1100 x double], [1100 x double]* %61, i64 %idxprom80
  %63 = load i32, i32* %j, align 4
  %idxprom82 = sext i32 %63 to i64
  %arrayidx83 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx81, i64 0, i64 %idxprom82
  %64 = load double, double* %arrayidx83, align 8
  %mul84 = fmul double %60, %64
  %65 = load [1100 x double]*, [1100 x double]** %G.addr, align 8
  %66 = load i32, i32* %i, align 4
  %idxprom85 = sext i32 %66 to i64
  %arrayidx86 = getelementptr inbounds [1100 x double], [1100 x double]* %65, i64 %idxprom85
  %67 = load i32, i32* %j, align 4
  %idxprom87 = sext i32 %67 to i64
  %arrayidx88 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx86, i64 0, i64 %idxprom87
  %68 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %68, %mul84
  store double %add89, double* %arrayidx88, align 8
  br label %for.inc90

for.inc90:                                        ; preds = %for.body75
  %69 = load i32, i32* %k, align 4
  %inc91 = add nsw i32 %69, 1
  store i32 %inc91, i32* %k, align 4
  br label %for.cond73

for.end92:                                        ; preds = %for.cond73
  br label %for.inc93

for.inc93:                                        ; preds = %for.end92
  %70 = load i32, i32* %j, align 4
  %inc94 = add nsw i32 %70, 1
  store i32 %inc94, i32* %j, align 4
  br label %for.cond66

for.end95:                                        ; preds = %for.cond66
  br label %for.inc96

for.inc96:                                        ; preds = %for.end95
  %71 = load i32, i32* %i, align 4
  %inc97 = add nsw i32 %71, 1
  store i32 %inc97, i32* %i, align 4
  br label %for.cond63

for.end98:                                        ; preds = %for.cond63
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1100 x double]* %G) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %G.addr = alloca [1100 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store [1100 x double]* %G, [1100 x double]** %G.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %0, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i32 0, i32 0))
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %1, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc10, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end12

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %nl.addr, align 4
  %cmp3 = icmp slt i32 %4, %5
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %ni.addr, align 4
  %mul = mul nsw i32 %6, %7
  %8 = load i32, i32* %j, align 4
  %add = add nsw i32 %mul, %8
  %rem = srem i32 %add, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.4, i32 0, i32 0))
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = load [1100 x double]*, [1100 x double]** %G.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom7
  %14 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i32 0, i32 0), double %14)
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %15 = load i32, i32* %j, align 4
  %inc = add nsw i32 %15, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc10

for.inc10:                                        ; preds = %for.end
  %16 = load i32, i32* %i, align 4
  %inc11 = add nsw i32 %16, 1
  store i32 %inc11, i32* %i, align 4
  br label %for.cond

for.end12:                                        ; preds = %for.cond
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i32 0, i32 0))
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i32 0, i32 0))
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

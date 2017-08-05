; ModuleID = '2mm.c'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
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
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %tmp = alloca [800 x [900 x double]]*, align 8
  %A = alloca [800 x [1100 x double]]*, align 8
  %B = alloca [1100 x [900 x double]]*, align 8
  %C = alloca [900 x [1200 x double]]*, align 8
  %D = alloca [800 x [1200 x double]]*, align 8
  store i32 0, i32* %retval, align 4
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 800, i32* %ni, align 4
  store i32 900, i32* %nj, align 4
  store i32 1100, i32* %nk, align 4
  store i32 1200, i32* %nl, align 4
  %call = call i8* @polybench_alloc_data(i64 720000, i32 8)
  %0 = bitcast i8* %call to [800 x [900 x double]]*
  store [800 x [900 x double]]* %0, [800 x [900 x double]]** %tmp, align 8
  %call2 = call i8* @polybench_alloc_data(i64 880000, i32 8)
  %1 = bitcast i8* %call2 to [800 x [1100 x double]]*
  store [800 x [1100 x double]]* %1, [800 x [1100 x double]]** %A, align 8
  %call4 = call i8* @polybench_alloc_data(i64 990000, i32 8)
  %2 = bitcast i8* %call4 to [1100 x [900 x double]]*
  store [1100 x [900 x double]]* %2, [1100 x [900 x double]]** %B, align 8
  %call6 = call i8* @polybench_alloc_data(i64 1080000, i32 8)
  %3 = bitcast i8* %call6 to [900 x [1200 x double]]*
  store [900 x [1200 x double]]* %3, [900 x [1200 x double]]** %C, align 8
  %call8 = call i8* @polybench_alloc_data(i64 960000, i32 8)
  %4 = bitcast i8* %call8 to [800 x [1200 x double]]*
  store [800 x [1200 x double]]* %4, [800 x [1200 x double]]** %D, align 8
  %5 = load i32, i32* %ni, align 4
  %6 = load i32, i32* %nj, align 4
  %7 = load i32, i32* %nk, align 4
  %8 = load i32, i32* %nl, align 4
  %9 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8
  %arraydecay = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %9, i32 0, i32 0
  %10 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8
  %arraydecay9 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %10, i32 0, i32 0
  %11 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %arraydecay10 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %11, i32 0, i32 0
  %12 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8
  %arraydecay11 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %12, i32 0, i32 0
  call void @init_array(i32 %5, i32 %6, i32 %7, i32 %8, double* %alpha, double* %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  call void (...) @polybench_timer_start()
  %13 = load i32, i32* %ni, align 4
  %14 = load i32, i32* %nj, align 4
  %15 = load i32, i32* %nk, align 4
  %16 = load i32, i32* %nl, align 4
  %17 = load double, double* %alpha, align 8
  %18 = load double, double* %beta, align 8
  %19 = load [800 x [900 x double]]*, [800 x [900 x double]]** %tmp, align 8
  %arraydecay12 = getelementptr inbounds [800 x [900 x double]], [800 x [900 x double]]* %19, i32 0, i32 0
  %20 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8
  %arraydecay13 = getelementptr inbounds [800 x [1100 x double]], [800 x [1100 x double]]* %20, i32 0, i32 0
  %21 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8
  %arraydecay14 = getelementptr inbounds [1100 x [900 x double]], [1100 x [900 x double]]* %21, i32 0, i32 0
  %22 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %arraydecay15 = getelementptr inbounds [900 x [1200 x double]], [900 x [1200 x double]]* %22, i32 0, i32 0
  %23 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8
  %arraydecay16 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %23, i32 0, i32 0
  call void @kernel_2mm(i32 %13, i32 %14, i32 %15, i32 %16, double %17, double %18, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay13, [900 x double]* %arraydecay14, [1200 x double]* %arraydecay15, [1200 x double]* %arraydecay16)
  call void (...) @polybench_timer_stop()
  call void (...) @polybench_timer_print()
  %24 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %24, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %25 = load i8**, i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8*, i8** %25, i64 0
  %26 = load i8*, i8** %arrayidx, align 8
  %call17 = call i32 @strcmp(i8* %26, i8* getelementptr inbounds ([1 x i8], [1 x i8]* @.str, i32 0, i32 0)) #4
  %tobool = icmp ne i32 %call17, 0
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  %27 = load i32, i32* %ni, align 4
  %28 = load i32, i32* %nl, align 4
  %29 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8
  %arraydecay18 = getelementptr inbounds [800 x [1200 x double]], [800 x [1200 x double]]* %29, i32 0, i32 0
  call void @print_array(i32 %27, i32 %28, [1200 x double]* %arraydecay18)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %30 = load [800 x [900 x double]]*, [800 x [900 x double]]** %tmp, align 8
  %31 = bitcast [800 x [900 x double]]* %30 to i8*
  call void @free(i8* %31) #5
  %32 = load [800 x [1100 x double]]*, [800 x [1100 x double]]** %A, align 8
  %33 = bitcast [800 x [1100 x double]]* %32 to i8*
  call void @free(i8* %33) #5
  %34 = load [1100 x [900 x double]]*, [1100 x [900 x double]]** %B, align 8
  %35 = bitcast [1100 x [900 x double]]* %34 to i8*
  call void @free(i8* %35) #5
  %36 = load [900 x [1200 x double]]*, [900 x [1200 x double]]** %C, align 8
  %37 = bitcast [900 x [1200 x double]]* %36 to i8*
  call void @free(i8* %37) #5
  %38 = load [800 x [1200 x double]]*, [800 x [1200 x double]]** %D, align 8
  %39 = bitcast [800 x [1200 x double]]* %38 to i8*
  call void @free(i8* %39) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* %alpha, double* %beta, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double*, align 8
  %beta.addr = alloca double*, align 8
  %A.addr = alloca [1100 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store double* %alpha, double** %alpha.addr, align 8
  store double* %beta, double** %beta.addr, align 8
  store [1100 x double]* %A, [1100 x double]** %A.addr, align 8
  store [900 x double]* %B, [900 x double]** %B.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8
  %0 = load double*, double** %alpha.addr, align 8
  store double 1.500000e+00, double* %0, align 8
  %1 = load double*, double** %beta.addr, align 8
  store double 1.200000e+00, double* %1, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %2 = load i32, i32* %i, align 4
  %3 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %2, %3
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %4 = load i32, i32* %j, align 4
  %5 = load i32, i32* %nk.addr, align 4
  %cmp2 = icmp slt i32 %4, %5
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %6 = load i32, i32* %i, align 4
  %7 = load i32, i32* %j, align 4
  %mul = mul nsw i32 %6, %7
  %add = add nsw i32 %mul, 1
  %8 = load i32, i32* %ni.addr, align 4
  %rem = srem i32 %add, %8
  %conv = sitofp i32 %rem to double
  %9 = load i32, i32* %ni.addr, align 4
  %conv4 = sitofp i32 %9 to double
  %div = fdiv double %conv, %conv4
  %10 = load [1100 x double]*, [1100 x double]** %A.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom = sext i32 %11 to i64
  %arrayidx = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %idxprom
  %12 = load i32, i32* %j, align 4
  %idxprom5 = sext i32 %12 to i64
  %arrayidx6 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx, i64 0, i64 %idxprom5
  store double %div, double* %arrayidx6, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %13 = load i32, i32* %j, align 4
  %inc = add nsw i32 %13, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %14 = load i32, i32* %i, align 4
  %inc8 = add nsw i32 %14, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond10

for.cond10:                                       ; preds = %for.inc31, %for.end9
  %15 = load i32, i32* %i, align 4
  %16 = load i32, i32* %nk.addr, align 4
  %cmp11 = icmp slt i32 %15, %16
  br i1 %cmp11, label %for.body13, label %for.end33

for.body13:                                       ; preds = %for.cond10
  store i32 0, i32* %j, align 4
  br label %for.cond14

for.cond14:                                       ; preds = %for.inc28, %for.body13
  %17 = load i32, i32* %j, align 4
  %18 = load i32, i32* %nj.addr, align 4
  %cmp15 = icmp slt i32 %17, %18
  br i1 %cmp15, label %for.body17, label %for.end30

for.body17:                                       ; preds = %for.cond14
  %19 = load i32, i32* %i, align 4
  %20 = load i32, i32* %j, align 4
  %add18 = add nsw i32 %20, 1
  %mul19 = mul nsw i32 %19, %add18
  %21 = load i32, i32* %nj.addr, align 4
  %rem20 = srem i32 %mul19, %21
  %conv21 = sitofp i32 %rem20 to double
  %22 = load i32, i32* %nj.addr, align 4
  %conv22 = sitofp i32 %22 to double
  %div23 = fdiv double %conv21, %conv22
  %23 = load [900 x double]*, [900 x double]** %B.addr, align 8
  %24 = load i32, i32* %i, align 4
  %idxprom24 = sext i32 %24 to i64
  %arrayidx25 = getelementptr inbounds [900 x double], [900 x double]* %23, i64 %idxprom24
  %25 = load i32, i32* %j, align 4
  %idxprom26 = sext i32 %25 to i64
  %arrayidx27 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx25, i64 0, i64 %idxprom26
  store double %div23, double* %arrayidx27, align 8
  br label %for.inc28

for.inc28:                                        ; preds = %for.body17
  %26 = load i32, i32* %j, align 4
  %inc29 = add nsw i32 %26, 1
  store i32 %inc29, i32* %j, align 4
  br label %for.cond14

for.end30:                                        ; preds = %for.cond14
  br label %for.inc31

for.inc31:                                        ; preds = %for.end30
  %27 = load i32, i32* %i, align 4
  %inc32 = add nsw i32 %27, 1
  store i32 %inc32, i32* %i, align 4
  br label %for.cond10

for.end33:                                        ; preds = %for.cond10
  store i32 0, i32* %i, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc56, %for.end33
  %28 = load i32, i32* %i, align 4
  %29 = load i32, i32* %nj.addr, align 4
  %cmp35 = icmp slt i32 %28, %29
  br i1 %cmp35, label %for.body37, label %for.end58

for.body37:                                       ; preds = %for.cond34
  store i32 0, i32* %j, align 4
  br label %for.cond38

for.cond38:                                       ; preds = %for.inc53, %for.body37
  %30 = load i32, i32* %j, align 4
  %31 = load i32, i32* %nl.addr, align 4
  %cmp39 = icmp slt i32 %30, %31
  br i1 %cmp39, label %for.body41, label %for.end55

for.body41:                                       ; preds = %for.cond38
  %32 = load i32, i32* %i, align 4
  %33 = load i32, i32* %j, align 4
  %add42 = add nsw i32 %33, 3
  %mul43 = mul nsw i32 %32, %add42
  %add44 = add nsw i32 %mul43, 1
  %34 = load i32, i32* %nl.addr, align 4
  %rem45 = srem i32 %add44, %34
  %conv46 = sitofp i32 %rem45 to double
  %35 = load i32, i32* %nl.addr, align 4
  %conv47 = sitofp i32 %35 to double
  %div48 = fdiv double %conv46, %conv47
  %36 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom49 = sext i32 %37 to i64
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %36, i64 %idxprom49
  %38 = load i32, i32* %j, align 4
  %idxprom51 = sext i32 %38 to i64
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx50, i64 0, i64 %idxprom51
  store double %div48, double* %arrayidx52, align 8
  br label %for.inc53

for.inc53:                                        ; preds = %for.body41
  %39 = load i32, i32* %j, align 4
  %inc54 = add nsw i32 %39, 1
  store i32 %inc54, i32* %j, align 4
  br label %for.cond38

for.end55:                                        ; preds = %for.cond38
  br label %for.inc56

for.inc56:                                        ; preds = %for.end55
  %40 = load i32, i32* %i, align 4
  %inc57 = add nsw i32 %40, 1
  store i32 %inc57, i32* %i, align 4
  br label %for.cond34

for.end58:                                        ; preds = %for.cond34
  store i32 0, i32* %i, align 4
  br label %for.cond59

for.cond59:                                       ; preds = %for.inc80, %for.end58
  %41 = load i32, i32* %i, align 4
  %42 = load i32, i32* %ni.addr, align 4
  %cmp60 = icmp slt i32 %41, %42
  br i1 %cmp60, label %for.body62, label %for.end82

for.body62:                                       ; preds = %for.cond59
  store i32 0, i32* %j, align 4
  br label %for.cond63

for.cond63:                                       ; preds = %for.inc77, %for.body62
  %43 = load i32, i32* %j, align 4
  %44 = load i32, i32* %nl.addr, align 4
  %cmp64 = icmp slt i32 %43, %44
  br i1 %cmp64, label %for.body66, label %for.end79

for.body66:                                       ; preds = %for.cond63
  %45 = load i32, i32* %i, align 4
  %46 = load i32, i32* %j, align 4
  %add67 = add nsw i32 %46, 2
  %mul68 = mul nsw i32 %45, %add67
  %47 = load i32, i32* %nk.addr, align 4
  %rem69 = srem i32 %mul68, %47
  %conv70 = sitofp i32 %rem69 to double
  %48 = load i32, i32* %nk.addr, align 4
  %conv71 = sitofp i32 %48 to double
  %div72 = fdiv double %conv70, %conv71
  %49 = load [1200 x double]*, [1200 x double]** %D.addr, align 8
  %50 = load i32, i32* %i, align 4
  %idxprom73 = sext i32 %50 to i64
  %arrayidx74 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %idxprom73
  %51 = load i32, i32* %j, align 4
  %idxprom75 = sext i32 %51 to i64
  %arrayidx76 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx74, i64 0, i64 %idxprom75
  store double %div72, double* %arrayidx76, align 8
  br label %for.inc77

for.inc77:                                        ; preds = %for.body66
  %52 = load i32, i32* %j, align 4
  %inc78 = add nsw i32 %52, 1
  store i32 %inc78, i32* %j, align 4
  br label %for.cond63

for.end79:                                        ; preds = %for.cond63
  br label %for.inc80

for.inc80:                                        ; preds = %for.end79
  %53 = load i32, i32* %i, align 4
  %inc81 = add nsw i32 %53, 1
  store i32 %inc81, i32* %i, align 4
  br label %for.cond59

for.end82:                                        ; preds = %for.cond59
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* %tmp, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nj.addr = alloca i32, align 4
  %nk.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %alpha.addr = alloca double, align 8
  %beta.addr = alloca double, align 8
  %tmp.addr = alloca [900 x double]*, align 8
  %A.addr = alloca [1100 x double]*, align 8
  %B.addr = alloca [900 x double]*, align 8
  %C.addr = alloca [1200 x double]*, align 8
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nj, i32* %nj.addr, align 4
  store i32 %nk, i32* %nk.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store double %alpha, double* %alpha.addr, align 8
  store double %beta, double* %beta.addr, align 8
  store [900 x double]* %tmp, [900 x double]** %tmp.addr, align 8
  store [1100 x double]* %A, [1100 x double]** %A.addr, align 8
  store [900 x double]* %B, [900 x double]** %B.addr, align 8
  store [1200 x double]* %C, [1200 x double]** %C.addr, align 8
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc28, %entry
  %0 = load i32, i32* %i, align 4
  %1 = load i32, i32* %ni.addr, align 4
  %cmp = icmp slt i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end30

for.body:                                         ; preds = %for.cond
  store i32 0, i32* %j, align 4
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc25, %for.body
  %2 = load i32, i32* %j, align 4
  %3 = load i32, i32* %nj.addr, align 4
  %cmp5 = icmp slt i32 %2, %3
  br i1 %cmp5, label %for.body6, label %for.end27

for.body6:                                        ; preds = %for.cond4
  %4 = load [900 x double]*, [900 x double]** %tmp.addr, align 8
  %5 = load i32, i32* %i, align 4
  %idxprom = sext i32 %5 to i64
  %arrayidx = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %idxprom
  %6 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %6 to i64
  %arrayidx8 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx, i64 0, i64 %idxprom7
  store double 0.000000e+00, double* %arrayidx8, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond9

for.cond9:                                        ; preds = %for.inc, %for.body6
  %7 = load i32, i32* %k, align 4
  %8 = load i32, i32* %nk.addr, align 4
  %cmp10 = icmp slt i32 %7, %8
  br i1 %cmp10, label %for.body11, label %for.end

for.body11:                                       ; preds = %for.cond9
  %9 = load double, double* %alpha.addr, align 8
  %10 = load [1100 x double]*, [1100 x double]** %A.addr, align 8
  %11 = load i32, i32* %i, align 4
  %idxprom12 = sext i32 %11 to i64
  %arrayidx13 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %idxprom12
  %12 = load i32, i32* %k, align 4
  %idxprom14 = sext i32 %12 to i64
  %arrayidx15 = getelementptr inbounds [1100 x double], [1100 x double]* %arrayidx13, i64 0, i64 %idxprom14
  %13 = load double, double* %arrayidx15, align 8
  %mul = fmul double %9, %13
  %14 = load [900 x double]*, [900 x double]** %B.addr, align 8
  %15 = load i32, i32* %k, align 4
  %idxprom16 = sext i32 %15 to i64
  %arrayidx17 = getelementptr inbounds [900 x double], [900 x double]* %14, i64 %idxprom16
  %16 = load i32, i32* %j, align 4
  %idxprom18 = sext i32 %16 to i64
  %arrayidx19 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx17, i64 0, i64 %idxprom18
  %17 = load double, double* %arrayidx19, align 8
  %mul20 = fmul double %mul, %17
  %18 = load [900 x double]*, [900 x double]** %tmp.addr, align 8
  %19 = load i32, i32* %i, align 4
  %idxprom21 = sext i32 %19 to i64
  %arrayidx22 = getelementptr inbounds [900 x double], [900 x double]* %18, i64 %idxprom21
  %20 = load i32, i32* %j, align 4
  %idxprom23 = sext i32 %20 to i64
  %arrayidx24 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx22, i64 0, i64 %idxprom23
  %21 = load double, double* %arrayidx24, align 8
  %add = fadd double %21, %mul20
  store double %add, double* %arrayidx24, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body11
  %22 = load i32, i32* %k, align 4
  %inc = add nsw i32 %22, 1
  store i32 %inc, i32* %k, align 4
  br label %for.cond9

for.end:                                          ; preds = %for.cond9
  br label %for.inc25

for.inc25:                                        ; preds = %for.end
  %23 = load i32, i32* %j, align 4
  %inc26 = add nsw i32 %23, 1
  store i32 %inc26, i32* %j, align 4
  br label %for.cond4

for.end27:                                        ; preds = %for.cond4
  br label %for.inc28

for.inc28:                                        ; preds = %for.end27
  %24 = load i32, i32* %i, align 4
  %inc29 = add nsw i32 %24, 1
  store i32 %inc29, i32* %i, align 4
  br label %for.cond

for.end30:                                        ; preds = %for.cond
  store i32 0, i32* %i, align 4
  br label %for.cond31

for.cond31:                                       ; preds = %for.inc65, %for.end30
  %25 = load i32, i32* %i, align 4
  %26 = load i32, i32* %ni.addr, align 4
  %cmp32 = icmp slt i32 %25, %26
  br i1 %cmp32, label %for.body33, label %for.end67

for.body33:                                       ; preds = %for.cond31
  store i32 0, i32* %j, align 4
  br label %for.cond34

for.cond34:                                       ; preds = %for.inc62, %for.body33
  %27 = load i32, i32* %j, align 4
  %28 = load i32, i32* %nl.addr, align 4
  %cmp35 = icmp slt i32 %27, %28
  br i1 %cmp35, label %for.body36, label %for.end64

for.body36:                                       ; preds = %for.cond34
  %29 = load double, double* %beta.addr, align 8
  %30 = load [1200 x double]*, [1200 x double]** %D.addr, align 8
  %31 = load i32, i32* %i, align 4
  %idxprom37 = sext i32 %31 to i64
  %arrayidx38 = getelementptr inbounds [1200 x double], [1200 x double]* %30, i64 %idxprom37
  %32 = load i32, i32* %j, align 4
  %idxprom39 = sext i32 %32 to i64
  %arrayidx40 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx38, i64 0, i64 %idxprom39
  %33 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %33, %29
  store double %mul41, double* %arrayidx40, align 8
  store i32 0, i32* %k, align 4
  br label %for.cond42

for.cond42:                                       ; preds = %for.inc59, %for.body36
  %34 = load i32, i32* %k, align 4
  %35 = load i32, i32* %nj.addr, align 4
  %cmp43 = icmp slt i32 %34, %35
  br i1 %cmp43, label %for.body44, label %for.end61

for.body44:                                       ; preds = %for.cond42
  %36 = load [900 x double]*, [900 x double]** %tmp.addr, align 8
  %37 = load i32, i32* %i, align 4
  %idxprom45 = sext i32 %37 to i64
  %arrayidx46 = getelementptr inbounds [900 x double], [900 x double]* %36, i64 %idxprom45
  %38 = load i32, i32* %k, align 4
  %idxprom47 = sext i32 %38 to i64
  %arrayidx48 = getelementptr inbounds [900 x double], [900 x double]* %arrayidx46, i64 0, i64 %idxprom47
  %39 = load double, double* %arrayidx48, align 8
  %40 = load [1200 x double]*, [1200 x double]** %C.addr, align 8
  %41 = load i32, i32* %k, align 4
  %idxprom49 = sext i32 %41 to i64
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %40, i64 %idxprom49
  %42 = load i32, i32* %j, align 4
  %idxprom51 = sext i32 %42 to i64
  %arrayidx52 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx50, i64 0, i64 %idxprom51
  %43 = load double, double* %arrayidx52, align 8
  %mul53 = fmul double %39, %43
  %44 = load [1200 x double]*, [1200 x double]** %D.addr, align 8
  %45 = load i32, i32* %i, align 4
  %idxprom54 = sext i32 %45 to i64
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %44, i64 %idxprom54
  %46 = load i32, i32* %j, align 4
  %idxprom56 = sext i32 %46 to i64
  %arrayidx57 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx55, i64 0, i64 %idxprom56
  %47 = load double, double* %arrayidx57, align 8
  %add58 = fadd double %47, %mul53
  store double %add58, double* %arrayidx57, align 8
  br label %for.inc59

for.inc59:                                        ; preds = %for.body44
  %48 = load i32, i32* %k, align 4
  %inc60 = add nsw i32 %48, 1
  store i32 %inc60, i32* %k, align 4
  br label %for.cond42

for.end61:                                        ; preds = %for.cond42
  br label %for.inc62

for.inc62:                                        ; preds = %for.end61
  %49 = load i32, i32* %j, align 4
  %inc63 = add nsw i32 %49, 1
  store i32 %inc63, i32* %j, align 4
  br label %for.cond34

for.end64:                                        ; preds = %for.cond34
  br label %for.inc65

for.inc65:                                        ; preds = %for.end64
  %50 = load i32, i32* %i, align 4
  %inc66 = add nsw i32 %50, 1
  store i32 %inc66, i32* %i, align 4
  br label %for.cond31

for.end67:                                        ; preds = %for.cond31
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: nounwind readonly
declare i32 @strcmp(i8*, i8*) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %ni, i32 %nl, [1200 x double]* %D) #0 {
entry:
  %ni.addr = alloca i32, align 4
  %nl.addr = alloca i32, align 4
  %D.addr = alloca [1200 x double]*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 %ni, i32* %ni.addr, align 4
  store i32 %nl, i32* %nl.addr, align 4
  store [1200 x double]* %D, [1200 x double]** %D.addr, align 8
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
  %11 = load [1200 x double]*, [1200 x double]** %D.addr, align 8
  %12 = load i32, i32* %i, align 4
  %idxprom = sext i32 %12 to i64
  %arrayidx = getelementptr inbounds [1200 x double], [1200 x double]* %11, i64 %idxprom
  %13 = load i32, i32* %j, align 4
  %idxprom7 = sext i32 %13 to i64
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %arrayidx, i64 0, i64 %idxprom7
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

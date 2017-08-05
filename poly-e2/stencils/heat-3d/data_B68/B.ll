; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.inc22 ]
  %0 = trunc i64 %indvars.iv24 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next22, %for.inc19 ]
  %1 = trunc i64 %indvars.iv21 to i32
  %add = add i32 %sub, %1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv24, i64 %indvars.iv21, i64 %indvars.iv
  %3 = trunc i64 %indvars.iv to i32
  %4 = or i32 %3, 1
  %add7.1 = sub i32 %add, %4
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 1.000000e+01, double 1.000000e+01>
  %div = fdiv <2 x double> %mul, <double 1.200000e+02, double 1.200000e+02>
  %5 = bitcast double* %arrayidx12 to <2 x double>*
  %6 = bitcast double* %arrayidx18 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  store <2 x double> %div, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.inc

for.inc19:                                        ; preds = %for.inc
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond27, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %storemerge113 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc98, %for.cond1.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvars.iv120, 1
  %1 = add nsw i64 %indvars.iv120, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.inc95.us, %for.cond4.preheader
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc95.us ], [ 1, %for.cond4.preheader ]
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %2 = add nsw i64 %indvars.iv115, -1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 1, %for.cond8.preheader.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv115, i64 %indvars.iv
  %3 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv
  %4 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %4, 2.000000e+00
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv115, i64 %indvars.iv
  %5 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv.next116, i64 %indvars.iv
  %6 = load double, double* %arrayidx38.us, align 8
  %7 = insertelement <2 x double> undef, double %mul.us, i32 0
  %sub22.us.v.i1.2 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.us.v.i0.1 = insertelement <2 x double> undef, double %3, i32 0
  %sub22.us.v.i0.2 = insertelement <2 x double> %sub22.us.v.i0.1, double %6, i32 1
  %sub22.us = fsub <2 x double> %sub22.us.v.i0.2, %sub22.us.v.i1.2
  %sub22.us.v.r1 = extractelement <2 x double> %sub22.us, i32 0
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %2, i64 %indvars.iv
  %8 = load double, double* %arrayidx53.us, align 8
  %add30.us.v.i1.1 = insertelement <2 x double> undef, double %sub22.us.v.r1, i32 0
  %add30.us.v.i1.2 = insertelement <2 x double> %add30.us.v.i1.1, double %8, i32 1
  %add30.us.v.i0.1 = insertelement <2 x double> undef, double %5, i32 0
  %add30.us.v.i0.2 = shufflevector <2 x double> %add30.us.v.i0.1, <2 x double> %sub22.us, <2 x i32> <i32 0, i32 3>
  %add30.us = fadd <2 x double> %add30.us.v.i0.2, %add30.us.v.i1.2
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.us.v.r1 = extractelement <2 x double> %mul31.us, i32 0
  %mul31.us.v.r2 = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.us.v.r1, %mul31.us.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %9, %mul.us
  %10 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv120, i64 %indvars.iv115, i64 %10
  %11 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %11
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %4, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv120, i64 %indvars.iv115, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.us, label %for.inc.us

for.inc95.us:                                     ; preds = %for.inc.us
  %exitcond119 = icmp eq i64 %indvars.iv.next116, 119
  br i1 %exitcond119, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.inc95.us
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next121, 119
  br i1 %exitcond125, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %12 = add nsw i64 %indvars.iv136, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.inc203, %for.cond105.preheader
  %indvars.iv131 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next132, %for.inc203 ]
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %13 = add nsw i64 %indvars.iv131, -1
  br label %for.inc200

for.inc200:                                       ; preds = %for.inc200, %for.cond109.preheader
  %indvars.iv126 = phi i64 [ 1, %for.cond109.preheader ], [ %indvars.iv.next127, %for.inc200 ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next137, i64 %indvars.iv131, i64 %indvars.iv126
  %14 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv126
  %15 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %15, 2.000000e+00
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %12, i64 %indvars.iv131, i64 %indvars.iv126
  %16 = load double, double* %arrayidx134, align 8
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv.next132, i64 %indvars.iv126
  %17 = load double, double* %arrayidx143, align 8
  %18 = insertelement <2 x double> undef, double %mul126, i32 0
  %sub127.v.i1.2 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.v.i0.1 = insertelement <2 x double> undef, double %14, i32 0
  %sub127.v.i0.2 = insertelement <2 x double> %sub127.v.i0.1, double %17, i32 1
  %sub127 = fsub <2 x double> %sub127.v.i0.2, %sub127.v.i1.2
  %sub127.v.r1 = extractelement <2 x double> %sub127, i32 0
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %13, i64 %indvars.iv126
  %19 = load double, double* %arrayidx158, align 8
  %add135.v.i1.1 = insertelement <2 x double> undef, double %sub127.v.r1, i32 0
  %add135.v.i1.2 = insertelement <2 x double> %add135.v.i1.1, double %19, i32 1
  %add135.v.i0.1 = insertelement <2 x double> undef, double %16, i32 0
  %add135.v.i0.2 = shufflevector <2 x double> %add135.v.i0.1, <2 x double> %sub127, <2 x i32> <i32 0, i32 3>
  %add135 = fadd <2 x double> %add135.v.i0.2, %add135.v.i1.2
  %mul136 = fmul <2 x double> %add135, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1 = extractelement <2 x double> %mul136, i32 0
  %mul136.v.r2 = extractelement <2 x double> %mul136, i32 1
  %add161 = fadd double %mul136.v.r1, %mul136.v.r2
  %indvars.iv.next127 = add nuw nsw i64 %indvars.iv126, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv.next127
  %20 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %20, %mul126
  %21 = add nsw i64 %indvars.iv126, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv136, i64 %indvars.iv131, i64 %21
  %22 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %22
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %15, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv136, i64 %indvars.iv131, i64 %indvars.iv126
  store double %add193, double* %arrayidx199, align 8
  %exitcond130 = icmp eq i64 %indvars.iv.next127, 119
  br i1 %exitcond130, label %for.inc203, label %for.inc200

for.inc203:                                       ; preds = %for.inc200
  %exitcond135 = icmp eq i64 %indvars.iv.next132, 119
  br i1 %exitcond135, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %exitcond140 = icmp eq i64 %indvars.iv.next137, 119
  br i1 %exitcond140, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %storemerge113, 1
  %exitcond141 = icmp eq i32 %inc210, 501
  br i1 %exitcond141, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv24 = phi i64 [ 0, %entry ], [ %indvars.iv.next25, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv24, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv20 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next21, %for.inc18 ]
  %mul83 = add nuw nsw i64 %indvars.iv20, %3
  %add = mul nuw nsw i64 %mul83, 120
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond28, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

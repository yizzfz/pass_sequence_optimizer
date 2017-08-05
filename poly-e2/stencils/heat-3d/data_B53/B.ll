; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  %1 = bitcast i8* %call to [120 x [120 x double]]*
  tail call void @print_array([120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc22_crit_edge.us, %entry
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.cond1.for.inc22_crit_edge.us ]
  %0 = trunc i64 %indvars.iv56 to i32
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %cmp.us = icmp slt i64 %indvars.iv.next57, 120
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end24

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond1.preheader.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond4.for.inc19_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %1 = trunc i64 %indvars.iv52 to i32
  br label %for.inc.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 120
  br i1 %exitcond55, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %2 = trunc i64 %indvars.iv to i32
  %add.us.us = sub i32 120, %2
  %sub.us.us = add i32 %add.us.us, %0
  %add7.us.us = add i32 %sub.us.us, %1
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, 1.200000e+02
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond51, label %for.cond4.for.inc19_crit_edge.us.us, label %for.inc.us.us

for.end24:                                        ; preds = %for.cond1.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d([120 x [120 x double]]* %A, [120 x [120 x double]]* %B) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %inc21045 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc98, %for.cond1.preheader
  %indvars.iv54 = phi i64 [ %0, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvars.iv54, 1
  %1 = add nsw i64 %indvars.iv54, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond4.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond8.for.inc95_crit_edge.us ], [ 1, %for.cond4.preheader ]
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %2 = add nsw i64 %indvars.iv49, -1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ 1, %for.cond8.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %0, i64 %indvars.iv49, i64 %indvars.iv
  %3 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 %indvars.iv
  %4 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %4, 2.000000e+00
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %indvars.iv49, i64 %indvars.iv
  %5 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv.next50, i64 %indvars.iv
  %6 = load double, double* %arrayidx38.us, align 8
  %7 = insertelement <2 x double> undef, double %mul.us, i32 0
  %sub22.us.v.i1.2 = shufflevector <2 x double> %7, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.us.v.i0.1 = insertelement <2 x double> undef, double %3, i32 0
  %sub22.us.v.i0.2 = insertelement <2 x double> %sub22.us.v.i0.1, double %6, i32 1
  %sub22.us = fsub <2 x double> %sub22.us.v.i0.2, %sub22.us.v.i1.2
  %sub22.us.v.r1 = extractelement <2 x double> %sub22.us, i32 0
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %2, i64 %indvars.iv
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
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 %indvars.iv.next
  %9 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %9, %mul.us
  %10 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 %10
  %11 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %11
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %4, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv54, i64 %indvars.iv49, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us, label %for.inc.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.inc.us
  %exitcond53 = icmp eq i64 %indvars.iv.next50, 119
  br i1 %exitcond53, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.cond8.for.inc95_crit_edge.us
  %cmp2 = icmp slt i64 %0, 119
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond105.preheader.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvars.iv67 = phi i64 [ %12, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %12 = add nuw nsw i64 %indvars.iv67, 1
  %13 = add nsw i64 %indvars.iv67, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond105.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond109.for.inc203_crit_edge.us ], [ 1, %for.cond105.preheader ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %14 = add nsw i64 %indvars.iv63, -1
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us, %for.cond109.preheader.us
  %indvars.iv59 = phi i64 [ 1, %for.cond109.preheader.us ], [ %indvars.iv.next60, %for.inc200.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %12, i64 %indvars.iv63, i64 %indvars.iv59
  %15 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv67, i64 %indvars.iv63, i64 %indvars.iv59
  %16 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %16, 2.000000e+00
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %13, i64 %indvars.iv63, i64 %indvars.iv59
  %17 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv67, i64 %indvars.iv.next64, i64 %indvars.iv59
  %18 = load double, double* %arrayidx143.us, align 8
  %19 = insertelement <2 x double> undef, double %mul126.us, i32 0
  %sub127.us.v.i1.2 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.us.v.i0.1 = insertelement <2 x double> undef, double %15, i32 0
  %sub127.us.v.i0.2 = insertelement <2 x double> %sub127.us.v.i0.1, double %18, i32 1
  %sub127.us = fsub <2 x double> %sub127.us.v.i0.2, %sub127.us.v.i1.2
  %sub127.us.v.r1 = extractelement <2 x double> %sub127.us, i32 0
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv67, i64 %14, i64 %indvars.iv59
  %20 = load double, double* %arrayidx158.us, align 8
  %add135.us.v.i1.1 = insertelement <2 x double> undef, double %sub127.us.v.r1, i32 0
  %add135.us.v.i1.2 = insertelement <2 x double> %add135.us.v.i1.1, double %20, i32 1
  %add135.us.v.i0.1 = insertelement <2 x double> undef, double %17, i32 0
  %add135.us.v.i0.2 = shufflevector <2 x double> %add135.us.v.i0.1, <2 x double> %sub127.us, <2 x i32> <i32 0, i32 3>
  %add135.us = fadd <2 x double> %add135.us.v.i0.2, %add135.us.v.i1.2
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.us.v.r1 = extractelement <2 x double> %mul136.us, i32 0
  %mul136.us.v.r2 = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.us.v.r1, %mul136.us.v.r2
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv67, i64 %indvars.iv63, i64 %indvars.iv.next60
  %21 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %21, %mul126.us
  %22 = add nsw i64 %indvars.iv59, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv67, i64 %indvars.iv63, i64 %22
  %23 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %23
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %16, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv67, i64 %indvars.iv63, i64 %indvars.iv59
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %indvars.iv.next60, 119
  br i1 %cmp111.us, label %for.inc200.us, label %for.cond109.for.inc203_crit_edge.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.inc200.us
  %cmp107.us = icmp slt i64 %indvars.iv.next64, 119
  br i1 %cmp107.us, label %for.cond109.preheader.us, label %for.inc206

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %cmp103 = icmp slt i64 %12, 119
  br i1 %cmp103, label %for.cond105.preheader, label %for.inc209

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nsw i32 %inc21045, 1
  %cmp = icmp slt i32 %inc210, 501
  br i1 %cmp, label %for.cond1.preheader, label %for.end211

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([120 x [120 x double]]* %A) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %entry
  %indvars.iv58 = phi i64 [ 0, %entry ], [ %indvars.iv.next59, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv58, 120
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %cmp.us = icmp slt i64 %indvars.iv.next59, 120
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end23

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond2.preheader.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond2.preheader.us ]
  %mul83.us.us = add i64 %3, %indvars.iv54
  %add.us.us = mul i64 %mul83.us.us, 120
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 120
  br i1 %exitcond57, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %for.inc.us.us ]
  %4 = add i64 %add.us.us, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us.us = srem i32 %5, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %for.body7.us.us, %if.then.us.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv58, i64 %indvars.iv54, i64 %indvars.iv
  %8 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond53, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

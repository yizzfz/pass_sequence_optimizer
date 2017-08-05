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
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.for.inc22_crit_edge.us, %entry
  %indvars.iv50 = phi i64 [ 0, %entry ], [ %indvars.iv.next51, %for.cond1.for.inc22_crit_edge.us ]
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 120
  br i1 %exitcond53, label %for.end24, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next46, %for.cond4.for.inc19_crit_edge.us.us ]
  %0 = add nuw nsw i64 %indvars.iv45, %indvars.iv50
  %1 = trunc i64 %0 to i32
  %add.us.us = add i32 %1, 120
  br label %for.inc.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next46, %indvars.iv.next.1
  br i1 %exitcond49, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next.1, %for.inc.us.us ]
  %2 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %2
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, 1.200000e+02
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv50, i64 %indvars.iv45, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv50, i64 %indvars.iv45, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %3
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, 1.200000e+02
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv50, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv50, i64 %indvars.iv45, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us, label %for.inc.us.us

for.end24:                                        ; preds = %for.cond1.for.inc22_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %inc21049 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond8.preheader.us.preheader

for.cond8.preheader.us.preheader:                 ; preds = %for.cond1.preheader, %for.inc98
  %inc9917 = phi i32 [ %add, %for.inc98 ], [ 1, %for.cond1.preheader ]
  %add = add nsw i32 %inc9917, 1
  %idxprom = sext i32 %add to i64
  %idxprom16 = sext i32 %inc9917 to i64
  %sub23 = add nsw i32 %inc9917, -1
  %idxprom24 = sext i32 %sub23 to i64
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.us.preheader
  %indvars.iv52 = phi i64 [ 1, %for.cond8.preheader.us.preheader ], [ %indvars.iv.next53, %for.cond8.for.inc95_crit_edge.us ]
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %0 = add nsw i64 %indvars.iv52, -1
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond8.preheader.us
  %indvars.iv = phi i64 [ 1, %for.cond8.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom, i64 %indvars.iv52, i64 %indvars.iv
  %1 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv52, i64 %indvars.iv
  %2 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %2, 2.000000e+00
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom24, i64 %indvars.iv52, i64 %indvars.iv
  %3 = load double, double* %arrayidx29.us, align 8
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv.next53, i64 %indvars.iv
  %4 = load double, double* %arrayidx38.us, align 8
  %5 = insertelement <2 x double> undef, double %mul.us, i32 0
  %sub22.us.v.i1.2 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.us.v.i0.1 = insertelement <2 x double> undef, double %1, i32 0
  %sub22.us.v.i0.2 = insertelement <2 x double> %sub22.us.v.i0.1, double %4, i32 1
  %sub22.us = fsub <2 x double> %sub22.us.v.i0.2, %sub22.us.v.i1.2
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %0, i64 %indvars.iv
  %6 = load double, double* %arrayidx53.us, align 8
  %add30.us.v.i1.1 = insertelement <2 x double> undef, double %3, i32 0
  %add30.us.v.i1.2 = insertelement <2 x double> %add30.us.v.i1.1, double %6, i32 1
  %add30.us = fadd <2 x double> %sub22.us, %add30.us.v.i1.2
  %mul31.us = fmul <2 x double> %add30.us, <double 1.250000e-01, double 1.250000e-01>
  %mul31.us.v.r1 = extractelement <2 x double> %mul31.us, i32 0
  %mul31.us.v.r2 = extractelement <2 x double> %mul31.us, i32 1
  %add56.us = fadd double %mul31.us.v.r1, %mul31.us.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv52, i64 %indvars.iv.next
  %7 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %7, %mul.us
  %8 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv52, i64 %8
  %9 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %9
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %add81.us, %2
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom16, i64 %indvars.iv52, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us, label %for.inc.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.inc.us
  %exitcond56 = icmp eq i64 %indvars.iv.next53, %indvars.iv.next
  br i1 %exitcond56, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.cond8.for.inc95_crit_edge.us
  %cmp2 = icmp slt i32 %add, 119
  br i1 %cmp2, label %for.cond8.preheader.us.preheader, label %for.cond109.preheader.us.preheader.preheader

for.cond109.preheader.us.preheader.preheader:     ; preds = %for.inc98
  br label %for.cond109.preheader.us.preheader

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.us.preheader.preheader, %for.inc206
  %inc20734 = phi i32 [ %add113, %for.inc206 ], [ 1, %for.cond109.preheader.us.preheader.preheader ]
  %add113 = add nsw i32 %inc20734, 1
  %idxprom114 = sext i32 %add113 to i64
  %idxprom120 = sext i32 %inc20734 to i64
  %sub128 = add nsw i32 %inc20734, -1
  %idxprom129 = sext i32 %sub128 to i64
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.us.preheader
  %indvars.iv62 = phi i64 [ 1, %for.cond109.preheader.us.preheader ], [ %indvars.iv.next63, %for.cond109.for.inc203_crit_edge.us ]
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %10 = add nsw i64 %indvars.iv62, -1
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us, %for.cond109.preheader.us
  %indvars.iv57 = phi i64 [ 1, %for.cond109.preheader.us ], [ %indvars.iv.next58, %for.inc200.us ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom114, i64 %indvars.iv62, i64 %indvars.iv57
  %11 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv62, i64 %indvars.iv57
  %12 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %12, 2.000000e+00
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom129, i64 %indvars.iv62, i64 %indvars.iv57
  %13 = load double, double* %arrayidx134.us, align 8
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv.next63, i64 %indvars.iv57
  %14 = load double, double* %arrayidx143.us, align 8
  %15 = insertelement <2 x double> undef, double %mul126.us, i32 0
  %sub127.us.v.i1.2 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.us.v.i0.1 = insertelement <2 x double> undef, double %11, i32 0
  %sub127.us.v.i0.2 = insertelement <2 x double> %sub127.us.v.i0.1, double %14, i32 1
  %sub127.us = fsub <2 x double> %sub127.us.v.i0.2, %sub127.us.v.i1.2
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %10, i64 %indvars.iv57
  %16 = load double, double* %arrayidx158.us, align 8
  %add135.us.v.i1.1 = insertelement <2 x double> undef, double %13, i32 0
  %add135.us.v.i1.2 = insertelement <2 x double> %add135.us.v.i1.1, double %16, i32 1
  %add135.us = fadd <2 x double> %sub127.us, %add135.us.v.i1.2
  %mul136.us = fmul <2 x double> %add135.us, <double 1.250000e-01, double 1.250000e-01>
  %mul136.us.v.r1 = extractelement <2 x double> %mul136.us, i32 0
  %mul136.us.v.r2 = extractelement <2 x double> %mul136.us, i32 1
  %add161.us = fadd double %mul136.us.v.r1, %mul136.us.v.r2
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv62, i64 %indvars.iv.next58
  %17 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %17, %mul126.us
  %18 = add nsw i64 %indvars.iv57, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv62, i64 %18
  %19 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %19
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %add186.us, %12
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom120, i64 %indvars.iv62, i64 %indvars.iv57
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond61 = icmp eq i64 %indvars.iv.next58, 119
  br i1 %exitcond61, label %for.cond109.for.inc203_crit_edge.us, label %for.inc200.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.inc200.us
  %exitcond66 = icmp eq i64 %indvars.iv.next63, 119
  br i1 %exitcond66, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %cmp103 = icmp slt i32 %add113, 119
  br i1 %cmp103, label %for.cond109.preheader.us.preheader, label %for.inc209

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %inc21049, 1
  %exitcond67 = icmp eq i32 %inc210, 501
  br i1 %exitcond67, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.for.inc21_crit_edge.us, %entry
  %indvars.iv50 = phi i64 [ 0, %entry ], [ %indvars.iv.next51, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv50, 120
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next51, 120
  br i1 %exitcond54, label %for.end23, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next47, %for.cond5.for.inc18_crit_edge.us.us ]
  %mul83.us.us = add i64 %3, %indvars.iv46
  %add.us.us = mul i64 %mul83.us.us, 120
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %indvars.iv.next
  br i1 %exitcond49, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

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
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv50, i64 %indvars.iv46, i64 %indvars.iv
  %8 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
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

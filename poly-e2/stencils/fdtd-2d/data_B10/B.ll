; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
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
  %1 = bitcast i8* %call2 to [1200 x double]*
  %2 = bitcast i8* %call1 to [1200 x double]*
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) unnamed_addr #2 {
entry:
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.cond5.for.inc39_crit_edge.us
  %indvars.iv310.us = phi i64 [ %indvars.iv.next4.us, %for.cond5.for.inc39_crit_edge.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv310.us to i32
  %conv9.us = sitofp i32 %0 to double
  %1 = insertelement <2 x double> undef, double %conv9.us, i32 0
  %mul.us.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.body8.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %2 = trunc i64 %indvars.iv.next.us to i32
  %conv10.us = sitofp i32 %2 to double
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  %3 = add nuw nsw i64 %indvars.iv8.us, 2
  %4 = trunc i64 %3 to i32
  %conv18.us = sitofp i32 %4 to double
  %mul.us.v.i1.1 = insertelement <2 x double> undef, double %conv10.us, i32 0
  %mul.us.v.i1.2 = insertelement <2 x double> %mul.us.v.i1.1, double %conv18.us, i32 1
  %mul.us = fmul <2 x double> %mul.us.v.i0.2, %mul.us.v.i1.2
  %div.us = fdiv <2 x double> %mul.us, <double 1.000000e+03, double 1.200000e+03>
  %div.us.v.r1 = extractelement <2 x double> %div.us, i32 0
  %div.us.v.r2 = extractelement <2 x double> %div.us, i32 1
  store double %div.us.v.r1, double* %arrayidx15.us, align 8
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div.us.v.r2, double* %arrayidx25.us, align 8
  %5 = add nuw nsw i64 %indvars.iv8.us, 3
  %6 = trunc i64 %5 to i32
  %conv28.us = sitofp i32 %6 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv8.us, 1199
  br i1 %exitcond, label %for.cond5.for.inc39_crit_edge.us, label %for.body8.us

for.cond5.for.inc39_crit_edge.us:                 ; preds = %for.body8.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv310.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond17, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body.for.body_crit_edge, %entry
  %indvars.iv513 = phi i64 [ %indvars.iv.next6, %for.body.for.body_crit_edge ], [ 0, %entry ]
  %7 = trunc i64 %indvars.iv513 to i32
  %conv = sitofp i32 %7 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513
  store double %conv, double* %arrayidx, align 8
  %exitcond16 = icmp eq i64 %indvars.iv513, 499
  br i1 %exitcond16, label %for.cond5.preheader.us.preheader, label %for.body.for.body_crit_edge

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.body.for.body_crit_edge:                      ; preds = %for.body
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  br label %for.body

for.end41:                                        ; preds = %for.cond5.for.inc39_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv1636 = phi i64 [ 0, %entry ], [ %indvars.iv.next17, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.cond10.for.inc34_crit_edge.us
  %indvars.iv323.us = phi i64 [ %indvars.iv.next4.us, %for.cond10.for.inc34_crit_edge.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add nsw i64 %indvars.iv323.us, -1
  br label %for.body12.us

for.body12.us:                                    ; preds = %for.body12.us.for.body12.us_crit_edge, %for.cond10.preheader.us
  %indvars.iv121.us = phi i64 [ 0, %for.cond10.preheader.us ], [ %indvars.iv.next2.us, %for.body12.us.for.body12.us_crit_edge ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %1 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %2 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %0, i64 %indvars.iv121.us
  %3 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %2, %3
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %1, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %exitcond41 = icmp eq i64 %indvars.iv121.us, 1199
  br i1 %exitcond41, label %for.cond10.for.inc34_crit_edge.us, label %for.body12.us.for.body12.us_crit_edge

for.body12.us.for.body12.us_crit_edge:            ; preds = %for.body12.us
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv121.us, 1
  br label %for.body12.us

for.cond10.for.inc34_crit_edge.us:                ; preds = %for.body12.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv323.us, 1
  %cmp8.us = icmp slt i64 %indvars.iv.next4.us, 1000
  br i1 %cmp8.us, label %for.cond10.preheader.us, label %for.cond40.preheader.us.preheader

for.cond40.preheader.us.preheader:                ; preds = %for.cond10.for.inc34_crit_edge.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.cond1.preheader
  %indvars.iv19 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3.for.body3_crit_edge ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr1 = mul i64 %indvars.iv1636, 8
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  %4 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv19
  %5 = bitcast double* %arrayidx6 to i64*
  store i64 %4, i64* %5, align 8
  %exitcond = icmp eq i64 %indvars.iv19, 1199
  br i1 %exitcond, label %for.cond10.preheader.us.preheader, label %for.body3.for.body3_crit_edge

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  br label %for.body3

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.cond40.for.inc66_crit_edge.us
  %indvars.iv928.us = phi i64 [ %indvars.iv.next10.us, %for.cond40.for.inc66_crit_edge.us ], [ 0, %for.cond40.preheader.us.preheader ]
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us.for.body42.us_crit_edge, %for.cond40.preheader.us
  %indvars.iv626.us = phi i64 [ 1, %for.cond40.preheader.us ], [ %indvars.iv.next7.us, %for.body42.us.for.body42.us_crit_edge ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %6 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %7 = load double, double* %arrayidx50.us, align 8
  %8 = add nsw i64 %indvars.iv626.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %8
  %9 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %7, %9
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %6, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %exitcond43 = icmp eq i64 %indvars.iv626.us, 1199
  br i1 %exitcond43, label %for.cond40.for.inc66_crit_edge.us, label %for.body42.us.for.body42.us_crit_edge

for.body42.us.for.body42.us_crit_edge:            ; preds = %for.body42.us
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv626.us, 1
  br label %for.body42.us

for.cond40.for.inc66_crit_edge.us:                ; preds = %for.body42.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv928.us, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next10.us, 1000
  br i1 %cmp38.us, label %for.cond40.preheader.us, label %for.cond73.preheader.us.preheader

for.cond73.preheader.us.preheader:                ; preds = %for.cond40.for.inc66_crit_edge.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.cond73.for.inc110_crit_edge.us
  %indvars.iv1333.us = phi i64 [ %indvars.iv.next14.us, %for.cond73.for.inc110_crit_edge.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %10 = add nuw nsw i64 %indvars.iv1333.us, 1
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us, %for.cond73.preheader.us
  %indvars.iv1131.us = phi i64 [ 0, %for.cond73.preheader.us ], [ %indvars.iv.next12.us, %for.body76.us ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %11 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1131.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv.next12.us
  %12 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %13 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %12, %13
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %10, i64 %indvars.iv1131.us
  %14 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %14
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %15 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %15
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %11, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %cmp75.us = icmp slt i64 %indvars.iv.next12.us, 1199
  br i1 %cmp75.us, label %for.body76.us, label %for.cond73.for.inc110_crit_edge.us

for.cond73.for.inc110_crit_edge.us:               ; preds = %for.body76.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1333.us, 1
  %cmp71.us = icmp slt i64 %indvars.iv.next14.us, 999
  br i1 %cmp71.us, label %for.cond73.preheader.us, label %for.inc113

for.inc113:                                       ; preds = %for.cond73.for.inc110_crit_edge.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1636, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next17, 500
  br i1 %exitcond46, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv2036.us = phi i64 [ 0, %entry ], [ %indvars.iv.next21.us, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv2036.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv1734.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next18.us, %if.end.us ]
  %4 = add nsw i64 %indvars.iv1734.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2036.us, i64 %indvars.iv1734.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1734.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next18.us, 1200
  br i1 %exitcond46, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2036.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond47, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.for.inc37_crit_edge.us, %for.end12
  %indvars.iv1431.us = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next15.us, %for.cond19.for.inc37_crit_edge.us ]
  %13 = mul nsw i64 %indvars.iv1431.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv1129.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next12.us, %if.end28.us ]
  %14 = add nsw i64 %indvars.iv1129.us, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1431.us, i64 %indvars.iv1129.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1129.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond44, label %for.cond19.for.inc37_crit_edge.us, label %for.body21.us

for.cond19.for.inc37_crit_edge.us:                ; preds = %if.end28.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1431.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond45, label %for.end39, label %for.cond19.preheader.us

for.end39:                                        ; preds = %for.cond19.for.inc37_crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.for.inc63_crit_edge.us, %for.end39
  %indvars.iv826.us = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next9.us, %for.cond45.for.inc63_crit_edge.us ]
  %21 = mul nsw i64 %indvars.iv826.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %if.end54.us ]
  %22 = add nsw i64 %indvars.iv24.us, %21
  %23 = trunc i64 %22 to i32
  %rem50.us = srem i32 %23, 20
  %cmp51.us = icmp eq i32 %rem50.us, 0
  br i1 %cmp51.us, label %if.then52.us, label %if.end54.us

if.then52.us:                                     ; preds = %for.body47.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %if.end54.us

if.end54.us:                                      ; preds = %for.body47.us, %if.then52.us
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv826.us, i64 %indvars.iv24.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.cond45.for.inc63_crit_edge.us, label %for.body47.us

for.cond45.for.inc63_crit_edge.us:                ; preds = %if.end54.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv826.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond43, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.cond45.for.inc63_crit_edge.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}

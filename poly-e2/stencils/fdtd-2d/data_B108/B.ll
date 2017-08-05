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
entry.for.body_crit_edge:
  br label %for.body

for.cond5.preheader.us:                           ; preds = %for.cond5.preheader.us.preheader, %for.inc39.us
  %indvars.iv310.us = phi i64 [ %indvars.iv.next4.us, %for.inc39.us ], [ 0, %for.cond5.preheader.us.preheader ]
  %0 = trunc i64 %indvars.iv310.us to i32
  %conv9.us = sitofp i32 %0 to double
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us, %for.cond5.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %for.cond5.preheader.us ], [ %indvars.iv.next.us, %for.body8.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %1 = trunc i64 %indvars.iv.next.us to i32
  %conv10.us = sitofp i32 %1 to double
  %mul.us = fmul double %conv9.us, %conv10.us
  %div.us = fdiv double %mul.us, 1.000000e+03
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div.us, double* %arrayidx15.us, align 8
  %2 = add nuw nsw i64 %indvars.iv8.us, 2
  %3 = trunc i64 %2 to i32
  %conv18.us = sitofp i32 %3 to double
  %mul19.us = fmul double %conv9.us, %conv18.us
  %div21.us = fdiv double %mul19.us, 1.200000e+03
  %arrayidx25.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div21.us, double* %arrayidx25.us, align 8
  %4 = add nuw nsw i64 %indvars.iv8.us, 3
  %5 = trunc i64 %4 to i32
  %conv28.us = sitofp i32 %5 to double
  %mul29.us = fmul double %conv9.us, %conv28.us
  %div31.us = fdiv double %mul29.us, 1.000000e+03
  %arrayidx35.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv310.us, i64 %indvars.iv8.us
  store double %div31.us, double* %arrayidx35.us, align 8
  %exitcond = icmp eq i64 %indvars.iv8.us, 1199
  br i1 %exitcond, label %for.inc39.us, label %for.body8.us

for.inc39.us:                                     ; preds = %for.body8.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv310.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond16, label %for.end41, label %for.cond5.preheader.us

for.body:                                         ; preds = %for.body, %entry.for.body_crit_edge
  %indvars.iv513 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next6.4, %for.body ]
  %6 = trunc i64 %indvars.iv513 to i32
  %conv = sitofp i32 %6 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv513
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %7 = trunc i64 %indvars.iv.next6 to i32
  %conv.1 = sitofp i32 %7 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  %8 = trunc i64 %indvars.iv.next6.1 to i32
  %conv.2 = sitofp i32 %8 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv513, 3
  %9 = trunc i64 %indvars.iv.next6.2 to i32
  %conv.3 = sitofp i32 %9 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv513, 4
  %10 = trunc i64 %indvars.iv.next6.3 to i32
  %conv.4 = sitofp i32 %10 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next6.3
  store double %conv.4, double* %arrayidx.4, align 8
  %exitcond15.4 = icmp eq i64 %indvars.iv.next6.3, 499
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv513, 5
  br i1 %exitcond15.4, label %for.cond5.preheader.us.preheader, label %for.body

for.cond5.preheader.us.preheader:                 ; preds = %for.body
  br label %for.cond5.preheader.us

for.end41:                                        ; preds = %for.inc39.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader.lr.ph, %for.inc113
  %indvars.iv1636 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next17, %for.inc113 ]
  br label %for.body3

for.cond10.preheader.us:                          ; preds = %for.cond10.preheader.us.preheader, %for.inc34.us
  %indvar = phi i64 [ %0, %for.inc34.us ], [ 0, %for.cond10.preheader.us.preheader ]
  %indvars.iv323.us = phi i64 [ %indvars.iv.next4.us, %for.inc34.us ], [ 1, %for.cond10.preheader.us.preheader ]
  %0 = add i64 %indvar, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %0, i64 0
  %1 = add i64 %indvar, 2
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %1, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %1, i64 0
  %2 = add nsw i64 %indvars.iv323.us, -1
  %bound074 = icmp ult double* %scevgep66, %scevgep72
  %bound175 = icmp ult double* %scevgep70, %scevgep68
  %found.conflict76 = and i1 %bound074, %bound175
  br i1 %found.conflict76, label %for.body12.us.preheader, label %vector.body61.preheader

vector.body61.preheader:                          ; preds = %for.cond10.preheader.us
  br label %vector.body61

for.body12.us.preheader:                          ; preds = %for.cond10.preheader.us
  br label %for.body12.us

vector.body61:                                    ; preds = %vector.body61.preheader, %vector.body61
  %index80 = phi i64 [ %index.next81, %vector.body61 ], [ 0, %vector.body61.preheader ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %index80
  %4 = bitcast double* %3 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  %5 = getelementptr double, double* %3, i64 2
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %index80
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !4
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !4
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %index80
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !4
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !4
  %15 = fsub <2 x double> %wide.load90, %wide.load92
  %16 = fsub <2 x double> %wide.load91, %wide.load93
  %17 = fmul <2 x double> %15, <double 5.000000e-01, double 5.000000e-01>
  %18 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %19 = fsub <2 x double> %wide.load88, %17
  %20 = fsub <2 x double> %wide.load89, %18
  store <2 x double> %19, <2 x double>* %4, align 8, !alias.scope !1, !noalias !4
  store <2 x double> %20, <2 x double>* %6, align 8, !alias.scope !1, !noalias !4
  %index.next81 = add i64 %index80, 4
  %21 = icmp eq i64 %index.next81, 1200
  br i1 %21, label %for.inc34.us, label %vector.body61, !llvm.loop !6

for.body12.us:                                    ; preds = %for.body12.us, %for.body12.us.preheader
  %indvars.iv121.us = phi i64 [ 0, %for.body12.us.preheader ], [ %indvars.iv.next2.us.1, %for.body12.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %22 = load double, double* %arrayidx16.us, align 8
  %arrayidx20.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv121.us
  %23 = load double, double* %arrayidx20.us, align 8
  %arrayidx24.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv121.us
  %24 = load double, double* %arrayidx24.us, align 8
  %sub25.us = fsub double %23, %24
  %mul.us = fmul double %sub25.us, 5.000000e-01
  %sub26.us = fsub double %22, %mul.us
  store double %sub26.us, double* %arrayidx16.us, align 8
  %indvars.iv.next2.us = or i64 %indvars.iv121.us, 1
  %arrayidx16.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %25 = load double, double* %arrayidx16.us.1, align 8
  %arrayidx20.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv323.us, i64 %indvars.iv.next2.us
  %26 = load double, double* %arrayidx20.us.1, align 8
  %arrayidx24.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %2, i64 %indvars.iv.next2.us
  %27 = load double, double* %arrayidx24.us.1, align 8
  %sub25.us.1 = fsub double %26, %27
  %mul.us.1 = fmul double %sub25.us.1, 5.000000e-01
  %sub26.us.1 = fsub double %25, %mul.us.1
  store double %sub26.us.1, double* %arrayidx16.us.1, align 8
  %exitcond39.1 = icmp eq i64 %indvars.iv.next2.us, 1199
  %indvars.iv.next2.us.1 = add nsw i64 %indvars.iv121.us, 2
  br i1 %exitcond39.1, label %for.inc34.us, label %for.body12.us, !llvm.loop !9

for.inc34.us:                                     ; preds = %vector.body61, %for.body12.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv323.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond42, label %for.cond40.preheader.us.preheader, label %for.cond10.preheader.us

for.cond40.preheader.us.preheader:                ; preds = %for.inc34.us
  br label %for.cond40.preheader.us

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv19 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next.4, %for.body3 ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr95 = mul i64 %indvars.iv1636, 8
  %sunkaddr96 = add i64 %sunkaddr, %sunkaddr95
  %sunkaddr97 = inttoptr i64 %sunkaddr96 to i64*
  %28 = load i64, i64* %sunkaddr97, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv19
  %29 = bitcast double* %arrayidx6 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv19, 1
  %sunkaddr98 = ptrtoint double* %_fict_ to i64
  %sunkaddr99 = mul i64 %indvars.iv1636, 8
  %sunkaddr100 = add i64 %sunkaddr98, %sunkaddr99
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to i64*
  %30 = load i64, i64* %sunkaddr101, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %31 = bitcast double* %arrayidx6.1 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %sunkaddr102 = ptrtoint double* %_fict_ to i64
  %sunkaddr103 = mul i64 %indvars.iv1636, 8
  %sunkaddr104 = add i64 %sunkaddr102, %sunkaddr103
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to i64*
  %32 = load i64, i64* %sunkaddr105, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %arrayidx6.2 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv19, 3
  %sunkaddr106 = ptrtoint double* %_fict_ to i64
  %sunkaddr107 = mul i64 %indvars.iv1636, 8
  %sunkaddr108 = add i64 %sunkaddr106, %sunkaddr107
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to i64*
  %34 = load i64, i64* %sunkaddr109, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %35 = bitcast double* %arrayidx6.3 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv19, 4
  %sunkaddr110 = ptrtoint double* %_fict_ to i64
  %sunkaddr111 = mul i64 %indvars.iv1636, 8
  %sunkaddr112 = add i64 %sunkaddr110, %sunkaddr111
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to i64*
  %36 = load i64, i64* %sunkaddr113, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %37 = bitcast double* %arrayidx6.4 to i64*
  store i64 %36, i64* %37, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1199
  %indvars.iv.next.4 = add nsw i64 %indvars.iv19, 5
  br i1 %exitcond.4, label %for.cond10.preheader.us.preheader, label %for.body3

for.cond10.preheader.us.preheader:                ; preds = %for.body3
  br label %for.cond10.preheader.us

for.cond40.preheader.us:                          ; preds = %for.cond40.preheader.us.preheader, %for.inc66.us
  %indvars.iv928.us = phi i64 [ %38, %for.inc66.us ], [ 0, %for.cond40.preheader.us.preheader ]
  %scevgep33 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 1
  %38 = add i64 %indvars.iv928.us, 1
  %scevgep35 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %38, i64 0
  %scevgep37 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 0
  %scevgep39 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %38, i64 0
  %bound041 = icmp ult double* %scevgep33, %scevgep39
  %bound142 = icmp ult double* %scevgep37, %scevgep35
  %found.conflict43 = and i1 %bound041, %bound142
  br i1 %found.conflict43, label %for.body42.us.preheader.new, label %vector.body28.preheader

vector.body28.preheader:                          ; preds = %for.cond40.preheader.us
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28.preheader, %vector.body28
  %index47 = phi i64 [ %index.next48, %vector.body28 ], [ 0, %vector.body28.preheader ]
  %offset.idx = or i64 %index47, 1
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %offset.idx
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %offset.idx
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !13
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !13
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %index47
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !13
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !13
  %51 = fsub <2 x double> %wide.load57, %wide.load59
  %52 = fsub <2 x double> %wide.load58, %wide.load60
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %55 = fsub <2 x double> %wide.load55, %53
  %56 = fsub <2 x double> %wide.load56, %54
  store <2 x double> %55, <2 x double>* %40, align 8, !alias.scope !10, !noalias !13
  store <2 x double> %56, <2 x double>* %42, align 8, !alias.scope !10, !noalias !13
  %index.next48 = add i64 %index47, 4
  %57 = icmp eq i64 %index.next48, 1196
  br i1 %57, label %for.body42.us.preheader.new, label %vector.body28, !llvm.loop !15

for.body42.us.preheader.new:                      ; preds = %vector.body28, %for.cond40.preheader.us
  %indvars.iv626.us.ph = phi i64 [ 1, %for.cond40.preheader.us ], [ 1197, %vector.body28 ]
  %arrayidx46.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us.ph
  %58 = load double, double* %arrayidx46.us.prol, align 8
  %arrayidx50.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us.ph
  %59 = load double, double* %arrayidx50.us.prol, align 8
  %60 = add nsw i64 %indvars.iv626.us.ph, -1
  %arrayidx55.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %60
  %61 = load double, double* %arrayidx55.us.prol, align 8
  %sub56.us.prol = fsub double %59, %61
  %mul57.us.prol = fmul double %sub56.us.prol, 5.000000e-01
  %sub58.us.prol = fsub double %58, %mul57.us.prol
  store double %sub58.us.prol, double* %arrayidx46.us.prol, align 8
  %indvars.iv.next7.us.prol = add nuw nsw i64 %indvars.iv626.us.ph, 1
  br label %for.body42.us

for.body42.us:                                    ; preds = %for.body42.us, %for.body42.us.preheader.new
  %indvars.iv626.us = phi i64 [ %indvars.iv.next7.us.prol, %for.body42.us.preheader.new ], [ %indvars.iv.next7.us.1, %for.body42.us ]
  %arrayidx46.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %62 = load double, double* %arrayidx46.us, align 8
  %arrayidx50.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %63 = load double, double* %arrayidx50.us, align 8
  %64 = add nsw i64 %indvars.iv626.us, -1
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %64
  %65 = load double, double* %arrayidx55.us, align 8
  %sub56.us = fsub double %63, %65
  %mul57.us = fmul double %sub56.us, 5.000000e-01
  %sub58.us = fsub double %62, %mul57.us
  store double %sub58.us, double* %arrayidx46.us, align 8
  %indvars.iv.next7.us = add nuw nsw i64 %indvars.iv626.us, 1
  %arrayidx46.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %66 = load double, double* %arrayidx46.us.1, align 8
  %arrayidx50.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv.next7.us
  %67 = load double, double* %arrayidx50.us.1, align 8
  %arrayidx55.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv928.us, i64 %indvars.iv626.us
  %68 = load double, double* %arrayidx55.us.1, align 8
  %sub56.us.1 = fsub double %67, %68
  %mul57.us.1 = fmul double %sub56.us.1, 5.000000e-01
  %sub58.us.1 = fsub double %66, %mul57.us.1
  store double %sub58.us.1, double* %arrayidx46.us.1, align 8
  %exitcond41.1 = icmp eq i64 %indvars.iv.next7.us, 1199
  %indvars.iv.next7.us.1 = add nsw i64 %indvars.iv626.us, 2
  br i1 %exitcond41.1, label %for.inc66.us, label %for.body42.us, !llvm.loop !16

for.inc66.us:                                     ; preds = %for.body42.us
  %exitcond43 = icmp eq i64 %38, 1000
  br i1 %exitcond43, label %for.cond73.preheader.us.preheader, label %for.cond40.preheader.us

for.cond73.preheader.us.preheader:                ; preds = %for.inc66.us
  br label %for.cond73.preheader.us

for.cond73.preheader.us:                          ; preds = %for.cond73.preheader.us.preheader, %for.inc110.us
  %indvars.iv1333.us = phi i64 [ %69, %for.inc110.us ], [ 0, %for.cond73.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 0
  %scevgep5 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 1199
  %scevgep7 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 0
  %69 = add i64 %indvars.iv1333.us, 1
  %scevgep9 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %69, i64 0
  %scevgep11 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 0
  %scevgep13 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %69, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %found.conflict = and i1 %bound0, %bound1
  %bound015 = icmp ult double* %scevgep, %scevgep13
  %bound116 = icmp ult double* %scevgep11, %scevgep5
  %found.conflict17 = and i1 %bound015, %bound116
  %conflict.rdx = or i1 %found.conflict, %found.conflict17
  br i1 %conflict.rdx, label %for.body76.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !17, !noalias !20
  %74 = or i64 %index, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !23
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !23
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !23
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !23
  %83 = fsub <2 x double> %wide.load20, %wide.load22
  %84 = fsub <2 x double> %wide.load21, %wide.load23
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %69, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !24
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !24
  %89 = fadd <2 x double> %83, %wide.load24
  %90 = fadd <2 x double> %84, %wide.load25
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !24
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !24
  %95 = fsub <2 x double> %89, %wide.load26
  %96 = fsub <2 x double> %90, %wide.load27
  %97 = fmul <2 x double> %95, <double 7.000000e-01, double 7.000000e-01>
  %98 = fmul <2 x double> %96, <double 7.000000e-01, double 7.000000e-01>
  %99 = fsub <2 x double> %wide.load, %97
  %100 = fsub <2 x double> %wide.load19, %98
  store <2 x double> %99, <2 x double>* %71, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %100, <2 x double>* %73, align 8, !alias.scope !17, !noalias !20
  %index.next = add i64 %index, 4
  %101 = icmp eq i64 %index.next, 1196
  br i1 %101, label %for.body76.us.preheader, label %vector.body, !llvm.loop !25

for.body76.us.preheader:                          ; preds = %vector.body, %for.cond73.preheader.us
  %indvars.iv1131.us.ph = phi i64 [ 0, %for.cond73.preheader.us ], [ 1196, %vector.body ]
  br label %for.body76.us

for.body76.us:                                    ; preds = %for.body76.us.preheader, %for.body76.us
  %indvars.iv1131.us = phi i64 [ %indvars.iv.next12.us, %for.body76.us ], [ %indvars.iv1131.us.ph, %for.body76.us.preheader ]
  %arrayidx80.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %102 = load double, double* %arrayidx80.us, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1131.us, 1
  %arrayidx84.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv.next12.us
  %103 = load double, double* %arrayidx84.us, align 8
  %arrayidx88.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %104 = load double, double* %arrayidx88.us, align 8
  %sub89.us = fsub double %103, %104
  %arrayidx94.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %69, i64 %indvars.iv1131.us
  %105 = load double, double* %arrayidx94.us, align 8
  %add95.us = fadd double %sub89.us, %105
  %arrayidx99.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1333.us, i64 %indvars.iv1131.us
  %106 = load double, double* %arrayidx99.us, align 8
  %sub100.us = fsub double %add95.us, %106
  %mul101.us = fmul double %sub100.us, 7.000000e-01
  %sub102.us = fsub double %102, %mul101.us
  store double %sub102.us, double* %arrayidx80.us, align 8
  %exitcond49 = icmp eq i64 %indvars.iv.next12.us, 1199
  br i1 %exitcond49, label %for.inc110.us, label %for.body76.us, !llvm.loop !26

for.inc110.us:                                    ; preds = %for.body76.us
  %exitcond50 = icmp eq i64 %69, 999
  br i1 %exitcond50, label %for.inc113, label %for.cond73.preheader.us

for.inc113:                                       ; preds = %for.inc110.us
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1636, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next17, 500
  br i1 %exitcond44, label %for.end115, label %for.body3.lr.ph

for.end115:                                       ; preds = %for.inc113
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc10.us
  %indvars.iv1436.us = phi i64 [ %indvars.iv.next15.us, %for.inc10.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %3 = mul nuw nsw i64 %indvars.iv1436.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv1134.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next12.us, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv1134.us, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc22.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1436.us, i64 %indvars.iv1134.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1134.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond43, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1436.us, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond44, label %for.cond19.preheader.us.preheader, label %for.cond2.preheader.us

for.cond19.preheader.us.preheader:                ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %for.cond19.preheader.us

for.cond19.preheader.us:                          ; preds = %for.cond19.preheader.us.preheader, %for.inc37.us
  %indvars.iv831.us = phi i64 [ %indvars.iv.next9.us, %for.inc37.us ], [ 0, %for.cond19.preheader.us.preheader ]
  %13 = mul nuw nsw i64 %indvars.iv831.us, 1000
  br label %for.body21.us

for.body21.us:                                    ; preds = %if.end28.us, %for.cond19.preheader.us
  %indvars.iv529.us = phi i64 [ 0, %for.cond19.preheader.us ], [ %indvars.iv.next6.us, %if.end28.us ]
  %14 = add nuw nsw i64 %indvars.iv529.us, %13
  %15 = trunc i64 %14 to i32
  %rem24.us = srem i32 %15, 20
  %cmp25.us = icmp eq i32 %rem24.us, 0
  br i1 %cmp25.us, label %if.then26.us, label %if.end28.us

if.then26.us:                                     ; preds = %for.body21.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc19.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28.us

if.end28.us:                                      ; preds = %for.body21.us, %if.then26.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32.us = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv831.us, i64 %indvars.iv529.us
  %18 = load double, double* %arrayidx32.us, align 8
  %call33.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv529.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next6.us, 1200
  br i1 %exitcond41, label %for.inc37.us, label %for.body21.us

for.inc37.us:                                     ; preds = %if.end28.us
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv831.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next9.us, 1000
  br i1 %exitcond42, label %for.cond45.preheader.us.preheader, label %for.cond19.preheader.us

for.cond45.preheader.us.preheader:                ; preds = %for.inc37.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %for.cond45.preheader.us

for.cond45.preheader.us:                          ; preds = %for.cond45.preheader.us.preheader, %for.inc63.us
  %indvars.iv226.us = phi i64 [ %indvars.iv.next3.us, %for.inc63.us ], [ 0, %for.cond45.preheader.us.preheader ]
  %21 = mul nuw nsw i64 %indvars.iv226.us, 1000
  br label %for.body47.us

for.body47.us:                                    ; preds = %if.end54.us, %for.cond45.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond45.preheader.us ], [ %indvars.iv.next.us, %if.end54.us ]
  %22 = add nuw nsw i64 %indvars.iv24.us, %21
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
  %arrayidx58.us = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv226.us, i64 %indvars.iv24.us
  %26 = load double, double* %arrayidx58.us, align 8
  %call59.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %for.inc63.us, label %for.body47.us

for.inc63.us:                                     ; preds = %if.end54.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv226.us, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next3.us, 1000
  br i1 %exitcond40, label %for.end65, label %for.cond45.preheader.us

for.end65:                                        ; preds = %for.inc63.us
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

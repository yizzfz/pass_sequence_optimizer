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
  tail call fastcc void @print_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5)
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

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv28 = phi i64 [ 0, %entry ], [ %indvars.iv.next29.4, %for.body ]
  %0 = trunc i64 %indvars.iv28 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv28
  store double %conv, double* %arrayidx, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %1 = trunc i64 %indvars.iv.next29 to i32
  %conv.1 = sitofp i32 %1 to double
  %arrayidx.1 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next29
  store double %conv.1, double* %arrayidx.1, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %2 = trunc i64 %indvars.iv.next29.1 to i32
  %conv.2 = sitofp i32 %2 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next29.1
  store double %conv.2, double* %arrayidx.2, align 8
  %indvars.iv.next29.2 = add nuw nsw i64 %indvars.iv28, 3
  %3 = trunc i64 %indvars.iv.next29.2 to i32
  %conv.3 = sitofp i32 %3 to double
  %arrayidx.3 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next29.2
  store double %conv.3, double* %arrayidx.3, align 8
  %indvars.iv.next29.3 = add nuw nsw i64 %indvars.iv28, 4
  %4 = trunc i64 %indvars.iv.next29.3 to i32
  %conv.4 = sitofp i32 %4 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next29.3
  store double %conv.4, double* %arrayidx.4, align 8
  %exitcond30.4 = icmp eq i64 %indvars.iv.next29.3, 499
  %indvars.iv.next29.4 = add nuw nsw i64 %indvars.iv28, 5
  br i1 %exitcond30.4, label %for.cond5.preheader.preheader, label %for.body

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc39
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.inc39 ], [ 0, %for.cond5.preheader.preheader ]
  %5 = trunc i64 %indvars.iv26 to i32
  %conv9 = sitofp i32 %5 to double
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = trunc i64 %indvars.iv.next to i32
  %conv10 = sitofp i32 %6 to double
  %mul = fmul double %conv9, %conv10
  %div = fdiv double %mul, 1.000000e+03
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv26, i64 %indvars.iv
  store double %div, double* %arrayidx15, align 8
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = trunc i64 %7 to i32
  %conv18 = sitofp i32 %8 to double
  %mul19 = fmul double %conv9, %conv18
  %div21 = fdiv double %mul19, 1.200000e+03
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv26, i64 %indvars.iv
  store double %div21, double* %arrayidx25, align 8
  %9 = add nuw nsw i64 %indvars.iv, 3
  %10 = trunc i64 %9 to i32
  %conv28 = sitofp i32 %10 to double
  %mul29 = fmul double %conv9, %conv28
  %div31 = fdiv double %mul29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv26, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %for.inc39, label %for.body8

for.inc39:                                        ; preds = %for.body8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond1, label %for.end41, label %for.cond5.preheader

for.end41:                                        ; preds = %for.inc39
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) unnamed_addr #2 {
entry:
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %ey, i64 1, i64 0
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv86 = phi i64 [ 0, %entry ], [ %indvars.iv.next87, %for.inc113 ]
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv86
  %0 = bitcast double* %arrayidx to i64*
  %1 = bitcast double* %arrayidx to [1200 x double]*
  %bound0101 = icmp ugt [1200 x double]* %1, %ey
  %bound1102 = icmp ult double* %arrayidx, %scevgep98
  %memcheck.conflict104 = and i1 %bound0101, %bound1102
  br i1 %memcheck.conflict104, label %for.body3.preheader, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %for.cond1.preheader
  br label %vector.body92

for.body3.preheader:                              ; preds = %for.cond1.preheader
  br label %for.body3

vector.body92:                                    ; preds = %vector.body92, %vector.body92.preheader
  %index107 = phi i64 [ 0, %vector.body92.preheader ], [ %index.next108.2, %vector.body92 ]
  %2 = load i64, i64* %0, align 8, !alias.scope !1
  %3 = insertelement <2 x i64> undef, i64 %2, i32 0
  %4 = shufflevector <2 x i64> %3, <2 x i64> undef, <2 x i32> zeroinitializer
  %5 = insertelement <2 x i64> undef, i64 %2, i32 0
  %6 = shufflevector <2 x i64> %5, <2 x i64> undef, <2 x i32> zeroinitializer
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index107
  %8 = bitcast double* %7 to <2 x i64>*
  store <2 x i64> %4, <2 x i64>* %8, align 8, !alias.scope !4, !noalias !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x i64>*
  store <2 x i64> %6, <2 x i64>* %10, align 8, !alias.scope !4, !noalias !1
  %index.next108 = add nuw nsw i64 %index107, 4
  %11 = load i64, i64* %0, align 8, !alias.scope !1
  %12 = insertelement <2 x i64> undef, i64 %11, i32 0
  %13 = shufflevector <2 x i64> %12, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x i64> undef, i64 %11, i32 0
  %15 = shufflevector <2 x i64> %14, <2 x i64> undef, <2 x i32> zeroinitializer
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index.next108
  %17 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %17, align 8, !alias.scope !4, !noalias !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  store <2 x i64> %15, <2 x i64>* %19, align 8, !alias.scope !4, !noalias !1
  %index.next108.1 = add nuw nsw i64 %index107, 8
  %20 = load i64, i64* %0, align 8, !alias.scope !1
  %21 = insertelement <2 x i64> undef, i64 %20, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %index.next108.1
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next108.2 = add nuw nsw i64 %index107, 12
  %29 = icmp eq i64 %index.next108.2, 1200
  br i1 %29, label %for.cond10.preheader.preheader.loopexit120, label %vector.body92, !llvm.loop !6

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next.7, %for.body3 ]
  %30 = load i64, i64* %0, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %31 = bitcast double* %arrayidx6 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %32 = load i64, i64* %0, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %33 = bitcast double* %arrayidx6.1 to i64*
  store i64 %32, i64* %33, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %34 = load i64, i64* %0, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %35 = bitcast double* %arrayidx6.2 to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %36 = load i64, i64* %0, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %37 = bitcast double* %arrayidx6.3 to i64*
  store i64 %36, i64* %37, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %38 = load i64, i64* %0, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %39 = bitcast double* %arrayidx6.4 to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %40 = load i64, i64* %0, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %41 = bitcast double* %arrayidx6.5 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %42 = load i64, i64* %0, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %43 = bitcast double* %arrayidx6.6 to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %44 = load i64, i64* %0, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %45 = bitcast double* %arrayidx6.7 to i64*
  store i64 %44, i64* %45, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %for.cond10.preheader.preheader.loopexit, label %for.body3, !llvm.loop !9

for.cond10.preheader.preheader.loopexit:          ; preds = %for.body3
  br label %for.cond10.preheader.preheader

for.cond10.preheader.preheader.loopexit120:       ; preds = %vector.body92
  br label %for.cond10.preheader.preheader

for.cond10.preheader.preheader:                   ; preds = %for.cond10.preheader.preheader.loopexit120, %for.cond10.preheader.preheader.loopexit
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.preheader, %for.inc34
  %indvar = phi i64 [ %indvar.next, %for.inc34 ], [ 0, %for.cond10.preheader.preheader ]
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.inc34 ], [ 1, %for.cond10.preheader.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %46, i64 0
  %47 = add nuw nsw i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %47, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %47, i64 0
  %48 = add nsw i64 %indvars.iv72, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %for.body12.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %for.cond10.preheader
  br label %vector.body58

for.body12.preheader:                             ; preds = %for.cond10.preheader
  br label %for.body12

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 %index78
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10, !noalias !13
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10, !noalias !13
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 %index78
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !13
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !13
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %48, i64 %index78
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !13
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !13
  %61 = fsub <2 x double> %wide.load88, %wide.load90
  %62 = fsub <2 x double> %wide.load89, %wide.load91
  %63 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %64 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %65 = fsub <2 x double> %wide.load86, %63
  %66 = fsub <2 x double> %wide.load87, %64
  %67 = bitcast double* %49 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !10, !noalias !13
  %68 = bitcast double* %51 to <2 x double>*
  store <2 x double> %66, <2 x double>* %68, align 8, !alias.scope !10, !noalias !13
  %index.next79 = add nuw nsw i64 %index78, 4
  %69 = icmp eq i64 %index.next79, 1200
  br i1 %69, label %for.inc34.loopexit119, label %vector.body58, !llvm.loop !15

for.body12:                                       ; preds = %for.body12, %for.body12.preheader
  %indvars.iv69 = phi i64 [ 0, %for.body12.preheader ], [ %indvars.iv.next70.1, %for.body12 ]
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 %indvars.iv69
  %70 = load double, double* %arrayidx16, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 %indvars.iv69
  %71 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %48, i64 %indvars.iv69
  %72 = load double, double* %arrayidx24, align 8
  %sub25 = fsub double %71, %72
  %mul = fmul double %sub25, 5.000000e-01
  %sub26 = fsub double %70, %mul
  store double %sub26, double* %arrayidx16, align 8
  %indvars.iv.next70 = or i64 %indvars.iv69, 1
  %arrayidx16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv72, i64 %indvars.iv.next70
  %73 = load double, double* %arrayidx16.1, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv72, i64 %indvars.iv.next70
  %74 = load double, double* %arrayidx20.1, align 8
  %arrayidx24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %48, i64 %indvars.iv.next70
  %75 = load double, double* %arrayidx24.1, align 8
  %sub25.1 = fsub double %74, %75
  %mul.1 = fmul double %sub25.1, 5.000000e-01
  %sub26.1 = fsub double %73, %mul.1
  store double %sub26.1, double* %arrayidx16.1, align 8
  %exitcond71.1 = icmp eq i64 %indvars.iv.next70, 1199
  %indvars.iv.next70.1 = add nuw nsw i64 %indvars.iv69, 2
  br i1 %exitcond71.1, label %for.inc34.loopexit, label %for.body12, !llvm.loop !16

for.inc34.loopexit:                               ; preds = %for.body12
  br label %for.inc34

for.inc34.loopexit119:                            ; preds = %vector.body58
  br label %for.inc34

for.inc34:                                        ; preds = %for.inc34.loopexit119, %for.inc34.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond115 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond115, label %for.cond40.preheader.preheader, label %for.cond10.preheader

for.cond40.preheader.preheader:                   ; preds = %for.inc34
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.preheader, %for.inc66
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc66 ], [ 0, %for.cond40.preheader.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv79, i64 1
  %76 = add nuw nsw i64 %indvars.iv79, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %76, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %76, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %for.body42.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %for.cond40.preheader
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv79, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !17, !noalias !20
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !17, !noalias !20
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !20
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !20
  %85 = add nsw i64 %offset.idx, -1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %85
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !20
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !20
  %90 = fsub <2 x double> %wide.load54, %wide.load56
  %91 = fsub <2 x double> %wide.load55, %wide.load57
  %92 = fmul <2 x double> %90, <double 5.000000e-01, double 5.000000e-01>
  %93 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %94 = fsub <2 x double> %wide.load52, %92
  %95 = fsub <2 x double> %wide.load53, %93
  %96 = bitcast double* %77 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = bitcast double* %79 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !alias.scope !17, !noalias !20
  %index.next45 = add nuw nsw i64 %index44, 4
  %98 = icmp eq i64 %index.next45, 1196
  br i1 %98, label %for.body42.preheader.loopexit, label %vector.body25, !llvm.loop !22

for.body42.preheader.loopexit:                    ; preds = %vector.body25
  br label %for.body42.preheader

for.body42.preheader:                             ; preds = %for.body42.preheader.loopexit, %for.cond40.preheader
  %indvars.iv75.ph = phi i64 [ 1, %for.cond40.preheader ], [ 1197, %for.body42.preheader.loopexit ]
  br i1 true, label %for.body42.prol.preheader, label %for.body42.prol.loopexit.unr-lcssa

for.body42.prol.preheader:                        ; preds = %for.body42.preheader
  br label %for.body42.prol

for.body42.prol:                                  ; preds = %for.body42.prol.preheader
  %arrayidx46.prol = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv79, i64 %indvars.iv75.ph
  %99 = load double, double* %arrayidx46.prol, align 8
  %arrayidx50.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %indvars.iv75.ph
  %100 = load double, double* %arrayidx50.prol, align 8
  %101 = add nsw i64 %indvars.iv75.ph, -1
  %arrayidx55.prol = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %101
  %102 = load double, double* %arrayidx55.prol, align 8
  %sub56.prol = fsub double %100, %102
  %mul57.prol = fmul double %sub56.prol, 5.000000e-01
  %sub58.prol = fsub double %99, %mul57.prol
  store double %sub58.prol, double* %arrayidx46.prol, align 8
  %indvars.iv.next76.prol = add nuw nsw i64 %indvars.iv75.ph, 1
  br label %for.body42.prol.loopexit.unr-lcssa

for.body42.prol.loopexit.unr-lcssa:               ; preds = %for.body42.preheader, %for.body42.prol
  %indvars.iv75.unr.ph = phi i64 [ %indvars.iv.next76.prol, %for.body42.prol ], [ %indvars.iv75.ph, %for.body42.preheader ]
  br label %for.body42.prol.loopexit

for.body42.prol.loopexit:                         ; preds = %for.body42.prol.loopexit.unr-lcssa
  br i1 false, label %for.inc66, label %for.body42.preheader.new

for.body42.preheader.new:                         ; preds = %for.body42.prol.loopexit
  br label %for.body42

for.body42:                                       ; preds = %for.body42, %for.body42.preheader.new
  %indvars.iv75 = phi i64 [ %indvars.iv75.unr.ph, %for.body42.preheader.new ], [ %indvars.iv.next76.1, %for.body42 ]
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv79, i64 %indvars.iv75
  %103 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %indvars.iv75
  %104 = load double, double* %arrayidx50, align 8
  %105 = add nsw i64 %indvars.iv75, -1
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %105
  %106 = load double, double* %arrayidx55, align 8
  %sub56 = fsub double %104, %106
  %mul57 = fmul double %sub56, 5.000000e-01
  %sub58 = fsub double %103, %mul57
  store double %sub58, double* %arrayidx46, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv79, i64 %indvars.iv.next76
  %107 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %indvars.iv.next76
  %108 = load double, double* %arrayidx50.1, align 8
  %arrayidx55.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv79, i64 %indvars.iv75
  %109 = load double, double* %arrayidx55.1, align 8
  %sub56.1 = fsub double %108, %109
  %mul57.1 = fmul double %sub56.1, 5.000000e-01
  %sub58.1 = fsub double %107, %mul57.1
  store double %sub58.1, double* %arrayidx46.1, align 8
  %exitcond78.1 = icmp eq i64 %indvars.iv.next76, 1199
  %indvars.iv.next76.1 = add nsw i64 %indvars.iv75, 2
  br i1 %exitcond78.1, label %for.inc66.unr-lcssa, label %for.body42, !llvm.loop !23

for.inc66.unr-lcssa:                              ; preds = %for.body42
  br label %for.inc66

for.inc66:                                        ; preds = %for.body42.prol.loopexit, %for.inc66.unr-lcssa
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next80, 1000
  br i1 %exitcond116, label %for.cond73.preheader.preheader, label %for.cond40.preheader

for.cond73.preheader.preheader:                   ; preds = %for.inc66
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond73.preheader.preheader, %for.inc110
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %for.inc110 ], [ 0, %for.cond73.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv84, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv84, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv84, i64 0
  %110 = add nuw nsw i64 %indvars.iv84, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %110, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv84, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %110, i64 1199
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %for.body76.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv84, i64 %index
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !24, !noalias !27
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !24, !noalias !27
  %115 = or i64 %index, 1
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv84, i64 %115
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !30
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !30
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv84, i64 %index
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !30
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !30
  %124 = fsub <2 x double> %wide.load17, %wide.load19
  %125 = fsub <2 x double> %wide.load18, %wide.load20
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next85, i64 %index
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !31
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !31
  %130 = fadd <2 x double> %124, %wide.load21
  %131 = fadd <2 x double> %125, %wide.load22
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv84, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !31
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !31
  %136 = fsub <2 x double> %130, %wide.load23
  %137 = fsub <2 x double> %131, %wide.load24
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fmul <2 x double> %137, <double 7.000000e-01, double 7.000000e-01>
  %140 = fsub <2 x double> %wide.load, %138
  %141 = fsub <2 x double> %wide.load16, %139
  %142 = bitcast double* %111 to <2 x double>*
  store <2 x double> %140, <2 x double>* %142, align 8, !alias.scope !24, !noalias !27
  %143 = bitcast double* %113 to <2 x double>*
  store <2 x double> %141, <2 x double>* %143, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %144 = icmp eq i64 %index.next, 1196
  br i1 %144, label %for.body76.preheader.loopexit, label %vector.body, !llvm.loop !32

for.body76.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body76.preheader

for.body76.preheader:                             ; preds = %for.body76.preheader.loopexit, %for.cond73.preheader
  %indvars.iv81.ph = phi i64 [ 0, %for.cond73.preheader ], [ 1196, %for.body76.preheader.loopexit ]
  br label %for.body76

for.body76:                                       ; preds = %for.body76.preheader, %for.body76
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.body76 ], [ %indvars.iv81.ph, %for.body76.preheader ]
  %arrayidx80 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv84, i64 %indvars.iv81
  %145 = load double, double* %arrayidx80, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %arrayidx84 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv84, i64 %indvars.iv.next82
  %146 = load double, double* %arrayidx84, align 8
  %arrayidx88 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv84, i64 %indvars.iv81
  %147 = load double, double* %arrayidx88, align 8
  %sub89 = fsub double %146, %147
  %arrayidx94 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv.next85, i64 %indvars.iv81
  %148 = load double, double* %arrayidx94, align 8
  %add95 = fadd double %sub89, %148
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv84, i64 %indvars.iv81
  %149 = load double, double* %arrayidx99, align 8
  %sub100 = fsub double %add95, %149
  %mul101 = fmul double %sub100, 7.000000e-01
  %sub102 = fsub double %145, %mul101
  store double %sub102, double* %arrayidx80, align 8
  %exitcond83 = icmp eq i64 %indvars.iv81, 1198
  br i1 %exitcond83, label %for.inc110, label %for.body76, !llvm.loop !33

for.inc110:                                       ; preds = %for.body76
  %exitcond117 = icmp eq i64 %indvars.iv.next85, 999
  br i1 %exitcond117, label %for.inc113, label %for.cond73.preheader

for.inc113:                                       ; preds = %for.inc110
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next87, 500
  br i1 %exitcond118, label %for.end115, label %for.cond1.preheader

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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv52, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv49 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next50, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv49, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc32 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv52, i64 %indvars.iv49
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next50, 1200
  br i1 %exitcond4, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond5, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.inc37, %for.end12
  %indvars.iv46 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next47, %for.inc37 ]
  %13 = mul nuw nsw i64 %indvars.iv46, 1000
  br label %for.body21

for.body21:                                       ; preds = %if.end28, %for.cond19.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next44, %if.end28 ]
  %14 = add nuw nsw i64 %indvars.iv43, %13
  %15 = trunc i64 %14 to i32
  %rem24 = srem i32 %15, 20
  %cmp25 = icmp eq i32 %rem24, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %for.body21
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc29 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28

if.end28:                                         ; preds = %for.body21, %if.then26
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv46, i64 %indvars.iv43
  %18 = load double, double* %arrayidx32, align 8
  %call33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond2, label %for.inc37, label %for.body21

for.inc37:                                        ; preds = %if.end28
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next47, 1000
  br i1 %exitcond3, label %for.end39, label %for.cond19.preheader

for.end39:                                        ; preds = %for.inc37
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %for.inc63, %for.end39
  %indvars.iv40 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next41, %for.inc63 ]
  %21 = mul nuw nsw i64 %indvars.iv40, 1000
  br label %for.body47

for.body47:                                       ; preds = %if.end54, %for.cond45.preheader
  %indvars.iv = phi i64 [ 0, %for.cond45.preheader ], [ %indvars.iv.next, %if.end54 ]
  %22 = add nuw nsw i64 %indvars.iv, %21
  %23 = trunc i64 %22 to i32
  %rem50 = srem i32 %23, 20
  %cmp51 = icmp eq i32 %rem50, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %for.body47
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %if.end54

if.end54:                                         ; preds = %for.body47, %if.then52
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv40, i64 %indvars.iv
  %26 = load double, double* %arrayidx58, align 8
  %call59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc63, label %for.body47

for.inc63:                                        ; preds = %if.end54
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond1, label %for.end65, label %for.cond45.preheader

for.end65:                                        ; preds = %for.inc63
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}

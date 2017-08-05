; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %arraydecay17 = bitcast i8* %call to [1200 x double]*
  %arraydecay418 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay519 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay620 = bitcast i8* %call3 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay17, [1200 x double]* %arraydecay418, [1200 x double]* %arraydecay519, double* %arraydecay620)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %arraydecay17, [1200 x double]* %arraydecay418, [1200 x double]* %arraydecay519, double* %arraydecay620)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %3, [1200 x double]* %2, [1200 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture %_fict_) #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21.4, %for.body ]
  %0 = trunc i64 %indvars.iv20 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv20
  %1 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %2 = trunc i64 %indvars.iv.next21 to i32
  %conv.1 = sitofp i32 %2 to double
  %3 = insertelement <2 x double> undef, double %conv, i32 0
  %4 = insertelement <2 x double> %3, double %conv.1, i32 1
  store <2 x double> %4, <2 x double>* %1, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %5 = trunc i64 %indvars.iv.next21.1 to i32
  %conv.2 = sitofp i32 %5 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next21.1
  %6 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next21.2 = add nuw nsw i64 %indvars.iv20, 3
  %7 = trunc i64 %indvars.iv.next21.2 to i32
  %conv.3 = sitofp i32 %7 to double
  %8 = insertelement <2 x double> undef, double %conv.2, i32 0
  %9 = insertelement <2 x double> %8, double %conv.3, i32 1
  store <2 x double> %9, <2 x double>* %6, align 8
  %indvars.iv.next21.3 = add nuw nsw i64 %indvars.iv20, 4
  %10 = trunc i64 %indvars.iv.next21.3 to i32
  %conv.4 = sitofp i32 %10 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next21.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next21.4 = add nuw nsw i64 %indvars.iv20, 5
  %exitcond22.4 = icmp eq i64 %indvars.iv.next21.4, 500
  br i1 %exitcond22.4, label %for.cond5.preheader.preheader, label %for.body

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc39
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.inc39 ], [ 0, %for.cond5.preheader.preheader ]
  %11 = trunc i64 %indvars.iv23 to i32
  %conv9 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv9, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %conv10 = sitofp i32 %13 to double
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv23, i64 %indvars.iv
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %conv18 = sitofp i32 %15 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv18, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %div = fdiv <2 x double> %mul, <double 1.000000e+03, double 1.200000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx15, align 8
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv23, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx25, align 8
  %16 = add nuw nsw i64 %indvars.iv, 3
  %17 = trunc i64 %16 to i32
  %conv28 = sitofp i32 %17 to double
  %mul29 = fmul double %conv9, %conv28
  %div31 = fdiv double %mul29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv23, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc39, label %for.body8

for.inc39:                                        ; preds = %for.body8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1000
  br i1 %exitcond25, label %for.end41, label %for.cond5.preheader

for.end41:                                        ; preds = %for.inc39
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32 %tmax, i32 %nx, i32 %ny, [1200 x double]* nocapture %ex, [1200 x double]* nocapture %ey, [1200 x double]* nocapture %hz, double* nocapture readonly %_fict_) #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv201 = phi i64 [ %indvars.iv.next202, %for.inc113 ], [ 0, %entry ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.4, %for.body3 ]
  %sunkaddr = ptrtoint double* %_fict_ to i64
  %sunkaddr205 = mul nuw nsw i64 %indvars.iv201, 8
  %sunkaddr206 = add i64 %sunkaddr, %sunkaddr205
  %sunkaddr207 = inttoptr i64 %sunkaddr206 to i64*
  %0 = load i64, i64* %sunkaddr207, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv
  %1 = bitcast double* %arrayidx6 to i64*
  store i64 %0, i64* %1, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %2 = load i64, i64* %sunkaddr207, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %3 = bitcast double* %arrayidx6.1 to i64*
  store i64 %2, i64* %3, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %4 = load i64, i64* %sunkaddr207, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx6.2 to i64*
  store i64 %4, i64* %5, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %6 = load i64, i64* %sunkaddr207, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %7 = bitcast double* %arrayidx6.3 to i64*
  store i64 %6, i64* %7, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %8 = load i64, i64* %sunkaddr207, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %9 = bitcast double* %arrayidx6.4 to i64*
  store i64 %8, i64* %9, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %for.cond10.preheader.preheader, label %for.body3

for.cond10.preheader.preheader:                   ; preds = %for.body3
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.preheader, %for.inc34
  %indvars.iv192 = phi i64 [ %indvars.iv.next193, %for.inc34 ], [ 1, %for.cond10.preheader.preheader ]
  %indvar158 = phi i64 [ %10, %for.inc34 ], [ 0, %for.cond10.preheader.preheader ]
  %10 = add nuw nsw i64 %indvar158, 1
  %scevgep160 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %10, i64 0
  %11 = add nuw nsw i64 %indvar158, 2
  %scevgep162 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %11, i64 0
  %scevgep164 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar158, i64 0
  %scevgep166 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %11, i64 0
  %12 = add nsw i64 %indvars.iv192, -1
  %bound0168 = icmp ult double* %scevgep160, %scevgep166
  %bound1169 = icmp ult double* %scevgep164, %scevgep162
  %memcheck.conflict171 = and i1 %bound0168, %bound1169
  br i1 %memcheck.conflict171, label %for.body12.preheader, label %vector.body153.preheader

vector.body153.preheader:                         ; preds = %for.cond10.preheader
  br label %vector.body153

for.body12.preheader:                             ; preds = %for.cond10.preheader
  br label %for.body12

vector.body153:                                   ; preds = %vector.body153.preheader, %vector.body153
  %index174 = phi i64 [ %index.next175, %vector.body153 ], [ 0, %vector.body153.preheader ]
  %offset.idx178 = shl i64 %index174, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv192, i64 %offset.idx178
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec182 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !1, !noalias !4
  %strided.vec183 = shufflevector <4 x double> %wide.vec182, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec184 = shufflevector <4 x double> %wide.vec182, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv192, i64 %offset.idx178
  %16 = bitcast double* %15 to <4 x double>*
  %wide.vec185 = load <4 x double>, <4 x double>* %16, align 8, !alias.scope !4
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %offset.idx178
  %18 = bitcast double* %17 to <4 x double>*
  %wide.vec188 = load <4 x double>, <4 x double>* %18, align 8, !alias.scope !4
  %19 = fsub <4 x double> %wide.vec185, %wide.vec188
  %20 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %21 = fmul <2 x double> %20, <double 5.000000e-01, double 5.000000e-01>
  %22 = fsub <2 x double> %strided.vec183, %21
  %23 = or i64 %offset.idx178, 1
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv192, i64 %23
  %25 = shufflevector <4 x double> %19, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec184, %26
  %28 = getelementptr double, double* %24, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec191 = shufflevector <2 x double> %22, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec191, <4 x double>* %29, align 8, !alias.scope !1, !noalias !4
  %index.next175 = add nuw nsw i64 %index174, 2
  %30 = icmp eq i64 %index.next175, 600
  br i1 %30, label %for.inc34.loopexit208, label %vector.body153, !llvm.loop !6

for.body12:                                       ; preds = %for.body12.preheader, %for.body12
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.1, %for.body12 ], [ 0, %for.body12.preheader ]
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv192, i64 %indvars.iv71
  %31 = load double, double* %arrayidx16, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv192, i64 %indvars.iv71
  %32 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %indvars.iv71
  %33 = load double, double* %arrayidx24, align 8
  %sub25 = fsub double %32, %33
  %mul = fmul double %sub25, 5.000000e-01
  %sub26 = fsub double %31, %mul
  store double %sub26, double* %arrayidx16, align 8
  %indvars.iv.next72 = or i64 %indvars.iv71, 1
  %arrayidx16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv192, i64 %indvars.iv.next72
  %34 = load double, double* %arrayidx16.1, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv192, i64 %indvars.iv.next72
  %35 = load double, double* %arrayidx20.1, align 8
  %arrayidx24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %12, i64 %indvars.iv.next72
  %36 = load double, double* %arrayidx24.1, align 8
  %sub25.1 = fsub double %35, %36
  %mul.1 = fmul double %sub25.1, 5.000000e-01
  %sub26.1 = fsub double %34, %mul.1
  store double %sub26.1, double* %arrayidx16.1, align 8
  %indvars.iv.next72.1 = add nuw nsw i64 %indvars.iv71, 2
  %exitcond73.1 = icmp eq i64 %indvars.iv.next72.1, 1200
  br i1 %exitcond73.1, label %for.inc34.loopexit, label %for.body12, !llvm.loop !9

for.inc34.loopexit:                               ; preds = %for.body12
  br label %for.inc34

for.inc34.loopexit208:                            ; preds = %vector.body153
  br label %for.inc34

for.inc34:                                        ; preds = %for.inc34.loopexit208, %for.inc34.loopexit
  %indvars.iv.next193 = add nuw nsw i64 %indvars.iv192, 1
  %exitcond = icmp eq i64 %10, 999
  br i1 %exitcond, label %for.cond40.preheader.preheader, label %for.cond10.preheader

for.cond40.preheader.preheader:                   ; preds = %for.inc34
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.preheader, %for.inc66
  %indvars.iv195 = phi i64 [ %37, %for.inc66 ], [ 0, %for.cond40.preheader.preheader ]
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 2
  %37 = add nuw nsw i64 %indvars.iv195, 1
  %scevgep122 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %37, i64 0
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 1
  %scevgep126 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %37, i64 0
  %arrayidx4681 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 1
  %38 = load double, double* %arrayidx4681, align 8
  %39 = load double, double* %scevgep124, align 8
  %arrayidx5583 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 0
  %40 = load double, double* %arrayidx5583, align 8
  %sub5684 = fsub double %39, %40
  %mul5785 = fmul double %sub5684, 5.000000e-01
  %sub5886 = fsub double %38, %mul5785
  store double %sub5886, double* %arrayidx4681, align 8
  %bound0128 = icmp ult double* %scevgep120, %scevgep126
  %bound1129 = icmp ult double* %scevgep124, %scevgep122
  %memcheck.conflict131 = and i1 %bound0128, %bound1129
  br i1 %memcheck.conflict131, label %for.body42.1.preheader, label %vector.body113.preheader

vector.body113.preheader:                         ; preds = %for.cond40.preheader
  br label %vector.body113

for.body42.1.preheader.loopexit:                  ; preds = %vector.body113
  br label %for.body42.1.preheader

for.body42.1.preheader:                           ; preds = %for.body42.1.preheader.loopexit, %for.cond40.preheader
  %indvars.iv.next7588.ph = phi i64 [ 2, %for.cond40.preheader ], [ 1198, %for.body42.1.preheader.loopexit ]
  %indvars.iv7487.ph = phi i64 [ 1, %for.cond40.preheader ], [ 1197, %for.body42.1.preheader.loopexit ]
  br label %for.body42.1

vector.body113:                                   ; preds = %vector.body113.preheader, %vector.body113
  %index134 = phi i64 [ %index.next135, %vector.body113 ], [ 0, %vector.body113.preheader ]
  %41 = shl i64 %index134, 1
  %offset.idx = or i64 %41, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 %offset.idx
  %43 = bitcast double* %42 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %43, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec146 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %offset.idx
  %45 = getelementptr double, double* %44, i64 -1
  %46 = bitcast double* %45 to <4 x double>*
  %wide.vec147 = load <4 x double>, <4 x double>* %46, align 8, !alias.scope !13
  %strided.vec148 = shufflevector <4 x double> %wide.vec147, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec149 = shufflevector <4 x double> %wide.vec147, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %47 = fsub <2 x double> %strided.vec149, %strided.vec148
  %48 = fmul <2 x double> %47, <double 5.000000e-01, double 5.000000e-01>
  %49 = fsub <2 x double> %strided.vec, %48
  %50 = or i64 %41, 3
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 %50
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %50
  %53 = getelementptr double, double* %52, i64 -1
  %54 = bitcast double* %53 to <4 x double>*
  %wide.vec150 = load <4 x double>, <4 x double>* %54, align 8, !alias.scope !13
  %strided.vec151 = shufflevector <4 x double> %wide.vec150, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec152 = shufflevector <4 x double> %wide.vec150, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %55 = fsub <2 x double> %strided.vec152, %strided.vec151
  %56 = fmul <2 x double> %55, <double 5.000000e-01, double 5.000000e-01>
  %57 = fsub <2 x double> %strided.vec146, %56
  %58 = getelementptr double, double* %51, i64 -1
  %59 = bitcast double* %58 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %49, <2 x double> %57, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %59, align 8, !alias.scope !10, !noalias !13
  %index.next135 = add nuw nsw i64 %index134, 2
  %60 = icmp eq i64 %index.next135, 598
  br i1 %60, label %for.body42.1.preheader.loopexit, label %vector.body113, !llvm.loop !15

for.inc66:                                        ; preds = %for.body42.1
  %exitcond197 = icmp eq i64 %37, 1000
  br i1 %exitcond197, label %for.cond73.preheader.preheader, label %for.cond40.preheader

for.cond73.preheader.preheader:                   ; preds = %for.inc66
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond73.preheader.preheader, %for.inc110
  %indvars.iv198 = phi i64 [ %61, %for.inc110 ], [ 0, %for.cond73.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv198, i64 0
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv198, i64 1199
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv198, i64 0
  %61 = add nuw nsw i64 %indvars.iv198, 1
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %61, i64 0
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv198, i64 0
  %scevgep98 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %61, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound0100 = icmp ult double* %scevgep, %scevgep98
  %bound1101 = icmp ult double* %scevgep96, %scevgep90
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx = or i1 %found.conflict, %found.conflict102
  br i1 %conflict.rdx, label %for.body76.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv198, i64 %index
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !16, !noalias !19
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !16, !noalias !19
  %66 = or i64 %index, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv198, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !22
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !22
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv198, i64 %index
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !22
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !22
  %75 = fsub <2 x double> %wide.load105, %wide.load107
  %76 = fsub <2 x double> %wide.load106, %wide.load108
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %61, i64 %index
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !23
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !23
  %81 = fadd <2 x double> %75, %wide.load109
  %82 = fadd <2 x double> %76, %wide.load110
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv198, i64 %index
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !23
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !23
  %87 = fsub <2 x double> %81, %wide.load111
  %88 = fsub <2 x double> %82, %wide.load112
  %89 = fmul <2 x double> %87, <double 7.000000e-01, double 7.000000e-01>
  %90 = fmul <2 x double> %88, <double 7.000000e-01, double 7.000000e-01>
  %91 = fsub <2 x double> %wide.load, %89
  %92 = fsub <2 x double> %wide.load104, %90
  store <2 x double> %91, <2 x double>* %63, align 8, !alias.scope !16, !noalias !19
  store <2 x double> %92, <2 x double>* %65, align 8, !alias.scope !16, !noalias !19
  %index.next = add nuw nsw i64 %index, 4
  %93 = icmp eq i64 %index.next, 1196
  br i1 %93, label %for.body76.preheader.loopexit, label %vector.body, !llvm.loop !24

for.body76.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body76.preheader

for.body76.preheader:                             ; preds = %for.body76.preheader.loopexit, %for.cond73.preheader
  %indvars.iv78.ph = phi i64 [ 0, %for.cond73.preheader ], [ 1196, %for.body76.preheader.loopexit ]
  br label %for.body76

for.body76:                                       ; preds = %for.body76.preheader, %for.body76
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.body76 ], [ %indvars.iv78.ph, %for.body76.preheader ]
  %arrayidx80 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv198, i64 %indvars.iv78
  %94 = load double, double* %arrayidx80, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %arrayidx84 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv198, i64 %indvars.iv.next79
  %95 = load double, double* %arrayidx84, align 8
  %arrayidx88 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv198, i64 %indvars.iv78
  %96 = load double, double* %arrayidx88, align 8
  %sub89 = fsub double %95, %96
  %arrayidx94 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %61, i64 %indvars.iv78
  %97 = load double, double* %arrayidx94, align 8
  %add95 = fadd double %sub89, %97
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv198, i64 %indvars.iv78
  %98 = load double, double* %arrayidx99, align 8
  %sub100 = fsub double %add95, %98
  %mul101 = fmul double %sub100, 7.000000e-01
  %sub102 = fsub double %94, %mul101
  store double %sub102, double* %arrayidx80, align 8
  %exitcond80 = icmp eq i64 %indvars.iv.next79, 1199
  br i1 %exitcond80, label %for.inc110, label %for.body76, !llvm.loop !25

for.inc110:                                       ; preds = %for.body76
  %exitcond200 = icmp eq i64 %61, 999
  br i1 %exitcond200, label %for.inc113, label %for.cond73.preheader

for.inc113:                                       ; preds = %for.inc110
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %exitcond203 = icmp eq i64 %indvars.iv.next202, 500
  br i1 %exitcond203, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void

for.body42.1:                                     ; preds = %for.body42.1.preheader, %for.body42.1
  %indvars.iv.next7588 = phi i64 [ %indvars.iv.next75, %for.body42.1 ], [ %indvars.iv.next7588.ph, %for.body42.1.preheader ]
  %indvars.iv7487 = phi i64 [ %indvars.iv.next75.1, %for.body42.1 ], [ %indvars.iv7487.ph, %for.body42.1.preheader ]
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 %indvars.iv.next7588
  %99 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %indvars.iv.next7588
  %100 = load double, double* %arrayidx50.1, align 8
  %arrayidx55.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %indvars.iv7487
  %101 = load double, double* %arrayidx55.1, align 8
  %sub56.1 = fsub double %100, %101
  %mul57.1 = fmul double %sub56.1, 5.000000e-01
  %sub58.1 = fsub double %99, %mul57.1
  store double %sub58.1, double* %arrayidx46.1, align 8
  %indvars.iv.next75.1 = add nuw nsw i64 %indvars.iv7487, 2
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv195, i64 %indvars.iv.next75.1
  %102 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %indvars.iv.next75.1
  %103 = load double, double* %arrayidx50, align 8
  %104 = add nuw nsw i64 %indvars.iv7487, 1
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv195, i64 %104
  %105 = load double, double* %arrayidx55, align 8
  %sub56 = fsub double %103, %105
  %mul57 = fmul double %sub56, 5.000000e-01
  %sub58 = fsub double %102, %mul57
  store double %sub58, double* %arrayidx46, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv7487, 3
  %exitcond77 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond77, label %for.inc66, label %for.body42.1, !llvm.loop !26
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %nx, i32 %ny, [1200 x double]* nocapture readonly %ex, [1200 x double]* nocapture readonly %ey, [1200 x double]* nocapture readonly %hz) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc10 ], [ 0, %entry ]
  %3 = mul nuw nsw i64 %indvars.iv55, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next44, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv43, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv55, i64 %indvars.iv43
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond46, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 1000
  br i1 %exitcond58, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.inc37, %for.end12
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.inc37 ], [ 0, %for.end12 ]
  %13 = mul nuw nsw i64 %indvars.iv51, 1000
  br label %for.body21

for.body21:                                       ; preds = %if.end28, %for.cond19.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next40, %if.end28 ]
  %14 = add nuw nsw i64 %indvars.iv39, %13
  %15 = trunc i64 %14 to i32
  %rem24 = srem i32 %15, 20
  %cmp25 = icmp eq i32 %rem24, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %for.body21
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %if.end28

if.end28:                                         ; preds = %for.body21, %if.then26
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv51, i64 %indvars.iv39
  %18 = load double, double* %arrayidx32, align 8
  %call33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond42, label %for.inc37, label %for.body21

for.inc37:                                        ; preds = %if.end28
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond54, label %for.end39, label %for.cond19.preheader

for.end39:                                        ; preds = %for.inc37
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %for.inc63, %for.end39
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.inc63 ], [ 0, %for.end39 ]
  %21 = mul nuw nsw i64 %indvars.iv47, 1000
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
  %arrayidx58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv47, i64 %indvars.iv
  %26 = load double, double* %arrayidx58, align 8
  %call59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc63, label %for.body47

for.inc63:                                        ; preds = %if.end54
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 1000
  br i1 %exitcond50, label %for.end65, label %for.cond45.preheader

for.end65:                                        ; preds = %for.inc63
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

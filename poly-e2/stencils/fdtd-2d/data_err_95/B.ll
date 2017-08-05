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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay5 = bitcast i8* %call2 to [1200 x double]*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %arraydecay, [1200 x double]* %arraydecay4, [1200 x double]* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvars.iv711 = phi i64 [ 0, %entry ], [ %indvars.iv.next8.4, %for.body ]
  %0 = trunc i64 %indvars.iv711 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv711
  %1 = bitcast double* %arrayidx to <2 x double>*
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv711, 1
  %2 = trunc i64 %indvars.iv.next8 to i32
  %conv.1 = sitofp i32 %2 to double
  %3 = insertelement <2 x double> undef, double %conv, i32 0
  %4 = insertelement <2 x double> %3, double %conv.1, i32 1
  store <2 x double> %4, <2 x double>* %1, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv711, 2
  %5 = trunc i64 %indvars.iv.next8.1 to i32
  %conv.2 = sitofp i32 %5 to double
  %arrayidx.2 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next8.1
  %6 = bitcast double* %arrayidx.2 to <2 x double>*
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv711, 3
  %7 = trunc i64 %indvars.iv.next8.2 to i32
  %conv.3 = sitofp i32 %7 to double
  %8 = insertelement <2 x double> undef, double %conv.2, i32 0
  %9 = insertelement <2 x double> %8, double %conv.3, i32 1
  store <2 x double> %9, <2 x double>* %6, align 8
  %indvars.iv.next8.3 = add nsw i64 %indvars.iv711, 4
  %10 = trunc i64 %indvars.iv.next8.3 to i32
  %conv.4 = sitofp i32 %10 to double
  %arrayidx.4 = getelementptr inbounds double, double* %_fict_, i64 %indvars.iv.next8.3
  store double %conv.4, double* %arrayidx.4, align 8
  %indvars.iv.next8.4 = add nsw i64 %indvars.iv711, 5
  %exitcond13.4 = icmp eq i64 %indvars.iv.next8.4, 500
  br i1 %exitcond13.4, label %for.cond5.preheader.preheader, label %for.body

for.cond5.preheader.preheader:                    ; preds = %for.body
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.cond5.preheader.preheader, %for.inc39
  %indvars.iv510 = phi i64 [ %indvars.iv.next6, %for.inc39 ], [ 0, %for.cond5.preheader.preheader ]
  %11 = trunc i64 %indvars.iv510 to i32
  %conv9 = sitofp i32 %11 to double
  %12 = insertelement <2 x double> undef, double %conv9, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body8

for.body8:                                        ; preds = %for.body8, %for.cond5.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.body8 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %conv10 = sitofp i32 %13 to double
  %arrayidx15 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv510, i64 %indvars.iv9
  %14 = add nuw nsw i64 %indvars.iv9, 2
  %15 = trunc i64 %14 to i32
  %conv18 = sitofp i32 %15 to double
  %mul.v.i1.1 = insertelement <2 x double> undef, double %conv10, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %conv18, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.2
  %div = fdiv <2 x double> %mul, <double 1.000000e+03, double 1.200000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx15, align 8
  %arrayidx25 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv510, i64 %indvars.iv9
  store double %div.v.r2, double* %arrayidx25, align 8
  %16 = add nuw nsw i64 %indvars.iv9, 3
  %17 = trunc i64 %16 to i32
  %conv28 = sitofp i32 %17 to double
  %mul29 = fmul double %conv9, %conv28
  %div31 = fdiv double %mul29, 1.000000e+03
  %arrayidx35 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv510, i64 %indvars.iv9
  store double %div31, double* %arrayidx35, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc39, label %for.body8

for.inc39:                                        ; preds = %for.body8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond12, label %for.end41, label %for.cond5.preheader

for.end41:                                        ; preds = %for.inc39
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz, double* %_fict_) unnamed_addr #0 {
entry:
  %sunkaddr = ptrtoint double* %_fict_ to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc113, %entry
  %indvars.iv2332 = phi i64 [ 0, %entry ], [ %indvars.iv.next24, %for.inc113 ]
  %sunkaddr1 = shl i64 %indvars.iv2332, 3
  %sunkaddr2 = add i64 %sunkaddr, %sunkaddr1
  %sunkaddr3 = inttoptr i64 %sunkaddr2 to i64*
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.7, %for.body3 ]
  %0 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv25
  %1 = bitcast double* %arrayidx6 to i64*
  store i64 %0, i64* %1, align 8
  %indvars.iv.next = or i64 %indvars.iv25, 1
  %2 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next
  %3 = bitcast double* %arrayidx6.1 to i64*
  store i64 %2, i64* %3, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv25, 2
  %4 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.2 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.1
  %5 = bitcast double* %arrayidx6.2 to i64*
  store i64 %4, i64* %5, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv25, 3
  %6 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.3 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.2
  %7 = bitcast double* %arrayidx6.3 to i64*
  store i64 %6, i64* %7, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv25, 4
  %8 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.4 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.3
  %9 = bitcast double* %arrayidx6.4 to i64*
  store i64 %8, i64* %9, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv25, 5
  %10 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.5 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.4
  %11 = bitcast double* %arrayidx6.5 to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv25, 6
  %12 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.6 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.5
  %13 = bitcast double* %arrayidx6.6 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv25, 7
  %14 = load i64, i64* %sunkaddr3, align 8
  %arrayidx6.7 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 0, i64 %indvars.iv.next.6
  %15 = bitcast double* %arrayidx6.7 to i64*
  store i64 %14, i64* %15, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv25, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %for.cond10.preheader.preheader, label %for.body3

for.cond10.preheader.preheader:                   ; preds = %for.body3
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.preheader, %for.inc34
  %indvar = phi i64 [ %indvar.next, %for.inc34 ], [ 0, %for.cond10.preheader.preheader ]
  %indvars.iv1027 = phi i64 [ %indvars.iv.next11, %for.inc34 ], [ 1, %for.cond10.preheader.preheader ]
  %16 = add i64 %indvar, 1
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %16, i64 0
  %17 = add i64 %indvar, 2
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %17, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvar, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %17, i64 0
  %18 = add nsw i64 %indvars.iv1027, -1
  %bound087 = icmp ult double* %scevgep79, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %for.body12.preheader, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %for.cond10.preheader
  br label %vector.body74

for.body12.preheader:                             ; preds = %for.cond10.preheader
  br label %for.body12

vector.body74:                                    ; preds = %vector.body74.preheader, %vector.body74
  %index93 = phi i64 [ %index.next94, %vector.body74 ], [ 0, %vector.body74.preheader ]
  %offset.idx97 = shl i64 %index93, 1
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1027, i64 %offset.idx97
  %20 = bitcast double* %19 to <4 x double>*
  %wide.vec101 = load <4 x double>, <4 x double>* %20, align 8, !alias.scope !1, !noalias !4
  %strided.vec102 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec103 = shufflevector <4 x double> %wide.vec101, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1027, i64 %offset.idx97
  %22 = bitcast double* %21 to <4 x double>*
  %wide.vec104 = load <4 x double>, <4 x double>* %22, align 8, !alias.scope !4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %18, i64 %offset.idx97
  %24 = bitcast double* %23 to <4 x double>*
  %wide.vec107 = load <4 x double>, <4 x double>* %24, align 8, !alias.scope !4
  %25 = fsub <4 x double> %wide.vec104, %wide.vec107
  %26 = shufflevector <4 x double> %25, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %27 = fmul <2 x double> %26, <double 5.000000e-01, double 5.000000e-01>
  %28 = fsub <2 x double> %strided.vec102, %27
  %29 = or i64 %offset.idx97, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1027, i64 %29
  %31 = fsub <4 x double> %wide.vec104, %wide.vec107
  %32 = shufflevector <4 x double> %31, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %33 = fmul <2 x double> %32, <double 5.000000e-01, double 5.000000e-01>
  %34 = fsub <2 x double> %strided.vec103, %33
  %35 = getelementptr double, double* %30, i64 -1
  %36 = bitcast double* %35 to <4 x double>*
  %interleaved.vec110 = shufflevector <2 x double> %28, <2 x double> %34, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec110, <4 x double>* %36, align 8, !alias.scope !1, !noalias !4
  %index.next94 = add i64 %index93, 2
  %37 = icmp eq i64 %index.next94, 600
  br i1 %37, label %for.inc34.loopexit111, label %vector.body74, !llvm.loop !6

for.body12:                                       ; preds = %for.body12.preheader, %for.body12
  %indvars.iv826 = phi i64 [ %indvars.iv.next9.1, %for.body12 ], [ 0, %for.body12.preheader ]
  %arrayidx16 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1027, i64 %indvars.iv826
  %38 = load double, double* %arrayidx16, align 8
  %arrayidx20 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1027, i64 %indvars.iv826
  %39 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %18, i64 %indvars.iv826
  %40 = load double, double* %arrayidx24, align 8
  %sub25 = fsub double %39, %40
  %mul = fmul double %sub25, 5.000000e-01
  %sub26 = fsub double %38, %mul
  store double %sub26, double* %arrayidx16, align 8
  %indvars.iv.next9 = or i64 %indvars.iv826, 1
  %arrayidx16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1027, i64 %indvars.iv.next9
  %41 = load double, double* %arrayidx16.1, align 8
  %arrayidx20.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1027, i64 %indvars.iv.next9
  %42 = load double, double* %arrayidx20.1, align 8
  %arrayidx24.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %18, i64 %indvars.iv.next9
  %43 = load double, double* %arrayidx24.1, align 8
  %sub25.1 = fsub double %42, %43
  %mul.1 = fmul double %sub25.1, 5.000000e-01
  %sub26.1 = fsub double %41, %mul.1
  store double %sub26.1, double* %arrayidx16.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv826, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next9.1, 1200
  br i1 %exitcond33.1, label %for.inc34.loopexit, label %for.body12, !llvm.loop !9

for.inc34.loopexit:                               ; preds = %for.body12
  br label %for.inc34

for.inc34.loopexit111:                            ; preds = %vector.body74
  br label %for.inc34

for.inc34:                                        ; preds = %for.inc34.loopexit111, %for.inc34.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1027, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next11, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond34, label %for.cond40.preheader.preheader, label %for.cond10.preheader

for.cond40.preheader.preheader:                   ; preds = %for.inc34
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.cond40.preheader.preheader, %for.inc66
  %indvars.iv1629 = phi i64 [ %indvars.iv.next17, %for.inc66 ], [ 0, %for.cond40.preheader.preheader ]
  %scevgep41 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 2
  %44 = add i64 %indvars.iv1629, 1
  %scevgep43 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %44, i64 0
  %scevgep45 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 1
  %scevgep47 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %44, i64 0
  %arrayidx464 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 1
  %45 = load double, double* %arrayidx464, align 8
  %arrayidx505 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 1
  %46 = load double, double* %arrayidx505, align 8
  %arrayidx556 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 0
  %47 = load double, double* %arrayidx556, align 8
  %sub567 = fsub double %46, %47
  %mul578 = fmul double %sub567, 5.000000e-01
  %sub589 = fsub double %45, %mul578
  store double %sub589, double* %arrayidx464, align 8
  %bound049 = icmp ult double* %scevgep41, %scevgep47
  %bound150 = icmp ult double* %scevgep45, %scevgep43
  %memcheck.conflict52 = and i1 %bound049, %bound150
  br i1 %memcheck.conflict52, label %for.body42.1.preheader, label %vector.body36.preheader

vector.body36.preheader:                          ; preds = %for.cond40.preheader
  br label %vector.body36

for.body42.1.preheader.loopexit:                  ; preds = %vector.body36
  br label %for.body42.1.preheader

for.body42.1.preheader:                           ; preds = %for.body42.1.preheader.loopexit, %for.cond40.preheader
  %indvars.iv.next1411.ph = phi i64 [ 2, %for.cond40.preheader ], [ 1198, %for.body42.1.preheader.loopexit ]
  %indvars.iv132810.ph = phi i64 [ 1, %for.cond40.preheader ], [ 1197, %for.body42.1.preheader.loopexit ]
  br label %for.body42.1

vector.body36:                                    ; preds = %vector.body36.preheader, %vector.body36
  %index55 = phi i64 [ %index.next56, %vector.body36 ], [ 0, %vector.body36.preheader ]
  %48 = shl i64 %index55, 1
  %offset.idx = or i64 %48, 2
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 %offset.idx
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec67 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %offset.idx
  %52 = getelementptr double, double* %51, i64 -1
  %53 = bitcast double* %52 to <4 x double>*
  %wide.vec68 = load <4 x double>, <4 x double>* %53, align 8, !alias.scope !13
  %strided.vec69 = shufflevector <4 x double> %wide.vec68, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec70 = shufflevector <4 x double> %wide.vec68, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %54 = fsub <2 x double> %strided.vec70, %strided.vec69
  %55 = fmul <2 x double> %54, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %strided.vec, %55
  %57 = or i64 %48, 3
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %57
  %60 = getelementptr double, double* %59, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec71 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !13
  %strided.vec72 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec73 = shufflevector <4 x double> %wide.vec71, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fsub <2 x double> %strided.vec73, %strided.vec72
  %63 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %strided.vec67, %63
  %65 = getelementptr double, double* %58, i64 -1
  %66 = bitcast double* %65 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %56, <2 x double> %64, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %66, align 8, !alias.scope !10, !noalias !13
  %index.next56 = add i64 %index55, 2
  %67 = icmp eq i64 %index.next56, 598
  br i1 %67, label %for.body42.1.preheader.loopexit, label %vector.body36, !llvm.loop !15

for.inc66:                                        ; preds = %for.body42.1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1629, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond36, label %for.cond73.preheader.preheader, label %for.cond40.preheader

for.cond73.preheader.preheader:                   ; preds = %for.inc66
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.cond73.preheader.preheader, %for.inc110
  %indvars.iv2031 = phi i64 [ %indvars.iv.next21, %for.inc110 ], [ 0, %for.cond73.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2031, i64 0
  %scevgep13 = getelementptr [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2031, i64 1199
  %scevgep15 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2031, i64 0
  %68 = add i64 %indvars.iv2031, 1
  %scevgep17 = getelementptr [1200 x double], [1200 x double]* %ex, i64 %68, i64 0
  %scevgep19 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2031, i64 0
  %scevgep21 = getelementptr [1200 x double], [1200 x double]* %ey, i64 %68, i64 1199
  %69 = add nuw nsw i64 %indvars.iv2031, 1
  %bound0 = icmp ult double* %scevgep, %scevgep17
  %bound1 = icmp ult double* %scevgep15, %scevgep13
  %found.conflict = and i1 %bound0, %bound1
  %bound023 = icmp ult double* %scevgep, %scevgep21
  %bound124 = icmp ult double* %scevgep19, %scevgep13
  %found.conflict25 = and i1 %bound023, %bound124
  %conflict.rdx = or i1 %found.conflict, %found.conflict25
  br i1 %conflict.rdx, label %for.body76.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2031, i64 %index
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !16, !noalias !19
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !16, !noalias !19
  %74 = or i64 %index, 1
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2031, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load28 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !22
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load29 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !22
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2031, i64 %index
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load30 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !22
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load31 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !22
  %83 = fsub <2 x double> %wide.load28, %wide.load30
  %84 = fsub <2 x double> %wide.load29, %wide.load31
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %69, i64 %index
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load32 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !23
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load33 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !23
  %89 = fadd <2 x double> %83, %wide.load32
  %90 = fadd <2 x double> %84, %wide.load33
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2031, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !23
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !23
  %95 = fsub <2 x double> %89, %wide.load34
  %96 = fsub <2 x double> %90, %wide.load35
  %97 = fmul <2 x double> %95, <double 7.000000e-01, double 7.000000e-01>
  %98 = fmul <2 x double> %96, <double 7.000000e-01, double 7.000000e-01>
  %99 = fsub <2 x double> %wide.load, %97
  %100 = fsub <2 x double> %wide.load27, %98
  %101 = bitcast double* %70 to <2 x double>*
  store <2 x double> %99, <2 x double>* %101, align 8, !alias.scope !16, !noalias !19
  %102 = bitcast double* %72 to <2 x double>*
  store <2 x double> %100, <2 x double>* %102, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %103 = icmp eq i64 %index.next, 1196
  br i1 %103, label %for.body76.preheader.loopexit, label %vector.body, !llvm.loop !24

for.body76.preheader.loopexit:                    ; preds = %vector.body
  br label %for.body76.preheader

for.body76.preheader:                             ; preds = %for.body76.preheader.loopexit, %for.cond73.preheader
  %indvars.iv1830.ph = phi i64 [ 0, %for.cond73.preheader ], [ 1196, %for.body76.preheader.loopexit ]
  br label %for.body76

for.body76:                                       ; preds = %for.body76.preheader, %for.body76
  %indvars.iv1830 = phi i64 [ %indvars.iv.next19, %for.body76 ], [ %indvars.iv1830.ph, %for.body76.preheader ]
  %arrayidx80 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv2031, i64 %indvars.iv1830
  %104 = load double, double* %arrayidx80, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1830, 1
  %arrayidx84 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2031, i64 %indvars.iv.next19
  %105 = load double, double* %arrayidx84, align 8
  %arrayidx88 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2031, i64 %indvars.iv1830
  %106 = load double, double* %arrayidx88, align 8
  %sub89 = fsub double %105, %106
  %arrayidx94 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %69, i64 %indvars.iv1830
  %107 = load double, double* %arrayidx94, align 8
  %add95 = fadd double %sub89, %107
  %arrayidx99 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv2031, i64 %indvars.iv1830
  %108 = load double, double* %arrayidx99, align 8
  %sub100 = fsub double %add95, %108
  %mul101 = fmul double %sub100, 7.000000e-01
  %sub102 = fsub double %104, %mul101
  store double %sub102, double* %arrayidx80, align 8
  %exitcond37 = icmp eq i64 %indvars.iv.next19, 1199
  br i1 %exitcond37, label %for.inc110, label %for.body76, !llvm.loop !25

for.inc110:                                       ; preds = %for.body76
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2031, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next21, 999
  br i1 %exitcond38, label %for.inc113, label %for.cond73.preheader

for.inc113:                                       ; preds = %for.inc110
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2332, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next24, 500
  br i1 %exitcond39, label %for.end115, label %for.cond1.preheader

for.end115:                                       ; preds = %for.inc113
  ret void

for.body42.1:                                     ; preds = %for.body42.1.preheader, %for.body42.1
  %indvars.iv.next1411 = phi i64 [ %indvars.iv.next14, %for.body42.1 ], [ %indvars.iv.next1411.ph, %for.body42.1.preheader ]
  %indvars.iv132810 = phi i64 [ %indvars.iv.next14.1, %for.body42.1 ], [ %indvars.iv132810.ph, %for.body42.1.preheader ]
  %arrayidx46.1 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 %indvars.iv.next1411
  %109 = load double, double* %arrayidx46.1, align 8
  %arrayidx50.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %indvars.iv.next1411
  %110 = load double, double* %arrayidx50.1, align 8
  %arrayidx55.1 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %indvars.iv132810
  %111 = load double, double* %arrayidx55.1, align 8
  %sub56.1 = fsub double %110, %111
  %mul57.1 = fmul double %sub56.1, 5.000000e-01
  %sub58.1 = fsub double %109, %mul57.1
  store double %sub58.1, double* %arrayidx46.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv132810, 2
  %arrayidx46 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv1629, i64 %indvars.iv.next14.1
  %112 = load double, double* %arrayidx46, align 8
  %arrayidx50 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %indvars.iv.next14.1
  %113 = load double, double* %arrayidx50, align 8
  %114 = add nsw i64 %indvars.iv132810, 1
  %arrayidx55 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1629, i64 %114
  %115 = load double, double* %arrayidx55, align 8
  %sub56 = fsub double %113, %115
  %mul57 = fmul double %sub56, 5.000000e-01
  %sub58 = fsub double %112, %mul57
  store double %sub58, double* %arrayidx46, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv132810, 3
  %exitcond35 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond35, label %for.inc66, label %for.body42.1, !llvm.loop !26
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* %ex, [1200 x double]* %ey, [1200 x double]* %hz) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv2533 = phi i64 [ 0, %entry ], [ %indvars.iv.next26, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv2533, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv2232 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next23, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv2232, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1200 x double], [1200 x double]* %ex, i64 %indvars.iv2533, i64 %indvars.iv2232
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv2232, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond37, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv2533, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond38, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %for.cond19.preheader

for.cond19.preheader:                             ; preds = %for.inc37, %for.end12
  %indvars.iv1931 = phi i64 [ 0, %for.end12 ], [ %indvars.iv.next20, %for.inc37 ]
  %13 = mul nuw nsw i64 %indvars.iv1931, 1000
  br label %for.body21

for.body21:                                       ; preds = %if.end28, %for.cond19.preheader
  %indvars.iv1630 = phi i64 [ 0, %for.cond19.preheader ], [ %indvars.iv.next17, %if.end28 ]
  %14 = add nuw nsw i64 %indvars.iv1630, %13
  %15 = trunc i64 %14 to i32
  %rem24 = srem i32 %15, 20
  %cmp25 = icmp eq i32 %rem24, 0
  br i1 %cmp25, label %if.then26, label %if.end28

if.then26:                                        ; preds = %for.body21
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #4
  br label %if.end28

if.end28:                                         ; preds = %if.then26, %for.body21
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx32 = getelementptr inbounds [1200 x double], [1200 x double]* %ey, i64 %indvars.iv1931, i64 %indvars.iv1630
  %18 = load double, double* %arrayidx32, align 8
  %call33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1630, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond35, label %for.inc37, label %for.body21

for.inc37:                                        ; preds = %if.end28
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1931, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond36, label %for.end39, label %for.cond19.preheader

for.end39:                                        ; preds = %for.inc37
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %for.cond45.preheader

for.cond45.preheader:                             ; preds = %for.inc63, %for.end39
  %indvars.iv1329 = phi i64 [ 0, %for.end39 ], [ %indvars.iv.next14, %for.inc63 ]
  %21 = mul nuw nsw i64 %indvars.iv1329, 1000
  br label %for.body47

for.body47:                                       ; preds = %if.end54, %for.cond45.preheader
  %indvars.iv28 = phi i64 [ 0, %for.cond45.preheader ], [ %indvars.iv.next, %if.end54 ]
  %22 = add nuw nsw i64 %indvars.iv28, %21
  %23 = trunc i64 %22 to i32
  %rem50 = srem i32 %23, 20
  %cmp51 = icmp eq i32 %rem50, 0
  br i1 %cmp51, label %if.then52, label %if.end54

if.then52:                                        ; preds = %for.body47
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #4
  br label %if.end54

if.end54:                                         ; preds = %if.then52, %for.body47
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx58 = getelementptr inbounds [1200 x double], [1200 x double]* %hz, i64 %indvars.iv1329, i64 %indvars.iv28
  %26 = load double, double* %arrayidx58, align 8
  %call59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc63, label %for.body47

for.inc63:                                        ; preds = %if.end54
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1329, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond34, label %for.end65, label %for.cond45.preheader

for.end65:                                        ; preds = %for.inc63
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call66 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

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
"}
!20 = !{!21, !22}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !19}
!23 = !{!21}
!24 = !{!22}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}

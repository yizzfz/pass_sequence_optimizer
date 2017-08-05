; ModuleID = 'A.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  call fastcc void @init_array([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_ludcmp([2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call2 to double*
  call fastcc void @print_array(double* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %entry
  %indvars.iv117 = phi i64 [ 0, %entry ], [ %indvars.iv.next118.1, %for.inc ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv117
  %0 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv117
  %1 = bitcast double* %arrayidx3 to <2 x double>*
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %2 = trunc i64 %indvars.iv.next118 to i32
  %conv4 = sitofp i32 %2 to double
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv117
  store <2 x double> zeroinitializer, <2 x double>* %0, align 8
  store <2 x double> zeroinitializer, <2 x double>* %1, align 8
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %3 = trunc i64 %indvars.iv.next118.1 to i32
  %conv4.1 = sitofp i32 %3 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv4, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv4.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 2.000000e+03, double 2.000000e+03>
  %div5 = fmul <2 x double> %div, <double 5.000000e-01, double 5.000000e-01>
  %add6 = fadd <2 x double> %div5, <double 4.000000e+00, double 4.000000e+00>
  %4 = bitcast double* %arrayidx8 to <2 x double>*
  store <2 x double> %add6, <2 x double>* %4, align 8
  %exitcond143.1 = icmp eq i64 %indvars.iv.next118, 1999
  br i1 %exitcond143.1, label %for.inc25.lr.ph.preheader, label %for.inc

for.inc25.lr.ph.preheader:                        ; preds = %for.inc
  br label %for.inc25.lr.ph

for.inc25.lr.ph:                                  ; preds = %for.inc25.lr.ph.preheader, %for.inc44.for.cond13.preheader_crit_edge
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc44.for.cond13.preheader_crit_edge ], [ 0, %for.inc25.lr.ph.preheader ]
  %5 = shl i64 %indvars.iv115, 32
  %sext = add i64 %5, 4294967296
  %6 = ashr exact i64 %sext, 32
  br label %for.inc25

for.cond29.preheader:                             ; preds = %for.inc25
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %cmp3080 = icmp slt i64 %indvars.iv.next116, 2000
  br i1 %cmp3080, label %for.inc44.for.cond13.preheader_crit_edge, label %for.end46

for.inc25:                                        ; preds = %for.inc25, %for.inc25.lr.ph
  %indvars.iv102 = phi i64 [ %indvars.iv.next103, %for.inc25 ], [ 0, %for.inc25.lr.ph ]
  %7 = sub nsw i64 0, %indvars.iv102
  %8 = trunc i64 %7 to i32
  %rem = srem i32 %8, 2000
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, 2.000000e+03
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv102
  store double %add20, double* %arrayidx24, align 8
  %exitcond108 = icmp eq i64 %indvars.iv102, %indvars.iv115
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  br i1 %exitcond108, label %for.cond29.preheader, label %for.inc25

for.inc44.for.cond13.preheader_crit_edge:         ; preds = %for.cond29.preheader
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %6
  %9 = sub nsw i64 2000, %6
  %10 = shl nsw i64 %9, 3
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep123124, i8 0, i64 %10, i32 8, i1 false)
  %arrayidx43127 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %arrayidx43127, align 8
  br label %for.inc25.lr.ph

for.end46:                                        ; preds = %for.cond29.preheader
  %arrayidx43129 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv115, i64 %indvars.iv115
  store double 1.000000e+00, double* %arrayidx43129, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc62

for.inc62:                                        ; preds = %for.inc62, %for.end46
  %indvars.iv100 = phi i64 [ 0, %for.end46 ], [ %indvars.iv.next101.7, %for.inc62 ]
  %11 = mul nuw nsw i64 %indvars.iv100, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %12 = mul nuw nsw i64 %indvars.iv.next101, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.1 = or i64 %indvars.iv100, 2
  %13 = mul nuw nsw i64 %indvars.iv.next101.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.2 = or i64 %indvars.iv100, 3
  %14 = mul nuw nsw i64 %indvars.iv.next101.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.3 = or i64 %indvars.iv100, 4
  %15 = mul nuw nsw i64 %indvars.iv.next101.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.4 = or i64 %indvars.iv100, 5
  %16 = mul nuw nsw i64 %indvars.iv.next101.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.5 = or i64 %indvars.iv100, 6
  %17 = mul nuw nsw i64 %indvars.iv.next101.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.6 = or i64 %indvars.iv100, 7
  %18 = mul nuw nsw i64 %indvars.iv.next101.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next101.7 = add nsw i64 %indvars.iv100, 8
  %exitcond142.7 = icmp eq i64 %indvars.iv.next101.7, 2000
  br i1 %exitcond142.7, label %for.cond69.preheader.preheader, label %for.inc62

for.cond69.preheader.preheader:                   ; preds = %for.inc62
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond69.preheader

for.cond69.preheader:                             ; preds = %for.cond69.preheader.preheader, %for.inc96
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %for.inc96 ], [ 0, %for.cond69.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv94
  %22 = add i64 %indvars.iv94, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %22
  %23 = bitcast double* %scevgep5 to i8*
  %24 = bitcast double* %scevgep3 to i8*
  br label %for.cond73.preheader

for.cond73.preheader:                             ; preds = %for.inc93, %for.cond69.preheader
  %indvars.iv92 = phi i64 [ 0, %for.cond69.preheader ], [ %indvars.iv.next93, %for.inc93 ]
  %25 = mul i64 %indvars.iv92, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %25
  %26 = add i64 %25, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %26
  %arrayidx80 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv92, i64 %indvars.iv94
  %bound0 = icmp ult i8* %scevgep1, %23
  %bound1 = icmp ult i8* %24, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx80 to i8*
  %bc7 = bitcast double* %arrayidx80 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc90.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond73.preheader
  br label %vector.body

for.inc90.preheader:                              ; preds = %for.cond73.preheader
  br label %for.inc90

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %27 = or i64 %index, 1
  %28 = or i64 %index, 2
  %29 = or i64 %index, 3
  %30 = load double, double* %arrayidx80, align 8, !alias.scope !1
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %32 = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %33 = insertelement <2 x double> undef, double %30, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv94
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %27, i64 %indvars.iv94
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %28, i64 %indvars.iv94
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %29, i64 %indvars.iv94
  %39 = load double, double* %35, align 8, !alias.scope !4
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = insertelement <2 x double> undef, double %39, i32 0
  %44 = insertelement <2 x double> %43, double %40, i32 1
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = fmul <2 x double> %32, %44
  %48 = fmul <2 x double> %34, %46
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv92, i64 %index
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !6, !noalias !8
  %53 = fadd <2 x double> %wide.load, %47
  %54 = fadd <2 x double> %wide.load12, %48
  %55 = bitcast double* %49 to <2 x double>*
  store <2 x double> %53, <2 x double>* %55, align 8, !alias.scope !6, !noalias !8
  %56 = bitcast double* %51 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, 2000
  br i1 %57, label %for.inc93.loopexit43, label %vector.body, !llvm.loop !9

for.inc90:                                        ; preds = %for.inc90, %for.inc90.preheader
  %indvars.iv88 = phi i64 [ 0, %for.inc90.preheader ], [ %indvars.iv.next89.1, %for.inc90 ]
  %58 = load double, double* %arrayidx80, align 8
  %arrayidx84 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv88, i64 %indvars.iv94
  %59 = load double, double* %arrayidx84, align 8
  %mul = fmul double %58, %59
  %arrayidx88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv92, i64 %indvars.iv88
  %60 = load double, double* %arrayidx88, align 8
  %add89 = fadd double %60, %mul
  store double %add89, double* %arrayidx88, align 8
  %indvars.iv.next89 = or i64 %indvars.iv88, 1
  %61 = load double, double* %arrayidx80, align 8
  %arrayidx84.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next89, i64 %indvars.iv94
  %62 = load double, double* %arrayidx84.1, align 8
  %mul.1 = fmul double %61, %62
  %arrayidx88.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv92, i64 %indvars.iv.next89
  %63 = load double, double* %arrayidx88.1, align 8
  %add89.1 = fadd double %63, %mul.1
  store double %add89.1, double* %arrayidx88.1, align 8
  %exitcond139.1 = icmp eq i64 %indvars.iv.next89, 1999
  %indvars.iv.next89.1 = add nsw i64 %indvars.iv88, 2
  br i1 %exitcond139.1, label %for.inc93.loopexit, label %for.inc90, !llvm.loop !12

for.inc93.loopexit:                               ; preds = %for.inc90
  br label %for.inc93

for.inc93.loopexit43:                             ; preds = %vector.body
  br label %for.inc93

for.inc93:                                        ; preds = %for.inc93.loopexit43, %for.inc93.loopexit
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next93, 2000
  br i1 %exitcond140, label %for.inc96, label %for.cond73.preheader

for.inc96:                                        ; preds = %for.inc93
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next95, 2000
  br i1 %exitcond141, label %for.cond103.preheader.preheader, label %for.cond69.preheader

for.cond103.preheader.preheader:                  ; preds = %for.inc96
  %64 = bitcast i8* %call to [2000 x [2000 x double]]*
  %65 = bitcast i8* %call to [2000 x [2000 x double]]*
  %66 = bitcast i8* %call to [2000 x [2000 x double]]*
  %67 = bitcast i8* %call to [2000 x [2000 x double]]*
  %68 = bitcast i8* %call to [2000 x [2000 x double]]*
  %69 = bitcast i8* %call to [2000 x [2000 x double]]*
  %70 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond103.preheader

for.cond103.preheader:                            ; preds = %for.cond103.preheader.preheader, %for.inc118
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.inc118 ], [ 0, %for.cond103.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %71 = add i64 %indvars.iv86, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %71, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %72 = mul i64 %indvars.iv86, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %72
  %73 = add i64 %72, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %73
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.inc115.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond103.preheader
  br label %vector.body13

for.inc115.preheader:                             ; preds = %for.cond103.preheader
  br label %for.inc115

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %74 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %69, i64 0, i64 %indvars.iv86, i64 %index30
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !13
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !13
  %78 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %index30
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %79, align 8, !alias.scope !16, !noalias !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %81, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv86, i64 %index.next31
  %83 = bitcast double* %82 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %83, align 8, !alias.scope !13
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !13
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %index.next31
  %87 = bitcast double* %86 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %87, align 8, !alias.scope !16, !noalias !13
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %89, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %90 = icmp eq i64 %index.next31.1, 2000
  br i1 %90, label %for.inc118.loopexit42, label %vector.body13, !llvm.loop !18

for.inc115:                                       ; preds = %for.inc115, %for.inc115.preheader
  %indvars.iv = phi i64 [ 0, %for.inc115.preheader ], [ %indvars.iv.next.4, %for.inc115 ]
  %arrayidx110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %64, i64 0, i64 %indvars.iv86, i64 %indvars.iv
  %91 = bitcast double* %arrayidx110 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx114 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv
  %93 = bitcast double* %arrayidx114 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %65, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next
  %94 = bitcast double* %arrayidx110.1 to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx114.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv.next
  %96 = bitcast double* %arrayidx114.1 to i64*
  store i64 %95, i64* %96, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %66, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next.1
  %97 = bitcast double* %arrayidx110.2 to i64*
  %98 = load i64, i64* %97, align 8
  %arrayidx114.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv.next.1
  %99 = bitcast double* %arrayidx114.2 to i64*
  store i64 %98, i64* %99, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %67, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next.2
  %100 = bitcast double* %arrayidx110.3 to i64*
  %101 = load i64, i64* %100, align 8
  %arrayidx114.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv.next.2
  %102 = bitcast double* %arrayidx114.3 to i64*
  store i64 %101, i64* %102, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx110.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %68, i64 0, i64 %indvars.iv86, i64 %indvars.iv.next.3
  %103 = bitcast double* %arrayidx110.4 to i64*
  %104 = load i64, i64* %103, align 8
  %arrayidx114.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv.next.3
  %105 = bitcast double* %arrayidx114.4 to i64*
  store i64 %104, i64* %105, align 8
  %exitcond138.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond138.4, label %for.inc118.loopexit, label %for.inc115, !llvm.loop !19

for.inc118.loopexit:                              ; preds = %for.inc115
  br label %for.inc118

for.inc118.loopexit42:                            ; preds = %vector.body13
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118.loopexit42, %for.inc118.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond = icmp eq i64 %indvars.iv.next87, 2000
  br i1 %exitcond, label %for.end120, label %for.cond103.preheader

for.end120:                                       ; preds = %for.inc118
  call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp([2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %entry
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.inc58 ], [ 0, %entry ]
  %indvars.iv153 = phi i64 [ %indvars.iv.next154, %for.inc58 ], [ 4294967295, %entry ]
  %0 = sub i64 1999, %indvars.iv2
  %1 = and i64 %indvars.iv153, 4294967295
  %cmp296 = icmp sgt i64 %indvars.iv2, 0
  br i1 %cmp296, label %for.body3.preheader, label %for.body30.preheader

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  br label %for.body3

for.body30.preheader:                             ; preds = %for.body30.lr.ph, %for.cond1.preheader
  %2 = sub i64 0, %indvars.iv2
  %xtraiter17 = and i64 %2, 7
  %lcmp.mod18 = icmp eq i64 %xtraiter17, 0
  br i1 %lcmp.mod18, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %indvars.iv128.prol = phi i64 [ %indvars.iv.next129.prol, %for.body30.prol ], [ %indvars.iv2, %for.body30.prol.preheader ]
  %prol.iter19 = phi i64 [ %prol.iter19.sub, %for.body30.prol ], [ %xtraiter17, %for.body30.prol.preheader ]
  %indvars.iv.next129.prol = add nuw nsw i64 %indvars.iv128.prol, 1
  %prol.iter19.sub = add i64 %prol.iter19, -1
  %prol.iter19.cmp = icmp eq i64 %prol.iter19.sub, 0
  br i1 %prol.iter19.cmp, label %for.body30.prol.loopexit.loopexit, label %for.body30.prol, !llvm.loop !20

for.body30.prol.loopexit.loopexit:                ; preds = %for.body30.prol
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol.loopexit.loopexit, %for.body30.preheader
  %indvars.iv128.unr = phi i64 [ %indvars.iv2, %for.body30.preheader ], [ %indvars.iv.next129.prol, %for.body30.prol.loopexit.loopexit ]
  %3 = icmp ult i64 %0, 7
  br i1 %3, label %for.inc58, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.body30.lr.ph:                                 ; preds = %for.inc25
  %4 = icmp sgt i64 %indvars.iv2, 0
  br i1 %4, label %for.body30.us.preheader, label %for.body30.preheader

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %5 = and i64 %indvars.iv153, 1
  %lcmp.mod21 = icmp eq i64 %5, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 0
  %6 = icmp eq i64 %1, 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.inc55.us
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %for.inc55.us ], [ %indvars.iv2, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv140
  %7 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod21, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.body30.us
  %8 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv140
  %9 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %8, %9
  %sub47.us.prol = fsub double %7, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  %indvars.iv132.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.1100.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %7, %for.body30.us ]
  br i1 %6, label %for.inc55.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv132 = phi i64 [ %indvars.iv132.unr.ph, %for.body30.us.new ], [ %indvars.iv.next133.1, %for.inc48.us ]
  %w.1100.us = phi double [ %w.1100.us.unr.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv132
  %10 = bitcast double* %arrayidx41.us to <2 x double>*
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv132, i64 %indvars.iv140
  %11 = load double, double* %arrayidx45.us, align 8
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %12 = load <2 x double>, <2 x double>* %10, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next133, i64 %indvars.iv140
  %13 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.v.i1.1 = insertelement <2 x double> undef, double %11, i32 0
  %mul46.us.v.i1.2 = insertelement <2 x double> %mul46.us.v.i1.1, double %13, i32 1
  %mul46.us = fmul <2 x double> %12, %mul46.us.v.i1.2
  %mul46.us.v.r1 = extractelement <2 x double> %mul46.us, i32 0
  %mul46.us.v.r2 = extractelement <2 x double> %mul46.us, i32 1
  %sub47.us = fsub double %w.1100.us, %mul46.us.v.r1
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.v.r2
  %exitcond155.1 = icmp eq i64 %indvars.iv.next133, %1
  %indvars.iv.next133.1 = add nsw i64 %indvars.iv132, 2
  br i1 %exitcond155.1, label %for.inc55.us.loopexit, label %for.inc48.us

for.inc55.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc55.us

for.inc55.us:                                     ; preds = %for.inc55.us.loopexit, %for.inc48.us.prol.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit ], [ %sub47.us.1, %for.inc55.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next141, 2000
  br i1 %exitcond5, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv149 = phi i64 [ %indvars.iv.next150, %for.inc25 ], [ 4294967295, %for.body3.preheader ]
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.inc25 ], [ 0, %for.body3.preheader ]
  %14 = and i64 %indvars.iv149, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv124
  %15 = load double, double* %arrayidx5, align 8
  %cmp792 = icmp sgt i64 %indvars.iv124, 0
  br i1 %cmp792, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %16 = and i64 %indvars.iv149, 1
  %lcmp.mod16 = icmp eq i64 %16, 0
  br i1 %lcmp.mod16, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.preheader
  %17 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv124
  %18 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %17, %18
  %sub.prol = fsub double %15, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv118.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.094.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %15, %for.inc.preheader ]
  %19 = icmp eq i64 %14, 0
  br i1 %19, label %for.inc25, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv118 = phi i64 [ %indvars.iv118.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next119.1, %for.inc ]
  %w.094 = phi double [ %w.094.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv2, i64 %indvars.iv118
  %20 = bitcast double* %arrayidx12 to <2 x double>*
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv124
  %21 = load double, double* %arrayidx16, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %22 = load <2 x double>, <2 x double>* %20, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next119, i64 %indvars.iv124
  %23 = load double, double* %arrayidx16.1, align 8
  %mul.v.i1.1 = insertelement <2 x double> undef, double %21, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double %23, i32 1
  %mul = fmul <2 x double> %22, %mul.v.i1.2
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %mul.v.r2 = extractelement <2 x double> %mul, i32 1
  %sub = fsub double %w.094, %mul.v.r1
  %sub.1 = fsub double %sub, %mul.v.r2
  %exitcond151.1 = icmp eq i64 %indvars.iv.next119, %14
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  br i1 %exitcond151.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.body3
  %w.0.lcssa = phi double [ %15, %for.body3 ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  %24 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %24
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %indvars.iv.next150 = add nuw nsw i64 %14, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next125, %indvars.iv2
  br i1 %exitcond4, label %for.body30.lr.ph, label %for.body3

for.body30:                                       ; preds = %for.body30, %for.body30.preheader.new
  %indvars.iv128 = phi i64 [ %indvars.iv128.unr, %for.body30.preheader.new ], [ %indvars.iv.next129.7, %for.body30 ]
  %exitcond152.7 = icmp eq i64 %indvars.iv128, 1992
  %indvars.iv.next129.7 = add nsw i64 %indvars.iv128, 8
  br i1 %exitcond152.7, label %for.inc58.loopexit22, label %for.body30

for.inc58.loopexit:                               ; preds = %for.inc55.us
  br label %for.inc58

for.inc58.loopexit22:                             ; preds = %for.body30
  br label %for.inc58

for.inc58:                                        ; preds = %for.inc58.loopexit22, %for.inc58.loopexit, %for.body30.prol.loopexit
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %indvars.iv.next154 = add nuw nsw i64 %1, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 2000
  br i1 %exitcond6, label %for.body63.preheader, label %for.cond1.preheader

for.body63.preheader:                             ; preds = %for.inc58
  br label %for.body63

for.body63:                                       ; preds = %for.body63.preheader, %for.inc82
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %for.inc82 ], [ 4294967295, %for.body63.preheader ]
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.inc82 ], [ 0, %for.body63.preheader ]
  %25 = and i64 %indvars.iv146, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv116
  %26 = load double, double* %arrayidx65, align 8
  %cmp6785 = icmp sgt i64 %indvars.iv116, 0
  br i1 %cmp6785, label %for.inc77.preheader, label %for.inc82

for.inc77.preheader:                              ; preds = %for.body63
  %27 = add nsw i64 %indvars.iv146, 1
  %xtraiter12 = and i64 %27, 3
  %lcmp.mod13 = icmp eq i64 %xtraiter12, 0
  br i1 %lcmp.mod13, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol ], [ 0, %for.inc77.prol.preheader ]
  %w.287.prol = phi double [ %sub76.prol, %for.inc77.prol ], [ %26, %for.inc77.prol.preheader ]
  %prol.iter14 = phi i64 [ %prol.iter14.sub, %for.inc77.prol ], [ %xtraiter12, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.prol
  %28 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %29 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %28, %29
  %sub76.prol = fsub double %w.287.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter14.sub = add i64 %prol.iter14, -1
  %prol.iter14.cmp = icmp eq i64 %prol.iter14.sub, 0
  br i1 %prol.iter14.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol, !llvm.loop !22

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.287.unr = phi double [ %26, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %30 = icmp ult i64 %25, 3
  br i1 %30, label %for.inc82, label %for.inc77.preheader.new

for.inc77.preheader.new:                          ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77, %for.inc77.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc77.preheader.new ], [ %indvars.iv.next.3, %for.inc77 ]
  %w.287 = phi double [ %w.287.unr, %for.inc77.preheader.new ], [ %sub76.3, %for.inc77 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv
  %31 = bitcast double* %arrayidx72 to <2 x double>*
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %32 = bitcast double* %arrayidx74 to <2 x double>*
  %33 = load <2 x double>, <2 x double>* %31, align 8
  %34 = load <2 x double>, <2 x double>* %32, align 8
  %mul75 = fmul <2 x double> %33, %34
  %mul75.v.r1 = extractelement <2 x double> %mul75, i32 0
  %mul75.v.r2 = extractelement <2 x double> %mul75, i32 1
  %sub76 = fsub double %w.287, %mul75.v.r1
  %sub76.1 = fsub double %sub76, %mul75.v.r2
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv.next.1
  %35 = bitcast double* %arrayidx72.2 to <2 x double>*
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %36 = bitcast double* %arrayidx74.2 to <2 x double>*
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %37 = load <2 x double>, <2 x double>* %35, align 8
  %38 = load <2 x double>, <2 x double>* %36, align 8
  %mul75.2 = fmul <2 x double> %37, %38
  %mul75.2.v.r1 = extractelement <2 x double> %mul75.2, i32 0
  %mul75.2.v.r2 = extractelement <2 x double> %mul75.2, i32 1
  %sub76.2 = fsub double %sub76.1, %mul75.2.v.r1
  %sub76.3 = fsub double %sub76.2, %mul75.2.v.r2
  %exitcond148.3 = icmp eq i64 %indvars.iv.next.2, %25
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond148.3, label %for.inc82.loopexit, label %for.inc77

for.inc82.loopexit:                               ; preds = %for.inc77
  br label %for.inc82

for.inc82:                                        ; preds = %for.inc82.loopexit, %for.inc77.prol.loopexit, %for.body63
  %w.2.lcssa = phi double [ %26, %for.body63 ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.inc82.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv116
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %indvars.iv.next147 = add nuw nsw i64 %25, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next117, 2000
  br i1 %exitcond1, label %for.body88.preheader, label %for.body63

for.body88.preheader:                             ; preds = %for.inc82
  %sunkaddr = ptrtoint double* %x to i64
  br label %for.body88

for.body88:                                       ; preds = %for.body88.preheader, %for.inc112
  %indvar = phi i64 [ 0, %for.body88.preheader ], [ %indvar.next, %for.inc112 ]
  %indvars.iv110 = phi i64 [ 2000, %for.body88.preheader ], [ %indvars.iv.next111, %for.inc112 ]
  %39 = add i64 %indvar, -1
  %indvars.iv.next111 = add nsw i64 %indvars.iv110, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next111
  %40 = load double, double* %arrayidx90, align 8
  %cmp9278 = icmp slt i64 %indvars.iv110, 2000
  br i1 %cmp9278, label %for.inc102.preheader, label %for.inc112

for.inc102.preheader:                             ; preds = %for.body88
  %xtraiter = and i64 %indvar, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol, %for.inc102.prol.preheader
  %indvars.iv108.prol = phi i64 [ %indvars.iv.next109.prol, %for.inc102.prol ], [ %indvars.iv110, %for.inc102.prol.preheader ]
  %w.379.prol = phi double [ %sub101.prol, %for.inc102.prol ], [ %40, %for.inc102.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc102.prol ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108.prol
  %41 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv108.prol
  %42 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %41, %42
  %sub101.prol = fsub double %w.379.prol, %mul100.prol
  %indvars.iv.next109.prol = add i64 %indvars.iv108.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol, !llvm.loop !23

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %indvars.iv108.unr = phi i64 [ %indvars.iv110, %for.inc102.preheader ], [ %indvars.iv.next109.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.379.unr = phi double [ %40, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %43 = icmp ult i64 %39, 3
  br i1 %43, label %for.inc112, label %for.inc102.preheader.new

for.inc102.preheader.new:                         ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102, %for.inc102.preheader.new
  %indvars.iv108 = phi i64 [ %indvars.iv108.unr, %for.inc102.preheader.new ], [ %indvars.iv.next109.3, %for.inc102 ]
  %w.379 = phi double [ %w.379.unr, %for.inc102.preheader.new ], [ %sub101.3, %for.inc102 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv108
  %44 = bitcast double* %arrayidx97 to <2 x double>*
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv108
  %45 = bitcast double* %arrayidx99 to <2 x double>*
  %46 = load <2 x double>, <2 x double>* %44, align 8
  %47 = load <2 x double>, <2 x double>* %45, align 8
  %mul100 = fmul <2 x double> %46, %47
  %mul100.v.r1 = extractelement <2 x double> %mul100, i32 0
  %mul100.v.r2 = extractelement <2 x double> %mul100, i32 1
  %sub101 = fsub double %w.379, %mul100.v.r1
  %sub101.1 = fsub double %sub101, %mul100.v.r2
  %indvars.iv.next109.1 = add i64 %indvars.iv108, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next109.1
  %48 = bitcast double* %arrayidx97.2 to <2 x double>*
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next109.1
  %49 = bitcast double* %arrayidx99.2 to <2 x double>*
  %indvars.iv.next109.2 = add i64 %indvars.iv108, 3
  %50 = load <2 x double>, <2 x double>* %48, align 8
  %51 = load <2 x double>, <2 x double>* %49, align 8
  %mul100.2 = fmul <2 x double> %50, %51
  %mul100.2.v.r1 = extractelement <2 x double> %mul100.2, i32 0
  %mul100.2.v.r2 = extractelement <2 x double> %mul100.2, i32 1
  %sub101.2 = fsub double %sub101.1, %mul100.2.v.r1
  %sub101.3 = fsub double %sub101.2, %mul100.2.v.r2
  %exitcond.3 = icmp eq i64 %indvars.iv.next109.2, 1999
  %indvars.iv.next109.3 = add i64 %indvars.iv108, 4
  br i1 %exitcond.3, label %for.inc112.loopexit, label %for.inc102

for.inc112.loopexit:                              ; preds = %for.inc102
  br label %for.inc112

for.inc112:                                       ; preds = %for.inc112.loopexit, %for.inc102.prol.loopexit, %for.body88
  %w.3.lcssa = phi double [ %40, %for.body88 ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.inc112.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next111, i64 %indvars.iv.next111
  %52 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %52
  %sunkaddr7 = shl i64 %indvars.iv110, 3
  %sunkaddr8 = add i64 %sunkaddr, %sunkaddr7
  %sunkaddr9 = add i64 %sunkaddr8, -8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  store double %div109, double* %sunkaddr10, align 8
  %cmp87 = icmp sgt i64 %indvars.iv110, 1
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113

for.end113:                                       ; preds = %for.inc112
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.inc, %entry
  %indvars.iv = phi i64 [ 0, %entry ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.inc
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !21}
!23 = distinct !{!23, !21}

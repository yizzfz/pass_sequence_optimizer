; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %arraydecay)
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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end18.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv3063 = phi [2000 x double]* [ %A, %for.cond1.preheader.lr.ph ], [ %6, %for.end18.for.cond1.preheader_crit_edge ]
  %indvars.iv3362 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next34, %for.end18.for.cond1.preheader_crit_edge ]
  %indvars.iv3560 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next36, %for.end18.for.cond1.preheader_crit_edge ]
  %0 = mul i64 %indvars.iv3560, 2001
  %1 = add i64 %0, 1
  %scevgep86 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %1
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %exitcond3257 = icmp eq i64 %indvars.iv3560, 1999
  br i1 %exitcond3257, label %for.end18, label %for.cond8.preheader.for.body11_crit_edge

for.cond8.preheader.for.body11_crit_edge:         ; preds = %for.cond8.preheader
  %2 = mul i64 %indvars.iv3560, -8
  %3 = add i64 %2, 15992
  %scevgep8687 = bitcast double* %scevgep86 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8687, i8 0, i64 %3, i32 8, i1 false)
  br label %for.end18

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv1955 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next20, %for.body3 ]
  %4 = sub nsw i64 0, %indvars.iv1955
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv3560, i64 %indvars.iv1955
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1955, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next20, %indvars.iv3362
  br i1 %exitcond25, label %for.cond8.preheader, label %for.body3

for.end18:                                        ; preds = %for.cond8.preheader, %for.cond8.preheader.for.body11_crit_edge
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv3063, i64 0, i64 %indvars.iv3560
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv3560, 1
  %cmp = icmp slt i64 %indvars.iv.next36, 2000
  br i1 %cmp, label %for.end18.for.cond1.preheader_crit_edge, label %for.cond30.preheader.lr.ph.for.cond30.preheader_crit_edge

for.end18.for.cond1.preheader_crit_edge:          ; preds = %for.end18
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv3063, i64 1, i64 0
  %6 = bitcast double* %scevgep to [2000 x double]*
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3362, 1
  br label %for.cond1.preheader

for.cond30.preheader.lr.ph.for.cond30.preheader_crit_edge: ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.cond30.preheader

for.cond30.preheader:                             ; preds = %for.cond30.preheader, %for.cond30.preheader.lr.ph.for.cond30.preheader_crit_edge
  %indvars.iv1753 = phi i64 [ 0, %for.cond30.preheader.lr.ph.for.cond30.preheader_crit_edge ], [ %indvars.iv.next18.7, %for.cond30.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv1753, 16000
  %scevgep85 = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18 = or i64 %indvars.iv1753, 1
  %8 = mul nuw nsw i64 %indvars.iv.next18, 16000
  %scevgep85.1 = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.1 = or i64 %indvars.iv1753, 2
  %9 = mul nuw nsw i64 %indvars.iv.next18.1, 16000
  %scevgep85.2 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.2 = or i64 %indvars.iv1753, 3
  %10 = mul nuw nsw i64 %indvars.iv.next18.2, 16000
  %scevgep85.3 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.3 = or i64 %indvars.iv1753, 4
  %11 = mul nuw nsw i64 %indvars.iv.next18.3, 16000
  %scevgep85.4 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.4 = or i64 %indvars.iv1753, 5
  %12 = mul nuw nsw i64 %indvars.iv.next18.4, 16000
  %scevgep85.5 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.5 = or i64 %indvars.iv1753, 6
  %13 = mul nuw nsw i64 %indvars.iv.next18.5, 16000
  %scevgep85.6 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.6 = or i64 %indvars.iv1753, 7
  %14 = mul nuw nsw i64 %indvars.iv.next18.6, 16000
  %scevgep85.7 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep85.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next18.7 = add nsw i64 %indvars.iv1753, 8
  %exitcond98.7 = icmp eq i64 %indvars.iv.next18.7, 2000
  br i1 %exitcond98.7, label %for.cond48.preheader.for.cond52.preheader_crit_edge.preheader, label %for.cond30.preheader

for.cond48.preheader.for.cond52.preheader_crit_edge.preheader: ; preds = %for.cond30.preheader
  br label %for.cond48.preheader.for.cond52.preheader_crit_edge

for.cond48.preheader.for.cond52.preheader_crit_edge: ; preds = %for.cond48.preheader.for.cond52.preheader_crit_edge.preheader, %for.inc75
  %indvars.iv1148 = phi i64 [ %15, %for.inc75 ], [ 0, %for.cond48.preheader.for.cond52.preheader_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv1148
  %15 = add i64 %indvars.iv1148, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %15
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.inc72, %for.cond48.preheader.for.cond52.preheader_crit_edge
  %indvars.iv745 = phi i64 [ 0, %for.cond48.preheader.for.cond52.preheader_crit_edge ], [ %indvars.iv.next8, %for.inc72 ]
  %16 = bitcast double* %scevgep5 to i8*
  %17 = bitcast double* %scevgep3 to i8*
  %18 = mul i64 %indvars.iv745, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %18
  %19 = add i64 %18, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %19
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv745, i64 %indvars.iv1148
  %bound0 = icmp ult i8* %scevgep1, %16
  %bound1 = icmp ult i8* %17, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.body55.preheader, label %vector.ph

for.body55.preheader:                             ; preds = %for.cond52.preheader
  br label %for.body55

vector.ph:                                        ; preds = %for.cond52.preheader
  %.pre = load double, double* %arrayidx59, align 8, !alias.scope !1
  %20 = insertelement <2 x double> undef, double %.pre, i32 0
  %21 = shufflevector <2 x double> %20, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv1148
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %23, i64 %indvars.iv1148
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %24, i64 %indvars.iv1148
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %25, i64 %indvars.iv1148
  %30 = load double, double* %26, align 8, !alias.scope !4
  %31 = load double, double* %27, align 8, !alias.scope !4
  %32 = load double, double* %28, align 8, !alias.scope !4
  %33 = load double, double* %29, align 8, !alias.scope !4
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = insertelement <2 x double> %34, double %31, i32 1
  %36 = insertelement <2 x double> undef, double %32, i32 0
  %37 = insertelement <2 x double> %36, double %33, i32 1
  %38 = fmul <2 x double> %21, %35
  %39 = fmul <2 x double> %21, %37
  %40 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv745, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %44 = fadd <2 x double> %wide.load, %38
  %45 = fadd <2 x double> %wide.load12, %39
  store <2 x double> %44, <2 x double>* %41, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %45, <2 x double>* %43, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %46 = icmp eq i64 %index.next, 2000
  br i1 %46, label %for.inc72, label %vector.body, !llvm.loop !9

for.body55:                                       ; preds = %for.body55, %for.body55.preheader
  %indvars.iv343 = phi i64 [ 0, %for.body55.preheader ], [ %indvars.iv.next4.1, %for.body55 ]
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv343, i64 %indvars.iv1148
  %50 = load double, double* %arrayidx63, align 8
  %mul = fmul double %49, %50
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv745, i64 %indvars.iv343
  %51 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %51, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next4 = or i64 %indvars.iv343, 1
  %52 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next4, i64 %indvars.iv1148
  %53 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %52, %53
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv745, i64 %indvars.iv.next4
  %54 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %54, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv343, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next4.1, 2000
  br i1 %exitcond6.1, label %for.inc72, label %for.body55, !llvm.loop !12

for.inc72:                                        ; preds = %vector.body, %for.body55
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv745, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond10, label %for.inc75, label %for.cond52.preheader

for.inc75:                                        ; preds = %for.inc72
  %exitcond97 = icmp eq i64 %15, 2000
  br i1 %exitcond97, label %for.cond82.preheader.preheader, label %for.cond48.preheader.for.cond52.preheader_crit_edge

for.cond82.preheader.preheader:                   ; preds = %for.inc75
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.inc97
  %indvars.iv140 = phi i64 [ %55, %for.inc97 ], [ 0, %for.cond82.preheader.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %55 = add i64 %indvars.iv140, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %55, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %56 = mul i64 %indvars.iv140, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %56
  %57 = add i64 %56, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %57
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %found.conflict26 = and i1 %bound024, %bound125
  br i1 %found.conflict26, label %for.body85.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond82.preheader
  br label %vector.body13

for.body85.preheader:                             ; preds = %for.cond82.preheader
  br label %for.body85

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %58 = bitcast i8* %call to [2000 x [2000 x double]]*
  %59 = bitcast i8* %call to [2000 x [2000 x double]]*
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv140, i64 %index30
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !13
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %index30
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %65, align 8, !alias.scope !16, !noalias !13
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %67, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %68 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %58, i64 0, i64 %indvars.iv140, i64 %index.next31
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !13
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !13
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %index.next31
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %73, align 8, !alias.scope !16, !noalias !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %75, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %76 = icmp eq i64 %index.next31.1, 2000
  br i1 %76, label %for.inc97, label %vector.body13, !llvm.loop !18

for.body85:                                       ; preds = %for.body85, %for.body85.preheader
  %indvars.iv38 = phi i64 [ 0, %for.body85.preheader ], [ %indvars.iv.next.4, %for.body85 ]
  %77 = bitcast i8* %call to [2000 x [2000 x double]]*
  %78 = bitcast i8* %call to [2000 x [2000 x double]]*
  %79 = bitcast i8* %call to [2000 x [2000 x double]]*
  %80 = bitcast i8* %call to [2000 x [2000 x double]]*
  %81 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv140, i64 %indvars.iv38
  %82 = bitcast double* %arrayidx89 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv38
  %84 = bitcast double* %arrayidx93 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv38, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv140, i64 %indvars.iv.next
  %85 = bitcast double* %arrayidx89.1 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv.next
  %87 = bitcast double* %arrayidx93.1 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv38, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv140, i64 %indvars.iv.next.1
  %88 = bitcast double* %arrayidx89.2 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv.next.1
  %90 = bitcast double* %arrayidx93.2 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv38, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv140, i64 %indvars.iv.next.2
  %91 = bitcast double* %arrayidx89.3 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv.next.2
  %93 = bitcast double* %arrayidx93.3 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv38, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %77, i64 0, i64 %indvars.iv140, i64 %indvars.iv.next.3
  %94 = bitcast double* %arrayidx89.4 to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv140, i64 %indvars.iv.next.3
  %96 = bitcast double* %arrayidx93.4 to i64*
  store i64 %95, i64* %96, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv38, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc97, label %for.body85, !llvm.loop !19

for.inc97:                                        ; preds = %vector.body13, %for.body85
  %exitcond96 = icmp eq i64 %55, 2000
  br i1 %exitcond96, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.inc97
  tail call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
for.cond1.preheader.preheader:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end47.for.cond1.preheader_crit_edge
  %indvars.iv1127 = phi [2000 x double]* [ %20, %for.end47.for.cond1.preheader_crit_edge ], [ %A, %for.cond1.preheader.preheader ]
  %indvars.iv1525 = phi i64 [ %indvars.iv.next16, %for.end47.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv1525, -1
  %exitcond819 = icmp eq i64 %indvars.iv1525, 0
  br i1 %exitcond819, label %for.end47, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx24.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 0
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 0
  br label %for.cond4.preheader

for.body30.lr.ph:                                 ; preds = %for.end
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv1525
  %.pre29 = load double, double* %arrayidx43, align 8
  %xtraiter1 = and i64 %indvars.iv1525, 3
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.body30.prol.loopexit, label %for.body30.prol.preheader

for.body30.prol.preheader:                        ; preds = %for.body30.lr.ph
  br label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.prol, %for.body30.prol.preheader
  %1 = phi double [ %.pre29, %for.body30.prol.preheader ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv923.prol = phi i64 [ 0, %for.body30.prol.preheader ], [ %indvars.iv.next10.prol, %for.body30.prol ]
  %prol.iter = phi i64 [ %xtraiter1, %for.body30.prol.preheader ], [ %prol.iter.sub, %for.body30.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv923.prol
  %2 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %2, %2
  %sub44.prol = fsub double %1, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next10.prol = add nuw nsw i64 %indvars.iv923.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body30.prol.loopexit, label %for.body30.prol, !llvm.loop !20

for.body30.prol.loopexit:                         ; preds = %for.body30.prol, %for.body30.lr.ph
  %.unr3 = phi double [ %.pre29, %for.body30.lr.ph ], [ %sub44.prol, %for.body30.prol ]
  %indvars.iv923.unr = phi i64 [ 0, %for.body30.lr.ph ], [ %indvars.iv.next10.prol, %for.body30.prol ]
  %3 = icmp ult i64 %0, 3
  br i1 %3, label %for.end47, label %for.body30.lr.ph.new

for.body30.lr.ph.new:                             ; preds = %for.body30.prol.loopexit
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv320 = phi i64 [ %indvars.iv.next4, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %exitcond17 = icmp eq i64 %indvars.iv320, 0
  br i1 %exitcond17, label %for.cond4.preheader.for.end_crit_edge, label %for.body6.lr.ph

for.cond4.preheader.for.end_crit_edge:            ; preds = %for.cond4.preheader
  %.pre28 = load double, double* %arrayidx24.phi.trans.insert, align 8
  br label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv320
  %.pre = load double, double* %arrayidx16, align 8
  %xtraiter = and i64 %indvars.iv320, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %4 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv320, i64 0
  %5 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %4, %5
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ undef, %for.body6.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol ], [ %.pre, %for.body6.lr.ph ]
  %indvars.iv18.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %6 = icmp eq i64 %indvars.iv320, 1
  br i1 %6, label %for.end, label %for.body6.lr.ph.new

for.body6.lr.ph.new:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.lr.ph.new
  %7 = phi double [ %.unr.ph, %for.body6.lr.ph.new ], [ %sub.1, %for.body6 ]
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph, %for.body6.lr.ph.new ], [ %indvars.iv.next.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv18
  %8 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv320, i64 %indvars.iv18
  %9 = load double, double* %arrayidx12, align 8
  %mul = fmul double %8, %9
  %sub = fsub double %7, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv.next
  %10 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv320, i64 %indvars.iv.next
  %11 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %10, %11
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv18, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv320
  br i1 %exitcond.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6.prol.loopexit, %for.body6, %for.cond4.preheader.for.end_crit_edge
  %arrayidx24.pre-phi = phi double* [ %arrayidx24.phi.trans.insert, %for.cond4.preheader.for.end_crit_edge ], [ %arrayidx16, %for.body6.prol.loopexit ], [ %arrayidx16, %for.body6 ]
  %12 = phi double [ %.pre28, %for.cond4.preheader.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit ], [ %sub.1, %for.body6 ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv320, i64 %indvars.iv320
  %13 = load double, double* %arrayidx20, align 8
  %div = fdiv double %12, %13
  store double %div, double* %arrayidx24.pre-phi, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv320, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, %indvars.iv1525
  br i1 %exitcond8, label %for.body30.lr.ph, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30, %for.body30.lr.ph.new
  %14 = phi double [ %.unr3, %for.body30.lr.ph.new ], [ %sub44.3, %for.body30 ]
  %indvars.iv923 = phi i64 [ %indvars.iv923.unr, %for.body30.lr.ph.new ], [ %indvars.iv.next10.3, %for.body30 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv923
  %15 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %15, %15
  %sub44 = fsub double %14, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv923, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv.next10
  %16 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %16, %16
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv923, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv.next10.1
  %17 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %17, %17
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv923, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1525, i64 %indvars.iv.next10.2
  %18 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %18, %18
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv923, 4
  %exitcond14.3 = icmp eq i64 %indvars.iv.next10.3, %indvars.iv1525
  br i1 %exitcond14.3, label %for.end47, label %for.body30

for.end47:                                        ; preds = %for.body30.prol.loopexit, %for.body30, %for.cond1.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv1127, i64 0, i64 %indvars.iv1525
  %19 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %19) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1525, 1
  %cmp = icmp slt i64 %indvars.iv.next16, 2000
  br i1 %cmp, label %for.end47.for.cond1.preheader_crit_edge, label %for.end58

for.end47.for.cond1.preheader_crit_edge:          ; preds = %for.end47
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv1127, i64 1, i64 0
  %20 = bitcast double* %scevgep to [2000 x double]*
  br label %for.cond1.preheader

for.end58:                                        ; preds = %for.end47
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv412 = phi i64 [ %indvars.iv.next5, %for.inc10 ], [ 1, %for.cond2.preheader.preheader ]
  %indvars.iv611 = phi i64 [ %indvars.iv.next7, %for.inc10 ], [ 0, %for.cond2.preheader.preheader ]
  %3 = mul nsw i64 %indvars.iv611, 2000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nsw i64 %indvars.iv9, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv611, i64 %indvars.iv9
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv412
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv611, 1
  %cmp = icmp slt i64 %indvars.iv.next7, 2000
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv412, 1
  br i1 %cmp, label %for.cond2.preheader, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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

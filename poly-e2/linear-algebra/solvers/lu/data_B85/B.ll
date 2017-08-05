; ModuleID = 'A.ll'
source_filename = "lu.c"
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @kernel_lu([2000 x double]* %arraydecay1)
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
  %arraydecay3 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %arraydecay3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv131 = phi i64 [ 0, %entry ], [ %indvars.iv.next132, %for.inc23 ]
  %0 = shl i64 %indvars.iv131, 32
  %sext = add nuw nsw i64 %0, 4294967296
  %1 = ashr exact i64 %sext, 32
  %2 = sub nsw i64 1998, %indvars.iv131
  %3 = shl i64 %2, 3
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %cmp972 = icmp slt i64 %indvars.iv.next132, 2000
  br i1 %cmp972, label %for.inc16.for.inc23_crit_edge, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc ], [ 0, %for.inc.lr.ph ]
  %4 = sub nsw i64 0, %indvars.iv115
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv115
  store double %add, double* %arrayidx6, align 8
  %exitcond121 = icmp eq i64 %indvars.iv115, %indvars.iv131
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  br i1 %exitcond121, label %for.cond8.preheader, label %for.inc

for.inc16.for.inc23_crit_edge:                    ; preds = %for.cond8.preheader
  %6 = and i64 %3, 34359738360
  %scevgep129 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %1
  %7 = add nuw nsw i64 %6, 8
  %scevgep129130 = bitcast double* %scevgep129 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep129130, i8 0, i64 %7, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.cond8.preheader, %for.inc16.for.inc23_crit_edge
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv131, i64 %indvars.iv131
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond149 = icmp eq i64 %indvars.iv.next132, 2000
  br i1 %exitcond149, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.inc41.us

for.inc41.us:                                     ; preds = %for.inc41.us, %for.end25
  %indvars.iv113 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next114.7, %for.inc41.us ]
  %8 = mul nuw nsw i64 %indvars.iv113, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114 = or i64 %indvars.iv113, 1
  %9 = mul nuw nsw i64 %indvars.iv.next114, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.1 = or i64 %indvars.iv113, 2
  %10 = mul nuw nsw i64 %indvars.iv.next114.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.2 = or i64 %indvars.iv113, 3
  %11 = mul nuw nsw i64 %indvars.iv.next114.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.3 = or i64 %indvars.iv113, 4
  %12 = mul nuw nsw i64 %indvars.iv.next114.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.4 = or i64 %indvars.iv113, 5
  %13 = mul nuw nsw i64 %indvars.iv.next114.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.5 = or i64 %indvars.iv113, 6
  %14 = mul nuw nsw i64 %indvars.iv.next114.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.6 = or i64 %indvars.iv113, 7
  %15 = mul nuw nsw i64 %indvars.iv.next114.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next114.7 = add nsw i64 %indvars.iv113, 8
  %exitcond148.7 = icmp eq i64 %indvars.iv.next114.7, 2000
  br i1 %exitcond148.7, label %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge.preheader, label %for.inc41.us

for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge.preheader: ; preds = %for.inc41.us
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge

for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge: ; preds = %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge.preheader, %for.inc75.us
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %for.inc75.us ], [ 0, %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv107
  %19 = add i64 %indvars.iv107, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %19
  %20 = bitcast double* %scevgep5 to i8*
  %21 = bitcast double* %scevgep3 to i8*
  br label %for.cond52.preheader.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond147 = icmp eq i64 %indvars.iv.next108, 2000
  br i1 %exitcond147, label %for.cond82.preheader.us.preheader, label %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge

for.cond82.preheader.us.preheader:                ; preds = %for.inc75.us
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  %27 = bitcast i8* %call to [2000 x [2000 x double]]*
  %28 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.inc72.us.us, %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge
  %indvars.iv105 = phi i64 [ 0, %for.cond48.preheader.us.for.cond52.preheader.us.us_crit_edge ], [ %indvars.iv.next106, %for.inc72.us.us ]
  %29 = mul i64 %indvars.iv105, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %29
  %30 = add i64 %29, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %30
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv105, i64 %indvars.iv107
  %bound0 = icmp ult i8* %scevgep1, %20
  %bound1 = icmp ult i8* %21, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bc7 = bitcast double* %arrayidx59.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %31 = or i64 %index, 1
  %32 = or i64 %index, 2
  %33 = or i64 %index, 3
  %34 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %35 = insertelement <2 x double> undef, double %34, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = insertelement <2 x double> undef, double %34, i32 0
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv107
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %31, i64 %indvars.iv107
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %32, i64 %indvars.iv107
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %33, i64 %indvars.iv107
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fmul <2 x double> %36, %48
  %52 = fmul <2 x double> %38, %50
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv105, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = fadd <2 x double> %wide.load, %51
  %58 = fadd <2 x double> %wide.load12, %52
  %59 = bitcast double* %53 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %for.inc72.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us
  br label %for.inc72.us.us

for.inc72.us.us.loopexit43:                       ; preds = %vector.body
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit43, %for.inc72.us.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond146, label %for.inc75.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv101 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next102.1, %for.inc69.us.us ]
  %62 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv101, i64 %indvars.iv107
  %63 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %62, %63
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv105, i64 %indvars.iv101
  %64 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %64, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %65 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next102, i64 %indvars.iv107
  %66 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %65, %66
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv105, i64 %indvars.iv.next102
  %67 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %67, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond145.1 = icmp eq i64 %indvars.iv.next102, 1999
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  br i1 %exitcond145.1, label %for.inc72.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !12

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.inc97.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %for.inc97.us ], [ 0, %for.cond82.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %68 = add i64 %indvars.iv99, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %68, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %69 = mul i64 %indvars.iv99, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %69
  %70 = add i64 %69, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %70
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.inc94.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %for.cond82.preheader.us
  br label %vector.body13

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv99, i64 %index30
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %index30
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv99, i64 %index.next31
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %index.next31
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %87 = icmp eq i64 %index.next31.1, 2000
  br i1 %87, label %for.inc97.us.loopexit42, label %vector.body13, !llvm.loop !18

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv99, i64 %indvars.iv
  %88 = bitcast double* %arrayidx89.us to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv
  %90 = bitcast double* %arrayidx93.us to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next
  %91 = bitcast double* %arrayidx89.us.1 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next
  %93 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %94 = bitcast double* %arrayidx89.us.2 to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next.1
  %96 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %95, i64* %96, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %97 = bitcast double* %arrayidx89.us.3 to i64*
  %98 = load i64, i64* %97, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next.2
  %99 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %98, i64* %99, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv99, i64 %indvars.iv.next.3
  %100 = bitcast double* %arrayidx89.us.4 to i64*
  %101 = load i64, i64* %100, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv99, i64 %indvars.iv.next.3
  %102 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %101, i64* %102, align 8
  %exitcond144.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond144.4, label %for.inc97.us.loopexit, label %for.inc94.us, !llvm.loop !19

for.inc97.us.loopexit:                            ; preds = %for.inc94.us
  br label %for.inc97.us

for.inc97.us.loopexit42:                          ; preds = %vector.body13
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit42, %for.inc97.us.loopexit
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond = icmp eq i64 %indvars.iv.next100, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.inc97.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %for.inc54 ], [ 0, %entry ]
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc54 ], [ 4294967295, %entry ]
  %0 = and i64 %indvars.iv68, 4294967295
  %cmp238 = icmp sgt i64 %indvars.iv1, 0
  br i1 %cmp238, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  %cmp3240 = icmp sgt i64 %indvars.iv1, 0
  br i1 %cmp3240, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %1 = and i64 %indvars.iv68, 1
  %lcmp.mod7 = icmp eq i64 %1, 0
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 0
  %2 = icmp eq i64 %0, 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.inc51.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.inc51.us ], [ %indvars.iv1, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv60
  br i1 %lcmp.mod7, label %for.inc48.us.prol, label %for.inc48.us.prol.loopexit

for.inc48.us.prol:                                ; preds = %for.cond31.preheader.us
  %3 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv60
  %4 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %3, %4
  %5 = load double, double* %arrayidx46.us, align 8
  %sub47.us.prol = fsub double %5, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.cond31.preheader.us
  %indvars.iv52.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  br i1 %2, label %for.inc51.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next53.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv52
  %6 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv60
  %7 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %6, %7
  %8 = load double, double* %arrayidx46.us, align 8
  %sub47.us = fsub double %8, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next53
  %9 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next53, i64 %indvars.iv60
  %10 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %9, %10
  %11 = load double, double* %arrayidx46.us, align 8
  %sub47.us.1 = fsub double %11, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next53, %0
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  br i1 %exitcond.1, label %for.inc51.us.loopexit, label %for.inc48.us

for.inc51.us.loopexit:                            ; preds = %for.inc48.us
  br label %for.inc51.us

for.inc51.us:                                     ; preds = %for.inc51.us.loopexit, %for.inc48.us.prol.loopexit
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next61, 2000
  br i1 %exitcond4, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc25 ], [ 4294967295, %for.cond4.preheader.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %12 = and i64 %indvars.iv65, 4294967295
  %cmp536 = icmp sgt i64 %indvars.iv49, 0
  br i1 %cmp536, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv49
  %13 = and i64 %indvars.iv65, 1
  %lcmp.mod = icmp eq i64 %13, 0
  br i1 %lcmp.mod, label %for.inc.prol, label %for.inc.prol.loopexit

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %14 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv49
  %15 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %14, %15
  %16 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %16, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %17 = icmp eq i64 %12, 0
  br i1 %17, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv
  %18 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv49
  %19 = load double, double* %arrayidx12, align 8
  %mul = fmul double %18, %19
  %20 = load double, double* %arrayidx16, align 8
  %sub = fsub double %20, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv.next
  %21 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv49
  %22 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %21, %22
  %23 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %23, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond67.1 = icmp eq i64 %indvars.iv.next, %12
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond67.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit, %for.cond4.preheader
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv49
  %24 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv1, i64 %indvars.iv49
  %25 = load double, double* %arrayidx24, align 8
  %div = fdiv double %25, %24
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %indvars.iv.next66 = add nuw nsw i64 %12, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next50, %indvars.iv1
  br i1 %exitcond3, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.inc51.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader, %for.cond31.preheader.lr.ph
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next69 = add nuw nsw i64 %0, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us, %entry
  %indvars.iv15 = phi i64 [ 0, %entry ], [ %indvars.iv.next16, %for.inc10.us ]
  %3 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv15, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond18, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.inc10.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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

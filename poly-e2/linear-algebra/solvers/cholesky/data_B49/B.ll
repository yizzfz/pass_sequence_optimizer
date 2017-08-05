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
for.body.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.body.lr.ph, %for.inc23.for.body_crit_edge
  %indvars.iv85 = phi i64 [ %0, %for.inc23.for.body_crit_edge ], [ 0, %for.body.lr.ph ]
  %0 = add nuw nsw i64 %indvars.iv85, 1
  %sext = shl i64 %0, 32
  %1 = ashr exact i64 %sext, 32
  %2 = sub i64 1998, %indvars.iv85
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv69 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next70, %for.inc ]
  %5 = sub nsw i64 0, %indvars.iv69
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv69
  store double %add, double* %arrayidx6, align 8
  %exitcond75 = icmp eq i64 %indvars.iv69, %indvars.iv85
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br i1 %exitcond75, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %scevgep83 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %1
  %7 = add nuw nsw i64 %4, 8
  %cmp945 = icmp slt i64 %0, 2000
  br i1 %cmp945, label %for.inc23.for.body_crit_edge, label %for.end25.for.body29.us_crit_edge

for.inc23.for.body_crit_edge:                     ; preds = %for.end
  %8 = bitcast double* %scevgep83 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %8, i8 0, i64 %7, i32 8, i1 false)
  %arrayidx2287 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %arrayidx2287, align 8
  br label %for.inc.lr.ph

for.end25.for.body29.us_crit_edge:                ; preds = %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv85
  store double 1.000000e+00, double* %arrayidx22, align 8
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.body29.us

for.body29.us:                                    ; preds = %for.body29.us, %for.end25.for.body29.us_crit_edge
  %indvars.iv67 = phi i64 [ 0, %for.end25.for.body29.us_crit_edge ], [ %indvars.iv.next68.7, %for.body29.us ]
  %9 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68 = or i64 %indvars.iv67, 1
  %10 = mul nuw nsw i64 %indvars.iv.next68, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.1 = or i64 %indvars.iv67, 2
  %11 = mul nuw nsw i64 %indvars.iv.next68.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.2 = or i64 %indvars.iv67, 3
  %12 = mul nuw nsw i64 %indvars.iv.next68.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3 = or i64 %indvars.iv67, 4
  %13 = mul nuw nsw i64 %indvars.iv.next68.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.4 = or i64 %indvars.iv67, 5
  %14 = mul nuw nsw i64 %indvars.iv.next68.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.5 = or i64 %indvars.iv67, 6
  %15 = mul nuw nsw i64 %indvars.iv.next68.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.6 = or i64 %indvars.iv67, 7
  %16 = mul nuw nsw i64 %indvars.iv.next68.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.7 = add nuw nsw i64 %indvars.iv67, 8
  %cmp27.us.7 = icmp slt i64 %indvars.iv.next68.7, 2000
  br i1 %cmp27.us.7, label %for.body29.us, label %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader

for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader: ; preds = %for.body29.us
  br label %for.cond48.preheader.us.for.body51.us.us_crit_edge

for.cond48.preheader.us.for.body51.us.us_crit_edge: ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader
  %indvars.iv61 = phi i64 [ 0, %for.cond48.preheader.us.for.body51.us.us_crit_edge.preheader ], [ %17, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv61
  %17 = add i64 %indvars.iv61, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %17
  br label %vector.memcheck

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %cmp45.us = icmp slt i64 %17, 2000
  br i1 %cmp45.us, label %for.cond48.preheader.us.for.body51.us.us_crit_edge, label %vector.memcheck28.preheader

vector.memcheck28.preheader:                      ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %vector.memcheck28

vector.memcheck:                                  ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond48.preheader.us.for.body51.us.us_crit_edge
  %indvars.iv59 = phi i64 [ 0, %for.cond48.preheader.us.for.body51.us.us_crit_edge ], [ %indvars.iv.next60, %for.cond52.for.inc72_crit_edge.us.us ]
  %18 = bitcast double* %scevgep3 to i8*
  %19 = bitcast double* %scevgep5 to i8*
  %20 = mul i64 %indvars.iv59, 16000
  %scevgep1 = getelementptr i8, i8* %call, i64 %20
  %21 = add i64 %20, 16000
  %scevgep2 = getelementptr i8, i8* %call, i64 %21
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv59, i64 %indvars.iv61
  %bound0 = icmp ult i8* %scevgep1, %19
  %bound1 = icmp ult i8* %18, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv61
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %23, i64 %indvars.iv61
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %24, i64 %indvars.iv61
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %25, i64 %indvars.iv61
  %33 = load double, double* %29, align 8, !alias.scope !4
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = insertelement <2 x double> undef, double %33, i32 0
  %38 = insertelement <2 x double> %37, double %34, i32 1
  %39 = insertelement <2 x double> undef, double %35, i32 0
  %40 = insertelement <2 x double> %39, double %36, i32 1
  %41 = fmul <2 x double> %28, %38
  %42 = fmul <2 x double> %28, %40
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv59, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %47 = fadd <2 x double> %41, %wide.load
  %48 = fadd <2 x double> %42, %wide.load12
  store <2 x double> %47, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %48, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %for.cond52.for.inc72_crit_edge.us.us.loopexit43, label %vector.body, !llvm.loop !9

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit43:  ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit43, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next60 = add nuw i64 %indvars.iv59, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next60, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.cond48.for.inc75_crit_edge.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next56.1, %for.inc69.us.us ]
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv61
  %52 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %51, %52
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv59, i64 %indvars.iv55
  %53 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %53
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %54 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next56, i64 %indvars.iv61
  %55 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %54, %55
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv59, i64 %indvars.iv.next56
  %56 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %56
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56, 1999
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  br i1 %exitcond58.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !12

vector.memcheck28:                                ; preds = %for.cond82.for.inc97_crit_edge.us, %vector.memcheck28.preheader
  %indvars.iv53 = phi i64 [ 0, %vector.memcheck28.preheader ], [ %57, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 0
  %57 = add i64 %indvars.iv53, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %A, i64 %57, i64 0
  %58 = mul i64 %indvars.iv53, 16000
  %scevgep22 = getelementptr i8, i8* %call, i64 %58
  %59 = add i64 %58, 16000
  %scevgep23 = getelementptr i8, i8* %call, i64 %59
  %60 = bitcast double* %scevgep20 to i8*
  %61 = bitcast double* %scevgep18 to i8*
  %bound024 = icmp ult i8* %61, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %60
  %found.conflict26 = and i1 %bound024, %bound125
  br i1 %found.conflict26, label %for.inc94.us.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %vector.memcheck28
  br label %vector.body13

for.inc94.us.preheader:                           ; preds = %vector.memcheck28
  br label %for.inc94.us

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %62 = bitcast i8* %call to [2000 x [2000 x double]]*
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv53, i64 %index30
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %index30
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %68, align 8, !alias.scope !16, !noalias !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %62, i64 0, i64 %indvars.iv53, i64 %index.next31
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %index.next31
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nuw nsw i64 %index30, 8
  %79 = icmp eq i64 %index.next31.1, 2000
  br i1 %79, label %for.cond82.for.inc97_crit_edge.us.loopexit42, label %vector.body13, !llvm.loop !18

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %80 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv53, i64 %indvars.iv
  %81 = bitcast double* %arrayidx89.us to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv
  %83 = bitcast double* %arrayidx93.us to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx89.us.1 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next
  %86 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %85, i64* %86, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx89.us.2 to i64*
  %88 = load i64, i64* %87, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next.1
  %89 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %88, i64* %89, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx89.us.3 to i64*
  %91 = load i64, i64* %90, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next.2
  %92 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %91, i64* %92, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %80, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx89.us.4 to i64*
  %94 = load i64, i64* %93, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv.next.3
  %95 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %94, i64* %95, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !19

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit42:     ; preds = %vector.body13
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit42, %for.cond82.for.inc97_crit_edge.us.loopexit
  %cmp79.us = icmp slt i64 %57, 2000
  br i1 %cmp79.us, label %vector.memcheck28, label %for.end99

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture %A) unnamed_addr #0 {
entry.for.body_crit_edge:
  br label %for.body

for.body:                                         ; preds = %for.inc56.for.body_crit_edge, %entry.for.body_crit_edge
  %indvars.iv4 = phi i2 [ %indvars.iv.next5, %for.inc56.for.body_crit_edge ], [ 0, %entry.for.body_crit_edge ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.inc56.for.body_crit_edge ], [ 0, %entry.for.body_crit_edge ]
  %indvars.iv16 = phi i32 [ %indvars.iv.next17, %for.inc56.for.body_crit_edge ], [ -1, %entry.for.body_crit_edge ]
  %0 = zext i2 %indvars.iv4 to i64
  %1 = add i64 %indvars.iv20, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp22 = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp22, label %for.cond4.preheader.preheader, label %for.cond28.preheader.for.inc56_crit_edge

for.cond4.preheader.preheader:                    ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 0
  br label %for.cond4.preheader

for.cond28.preheader.for.inc56_crit_edge:         ; preds = %for.body
  %arrayidx51.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  %.pre24 = load double, double* %arrayidx51.phi.trans.insert, align 8
  br label %for.inc56

for.inc45.lr.ph:                                  ; preds = %for.inc25
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  %.pre23 = load double, double* %arrayidx43, align 8
  %wide.trip.count18 = zext i32 %indvars.iv16 to i64
  %xtraiter1 = and i64 %indvars.iv20, 3
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  br i1 %lcmp.mod2, label %for.inc45.prol.loopexit, label %for.inc45.prol.preheader

for.inc45.prol.preheader:                         ; preds = %for.inc45.lr.ph
  br label %for.inc45.prol

for.inc45.prol:                                   ; preds = %for.inc45.prol, %for.inc45.prol.preheader
  %3 = phi double [ %.pre23, %for.inc45.prol.preheader ], [ %sub44.prol, %for.inc45.prol ]
  %indvars.iv14.prol = phi i64 [ 0, %for.inc45.prol.preheader ], [ %indvars.iv.next15.prol, %for.inc45.prol ]
  %prol.iter = phi i64 [ %xtraiter1, %for.inc45.prol.preheader ], [ %prol.iter.sub, %for.inc45.prol ]
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv14.prol
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %3, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc45.prol.loopexit.loopexit, label %for.inc45.prol, !llvm.loop !20

for.inc45.prol.loopexit.loopexit:                 ; preds = %for.inc45.prol
  br label %for.inc45.prol.loopexit

for.inc45.prol.loopexit:                          ; preds = %for.inc45.prol.loopexit.loopexit, %for.inc45.lr.ph
  %sub44.lcssa.unr = phi double [ undef, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %.unr3 = phi double [ %.pre23, %for.inc45.lr.ph ], [ %sub44.prol, %for.inc45.prol.loopexit.loopexit ]
  %indvars.iv14.unr = phi i64 [ 0, %for.inc45.lr.ph ], [ %0, %for.inc45.prol.loopexit.loopexit ]
  %5 = icmp ult i64 %2, 3
  br i1 %5, label %for.inc56, label %for.inc45.lr.ph.new

for.inc45.lr.ph.new:                              ; preds = %for.inc45.prol.loopexit
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next13, %for.inc25 ]
  %indvars.iv10 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next11, %for.inc25 ]
  %6 = add i64 %indvars.iv12, 4294967295
  %7 = and i64 %6, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv12, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv12
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %wide.trip.count = zext i32 %indvars.iv10 to i64
  %8 = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %9 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 0
  %10 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %9, %10
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ undef, %for.inc.lr.ph ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %11 = icmp eq i64 %7, 0
  br i1 %11, label %for.inc25, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %12 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  %13 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %14 = load double, double* %arrayidx12, align 8
  %mul = fmul double %13, %14
  %sub = fsub double %12, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next
  %15 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %15, %16
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc25.loopexit, label %for.inc

for.inc25.loopexit:                               ; preds = %for.inc
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.cond4.preheader
  %17 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit.unr-lcssa ], [ %sub.1, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv12
  %18 = load double, double* %arrayidx20, align 8
  %div = fdiv double %17, %18
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next13 = add nuw i64 %indvars.iv12, 1
  %cmp2 = icmp slt i64 %indvars.iv.next13, %indvars.iv20
  %indvars.iv.next11 = add nsw i32 %indvars.iv10, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc45.lr.ph

for.inc45:                                        ; preds = %for.inc45, %for.inc45.lr.ph.new
  %19 = phi double [ %.unr3, %for.inc45.lr.ph.new ], [ %sub44.3, %for.inc45 ]
  %indvars.iv14 = phi i64 [ %indvars.iv14.unr, %for.inc45.lr.ph.new ], [ %indvars.iv.next15.3, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv14
  %20 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %20, %20
  %sub44 = fsub double %19, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next15
  %21 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %21, %21
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %arrayidx34.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next15.1
  %22 = load double, double* %arrayidx34.2, align 8
  %mul39.2 = fmul double %22, %22
  %sub44.2 = fsub double %sub44.1, %mul39.2
  store double %sub44.2, double* %arrayidx43, align 8
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv14, 3
  %arrayidx34.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv.next15.2
  %23 = load double, double* %arrayidx34.3, align 8
  %mul39.3 = fmul double %23, %23
  %sub44.3 = fsub double %sub44.2, %mul39.3
  store double %sub44.3, double* %arrayidx43, align 8
  %exitcond19.3 = icmp eq i64 %indvars.iv.next15.2, %wide.trip.count18
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv14, 4
  br i1 %exitcond19.3, label %for.inc56.loopexit, label %for.inc45

for.inc56.loopexit:                               ; preds = %for.inc45
  br label %for.inc56

for.inc56:                                        ; preds = %for.inc56.loopexit, %for.inc45.prol.loopexit, %for.cond28.preheader.for.inc56_crit_edge
  %arrayidx51.pre-phi = phi double* [ %arrayidx51.phi.trans.insert, %for.cond28.preheader.for.inc56_crit_edge ], [ %arrayidx43, %for.inc45.prol.loopexit ], [ %arrayidx43, %for.inc56.loopexit ]
  %24 = phi double [ %.pre24, %for.cond28.preheader.for.inc56_crit_edge ], [ %sub44.lcssa.unr, %for.inc45.prol.loopexit ], [ %sub44.3, %for.inc56.loopexit ]
  %call = tail call double @sqrt(double %24) #3
  store double %call, double* %arrayidx51.pre-phi, align 8
  %indvars.iv.next21 = add nuw i64 %indvars.iv20, 1
  %cmp = icmp slt i64 %indvars.iv.next21, 2000
  %indvars.iv.next17 = add nsw i32 %indvars.iv16, 1
  br i1 %cmp, label %for.inc56.for.body_crit_edge, label %for.end58

for.inc56.for.body_crit_edge:                     ; preds = %for.inc56
  %indvars.iv.next5 = add i2 %indvars.iv4, 1
  br label %for.body

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry.for.body_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.inc10, %entry.for.body_crit_edge
  %indvars.iv5 = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next6, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv5, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.body4.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body4.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv5, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next6 = add nuw i64 %indvars.iv5, 1
  %cmp = icmp slt i64 %indvars.iv.next6, 2000
  br i1 %cmp, label %for.body4.lr.ph, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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

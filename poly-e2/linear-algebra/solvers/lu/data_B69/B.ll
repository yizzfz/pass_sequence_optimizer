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
  tail call fastcc void @kernel_lu([2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array([2000 x double]* %arraydecay)
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
  %indvars.iv71 = phi i64 [ 0, %entry ], [ %indvars.iv.next72, %for.inc23 ]
  %indvars.iv69 = phi i64 [ 1, %entry ], [ %indvars.iv.next70, %for.inc23 ]
  %0 = mul nuw nsw i64 %indvars.iv71, 2001
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv54 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next55, %for.inc ]
  %1 = sub nsw i64 0, %indvars.iv54
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv54
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next55, %indvars.iv69
  br i1 %exitcond60, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %cmp927 = icmp slt i64 %indvars.iv.next72, 2000
  br i1 %cmp927, label %for.inc23.loopexit, label %for.inc23

for.inc23.loopexit:                               ; preds = %for.end
  %3 = sub nsw i64 1998, %indvars.iv71
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = add nuw nsw i64 %0, 1
  %scevgep67 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %7 = add nuw nsw i64 %5, 8
  %scevgep6768 = bitcast double* %scevgep67 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep6768, i8 0, i64 %7, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.end, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv71, i64 %indvars.iv71
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2000
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  br i1 %exitcond74, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvars.iv50 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next51.7, %for.cond30.for.inc41_crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv50, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %9 = mul nuw nsw i64 %indvars.iv.next51, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.1 = or i64 %indvars.iv50, 2
  %10 = mul nuw nsw i64 %indvars.iv.next51.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.2 = or i64 %indvars.iv50, 3
  %11 = mul nuw nsw i64 %indvars.iv.next51.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.3 = or i64 %indvars.iv50, 4
  %12 = mul nuw nsw i64 %indvars.iv.next51.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.4 = or i64 %indvars.iv50, 5
  %13 = mul nuw nsw i64 %indvars.iv.next51.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.5 = or i64 %indvars.iv50, 6
  %14 = mul nuw nsw i64 %indvars.iv.next51.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next51.6 = or i64 %indvars.iv50, 7
  %15 = mul nuw nsw i64 %indvars.iv.next51.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond76.7 = icmp eq i64 %indvars.iv.next51.6, 1999
  %indvars.iv.next51.7 = add nsw i64 %indvars.iv50, 8
  br i1 %exitcond76.7, label %for.body51.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us

for.body51.us.us.preheader.preheader:             ; preds = %for.cond30.for.inc41_crit_edge.us
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body51.us.us.preheader

for.body51.us.us.preheader:                       ; preds = %for.body51.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv42 = phi i64 [ %19, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.body51.us.us.preheader.preheader ]
  %scevgep89 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv42
  %scevgep8990 = bitcast double* %scevgep89 to i8*
  %19 = add nuw nsw i64 %indvars.iv42, 1
  %scevgep91 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %19
  %scevgep9192 = bitcast double* %scevgep91 to i8*
  br label %for.body51.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond86 = icmp eq i64 %19, 2000
  br i1 %exitcond86, label %for.body81.us.preheader, label %for.body51.us.us.preheader

for.body81.us.preheader:                          ; preds = %for.cond48.for.inc75_crit_edge.us
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  %21 = bitcast i8* %call to [2000 x [2000 x double]]*
  %22 = bitcast i8* %call to [2000 x [2000 x double]]*
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %24 = bitcast i8* %call to [2000 x [2000 x double]]*
  %25 = bitcast i8* %call to [2000 x [2000 x double]]*
  %26 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body81.us

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %for.body51.us.us.preheader ], [ %indvars.iv.next39, %for.cond52.for.inc72_crit_edge.us.us ]
  %27 = mul nuw nsw i64 %indvars.iv38, 16000
  %scevgep87 = getelementptr i8, i8* %call, i64 %27
  %28 = add nuw nsw i64 %27, 16000
  %scevgep88 = getelementptr i8, i8* %call, i64 %28
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv38, i64 %indvars.iv42
  %bound0 = icmp ult i8* %scevgep87, %scevgep9192
  %bound1 = icmp ult i8* %scevgep8990, %scevgep88
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound094 = icmp ult i8* %scevgep87, %bc
  %bound195 = icmp ult i8* %bc, %scevgep88
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx = or i1 %found.conflict, %found.conflict96
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %29 = or i64 %index, 1
  %30 = or i64 %index, 2
  %31 = or i64 %index, 3
  %32 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %33 = insertelement <2 x double> undef, double %32, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> undef, <2 x i32> zeroinitializer
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv42
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %29, i64 %indvars.iv42
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %30, i64 %indvars.iv42
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %31, i64 %indvars.iv42
  %39 = load double, double* %35, align 8, !alias.scope !4
  %40 = load double, double* %36, align 8, !alias.scope !4
  %41 = load double, double* %37, align 8, !alias.scope !4
  %42 = load double, double* %38, align 8, !alias.scope !4
  %43 = insertelement <2 x double> undef, double %39, i32 0
  %44 = insertelement <2 x double> %43, double %40, i32 1
  %45 = insertelement <2 x double> undef, double %41, i32 0
  %46 = insertelement <2 x double> %45, double %42, i32 1
  %47 = fmul <2 x double> %34, %44
  %48 = fmul <2 x double> %34, %46
  %49 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv38, i64 %index
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !6, !noalias !8
  %53 = fadd <2 x double> %47, %wide.load
  %54 = fadd <2 x double> %48, %wide.load98
  store <2 x double> %53, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %54, <2 x double>* %52, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %55 = icmp eq i64 %index.next, 2000
  br i1 %55, label %for.cond52.for.inc72_crit_edge.us.us.loopexit127, label %vector.body, !llvm.loop !9

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit127: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit127, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next39, 2000
  br i1 %exitcond85, label %for.cond48.for.inc75_crit_edge.us, label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next35.1, %for.inc69.us.us ]
  %56 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv42
  %57 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %56, %57
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv38, i64 %indvars.iv34
  %58 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %58
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next35 = or i64 %indvars.iv34, 1
  %59 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next35, i64 %indvars.iv42
  %60 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %59, %60
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv38, i64 %indvars.iv.next35
  %61 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %61
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next35, 1999
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !12

for.body81.us:                                    ; preds = %for.body81.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv30 = phi i64 [ %62, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.body81.us.preheader ]
  %scevgep104 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 0
  %scevgep104105 = bitcast double* %scevgep104 to i8*
  %62 = add nuw nsw i64 %indvars.iv30, 1
  %scevgep106 = getelementptr [2000 x double], [2000 x double]* %A, i64 %62, i64 0
  %scevgep106107 = bitcast double* %scevgep106 to i8*
  %63 = mul nuw nsw i64 %indvars.iv30, 16000
  %scevgep108 = getelementptr i8, i8* %call, i64 %63
  %64 = add nuw nsw i64 %63, 16000
  %scevgep109 = getelementptr i8, i8* %call, i64 %64
  %bound0110 = icmp ult i8* %scevgep104105, %scevgep109
  %bound1111 = icmp ult i8* %scevgep108, %scevgep106107
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  br i1 %memcheck.conflict113, label %for.inc94.us.preheader, label %vector.body99.preheader

vector.body99.preheader:                          ; preds = %for.body81.us
  br label %vector.body99

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body99:                                    ; preds = %vector.body99, %vector.body99.preheader
  %index116 = phi i64 [ 0, %vector.body99.preheader ], [ %index.next117.1, %vector.body99 ]
  %65 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv30, i64 %index116
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load124 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load125 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !13
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %index116
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load124, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load125, <2 x i64>* %72, align 8, !alias.scope !16, !noalias !13
  %index.next117 = or i64 %index116, 4
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv30, i64 %index.next117
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load124.1 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  %wide.load125.1 = load <2 x i64>, <2 x i64>* %76, align 8, !alias.scope !13
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %index.next117
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load124.1, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  store <2 x i64> %wide.load125.1, <2 x i64>* %80, align 8, !alias.scope !16, !noalias !13
  %index.next117.1 = add nsw i64 %index116, 8
  %81 = icmp eq i64 %index.next117.1, 2000
  br i1 %81, label %for.cond82.for.inc97_crit_edge.us.loopexit126, label %vector.body99, !llvm.loop !18

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv30, i64 %indvars.iv
  %82 = bitcast double* %arrayidx89.us to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv
  %84 = bitcast double* %arrayidx93.us to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %21, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next
  %85 = bitcast double* %arrayidx89.us.1 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next
  %87 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %22, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.1
  %88 = bitcast double* %arrayidx89.us.2 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next.1
  %90 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.2
  %91 = bitcast double* %arrayidx89.us.3 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next.2
  %93 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %92, i64* %93, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv30, i64 %indvars.iv.next.3
  %94 = bitcast double* %arrayidx89.us.4 to i64*
  %95 = load i64, i64* %94, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next.3
  %96 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %95, i64* %96, align 8
  %exitcond75.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond75.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !19

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit126:    ; preds = %vector.body99
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit126, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond84 = icmp eq i64 %62, 2000
  br i1 %exitcond84, label %for.end99, label %for.body81.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc54
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.inc54 ], [ 0, %entry ]
  %cmp22 = icmp sgt i64 %indvars.iv30, 0
  br i1 %cmp22, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.inc25 ], [ 0, %for.body3.preheader ]
  %cmp51 = icmp sgt i64 %indvars.iv12, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv12
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp51, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter = and i64 %indvars.iv12, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %0 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv12
  %1 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %0, %1
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %2 = icmp eq i64 %indvars.iv12, 1
  br i1 %2, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv
  %4 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv12
  %5 = load double, double* %arrayidx12, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv12
  %7 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %6, %7
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv12
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %8 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv12
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next13, %indvars.iv30
  br i1 %exitcond17, label %for.body30.lr.ph, label %for.body3

for.body30.lr.ph:                                 ; preds = %for.inc25
  br i1 true, label %for.body30.us.preheader, label %for.body30.lr.ph.for.inc54_crit_edge

for.body30.lr.ph.for.inc54_crit_edge:             ; preds = %for.body30.lr.ph
  br label %for.inc54

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter36 = and i64 %indvars.iv30, 1
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  %10 = icmp eq i64 %indvars.iv30, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv30, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv26
  %.pre8 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod37, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv26
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre8, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv19.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr38.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre8, %for.body30.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv19 = phi i64 [ %indvars.iv19.unr.ph, %for.body30.us.new ], [ %indvars.iv.next20.1, %for.inc48.us ]
  %13 = phi double [ %.unr38.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv19
  %14 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv26
  %15 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %14, %15
  %sub47.us = fsub double %13, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv30, i64 %indvars.iv.next20
  %16 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next20, i64 %indvars.iv26
  %17 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %16, %17
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next20.1, %indvars.iv30
  br i1 %exitcond23.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond34, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.body30.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.body
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond35, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv4, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond9, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond, label %for.end12, label %for.body.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
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

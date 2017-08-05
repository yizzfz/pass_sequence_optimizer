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
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %entry, %for.inc23.for.cond1.preheader_crit_edge
  %indvars.iv53 = phi i64 [ 0, %entry ], [ %indvars.iv.next54, %for.inc23.for.cond1.preheader_crit_edge ]
  %indvars.iv51 = phi i64 [ 1, %entry ], [ %indvars.iv.next52, %for.inc23.for.cond1.preheader_crit_edge ]
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %cmp916 = icmp slt i64 %indvars.iv.next54, 2000
  br i1 %cmp916, label %for.inc23.thread, label %for.inc23

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv37 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next38, %for.inc ]
  %0 = sub nsw i64 0, %indvars.iv37
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv37
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next38, %indvars.iv51
  br i1 %exitcond42, label %for.cond8.preheader, label %for.inc

for.inc23.thread:                                 ; preds = %for.cond8.preheader
  %2 = sub i64 1998, %indvars.iv53
  %3 = shl i64 %2, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep48 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv.next54
  %6 = mul nuw nsw i64 %indvars.iv53, 2000
  %scevgep49 = getelementptr double, double* %scevgep48, i64 %6
  %scevgep4950 = bitcast double* %scevgep49 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4950, i8 0, i64 %5, i32 8, i1 false)
  %arrayidx2256 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv53
  store double 1.000000e+00, double* %arrayidx2256, align 8
  br label %for.inc23.for.cond1.preheader_crit_edge

for.inc23:                                        ; preds = %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv53
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond55 = icmp eq i64 %indvars.iv.next54, 2000
  br i1 %exitcond55, label %for.cond48.preheader.preheader, label %for.inc23.for.cond1.preheader_crit_edge

for.inc23.for.cond1.preheader_crit_edge:          ; preds = %for.inc23, %for.inc23.thread
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  br label %for.inc.lr.ph

for.cond48.preheader.preheader:                   ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 32000000, i32 8, i1 false)
  %7 = bitcast i8* %call to [2000 x [2000 x double]]*
  %8 = bitcast i8* %call to [2000 x [2000 x double]]*
  %9 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond48.preheader

for.cond48.preheader:                             ; preds = %for.inc75, %for.cond48.preheader.preheader
  %indvars.iv28 = phi i64 [ 0, %for.cond48.preheader.preheader ], [ %10, %for.inc75 ]
  %scevgep59 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv28
  %scevgep5960 = bitcast double* %scevgep59 to i8*
  %10 = add nuw nsw i64 %indvars.iv28, 1
  %scevgep61 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %10
  %scevgep6162 = bitcast double* %scevgep61 to i8*
  br label %for.cond52.preheader

for.cond52.preheader:                             ; preds = %for.inc72, %for.cond48.preheader
  %indvars.iv25 = phi i64 [ 0, %for.cond48.preheader ], [ %indvars.iv.next26, %for.inc72 ]
  %11 = mul nuw nsw i64 %indvars.iv25, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %11
  %12 = add nuw nsw i64 %11, 16000
  %scevgep58 = getelementptr i8, i8* %call, i64 %12
  %arrayidx59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv28
  %bound0 = icmp ult i8* %scevgep, %scevgep6162
  %bound1 = icmp ult i8* %scevgep5960, %scevgep58
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59 to i8*
  %bound064 = icmp ult i8* %scevgep, %bc
  %bound165 = icmp ult i8* %bc, %scevgep58
  %found.conflict66 = and i1 %bound064, %bound165
  %conflict.rdx = or i1 %found.conflict, %found.conflict66
  br i1 %conflict.rdx, label %for.inc69.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader
  br label %vector.body

for.inc69.preheader:                              ; preds = %for.cond52.preheader
  br label %for.inc69

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %13 = or i64 %index, 1
  %14 = or i64 %index, 2
  %15 = or i64 %index, 3
  %16 = load double, double* %arrayidx59, align 8, !alias.scope !1
  %17 = insertelement <2 x double> undef, double %16, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv28
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %13, i64 %indvars.iv28
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %14, i64 %indvars.iv28
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %15, i64 %indvars.iv28
  %23 = load double, double* %19, align 8, !alias.scope !4
  %24 = load double, double* %20, align 8, !alias.scope !4
  %25 = load double, double* %21, align 8, !alias.scope !4
  %26 = load double, double* %22, align 8, !alias.scope !4
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %24, i32 1
  %29 = insertelement <2 x double> undef, double %25, i32 0
  %30 = insertelement <2 x double> %29, double %26, i32 1
  %31 = fmul <2 x double> %18, %28
  %32 = fmul <2 x double> %18, %30
  %33 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %9, i64 0, i64 %indvars.iv25, i64 %index
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !6, !noalias !8
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %37 = fadd <2 x double> %wide.load, %31
  %38 = fadd <2 x double> %wide.load68, %32
  store <2 x double> %37, <2 x double>* %34, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %38, <2 x double>* %36, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %39 = icmp eq i64 %index.next, 2000
  br i1 %39, label %for.inc72.loopexit97, label %vector.body, !llvm.loop !9

for.inc69:                                        ; preds = %for.inc69, %for.inc69.preheader
  %indvars.iv22 = phi i64 [ 0, %for.inc69.preheader ], [ %indvars.iv.next23.1, %for.inc69 ]
  %40 = load double, double* %arrayidx59, align 8
  %arrayidx63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv28
  %41 = load double, double* %arrayidx63, align 8
  %mul = fmul double %40, %41
  %arrayidx67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %7, i64 0, i64 %indvars.iv25, i64 %indvars.iv22
  %42 = load double, double* %arrayidx67, align 8
  %add68 = fadd double %42, %mul
  store double %add68, double* %arrayidx67, align 8
  %indvars.iv.next23 = or i64 %indvars.iv22, 1
  %43 = load double, double* %arrayidx59, align 8
  %arrayidx63.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next23, i64 %indvars.iv28
  %44 = load double, double* %arrayidx63.1, align 8
  %mul.1 = fmul double %43, %44
  %arrayidx67.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %8, i64 0, i64 %indvars.iv25, i64 %indvars.iv.next23
  %45 = load double, double* %arrayidx67.1, align 8
  %add68.1 = fadd double %45, %mul.1
  store double %add68.1, double* %arrayidx67.1, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond24.1 = icmp eq i64 %indvars.iv.next23.1, 2000
  br i1 %exitcond24.1, label %for.inc72.loopexit, label %for.inc69, !llvm.loop !12

for.inc72.loopexit:                               ; preds = %for.inc69
  br label %for.inc72

for.inc72.loopexit97:                             ; preds = %vector.body
  br label %for.inc72

for.inc72:                                        ; preds = %for.inc72.loopexit97, %for.inc72.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 2000
  br i1 %exitcond27, label %for.inc75, label %for.cond52.preheader

for.inc75:                                        ; preds = %for.inc72
  %exitcond30 = icmp eq i64 %10, 2000
  br i1 %exitcond30, label %for.cond82.preheader.preheader, label %for.cond48.preheader

for.cond82.preheader.preheader:                   ; preds = %for.inc75
  %46 = bitcast i8* %call to [2000 x [2000 x double]]*
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = bitcast i8* %call to [2000 x [2000 x double]]*
  %52 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader

for.cond82.preheader:                             ; preds = %for.cond82.preheader.preheader, %for.inc97
  %indvars.iv19 = phi i64 [ %53, %for.inc97 ], [ 0, %for.cond82.preheader.preheader ]
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 0
  %scevgep7475 = bitcast double* %scevgep74 to i8*
  %53 = add nuw nsw i64 %indvars.iv19, 1
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %A, i64 %53, i64 0
  %scevgep7677 = bitcast double* %scevgep76 to i8*
  %54 = mul nuw nsw i64 %indvars.iv19, 16000
  %scevgep78 = getelementptr i8, i8* %call, i64 %54
  %55 = add nuw nsw i64 %54, 16000
  %scevgep79 = getelementptr i8, i8* %call, i64 %55
  %bound080 = icmp ult i8* %scevgep7475, %scevgep79
  %bound181 = icmp ult i8* %scevgep78, %scevgep7677
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %for.inc94.preheader, label %vector.body69.preheader

vector.body69.preheader:                          ; preds = %for.cond82.preheader
  br label %vector.body69

for.inc94.preheader:                              ; preds = %for.cond82.preheader
  br label %for.inc94

vector.body69:                                    ; preds = %vector.body69, %vector.body69.preheader
  %index86 = phi i64 [ 0, %vector.body69.preheader ], [ %index.next87.1, %vector.body69 ]
  %56 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv19, i64 %index86
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load94 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !13
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load95 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !13
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %index86
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load94, <2 x i64>* %61, align 8, !alias.scope !16, !noalias !13
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load95, <2 x i64>* %63, align 8, !alias.scope !16, !noalias !13
  %index.next87 = or i64 %index86, 4
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv19, i64 %index.next87
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load94.1 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !13
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load95.1 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !13
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %index.next87
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load94.1, <2 x i64>* %69, align 8, !alias.scope !16, !noalias !13
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load95.1, <2 x i64>* %71, align 8, !alias.scope !16, !noalias !13
  %index.next87.1 = add nsw i64 %index86, 8
  %72 = icmp eq i64 %index.next87.1, 2000
  br i1 %72, label %for.inc97.loopexit96, label %vector.body69, !llvm.loop !18

for.inc94:                                        ; preds = %for.inc94, %for.inc94.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.preheader ], [ %indvars.iv.next.4, %for.inc94 ]
  %arrayidx89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv19, i64 %indvars.iv
  %73 = bitcast double* %arrayidx89 to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv
  %75 = bitcast double* %arrayidx93 to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next
  %76 = bitcast double* %arrayidx89.1 to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv.next
  %78 = bitcast double* %arrayidx93.1 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.1
  %79 = bitcast double* %arrayidx89.2 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv.next.1
  %81 = bitcast double* %arrayidx93.2 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.2
  %82 = bitcast double* %arrayidx89.3 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv.next.2
  %84 = bitcast double* %arrayidx93.3 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv19, i64 %indvars.iv.next.3
  %85 = bitcast double* %arrayidx89.4 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv.next.3
  %87 = bitcast double* %arrayidx93.4 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.inc97.loopexit, label %for.inc94, !llvm.loop !19

for.inc97.loopexit:                               ; preds = %for.inc94
  br label %for.inc97

for.inc97.loopexit96:                             ; preds = %vector.body69
  br label %for.inc97

for.inc97:                                        ; preds = %for.inc97.loopexit96, %for.inc97.loopexit
  %exitcond21 = icmp eq i64 %53, 2000
  br i1 %exitcond21, label %for.end99, label %for.cond82.preheader

for.end99:                                        ; preds = %for.inc97
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %indvars.iv33 = phi i64 [ 0, %entry ], [ %indvars.iv.next34, %for.inc54 ]
  %cmp26 = icmp sgt i64 %indvars.iv33, 0
  br i1 %cmp26, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.inc25
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.inc54_crit_edge

for.cond31.preheader.lr.ph.for.inc54_crit_edge:   ; preds = %for.cond31.preheader.lr.ph
  br label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter36 = and i64 %indvars.iv33, 1
  %lcmp.mod37 = icmp eq i64 %xtraiter36, 0
  %0 = icmp eq i64 %indvars.iv33, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv33, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv30
  %.pre12 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod37, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %1 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv30
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre12, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv23.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr38.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre12, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %0, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv23 = phi i64 [ %indvars.iv23.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next24.1, %for.inc48.us ]
  %3 = phi double [ %.unr38.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv23
  %4 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv30
  %5 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %4, %5
  %sub47.us = fsub double %3, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next24
  %6 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next24, i64 %indvars.iv30
  %7 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %6, %7
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %exitcond27.1 = icmp eq i64 %indvars.iv.next24.1, %indvars.iv33
  br i1 %exitcond27.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 2000
  br i1 %exitcond32, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv16, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv16
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv16
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %10 = icmp eq i64 %indvars.iv16, 1
  br i1 %10, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %11 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv16
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv16
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv16
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv16, i64 %indvars.iv16
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, %indvars.iv33
  br i1 %exitcond21, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.cond31.preheader.lr.ph.for.inc54_crit_edge, %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond35, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 2000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 2000
  br i1 %exitcond7, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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

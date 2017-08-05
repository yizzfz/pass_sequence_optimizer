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
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18, %entry
  %indvars.iv89 = phi i64 [ 0, %entry ], [ %indvars.iv.next90, %for.end18 ]
  %indvars.iv87 = phi i64 [ 1, %entry ], [ %indvars.iv.next88, %for.end18 ]
  %0 = sub i64 1998, %indvars.iv89
  %1 = shl i64 %0, 3
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %cmp942 = icmp slt i64 %indvars.iv.next90, 2000
  br i1 %cmp942, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3, %for.body3.lr.ph
  %indvars.iv71 = phi i64 [ 0, %for.body3.lr.ph ], [ %indvars.iv.next72, %for.body3 ]
  %2 = sub nsw i64 0, %indvars.iv71
  %3 = trunc i64 %2 to i32
  %rem = srem i32 %3, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv71
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next72, %indvars.iv87
  br i1 %exitcond77, label %for.cond8.preheader, label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %4 = and i64 %1, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep84 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv.next90
  %6 = mul nuw nsw i64 %indvars.iv89, 2000
  %scevgep85 = getelementptr double, double* %scevgep84, i64 %6
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep8586, i8 0, i64 %5, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.cond8.preheader, %for.end18.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  br i1 %exitcond92, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.end40_crit_edge.us

for.cond30.for.end40_crit_edge.us:                ; preds = %for.cond30.for.end40_crit_edge.us, %for.end25
  %indvars.iv67 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next68.7, %for.cond30.for.end40_crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %7
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68 = or i64 %indvars.iv67, 1
  %8 = mul nuw nsw i64 %indvars.iv.next68, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %8
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.1 = or i64 %indvars.iv67, 2
  %9 = mul nuw nsw i64 %indvars.iv.next68.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.2 = or i64 %indvars.iv67, 3
  %10 = mul nuw nsw i64 %indvars.iv.next68.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.3 = or i64 %indvars.iv67, 4
  %11 = mul nuw nsw i64 %indvars.iv.next68.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.4 = or i64 %indvars.iv67, 5
  %12 = mul nuw nsw i64 %indvars.iv.next68.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.5 = or i64 %indvars.iv67, 6
  %13 = mul nuw nsw i64 %indvars.iv.next68.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next68.6 = or i64 %indvars.iv67, 7
  %14 = mul nuw nsw i64 %indvars.iv.next68.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond94.7 = icmp eq i64 %indvars.iv.next68.6, 1999
  %indvars.iv.next68.7 = add nsw i64 %indvars.iv67, 8
  br i1 %exitcond94.7, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.end40_crit_edge.us

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.end40_crit_edge.us
  %15 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.end74_crit_edge.us
  %indvars.iv59 = phi i64 [ %16, %for.cond48.for.end74_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  %scevgep108 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv59
  %scevgep108109 = bitcast double* %scevgep108 to i8*
  %16 = add i64 %indvars.iv59, 1
  %scevgep110 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %16
  %scevgep110111 = bitcast double* %scevgep110 to i8*
  br label %for.cond52.preheader.us.us

for.cond48.for.end74_crit_edge.us:                ; preds = %for.cond52.for.end71_crit_edge.us.us
  %exitcond105 = icmp eq i64 %16, 2000
  br i1 %exitcond105, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.end74_crit_edge.us
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.end71_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next56, %for.cond52.for.end71_crit_edge.us.us ]
  %17 = mul i64 %indvars.iv55, 16000
  %scevgep106 = getelementptr i8, i8* %call, i64 %17
  %18 = add i64 %17, 16000
  %scevgep107 = getelementptr i8, i8* %call, i64 %18
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv59
  %bound0 = icmp ult i8* %scevgep106, %scevgep110111
  %bound1 = icmp ult i8* %scevgep108109, %scevgep107
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0113 = icmp ult i8* %scevgep106, %bc
  %bound1114 = icmp ult i8* %bc, %scevgep107
  %found.conflict115 = and i1 %bound0113, %bound1114
  %conflict.rdx = or i1 %found.conflict, %found.conflict115
  br i1 %conflict.rdx, label %for.body55.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond52.preheader.us.us
  br label %vector.body

for.body55.us.us.preheader:                       ; preds = %for.cond52.preheader.us.us
  br label %for.body55.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %19 = or i64 %index, 1
  %20 = or i64 %index, 2
  %21 = or i64 %index, 3
  %22 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv59
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %19, i64 %indvars.iv59
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %20, i64 %indvars.iv59
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %21, i64 %indvars.iv59
  %29 = load double, double* %25, align 8, !alias.scope !4
  %30 = load double, double* %26, align 8, !alias.scope !4
  %31 = load double, double* %27, align 8, !alias.scope !4
  %32 = load double, double* %28, align 8, !alias.scope !4
  %33 = insertelement <2 x double> undef, double %29, i32 0
  %34 = insertelement <2 x double> %33, double %30, i32 1
  %35 = insertelement <2 x double> undef, double %31, i32 0
  %36 = insertelement <2 x double> %35, double %32, i32 1
  %37 = fmul <2 x double> %24, %34
  %38 = fmul <2 x double> %24, %36
  %39 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv55, i64 %index
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !6, !noalias !8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !6, !noalias !8
  %43 = fadd <2 x double> %wide.load, %37
  %44 = fadd <2 x double> %wide.load117, %38
  store <2 x double> %43, <2 x double>* %40, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %44, <2 x double>* %42, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 4
  %45 = icmp eq i64 %index.next, 2000
  br i1 %45, label %for.cond52.for.end71_crit_edge.us.us.loopexit146, label %vector.body, !llvm.loop !9

for.cond52.for.end71_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us.loopexit146: ; preds = %vector.body
  br label %for.cond52.for.end71_crit_edge.us.us

for.cond52.for.end71_crit_edge.us.us:             ; preds = %for.cond52.for.end71_crit_edge.us.us.loopexit146, %for.cond52.for.end71_crit_edge.us.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond104 = icmp eq i64 %indvars.iv.next56, 2000
  br i1 %exitcond104, label %for.cond48.for.end74_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us, %for.body55.us.us.preheader
  %indvars.iv51 = phi i64 [ 0, %for.body55.us.us.preheader ], [ %indvars.iv.next52.1, %for.body55.us.us ]
  %46 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv59
  %47 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %46, %47
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv55, i64 %indvars.iv51
  %48 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %48, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next52, i64 %indvars.iv59
  %50 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %49, %50
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next52
  %51 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %51, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next52, 1999
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  br i1 %exitcond.1, label %for.cond52.for.end71_crit_edge.us.us.loopexit, label %for.body55.us.us, !llvm.loop !12

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.end96_crit_edge.us
  %indvars.iv47 = phi i64 [ %52, %for.cond82.for.end96_crit_edge.us ], [ 0, %for.cond82.preheader.us.preheader ]
  %scevgep123 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  %52 = add i64 %indvars.iv47, 1
  %scevgep125 = getelementptr [2000 x double], [2000 x double]* %A, i64 %52, i64 0
  %scevgep125126 = bitcast double* %scevgep125 to i8*
  %53 = mul i64 %indvars.iv47, 16000
  %scevgep127 = getelementptr i8, i8* %call, i64 %53
  %54 = add i64 %53, 16000
  %scevgep128 = getelementptr i8, i8* %call, i64 %54
  %bound0129 = icmp ult i8* %scevgep123124, %scevgep128
  %bound1130 = icmp ult i8* %scevgep127, %scevgep125126
  %memcheck.conflict132 = and i1 %bound0129, %bound1130
  br i1 %memcheck.conflict132, label %for.body85.us.preheader, label %vector.body118.preheader

vector.body118.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body118

for.body85.us.preheader:                          ; preds = %for.cond82.preheader.us
  br label %for.body85.us

vector.body118:                                   ; preds = %vector.body118, %vector.body118.preheader
  %index135 = phi i64 [ 0, %vector.body118.preheader ], [ %index.next136.1, %vector.body118 ]
  %55 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %index135
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load143 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !13
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load144 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !13
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %index135
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load143, <2 x i64>* %60, align 8, !alias.scope !16, !noalias !13
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load144, <2 x i64>* %62, align 8, !alias.scope !16, !noalias !13
  %index.next136 = or i64 %index135, 4
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %index.next136
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load143.1 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load144.1 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !13
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %index.next136
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load143.1, <2 x i64>* %68, align 8, !alias.scope !16, !noalias !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load144.1, <2 x i64>* %70, align 8, !alias.scope !16, !noalias !13
  %index.next136.1 = add nsw i64 %index135, 8
  %71 = icmp eq i64 %index.next136.1, 2000
  br i1 %71, label %for.cond82.for.end96_crit_edge.us.loopexit145, label %vector.body118, !llvm.loop !18

for.body85.us:                                    ; preds = %for.body85.us, %for.body85.us.preheader
  %indvars.iv = phi i64 [ 0, %for.body85.us.preheader ], [ %indvars.iv.next.4, %for.body85.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %indvars.iv
  %72 = bitcast double* %arrayidx89.us to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv
  %74 = bitcast double* %arrayidx93.us to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next
  %75 = bitcast double* %arrayidx89.us.1 to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next
  %77 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %78 = bitcast double* %arrayidx89.us.2 to i64*
  %79 = load i64, i64* %78, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.1
  %80 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %79, i64* %80, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %81 = bitcast double* %arrayidx89.us.3 to i64*
  %82 = load i64, i64* %81, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.2
  %83 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %82, i64* %83, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %15, i64 0, i64 %indvars.iv47, i64 %indvars.iv.next.3
  %84 = bitcast double* %arrayidx89.us.4 to i64*
  %85 = load i64, i64* %84, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv.next.3
  %86 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %85, i64* %86, align 8
  %exitcond93.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond93.4, label %for.cond82.for.end96_crit_edge.us.loopexit, label %for.body85.us, !llvm.loop !19

for.cond82.for.end96_crit_edge.us.loopexit:       ; preds = %for.body85.us
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us.loopexit145:    ; preds = %vector.body118
  br label %for.cond82.for.end96_crit_edge.us

for.cond82.for.end96_crit_edge.us:                ; preds = %for.cond82.for.end96_crit_edge.us.loopexit145, %for.cond82.for.end96_crit_edge.us.loopexit
  %exitcond103 = icmp eq i64 %52, 2000
  br i1 %exitcond103, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.end96_crit_edge.us
  tail call void @free(i8* %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.end53
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end53 ], [ 0, %entry ]
  %cmp26 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp26, label %for.cond4.preheader.preheader, label %for.end53

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  br i1 true, label %for.cond31.preheader.us.preheader, label %for.cond31.preheader.lr.ph.for.end53_crit_edge

for.cond31.preheader.lr.ph.for.end53_crit_edge:   ; preds = %for.cond31.preheader.lr.ph
  br label %for.end53

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter43 = and i64 %indvars.iv37, 1
  %lcmp.mod44 = icmp eq i64 %xtraiter43, 0
  %0 = icmp eq i64 %indvars.iv37, 1
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.end50_crit_edge.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond31.for.end50_crit_edge.us ], [ %indvars.iv37, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv33
  %.pre15 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod44, label %for.body33.us.prol.loopexit.unr-lcssa, label %for.body33.us.prol.preheader

for.body33.us.prol.preheader:                     ; preds = %for.cond31.preheader.us
  %1 = load double, double* %arrayidx8.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv33
  %2 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %1, %2
  %sub47.us.prol = fsub double %.pre15, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit.unr-lcssa

for.body33.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond31.preheader.us, %for.body33.us.prol.preheader
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.body33.us.prol.preheader ], [ 0, %for.cond31.preheader.us ]
  %.unr45.ph = phi double [ %sub47.us.prol, %for.body33.us.prol.preheader ], [ %.pre15, %for.cond31.preheader.us ]
  br i1 %0, label %for.cond31.for.end50_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.body33.us.prol.loopexit.unr-lcssa
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us, %for.cond31.preheader.us.new
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next27.1, %for.body33.us ]
  %3 = phi double [ %.unr45.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.body33.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv26
  %4 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv26, i64 %indvars.iv33
  %5 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %4, %5
  %sub47.us = fsub double %3, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next27
  %6 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next27, i64 %indvars.iv33
  %7 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %6, %7
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %indvars.iv37
  br i1 %exitcond30.1, label %for.cond31.for.end50_crit_edge.us.unr-lcssa, label %for.body33.us

for.cond31.for.end50_crit_edge.us.unr-lcssa:      ; preds = %for.body33.us
  br label %for.cond31.for.end50_crit_edge.us

for.cond31.for.end50_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit.unr-lcssa, %for.cond31.for.end50_crit_edge.us.unr-lcssa
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond41, label %for.end53.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv19, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv19
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.body6.preheader, label %for.end

for.body6.preheader:                              ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv19, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit.unr-lcssa, label %for.body6.prol.preheader

for.body6.prol.preheader:                         ; preds = %for.body6.preheader
  %8 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv19
  %9 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %8, %9
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit.unr-lcssa

for.body6.prol.loopexit.unr-lcssa:                ; preds = %for.body6.preheader, %for.body6.prol.preheader
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ undef, %for.body6.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol.preheader ], [ 0, %for.body6.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.body6.prol.preheader ], [ %.pre, %for.body6.preheader ]
  %10 = icmp eq i64 %indvars.iv19, 1
  br i1 %10, label %for.end.loopexit, label %for.body6.preheader.new

for.body6.preheader.new:                          ; preds = %for.body6.prol.loopexit.unr-lcssa
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body6.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body6.preheader.new ], [ %indvars.iv.next.1, %for.body6 ]
  %11 = phi double [ %.unr.ph, %for.body6.preheader.new ], [ %sub.1, %for.body6 ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv
  %12 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv19
  %13 = load double, double* %arrayidx12, align 8
  %mul = fmul double %12, %13
  %sub = fsub double %11, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv.next
  %14 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv19
  %15 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %14, %15
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv19
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body6

for.end.loopexit.unr-lcssa:                       ; preds = %for.body6
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body6.prol.loopexit.unr-lcssa, %for.end.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.body6.prol.loopexit.unr-lcssa ], [ %sub.1, %for.end.loopexit.unr-lcssa ]
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.cond4.preheader
  %16 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv19, i64 %indvars.iv19
  %17 = load double, double* %arrayidx20, align 8
  %div = fdiv double %16, %17
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, %indvars.iv37
  br i1 %exitcond24, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.end53.loopexit:                               ; preds = %for.cond31.for.end50_crit_edge.us
  br label %for.end53

for.end53:                                        ; preds = %for.cond31.preheader.lr.ph.for.end53_crit_edge, %for.end53.loopexit, %for.cond1.preheader
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next38, 2000
  br i1 %exitcond42, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.end53
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
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv7, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond12, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
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

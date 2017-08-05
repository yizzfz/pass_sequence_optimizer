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
  %1 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
entry:
  %A.addr = alloca [2000 x double]*, align 8
  %B = alloca [2000 x [2000 x double]]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv116 = phi i64 [ 0, %entry ], [ %indvars.iv.next117, %for.inc23 ]
  %indvars.iv114 = phi i64 [ 1, %entry ], [ %indvars.iv.next115, %for.inc23 ]
  %0 = mul nuw nsw i64 %indvars.iv116, 2001
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv99 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next100, %for.inc ]
  %1 = sub nsw i64 0, %indvars.iv99
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv99
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond105 = icmp eq i64 %indvars.iv.next100, %indvars.iv114
  br i1 %exitcond105, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %cmp919 = icmp slt i64 %indvars.iv.next117, 2000
  br i1 %cmp919, label %for.inc23.loopexit, label %for.inc23

for.inc23.loopexit:                               ; preds = %for.end
  %3 = sub nsw i64 1998, %indvars.iv116
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  %6 = add nuw nsw i64 %0, 1
  %scevgep112 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %7 = add nuw nsw i64 %5, 8
  %scevgep112113 = bitcast double* %scevgep112 to i8*
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep112113, i8 0, i64 %7, i32 8, i1 false)
  br label %for.inc23

for.inc23:                                        ; preds = %for.end, %for.inc23.loopexit
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv116, i64 %indvars.iv116
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond119 = icmp eq i64 %indvars.iv.next117, 2000
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  br i1 %exitcond119, label %for.end25, label %for.inc.lr.ph

for.end25:                                        ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %8 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %8, align 8
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.end25
  %indvars.iv95 = phi i64 [ 0, %for.end25 ], [ %indvars.iv.next96.7, %for.cond30.for.inc41_crit_edge.us ]
  %9 = mul nuw nsw i64 %indvars.iv95, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %9
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96 = or i64 %indvars.iv95, 1
  %10 = mul nuw nsw i64 %indvars.iv.next96, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %10
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.1 = or i64 %indvars.iv95, 2
  %11 = mul nuw nsw i64 %indvars.iv.next96.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %11
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.2 = or i64 %indvars.iv95, 3
  %12 = mul nuw nsw i64 %indvars.iv.next96.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %12
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.3 = or i64 %indvars.iv95, 4
  %13 = mul nuw nsw i64 %indvars.iv.next96.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %13
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.4 = or i64 %indvars.iv95, 5
  %14 = mul nuw nsw i64 %indvars.iv.next96.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %14
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.5 = or i64 %indvars.iv95, 6
  %15 = mul nuw nsw i64 %indvars.iv.next96.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %15
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next96.6 = or i64 %indvars.iv95, 7
  %16 = mul nuw nsw i64 %indvars.iv.next96.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond121.7 = icmp eq i64 %indvars.iv.next96.6, 1999
  %indvars.iv.next96.7 = add nsw i64 %indvars.iv95, 8
  br i1 %exitcond121.7, label %for.body47.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.body47.us.preheader:                          ; preds = %for.cond30.for.inc41_crit_edge.us
  %17 = bitcast i8* %call to [2000 x [2000 x double]]*
  %18 = bitcast i8* %call to [2000 x [2000 x double]]*
  %19 = bitcast i8* %call to [2000 x [2000 x double]]*
  %20 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.body51.us.us.preheader

for.body51.us.us.preheader:                       ; preds = %for.cond48.for.inc75_crit_edge.us, %for.body47.us.preheader
  %indvars.iv87 = phi i64 [ 0, %for.body47.us.preheader ], [ %21, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep132 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv87
  %21 = add nuw nsw i64 %indvars.iv87, 1
  %scevgep134 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %21
  br label %for.body51.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond126 = icmp eq i64 %21, 2000
  br i1 %exitcond126, label %for.body81.us.preheader, label %for.body51.us.us.preheader

for.body51.us.us:                                 ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.body51.us.us.preheader
  %indvars.iv83 = phi i64 [ 0, %for.body51.us.us.preheader ], [ %22, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep128 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv83, i64 0
  %22 = add nuw nsw i64 %indvars.iv83, 1
  %scevgep130 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %22, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv83, i64 %indvars.iv87
  %bound0 = icmp ult double* %scevgep128, %scevgep134
  %bound1 = icmp ult double* %scevgep132, %scevgep130
  %found.conflict = and i1 %bound0, %bound1
  %bound0137 = icmp ult double* %scevgep128, %arrayidx59.us.us
  %bound1138 = icmp ult double* %arrayidx59.us.us, %scevgep130
  %found.conflict139 = and i1 %bound0137, %bound1138
  %conflict.rdx = or i1 %found.conflict, %found.conflict139
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.body51.us.us
  br label %vector.body

for.inc69.us.us.preheader:                        ; preds = %for.body51.us.us
  br label %for.inc69.us.us

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %23 = or i64 %index, 1
  %24 = or i64 %index, 2
  %25 = or i64 %index, 3
  %26 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !1
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index, i64 %indvars.iv87
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %23, i64 %indvars.iv87
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %24, i64 %indvars.iv87
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %25, i64 %indvars.iv87
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
  %43 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %20, i64 0, i64 %indvars.iv83, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %47 = fadd <2 x double> %wide.load, %41
  %48 = fadd <2 x double> %wide.load141, %42
  store <2 x double> %47, <2 x double>* %44, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %48, <2 x double>* %46, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %49 = icmp eq i64 %index.next, 2000
  br i1 %49, label %for.cond52.for.inc72_crit_edge.us.us.loopexit174, label %vector.body, !llvm.loop !9

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit174: ; preds = %vector.body
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit174, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %exitcond125 = icmp eq i64 %22, 2000
  br i1 %exitcond125, label %for.cond48.for.inc75_crit_edge.us, label %for.body51.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv79 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next80.1, %for.inc69.us.us ]
  %50 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv87
  %51 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %50, %51
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %18, i64 0, i64 %indvars.iv83, i64 %indvars.iv79
  %52 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %52, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next80 = or i64 %indvars.iv79, 1
  %53 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next80, i64 %indvars.iv87
  %54 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %53, %54
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %19, i64 0, i64 %indvars.iv83, i64 %indvars.iv.next80
  %55 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %55, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next80, 1999
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !12

for.body81.us.preheader:                          ; preds = %for.cond48.for.inc75_crit_edge.us
  %56 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  %57 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.body81.us

for.body81.us:                                    ; preds = %for.cond82.for.inc97_crit_edge.us, %for.body81.us.preheader
  %indvars.iv75 = phi i64 [ 0, %for.body81.us.preheader ], [ %58, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep147 = getelementptr [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 0
  %58 = add nuw nsw i64 %indvars.iv75, 1
  %scevgep149 = getelementptr [2000 x double], [2000 x double]* %57, i64 %58, i64 0
  %scevgep151 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 0
  %scevgep153 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %58, i64 0
  %bound0155 = icmp ult double* %scevgep147, %scevgep153
  %bound1156 = icmp ult double* %scevgep151, %scevgep149
  %memcheck.conflict158 = and i1 %bound0155, %bound1156
  br i1 %memcheck.conflict158, label %for.inc94.us.preheader, label %vector.body142.preheader

vector.body142.preheader:                         ; preds = %for.body81.us
  br label %vector.body142

for.inc94.us.preheader:                           ; preds = %for.body81.us
  br label %for.inc94.us

vector.body142:                                   ; preds = %vector.body142, %vector.body142.preheader
  %index161 = phi i64 [ 0, %vector.body142.preheader ], [ %index.next162.1, %vector.body142 ]
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %index161
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load169 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !13
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load170 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !13
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %index161
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load169, <2 x i64>* %64, align 8, !alias.scope !16, !noalias !13
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load170, <2 x i64>* %66, align 8, !alias.scope !16, !noalias !13
  %index.next162 = or i64 %index161, 4
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %index.next162
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load169.1 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !13
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load170.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !13
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %index.next162
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load169.1, <2 x i64>* %72, align 8, !alias.scope !16, !noalias !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load170.1, <2 x i64>* %74, align 8, !alias.scope !16, !noalias !13
  %index.next162.1 = add nsw i64 %index161, 8
  %75 = icmp eq i64 %index.next162.1, 2000
  br i1 %75, label %for.cond82.for.inc97_crit_edge.us.loopexit173, label %vector.body142, !llvm.loop !18

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %indvars.iv
  %76 = bitcast double* %arrayidx89.us to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %indvars.iv
  %78 = bitcast double* %arrayidx93.us to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next
  %79 = bitcast double* %arrayidx89.us.1 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %indvars.iv.next
  %81 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %82 = bitcast double* %arrayidx89.us.2 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %indvars.iv.next.1
  %84 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %85 = bitcast double* %arrayidx89.us.3 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %indvars.iv.next.2
  %87 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %88 = bitcast double* %arrayidx89.us.4 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %57, i64 %indvars.iv75, i64 %indvars.iv.next.3
  %90 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %89, i64* %90, align 8
  %exitcond120.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond120.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !19

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit173:    ; preds = %vector.body142
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit173, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond124 = icmp eq i64 %58, 2000
  br i1 %exitcond124, label %for.end99.loopexit, label %for.body81.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %91 = bitcast [2000 x [2000 x double]]* %56 to i8*
  tail call void @free(i8* %91) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %entry, %for.inc54
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %for.inc54 ], [ 0, %entry ]
  %cmp26 = icmp sgt i64 %indvars.iv46, 0
  br i1 %cmp26, label %for.body3.preheader, label %for.inc54

for.body3.preheader:                              ; preds = %for.body
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.inc25
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc25 ], [ 0, %for.body3.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv28, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv28
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.body3
  %xtraiter = and i64 %indvars.iv28, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %0 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv28
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
  %2 = icmp eq i64 %indvars.iv28, 1
  br i1 %2, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %3 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %4 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv28
  %5 = load double, double* %arrayidx12, align 8
  %mul = fmul double %4, %5
  %sub = fsub double %3, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %6 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv28
  %7 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %6, %7
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv28
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.body3
  %8 = phi double [ %.pre, %for.body3 ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv28
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next29, %indvars.iv46
  br i1 %exitcond33, label %for.body30.us.preheader, label %for.body3

for.body30.us.preheader:                          ; preds = %for.inc25
  %xtraiter52 = and i64 %indvars.iv46, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter52, 0
  %10 = icmp eq i64 %indvars.iv46, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.body30.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv46, %for.body30.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv42
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod53, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.body30.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv42
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.body30.us, %for.inc48.us.prol
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %.unr54.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.body30.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.cond31.for.inc51_crit_edge.us, label %for.body30.us.new

for.body30.us.new:                                ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.body30.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.body30.us.new ], [ %indvars.iv.next36.1, %for.inc48.us ]
  %13 = phi double [ %.unr54.ph, %for.body30.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv35
  %14 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv42
  %15 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %14, %15
  %sub47.us = fsub double %13, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next36
  %16 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv42
  %17 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %16, %17
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next36.1, %indvars.iv46
  br i1 %exitcond39.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond50, label %for.inc54.loopexit, label %for.body30.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.body
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond51, label %for.end56, label %for.body

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
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

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
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
entry:
  %B = alloca [2000 x [2000 x double]]*, align 8
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %entry
  %indvars.iv124 = phi i64 [ 0, %entry ], [ %indvars.iv.next125, %for.inc23 ]
  %indvars.iv122 = phi i64 [ 1, %entry ], [ %indvars.iv.next123, %for.inc23 ]
  %0 = sub i64 1999, %indvars.iv124
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = add nuw nsw i64 %2, 1
  br label %for.inc

for.cond8.preheader:                              ; preds = %for.inc
  %4 = sub nuw nsw i64 1999, %indvars.iv124
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %cmp945 = icmp slt i64 %indvars.iv.next125, 2000
  br i1 %cmp945, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.cond8.preheader
  %min.iters.check = icmp ult i64 %4, 4
  br i1 %min.iters.check, label %for.inc16.preheader, label %min.iters.checked

for.inc16.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc16.lr.ph
  %indvars.iv118.ph = phi i64 [ %indvars.iv122, %min.iters.checked ], [ %indvars.iv122, %for.inc16.lr.ph ], [ %ind.end, %middle.block ]
  br label %for.inc16

min.iters.checked:                                ; preds = %for.inc16.lr.ph
  %n.vec = and i64 %4, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv122, %n.vec
  br i1 %cmp.zero, label %for.inc16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %5 = add i64 %indvars.iv122, %index.prol
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %5
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %7, align 8
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %10 = icmp ult i64 %1, 12
  br i1 %10, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %11 = add i64 %indvars.iv122, %index
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %13, align 8
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %index.next = add i64 %index, 4
  %16 = add i64 %indvars.iv122, %index.next
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %16
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %index.next.1 = add i64 %index, 8
  %21 = add i64 %indvars.iv122, %index.next.1
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %21
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %index.next.2 = add i64 %index, 12
  %26 = add i64 %indvars.iv122, %index.next.2
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %26
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %index.next.3 = add i64 %index, 16
  %31 = icmp eq i64 %index.next.3, %n.vec
  br i1 %31, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %4, %n.vec
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv109 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next110, %for.inc ]
  %32 = sub nsw i64 0, %indvars.iv109
  %33 = trunc i64 %32 to i32
  %rem = srem i32 %33, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv109
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next110, %indvars.iv122
  br i1 %exitcond115, label %for.cond8.preheader, label %for.inc

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for.inc16 ], [ %indvars.iv118.ph, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv118
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond131 = icmp eq i64 %indvars.iv118, 1999
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br i1 %exitcond131, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 2000
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  br i1 %exitcond127, label %for.cond30.preheader.us.preheader, label %for.inc.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %34 = bitcast [2000 x [2000 x double]]** %B to i8**
  store i8* %call, i8** %34, align 8
  %35 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv105 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next106.7, %for.cond30.for.inc41_crit_edge.us ]
  %36 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106 = or i64 %indvars.iv105, 1
  %37 = mul nuw nsw i64 %indvars.iv.next106, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.1 = or i64 %indvars.iv105, 2
  %38 = mul nuw nsw i64 %indvars.iv.next106.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.2 = or i64 %indvars.iv105, 3
  %39 = mul nuw nsw i64 %indvars.iv.next106.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.3 = or i64 %indvars.iv105, 4
  %40 = mul nuw nsw i64 %indvars.iv.next106.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.4 = or i64 %indvars.iv105, 5
  %41 = mul nuw nsw i64 %indvars.iv.next106.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.5 = or i64 %indvars.iv105, 6
  %42 = mul nuw nsw i64 %indvars.iv.next106.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next106.6 = or i64 %indvars.iv105, 7
  %43 = mul nuw nsw i64 %indvars.iv.next106.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %exitcond130.7 = icmp eq i64 %indvars.iv.next106.6, 1999
  %indvars.iv.next106.7 = add nsw i64 %indvars.iv105, 8
  br i1 %exitcond130.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv97 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %44, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep148 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv97
  %44 = add nuw nsw i64 %indvars.iv97, 1
  %scevgep150 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %44
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond137 = icmp eq i64 %44, 2000
  br i1 %exitcond137, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv93 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %45, %for.cond52.for.inc72_crit_edge.us.us ]
  %scevgep144 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv93, i64 0
  %45 = add nuw nsw i64 %indvars.iv93, 1
  %scevgep146 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %45, i64 0
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv93, i64 %indvars.iv97
  %bound0 = icmp ult double* %scevgep144, %scevgep150
  %bound1 = icmp ult double* %scevgep148, %scevgep146
  %found.conflict = and i1 %bound0, %bound1
  %bound0153 = icmp ult double* %scevgep144, %arrayidx59.us.us
  %bound1154 = icmp ult double* %arrayidx59.us.us, %scevgep146
  %found.conflict155 = and i1 %bound0153, %bound1154
  %conflict.rdx = or i1 %found.conflict, %found.conflict155
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body139.preheader

vector.body139.preheader:                         ; preds = %for.cond52.preheader.us.us
  br label %vector.body139

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body139:                                   ; preds = %vector.body139.preheader, %vector.body139
  %index157 = phi i64 [ %index.next158, %vector.body139 ], [ 0, %vector.body139.preheader ]
  %46 = or i64 %index157, 1
  %47 = or i64 %index157, 2
  %48 = or i64 %index157, 3
  %49 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !8
  %50 = insertelement <2 x double> undef, double %49, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index157, i64 %indvars.iv97
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %46, i64 %indvars.iv97
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %47, i64 %indvars.iv97
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %48, i64 %indvars.iv97
  %56 = load double, double* %52, align 8, !alias.scope !11
  %57 = load double, double* %53, align 8, !alias.scope !11
  %58 = load double, double* %54, align 8, !alias.scope !11
  %59 = load double, double* %55, align 8, !alias.scope !11
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = fmul <2 x double> %51, %61
  %65 = fmul <2 x double> %51, %63
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv93, i64 %index157
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !13, !noalias !15
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !13, !noalias !15
  %70 = fadd <2 x double> %wide.load, %64
  %71 = fadd <2 x double> %wide.load165, %65
  store <2 x double> %70, <2 x double>* %67, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %71, <2 x double>* %69, align 8, !alias.scope !13, !noalias !15
  %index.next158 = add nuw nsw i64 %index157, 4
  %72 = icmp eq i64 %index.next158, 2000
  br i1 %72, label %for.cond52.for.inc72_crit_edge.us.us.loopexit196, label %vector.body139, !llvm.loop !16

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit196: ; preds = %vector.body139
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit196, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %exitcond136 = icmp eq i64 %45, 2000
  br i1 %exitcond136, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next90.1, %for.inc69.us.us ]
  %73 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv97
  %74 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %73, %74
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv93, i64 %indvars.iv89
  %75 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %75, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next90 = or i64 %indvars.iv89, 1
  %76 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next90, i64 %indvars.iv97
  %77 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %76, %77
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv93, i64 %indvars.iv.next90
  %78 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %78, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next90, 1999
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89, 2
  br i1 %exitcond.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !17

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  %79 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %B, align 8
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %80, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep171 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 0
  %80 = add nuw nsw i64 %indvars.iv85, 1
  %scevgep173 = getelementptr [2000 x double], [2000 x double]* %A, i64 %80, i64 0
  %scevgep175 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 0
  %scevgep177 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %80, i64 0
  %bound0179 = icmp ult double* %scevgep171, %scevgep177
  %bound1180 = icmp ult double* %scevgep175, %scevgep173
  %memcheck.conflict182 = and i1 %bound0179, %bound1180
  br i1 %memcheck.conflict182, label %for.inc94.us.preheader, label %vector.body166.preheader

vector.body166.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body166

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body166:                                   ; preds = %vector.body166, %vector.body166.preheader
  %index185 = phi i64 [ 0, %vector.body166.preheader ], [ %index.next186.1, %vector.body166 ]
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %index185
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load193 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !18
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load194 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !18
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %index185
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load193, <2 x i64>* %86, align 8, !alias.scope !21, !noalias !18
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load194, <2 x i64>* %88, align 8, !alias.scope !21, !noalias !18
  %index.next186 = or i64 %index185, 4
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %index.next186
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load193.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !18
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load194.1 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !18
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %index.next186
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load193.1, <2 x i64>* %94, align 8, !alias.scope !21, !noalias !18
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load194.1, <2 x i64>* %96, align 8, !alias.scope !21, !noalias !18
  %index.next186.1 = add nsw i64 %index185, 8
  %97 = icmp eq i64 %index.next186.1, 2000
  br i1 %97, label %for.cond82.for.inc97_crit_edge.us.loopexit195, label %vector.body166, !llvm.loop !23

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %indvars.iv
  %98 = bitcast double* %arrayidx89.us to i64*
  %99 = load i64, i64* %98, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv
  %100 = bitcast double* %arrayidx93.us to i64*
  store i64 %99, i64* %100, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next
  %101 = bitcast double* %arrayidx89.us.1 to i64*
  %102 = load i64, i64* %101, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next
  %103 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %102, i64* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %104 = bitcast double* %arrayidx89.us.2 to i64*
  %105 = load i64, i64* %104, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.1
  %106 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %105, i64* %106, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %107 = bitcast double* %arrayidx89.us.3 to i64*
  %108 = load i64, i64* %107, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.2
  %109 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %108, i64* %109, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %79, i64 0, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %110 = bitcast double* %arrayidx89.us.4 to i64*
  %111 = load i64, i64* %110, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv.next.3
  %112 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %111, i64* %112, align 8
  %exitcond129.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  br i1 %exitcond129.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !24

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit195:    ; preds = %vector.body166
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit195, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond135 = icmp eq i64 %80, 2000
  br i1 %exitcond135, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  %113 = bitcast [2000 x [2000 x double]]* %79 to i8*
  tail call void @free(i8* %113) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %entry
  %indvars.iv52 = phi i64 [ 0, %entry ], [ %indvars.iv.next53, %for.inc54 ]
  %cmp211 = icmp sgt i64 %indvars.iv52, 0
  br i1 %cmp211, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv52, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv48
  %.pre30 = load double, double* %arrayidx46.us.phi.trans.insert, align 8
  br i1 %lcmp.mod2, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %0 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv48
  %1 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %0, %1
  %sub47.us.prol = fsub double %.pre30, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us.phi.trans.insert, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv41.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr3.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre30, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %17, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv41 = phi i64 [ %indvars.iv41.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next42.1, %for.inc48.us ]
  %2 = phi double [ %.unr3.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv41
  %3 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv41, i64 %indvars.iv48
  %4 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %3, %4
  %sub47.us = fsub double %2, %mul42.us
  store double %sub47.us, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next42
  %5 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next42, i64 %indvars.iv48
  %6 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %5, %6
  %sub47.us.1 = fsub double %sub47.us, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us.phi.trans.insert, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond45.1 = icmp eq i64 %indvars.iv.next42.1, %indvars.iv52
  br i1 %exitcond45.1, label %for.cond31.for.inc51_crit_edge.us.unr-lcssa, label %for.inc48.us

for.cond31.for.inc51_crit_edge.us.unr-lcssa:      ; preds = %for.inc48.us
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit, %for.cond31.for.inc51_crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next49, 2000
  br i1 %exitcond56, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp57 = icmp sgt i64 %indvars.iv34, 0
  %arrayidx16.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv34
  %.pre = load double, double* %arrayidx16.phi.trans.insert, align 8
  br i1 %cmp57, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
  %xtraiter = and i64 %indvars.iv34, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  br label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.prol.preheader
  %7 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv34
  %8 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %7, %8
  %sub.prol = fsub double %.pre, %mul.prol
  store double %sub.prol, double* %arrayidx16.phi.trans.insert, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader, %for.inc.prol
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %.pre, %for.inc.preheader ]
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol.loopexit.unr-lcssa
  %9 = icmp eq i64 %indvars.iv34, 1
  br i1 %9, label %for.inc25.loopexit, label %for.inc.preheader.new

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %10 = phi double [ %.unr.ph, %for.inc.preheader.new ], [ %sub.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv
  %11 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv34
  %12 = load double, double* %arrayidx12, align 8
  %mul = fmul double %11, %12
  %sub = fsub double %10, %mul
  store double %sub, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv.next
  %13 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv34
  %14 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %13, %14
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv34
  br i1 %exitcond.1, label %for.inc25.loopexit.unr-lcssa, label %for.inc

for.inc25.loopexit.unr-lcssa:                     ; preds = %for.inc
  br label %for.inc25.loopexit

for.inc25.loopexit:                               ; preds = %for.inc.prol.loopexit, %for.inc25.loopexit.unr-lcssa
  %sub.lcssa = phi double [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.inc25.loopexit.unr-lcssa ]
  br label %for.inc25

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %15 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  %16 = load double, double* %arrayidx20, align 8
  %div = fdiv double %15, %16
  store double %div, double* %arrayidx16.phi.trans.insert, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next35, %indvars.iv52
  br i1 %exitcond39, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.inc25
  %xtraiter1 = and i64 %indvars.iv52, 1
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  %17 = icmp eq i64 %indvars.iv52, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv52, i64 0
  br label %for.cond31.preheader.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next53, 2000
  br i1 %exitcond57, label %for.end56, label %for.cond1.preheader

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

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 2000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond15, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!12, !9}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !4, !5}

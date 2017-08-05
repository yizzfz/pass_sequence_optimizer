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
for.cond1.preheader.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv120 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next121, %for.inc23 ]
  %indvars.iv118 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next119, %for.inc23 ]
  %0 = sub i64 1999, %indvars.iv120
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = add nuw nsw i64 %2, 1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv105 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next106, %for.inc ]
  %4 = sub nsw i64 0, %indvars.iv105
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv105
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next106, %indvars.iv118
  br i1 %exitcond111, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %6 = sub nuw nsw i64 1999, %indvars.iv120
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %cmp967 = icmp slt i64 %indvars.iv.next121, 2000
  br i1 %cmp967, label %for.inc16.preheader, label %for.inc23

for.inc16.preheader:                              ; preds = %for.end
  %min.iters.check = icmp ult i64 %6, 4
  br i1 %min.iters.check, label %for.inc16.preheader56, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc16.preheader
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv118, %n.vec
  br i1 %cmp.zero, label %for.inc16.preheader56, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter = and i64 %3, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter, %vector.body.prol.preheader ]
  %7 = add i64 %indvars.iv118, %index.prol
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %1, 12
  br i1 %12, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %13 = add i64 %indvars.iv118, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %index.next = add i64 %index, 4
  %18 = add i64 %indvars.iv118, %index.next
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %index.next.1 = add i64 %index, 8
  %23 = add i64 %indvars.iv118, %index.next.1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.2 = add i64 %index, 12
  %28 = add i64 %indvars.iv118, %index.next.2
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %30, align 8
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %32, align 8
  %index.next.3 = add i64 %index, 16
  %33 = icmp eq i64 %index.next.3, %n.vec
  br i1 %33, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %6, %n.vec
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader56

for.inc16.preheader56:                            ; preds = %middle.block, %min.iters.checked, %for.inc16.preheader
  %indvars.iv114.ph = phi i64 [ %indvars.iv118, %min.iters.checked ], [ %indvars.iv118, %for.inc16.preheader ], [ %ind.end, %middle.block ]
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16.preheader56, %for.inc16
  %indvars.iv114 = phi i64 [ %indvars.iv.next115, %for.inc16 ], [ %indvars.iv114.ph, %for.inc16.preheader56 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv114
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, 2000
  br i1 %exitcond117, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv120
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond123 = icmp eq i64 %indvars.iv.next121, 2000
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  br i1 %exitcond123, label %for.cond30.preheader.us.preheader, label %for.inc.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.inc23
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv101 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next102.7, %for.cond30.for.inc41_crit_edge.us ]
  %34 = mul nuw nsw i64 %indvars.iv101, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %35 = mul nuw nsw i64 %indvars.iv.next102, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.1 = or i64 %indvars.iv101, 2
  %36 = mul nuw nsw i64 %indvars.iv.next102.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.2 = or i64 %indvars.iv101, 3
  %37 = mul nuw nsw i64 %indvars.iv.next102.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.3 = or i64 %indvars.iv101, 4
  %38 = mul nuw nsw i64 %indvars.iv.next102.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.4 = or i64 %indvars.iv101, 5
  %39 = mul nuw nsw i64 %indvars.iv.next102.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.5 = or i64 %indvars.iv101, 6
  %40 = mul nuw nsw i64 %indvars.iv.next102.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.6 = or i64 %indvars.iv101, 7
  %41 = mul nuw nsw i64 %indvars.iv.next102.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next102.7 = add nsw i64 %indvars.iv101, 8
  %exitcond104.7 = icmp eq i64 %indvars.iv.next102.7, 2000
  br i1 %exitcond104.7, label %for.cond52.preheader.us.us.preheader.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond52.preheader.us.us.preheader.preheader:   ; preds = %for.cond30.for.inc41_crit_edge.us
  %42 = bitcast i8* %call to [2000 x [2000 x double]]*
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  %44 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond52.preheader.us.us.preheader.preheader, %for.cond48.for.inc75_crit_edge.us
  %indvars.iv93 = phi i64 [ %45, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond52.preheader.us.us.preheader.preheader ]
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv93
  %scevgep910 = bitcast double* %scevgep9 to i8*
  %45 = add nuw nsw i64 %indvars.iv93, 1
  %scevgep11 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %45
  %scevgep1112 = bitcast double* %scevgep11 to i8*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond96 = icmp eq i64 %45, 2000
  br i1 %exitcond96, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  %46 = bitcast i8* %call to [2000 x [2000 x double]]*
  %47 = bitcast i8* %call to [2000 x [2000 x double]]*
  %48 = bitcast i8* %call to [2000 x [2000 x double]]*
  %49 = bitcast i8* %call to [2000 x [2000 x double]]*
  %50 = bitcast i8* %call to [2000 x [2000 x double]]*
  %51 = bitcast i8* %call to [2000 x [2000 x double]]*
  %52 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond82.preheader.us

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv89 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next90, %for.cond52.for.inc72_crit_edge.us.us ]
  %53 = mul nuw nsw i64 %indvars.iv89, 16000
  %scevgep7 = getelementptr i8, i8* %call, i64 %53
  %54 = add nuw nsw i64 %53, 16000
  %scevgep8 = getelementptr i8, i8* %call, i64 %54
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv93
  %bound0 = icmp ult i8* %scevgep7, %scevgep1112
  %bound1 = icmp ult i8* %scevgep910, %scevgep8
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound014 = icmp ult i8* %scevgep7, %bc
  %bound115 = icmp ult i8* %bc, %scevgep8
  %found.conflict16 = and i1 %bound014, %bound115
  %conflict.rdx = or i1 %found.conflict, %found.conflict16
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body2.preheader

vector.body2.preheader:                           ; preds = %for.cond52.preheader.us.us
  br label %vector.body2

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body2:                                     ; preds = %vector.body2.preheader, %vector.body2
  %index18 = phi i64 [ %index.next19, %vector.body2 ], [ 0, %vector.body2.preheader ]
  %55 = or i64 %index18, 1
  %56 = or i64 %index18, 2
  %57 = or i64 %index18, 3
  %58 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !8
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index18, i64 %indvars.iv93
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %55, i64 %indvars.iv93
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %56, i64 %indvars.iv93
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %57, i64 %indvars.iv93
  %65 = load double, double* %61, align 8, !alias.scope !11
  %66 = load double, double* %62, align 8, !alias.scope !11
  %67 = load double, double* %63, align 8, !alias.scope !11
  %68 = load double, double* %64, align 8, !alias.scope !11
  %69 = insertelement <2 x double> undef, double %65, i32 0
  %70 = insertelement <2 x double> %69, double %66, i32 1
  %71 = insertelement <2 x double> undef, double %67, i32 0
  %72 = insertelement <2 x double> %71, double %68, i32 1
  %73 = fmul <2 x double> %60, %70
  %74 = fmul <2 x double> %60, %72
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %44, i64 0, i64 %indvars.iv89, i64 %index18
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !13, !noalias !15
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !13, !noalias !15
  %79 = fadd <2 x double> %73, %wide.load
  %80 = fadd <2 x double> %74, %wide.load26
  store <2 x double> %79, <2 x double>* %76, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %80, <2 x double>* %78, align 8, !alias.scope !13, !noalias !15
  %index.next19 = add nuw nsw i64 %index18, 4
  %81 = icmp eq i64 %index.next19, 2000
  br i1 %81, label %for.cond52.for.inc72_crit_edge.us.us.loopexit55, label %vector.body2, !llvm.loop !16

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit55:  ; preds = %vector.body2
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit55, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 2000
  br i1 %exitcond92, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv85 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next86.1, %for.inc69.us.us ]
  %82 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv85, i64 %indvars.iv93
  %83 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %82, %83
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %42, i64 0, i64 %indvars.iv89, i64 %indvars.iv85
  %84 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %84
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next86 = or i64 %indvars.iv85, 1
  %85 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next86, i64 %indvars.iv93
  %86 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %85, %86
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv89, i64 %indvars.iv.next86
  %87 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %87
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next86.1 = add nsw i64 %indvars.iv85, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next86.1, 2000
  br i1 %exitcond88.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !17

for.cond82.preheader.us:                          ; preds = %for.cond82.preheader.us.preheader, %for.cond82.for.inc97_crit_edge.us
  %indvars.iv81 = phi i64 [ %88, %for.cond82.for.inc97_crit_edge.us ], [ 0, %for.cond82.preheader.us.preheader ]
  %scevgep32 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 0
  %scevgep3233 = bitcast double* %scevgep32 to i8*
  %88 = add nuw nsw i64 %indvars.iv81, 1
  %scevgep34 = getelementptr [2000 x double], [2000 x double]* %A, i64 %88, i64 0
  %scevgep3435 = bitcast double* %scevgep34 to i8*
  %89 = mul nuw nsw i64 %indvars.iv81, 16000
  %scevgep36 = getelementptr i8, i8* %call, i64 %89
  %90 = add nuw nsw i64 %89, 16000
  %scevgep37 = getelementptr i8, i8* %call, i64 %90
  %bound038 = icmp ult i8* %scevgep3233, %scevgep37
  %bound139 = icmp ult i8* %scevgep36, %scevgep3435
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %for.inc94.us.preheader, label %vector.body27.preheader

vector.body27.preheader:                          ; preds = %for.cond82.preheader.us
  br label %vector.body27

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body27:                                    ; preds = %vector.body27, %vector.body27.preheader
  %index44 = phi i64 [ 0, %vector.body27.preheader ], [ %index.next45.1, %vector.body27 ]
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %51, i64 0, i64 %indvars.iv81, i64 %index44
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load52 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !18
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load53 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !18
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %index44
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load52, <2 x i64>* %96, align 8, !alias.scope !21, !noalias !18
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load53, <2 x i64>* %98, align 8, !alias.scope !21, !noalias !18
  %index.next45 = or i64 %index44, 4
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %52, i64 0, i64 %indvars.iv81, i64 %index.next45
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load52.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !18
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load53.1 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !18
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %index.next45
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load52.1, <2 x i64>* %104, align 8, !alias.scope !21, !noalias !18
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load53.1, <2 x i64>* %106, align 8, !alias.scope !21, !noalias !18
  %index.next45.1 = add nsw i64 %index44, 8
  %107 = icmp eq i64 %index.next45.1, 2000
  br i1 %107, label %for.cond82.for.inc97_crit_edge.us.loopexit54, label %vector.body27, !llvm.loop !23

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %46, i64 0, i64 %indvars.iv81, i64 %indvars.iv
  %108 = bitcast double* %arrayidx89.us to i64*
  %109 = load i64, i64* %108, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv
  %110 = bitcast double* %arrayidx93.us to i64*
  store i64 %109, i64* %110, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %47, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next
  %111 = bitcast double* %arrayidx89.us.1 to i64*
  %112 = load i64, i64* %111, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv.next
  %113 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %112, i64* %113, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %48, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %114 = bitcast double* %arrayidx89.us.2 to i64*
  %115 = load i64, i64* %114, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %116 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %115, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %49, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %117 = bitcast double* %arrayidx89.us.3 to i64*
  %118 = load i64, i64* %117, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv.next.2
  %119 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %118, i64* %119, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %50, i64 0, i64 %indvars.iv81, i64 %indvars.iv.next.3
  %120 = bitcast double* %arrayidx89.us.4 to i64*
  %121 = load i64, i64* %120, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv81, i64 %indvars.iv.next.3
  %122 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %121, i64* %122, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !24

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit54:     ; preds = %vector.body27
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit54, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond84 = icmp eq i64 %88, 2000
  br i1 %exitcond84, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  tail call void @free(i8* nonnull %call) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture %A) unnamed_addr #2 {
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.lr.ph
  %indvars.iv46 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next47, %for.inc54 ]
  %cmp27 = icmp sgt i64 %indvars.iv46, 0
  br i1 %cmp27, label %for.cond4.preheader.preheader, label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc25
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.inc25 ], [ 0, %for.cond4.preheader.preheader ]
  %cmp55 = icmp sgt i64 %indvars.iv28, 0
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv28
  %.pre = load double, double* %arrayidx16, align 8
  br i1 %cmp55, label %for.inc.preheader, label %for.inc25

for.inc.preheader:                                ; preds = %for.cond4.preheader
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

for.inc25:                                        ; preds = %for.inc25.loopexit, %for.cond4.preheader
  %8 = phi double [ %.pre, %for.cond4.preheader ], [ %sub.lcssa, %for.inc25.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv28
  %9 = load double, double* %arrayidx20, align 8
  %div = fdiv double %8, %9
  store double %div, double* %arrayidx16, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next29, %indvars.iv46
  br i1 %exitcond33, label %for.cond31.preheader.us.preheader, label %for.cond4.preheader

for.cond31.preheader.us.preheader:                ; preds = %for.inc25
  %xtraiter1 = and i64 %indvars.iv46, 1
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  %10 = icmp eq i64 %indvars.iv46, 1
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.preheader.us.preheader, %for.cond31.for.inc51_crit_edge.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv46, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv42
  %.pre24 = load double, double* %arrayidx46.us, align 8
  br i1 %lcmp.mod2, label %for.inc48.us.prol.loopexit.unr-lcssa, label %for.inc48.us.prol.preheader

for.inc48.us.prol.preheader:                      ; preds = %for.cond31.preheader.us
  br label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.inc48.us.prol.preheader
  %11 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv42
  %12 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %11, %12
  %sub47.us.prol = fsub double %.pre24, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.inc48.us.prol.loopexit.unr-lcssa

for.inc48.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond31.preheader.us, %for.inc48.us.prol
  %indvars.iv35.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.cond31.preheader.us ]
  %.unr3.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %.pre24, %for.cond31.preheader.us ]
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol.loopexit.unr-lcssa
  br i1 %10, label %for.cond31.for.inc51_crit_edge.us, label %for.cond31.preheader.us.new

for.cond31.preheader.us.new:                      ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us, %for.cond31.preheader.us.new
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.cond31.preheader.us.new ], [ %indvars.iv.next36.1, %for.inc48.us ]
  %13 = phi double [ %.unr3.ph, %for.cond31.preheader.us.new ], [ %sub47.us.1, %for.inc48.us ]
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
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond45, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond49, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8, 2000
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
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

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

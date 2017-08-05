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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %arraydecay)
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
  call fastcc void @print_array([2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* %A) unnamed_addr #0 {
for.cond1.preheader.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.cond1.preheader.lr.ph
  %indvars.iv121 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next122, %for.inc23 ]
  %indvars.iv119 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next120, %for.inc23 ]
  %0 = sub i64 1999, %indvars.iv121
  %1 = add i64 %0, -4
  %2 = lshr i64 %1, 2
  %3 = add nuw nsw i64 %2, 1
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv106 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next107, %for.inc ]
  %4 = sub nsw i64 0, %indvars.iv106
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv106
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next107, %indvars.iv119
  br i1 %exitcond112, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %6 = sub nuw nsw i64 1999, %indvars.iv121
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %cmp968 = icmp slt i64 %indvars.iv.next122, 2000
  br i1 %cmp968, label %for.inc16.lr.ph, label %for.inc23

for.inc16.lr.ph:                                  ; preds = %for.end
  %min.iters.check = icmp ult i64 %6, 4
  br i1 %min.iters.check, label %for.inc16.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc16.lr.ph
  %n.vec = and i64 %6, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %indvars.iv119, %n.vec
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
  %7 = add i64 %indvars.iv119, %index.prol
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %7
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
  %13 = add i64 %indvars.iv119, %index
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %13
  %15 = bitcast double* %14 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %15, align 8
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %17, align 8
  %index.next = add i64 %index, 4
  %18 = add i64 %indvars.iv119, %index.next
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %20, align 8
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %22, align 8
  %index.next.1 = add i64 %index, 8
  %23 = add i64 %indvars.iv119, %index.next.1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %25, align 8
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %27, align 8
  %index.next.2 = add i64 %index, 12
  %28 = add i64 %indvars.iv119, %index.next.2
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %28
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
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader

for.inc16.preheader:                              ; preds = %middle.block, %min.iters.checked, %for.inc16.lr.ph
  %indvars.iv115.ph = phi i64 [ %indvars.iv119, %min.iters.checked ], [ %indvars.iv119, %for.inc16.lr.ph ], [ %ind.end, %middle.block ]
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16.preheader, %for.inc16
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %for.inc16 ], [ %indvars.iv115.ph, %for.inc16.preheader ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv115
  store double 0.000000e+00, double* %arrayidx15, align 8
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next116, 2000
  br i1 %exitcond130, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block, %for.end
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv121, i64 %indvars.iv121
  store double 1.000000e+00, double* %arrayidx22, align 8
  %exitcond131 = icmp eq i64 %indvars.iv.next122, 2000
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  br i1 %exitcond131, label %for.cond30.preheader.us.preheader, label %for.inc.lr.ph

for.cond30.preheader.us.preheader:                ; preds = %for.inc23
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %34 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond30.for.inc41_crit_edge.us

for.cond30.for.inc41_crit_edge.us:                ; preds = %for.cond30.for.inc41_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv102 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next103.7, %for.cond30.for.inc41_crit_edge.us ]
  %35 = mul nuw nsw i64 %indvars.iv102, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %35
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %36 = mul nuw nsw i64 %indvars.iv.next103, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.1 = or i64 %indvars.iv102, 2
  %37 = mul nuw nsw i64 %indvars.iv.next103.1, 16000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %37
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.2 = or i64 %indvars.iv102, 3
  %38 = mul nuw nsw i64 %indvars.iv.next103.2, 16000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.3 = or i64 %indvars.iv102, 4
  %39 = mul nuw nsw i64 %indvars.iv.next103.3, 16000
  %scevgep.4 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.4 = or i64 %indvars.iv102, 5
  %40 = mul nuw nsw i64 %indvars.iv.next103.4, 16000
  %scevgep.5 = getelementptr i8, i8* %call, i64 %40
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.5 = or i64 %indvars.iv102, 6
  %41 = mul nuw nsw i64 %indvars.iv.next103.5, 16000
  %scevgep.6 = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.6 = or i64 %indvars.iv102, 7
  %42 = mul nuw nsw i64 %indvars.iv.next103.6, 16000
  %scevgep.7 = getelementptr i8, i8* %call, i64 %42
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next103.7 = add nsw i64 %indvars.iv102, 8
  %exitcond129.7 = icmp eq i64 %indvars.iv.next103.7, 2000
  br i1 %exitcond129.7, label %for.cond48.preheader.us.preheader, label %for.cond30.for.inc41_crit_edge.us

for.cond48.preheader.us.preheader:                ; preds = %for.cond30.for.inc41_crit_edge.us
  %43 = bitcast i8* %call to [2000 x [2000 x double]]*
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.us.preheader
  %indvars.iv94 = phi i64 [ 0, %for.cond48.preheader.us.preheader ], [ %44, %for.cond48.for.inc75_crit_edge.us ]
  %scevgep142 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv94
  %scevgep142143 = bitcast double* %scevgep142 to i8*
  %44 = add nuw nsw i64 %indvars.iv94, 1
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %44
  %scevgep144145 = bitcast double* %scevgep144 to i8*
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %exitcond128 = icmp eq i64 %44, 2000
  br i1 %exitcond128, label %for.cond82.preheader.us.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv90 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next91, %for.cond52.for.inc72_crit_edge.us.us ]
  %45 = mul nuw nsw i64 %indvars.iv90, 16000
  %scevgep140 = getelementptr i8, i8* %call, i64 %45
  %46 = add nuw nsw i64 %45, 16000
  %scevgep141 = getelementptr i8, i8* %call, i64 %46
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv90, i64 %indvars.iv94
  %bound0 = icmp ult i8* %scevgep140, %scevgep144145
  %bound1 = icmp ult i8* %scevgep142143, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %arrayidx59.us.us to i8*
  %bound0147 = icmp ult i8* %scevgep140, %bc
  %bound1148 = icmp ult i8* %bc, %scevgep141
  %found.conflict149 = and i1 %bound0147, %bound1148
  %conflict.rdx = or i1 %found.conflict, %found.conflict149
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body135.preheader

vector.body135.preheader:                         ; preds = %for.cond52.preheader.us.us
  br label %vector.body135

for.inc69.us.us.preheader:                        ; preds = %for.cond52.preheader.us.us
  br label %for.inc69.us.us

vector.body135:                                   ; preds = %vector.body135.preheader, %vector.body135
  %index151 = phi i64 [ %index.next152, %vector.body135 ], [ 0, %vector.body135.preheader ]
  %47 = or i64 %index151, 1
  %48 = or i64 %index151, 2
  %49 = or i64 %index151, 3
  %50 = load double, double* %arrayidx59.us.us, align 8, !alias.scope !8
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index151, i64 %indvars.iv94
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %47, i64 %indvars.iv94
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %48, i64 %indvars.iv94
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %49, i64 %indvars.iv94
  %57 = load double, double* %53, align 8, !alias.scope !11
  %58 = load double, double* %54, align 8, !alias.scope !11
  %59 = load double, double* %55, align 8, !alias.scope !11
  %60 = load double, double* %56, align 8, !alias.scope !11
  %61 = insertelement <2 x double> undef, double %57, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = insertelement <2 x double> undef, double %59, i32 0
  %64 = insertelement <2 x double> %63, double %60, i32 1
  %65 = fmul <2 x double> %52, %62
  %66 = fmul <2 x double> %52, %64
  %67 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv90, i64 %index151
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !13, !noalias !15
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load159 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  %71 = fadd <2 x double> %65, %wide.load
  %72 = fadd <2 x double> %66, %wide.load159
  store <2 x double> %71, <2 x double>* %68, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %72, <2 x double>* %70, align 8, !alias.scope !13, !noalias !15
  %index.next152 = add nuw nsw i64 %index151, 4
  %73 = icmp eq i64 %index.next152, 2000
  br i1 %73, label %for.cond52.for.inc72_crit_edge.us.us.loopexit2, label %vector.body135, !llvm.loop !16

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.inc69.us.us
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit2:   ; preds = %vector.body135
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.cond52.for.inc72_crit_edge.us.us.loopexit2, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next91, 2000
  br i1 %exitcond127, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv86 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next87.1, %for.inc69.us.us ]
  %74 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv86, i64 %indvars.iv94
  %75 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %74, %75
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv90, i64 %indvars.iv86
  %76 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %mul.us.us, %76
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next87 = or i64 %indvars.iv86, 1
  %77 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next87, i64 %indvars.iv94
  %78 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %77, %78
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %43, i64 0, i64 %indvars.iv90, i64 %indvars.iv.next87
  %79 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %mul.us.us.1, %79
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next87.1 = add nsw i64 %indvars.iv86, 2
  %exitcond126.1 = icmp eq i64 %indvars.iv.next87.1, 2000
  br i1 %exitcond126.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !17

for.cond82.preheader.us.preheader:                ; preds = %for.cond48.for.inc75_crit_edge.us
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv82 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %80, %for.cond82.for.inc97_crit_edge.us ]
  %scevgep165 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 0
  %80 = add nuw nsw i64 %indvars.iv82, 1
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %A, i64 %80, i64 0
  %scevgep169 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 0
  %scevgep171 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %80, i64 0
  %bound0173 = icmp ult double* %scevgep165, %scevgep171
  %bound1174 = icmp ult double* %scevgep169, %scevgep167
  %memcheck.conflict176 = and i1 %bound0173, %bound1174
  br i1 %memcheck.conflict176, label %for.inc94.us.preheader, label %vector.body160.preheader

vector.body160.preheader:                         ; preds = %for.cond82.preheader.us
  br label %vector.body160

for.inc94.us.preheader:                           ; preds = %for.cond82.preheader.us
  br label %for.inc94.us

vector.body160:                                   ; preds = %vector.body160, %vector.body160.preheader
  %index179 = phi i64 [ 0, %vector.body160.preheader ], [ %index.next180.1, %vector.body160 ]
  %81 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %index179
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !18
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %84, align 8, !alias.scope !18
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %index179
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %86, align 8, !alias.scope !21, !noalias !18
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %88, align 8, !alias.scope !21, !noalias !18
  %index.next180 = or i64 %index179, 4
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %index.next180
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load187.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !18
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load188.1 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !18
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %index.next180
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load187.1, <2 x i64>* %94, align 8, !alias.scope !21, !noalias !18
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load188.1, <2 x i64>* %96, align 8, !alias.scope !21, !noalias !18
  %index.next180.1 = add nsw i64 %index179, 8
  %97 = icmp eq i64 %index.next180.1, 2000
  br i1 %97, label %for.cond82.for.inc97_crit_edge.us.loopexit1, label %vector.body160, !llvm.loop !23

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %indvars.iv
  %98 = bitcast double* %arrayidx89.us to i64*
  %99 = load i64, i64* %98, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv
  %100 = bitcast double* %arrayidx93.us to i64*
  store i64 %99, i64* %100, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next
  %101 = bitcast double* %arrayidx89.us.1 to i64*
  %102 = load i64, i64* %101, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next
  %103 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %102, i64* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %104 = bitcast double* %arrayidx89.us.2 to i64*
  %105 = load i64, i64* %104, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next.1
  %106 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %105, i64* %106, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %107 = bitcast double* %arrayidx89.us.3 to i64*
  %108 = load i64, i64* %107, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next.2
  %109 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %108, i64* %109, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv82, i64 %indvars.iv.next.3
  %110 = bitcast double* %arrayidx89.us.4 to i64*
  %111 = load i64, i64* %110, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv82, i64 %indvars.iv.next.3
  %112 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %111, i64* %112, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond125.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond125.4, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.inc94.us, !llvm.loop !24

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.inc94.us
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us.loopexit1:      ; preds = %vector.body160
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit1, %for.cond82.for.inc97_crit_edge.us.loopexit
  %exitcond = icmp eq i64 %80, 2000
  br i1 %exitcond, label %for.end99, label %for.cond82.preheader.us

for.end99:                                        ; preds = %for.cond82.for.inc97_crit_edge.us
  call void @free(i8* %call) #4
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
  %exitcond50 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond50, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  br label %for.inc54

for.inc54:                                        ; preds = %for.inc54.loopexit, %for.cond1.preheader
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, 2000
  br i1 %exitcond51, label %for.end56, label %for.cond1.preheader

for.end56:                                        ; preds = %for.inc54
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 2000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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

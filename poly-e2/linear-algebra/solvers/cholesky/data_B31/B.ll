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
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %.cast = bitcast i8* %call to [2000 x double]*
  call fastcc void @init_array(i32 2000, [2000 x double]* %.cast)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %.cast)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [2000 x double]*
  call fastcc void @print_array(i32 2000, [2000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  br label %for.inc.lr.ph

for.inc.lr.ph:                                    ; preds = %for.inc23, %for.body.lr.ph
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %for.inc23 ], [ 0, %for.body.lr.ph ]
  %indvars.iv118 = phi i64 [ %indvars.iv.next119, %for.inc23 ], [ 1, %for.body.lr.ph ]
  %sext = shl i64 %indvars.iv118, 32
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph
  %indvars.iv111 = phi i64 [ 0, %for.inc.lr.ph ], [ %indvars.iv.next112, %for.inc ]
  %0 = sub nsw i64 0, %indvars.iv111
  %1 = trunc i64 %0 to i32
  %rem = srem i32 %1, 2000
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 2.000000e+03
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv111
  store double %add, double* %arrayidx6, align 8
  %exitcond117 = icmp eq i64 %indvars.iv111, %indvars.iv124
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  br i1 %exitcond117, label %for.end, label %for.inc

for.end:                                          ; preds = %for.inc
  %2 = ashr exact i64 %sext, 32
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %cmp959 = icmp slt i64 %indvars.iv.next125, 2000
  br i1 %cmp959, label %for.inc16.preheader, label %for.body29.lr.ph.for.inc38.lr.ph.us_crit_edge

for.inc16.preheader:                              ; preds = %for.end
  %3 = sub nsw i64 2000, %2
  %min.iters.check = icmp ult i64 %3, 4
  br i1 %min.iters.check, label %for.inc16.preheader191, label %min.iters.checked

min.iters.checked:                                ; preds = %for.inc16.preheader
  %n.vec = and i64 %3, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add nsw i64 %2, %n.vec
  br i1 %cmp.zero, label %for.inc16.preheader191, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %4 = add nsw i64 %n.vec, -4
  %5 = lshr exact i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %xtraiter = and i64 %6, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ 0, %vector.body.prol.preheader ], [ %index.next.prol, %vector.body.prol ]
  %prol.iter = phi i64 [ %xtraiter, %vector.body.prol.preheader ], [ %prol.iter.sub, %vector.body.prol ]
  %7 = add nsw i64 %2, %index.prol
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %7
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %9, align 8
  %10 = getelementptr double, double* %8, i64 2
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %11, align 8
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  %12 = shl i64 %xtraiter, 2
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ %12, %vector.body.prol.loopexit.unr-lcssa ], [ 0, %vector.body.preheader ]
  %13 = icmp ult i64 %4, 12
  br i1 %13, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %14 = add i64 %2, %index
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %14
  %16 = bitcast double* %15 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %18, align 8
  %index.next = add i64 %index, 4
  %19 = add i64 %2, %index.next
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %19
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %21, align 8
  %22 = getelementptr double, double* %20, i64 2
  %23 = bitcast double* %22 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %23, align 8
  %index.next.1 = add i64 %index, 8
  %24 = add i64 %2, %index.next.1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %26, align 8
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %28, align 8
  %index.next.2 = add i64 %index, 12
  %29 = add i64 %2, %index.next.2
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %29
  %31 = bitcast double* %30 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %31, align 8
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x double>*
  store <2 x double> zeroinitializer, <2 x double>* %33, align 8
  %index.next.3 = add i64 %index, 16
  %34 = icmp eq i64 %index.next.3, %n.vec
  br i1 %34, label %middle.block.loopexit, label %vector.body, !llvm.loop !3

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %cmp.n = icmp eq i64 %3, %n.vec
  br i1 %cmp.n, label %for.inc23, label %for.inc16.preheader191

for.inc16.preheader191:                           ; preds = %middle.block, %min.iters.checked, %for.inc16.preheader
  %indvars.iv120.ph = phi i64 [ %2, %for.inc16.preheader ], [ %2, %min.iters.checked ], [ %ind.end, %middle.block ]
  br label %for.inc16

for.inc16:                                        ; preds = %for.inc16, %for.inc16.preheader191
  %indvars.iv120 = phi i64 [ %indvars.iv120.ph, %for.inc16.preheader191 ], [ %indvars.iv.next121, %for.inc16 ]
  %arrayidx15 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv120
  store double 0.000000e+00, double* %arrayidx15, align 8
  %exitcond123 = icmp eq i64 %indvars.iv120, 1999
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  br i1 %exitcond123, label %for.inc23.loopexit, label %for.inc16, !llvm.loop !6

for.inc23.loopexit:                               ; preds = %for.inc16
  br label %for.inc23

for.inc23:                                        ; preds = %for.inc23.loopexit, %middle.block
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next119 = add nsw i64 %2, 1
  br label %for.inc.lr.ph

for.body29.lr.ph.for.inc38.lr.ph.us_crit_edge:    ; preds = %for.end
  %arrayidx22126 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv124, i64 %indvars.iv124
  store double 1.000000e+00, double* %arrayidx22126, align 8
  %call = call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.inc38.lr.ph.us

for.inc38.lr.ph.us:                               ; preds = %for.inc38.lr.ph.us, %for.body29.lr.ph.for.inc38.lr.ph.us_crit_edge
  %indvars.iv108 = phi i64 [ 0, %for.body29.lr.ph.for.inc38.lr.ph.us_crit_edge ], [ %indvars.iv.next109.7, %for.inc38.lr.ph.us ]
  %35 = bitcast i8* %call to [2000 x [2000 x double]]*
  %scevgep = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv108, i64 0
  %scevgep107 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %scevgep.1 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109, i64 0
  %scevgep107.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.1 = or i64 %indvars.iv108, 2
  %scevgep.2 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.1, i64 0
  %scevgep107.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.2 = or i64 %indvars.iv108, 3
  %scevgep.3 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.2, i64 0
  %scevgep107.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.3 = or i64 %indvars.iv108, 4
  %scevgep.4 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.3, i64 0
  %scevgep107.4 = bitcast double* %scevgep.4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.4 = or i64 %indvars.iv108, 5
  %scevgep.5 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.4, i64 0
  %scevgep107.5 = bitcast double* %scevgep.5 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.5 = or i64 %indvars.iv108, 6
  %scevgep.6 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.5, i64 0
  %scevgep107.6 = bitcast double* %scevgep.6 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.6 = or i64 %indvars.iv108, 7
  %scevgep.7 = getelementptr [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv.next109.6, i64 0
  %scevgep107.7 = bitcast double* %scevgep.7 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep107.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next109.7 = add nuw nsw i64 %indvars.iv108, 8
  %cmp27.us.7 = icmp slt i64 %indvars.iv.next109.7, 2000
  br i1 %cmp27.us.7, label %for.inc38.lr.ph.us, label %for.body51.lr.ph.split.us.us.preheader

for.body51.lr.ph.split.us.us.preheader:           ; preds = %for.inc38.lr.ph.us
  br label %for.body51.lr.ph.split.us.us

for.inc75.us:                                     ; preds = %for.inc72.us.us
  %cmp45.us = icmp slt i64 %77, 2000
  br i1 %cmp45.us, label %for.body51.lr.ph.split.us.us, label %vector.memcheck177.preheader

vector.memcheck177.preheader:                     ; preds = %for.inc75.us
  br label %vector.memcheck177

for.inc72.us.us.loopexit:                         ; preds = %for.inc69.us.us
  br label %for.inc72.us.us

for.inc72.us.us.loopexit193:                      ; preds = %vector.body137
  br label %for.inc72.us.us

for.inc72.us.us:                                  ; preds = %for.inc72.us.us.loopexit193, %for.inc72.us.us.loopexit
  %indvars.iv.next99 = add nuw i64 %indvars.iv98, 1
  %cmp49.us.us = icmp slt i64 %indvars.iv.next99, 2000
  br i1 %cmp49.us.us, label %vector.memcheck, label %for.inc75.us

vector.memcheck:                                  ; preds = %for.inc72.us.us, %for.body51.lr.ph.split.us.us
  %indvars.iv98 = phi i64 [ 0, %for.body51.lr.ph.split.us.us ], [ %indvars.iv.next99, %for.inc72.us.us ]
  %36 = bitcast double* %scevgep144 to i8*
  %37 = bitcast double* %scevgep146 to i8*
  %38 = mul i64 %indvars.iv98, 16000
  %scevgep142 = getelementptr i8, i8* %call, i64 %38
  %39 = add i64 %38, 16000
  %scevgep143 = getelementptr i8, i8* %call, i64 %39
  %arrayidx57.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv98
  %sunkaddr71 = ptrtoint [2000 x double]* %arrayidx57.us.us to i64
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %bc = inttoptr i64 %sunkaddr73 to i8*
  %bound0 = icmp ult i8* %scevgep142, %bc
  %bound1 = icmp ult i8* %bc, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bound0149 = icmp ult i8* %scevgep142, %37
  %bound1150 = icmp ult i8* %36, %scevgep143
  %found.conflict151 = and i1 %bound0149, %bound1150
  %conflict.rdx = or i1 %found.conflict, %found.conflict151
  br i1 %conflict.rdx, label %for.inc69.us.us.preheader, label %vector.body137.preheader

vector.body137.preheader:                         ; preds = %vector.memcheck
  br label %vector.body137

for.inc69.us.us.preheader:                        ; preds = %vector.memcheck
  br label %for.inc69.us.us

vector.body137:                                   ; preds = %vector.body137, %vector.body137.preheader
  %index153 = phi i64 [ 0, %vector.body137.preheader ], [ %index.next154, %vector.body137 ]
  %40 = inttoptr i64 %sunkaddr73 to double*
  %41 = bitcast i8* %call to [2000 x [2000 x double]]*
  %42 = or i64 %index153, 1
  %43 = or i64 %index153, 2
  %44 = or i64 %index153, 3
  %45 = load double, double* %40, align 8, !alias.scope !8
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %index153, i64 %indvars.iv100
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %42, i64 %indvars.iv100
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %43, i64 %indvars.iv100
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %44, i64 %indvars.iv100
  %52 = load double, double* %48, align 8, !alias.scope !11
  %53 = load double, double* %49, align 8, !alias.scope !11
  %54 = load double, double* %50, align 8, !alias.scope !11
  %55 = load double, double* %51, align 8, !alias.scope !11
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = fmul <2 x double> %47, %57
  %61 = fmul <2 x double> %47, %59
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %41, i64 0, i64 %indvars.iv98, i64 %index153
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !13, !noalias !15
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !13, !noalias !15
  %66 = fadd <2 x double> %wide.load, %60
  %67 = fadd <2 x double> %wide.load161, %61
  store <2 x double> %66, <2 x double>* %63, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %67, <2 x double>* %65, align 8, !alias.scope !13, !noalias !15
  %index.next154 = add nuw nsw i64 %index153, 4
  %68 = icmp eq i64 %index.next154, 2000
  br i1 %68, label %for.inc72.us.us.loopexit193, label %vector.body137, !llvm.loop !16

for.inc69.us.us:                                  ; preds = %for.inc69.us.us, %for.inc69.us.us.preheader
  %indvars.iv94 = phi i64 [ 0, %for.inc69.us.us.preheader ], [ %indvars.iv.next95.1, %for.inc69.us.us ]
  %69 = inttoptr i64 %sunkaddr73 to double*
  %70 = bitcast i8* %call to [2000 x [2000 x double]]*
  %71 = load double, double* %69, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv94, i64 %indvars.iv100
  %72 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %71, %72
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv98, i64 %indvars.iv94
  %73 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %73, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next95 = or i64 %indvars.iv94, 1
  %74 = load double, double* %69, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next95, i64 %indvars.iv100
  %75 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %74, %75
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %70, i64 0, i64 %indvars.iv98, i64 %indvars.iv.next95
  %76 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %76, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %exitcond97.1 = icmp eq i64 %indvars.iv.next95, 1999
  %indvars.iv.next95.1 = add nuw nsw i64 %indvars.iv94, 2
  br i1 %exitcond97.1, label %for.inc72.us.us.loopexit, label %for.inc69.us.us, !llvm.loop !17

for.body51.lr.ph.split.us.us:                     ; preds = %for.inc75.us, %for.body51.lr.ph.split.us.us.preheader
  %indvars.iv100 = phi i64 [ 0, %for.body51.lr.ph.split.us.us.preheader ], [ %77, %for.inc75.us ]
  %scevgep144 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv100
  %77 = add i64 %indvars.iv100, 1
  %scevgep146 = getelementptr [2000 x double], [2000 x double]* %A, i64 1999, i64 %77
  %sunkaddr72 = shl nsw i64 %indvars.iv100, 3
  br label %vector.memcheck

for.inc97.us.loopexit:                            ; preds = %for.inc94.us
  br label %for.inc97.us

for.inc97.us.loopexit192:                         ; preds = %vector.body162
  br label %for.inc97.us

for.inc97.us:                                     ; preds = %for.inc97.us.loopexit192, %for.inc97.us.loopexit
  %cmp79.us = icmp slt i64 %94, 2000
  br i1 %cmp79.us, label %vector.memcheck177, label %for.end99

for.inc94.us:                                     ; preds = %for.inc94.us, %for.inc94.us.preheader
  %indvars.iv = phi i64 [ 0, %for.inc94.us.preheader ], [ %indvars.iv.next.4, %for.inc94.us ]
  %78 = bitcast i8* %call to [2000 x [2000 x double]]*
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv91, i64 %indvars.iv
  %79 = bitcast double* %arrayidx89.us to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv
  %81 = bitcast double* %arrayidx93.us to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next
  %82 = bitcast double* %arrayidx89.us.1 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv.next
  %84 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %85 = bitcast double* %arrayidx89.us.2 to i64*
  %86 = load i64, i64* %85, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv.next.1
  %87 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %86, i64* %87, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %88 = bitcast double* %arrayidx89.us.3 to i64*
  %89 = load i64, i64* %88, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv.next.2
  %90 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %89, i64* %90, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %arrayidx89.us.4 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %78, i64 0, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %91 = bitcast double* %arrayidx89.us.4 to i64*
  %92 = load i64, i64* %91, align 8
  %arrayidx93.us.4 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv.next.3
  %93 = bitcast double* %arrayidx93.us.4 to i64*
  store i64 %92, i64* %93, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  br i1 %exitcond.4, label %for.inc97.us.loopexit, label %for.inc94.us, !llvm.loop !18

vector.memcheck177:                               ; preds = %for.inc97.us, %vector.memcheck177.preheader
  %indvars.iv91 = phi i64 [ 0, %vector.memcheck177.preheader ], [ %94, %for.inc97.us ]
  %scevgep167 = getelementptr [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 0
  %94 = add i64 %indvars.iv91, 1
  %scevgep169 = getelementptr [2000 x double], [2000 x double]* %A, i64 %94, i64 0
  %95 = mul i64 %indvars.iv91, 16000
  %scevgep171 = getelementptr i8, i8* %call, i64 %95
  %96 = add i64 %95, 16000
  %scevgep172 = getelementptr i8, i8* %call, i64 %96
  %97 = bitcast double* %scevgep169 to i8*
  %98 = bitcast double* %scevgep167 to i8*
  %bound0173 = icmp ult i8* %98, %scevgep172
  %bound1174 = icmp ult i8* %scevgep171, %97
  %memcheck.conflict176 = and i1 %bound0173, %bound1174
  br i1 %memcheck.conflict176, label %for.inc94.us.preheader, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck177
  br label %vector.body162

for.inc94.us.preheader:                           ; preds = %vector.memcheck177
  br label %for.inc94.us

vector.body162:                                   ; preds = %vector.body162, %vector.body162.preheader
  %index179 = phi i64 [ 0, %vector.body162.preheader ], [ %index.next180.1, %vector.body162 ]
  %99 = bitcast i8* %call to [2000 x [2000 x double]]*
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv91, i64 %index179
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load187 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !19
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load188 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !19
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %index179
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load187, <2 x i64>* %105, align 8, !alias.scope !22, !noalias !19
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load188, <2 x i64>* %107, align 8, !alias.scope !22, !noalias !19
  %index.next180 = or i64 %index179, 4
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %99, i64 0, i64 %indvars.iv91, i64 %index.next180
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load187.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !19
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load188.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !19
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %index.next180
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load187.1, <2 x i64>* %113, align 8, !alias.scope !22, !noalias !19
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load188.1, <2 x i64>* %115, align 8, !alias.scope !22, !noalias !19
  %index.next180.1 = add nuw nsw i64 %index179, 8
  %116 = icmp eq i64 %index.next180.1, 2000
  br i1 %116, label %for.inc97.us.loopexit192, label %vector.body162, !llvm.loop !24

for.end99:                                        ; preds = %for.inc97.us
  call void @free(i8* %call) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* %A) unnamed_addr #0 {
for.body.lr.ph:
  %A.addr = alloca [2000 x double]*, align 8
  store [2000 x double]* %A, [2000 x double]** %A.addr, align 8
  br label %for.body

for.body:                                         ; preds = %for.inc56, %for.body.lr.ph
  %indvars.iv39 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next40, %for.inc56 ]
  %indvars.iv35 = phi i32 [ -1, %for.body.lr.ph ], [ %indvars.iv.next36, %for.inc56 ]
  %0 = phi [2000 x double]* [ %A, %for.body.lr.ph ], [ %25, %for.inc56 ]
  %1 = add i64 %indvars.iv39, 4294967295
  %2 = and i64 %1, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.inc56

for.cond4.preheader.preheader:                    ; preds = %for.body
  br label %for.cond4.preheader

for.cond28.preheader.for.inc45_crit_edge:         ; preds = %for.inc25
  %.pre26 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  %arrayidx328 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre26, i64 %indvars.iv39
  %sunkaddr21 = ptrtoint [2000 x double]* %arrayidx328 to i64
  %sunkaddr22 = shl i64 %indvars.iv39, 3
  %sunkaddr23 = add i64 %sunkaddr21, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  %wide.trip.count37 = zext i32 %indvars.iv35 to i64
  %.pre42 = load double, double* %sunkaddr24, align 8
  %3 = and i64 %1, 1
  %lcmp.mod52 = icmp eq i64 %3, 0
  br i1 %lcmp.mod52, label %for.inc45.prol.preheader, label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.preheader:                         ; preds = %for.cond28.preheader.for.inc45_crit_edge
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %.pre26, i64 %indvars.iv39, i64 0
  %4 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %4, %4
  %sub44.prol = fsub double %.pre42, %mul39.prol
  %sunkaddr54 = ptrtoint [2000 x double]* %arrayidx328 to i64
  %sunkaddr55 = mul i64 %indvars.iv39, 8
  %sunkaddr56 = add i64 %sunkaddr54, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  store double %sub44.prol, double* %sunkaddr57, align 8
  br label %for.inc45.prol.loopexit.unr-lcssa

for.inc45.prol.loopexit.unr-lcssa:                ; preds = %for.cond28.preheader.for.inc45_crit_edge, %for.inc45.prol.preheader
  %.unr53.ph = phi double [ %sub44.prol, %for.inc45.prol.preheader ], [ %.pre42, %for.cond28.preheader.for.inc45_crit_edge ]
  %indvars.iv33.unr.ph = phi i64 [ 1, %for.inc45.prol.preheader ], [ 0, %for.cond28.preheader.for.inc45_crit_edge ]
  %5 = icmp eq i64 %2, 0
  br i1 %5, label %for.inc45.for.inc56_crit_edge, label %for.cond28.preheader.for.inc45_crit_edge.new

for.cond28.preheader.for.inc45_crit_edge.new:     ; preds = %for.inc45.prol.loopexit.unr-lcssa
  br label %for.inc45

for.cond4.preheader:                              ; preds = %for.inc25, %for.cond4.preheader.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next32, %for.inc25 ]
  %indvars.iv29 = phi i32 [ -1, %for.cond4.preheader.preheader ], [ %indvars.iv.next30, %for.inc25 ]
  %6 = phi [2000 x double]* [ %0, %for.cond4.preheader.preheader ], [ %18, %for.inc25 ]
  %7 = add i64 %indvars.iv31, 4294967295
  %8 = and i64 %7, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv31, 0
  br i1 %cmp51, label %for.inc.lr.ph, label %for.inc25

for.inc.lr.ph:                                    ; preds = %for.cond4.preheader
  %arrayidx14 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv39
  %sunkaddr = ptrtoint [2000 x double]* %arrayidx14 to i64
  %sunkaddr18 = shl i64 %indvars.iv31, 3
  %sunkaddr19 = add i64 %sunkaddr, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  %wide.trip.count = zext i32 %indvars.iv29 to i64
  %.pre = load double, double* %sunkaddr20, align 8
  %9 = and i64 %7, 1
  %lcmp.mod = icmp eq i64 %9, 0
  br i1 %lcmp.mod, label %for.inc.prol.preheader, label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv39, i64 0
  %10 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv31, i64 0
  %11 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %10, %11
  %sub.prol = fsub double %.pre, %mul.prol
  %sunkaddr58 = ptrtoint [2000 x double]* %arrayidx14 to i64
  %sunkaddr59 = mul i64 %indvars.iv31, 8
  %sunkaddr60 = add i64 %sunkaddr58, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  store double %sub.prol, double* %sunkaddr61, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %.unr.ph = phi double [ %sub.prol, %for.inc.prol.preheader ], [ %.pre, %for.inc.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %12 = icmp eq i64 %8, 0
  br i1 %12, label %for.inc.for.inc25_crit_edge, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %13 = phi double [ %.unr.ph, %for.inc.lr.ph.new ], [ %sub.1, %for.inc ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv
  %14 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv
  %15 = load double, double* %arrayidx12, align 8
  %mul = fmul double %14, %15
  %sub = fsub double %13, %mul
  %sunkaddr62 = ptrtoint [2000 x double]* %arrayidx14 to i64
  %sunkaddr63 = mul i64 %indvars.iv31, 8
  %sunkaddr64 = add i64 %sunkaddr62, %sunkaddr63
  %sunkaddr65 = inttoptr i64 %sunkaddr64 to double*
  store double %sub, double* %sunkaddr65, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv.next
  %16 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv.next
  %17 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %16, %17
  %sub.1 = fsub double %sub, %mul.1
  store double %sub.1, double* %sunkaddr65, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc.for.inc25_crit_edge.loopexit, label %for.inc

for.inc.for.inc25_crit_edge.loopexit:             ; preds = %for.inc
  br label %for.inc.for.inc25_crit_edge

for.inc.for.inc25_crit_edge:                      ; preds = %for.inc.for.inc25_crit_edge.loopexit, %for.inc.prol.loopexit.unr-lcssa
  %.pre25 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc25

for.inc25:                                        ; preds = %for.cond4.preheader, %for.inc.for.inc25_crit_edge
  %18 = phi [2000 x double]* [ %.pre25, %for.inc.for.inc25_crit_edge ], [ %6, %for.cond4.preheader ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv31
  %19 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %18, i64 %indvars.iv39, i64 %indvars.iv31
  %20 = load double, double* %arrayidx24, align 8
  %div = fdiv double %20, %19
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next32 = add nuw i64 %indvars.iv31, 1
  %cmp2 = icmp slt i64 %indvars.iv.next32, %indvars.iv39
  %indvars.iv.next30 = add nsw i32 %indvars.iv29, 1
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond28.preheader.for.inc45_crit_edge

for.inc45:                                        ; preds = %for.inc45, %for.cond28.preheader.for.inc45_crit_edge.new
  %21 = phi double [ %.unr53.ph, %for.cond28.preheader.for.inc45_crit_edge.new ], [ %sub44.1, %for.inc45 ]
  %indvars.iv33 = phi i64 [ %indvars.iv33.unr.ph, %for.cond28.preheader.for.inc45_crit_edge.new ], [ %indvars.iv.next34.1, %for.inc45 ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre26, i64 %indvars.iv39, i64 %indvars.iv33
  %22 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %22, %22
  %sub44 = fsub double %21, %mul39
  %sunkaddr66 = ptrtoint [2000 x double]* %arrayidx328 to i64
  %sunkaddr67 = mul i64 %indvars.iv39, 8
  %sunkaddr68 = add i64 %sunkaddr66, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  store double %sub44, double* %sunkaddr69, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %.pre26, i64 %indvars.iv39, i64 %indvars.iv.next34
  %23 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %23, %23
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %sunkaddr69, align 8
  %exitcond38.1 = icmp eq i64 %indvars.iv.next34, %wide.trip.count37
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  br i1 %exitcond38.1, label %for.inc45.for.inc56_crit_edge.loopexit, label %for.inc45

for.inc45.for.inc56_crit_edge.loopexit:           ; preds = %for.inc45
  br label %for.inc45.for.inc56_crit_edge

for.inc45.for.inc56_crit_edge:                    ; preds = %for.inc45.for.inc56_crit_edge.loopexit, %for.inc45.prol.loopexit.unr-lcssa
  %.pre28 = load [2000 x double]*, [2000 x double]** %A.addr, align 8
  br label %for.inc56

for.inc56:                                        ; preds = %for.body, %for.inc45.for.inc56_crit_edge
  %24 = phi [2000 x double]* [ %.pre26, %for.inc45.for.inc56_crit_edge ], [ %0, %for.body ]
  %25 = phi [2000 x double]* [ %.pre28, %for.inc45.for.inc56_crit_edge ], [ %0, %for.body ]
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %24, i64 %indvars.iv39, i64 %indvars.iv39
  %26 = load double, double* %arrayidx51, align 8
  %call = call double @sqrt(double %26) #3
  %arrayidx55 = getelementptr inbounds [2000 x double], [2000 x double]* %25, i64 %indvars.iv39, i64 %indvars.iv39
  store double %call, double* %arrayidx55, align 8
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %cmp = icmp slt i64 %indvars.iv.next40, 2000
  %indvars.iv.next36 = add nsw i32 %indvars.iv35, 1
  br i1 %cmp, label %for.body, label %for.end58

for.end58:                                        ; preds = %for.inc56
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
for.body.lr.ph:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.inc10, %for.body.lr.ph
  %indvars.iv8 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next9, %for.inc10 ]
  %3 = mul nsw i64 %indvars.iv8, 2000
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
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %cmp3 = icmp slt i64 %indvars.iv, %indvars.iv8
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  br i1 %cmp3, label %for.body4, label %for.inc10

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp = icmp slt i64 %indvars.iv.next9, 2000
  br i1 %cmp, label %for.body4.lr.ph, label %for.end12

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = distinct !{!18, !4, !5}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !4, !5}

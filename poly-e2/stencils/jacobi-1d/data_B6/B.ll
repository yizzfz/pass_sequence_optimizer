; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = add i32 %n, -1
  %1 = zext i32 %0 to i64
  %2 = add nuw nsw i64 %1, 1
  %min.iters.check = icmp ult i64 %2, 2
  br i1 %min.iters.check, label %for.body.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body.lr.ph
  %n.vec = and i64 %2, 8589934590
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %2
  %scevgep6 = getelementptr double, double* %B, i64 %2
  %bound0 = icmp ugt double* %scevgep6, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind8 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next9, %vector.body ]
  %3 = sitofp <2 x i32> %vec.ind8 to <2 x double>
  %4 = fadd <2 x double> %3, <double 2.000000e+00, double 2.000000e+00>
  %5 = fdiv <2 x double> %4, %broadcast.splat
  %6 = getelementptr inbounds double, double* %A, i64 %index
  %7 = bitcast double* %6 to <2 x double>*
  store <2 x double> %5, <2 x double>* %7, align 8, !alias.scope !1, !noalias !4
  %8 = fadd <2 x double> %3, <double 3.000000e+00, double 3.000000e+00>
  %9 = fdiv <2 x double> %8, %broadcast.splat
  %10 = getelementptr inbounds double, double* %B, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  store <2 x double> %9, <2 x double>* %11, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next9 = add <2 x i32> %vec.ind8, <i32 2, i32 2>
  %12 = icmp eq i64 %index.next, %n.vec
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %2, %n.vec
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %13 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %13 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %exitcond2 = icmp eq i64 %indvars.iv, %1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond2, label %for.end.loopexit, label %for.body, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %tsteps, 0
  %sub = add nsw i32 %n, -1
  %0 = icmp sgt i32 %sub, 1
  %or.cond = and i1 %cmp3, %0
  br i1 %or.cond, label %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge, label %for.end35

for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge: ; preds = %entry
  %1 = add i32 %n, -2
  %2 = zext i32 %1 to i64
  %scevgep = getelementptr double, double* %A, i64 1
  %3 = add nuw nsw i64 %2, 1
  %scevgep51 = getelementptr double, double* %A, i64 %3
  %4 = add nuw nsw i64 %2, 2
  %scevgep54 = getelementptr double, double* %B, i64 %4
  %scevgep71 = getelementptr double, double* %B, i64 1
  %scevgep73 = getelementptr double, double* %B, i64 %3
  %scevgep76 = getelementptr double, double* %A, i64 %4
  %min.iters.check65 = icmp ult i32 %1, 4
  %5 = and i32 %1, 3
  %n.mod.vf = zext i32 %5 to i64
  %n.vec = sub nsw i64 %2, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep54
  %bound1 = icmp ugt double* %scevgep51, %B
  %found.conflict = and i1 %bound0, %bound1
  %ind.end = add nsw i64 %n.vec, 1
  %cmp.n = icmp eq i32 %5, 0
  %bound078 = icmp ult double* %scevgep71, %scevgep76
  %bound179 = icmp ugt double* %scevgep73, %A
  %found.conflict80 = and i1 %bound078, %bound179
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.end32.us, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge
  %6 = phi i32 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader.us_crit_edge ], [ %inc34.us, %for.end32.us ]
  br i1 %min.iters.check65, label %for.body3.us.preheader, label %min.iters.checked66

min.iters.checked66:                              ; preds = %for.cond1.preheader.us
  br i1 %cmp.zero, label %for.body3.us.preheader, label %vector.memcheck82

vector.memcheck82:                                ; preds = %min.iters.checked66
  br i1 %found.conflict80, label %for.body3.us.preheader, label %vector.body62.preheader

vector.body62.preheader:                          ; preds = %vector.memcheck82
  br label %vector.body62

vector.body62:                                    ; preds = %vector.body62.preheader, %vector.body62
  %index84 = phi i64 [ %index.next85, %vector.body62 ], [ 0, %vector.body62.preheader ]
  %offset.idx89 = or i64 %index84, 1
  %7 = getelementptr inbounds double, double* %A, i64 %index84
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !10
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !10
  %11 = getelementptr inbounds double, double* %A, i64 %offset.idx89
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !10
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !10
  %15 = fadd <2 x double> %wide.load94, %wide.load96
  %16 = fadd <2 x double> %wide.load95, %wide.load97
  %17 = add nuw nsw i64 %offset.idx89, 1
  %18 = getelementptr inbounds double, double* %A, i64 %17
  %19 = getelementptr double, double* %18, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !10
  %21 = fadd <2 x double> %15, %wide.load95
  %22 = fadd <2 x double> %16, %wide.load99
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = fmul <2 x double> %22, <double 3.333300e-01, double 3.333300e-01>
  %25 = getelementptr inbounds double, double* %B, i64 %offset.idx89
  %26 = bitcast double* %25 to <2 x double>*
  store <2 x double> %23, <2 x double>* %26, align 8, !alias.scope !13, !noalias !10
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %24, <2 x double>* %28, align 8, !alias.scope !13, !noalias !10
  %index.next85 = add i64 %index84, 4
  %29 = icmp eq i64 %index.next85, %n.vec
  br i1 %29, label %middle.block63, label %vector.body62, !llvm.loop !15

middle.block63:                                   ; preds = %vector.body62
  br i1 %cmp.n, label %for.body16.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %middle.block63, %vector.memcheck82, %min.iters.checked66, %for.cond1.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck82 ], [ 1, %min.iters.checked66 ], [ 1, %for.cond1.preheader.us ], [ %ind.end, %middle.block63 ]
  %30 = sub nsw i64 %3, %indvars.iv.ph
  %xtraiter = and i64 %30, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit.unr-lcssa, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.us.preheader
  %31 = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.us.prol = getelementptr inbounds double, double* %A, i64 %31
  %32 = load double, double* %arrayidx.us.prol, align 8
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %33 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %32, %33
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %34 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %34
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.body3.us.prol.loopexit.unr-lcssa

for.body3.us.prol.loopexit.unr-lcssa:             ; preds = %for.body3.us.preheader, %for.body3.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol.preheader ], [ %indvars.iv.ph, %for.body3.us.preheader ]
  %35 = icmp eq i64 %2, %indvars.iv.ph
  br i1 %35, label %for.body16.us.preheader.loopexit, label %for.body3.us.preheader.new

for.body3.us.preheader.new:                       ; preds = %for.body3.us.prol.loopexit.unr-lcssa
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader.new ], [ %indvars.iv.next.1, %for.body3.us ]
  %36 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %36
  %37 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %38 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %37, %38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %39
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %40 = load double, double* %arrayidx6.us, align 8
  %41 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %40, %41
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %42 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %42
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next, %2
  br i1 %exitcond48.1, label %for.body16.us.preheader.loopexit.unr-lcssa, label %for.body3.us, !llvm.loop !16

for.body16.us.preheader.loopexit.unr-lcssa:       ; preds = %for.body3.us
  br label %for.body16.us.preheader.loopexit

for.body16.us.preheader.loopexit:                 ; preds = %for.body3.us.prol.loopexit.unr-lcssa, %for.body16.us.preheader.loopexit.unr-lcssa
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %for.body16.us.preheader.loopexit, %middle.block63
  br i1 %min.iters.check65, label %for.body16.us.preheader100, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body16.us.preheader
  br i1 %cmp.zero, label %for.body16.us.preheader100, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %for.body16.us.preheader100, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %43 = getelementptr inbounds double, double* %B, i64 %index
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !17
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !17
  %47 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !17
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !17
  %51 = fadd <2 x double> %wide.load, %wide.load58
  %52 = fadd <2 x double> %wide.load57, %wide.load59
  %53 = add nuw nsw i64 %offset.idx, 1
  %54 = getelementptr inbounds double, double* %B, i64 %53
  %55 = getelementptr double, double* %54, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !17
  %57 = fadd <2 x double> %51, %wide.load57
  %58 = fadd <2 x double> %52, %wide.load61
  %59 = fmul <2 x double> %57, <double 3.333300e-01, double 3.333300e-01>
  %60 = fmul <2 x double> %58, <double 3.333300e-01, double 3.333300e-01>
  %61 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  store <2 x double> %59, <2 x double>* %62, align 8, !alias.scope !20, !noalias !17
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  store <2 x double> %60, <2 x double>* %64, align 8, !alias.scope !20, !noalias !17
  %index.next = add i64 %index, 4
  %65 = icmp eq i64 %index.next, %n.vec
  br i1 %65, label %middle.block, label %vector.body, !llvm.loop !22

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.end32.us, label %for.body16.us.preheader100

for.body16.us.preheader100:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.us.preheader
  %indvars.iv42.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.body16.us.preheader ], [ %ind.end, %middle.block ]
  %66 = sub nsw i64 %3, %indvars.iv42.ph
  %xtraiter101 = and i64 %66, 1
  %lcmp.mod102 = icmp eq i64 %xtraiter101, 0
  br i1 %lcmp.mod102, label %for.body16.us.prol.loopexit.unr-lcssa, label %for.body16.us.prol.preheader

for.body16.us.prol.preheader:                     ; preds = %for.body16.us.preheader100
  %67 = add nsw i64 %indvars.iv42.ph, -1
  %arrayidx19.us.prol = getelementptr inbounds double, double* %B, i64 %67
  %68 = load double, double* %arrayidx19.us.prol, align 8
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv42.ph
  %69 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %68, %69
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.ph, 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.next43.prol
  %70 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %70
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv42.ph
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.body16.us.prol.loopexit.unr-lcssa

for.body16.us.prol.loopexit.unr-lcssa:            ; preds = %for.body16.us.preheader100, %for.body16.us.prol.preheader
  %indvars.iv42.unr.ph = phi i64 [ %indvars.iv.next43.prol, %for.body16.us.prol.preheader ], [ %indvars.iv42.ph, %for.body16.us.preheader100 ]
  %71 = icmp eq i64 %2, %indvars.iv42.ph
  br i1 %71, label %for.end32.us.loopexit, label %for.body16.us.preheader100.new

for.body16.us.preheader100.new:                   ; preds = %for.body16.us.prol.loopexit.unr-lcssa
  br label %for.body16.us

for.body16.us:                                    ; preds = %for.body16.us, %for.body16.us.preheader100.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr.ph, %for.body16.us.preheader100.new ], [ %indvars.iv.next43.1, %for.body16.us ]
  %72 = add nsw i64 %indvars.iv42, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %72
  %73 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv42
  %74 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %73, %74
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next43
  %75 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %75
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv42
  store double %mul27.us, double* %arrayidx29.us, align 8
  %76 = load double, double* %arrayidx21.us, align 8
  %77 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %76, %77
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next43.1
  %78 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %78
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next43
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond46.1 = icmp eq i64 %indvars.iv.next43, %2
  br i1 %exitcond46.1, label %for.end32.us.loopexit.unr-lcssa, label %for.body16.us, !llvm.loop !23

for.end32.us.loopexit.unr-lcssa:                  ; preds = %for.body16.us
  br label %for.end32.us.loopexit

for.end32.us.loopexit:                            ; preds = %for.body16.us.prol.loopexit.unr-lcssa, %for.end32.us.loopexit.unr-lcssa
  br label %for.end32.us

for.end32.us:                                     ; preds = %for.end32.us.loopexit, %middle.block
  %inc34.us = add nuw nsw i32 %6, 1
  %exitcond = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond, label %for.end35.loopexit, label %for.cond1.preheader.us

for.end35.loopexit:                               ; preds = %for.end32.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %entry.for.body_crit_edge, label %for.end

entry.for.body_crit_edge:                         ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %entry.for.body_crit_edge
  %indvars.iv = phi i64 [ 0, %entry.for.body_crit_edge ], [ %indvars.iv.next, %if.end ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}

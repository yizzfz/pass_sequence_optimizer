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
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %conv1 = sitofp i32 %n to double
  %0 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = sext i32 %n to i64
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %xtraiter = and i64 %1, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.preheader
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol.preheader
  %indvars.iv2.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv2 = phi i64 [ %indvars.iv2.unr, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %3 = trunc i64 %indvars.iv2 to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv2
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv2
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %5 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %6 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, %div.v.i1.2
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %1
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %0 = sext i32 %sub to i64
  %cmp10 = icmp sgt i32 %tsteps, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = icmp sgt i32 %sub, 1
  %2 = add nsw i64 %0, -1
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep16 = getelementptr double, double* %A, i64 %0
  %3 = add nsw i64 %0, 1
  %scevgep19 = getelementptr double, double* %B, i64 %3
  %scevgep36 = getelementptr double, double* %B, i64 1
  %scevgep38 = getelementptr double, double* %B, i64 %0
  %scevgep41 = getelementptr double, double* %A, i64 %3
  %min.iters.check30 = icmp ult i64 %2, 4
  %n.vec = and i64 %2, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep19
  %bound1 = icmp ugt double* %scevgep16, %B
  %found.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  %bound043 = icmp ult double* %scevgep36, %scevgep41
  %bound144 = icmp ugt double* %scevgep38, %A
  %found.conflict45 = and i1 %bound043, %bound144
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc33, %for.cond1.preheader.lr.ph
  %storemerge11 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc34, %for.inc33 ]
  br i1 %1, label %for.body3.lr.ph, label %for.inc33

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 %min.iters.check30, label %for.body3.preheader, label %min.iters.checked31

for.body3.preheader:                              ; preds = %middle.block28, %vector.memcheck47, %min.iters.checked31, %for.body3.lr.ph
  %indvars.iv7.ph = phi i64 [ %ind.end, %middle.block28 ], [ 1, %vector.memcheck47 ], [ 1, %min.iters.checked31 ], [ 1, %for.body3.lr.ph ]
  %4 = sub nsw i64 %0, %indvars.iv7.ph
  %xtraiter = and i64 %4, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  %sub4.prol = add nsw i64 %indvars.iv7.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %sub4.prol
  %5 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv7.ph
  %6 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %5, %6
  %add7.prol = add nuw nsw i64 %indvars.iv7.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %add7.prol
  %7 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %7
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv7.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol.preheader
  %indvars.iv7.unr.ph = phi i64 [ %add7.prol, %for.body3.prol.preheader ], [ %indvars.iv7.ph, %for.body3.preheader ]
  %8 = icmp eq i64 %2, %indvars.iv7.ph
  br i1 %8, label %for.cond13.preheader.loopexit, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

min.iters.checked31:                              ; preds = %for.body3.lr.ph
  br i1 %cmp.zero, label %for.body3.preheader, label %vector.memcheck47

vector.memcheck47:                                ; preds = %min.iters.checked31
  br i1 %found.conflict45, label %for.body3.preheader, label %vector.body27.preheader

vector.body27.preheader:                          ; preds = %vector.memcheck47
  br label %vector.body27

vector.body27:                                    ; preds = %vector.body27.preheader, %vector.body27
  %index49 = phi i64 [ %index.next50, %vector.body27 ], [ 0, %vector.body27.preheader ]
  %offset.idx54 = or i64 %index49, 1
  %9 = getelementptr inbounds double, double* %A, i64 %index49
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr inbounds double, double* %A, i64 %offset.idx54
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr double, double* %13, i64 2
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fadd <2 x double> %wide.load59, %wide.load61
  %18 = fadd <2 x double> %wide.load60, %wide.load62
  %19 = add nuw nsw i64 %offset.idx54, 1
  %20 = getelementptr inbounds double, double* %A, i64 %19
  %21 = getelementptr double, double* %20, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %17, %wide.load60
  %24 = fadd <2 x double> %18, %wide.load64
  %25 = fmul <2 x double> %23, <double 3.333300e-01, double 3.333300e-01>
  %26 = fmul <2 x double> %24, <double 3.333300e-01, double 3.333300e-01>
  %27 = getelementptr inbounds double, double* %B, i64 %offset.idx54
  %28 = bitcast double* %27 to <2 x double>*
  store <2 x double> %25, <2 x double>* %28, align 8, !alias.scope !4, !noalias !1
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %26, <2 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %index.next50 = add i64 %index49, 4
  %31 = icmp eq i64 %index.next50, %n.vec
  br i1 %31, label %middle.block28, label %vector.body27, !llvm.loop !6

middle.block28:                                   ; preds = %vector.body27
  br i1 %cmp.n, label %for.cond13.preheader, label %for.body3.preheader

for.cond13.preheader.loopexit.unr-lcssa:          ; preds = %for.body3
  br label %for.cond13.preheader.loopexit

for.cond13.preheader.loopexit:                    ; preds = %for.body3.prol.loopexit.unr-lcssa, %for.cond13.preheader.loopexit.unr-lcssa
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %for.cond13.preheader.loopexit, %middle.block28
  br i1 true, label %for.body16.lr.ph, label %for.cond13.preheader.for.inc33_crit_edge

for.cond13.preheader.for.inc33_crit_edge:         ; preds = %for.cond13.preheader
  br label %for.inc33

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  br i1 %min.iters.check30, label %for.body16.preheader, label %min.iters.checked

for.body16.preheader:                             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.lr.ph
  %indvars.iv49.ph = phi i64 [ %ind.end, %middle.block ], [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.body16.lr.ph ]
  %32 = sub nsw i64 %0, %indvars.iv49.ph
  %xtraiter66 = and i64 %32, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod67, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol.preheader

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  %sub17.prol = add nsw i64 %indvars.iv49.ph, -1
  %arrayidx19.prol = getelementptr inbounds double, double* %B, i64 %sub17.prol
  %33 = load double, double* %arrayidx19.prol, align 8
  %arrayidx21.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv49.ph
  %34 = load double, double* %arrayidx21.prol, align 8
  %add22.prol = fadd double %33, %34
  %add23.prol = add nuw nsw i64 %indvars.iv49.ph, 1
  %arrayidx25.prol = getelementptr inbounds double, double* %B, i64 %add23.prol
  %35 = load double, double* %arrayidx25.prol, align 8
  %add26.prol = fadd double %add22.prol, %35
  %mul27.prol = fmul double %add26.prol, 3.333300e-01
  %arrayidx29.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv49.ph
  store double %mul27.prol, double* %arrayidx29.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.preheader, %for.body16.prol.preheader
  %indvars.iv49.unr.ph = phi i64 [ %add23.prol, %for.body16.prol.preheader ], [ %indvars.iv49.ph, %for.body16.preheader ]
  %36 = icmp eq i64 %2, %indvars.iv49.ph
  br i1 %36, label %for.inc33.loopexit, label %for.body16.preheader.new

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

min.iters.checked:                                ; preds = %for.body16.lr.ph
  br i1 %cmp.zero, label %for.body16.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %for.body16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %37 = getelementptr inbounds double, double* %B, i64 %index
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !9
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !9
  %41 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !9
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !9
  %45 = fadd <2 x double> %wide.load, %wide.load23
  %46 = fadd <2 x double> %wide.load22, %wide.load24
  %47 = add nuw nsw i64 %offset.idx, 1
  %48 = getelementptr inbounds double, double* %B, i64 %47
  %49 = getelementptr double, double* %48, i64 2
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load26 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !9
  %51 = fadd <2 x double> %45, %wide.load22
  %52 = fadd <2 x double> %46, %wide.load26
  %53 = fmul <2 x double> %51, <double 3.333300e-01, double 3.333300e-01>
  %54 = fmul <2 x double> %52, <double 3.333300e-01, double 3.333300e-01>
  %55 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %53, <2 x double>* %56, align 8, !alias.scope !12, !noalias !9
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> %54, <2 x double>* %58, align 8, !alias.scope !12, !noalias !9
  %index.next = add i64 %index, 4
  %59 = icmp eq i64 %index.next, %n.vec
  br i1 %59, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc33, label %for.body16.preheader

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv7 = phi i64 [ %indvars.iv7.unr.ph, %for.body3.preheader.new ], [ %add7.1, %for.body3 ]
  %sub4 = add nsw i64 %indvars.iv7, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %sub4
  %60 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv7
  %61 = load double, double* %arrayidx6, align 8
  %add = fadd double %60, %61
  %add7 = add nuw nsw i64 %indvars.iv7, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %add7
  %62 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %62
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv7
  store double %mul, double* %arrayidx12, align 8
  %63 = load double, double* %arrayidx6, align 8
  %64 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %63, %64
  %add7.1 = add nsw i64 %indvars.iv7, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %add7.1
  %65 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %65
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %add7
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %add7.1, %0
  br i1 %exitcond.1, label %for.cond13.preheader.loopexit.unr-lcssa, label %for.body3, !llvm.loop !15

for.body16:                                       ; preds = %for.body16, %for.body16.preheader.new
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %for.body16.preheader.new ], [ %add23.1, %for.body16 ]
  %sub17 = add nsw i64 %indvars.iv49, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %sub17
  %66 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv49
  %67 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %66, %67
  %add23 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %add23
  %68 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %68
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv49
  store double %mul27, double* %arrayidx29, align 8
  %69 = load double, double* %arrayidx21, align 8
  %70 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %69, %70
  %add23.1 = add nsw i64 %indvars.iv49, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %add23.1
  %71 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %71
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %add23
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond13.1 = icmp eq i64 %add23.1, %0
  br i1 %exitcond13.1, label %for.inc33.loopexit.unr-lcssa, label %for.body16, !llvm.loop !16

for.inc33.loopexit.unr-lcssa:                     ; preds = %for.body16
  br label %for.inc33.loopexit

for.inc33.loopexit:                               ; preds = %for.body16.prol.loopexit.unr-lcssa, %for.inc33.loopexit.unr-lcssa
  br label %for.inc33

for.inc33:                                        ; preds = %for.cond13.preheader.for.inc33_crit_edge, %for.inc33.loopexit, %for.cond1.preheader, %middle.block
  %inc34 = add nuw nsw i32 %storemerge11, 1
  %exitcond14 = icmp eq i32 %inc34, %tsteps
  br i1 %exitcond14, label %for.end35.loopexit, label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %3 = sext i32 %n to i64
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv2 = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %4 = trunc i64 %indvars.iv2 to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv2
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}

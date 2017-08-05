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
  %call = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to double*
  %arraydecay2 = bitcast i8* %call1 to double*
  call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay2)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %arraydecay, double* %arraydecay2)
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
  call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  br i1 true, label %for.body.prol.loopexit, label %for.body.prol.preheader

for.body.prol.preheader:                          ; preds = %for.body.preheader
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.preheader, %for.body.prol.preheader
  br i1 false, label %for.body.prol.loopexit.for.end.loopexit_crit_edge, label %for.body.preheader.new

for.body.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.body.prol.loopexit
  br label %for.end.loopexit

for.body.preheader.new:                           ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv2 = phi i64 [ 0, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %0 = trunc i64 %indvars.iv2 to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv2
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv2
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %2 to double
  %arrayidx.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %3 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %3, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1.1 = extractelement <2 x double> %div.1, i32 0
  %div.v.r2.1 = extractelement <2 x double> %div.1, i32 1
  store double %div.v.r1.1, double* %arrayidx.1, align 8
  %arrayidx7.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %div.v.r2.1, double* %arrayidx7.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep17 = getelementptr double, double* %A, i64 1999
  %scevgep20 = getelementptr double, double* %B, i64 2000
  %scevgep37 = getelementptr double, double* %B, i64 1
  %scevgep39 = getelementptr double, double* %B, i64 1999
  %scevgep42 = getelementptr double, double* %A, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep20
  %bound1 = icmp ugt double* %scevgep17, %B
  %found.conflict = and i1 %bound0, %bound1
  %bound044 = icmp ult double* %scevgep37, %scevgep42
  %bound145 = icmp ugt double* %scevgep39, %A
  %found.conflict46 = and i1 %bound044, %bound145
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc33, %for.cond1.preheader.lr.ph
  %storemerge13 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc34, %for.inc33 ]
  br i1 true, label %for.body3.lr.ph, label %for.cond1.preheader.for.inc33_crit_edge

for.cond1.preheader.for.inc33_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.inc33

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  br i1 false, label %for.body3.lr.ph.for.body3.preheader_crit_edge, label %min.iters.checked32

for.body3.lr.ph.for.body3.preheader_crit_edge:    ; preds = %for.body3.lr.ph
  br label %for.body3.preheader

for.body3.preheader:                              ; preds = %min.iters.checked32.for.body3.preheader_crit_edge, %for.body3.lr.ph.for.body3.preheader_crit_edge, %middle.block29, %vector.memcheck48
  %indvars.iv9.ph = phi i64 [ 1, %vector.memcheck48 ], [ undef, %min.iters.checked32.for.body3.preheader_crit_edge ], [ undef, %for.body3.lr.ph.for.body3.preheader_crit_edge ], [ 1997, %middle.block29 ]
  %0 = sub nsw i64 1999, %indvars.iv9.ph
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader
  %1 = add nsw i64 %indvars.iv9.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %1
  %2 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv9.ph
  %3 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %2, %3
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv9.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %4 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %4
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv9.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader, %for.body3.prol.preheader
  %indvars.iv9.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.preheader ], [ %indvars.iv9.ph, %for.body3.preheader ]
  %5 = icmp eq i64 1998, %indvars.iv9.ph
  br i1 %5, label %for.cond13.preheader.loopexit, label %for.body3.preheader.new

for.body3.preheader.new:                          ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

min.iters.checked32:                              ; preds = %for.body3.lr.ph
  br i1 false, label %min.iters.checked32.for.body3.preheader_crit_edge, label %vector.memcheck48

min.iters.checked32.for.body3.preheader_crit_edge: ; preds = %min.iters.checked32
  br label %for.body3.preheader

vector.memcheck48:                                ; preds = %min.iters.checked32
  br i1 %found.conflict46, label %for.body3.preheader, label %vector.body28.preheader

vector.body28.preheader:                          ; preds = %vector.memcheck48
  br label %vector.body28

vector.body28:                                    ; preds = %vector.body28.preheader, %vector.body28
  %index50 = phi i64 [ %index.next51, %vector.body28 ], [ 0, %vector.body28.preheader ]
  %offset.idx55 = or i64 %index50, 1
  %6 = getelementptr inbounds double, double* %A, i64 %index50
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load61 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds double, double* %A, i64 %offset.idx55
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load60, %wide.load62
  %15 = fadd <2 x double> %wide.load61, %wide.load63
  %16 = add nuw nsw i64 %offset.idx55, 1
  %17 = getelementptr inbounds double, double* %A, i64 %16
  %18 = getelementptr double, double* %17, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %14, %wide.load61
  %21 = fadd <2 x double> %15, %wide.load65
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = getelementptr inbounds double, double* %B, i64 %offset.idx55
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %22, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %23, <2 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next51 = add i64 %index50, 4
  %28 = icmp eq i64 %index.next51, 1996
  br i1 %28, label %middle.block29, label %vector.body28, !llvm.loop !6

middle.block29:                                   ; preds = %vector.body28
  br i1 false, label %middle.block29.for.cond13.preheader_crit_edge, label %for.body3.preheader

middle.block29.for.cond13.preheader_crit_edge:    ; preds = %middle.block29
  br label %for.cond13.preheader

for.cond13.preheader.loopexit.unr-lcssa:          ; preds = %for.body3
  br label %for.cond13.preheader.loopexit

for.cond13.preheader.loopexit:                    ; preds = %for.body3.prol.loopexit.unr-lcssa, %for.cond13.preheader.loopexit.unr-lcssa
  br label %for.cond13.preheader

for.cond13.preheader:                             ; preds = %middle.block29.for.cond13.preheader_crit_edge, %for.cond13.preheader.loopexit
  br i1 true, label %for.body16.lr.ph, label %for.cond13.preheader.for.inc33_crit_edge

for.cond13.preheader.for.inc33_crit_edge:         ; preds = %for.cond13.preheader
  br label %for.inc33

for.body16.lr.ph:                                 ; preds = %for.cond13.preheader
  br i1 false, label %for.body16.lr.ph.for.body16.preheader_crit_edge, label %min.iters.checked

for.body16.lr.ph.for.body16.preheader_crit_edge:  ; preds = %for.body16.lr.ph
  br label %for.body16.preheader

for.body16.preheader:                             ; preds = %min.iters.checked.for.body16.preheader_crit_edge, %for.body16.lr.ph.for.body16.preheader_crit_edge, %middle.block, %vector.memcheck
  %indvars.iv511.ph = phi i64 [ 1, %vector.memcheck ], [ undef, %min.iters.checked.for.body16.preheader_crit_edge ], [ undef, %for.body16.lr.ph.for.body16.preheader_crit_edge ], [ 1997, %middle.block ]
  %29 = sub nsw i64 1999, %indvars.iv511.ph
  %xtraiter66 = and i64 %29, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  br i1 %lcmp.mod67, label %for.body16.prol.loopexit.unr-lcssa, label %for.body16.prol.preheader

for.body16.prol.preheader:                        ; preds = %for.body16.preheader
  %30 = add nsw i64 %indvars.iv511.ph, -1
  %arrayidx19.prol = getelementptr inbounds double, double* %B, i64 %30
  %31 = load double, double* %arrayidx19.prol, align 8
  %arrayidx21.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv511.ph
  %32 = load double, double* %arrayidx21.prol, align 8
  %add22.prol = fadd double %31, %32
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv511.ph, 1
  %arrayidx25.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.next6.prol
  %33 = load double, double* %arrayidx25.prol, align 8
  %add26.prol = fadd double %add22.prol, %33
  %mul27.prol = fmul double %add26.prol, 3.333300e-01
  %arrayidx29.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv511.ph
  store double %mul27.prol, double* %arrayidx29.prol, align 8
  br label %for.body16.prol.loopexit.unr-lcssa

for.body16.prol.loopexit.unr-lcssa:               ; preds = %for.body16.preheader, %for.body16.prol.preheader
  %indvars.iv511.unr.ph = phi i64 [ %indvars.iv.next6.prol, %for.body16.prol.preheader ], [ %indvars.iv511.ph, %for.body16.preheader ]
  %34 = icmp eq i64 1998, %indvars.iv511.ph
  br i1 %34, label %for.inc33.loopexit, label %for.body16.preheader.new

for.body16.preheader.new:                         ; preds = %for.body16.prol.loopexit.unr-lcssa
  br label %for.body16

min.iters.checked:                                ; preds = %for.body16.lr.ph
  br i1 false, label %min.iters.checked.for.body16.preheader_crit_edge, label %vector.memcheck

min.iters.checked.for.body16.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.body16.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %for.body16.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %35 = getelementptr inbounds double, double* %B, i64 %index
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !9
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !9
  %39 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !9
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !9
  %43 = fadd <2 x double> %wide.load, %wide.load24
  %44 = fadd <2 x double> %wide.load23, %wide.load25
  %45 = add nuw nsw i64 %offset.idx, 1
  %46 = getelementptr inbounds double, double* %B, i64 %45
  %47 = getelementptr double, double* %46, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load27 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !9
  %49 = fadd <2 x double> %43, %wide.load23
  %50 = fadd <2 x double> %44, %wide.load27
  %51 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %52 = fmul <2 x double> %50, <double 3.333300e-01, double 3.333300e-01>
  %53 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  store <2 x double> %51, <2 x double>* %54, align 8, !alias.scope !12, !noalias !9
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> %52, <2 x double>* %56, align 8, !alias.scope !12, !noalias !9
  %index.next = add i64 %index, 4
  %57 = icmp eq i64 %index.next, 1996
  br i1 %57, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 false, label %middle.block.for.inc33_crit_edge, label %for.body16.preheader

middle.block.for.inc33_crit_edge:                 ; preds = %middle.block
  br label %for.inc33

for.body3:                                        ; preds = %for.body3, %for.body3.preheader.new
  %indvars.iv9 = phi i64 [ %indvars.iv9.unr.ph, %for.body3.preheader.new ], [ %indvars.iv.next.1, %for.body3 ]
  %58 = add nsw i64 %indvars.iv9, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %58
  %59 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv9
  %60 = load double, double* %arrayidx6, align 8
  %add = fadd double %59, %60
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %61 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %61
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv9
  store double %mul, double* %arrayidx12, align 8
  %62 = load double, double* %arrayidx6, align 8
  %63 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %62, %63
  %indvars.iv.next.1 = add nsw i64 %indvars.iv9, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %64 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %64
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1999
  br i1 %exitcond.1, label %for.cond13.preheader.loopexit.unr-lcssa, label %for.body3, !llvm.loop !15

for.body16:                                       ; preds = %for.body16, %for.body16.preheader.new
  %indvars.iv511 = phi i64 [ %indvars.iv511.unr.ph, %for.body16.preheader.new ], [ %indvars.iv.next6.1, %for.body16 ]
  %65 = add nsw i64 %indvars.iv511, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %65
  %66 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv511
  %67 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %66, %67
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next6
  %68 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %68
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv511
  store double %mul27, double* %arrayidx29, align 8
  %69 = load double, double* %arrayidx21, align 8
  %70 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %69, %70
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv511, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next6.1
  %71 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %71
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next6
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond14.1 = icmp eq i64 %indvars.iv.next6.1, 1999
  br i1 %exitcond14.1, label %for.inc33.loopexit.unr-lcssa, label %for.body16, !llvm.loop !16

for.inc33.loopexit.unr-lcssa:                     ; preds = %for.body16
  br label %for.inc33.loopexit

for.inc33.loopexit:                               ; preds = %for.body16.prol.loopexit.unr-lcssa, %for.inc33.loopexit.unr-lcssa
  br label %for.inc33

for.inc33:                                        ; preds = %middle.block.for.inc33_crit_edge, %for.cond13.preheader.for.inc33_crit_edge, %for.cond1.preheader.for.inc33_crit_edge, %for.inc33.loopexit
  %inc34 = add nuw nsw i32 %storemerge13, 1
  %exitcond15 = icmp eq i32 %inc34, 500
  br i1 %exitcond15, label %for.end35.loopexit, label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %entry.for.end35_crit_edge, %for.end35.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.body.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.preheader:                               ; preds = %entry
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv2 = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv2 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv2
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
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

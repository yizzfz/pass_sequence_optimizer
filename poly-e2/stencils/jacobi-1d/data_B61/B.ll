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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %1 = sext i32 %n to i64
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
  %indvars.iv.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.body.preheader.new

for.body.preheader.new:                           ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.preheader.new ], [ %indvars.iv.next.1, %for.body ]
  %3 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %3 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %4 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %1
  br i1 %cmp.1, label %for.body, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.body
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp5 = icmp sgt i32 %tsteps, 0
  br i1 %cmp5, label %for.body.preheader, label %for.end35

for.body.preheader:                               ; preds = %entry
  %sub1 = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub1, 1
  %0 = sext i32 %sub1 to i64
  %1 = icmp sgt i64 %0, 2
  %smax = select i1 %1, i64 %0, i64 2
  %2 = add nsw i64 %smax, -1
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep16 = getelementptr double, double* %A, i64 %smax
  %3 = add nuw nsw i64 %smax, 1
  %scevgep18 = getelementptr double, double* %B, i64 %3
  %4 = add nsw i64 %0, -1
  %scevgep35 = getelementptr double, double* %B, i64 1
  %scevgep37 = getelementptr double, double* %B, i64 %0
  %5 = add nsw i64 %0, 1
  %scevgep39 = getelementptr double, double* %A, i64 %5
  %min.iters.check29 = icmp ult i64 %4, 4
  %min.iters.check = icmp ult i64 %2, 4
  %n.vec = and i64 %2, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %bound0 = icmp ult double* %scevgep, %scevgep18
  %bound1 = icmp ugt double* %scevgep16, %B
  %found.conflict = and i1 %bound0, %bound1
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  %n.vec32 = and i64 %4, -4
  %cmp.zero33 = icmp eq i64 %n.vec32, 0
  %bound041 = icmp ult double* %scevgep35, %scevgep39
  %bound142 = icmp ugt double* %scevgep37, %A
  %found.conflict43 = and i1 %bound041, %bound142
  %ind.end50 = or i64 %n.vec32, 1
  %cmp.n51 = icmp eq i64 %4, %n.vec32
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.inc33
  %inc3411 = phi i32 [ 0, %for.body.preheader ], [ %inc34, %for.inc33 ]
  br i1 %cmp22, label %for.body3.preheader, label %for.inc33

for.body3.preheader:                              ; preds = %for.body
  br i1 %min.iters.check29, label %for.body3.preheader64, label %min.iters.checked30

min.iters.checked30:                              ; preds = %for.body3.preheader
  br i1 %cmp.zero33, label %for.body3.preheader64, label %vector.memcheck45

vector.memcheck45:                                ; preds = %min.iters.checked30
  br i1 %found.conflict43, label %for.body3.preheader64, label %vector.body26.preheader

vector.body26.preheader:                          ; preds = %vector.memcheck45
  br label %vector.body26

vector.body26:                                    ; preds = %vector.body26.preheader, %vector.body26
  %index47 = phi i64 [ %index.next48, %vector.body26 ], [ 0, %vector.body26.preheader ]
  %offset.idx52 = or i64 %index47, 1
  %6 = getelementptr inbounds double, double* %A, i64 %index47
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds double, double* %A, i64 %offset.idx52
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load57, %wide.load59
  %15 = fadd <2 x double> %wide.load58, %wide.load60
  %16 = add nuw nsw i64 %offset.idx52, 1
  %17 = getelementptr inbounds double, double* %A, i64 %16
  %18 = getelementptr double, double* %17, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %14, %wide.load58
  %21 = fadd <2 x double> %15, %wide.load62
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = getelementptr inbounds double, double* %B, i64 %offset.idx52
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %22, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %23, <2 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next48 = add i64 %index47, 4
  %28 = icmp eq i64 %index.next48, %n.vec32
  br i1 %28, label %middle.block27, label %vector.body26, !llvm.loop !6

middle.block27:                                   ; preds = %vector.body26
  br i1 %cmp.n51, label %for.end, label %for.body3.preheader64

for.body3.preheader64:                            ; preds = %middle.block27, %vector.memcheck45, %min.iters.checked30, %for.body3.preheader
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck45 ], [ 1, %min.iters.checked30 ], [ 1, %for.body3.preheader ], [ %ind.end50, %middle.block27 ]
  %29 = sub nsw i64 %0, %indvars.iv.ph
  %xtraiter = and i64 %29, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.prol.loopexit.unr-lcssa, label %for.body3.prol.preheader

for.body3.prol.preheader:                         ; preds = %for.body3.preheader64
  %sub4.prol = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %sub4.prol
  %30 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %31 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %30, %31
  %add7.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %add7.prol
  %32 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %32
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader64, %for.body3.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %add7.prol, %for.body3.prol.preheader ], [ %indvars.iv.ph, %for.body3.preheader64 ]
  %33 = icmp eq i64 %4, %indvars.iv.ph
  br i1 %33, label %for.end.loopexit, label %for.body3.preheader64.new

for.body3.preheader64.new:                        ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader64.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.preheader64.new ], [ %add7.1, %for.body3 ]
  %sub4 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %sub4
  %34 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %35 = load double, double* %arrayidx6, align 8
  %add = fadd double %34, %35
  %add7 = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %add7
  %36 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %36
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %37 = load double, double* %arrayidx6, align 8
  %38 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %37, %38
  %add7.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %add7.1
  %39 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %39
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %add7
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %add7.1, %0
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.body3, !llvm.loop !9

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit.unr-lcssa, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block27
  br i1 true, label %for.body16.preheader, label %for.end.for.inc33_crit_edge

for.end.for.inc33_crit_edge:                      ; preds = %for.end
  br label %for.inc33

for.body16.preheader:                             ; preds = %for.end
  br i1 %min.iters.check, label %for.body16.preheader63, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body16.preheader
  br i1 %cmp.zero, label %for.body16.preheader63, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %for.body16.preheader63, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %40 = getelementptr inbounds double, double* %B, i64 %index
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !10
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !10
  %44 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !10
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !10
  %48 = fadd <2 x double> %wide.load, %wide.load22
  %49 = fadd <2 x double> %wide.load21, %wide.load23
  %50 = add nuw nsw i64 %offset.idx, 1
  %51 = getelementptr inbounds double, double* %B, i64 %50
  %52 = getelementptr double, double* %51, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fadd <2 x double> %48, %wide.load21
  %55 = fadd <2 x double> %49, %wide.load25
  %56 = fmul <2 x double> %54, <double 3.333300e-01, double 3.333300e-01>
  %57 = fmul <2 x double> %55, <double 3.333300e-01, double 3.333300e-01>
  %58 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  store <2 x double> %56, <2 x double>* %59, align 8, !alias.scope !13, !noalias !10
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> %57, <2 x double>* %61, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %62 = icmp eq i64 %index.next, %n.vec
  br i1 %62, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc33, label %for.body16.preheader63

for.body16.preheader63:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.preheader
  %indvars.iv12.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.body16.preheader ], [ %ind.end, %middle.block ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.preheader63, %for.body16
  %indvars.iv12 = phi i64 [ %add23, %for.body16 ], [ %indvars.iv12.ph, %for.body16.preheader63 ]
  %sub17 = add nsw i64 %indvars.iv12, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %sub17
  %63 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv12
  %64 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %63, %64
  %add23 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %add23
  %65 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %65
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv12
  store double %mul27, double* %arrayidx29, align 8
  %cmp15 = icmp slt i64 %add23, %0
  br i1 %cmp15, label %for.body16, label %for.inc33.loopexit, !llvm.loop !16

for.inc33.loopexit:                               ; preds = %for.body16
  br label %for.inc33

for.inc33:                                        ; preds = %for.end.for.inc33_crit_edge, %for.inc33.loopexit, %for.body, %middle.block
  %inc34 = add nsw i32 %inc3411, 1
  %cmp = icmp slt i32 %inc34, %tsteps
  br i1 %cmp, label %for.body, label %for.end35.loopexit

for.end35.loopexit:                               ; preds = %for.inc33
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
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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

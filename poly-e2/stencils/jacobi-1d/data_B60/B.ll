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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.inc.preheader, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.inc.preheader:                                ; preds = %entry
  br i1 true, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader
  store double 1.000000e-03, double* %A, align 8
  store double 1.500000e-03, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.preheader, %for.inc.prol.preheader
  br i1 false, label %for.inc.prol.loopexit.for.end.loopexit_crit_edge, label %for.inc.preheader.new

for.inc.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.inc.prol.loopexit
  br label %for.end.loopexit

for.inc.preheader.new:                            ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader.new
  %indvars.iv = phi i64 [ 0, %for.inc.preheader.new ], [ %indvars.iv.next.1, %for.inc ]
  %0 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %0 to double
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %1 = insertelement <2 x double> undef, double %conv, i32 0
  %add.v.i0.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %add = fadd <2 x double> %add.v.i0.2, <double 2.000000e+00, double 3.000000e+00>
  %div = fdiv <2 x double> %add, <double 2.000000e+03, double 2.000000e+03>
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %div.v.r2 = extractelement <2 x double> %div, i32 1
  store double %div.v.r1, double* %arrayidx, align 8
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div.v.r2, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, 2000
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.body.preheader, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.preheader:                               ; preds = %entry
  %scevgep = getelementptr double, double* %A, i64 1
  %scevgep16 = getelementptr double, double* %A, i64 1999
  %scevgep18 = getelementptr double, double* %B, i64 2000
  %scevgep35 = getelementptr double, double* %B, i64 1
  %scevgep37 = getelementptr double, double* %B, i64 1999
  %scevgep39 = getelementptr double, double* %A, i64 2000
  %bound0 = icmp ult double* %scevgep, %scevgep18
  %bound1 = icmp ugt double* %scevgep16, %B
  %found.conflict = and i1 %bound0, %bound1
  %bound041 = icmp ult double* %scevgep35, %scevgep39
  %bound142 = icmp ugt double* %scevgep37, %A
  %found.conflict43 = and i1 %bound041, %bound142
  br label %for.body

for.body:                                         ; preds = %for.inc33, %for.body.preheader
  %inc3411 = phi i32 [ 0, %for.body.preheader ], [ %inc34, %for.inc33 ]
  br i1 true, label %for.inc.preheader, label %for.body.for.inc33_crit_edge

for.body.for.inc33_crit_edge:                     ; preds = %for.body
  br label %for.inc33

for.inc.preheader:                                ; preds = %for.body
  br i1 false, label %for.inc.preheader.for.inc.preheader64_crit_edge, label %min.iters.checked30

for.inc.preheader.for.inc.preheader64_crit_edge:  ; preds = %for.inc.preheader
  br label %for.inc.preheader64

min.iters.checked30:                              ; preds = %for.inc.preheader
  br i1 false, label %min.iters.checked30.for.inc.preheader64_crit_edge, label %vector.memcheck45

min.iters.checked30.for.inc.preheader64_crit_edge: ; preds = %min.iters.checked30
  br label %for.inc.preheader64

vector.memcheck45:                                ; preds = %min.iters.checked30
  br i1 %found.conflict43, label %for.inc.preheader64, label %vector.body26.preheader

vector.body26.preheader:                          ; preds = %vector.memcheck45
  br label %vector.body26

vector.body26:                                    ; preds = %vector.body26.preheader, %vector.body26
  %index47 = phi i64 [ %index.next48, %vector.body26 ], [ 0, %vector.body26.preheader ]
  %offset.idx52 = or i64 %index47, 1
  %0 = getelementptr inbounds double, double* %A, i64 %index47
  %1 = bitcast double* %0 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %1, align 8, !alias.scope !1
  %2 = getelementptr double, double* %0, i64 2
  %3 = bitcast double* %2 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %3, align 8, !alias.scope !1
  %4 = getelementptr inbounds double, double* %A, i64 %offset.idx52
  %5 = bitcast double* %4 to <2 x double>*
  %wide.load59 = load <2 x double>, <2 x double>* %5, align 8, !alias.scope !1
  %6 = getelementptr double, double* %4, i64 2
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load60 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = fadd <2 x double> %wide.load57, %wide.load59
  %9 = fadd <2 x double> %wide.load58, %wide.load60
  %10 = add nuw nsw i64 %offset.idx52, 1
  %11 = getelementptr inbounds double, double* %A, i64 %10
  %12 = getelementptr double, double* %11, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load62 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %8, %wide.load58
  %15 = fadd <2 x double> %9, %wide.load62
  %16 = fmul <2 x double> %14, <double 3.333300e-01, double 3.333300e-01>
  %17 = fmul <2 x double> %15, <double 3.333300e-01, double 3.333300e-01>
  %18 = getelementptr inbounds double, double* %B, i64 %offset.idx52
  %19 = bitcast double* %18 to <2 x double>*
  store <2 x double> %16, <2 x double>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x double>*
  store <2 x double> %17, <2 x double>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next48 = add i64 %index47, 4
  %22 = icmp eq i64 %index.next48, 1996
  br i1 %22, label %middle.block27, label %vector.body26, !llvm.loop !6

middle.block27:                                   ; preds = %vector.body26
  br i1 false, label %middle.block27.for.end_crit_edge, label %for.inc.preheader64

middle.block27.for.end_crit_edge:                 ; preds = %middle.block27
  br label %for.end

for.inc.preheader64:                              ; preds = %min.iters.checked30.for.inc.preheader64_crit_edge, %for.inc.preheader.for.inc.preheader64_crit_edge, %middle.block27, %vector.memcheck45
  %indvars.iv.ph = phi i64 [ 1997, %middle.block27 ], [ 1, %vector.memcheck45 ], [ undef, %min.iters.checked30.for.inc.preheader64_crit_edge ], [ undef, %for.inc.preheader.for.inc.preheader64_crit_edge ]
  %23 = sub nsw i64 1999, %indvars.iv.ph
  %xtraiter = and i64 %23, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.preheader64
  %sub4.prol = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %sub4.prol
  %24 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %25 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %24, %25
  %add7.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %add7.prol
  %26 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %26
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.preheader64, %for.inc.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %add7.prol, %for.inc.prol.preheader ], [ %indvars.iv.ph, %for.inc.preheader64 ]
  %27 = icmp eq i64 1998, %indvars.iv.ph
  br i1 %27, label %for.end.loopexit, label %for.inc.preheader64.new

for.inc.preheader64.new:                          ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.preheader64.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.preheader64.new ], [ %add7.1, %for.inc ]
  %sub4 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %sub4
  %28 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %29 = load double, double* %arrayidx6, align 8
  %add = fadd double %28, %29
  %add7 = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %add7
  %30 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %30
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %31 = load double, double* %arrayidx6, align 8
  %32 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %31, %32
  %add7.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %add7.1
  %33 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %33
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %add7
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.1 = icmp eq i64 %add7.1, 1999
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.inc, !llvm.loop !9

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit.unr-lcssa, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %middle.block27.for.end_crit_edge, %for.end.loopexit
  br i1 true, label %for.inc30.preheader, label %for.end.for.inc33_crit_edge

for.end.for.inc33_crit_edge:                      ; preds = %for.end
  br label %for.inc33

for.inc30.preheader:                              ; preds = %for.end
  br i1 false, label %for.inc30.preheader.for.inc30.preheader63_crit_edge, label %min.iters.checked

for.inc30.preheader.for.inc30.preheader63_crit_edge: ; preds = %for.inc30.preheader
  br label %for.inc30.preheader63

min.iters.checked:                                ; preds = %for.inc30.preheader
  br i1 false, label %min.iters.checked.for.inc30.preheader63_crit_edge, label %vector.memcheck

min.iters.checked.for.inc30.preheader63_crit_edge: ; preds = %min.iters.checked
  br label %for.inc30.preheader63

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 %found.conflict, label %for.inc30.preheader63, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %34 = getelementptr inbounds double, double* %B, i64 %index
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !10
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !10
  %38 = getelementptr inbounds double, double* %B, i64 %offset.idx
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !10
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !10
  %42 = fadd <2 x double> %wide.load, %wide.load22
  %43 = fadd <2 x double> %wide.load21, %wide.load23
  %44 = add nuw nsw i64 %offset.idx, 1
  %45 = getelementptr inbounds double, double* %B, i64 %44
  %46 = getelementptr double, double* %45, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load25 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !10
  %48 = fadd <2 x double> %42, %wide.load21
  %49 = fadd <2 x double> %43, %wide.load25
  %50 = fmul <2 x double> %48, <double 3.333300e-01, double 3.333300e-01>
  %51 = fmul <2 x double> %49, <double 3.333300e-01, double 3.333300e-01>
  %52 = getelementptr inbounds double, double* %A, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> %50, <2 x double>* %53, align 8, !alias.scope !13, !noalias !10
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  store <2 x double> %51, <2 x double>* %55, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %56 = icmp eq i64 %index.next, 1996
  br i1 %56, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 false, label %middle.block.for.inc33_crit_edge, label %for.inc30.preheader63

middle.block.for.inc33_crit_edge:                 ; preds = %middle.block
  br label %for.inc33

for.inc30.preheader63:                            ; preds = %min.iters.checked.for.inc30.preheader63_crit_edge, %for.inc30.preheader.for.inc30.preheader63_crit_edge, %middle.block, %vector.memcheck
  %indvars.iv12.ph = phi i64 [ 1997, %middle.block ], [ 1, %vector.memcheck ], [ undef, %min.iters.checked.for.inc30.preheader63_crit_edge ], [ undef, %for.inc30.preheader.for.inc30.preheader63_crit_edge ]
  br label %for.inc30

for.inc30:                                        ; preds = %for.inc30.preheader63, %for.inc30
  %indvars.iv12 = phi i64 [ %add23, %for.inc30 ], [ %indvars.iv12.ph, %for.inc30.preheader63 ]
  %sub17 = add nsw i64 %indvars.iv12, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %sub17
  %57 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv12
  %58 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %57, %58
  %add23 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %add23
  %59 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %59
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv12
  store double %mul27, double* %arrayidx29, align 8
  %cmp15 = icmp slt i64 %add23, 1999
  br i1 %cmp15, label %for.inc30, label %for.inc33.loopexit, !llvm.loop !16

for.inc33.loopexit:                               ; preds = %for.inc30
  br label %for.inc33

for.inc33:                                        ; preds = %middle.block.for.inc33_crit_edge, %for.end.for.inc33_crit_edge, %for.body.for.inc33_crit_edge, %for.inc33.loopexit
  %inc34 = add nsw i32 %inc3411, 1
  %cmp = icmp slt i32 %inc34, 500
  br i1 %cmp, label %for.body, label %for.end35.loopexit

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

for.body:                                         ; preds = %for.inc, %for.body.preheader
  %indvars.iv = phi i64 [ 0, %for.body.preheader ], [ %indvars.iv.next, %for.inc ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, 2000
  br i1 %cmp, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
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
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}

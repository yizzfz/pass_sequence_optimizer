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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.prol.loopexit, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph ], [ 1, %for.inc.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.end.loopexit, label %for.inc.lr.ph.new

for.inc.lr.ph.new:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc.lr.ph.new ], [ %indvars.iv.next.1, %for.inc ]
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
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1, label %for.end.loopexit.unr-lcssa, label %for.inc

for.end.loopexit.unr-lcssa:                       ; preds = %for.inc
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc.prol.loopexit, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %tsteps, 0
  br i1 %cmp8, label %for.body.lr.ph, label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %sub1 = add nsw i32 %n, -1
  %cmp22 = icmp sgt i32 %sub1, 1
  br i1 %cmp22, label %for.body.us.preheader, label %for.end35

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %0 = sext i32 %sub1 to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 3
  %wide.trip.count.1 = zext i32 %sub1 to i64
  %arrayidx21.us.prol = getelementptr double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %2 = add nsw i64 %wide.trip.count.1, -2
  %scevgep77 = getelementptr double, double* %A, i64 2
  %scevgep80 = getelementptr double, double* %B, i64 -1
  %scevgep83 = getelementptr double, double* %B, i64 3
  %3 = add nsw i64 %0, -1
  %scevgep104 = getelementptr double, double* %B, i64 %0
  %4 = add nsw i64 %0, 1
  %scevgep107 = getelementptr double, double* %A, i64 %4
  %min.iters.check96 = icmp ult i64 %3, 4
  %n.vec99 = and i64 %3, -4
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  %bound0109 = icmp ult double* %arrayidx21.us.prol, %scevgep107
  %bound1110 = icmp ugt double* %scevgep104, %A
  %found.conflict111 = and i1 %bound0109, %bound1110
  %ind.end118 = or i64 %n.vec99, 1
  %cmp.n119 = icmp eq i64 %3, %n.vec99
  br label %for.body.us

for.body.us:                                      ; preds = %for.inc33.us, %for.body.us.preheader
  %inc3411.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.body.us.preheader ]
  br i1 %min.iters.check96, label %for.inc.us.preheader, label %min.iters.checked97

for.inc.us.preheader:                             ; preds = %middle.block94, %vector.memcheck113, %min.iters.checked97, %for.body.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck113 ], [ 1, %min.iters.checked97 ], [ 1, %for.body.us ], [ %ind.end118, %middle.block94 ]
  %5 = sub nsw i64 %0, %indvars.iv.ph
  %xtraiter131 = and i64 %5, 1
  %lcmp.mod132 = icmp eq i64 %xtraiter131, 0
  br i1 %lcmp.mod132, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.us.preheader
  %6 = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.us.prol = getelementptr inbounds double, double* %A, i64 %6
  %7 = load double, double* %arrayidx.us.prol, align 8
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %8 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %7, %8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %9 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %9
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.us.preheader, %for.inc.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol.preheader ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %10 = icmp eq i64 %3, %indvars.iv.ph
  br i1 %10, label %for.inc30.us.preheader.loopexit, label %for.inc.us.preheader.new

for.inc.us.preheader.new:                         ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

min.iters.checked97:                              ; preds = %for.body.us
  br i1 %cmp.zero100, label %for.inc.us.preheader, label %vector.memcheck113

vector.memcheck113:                               ; preds = %min.iters.checked97
  br i1 %found.conflict111, label %for.inc.us.preheader, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck113
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index115 = phi i64 [ %index.next116, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %offset.idx120 = or i64 %index115, 1
  %11 = getelementptr inbounds double, double* %A, i64 %index115
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr inbounds double, double* %A, i64 %offset.idx120
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %wide.load, %wide.load126
  %20 = fadd <2 x double> %wide.load125, %wide.load127
  %21 = add nuw nsw i64 %offset.idx120, 1
  %22 = getelementptr inbounds double, double* %A, i64 %21
  %23 = getelementptr double, double* %22, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %19, %wide.load125
  %26 = fadd <2 x double> %20, %wide.load129
  %27 = fmul <2 x double> %25, <double 3.333300e-01, double 3.333300e-01>
  %28 = fmul <2 x double> %26, <double 3.333300e-01, double 3.333300e-01>
  %29 = getelementptr inbounds double, double* %B, i64 %offset.idx120
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %27, <2 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %28, <2 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %index.next116 = add i64 %index115, 4
  %33 = icmp eq i64 %index.next116, %n.vec99
  br i1 %33, label %middle.block94, label %vector.body93, !llvm.loop !6

middle.block94:                                   ; preds = %vector.body93
  br i1 %cmp.n119, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block, %for.inc30.us.prol.loopexit.unr-lcssa
  %inc34.us = add nuw nsw i32 %inc3411.us, 1
  %exitcond74 = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond74, label %for.end35.loopexit, label %for.body.us

for.inc30.us:                                     ; preds = %for.inc30.us.preheader130, %for.inc30.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc30.us ], [ %indvars.iv63.ph, %for.inc30.us.preheader130 ]
  %34 = add nsw i64 %indvars.iv63, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %34
  %35 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv63
  %36 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %35, %36
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64
  %37 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %37
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv63
  store double %mul27.us, double* %arrayidx29.us, align 8
  %38 = load double, double* %arrayidx21.us, align 8
  %39 = load double, double* %arrayidx25.us, align 8
  %add22.us.1 = fadd double %38, %39
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next64.1
  %40 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %40
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next64
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next64.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc33.us.loopexit, label %for.inc30.us, !llvm.loop !9

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.inc.us.preheader.new ], [ %indvars.iv.next.1, %for.inc.us ]
  %41 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %41
  %42 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %43 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %42, %43
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %44 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %44
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %45 = load double, double* %arrayidx6.us, align 8
  %46 = load double, double* %arrayidx9.us, align 8
  %add.us.1 = fadd double %45, %46
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %47 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %47
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1133 = icmp eq i64 %indvars.iv.next.1, %0
  br i1 %exitcond.1133, label %for.inc30.us.preheader.loopexit.unr-lcssa, label %for.inc.us, !llvm.loop !10

for.inc30.us.preheader.loopexit.unr-lcssa:        ; preds = %for.inc.us
  br label %for.inc30.us.preheader.loopexit

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us.prol.loopexit.unr-lcssa, %for.inc30.us.preheader.loopexit.unr-lcssa
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %middle.block94
  br i1 %lcmp.mod, label %for.inc30.us.prol.loopexit.unr-lcssa, label %for.inc30.us.prol.preheader

for.inc30.us.prol.preheader:                      ; preds = %for.inc30.us.preheader
  %48 = load double, double* %B, align 8
  %49 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %48, %49
  %50 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %50
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.inc30.us.prol.loopexit.unr-lcssa

for.inc30.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc30.us.preheader, %for.inc30.us.prol.preheader
  %indvars.iv63.unr.ph = phi i64 [ 2, %for.inc30.us.prol.preheader ], [ 1, %for.inc30.us.preheader ]
  br i1 %1, label %for.inc33.us, label %for.inc30.us.preheader75

for.inc30.us.preheader75:                         ; preds = %for.inc30.us.prol.loopexit.unr-lcssa
  %51 = sub nsw i64 %2, %indvars.iv63.unr.ph
  %52 = lshr i64 %51, 1
  %53 = add nuw i64 %52, 1
  %min.iters.check = icmp ult i64 %53, 2
  br i1 %min.iters.check, label %for.inc30.us.preheader130, label %min.iters.checked

for.inc30.us.preheader130:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc30.us.preheader75
  %indvars.iv63.ph = phi i64 [ %indvars.iv63.unr.ph, %vector.memcheck ], [ %indvars.iv63.unr.ph, %min.iters.checked ], [ %indvars.iv63.unr.ph, %for.inc30.us.preheader75 ], [ %ind.end, %middle.block ]
  br label %for.inc30.us

min.iters.checked:                                ; preds = %for.inc30.us.preheader75
  %n.mod.vf = and i64 %53, 1
  %n.vec = sub i64 %53, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.inc30.us.preheader130, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv63.unr.ph
  %54 = shl nuw i64 %52, 1
  %55 = add i64 %indvars.iv63.unr.ph, %54
  %scevgep78 = getelementptr double, double* %scevgep77, i64 %55
  %scevgep81 = getelementptr double, double* %scevgep80, i64 %indvars.iv63.unr.ph
  %scevgep84 = getelementptr double, double* %scevgep83, i64 %55
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ult double* %scevgep81, %scevgep78
  %found.conflict = and i1 %bound0, %bound1
  %56 = add nuw nsw i64 %indvars.iv63.unr.ph, 2
  %57 = add i64 %56, %54
  %58 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %57, %58
  br i1 %found.conflict, label %for.inc30.us.preheader130, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %59 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv63.unr.ph, %59
  %60 = add nsw i64 %offset.idx, -1
  %61 = getelementptr inbounds double, double* %B, i64 %60
  %62 = bitcast double* %61 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %62, align 8, !alias.scope !11
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec86 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %63 = fadd <2 x double> %strided.vec, %strided.vec86
  %64 = add nuw nsw i64 %offset.idx, 1
  %65 = getelementptr inbounds double, double* %B, i64 %64
  %66 = getelementptr double, double* %65, i64 -1
  %67 = bitcast double* %66 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %67, align 8, !alias.scope !11
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %68 = fadd <2 x double> %63, %strided.vec89
  %69 = fmul <2 x double> %68, <double 3.333300e-01, double 3.333300e-01>
  %70 = bitcast double* %65 to <4 x double>*
  %wide.vec90 = load <4 x double>, <4 x double>* %70, align 8, !alias.scope !11
  %strided.vec92 = shufflevector <4 x double> %wide.vec90, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %71 = fadd <4 x double> %wide.vec87, %wide.vec90
  %72 = shufflevector <4 x double> %71, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %73 = fadd <2 x double> %72, %strided.vec92
  %74 = fmul <2 x double> %73, <double 3.333300e-01, double 3.333300e-01>
  %75 = getelementptr inbounds double, double* %A, i64 %64
  %76 = getelementptr double, double* %75, i64 -1
  %77 = bitcast double* %76 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %69, <2 x double> %74, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %77, align 8, !alias.scope !14, !noalias !11
  %index.next = add i64 %index, 2
  %78 = icmp eq i64 %index.next, %n.vec
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc33.us, label %for.inc30.us.preheader130

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit, %for.body.lr.ph, %entry
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
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.inc, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %for.inc ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}

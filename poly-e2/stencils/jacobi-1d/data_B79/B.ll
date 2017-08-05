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
  %5 = bitcast double* %arrayidx to <2 x double>*
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  %6 = bitcast double* %arrayidx7 to <2 x double>*
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %conv.1 = sitofp i32 %7 to double
  %8 = insertelement <2 x double> undef, double %conv.1, i32 0
  %add.v.i0.2.1 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %add.1 = fadd <2 x double> %add.v.i0.2.1, <double 2.000000e+00, double 3.000000e+00>
  %div.1 = fdiv <2 x double> %add.1, %div.v.i1.2
  %9 = shufflevector <2 x double> %div, <2 x double> %div.1, <2 x i32> <i32 0, i32 2>
  store <2 x double> %9, <2 x double>* %5, align 8
  %10 = shufflevector <2 x double> %div, <2 x double> %div.1, <2 x i32> <i32 1, i32 3>
  store <2 x double> %10, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %0
  br i1 %cmp.1, label %for.inc, label %for.end.loopexit.unr-lcssa

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
  %0 = sext i32 %n to i64
  %sub = add nsw i64 %0, -1
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 3
  %wide.trip.count.1 = zext i32 %sub1 to i64
  %arrayidx21.us.prol = getelementptr double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %2 = add nsw i64 %wide.trip.count.1, -2
  %scevgep114 = getelementptr double, double* %A, i64 2
  %scevgep117 = getelementptr double, double* %B, i64 -1
  %scevgep120 = getelementptr double, double* %B, i64 3
  %3 = add nsw i64 %0, -2
  %scevgep159 = getelementptr double, double* %B, i64 %sub
  %scevgep161 = getelementptr double, double* %A, i64 %0
  %4 = add nsw i64 %0, 1
  %min.iters.check151 = icmp ult i64 %3, 4
  %n.vec154 = and i64 %3, -4
  %cmp.zero155 = icmp eq i64 %n.vec154, 0
  %bound0163 = icmp ult double* %arrayidx21.us.prol, %scevgep161
  %bound1164 = icmp ugt double* %scevgep159, %A
  %found.conflict165 = and i1 %bound0163, %bound1164
  %ind.end172 = or i64 %n.vec154, 1
  %cmp.n173 = icmp eq i64 %3, %n.vec154
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.inc33.us
  %inc3411.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.body.us.preheader ]
  br i1 %min.iters.check151, label %for.inc.us.preheader, label %min.iters.checked152

for.inc.us.preheader:                             ; preds = %middle.block149, %vector.memcheck167, %min.iters.checked152, %for.body.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck167 ], [ 1, %min.iters.checked152 ], [ 1, %for.body.us ], [ %ind.end172, %middle.block149 ]
  %5 = sub nsw i64 %4, %indvars.iv.ph
  %xtraiter186 = and i64 %5, 1
  %lcmp.mod187 = icmp eq i64 %xtraiter186, 0
  br i1 %lcmp.mod187, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

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

min.iters.checked152:                             ; preds = %for.body.us
  br i1 %cmp.zero155, label %for.inc.us.preheader, label %vector.memcheck167

vector.memcheck167:                               ; preds = %min.iters.checked152
  br i1 %found.conflict165, label %for.inc.us.preheader, label %vector.body148.preheader

vector.body148.preheader:                         ; preds = %vector.memcheck167
  br label %vector.body148

vector.body148:                                   ; preds = %vector.body148.preheader, %vector.body148
  %index169 = phi i64 [ %index.next170, %vector.body148 ], [ 0, %vector.body148.preheader ]
  %offset.idx174 = or i64 %index169, 1
  %11 = getelementptr inbounds double, double* %A, i64 %index169
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load179 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = getelementptr inbounds double, double* %A, i64 %offset.idx174
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load180 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load181 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fadd <2 x double> %wide.load, %wide.load180
  %20 = fadd <2 x double> %wide.load179, %wide.load181
  %21 = add nuw nsw i64 %offset.idx174, 1
  %22 = getelementptr inbounds double, double* %A, i64 %21
  %23 = getelementptr double, double* %22, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load183 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %19, %wide.load179
  %26 = fadd <2 x double> %20, %wide.load183
  %27 = fmul <2 x double> %25, <double 3.333300e-01, double 3.333300e-01>
  %28 = fmul <2 x double> %26, <double 3.333300e-01, double 3.333300e-01>
  %29 = getelementptr inbounds double, double* %B, i64 %offset.idx174
  %30 = bitcast double* %29 to <2 x double>*
  store <2 x double> %27, <2 x double>* %30, align 8, !alias.scope !4, !noalias !1
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x double>*
  store <2 x double> %28, <2 x double>* %32, align 8, !alias.scope !4, !noalias !1
  %index.next170 = add i64 %index169, 4
  %33 = icmp eq i64 %index.next170, %n.vec154
  br i1 %33, label %middle.block149, label %vector.body148, !llvm.loop !6

middle.block149:                                  ; preds = %vector.body148
  br i1 %cmp.n173, label %for.inc30.us.preheader, label %for.inc.us.preheader

for.inc33.us.loopexit:                            ; preds = %for.inc30.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block104, %for.inc30.us.prol.loopexit
  %inc34.us = add nuw nsw i32 %inc3411.us, 1
  %exitcond = icmp ne i32 %inc34.us, %tsteps
  br i1 %exitcond, label %for.body.us, label %for.end35.loopexit

for.inc30.us:                                     ; preds = %for.inc30.us.preheader185, %for.inc30.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc30.us ], [ %indvars.iv63.ph, %for.inc30.us.preheader185 ]
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
  %exitcond.1188 = icmp eq i64 %indvars.iv.next.1, %sub
  br i1 %exitcond.1188, label %for.inc30.us.preheader.loopexit.unr-lcssa, label %for.inc.us, !llvm.loop !10

for.inc30.us.preheader.loopexit.unr-lcssa:        ; preds = %for.inc.us
  br label %for.inc30.us.preheader.loopexit

for.inc30.us.preheader.loopexit:                  ; preds = %for.inc.us.prol.loopexit.unr-lcssa, %for.inc30.us.preheader.loopexit.unr-lcssa
  br label %for.inc30.us.preheader

for.inc30.us.preheader:                           ; preds = %for.inc30.us.preheader.loopexit, %middle.block149
  br i1 %lcmp.mod, label %for.inc30.us.prol.loopexit, label %for.inc30.us.prol

for.inc30.us.prol:                                ; preds = %for.inc30.us.preheader
  %48 = load double, double* %B, align 8
  %49 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %48, %49
  %50 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %50
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.inc30.us.prol.loopexit

for.inc30.us.prol.loopexit:                       ; preds = %for.inc30.us.prol, %for.inc30.us.preheader
  %indvars.iv63.unr.ph = phi i64 [ 2, %for.inc30.us.prol ], [ 1, %for.inc30.us.preheader ]
  br i1 %1, label %for.inc33.us, label %for.inc30.us.preheader80

for.inc30.us.preheader80:                         ; preds = %for.inc30.us.prol.loopexit
  %51 = sub nsw i64 %2, %indvars.iv63.unr.ph
  %52 = lshr i64 %51, 1
  %53 = add nuw i64 %52, 1
  %min.iters.check106 = icmp ult i64 %53, 2
  br i1 %min.iters.check106, label %for.inc30.us.preheader185, label %min.iters.checked107

for.inc30.us.preheader185:                        ; preds = %middle.block104, %vector.memcheck127, %min.iters.checked107, %for.inc30.us.preheader80
  %indvars.iv63.ph = phi i64 [ %indvars.iv63.unr.ph, %vector.memcheck127 ], [ %indvars.iv63.unr.ph, %min.iters.checked107 ], [ %indvars.iv63.unr.ph, %for.inc30.us.preheader80 ], [ %ind.end132, %middle.block104 ]
  br label %for.inc30.us

min.iters.checked107:                             ; preds = %for.inc30.us.preheader80
  %n.mod.vf108 = and i64 %53, 1
  %n.vec109 = sub i64 %53, %n.mod.vf108
  %cmp.zero110 = icmp eq i64 %n.vec109, 0
  br i1 %cmp.zero110, label %for.inc30.us.preheader185, label %vector.memcheck127

vector.memcheck127:                               ; preds = %min.iters.checked107
  %scevgep112 = getelementptr double, double* %A, i64 %indvars.iv63.unr.ph
  %54 = shl nuw i64 %52, 1
  %55 = add i64 %indvars.iv63.unr.ph, %54
  %scevgep115 = getelementptr double, double* %scevgep114, i64 %55
  %scevgep118 = getelementptr double, double* %scevgep117, i64 %indvars.iv63.unr.ph
  %scevgep121 = getelementptr double, double* %scevgep120, i64 %55
  %bound0123 = icmp ult double* %scevgep112, %scevgep121
  %bound1124 = icmp ult double* %scevgep118, %scevgep115
  %found.conflict125 = and i1 %bound0123, %bound1124
  %56 = add nuw nsw i64 %indvars.iv63.unr.ph, 2
  %57 = add i64 %56, %54
  %58 = shl nuw nsw i64 %n.mod.vf108, 1
  %ind.end132 = sub i64 %57, %58
  br i1 %found.conflict125, label %for.inc30.us.preheader185, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %vector.memcheck127
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index129 = phi i64 [ %index.next130, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %59 = shl i64 %index129, 1
  %offset.idx134 = or i64 %indvars.iv63.unr.ph, %59
  %60 = add nsw i64 %offset.idx134, -1
  %61 = getelementptr inbounds double, double* %B, i64 %60
  %62 = bitcast double* %61 to <4 x double>*
  %wide.vec138 = load <4 x double>, <4 x double>* %62, align 8, !alias.scope !11
  %strided.vec139 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec140 = shufflevector <4 x double> %wide.vec138, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %63 = fadd <2 x double> %strided.vec139, %strided.vec140
  %64 = add nuw nsw i64 %offset.idx134, 1
  %65 = getelementptr inbounds double, double* %B, i64 %64
  %66 = getelementptr double, double* %65, i64 -1
  %67 = bitcast double* %66 to <4 x double>*
  %wide.vec141 = load <4 x double>, <4 x double>* %67, align 8, !alias.scope !11
  %strided.vec143 = shufflevector <4 x double> %wide.vec141, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %68 = fadd <2 x double> %63, %strided.vec143
  %69 = fmul <2 x double> %68, <double 3.333300e-01, double 3.333300e-01>
  %70 = bitcast double* %65 to <4 x double>*
  %wide.vec144 = load <4 x double>, <4 x double>* %70, align 8, !alias.scope !11
  %strided.vec146 = shufflevector <4 x double> %wide.vec144, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %71 = fadd <4 x double> %wide.vec141, %wide.vec144
  %72 = shufflevector <4 x double> %71, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %73 = fadd <2 x double> %72, %strided.vec146
  %74 = fmul <2 x double> %73, <double 3.333300e-01, double 3.333300e-01>
  %75 = getelementptr inbounds double, double* %A, i64 %64
  %76 = getelementptr double, double* %75, i64 -1
  %77 = bitcast double* %76 to <4 x double>*
  %interleaved.vec147 = shufflevector <2 x double> %69, <2 x double> %74, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec147, <4 x double>* %77, align 8, !alias.scope !14, !noalias !11
  %index.next130 = add i64 %index129, 2
  %78 = icmp eq i64 %index.next130, %n.vec109
  br i1 %78, label %middle.block104, label %vector.body103, !llvm.loop !16

middle.block104:                                  ; preds = %vector.body103
  %cmp.n133 = icmp eq i64 %n.mod.vf108, 0
  br i1 %cmp.n133, label %for.inc33.us, label %for.inc30.us.preheader185

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.lr.ph, %for.inc
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
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body, label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.inc
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
!10 = distinct !{!10, !7, !8}
!11 = !{!12}
!12 = distinct !{!12, !13}
!13 = distinct !{!13, !"LVerDomain"}
!14 = !{!15}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !7, !8}

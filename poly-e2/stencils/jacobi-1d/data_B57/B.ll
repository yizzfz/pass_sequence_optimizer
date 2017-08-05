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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
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
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 2000, double* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %A, double* nocapture %B) unnamed_addr #2 {
entry:
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %1 = insertelement <2 x double> undef, double %conv1, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %1, <2 x double> undef, <2 x i32> zeroinitializer
  %xtraiter = and i64 %0, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body.lr.ph.for.body.prol.loopexit_crit_edge, label %for.body.prol.preheader

for.body.lr.ph.for.body.prol.loopexit_crit_edge:  ; preds = %for.body.lr.ph
  br label %for.body.prol.loopexit

for.body.prol.preheader:                          ; preds = %for.body.lr.ph
  %div.prol = fdiv <2 x double> <double 2.000000e+00, double 3.000000e+00>, %div.v.i1.2
  %div.v.r1.prol = extractelement <2 x double> %div.prol, i32 0
  %div.v.r2.prol = extractelement <2 x double> %div.prol, i32 1
  store double %div.v.r1.prol, double* %A, align 8
  store double %div.v.r2.prol, double* %B, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.lr.ph.for.body.prol.loopexit_crit_edge, %for.body.prol.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body.lr.ph.for.body.prol.loopexit_crit_edge ], [ 1, %for.body.prol.preheader ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.body.prol.loopexit.for.end.loopexit_crit_edge, label %for.body.lr.ph.new

for.body.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.body.prol.loopexit
  br label %for.end.loopexit

for.body.lr.ph.new:                               ; preds = %for.body.prol.loopexit
  br label %for.body

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.body.lr.ph.new ], [ %indvars.iv.next.1, %for.body.for.body_crit_edge ]
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
  %cmp.1 = icmp slt i64 %indvars.iv.next.1, %0
  br i1 %cmp.1, label %for.body.for.body_crit_edge, label %for.end.loopexit.unr-lcssa

for.body.for.body_crit_edge:                      ; preds = %for.body
  br label %for.body

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
  %cmp8 = icmp sgt i32 %tsteps, 0
  br i1 %cmp8, label %for.body.lr.ph, label %entry.for.end35_crit_edge

entry.for.end35_crit_edge:                        ; preds = %entry
  br label %for.end35

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  %sub1 = add nsw i32 %n, -1
  %sub = add nsw i64 %0, -1
  %cmp22 = icmp sgt i32 %sub1, 1
  %1 = and i32 %sub1, 1
  %lcmp.mod = icmp eq i32 %1, 0
  %arrayidx21.prol = getelementptr double, double* %B, i64 1
  %arrayidx25.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.prol = getelementptr inbounds double, double* %A, i64 1
  %2 = icmp eq i32 %sub1, 2
  %wide.trip.count.1 = zext i32 %sub1 to i64
  %3 = add nsw i64 %wide.trip.count.1, -2
  %scevgep17 = getelementptr double, double* %A, i64 2
  %scevgep20 = getelementptr double, double* %B, i64 -1
  %scevgep23 = getelementptr double, double* %B, i64 3
  %4 = add nsw i64 %0, -2
  %scevgep44 = getelementptr double, double* %B, i64 %sub
  %scevgep46 = getelementptr double, double* %A, i64 %0
  %5 = add nsw i64 %0, 1
  %min.iters.check36 = icmp ult i64 %4, 4
  %n.vec39 = and i64 %4, -4
  %cmp.zero40 = icmp eq i64 %n.vec39, 0
  %bound048 = icmp ult double* %arrayidx21.prol, %scevgep46
  %bound149 = icmp ugt double* %scevgep44, %A
  %found.conflict50 = and i1 %bound048, %bound149
  %ind.end57 = or i64 %n.vec39, 1
  %cmp.n58 = icmp eq i64 %4, %n.vec39
  br label %for.body

for.body:                                         ; preds = %for.inc33.for.body_crit_edge, %for.body.lr.ph
  %inc3411 = phi i32 [ 0, %for.body.lr.ph ], [ %inc34, %for.inc33.for.body_crit_edge ]
  br i1 %cmp22, label %for.body3.preheader, label %for.body.for.inc33_crit_edge

for.body.for.inc33_crit_edge:                     ; preds = %for.body
  br label %for.inc33

for.body3.preheader:                              ; preds = %for.body
  br i1 %min.iters.check36, label %for.body3.preheader.for.body3.preheader70_crit_edge, label %min.iters.checked37

for.body3.preheader.for.body3.preheader70_crit_edge: ; preds = %for.body3.preheader
  br label %for.body3.preheader70

min.iters.checked37:                              ; preds = %for.body3.preheader
  br i1 %cmp.zero40, label %min.iters.checked37.for.body3.preheader70_crit_edge, label %vector.memcheck52

min.iters.checked37.for.body3.preheader70_crit_edge: ; preds = %min.iters.checked37
  br label %for.body3.preheader70

vector.memcheck52:                                ; preds = %min.iters.checked37
  br i1 %found.conflict50, label %vector.memcheck52.for.body3.preheader70_crit_edge, label %vector.body33.preheader

vector.memcheck52.for.body3.preheader70_crit_edge: ; preds = %vector.memcheck52
  br label %for.body3.preheader70

vector.body33.preheader:                          ; preds = %vector.memcheck52
  br label %vector.body33

vector.body33:                                    ; preds = %vector.body33.vector.body33_crit_edge, %vector.body33.preheader
  %index54 = phi i64 [ %index.next55, %vector.body33.vector.body33_crit_edge ], [ 0, %vector.body33.preheader ]
  %offset.idx59 = or i64 %index54, 1
  %6 = getelementptr inbounds double, double* %A, i64 %index54
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr double, double* %6, i64 2
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = getelementptr inbounds double, double* %A, i64 %offset.idx59
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load, %wide.load65
  %15 = fadd <2 x double> %wide.load64, %wide.load66
  %16 = add nuw nsw i64 %offset.idx59, 1
  %17 = getelementptr inbounds double, double* %A, i64 %16
  %18 = getelementptr double, double* %17, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %14, %wide.load64
  %21 = fadd <2 x double> %15, %wide.load68
  %22 = fmul <2 x double> %20, <double 3.333300e-01, double 3.333300e-01>
  %23 = fmul <2 x double> %21, <double 3.333300e-01, double 3.333300e-01>
  %24 = getelementptr inbounds double, double* %B, i64 %offset.idx59
  %25 = bitcast double* %24 to <2 x double>*
  store <2 x double> %22, <2 x double>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x double>*
  store <2 x double> %23, <2 x double>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next55 = add i64 %index54, 4
  %28 = icmp eq i64 %index.next55, %n.vec39
  br i1 %28, label %middle.block34, label %vector.body33.vector.body33_crit_edge, !llvm.loop !6

vector.body33.vector.body33_crit_edge:            ; preds = %vector.body33
  br label %vector.body33

middle.block34:                                   ; preds = %vector.body33
  br i1 %cmp.n58, label %middle.block34.for.end_crit_edge, label %middle.block34.for.body3.preheader70_crit_edge

middle.block34.for.body3.preheader70_crit_edge:   ; preds = %middle.block34
  br label %for.body3.preheader70

middle.block34.for.end_crit_edge:                 ; preds = %middle.block34
  br label %for.end

for.body3.preheader70:                            ; preds = %middle.block34.for.body3.preheader70_crit_edge, %vector.memcheck52.for.body3.preheader70_crit_edge, %min.iters.checked37.for.body3.preheader70_crit_edge, %for.body3.preheader.for.body3.preheader70_crit_edge
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck52.for.body3.preheader70_crit_edge ], [ 1, %min.iters.checked37.for.body3.preheader70_crit_edge ], [ 1, %for.body3.preheader.for.body3.preheader70_crit_edge ], [ %ind.end57, %middle.block34.for.body3.preheader70_crit_edge ]
  %29 = sub nsw i64 %5, %indvars.iv.ph
  %xtraiter = and i64 %29, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod71, label %for.body3.preheader70.for.body3.prol.loopexit.unr-lcssa_crit_edge, label %for.body3.prol.preheader

for.body3.preheader70.for.body3.prol.loopexit.unr-lcssa_crit_edge: ; preds = %for.body3.preheader70
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.preheader:                         ; preds = %for.body3.preheader70
  %30 = add nsw i64 %indvars.iv.ph, -1
  %arrayidx.prol = getelementptr inbounds double, double* %A, i64 %30
  %31 = load double, double* %arrayidx.prol, align 8
  %arrayidx6.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.ph
  %32 = load double, double* %arrayidx6.prol, align 8
  %add.prol = fadd double %31, %32
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  %arrayidx9.prol = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.prol
  %33 = load double, double* %arrayidx9.prol, align 8
  %add10.prol = fadd double %add.prol, %33
  %mul.prol = fmul double %add10.prol, 3.333300e-01
  %arrayidx12.prol = getelementptr inbounds double, double* %B, i64 %indvars.iv.ph
  store double %mul.prol, double* %arrayidx12.prol, align 8
  br label %for.body3.prol.loopexit.unr-lcssa

for.body3.prol.loopexit.unr-lcssa:                ; preds = %for.body3.preheader70.for.body3.prol.loopexit.unr-lcssa_crit_edge, %for.body3.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.body3.prol.preheader ], [ %indvars.iv.ph, %for.body3.preheader70.for.body3.prol.loopexit.unr-lcssa_crit_edge ]
  %34 = icmp eq i64 %4, %indvars.iv.ph
  br i1 %34, label %for.body3.prol.loopexit.for.end.loopexit_crit_edge, label %for.body3.preheader70.new

for.body3.prol.loopexit.for.end.loopexit_crit_edge: ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.end.loopexit

for.body3.preheader70.new:                        ; preds = %for.body3.prol.loopexit.unr-lcssa
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader70.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.preheader70.new ], [ %indvars.iv.next.1, %for.body3.for.body3_crit_edge ]
  %35 = add nsw i64 %indvars.iv, -1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %35
  %36 = load double, double* %arrayidx, align 8
  %arrayidx6 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %37 = load double, double* %arrayidx6, align 8
  %add = fadd double %36, %37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %38 = load double, double* %arrayidx9, align 8
  %add10 = fadd double %add, %38
  %mul = fmul double %add10, 3.333300e-01
  %arrayidx12 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul, double* %arrayidx12, align 8
  %39 = load double, double* %arrayidx6, align 8
  %40 = load double, double* %arrayidx9, align 8
  %add.1 = fadd double %39, %40
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %41 = load double, double* %arrayidx9.1, align 8
  %add10.1 = fadd double %add.1, %41
  %mul.1 = fmul double %add10.1, 3.333300e-01
  %arrayidx12.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.1, double* %arrayidx12.1, align 8
  %exitcond.172 = icmp eq i64 %indvars.iv.next.1, %sub
  br i1 %exitcond.172, label %for.end.loopexit.unr-lcssa, label %for.body3.for.body3_crit_edge, !llvm.loop !9

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  br label %for.body3

for.end.loopexit.unr-lcssa:                       ; preds = %for.body3
  br label %for.end.loopexit

for.end.loopexit:                                 ; preds = %for.body3.prol.loopexit.for.end.loopexit_crit_edge, %for.end.loopexit.unr-lcssa
  br label %for.end

for.end:                                          ; preds = %middle.block34.for.end_crit_edge, %for.end.loopexit
  br i1 true, label %for.body16.lr.ph, label %for.end.for.inc33_crit_edge

for.end.for.inc33_crit_edge:                      ; preds = %for.end
  br label %for.inc33

for.body16.lr.ph:                                 ; preds = %for.end
  br i1 %lcmp.mod, label %for.body16.prol, label %for.body16.lr.ph.for.body16.prol.loopexit_crit_edge

for.body16.lr.ph.for.body16.prol.loopexit_crit_edge: ; preds = %for.body16.lr.ph
  br label %for.body16.prol.loopexit

for.body16.prol:                                  ; preds = %for.body16.lr.ph
  %42 = load double, double* %B, align 8
  %43 = load double, double* %arrayidx21.prol, align 8
  %add22.prol = fadd double %42, %43
  %44 = load double, double* %arrayidx25.prol, align 8
  %add26.prol = fadd double %add22.prol, %44
  %mul27.prol = fmul double %add26.prol, 3.333300e-01
  store double %mul27.prol, double* %arrayidx29.prol, align 8
  br label %for.body16.prol.loopexit

for.body16.prol.loopexit:                         ; preds = %for.body16.lr.ph.for.body16.prol.loopexit_crit_edge, %for.body16.prol
  %indvars.iv13.unr.ph = phi i64 [ 2, %for.body16.prol ], [ 1, %for.body16.lr.ph.for.body16.prol.loopexit_crit_edge ]
  br i1 %2, label %for.body16.prol.loopexit.for.inc33_crit_edge, label %for.body16.preheader

for.body16.prol.loopexit.for.inc33_crit_edge:     ; preds = %for.body16.prol.loopexit
  br label %for.inc33

for.body16.preheader:                             ; preds = %for.body16.prol.loopexit
  %45 = sub nsw i64 %3, %indvars.iv13.unr.ph
  %46 = lshr i64 %45, 1
  %47 = add nuw i64 %46, 1
  %min.iters.check = icmp ult i64 %47, 2
  br i1 %min.iters.check, label %for.body16.preheader.for.body16.preheader69_crit_edge, label %min.iters.checked

for.body16.preheader.for.body16.preheader69_crit_edge: ; preds = %for.body16.preheader
  br label %for.body16.preheader69

min.iters.checked:                                ; preds = %for.body16.preheader
  %n.mod.vf = and i64 %47, 1
  %n.vec = sub i64 %47, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %min.iters.checked.for.body16.preheader69_crit_edge, label %vector.memcheck

min.iters.checked.for.body16.preheader69_crit_edge: ; preds = %min.iters.checked
  br label %for.body16.preheader69

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv13.unr.ph
  %48 = shl nuw i64 %46, 1
  %49 = add i64 %indvars.iv13.unr.ph, %48
  %scevgep18 = getelementptr double, double* %scevgep17, i64 %49
  %scevgep21 = getelementptr double, double* %scevgep20, i64 %indvars.iv13.unr.ph
  %scevgep24 = getelementptr double, double* %scevgep23, i64 %49
  %bound0 = icmp ult double* %scevgep, %scevgep24
  %bound1 = icmp ult double* %scevgep21, %scevgep18
  %found.conflict = and i1 %bound0, %bound1
  %50 = add nuw nsw i64 %indvars.iv13.unr.ph, 2
  %51 = add i64 %50, %48
  %52 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %51, %52
  br i1 %found.conflict, label %vector.memcheck.for.body16.preheader69_crit_edge, label %vector.body.preheader

vector.memcheck.for.body16.preheader69_crit_edge: ; preds = %vector.memcheck
  br label %for.body16.preheader69

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %53 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv13.unr.ph, %53
  %54 = add nsw i64 %offset.idx, -1
  %55 = getelementptr inbounds double, double* %B, i64 %54
  %56 = bitcast double* %55 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %56, align 8, !alias.scope !10
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec26 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %57 = fadd <2 x double> %strided.vec, %strided.vec26
  %58 = add nuw nsw i64 %offset.idx, 1
  %59 = getelementptr inbounds double, double* %B, i64 %58
  %60 = getelementptr double, double* %59, i64 -1
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec27 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !10
  %strided.vec29 = shufflevector <4 x double> %wide.vec27, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fadd <2 x double> %57, %strided.vec29
  %63 = fmul <2 x double> %62, <double 3.333300e-01, double 3.333300e-01>
  %64 = bitcast double* %59 to <4 x double>*
  %wide.vec30 = load <4 x double>, <4 x double>* %64, align 8, !alias.scope !10
  %strided.vec32 = shufflevector <4 x double> %wide.vec30, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %65 = fadd <4 x double> %wide.vec27, %wide.vec30
  %66 = shufflevector <4 x double> %65, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %67 = fadd <2 x double> %66, %strided.vec32
  %68 = fmul <2 x double> %67, <double 3.333300e-01, double 3.333300e-01>
  %69 = getelementptr inbounds double, double* %A, i64 %58
  %70 = getelementptr double, double* %69, i64 -1
  %71 = bitcast double* %70 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %63, <2 x double> %68, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %71, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %72 = icmp eq i64 %index.next, %n.vec
  br i1 %72, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.for.inc33_crit_edge, label %middle.block.for.body16.preheader69_crit_edge

middle.block.for.body16.preheader69_crit_edge:    ; preds = %middle.block
  br label %for.body16.preheader69

middle.block.for.inc33_crit_edge:                 ; preds = %middle.block
  br label %for.inc33

for.body16.preheader69:                           ; preds = %middle.block.for.body16.preheader69_crit_edge, %vector.memcheck.for.body16.preheader69_crit_edge, %min.iters.checked.for.body16.preheader69_crit_edge, %for.body16.preheader.for.body16.preheader69_crit_edge
  %indvars.iv13.ph = phi i64 [ %indvars.iv13.unr.ph, %vector.memcheck.for.body16.preheader69_crit_edge ], [ %indvars.iv13.unr.ph, %min.iters.checked.for.body16.preheader69_crit_edge ], [ %indvars.iv13.unr.ph, %for.body16.preheader.for.body16.preheader69_crit_edge ], [ %ind.end, %middle.block.for.body16.preheader69_crit_edge ]
  br label %for.body16

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.preheader69
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %for.body16.for.body16_crit_edge ], [ %indvars.iv13.ph, %for.body16.preheader69 ]
  %73 = add nsw i64 %indvars.iv13, -1
  %arrayidx19 = getelementptr inbounds double, double* %B, i64 %73
  %74 = load double, double* %arrayidx19, align 8
  %arrayidx21 = getelementptr inbounds double, double* %B, i64 %indvars.iv13
  %75 = load double, double* %arrayidx21, align 8
  %add22 = fadd double %74, %75
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %arrayidx25 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next14
  %76 = load double, double* %arrayidx25, align 8
  %add26 = fadd double %add22, %76
  %mul27 = fmul double %add26, 3.333300e-01
  %arrayidx29 = getelementptr inbounds double, double* %A, i64 %indvars.iv13
  store double %mul27, double* %arrayidx29, align 8
  %77 = load double, double* %arrayidx21, align 8
  %78 = load double, double* %arrayidx25, align 8
  %add22.1 = fadd double %77, %78
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %arrayidx25.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next14.1
  %79 = load double, double* %arrayidx25.1, align 8
  %add26.1 = fadd double %add22.1, %79
  %mul27.1 = fmul double %add26.1, 3.333300e-01
  %arrayidx29.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next14
  store double %mul27.1, double* %arrayidx29.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.inc33.loopexit, label %for.body16.for.body16_crit_edge, !llvm.loop !16

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  br label %for.body16

for.inc33.loopexit:                               ; preds = %for.body16
  br label %for.inc33

for.inc33:                                        ; preds = %middle.block.for.inc33_crit_edge, %for.body16.prol.loopexit.for.inc33_crit_edge, %for.end.for.inc33_crit_edge, %for.body.for.inc33_crit_edge, %for.inc33.loopexit
  %inc34 = add nsw i32 %inc3411, 1
  %cmp = icmp slt i32 %inc34, %tsteps
  br i1 %cmp, label %for.inc33.for.body_crit_edge, label %for.end35.loopexit

for.inc33.for.body_crit_edge:                     ; preds = %for.inc33
  br label %for.body

for.end35.loopexit:                               ; preds = %for.inc33
  br label %for.end35

for.end35:                                        ; preds = %entry.for.end35_crit_edge, %for.end35.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.lr.ph, label %entry.for.end_crit_edge

entry.for.end_crit_edge:                          ; preds = %entry
  br label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end.for.body_crit_edge, %for.body.lr.ph
  %indvars.iv = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next, %if.end.for.body_crit_edge ]
  %4 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %4, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  br label %if.end

if.then:                                          ; preds = %for.body
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %7 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp, label %if.end.for.body_crit_edge, label %for.end.loopexit

if.end.for.body_crit_edge:                        ; preds = %if.end
  br label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %entry.for.end_crit_edge, %for.end.loopexit
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

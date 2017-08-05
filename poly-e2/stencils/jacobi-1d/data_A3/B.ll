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
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %min.iters.check = icmp eq i32 %n, 1
  br i1 %min.iters.check, label %for.body.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body.lr.ph
  %0 = and i32 %n, 1
  %n.mod.vf = zext i32 %0 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %wide.trip.count
  %scevgep13 = getelementptr double, double* %B, i64 %wide.trip.count
  %bound0 = icmp ugt double* %scevgep13, %A
  %bound1 = icmp ugt double* %scevgep, %B
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %conv1, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind15 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next16, %vector.body ]
  %1 = sitofp <2 x i32> %vec.ind15 to <2 x double>
  %2 = fadd <2 x double> %1, <double 2.000000e+00, double 2.000000e+00>
  %3 = fdiv <2 x double> %2, %broadcast.splat
  %4 = getelementptr inbounds double, double* %A, i64 %index
  %5 = bitcast double* %4 to <2 x double>*
  store <2 x double> %3, <2 x double>* %5, align 8, !alias.scope !1, !noalias !4
  %6 = fadd <2 x double> %1, <double 3.000000e+00, double 3.000000e+00>
  %7 = fdiv <2 x double> %6, %broadcast.splat
  %8 = getelementptr inbounds double, double* %B, i64 %index
  %9 = bitcast double* %8 to <2 x double>*
  store <2 x double> %7, <2 x double>* %9, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next16 = add <2 x i32> %vec.ind15, <i32 2, i32 2>
  %10 = icmp eq i64 %index.next, %n.vec
  br i1 %10, label %middle.block, label %vector.body, !llvm.loop !6

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i32 %0, 0
  br i1 %cmp.n, label %for.end, label %for.body.preheader

for.body.preheader:                               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body.lr.ph ], [ %n.vec, %middle.block ]
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %for.body
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body ], [ %indvars.iv.ph, %for.body.preheader ]
  %11 = trunc i64 %indvars.iv to i32
  %conv = sitofp i32 %11 to double
  %add = fadd double %conv, 2.000000e+00
  %div = fdiv double %add, %conv1
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  store double %div, double* %arrayidx, align 8
  %add3 = fadd double %conv, 3.000000e+00
  %div5 = fdiv double %add3, %conv1
  %arrayidx7 = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %div5, double* %arrayidx7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body, !llvm.loop !9

for.end.loopexit:                                 ; preds = %for.body
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %middle.block, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32 %tsteps, i32 %n, double* %A, double* %B) unnamed_addr #2 {
entry:
  %cmp24 = icmp sgt i32 %tsteps, 0
  br i1 %cmp24, label %for.cond1.preheader.lr.ph, label %for.end35

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp220 = icmp sgt i32 %sub, 1
  br i1 %cmp220, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %tsteps, -1
  %xtraiter115 = and i32 %tsteps, 7
  %lcmp.mod116 = icmp eq i32 %xtraiter115, 0
  br i1 %lcmp.mod116, label %for.cond1.preheader.prol.loopexit, label %for.cond1.preheader.prol.preheader

for.cond1.preheader.prol.preheader:               ; preds = %for.cond1.preheader.preheader
  br label %for.cond1.preheader.prol

for.cond1.preheader.prol:                         ; preds = %for.cond1.preheader.prol, %for.cond1.preheader.prol.preheader
  %t.025.prol = phi i32 [ %inc34.prol, %for.cond1.preheader.prol ], [ 0, %for.cond1.preheader.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond1.preheader.prol ], [ %xtraiter115, %for.cond1.preheader.prol.preheader ]
  %inc34.prol = add nuw nsw i32 %t.025.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond1.preheader.prol.loopexit.unr-lcssa, label %for.cond1.preheader.prol, !llvm.loop !10

for.cond1.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond1.preheader.prol
  br label %for.cond1.preheader.prol.loopexit

for.cond1.preheader.prol.loopexit:                ; preds = %for.cond1.preheader.preheader, %for.cond1.preheader.prol.loopexit.unr-lcssa
  %t.025.unr = phi i32 [ 0, %for.cond1.preheader.preheader ], [ %inc34.prol, %for.cond1.preheader.prol.loopexit.unr-lcssa ]
  %1 = icmp ult i32 %0, 7
  br i1 %1, label %for.end35.loopexit114, label %for.cond1.preheader.preheader.new

for.cond1.preheader.preheader.new:                ; preds = %for.cond1.preheader.prol.loopexit
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %n, -2
  %3 = add i32 %n, -3
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %3, 0
  %xtraiter32 = and i32 %2, 1
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  %5 = icmp eq i32 %3, 0
  %wide.trip.count31.1 = zext i32 %sub to i64
  %arrayidx21.us.prol = getelementptr inbounds double, double* %B, i64 1
  %arrayidx25.us.prol = getelementptr inbounds double, double* %B, i64 2
  %arrayidx29.us.prol = getelementptr inbounds double, double* %A, i64 1
  %wide.trip.count.1 = zext i32 %sub to i64
  %arrayidx6.us.prol = getelementptr inbounds double, double* %A, i64 1
  %arrayidx9.us.prol = getelementptr inbounds double, double* %A, i64 2
  %arrayidx12.us.prol = getelementptr inbounds double, double* %B, i64 1
  %6 = add nsw i64 %wide.trip.count31.1, -2
  %scevgep51 = getelementptr double, double* %A, i64 2
  %7 = add nsw i64 %wide.trip.count31.1, -2
  %scevgep54 = getelementptr double, double* %B, i64 -1
  %scevgep57 = getelementptr double, double* %B, i64 3
  %8 = add nsw i64 %wide.trip.count31.1, -2
  %scevgep78 = getelementptr double, double* %B, i64 2
  %9 = add nsw i64 %wide.trip.count31.1, -2
  %scevgep81 = getelementptr double, double* %A, i64 -1
  %scevgep84 = getelementptr double, double* %A, i64 3
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc33.us, %for.cond1.preheader.us.preheader
  %t.025.us = phi i32 [ %inc34.us, %for.inc33.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %10 = load double, double* %A, align 8
  %11 = load double, double* %arrayidx6.us.prol, align 8
  %add.us.prol = fadd double %10, %11
  %12 = load double, double* %arrayidx9.us.prol, align 8
  %add10.us.prol = fadd double %add.us.prol, %12
  %mul.us.prol = fmul double %add10.us.prol, 3.333300e-01
  store double %mul.us.prol, double* %arrayidx12.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 2, %for.body3.us.prol ], [ 1, %for.cond1.preheader.us ]
  br i1 %4, label %for.body16.us.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %13 = sub nsw i64 %8, %indvars.iv.unr.ph
  %14 = lshr i64 %13, 1
  %15 = add nuw i64 %14, 1
  %min.iters.check70 = icmp ult i64 %15, 2
  br i1 %min.iters.check70, label %for.body3.us.preheader113, label %min.iters.checked71

for.body3.us.preheader113:                        ; preds = %middle.block68, %vector.memcheck91, %min.iters.checked71, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck91 ], [ %indvars.iv.unr.ph, %min.iters.checked71 ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ], [ %ind.end96, %middle.block68 ]
  br label %for.body3.us

min.iters.checked71:                              ; preds = %for.body3.us.preheader
  %n.mod.vf72 = and i64 %15, 1
  %n.vec73 = sub i64 %15, %n.mod.vf72
  %cmp.zero74 = icmp eq i64 %n.vec73, 0
  br i1 %cmp.zero74, label %for.body3.us.preheader113, label %vector.memcheck91

vector.memcheck91:                                ; preds = %min.iters.checked71
  %scevgep76 = getelementptr double, double* %B, i64 %indvars.iv.unr.ph
  %16 = sub nsw i64 %9, %indvars.iv.unr.ph
  %17 = and i64 %16, -2
  %18 = add nsw i64 %indvars.iv.unr.ph, %17
  %scevgep79 = getelementptr double, double* %scevgep78, i64 %18
  %scevgep82 = getelementptr double, double* %scevgep81, i64 %indvars.iv.unr.ph
  %scevgep85 = getelementptr double, double* %scevgep84, i64 %18
  %bound087 = icmp ult double* %scevgep76, %scevgep85
  %bound188 = icmp ult double* %scevgep82, %scevgep79
  %memcheck.conflict90 = and i1 %bound087, %bound188
  %19 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %20 = shl nuw i64 %14, 1
  %21 = add i64 %19, %20
  %22 = shl nuw nsw i64 %n.mod.vf72, 1
  %ind.end96 = sub i64 %21, %22
  br i1 %memcheck.conflict90, label %for.body3.us.preheader113, label %vector.body67.preheader

vector.body67.preheader:                          ; preds = %vector.memcheck91
  br label %vector.body67

vector.body67:                                    ; preds = %vector.body67.preheader, %vector.body67
  %index93 = phi i64 [ %index.next94, %vector.body67 ], [ 0, %vector.body67.preheader ]
  %23 = shl i64 %index93, 1
  %offset.idx98 = or i64 %indvars.iv.unr.ph, %23
  %24 = add nsw i64 %offset.idx98, -1
  %25 = getelementptr inbounds double, double* %A, i64 %24
  %26 = bitcast double* %25 to <4 x double>*
  %wide.vec102 = load <4 x double>, <4 x double>* %26, align 8, !alias.scope !12
  %strided.vec103 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec104 = shufflevector <4 x double> %wide.vec102, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %27 = fadd <2 x double> %strided.vec103, %strided.vec104
  %28 = add nuw nsw i64 %offset.idx98, 1
  %29 = getelementptr inbounds double, double* %A, i64 %28
  %30 = getelementptr double, double* %29, i64 -1
  %31 = bitcast double* %30 to <4 x double>*
  %wide.vec105 = load <4 x double>, <4 x double>* %31, align 8, !alias.scope !12
  %strided.vec107 = shufflevector <4 x double> %wide.vec105, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %32 = fadd <2 x double> %27, %strided.vec107
  %33 = fmul <2 x double> %32, <double 3.333300e-01, double 3.333300e-01>
  %34 = bitcast double* %29 to <4 x double>*
  %wide.vec108 = load <4 x double>, <4 x double>* %34, align 8, !alias.scope !12
  %strided.vec110 = shufflevector <4 x double> %wide.vec108, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %35 = fadd <4 x double> %wide.vec105, %wide.vec108
  %36 = shufflevector <4 x double> %35, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %37 = fadd <2 x double> %36, %strided.vec110
  %38 = fmul <2 x double> %37, <double 3.333300e-01, double 3.333300e-01>
  %39 = getelementptr inbounds double, double* %B, i64 %28
  %40 = getelementptr double, double* %39, i64 -1
  %41 = bitcast double* %40 to <4 x double>*
  %interleaved.vec111 = shufflevector <2 x double> %33, <2 x double> %38, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec111, <4 x double>* %41, align 8, !alias.scope !15, !noalias !12
  %index.next94 = add i64 %index93, 2
  %42 = icmp eq i64 %index.next94, %n.vec73
  br i1 %42, label %middle.block68, label %vector.body67, !llvm.loop !17

middle.block68:                                   ; preds = %vector.body67
  %cmp.n97 = icmp eq i64 %n.mod.vf72, 0
  br i1 %cmp.n97, label %for.body16.us.preheader, label %for.body3.us.preheader113

for.inc33.us.loopexit:                            ; preds = %for.body16.us
  br label %for.inc33.us

for.inc33.us:                                     ; preds = %for.inc33.us.loopexit, %middle.block, %for.body16.us.prol.loopexit
  %inc34.us = add nuw nsw i32 %t.025.us, 1
  %exitcond = icmp eq i32 %inc34.us, %tsteps
  br i1 %exitcond, label %for.end35.loopexit, label %for.cond1.preheader.us

for.body16.us:                                    ; preds = %for.body16.us.preheader112, %for.body16.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %for.body16.us ], [ %indvars.iv28.ph, %for.body16.us.preheader112 ]
  %43 = add nsw i64 %indvars.iv28, -1
  %arrayidx19.us = getelementptr inbounds double, double* %B, i64 %43
  %44 = load double, double* %arrayidx19.us, align 8
  %arrayidx21.us = getelementptr inbounds double, double* %B, i64 %indvars.iv28
  %45 = load double, double* %arrayidx21.us, align 8
  %add22.us = fadd double %44, %45
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %arrayidx25.us = getelementptr inbounds double, double* %B, i64 %indvars.iv.next29
  %46 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add22.us, %46
  %mul27.us = fmul double %add26.us, 3.333300e-01
  %arrayidx29.us = getelementptr inbounds double, double* %A, i64 %indvars.iv28
  store double %mul27.us, double* %arrayidx29.us, align 8
  %arrayidx19.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv28
  %47 = load double, double* %arrayidx19.us.1, align 8
  %arrayidx21.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next29
  %48 = load double, double* %arrayidx21.us.1, align 8
  %add22.us.1 = fadd double %47, %48
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %arrayidx25.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next29.1
  %49 = load double, double* %arrayidx25.us.1, align 8
  %add26.us.1 = fadd double %add22.us.1, %49
  %mul27.us.1 = fmul double %add26.us.1, 3.333300e-01
  %arrayidx29.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next29
  store double %mul27.us.1, double* %arrayidx29.us.1, align 8
  %exitcond.135 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count31.1
  br i1 %exitcond.135, label %for.inc33.us.loopexit, label %for.body16.us, !llvm.loop !18

for.body3.us:                                     ; preds = %for.body3.us.preheader113, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.ph, %for.body3.us.preheader113 ]
  %50 = add nsw i64 %indvars.iv, -1
  %arrayidx.us = getelementptr inbounds double, double* %A, i64 %50
  %51 = load double, double* %arrayidx.us, align 8
  %arrayidx6.us = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %52 = load double, double* %arrayidx6.us, align 8
  %add.us = fadd double %51, %52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx9.us = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %53 = load double, double* %arrayidx9.us, align 8
  %add10.us = fadd double %add.us, %53
  %mul.us = fmul double %add10.us, 3.333300e-01
  %arrayidx12.us = getelementptr inbounds double, double* %B, i64 %indvars.iv
  store double %mul.us, double* %arrayidx12.us, align 8
  %arrayidx.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %54 = load double, double* %arrayidx.us.1, align 8
  %arrayidx6.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next
  %55 = load double, double* %arrayidx6.us.1, align 8
  %add.us.1 = fadd double %54, %55
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx9.us.1 = getelementptr inbounds double, double* %A, i64 %indvars.iv.next.1
  %56 = load double, double* %arrayidx9.us.1, align 8
  %add10.us.1 = fadd double %add.us.1, %56
  %mul.us.1 = fmul double %add10.us.1, 3.333300e-01
  %arrayidx12.us.1 = getelementptr inbounds double, double* %B, i64 %indvars.iv.next
  store double %mul.us.1, double* %arrayidx12.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.body16.us.preheader.loopexit, label %for.body3.us, !llvm.loop !19

for.body16.us.preheader.loopexit:                 ; preds = %for.body3.us
  br label %for.body16.us.preheader

for.body16.us.preheader:                          ; preds = %for.body16.us.preheader.loopexit, %for.body3.us.prol.loopexit, %middle.block68
  br i1 %lcmp.mod33, label %for.body16.us.prol.loopexit, label %for.body16.us.prol

for.body16.us.prol:                               ; preds = %for.body16.us.preheader
  %57 = load double, double* %B, align 8
  %58 = load double, double* %arrayidx21.us.prol, align 8
  %add22.us.prol = fadd double %57, %58
  %59 = load double, double* %arrayidx25.us.prol, align 8
  %add26.us.prol = fadd double %add22.us.prol, %59
  %mul27.us.prol = fmul double %add26.us.prol, 3.333300e-01
  store double %mul27.us.prol, double* %arrayidx29.us.prol, align 8
  br label %for.body16.us.prol.loopexit

for.body16.us.prol.loopexit:                      ; preds = %for.body16.us.prol, %for.body16.us.preheader
  %indvars.iv28.unr.ph = phi i64 [ 2, %for.body16.us.prol ], [ 1, %for.body16.us.preheader ]
  br i1 %5, label %for.inc33.us, label %for.body16.us.preheader47

for.body16.us.preheader47:                        ; preds = %for.body16.us.prol.loopexit
  %60 = sub nsw i64 %6, %indvars.iv28.unr.ph
  %61 = lshr i64 %60, 1
  %62 = add nuw i64 %61, 1
  %min.iters.check = icmp ult i64 %62, 2
  br i1 %min.iters.check, label %for.body16.us.preheader112, label %min.iters.checked

for.body16.us.preheader112:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body16.us.preheader47
  %indvars.iv28.ph = phi i64 [ %indvars.iv28.unr.ph, %vector.memcheck ], [ %indvars.iv28.unr.ph, %min.iters.checked ], [ %indvars.iv28.unr.ph, %for.body16.us.preheader47 ], [ %ind.end, %middle.block ]
  br label %for.body16.us

min.iters.checked:                                ; preds = %for.body16.us.preheader47
  %n.mod.vf = and i64 %62, 1
  %n.vec = sub i64 %62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body16.us.preheader112, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep = getelementptr double, double* %A, i64 %indvars.iv28.unr.ph
  %63 = sub nsw i64 %7, %indvars.iv28.unr.ph
  %64 = and i64 %63, -2
  %65 = add nsw i64 %indvars.iv28.unr.ph, %64
  %scevgep52 = getelementptr double, double* %scevgep51, i64 %65
  %scevgep55 = getelementptr double, double* %scevgep54, i64 %indvars.iv28.unr.ph
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %65
  %bound0 = icmp ult double* %scevgep, %scevgep58
  %bound1 = icmp ult double* %scevgep55, %scevgep52
  %memcheck.conflict = and i1 %bound0, %bound1
  %66 = add nuw nsw i64 %indvars.iv28.unr.ph, 2
  %67 = shl nuw i64 %61, 1
  %68 = add i64 %66, %67
  %69 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %68, %69
  br i1 %memcheck.conflict, label %for.body16.us.preheader112, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %70 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv28.unr.ph, %70
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds double, double* %B, i64 %71
  %73 = bitcast double* %72 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %73, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec60 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %74 = fadd <2 x double> %strided.vec, %strided.vec60
  %75 = add nuw nsw i64 %offset.idx, 1
  %76 = getelementptr inbounds double, double* %B, i64 %75
  %77 = getelementptr double, double* %76, i64 -1
  %78 = bitcast double* %77 to <4 x double>*
  %wide.vec61 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !20
  %strided.vec63 = shufflevector <4 x double> %wide.vec61, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fadd <2 x double> %74, %strided.vec63
  %80 = fmul <2 x double> %79, <double 3.333300e-01, double 3.333300e-01>
  %81 = bitcast double* %76 to <4 x double>*
  %wide.vec64 = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !20
  %strided.vec66 = shufflevector <4 x double> %wide.vec64, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = fadd <4 x double> %wide.vec61, %wide.vec64
  %83 = shufflevector <4 x double> %82, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %84 = fadd <2 x double> %83, %strided.vec66
  %85 = fmul <2 x double> %84, <double 3.333300e-01, double 3.333300e-01>
  %86 = getelementptr inbounds double, double* %A, i64 %75
  %87 = getelementptr double, double* %86, i64 -1
  %88 = bitcast double* %87 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %80, <2 x double> %85, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %88, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %89 = icmp eq i64 %index.next, %n.vec
  br i1 %89, label %middle.block, label %vector.body, !llvm.loop !25

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc33.us, label %for.body16.us.preheader112

for.cond1.preheader:                              ; preds = %for.cond1.preheader, %for.cond1.preheader.preheader.new
  %t.025 = phi i32 [ %t.025.unr, %for.cond1.preheader.preheader.new ], [ %inc34.7, %for.cond1.preheader ]
  %inc34.7 = add nsw i32 %t.025, 8
  %exitcond43.7 = icmp eq i32 %inc34.7, %tsteps
  br i1 %exitcond43.7, label %for.end35.loopexit114.unr-lcssa, label %for.cond1.preheader

for.end35.loopexit:                               ; preds = %for.inc33.us
  br label %for.end35

for.end35.loopexit114.unr-lcssa:                  ; preds = %for.cond1.preheader
  br label %for.end35.loopexit114

for.end35.loopexit114:                            ; preds = %for.cond1.preheader.prol.loopexit, %for.end35.loopexit114.unr-lcssa
  br label %for.end35

for.end35:                                        ; preds = %for.end35.loopexit114, %for.end35.loopexit, %entry
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %for.body.preheader, %if.end
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %4) #5
  br label %if.end

if.end:                                           ; preds = %for.body, %if.then
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %A, i64 %indvars.iv
  %6 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %6) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

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
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
